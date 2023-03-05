import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOverDue,
  });
  final String status;
  final bool isOverDue;

  final Map<String, int> allStatus = <String, int>{
    'panding_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          title: 'Pedido Confirmado',
          isActive: true,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            title: 'Pix Estornado',
            isActive: true,
            background: Colors.orange,
          )
        ] else if (isOverDue) ...[
          const _StatusDot(
            title: 'Pagamento Pix Vencido',
            isActive: true,
            background: Colors.red,
          )
        ] else ...[
          _StatusDot(
            title: 'Pagamento',
            isActive: currentStatus >= 2,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Preparando',
            isActive: currentStatus >= 3,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Envio',
            isActive: currentStatus >= 4,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Entregue',
            isActive: currentStatus == 5,
          )
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    required this.isActive,
    super.key,
    required this.title,
    this.background,
  });

  final bool isActive;
  final String title;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive
                ? background ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ))
      ],
    );
  }
}
