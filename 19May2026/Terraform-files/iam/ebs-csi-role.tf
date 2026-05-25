# IAM Role for EBS CSI Driver
resource "aws_iam_role" "ebs_csi_driver_role" {
  name = "pavan-ebs-csi-driver-role"

  assume_role_policy = var.eks_addon_trust_policy

  tags = merge(var.tags, { Name = "pavan-ebs-csi-driver-role" })
}

# IAM Policy for EBS CSI Driver AWS Managed
resource "aws_iam_role_policy_attachment" "ebs_csi_managed_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_driver_role.name
}
