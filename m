Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE592A2182
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 21:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2CA16F9;
	Sun,  1 Nov 2020 21:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2CA16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604262107;
	bh=Q9+DNPy01/d6QOTNLTpXmnb96hr2wRSaRSliuVZgSfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YX75nueAwGgAGyYxkZ53jdDSkxLYLmzHseqKzhZhLiHpxYLzkDK429s6lv21QZHYF
	 /ETQhjjUGeZG84yG4BV0Bf675y5u57wtWu/OAnlclGhbzrB5sRehtXketU+kCs+DDX
	 w2vLyxgyB1iWzj0SxFErRzTVDLdr8lFbLlV31cV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A07F80524;
	Sun,  1 Nov 2020 21:16:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27EA6F80528; Sun,  1 Nov 2020 21:16:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14FC4F80524
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 21:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14FC4F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HuM41gDs"
Received: from localhost (host-213-179-129-39.customer.m-online.net
 [213.179.129.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1A5A22253;
 Sun,  1 Nov 2020 20:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604261783;
 bh=Q9+DNPy01/d6QOTNLTpXmnb96hr2wRSaRSliuVZgSfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HuM41gDsnUSP+oOKwGhvqCR8H8RP66Er0wiLHxdgacfs+Gpf9awx8liietvFpcOOk
 MxaypMf0W+Y5cv14JFrH03yAeA87saQiAmXDqQiSlPJoXafF6nFNnXrVlxihv3dXNz
 hGoki06zj7bh2hXPgvc/ArR1dcSypdVPpu3MfidA=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 gregkh <gregkh@linuxfoundation.org>
Subject: [PATCH mlx5-next v1 11/11] RDMA/mlx5: Remove IB representors dead code
Date: Sun,  1 Nov 2020 22:15:42 +0200
Message-Id: <20201101201542.2027568-12-leon@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101201542.2027568-1-leon@kernel.org>
References: <20201101201542.2027568-1-leon@kernel.org>
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

Delete dead code.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/ib_rep.c | 31 +++++++----------------------
 drivers/infiniband/hw/mlx5/ib_rep.h | 31 -----------------------------
 2 files changed, 7 insertions(+), 55 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/ib_rep.c b/drivers/infiniband/hw/mlx5/ib_rep.c
index 9810bdd7f3bc..a1a9450ed92c 100644
--- a/drivers/infiniband/hw/mlx5/ib_rep.c
+++ b/drivers/infiniband/hw/mlx5/ib_rep.c
@@ -13,7 +13,7 @@ mlx5_ib_set_vport_rep(struct mlx5_core_dev *dev, struct mlx5_eswitch_rep *rep)
 	struct mlx5_ib_dev *ibdev;
 	int vport_index;

-	ibdev = mlx5_ib_get_uplink_ibdev(dev->priv.eswitch);
+	ibdev = mlx5_eswitch_uplink_get_proto_dev(dev->priv.eswitch, REP_IB);
 	vport_index = rep->vport_index;

 	ibdev->port[vport_index].rep = rep;
@@ -74,6 +74,11 @@ mlx5_ib_vport_rep_load(struct mlx5_core_dev *dev, struct mlx5_eswitch_rep *rep)
 	return ret;
 }

+static void *mlx5_ib_rep_to_dev(struct mlx5_eswitch_rep *rep)
+{
+	return rep->rep_data[REP_IB].priv;
+}
+
 static void
 mlx5_ib_vport_rep_unload(struct mlx5_eswitch_rep *rep)
 {
@@ -91,40 +96,18 @@ mlx5_ib_vport_rep_unload(struct mlx5_eswitch_rep *rep)
 		__mlx5_ib_remove(dev, dev->profile, MLX5_IB_STAGE_MAX);
 }

-static void *mlx5_ib_vport_get_proto_dev(struct mlx5_eswitch_rep *rep)
-{
-	return mlx5_ib_rep_to_dev(rep);
-}
-
 static const struct mlx5_eswitch_rep_ops rep_ops = {
 	.load = mlx5_ib_vport_rep_load,
 	.unload = mlx5_ib_vport_rep_unload,
-	.get_proto_dev = mlx5_ib_vport_get_proto_dev,
+	.get_proto_dev = mlx5_ib_rep_to_dev,
 };

-struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
-					  u16 vport_num)
-{
-	return mlx5_eswitch_get_proto_dev(esw, vport_num, REP_IB);
-}
-
 struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
 					  u16 vport_num)
 {
 	return mlx5_eswitch_get_proto_dev(esw, vport_num, REP_ETH);
 }

-struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw)
-{
-	return mlx5_eswitch_uplink_get_proto_dev(esw, REP_IB);
-}
-
-struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
-					   u16 vport_num)
-{
-	return mlx5_eswitch_vport_rep(esw, vport_num);
-}
-
 struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
 						   struct mlx5_ib_sq *sq,
 						   u16 port)
diff --git a/drivers/infiniband/hw/mlx5/ib_rep.h b/drivers/infiniband/hw/mlx5/ib_rep.h
index 93f562735e89..ce1dcb105dbd 100644
--- a/drivers/infiniband/hw/mlx5/ib_rep.h
+++ b/drivers/infiniband/hw/mlx5/ib_rep.h
@@ -12,11 +12,6 @@
 extern const struct mlx5_ib_profile raw_eth_profile;

 #ifdef CONFIG_MLX5_ESWITCH
-struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
-					  u16 vport_num);
-struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw);
-struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
-					   u16 vport_num);
 int mlx5r_rep_init(void);
 void mlx5r_rep_cleanup(void);
 struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
@@ -25,26 +20,6 @@ struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
 struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
 					  u16 vport_num);
 #else /* CONFIG_MLX5_ESWITCH */
-static inline
-struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
-					  u16 vport_num)
-{
-	return NULL;
-}
-
-static inline
-struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw)
-{
-	return NULL;
-}
-
-static inline
-struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
-					   u16 vport_num)
-{
-	return NULL;
-}
-
 static inline int mlx5r_rep_init(void) { return 0; }
 static inline void mlx5r_rep_cleanup(void) {}
 static inline
@@ -62,10 +37,4 @@ struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
 	return NULL;
 }
 #endif
-
-static inline
-struct mlx5_ib_dev *mlx5_ib_rep_to_dev(struct mlx5_eswitch_rep *rep)
-{
-	return rep->rep_data[REP_IB].priv;
-}
 #endif /* __MLX5_IB_REP_H__ */
--
2.28.0

