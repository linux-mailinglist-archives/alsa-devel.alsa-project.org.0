Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5C298C0B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 12:23:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2511705;
	Mon, 26 Oct 2020 12:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2511705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603711437;
	bh=H7fj3CnHZJVuOeYIDS+vvCQxlcyj07/zq2z6uoxnwHw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uojOAHVmFgYSjoGva2tiaOgtoFcvGOXOSOmVpVjTshCmoVg74WKpeoRopHy7kjQFw
	 BicYN4f4A6nKlokyCXsDCXD6wSy5pfdnagSMmzdGsD1Z8NkGlphLJHRICJ8/AxUPhA
	 H4g91DERpDtFHddFNQEz43uwpiaZzsr15xHENGzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4751F804FF;
	Mon, 26 Oct 2020 12:19:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 959DDF804EC; Mon, 26 Oct 2020 12:19:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DBAF804E5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 12:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DBAF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A26X0JUy"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C88522450;
 Mon, 26 Oct 2020 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603711168;
 bh=H7fj3CnHZJVuOeYIDS+vvCQxlcyj07/zq2z6uoxnwHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A26X0JUyLfufTTGh+Pvkp5NarE/aG5ZcVfbJ6maB3cHLbzE8xbbIbIAoF8ExvNwoE
 LlFIIFltOYDxbFV9ZPfU37b2Nq52in+NcekmU/v1ql/J6lRNOhhqpQE+rUelwJcYHy
 vH0+4c365xMIdwg0vS/8O6Tm8AfCcrVUTpNKKXoo=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 09/11] net/mlx5: Delete custom device management
 logic
Date: Mon, 26 Oct 2020 13:18:47 +0200
Message-Id: <20201026111849.1035786-10-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026111849.1035786-1-leon@kernel.org>
References: <20201026111849.1035786-1-leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 Roi Dayan <roid@nvidia.com>, shiraz.saleem@intel.com,
 Jakub Kicinski <kuba@kernel.org>, dan.j.williams@intel.com,
 Leon Romanovsky <leonro@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Leon Romanovsky <leonro@nvidia.com>

After conversion to use auxiliary bus, all custom device management is
not needed anymore, delete it.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/dev.c | 299 +-----------------
 drivers/net/ethernet/mellanox/mlx5/core/lag.c |  18 --
 .../net/ethernet/mellanox/mlx5/core/main.c    |   4 -
 .../ethernet/mellanox/mlx5/core/mlx5_core.h   |  10 -
 include/linux/mlx5/driver.h                   |  22 --
 5 files changed, 17 insertions(+), 336 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/dev.c b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
index 466e4a35a0c5..81803bc75066 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/dev.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
@@ -35,24 +35,10 @@
 #include <linux/mlx5/mlx5_ifc_vdpa.h>
 #include "mlx5_core.h"

-static LIST_HEAD(intf_list);
-static LIST_HEAD(mlx5_dev_list);
 /* intf dev list mutex */
 static DEFINE_MUTEX(mlx5_intf_mutex);
 static DEFINE_IDA(mlx5_adev_ida);

-struct mlx5_device_context {
-	struct list_head	list;
-	struct mlx5_interface  *intf;
-	void		       *context;
-	unsigned long		state;
-};
-
-enum {
-	MLX5_INTERFACE_ADDED,
-	MLX5_INTERFACE_ATTACHED,
-};
-
 static bool is_eth_rep_supported(struct mlx5_core_dev *dev)
 {
 	if (!IS_ENABLED(CONFIG_MLX5_ESWITCH))
@@ -204,6 +190,17 @@ static bool is_ib_supported(struct mlx5_core_dev *dev)
 	return true;
 }

+enum {
+	MLX5_INTERFACE_PROTOCOL_ETH_REP,
+	MLX5_INTERFACE_PROTOCOL_ETH,
+
+	MLX5_INTERFACE_PROTOCOL_IB_REP,
+	MLX5_INTERFACE_PROTOCOL_MPIB,
+	MLX5_INTERFACE_PROTOCOL_IB,
+
+	MLX5_INTERFACE_PROTOCOL_VDPA,
+};
+
 static const struct mlx5_adev_device {
 	const char *suffix;
 	bool (*is_supported)(struct mlx5_core_dev *dev);
@@ -248,148 +245,6 @@ void mlx5_adev_cleanup(struct mlx5_core_dev *dev)
 	kfree(priv->adev);
 }

-void mlx5_add_device(struct mlx5_interface *intf, struct mlx5_priv *priv)
-{
-	struct mlx5_device_context *dev_ctx;
-	struct mlx5_core_dev *dev = container_of(priv, struct mlx5_core_dev, priv);
-
-	if (!mlx5_lag_intf_add(intf, priv))
-		return;
-
-	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
-	if (!dev_ctx)
-		return;
-
-	dev_ctx->intf = intf;
-
-	dev_ctx->context = intf->add(dev);
-	if (dev_ctx->context) {
-		set_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state);
-		if (intf->attach)
-			set_bit(MLX5_INTERFACE_ATTACHED, &dev_ctx->state);
-
-		spin_lock_irq(&priv->ctx_lock);
-		list_add_tail(&dev_ctx->list, &priv->ctx_list);
-		spin_unlock_irq(&priv->ctx_lock);
-	}
-
-	if (!dev_ctx->context)
-		kfree(dev_ctx);
-}
-
-static struct mlx5_device_context *mlx5_get_device(struct mlx5_interface *intf,
-						   struct mlx5_priv *priv)
-{
-	struct mlx5_device_context *dev_ctx;
-
-	list_for_each_entry(dev_ctx, &priv->ctx_list, list)
-		if (dev_ctx->intf == intf)
-			return dev_ctx;
-	return NULL;
-}
-
-void mlx5_remove_device(struct mlx5_interface *intf, struct mlx5_priv *priv)
-{
-	struct mlx5_device_context *dev_ctx;
-	struct mlx5_core_dev *dev = container_of(priv, struct mlx5_core_dev, priv);
-
-	dev_ctx = mlx5_get_device(intf, priv);
-	if (!dev_ctx)
-		return;
-
-	spin_lock_irq(&priv->ctx_lock);
-	list_del(&dev_ctx->list);
-	spin_unlock_irq(&priv->ctx_lock);
-
-	if (test_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state))
-		intf->remove(dev, dev_ctx->context);
-
-	kfree(dev_ctx);
-}
-
-static void mlx5_attach_interface(struct mlx5_interface *intf, struct mlx5_priv *priv)
-{
-	struct mlx5_device_context *dev_ctx;
-	struct mlx5_core_dev *dev = container_of(priv, struct mlx5_core_dev, priv);
-
-	dev_ctx = mlx5_get_device(intf, priv);
-	if (!dev_ctx)
-		return;
-
-	if (intf->attach) {
-		if (test_bit(MLX5_INTERFACE_ATTACHED, &dev_ctx->state))
-			return;
-		if (intf->attach(dev, dev_ctx->context))
-			return;
-		set_bit(MLX5_INTERFACE_ATTACHED, &dev_ctx->state);
-	} else {
-		if (test_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state))
-			return;
-		dev_ctx->context = intf->add(dev);
-		if (!dev_ctx->context)
-			return;
-		set_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state);
-	}
-}
-
-void mlx5_attach_device(struct mlx5_core_dev *dev)
-{
-	struct mlx5_priv *priv = &dev->priv;
-	struct mlx5_interface *intf;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_for_each_entry(intf, &intf_list, list)
-		mlx5_attach_interface(intf, priv);
-	mutex_unlock(&mlx5_intf_mutex);
-}
-
-static void mlx5_detach_interface(struct mlx5_interface *intf, struct mlx5_priv *priv)
-{
-	struct mlx5_device_context *dev_ctx;
-	struct mlx5_core_dev *dev = container_of(priv, struct mlx5_core_dev, priv);
-
-	dev_ctx = mlx5_get_device(intf, priv);
-	if (!dev_ctx)
-		return;
-
-	if (intf->detach) {
-		if (!test_bit(MLX5_INTERFACE_ATTACHED, &dev_ctx->state))
-			return;
-		intf->detach(dev, dev_ctx->context);
-		clear_bit(MLX5_INTERFACE_ATTACHED, &dev_ctx->state);
-	} else {
-		if (!test_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state))
-			return;
-		intf->remove(dev, dev_ctx->context);
-		clear_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state);
-	}
-}
-
-void mlx5_detach_device(struct mlx5_core_dev *dev)
-{
-	struct mlx5_priv *priv = &dev->priv;
-	struct mlx5_interface *intf;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_for_each_entry(intf, &intf_list, list)
-		mlx5_detach_interface(intf, priv);
-	mutex_unlock(&mlx5_intf_mutex);
-}
-
-bool mlx5_device_registered(struct mlx5_core_dev *dev)
-{
-	struct mlx5_priv *priv;
-	bool found = false;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_for_each_entry(priv, &mlx5_dev_list, dev_list)
-		if (priv == &dev->priv)
-			found = true;
-	mutex_unlock(&mlx5_intf_mutex);
-
-	return found;
-}
-
 static void adev_release(struct device *dev)
 {
 	struct mlx5_adev *mlx5_adev =
@@ -442,8 +297,6 @@ static void del_adev(struct auxiliary_device *adev)

 int mlx5_register_device(struct mlx5_core_dev *dev)
 {
-	struct mlx5_priv *priv = &dev->priv;
-	struct mlx5_interface *intf;
 	int ret;

 	mutex_lock(&mlx5_intf_mutex);
@@ -451,65 +304,19 @@ int mlx5_register_device(struct mlx5_core_dev *dev)
 	ret = _mlx5_rescan_drivers(dev);
 	mutex_unlock(&mlx5_intf_mutex);
 	if (ret)
-		goto add_err;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_add_tail(&priv->dev_list, &mlx5_dev_list);
-	list_for_each_entry(intf, &intf_list, list)
-		mlx5_add_device(intf, priv);
-	mutex_unlock(&mlx5_intf_mutex);
-
-	return 0;
+		mlx5_unregister_device(dev);

-add_err:
-	mlx5_unregister_device(dev);
 	return ret;
 }

 void mlx5_unregister_device(struct mlx5_core_dev *dev)
 {
-	struct mlx5_priv *priv = &dev->priv;
-	struct mlx5_interface *intf;
-
 	mutex_lock(&mlx5_intf_mutex);
-	list_for_each_entry_reverse(intf, &intf_list, list)
-		mlx5_remove_device(intf, priv);
-	list_del(&priv->dev_list);
-
 	dev->priv.flags |= MLX5_PRIV_FLAGS_DISABLE_ALL_ADEV;
 	_mlx5_rescan_drivers(dev);
 	mutex_unlock(&mlx5_intf_mutex);
 }

-int mlx5_register_interface(struct mlx5_interface *intf)
-{
-	struct mlx5_priv *priv;
-
-	if (!intf->add || !intf->remove)
-		return -EINVAL;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_add_tail(&intf->list, &intf_list);
-	list_for_each_entry(priv, &mlx5_dev_list, dev_list)
-		mlx5_add_device(intf, priv);
-	mutex_unlock(&mlx5_intf_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL(mlx5_register_interface);
-
-void mlx5_unregister_interface(struct mlx5_interface *intf)
-{
-	struct mlx5_priv *priv;
-
-	mutex_lock(&mlx5_intf_mutex);
-	list_for_each_entry(priv, &mlx5_dev_list, dev_list)
-		mlx5_remove_device(intf, priv);
-	list_del(&intf->list);
-	mutex_unlock(&mlx5_intf_mutex);
-}
-EXPORT_SYMBOL(mlx5_unregister_interface);
-
 /* This function is used after mlx5_core_dev is reconfigured.
  */
 int _mlx5_rescan_drivers(struct mlx5_core_dev *dev)
@@ -567,59 +374,6 @@ int _mlx5_rescan_drivers(struct mlx5_core_dev *dev)
 	return ret;
 }

-/* Must be called with intf_mutex held */
-static bool mlx5_has_added_dev_by_protocol(struct mlx5_core_dev *mdev, int protocol)
-{
-	struct mlx5_device_context *dev_ctx;
-	struct mlx5_interface *intf;
-	bool found = false;
-
-	list_for_each_entry(intf, &intf_list, list) {
-		if (intf->protocol == protocol) {
-			dev_ctx = mlx5_get_device(intf, &mdev->priv);
-			if (dev_ctx && test_bit(MLX5_INTERFACE_ADDED, &dev_ctx->state))
-				found = true;
-			break;
-		}
-	}
-
-	return found;
-}
-
-void mlx5_reload_interface(struct mlx5_core_dev *mdev, int protocol)
-{
-	mutex_lock(&mlx5_intf_mutex);
-	if (mlx5_has_added_dev_by_protocol(mdev, protocol)) {
-		mlx5_remove_dev_by_protocol(mdev, protocol);
-		mlx5_add_dev_by_protocol(mdev, protocol);
-	}
-	mutex_unlock(&mlx5_intf_mutex);
-}
-
-/* Must be called with intf_mutex held */
-void mlx5_add_dev_by_protocol(struct mlx5_core_dev *dev, int protocol)
-{
-	struct mlx5_interface *intf;
-
-	list_for_each_entry(intf, &intf_list, list)
-		if (intf->protocol == protocol) {
-			mlx5_add_device(intf, &dev->priv);
-			break;
-		}
-}
-
-/* Must be called with intf_mutex held */
-void mlx5_remove_dev_by_protocol(struct mlx5_core_dev *dev, int protocol)
-{
-	struct mlx5_interface *intf;
-
-	list_for_each_entry(intf, &intf_list, list)
-		if (intf->protocol == protocol) {
-			mlx5_remove_device(intf, &dev->priv);
-			break;
-		}
-}
-
 static u32 mlx5_gen_pci_id(const struct mlx5_core_dev *dev)
 {
 	return (u32)((pci_domain_nr(dev->pdev->bus) << 16) |
@@ -651,44 +405,25 @@ static int next_phys_dev(struct device *dev, const void *data)
  */
 struct mlx5_core_dev *mlx5_get_next_phys_dev(struct mlx5_core_dev *dev)
 {
-	struct mlx5_core_dev *res = NULL;
-	struct mlx5_core_dev *tmp_dev;
 	struct auxiliary_device *adev;
 	struct mlx5_adev *madev;
-	struct mlx5_priv *priv;
-	u32 pci_id;

 	if (!mlx5_core_is_pf(dev))
 		return NULL;

 	adev = auxiliary_find_device(NULL, dev, &next_phys_dev);
-	if (adev) {
-		madev = container_of(adev, struct mlx5_adev, adev);
-
-		put_device(&adev->dev);
-		return madev->mdev;
-	}
-
-	pci_id = mlx5_gen_pci_id(dev);
-	list_for_each_entry(priv, &mlx5_dev_list, dev_list) {
-		tmp_dev = container_of(priv, struct mlx5_core_dev, priv);
-		if (!mlx5_core_is_pf(tmp_dev))
-			continue;
-
-		if ((dev != tmp_dev) && (mlx5_gen_pci_id(tmp_dev) == pci_id)) {
-			res = tmp_dev;
-			break;
-		}
-	}
+	if (!adev)
+		return NULL;

-	return res;
+	madev = container_of(adev, struct mlx5_adev, adev);
+	put_device(&adev->dev);
+	return madev->mdev;
 }

 void mlx5_dev_list_lock(void)
 {
 	mutex_lock(&mlx5_intf_mutex);
 }
-
 void mlx5_dev_list_unlock(void)
 {
 	mutex_unlock(&mlx5_intf_mutex);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lag.c b/drivers/net/ethernet/mellanox/mlx5/core/lag.c
index 7bc7f5e3dcbc..7edfd724e77f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lag.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lag.c
@@ -749,24 +749,6 @@ u8 mlx5_lag_get_slave_port(struct mlx5_core_dev *dev,
 }
 EXPORT_SYMBOL(mlx5_lag_get_slave_port);

-bool mlx5_lag_intf_add(struct mlx5_interface *intf, struct mlx5_priv *priv)
-{
-	struct mlx5_core_dev *dev = container_of(priv, struct mlx5_core_dev,
-						 priv);
-	struct mlx5_lag *ldev;
-
-	if (intf->protocol != MLX5_INTERFACE_PROTOCOL_IB)
-		return true;
-
-	ldev = mlx5_lag_dev_get(dev);
-	if (!ldev || !__mlx5_lag_is_roce(ldev) ||
-	    ldev->pf[MLX5_LAG_P1].dev == dev)
-		return true;
-
-	/* If bonded, we do not add an IB device for PF1. */
-	return false;
-}
-
 int mlx5_lag_query_cong_counters(struct mlx5_core_dev *dev,
 				 u64 *values,
 				 int num_counters,
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index a6034acb2ac3..3effabb6a3b1 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -1225,8 +1225,6 @@ int mlx5_load_one(struct mlx5_core_dev *dev, bool boot)
 		err = mlx5_register_device(dev);
 		if (err)
 			goto err_register;
-	} else {
-		mlx5_attach_device(dev);
 	}

 	mutex_unlock(&dev->intf_state_mutex);
@@ -1256,8 +1254,6 @@ void mlx5_unload_one(struct mlx5_core_dev *dev, bool cleanup)
 	if (cleanup) {
 		mlx5_unregister_device(dev);
 		mlx5_devlink_unregister(priv_to_devlink(dev));
-	} else {
-		mlx5_detach_device(dev);
 	}

 	if (!test_bit(MLX5_INTERFACE_STATE_UP, &dev->intf_state)) {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
index 4639fbfbd8ff..c6e358d177a7 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
@@ -178,22 +178,13 @@ void mlx5_events_cleanup(struct mlx5_core_dev *dev);
 void mlx5_events_start(struct mlx5_core_dev *dev);
 void mlx5_events_stop(struct mlx5_core_dev *dev);

-void mlx5_add_device(struct mlx5_interface *intf, struct mlx5_priv *priv);
-void mlx5_remove_device(struct mlx5_interface *intf, struct mlx5_priv *priv);
-void mlx5_attach_device(struct mlx5_core_dev *dev);
-void mlx5_detach_device(struct mlx5_core_dev *dev);
-bool mlx5_device_registered(struct mlx5_core_dev *dev);
 int mlx5_register_device(struct mlx5_core_dev *dev);
 void mlx5_unregister_device(struct mlx5_core_dev *dev);
-void mlx5_add_dev_by_protocol(struct mlx5_core_dev *dev, int protocol);
-void mlx5_remove_dev_by_protocol(struct mlx5_core_dev *dev, int protocol);
 struct mlx5_core_dev *mlx5_get_next_phys_dev(struct mlx5_core_dev *dev);
 void mlx5_dev_list_lock(void);
 void mlx5_dev_list_unlock(void);
 int mlx5_dev_list_trylock(void);

-bool mlx5_lag_intf_add(struct mlx5_interface *intf, struct mlx5_priv *priv);
-
 int mlx5_query_mtpps(struct mlx5_core_dev *dev, u32 *mtpps, u32 mtpps_size);
 int mlx5_set_mtpps(struct mlx5_core_dev *mdev, u32 *mtpps, u32 mtpps_size);
 int mlx5_query_mtppse(struct mlx5_core_dev *mdev, u8 pin, u8 *arm, u8 *mode);
@@ -243,7 +234,6 @@ static inline int mlx5_rescan_drivers(struct mlx5_core_dev *dev)
 	return ret;
 }

-void mlx5_reload_interface(struct mlx5_core_dev *mdev, int protocol);
 void mlx5_lag_update(struct mlx5_core_dev *dev);

 enum {
diff --git a/include/linux/mlx5/driver.h b/include/linux/mlx5/driver.h
index b113023d242e..8808ba1bfbd1 100644
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@ -1079,28 +1079,6 @@ enum {
 	MAX_MR_CACHE_ENTRIES
 };

-enum {
-	MLX5_INTERFACE_PROTOCOL_ETH_REP,
-	MLX5_INTERFACE_PROTOCOL_ETH,
-
-	MLX5_INTERFACE_PROTOCOL_IB_REP,
-	MLX5_INTERFACE_PROTOCOL_MPIB,
-	MLX5_INTERFACE_PROTOCOL_IB,
-
-	MLX5_INTERFACE_PROTOCOL_VDPA,
-};
-
-struct mlx5_interface {
-	void *			(*add)(struct mlx5_core_dev *dev);
-	void			(*remove)(struct mlx5_core_dev *dev, void *context);
-	int			(*attach)(struct mlx5_core_dev *dev, void *context);
-	void			(*detach)(struct mlx5_core_dev *dev, void *context);
-	int			protocol;
-	struct list_head	list;
-};
-
-int mlx5_register_interface(struct mlx5_interface *intf);
-void mlx5_unregister_interface(struct mlx5_interface *intf);
 int mlx5_notifier_register(struct mlx5_core_dev *dev, struct notifier_block *nb);
 int mlx5_notifier_unregister(struct mlx5_core_dev *dev, struct notifier_block *nb);
 int mlx5_eq_notifier_register(struct mlx5_core_dev *dev, struct mlx5_nb *nb);
--
2.26.2

