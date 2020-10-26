Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06F298BD7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 12:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAF216F3;
	Mon, 26 Oct 2020 12:20:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAF216F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603711306;
	bh=qk8PmsDBuQCH8e0JRhhBr0jHNe14EM3J0vorow/ddL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSWrvRQGnTtSCU3KCU4LmuzvpqQ+zy4wW7Rzhub3oR+WxCCjaQy6psOehEYs5Wr/L
	 kTHESFIHTlg1EN8qkpfAnIvgAhQ/xEvxnJKIZs9a1FOqD6t5Z3bl2nuAB5wzaegm+h
	 b3Cn7zA8bbU9/W2vk+gq+WprLGL4u8G9vNc6NQTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA98FF804C2;
	Mon, 26 Oct 2020 12:19:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6F46F804BD; Mon, 26 Oct 2020 12:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0383F8025E
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 12:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0383F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XLs6d8Mf"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56E1822403;
 Mon, 26 Oct 2020 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603711151;
 bh=qk8PmsDBuQCH8e0JRhhBr0jHNe14EM3J0vorow/ddL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XLs6d8Mf5LX6XFU31dV/4/bDbXn33Z42d2Ah4RJkXbB6UcGjLa05Lmfc4RxJoSmSI
 /EHigOIQLe1vrOEB2DqTOxLB7MWB4bzAmVlIginBv8eyv2L1UKur3TdyoWkr+OUchn
 2wJRMI7RdeUXqv+mKJCTN59l23Em6gSy/QhgCHaE=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 04/11] vdpa/mlx5: Make hardware definitions visible
 to all mlx5 devices
Date: Mon, 26 Oct 2020 13:18:42 +0200
Message-Id: <20201026111849.1035786-5-leon@kernel.org>
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

Move mlx5_vdpa IFC header file to the general include folder, so
mlx5_core will be able to reuse it to check if VDPA is supported
prior to creating an auxiliary device.

As part of this move, update the header file name to mlx5 general
naming scheme.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vdpa/mlx5/net/main.c                                | 2 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c                           | 2 +-
 .../mlx5_vdpa_ifc.h => include/linux/mlx5/mlx5_ifc_vdpa.h   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/vdpa/mlx5/core/mlx5_vdpa_ifc.h => include/linux/mlx5/mlx5_ifc_vdpa.h (97%)

diff --git a/drivers/vdpa/mlx5/net/main.c b/drivers/vdpa/mlx5/net/main.c
index 838cd98386ff..4dd3f00f2306 100644
--- a/drivers/vdpa/mlx5/net/main.c
+++ b/drivers/vdpa/mlx5/net/main.c
@@ -4,7 +4,7 @@
 #include <linux/module.h>
 #include <linux/mlx5/driver.h>
 #include <linux/mlx5/device.h>
-#include "mlx5_vdpa_ifc.h"
+#include <linux/mlx5/mlx5_ifc_vdpa.h>
 #include "mlx5_vnet.h"

 MODULE_AUTHOR("Eli Cohen <eli@mellanox.com>");
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 1fa6fcac8299..6c218b47b9f1 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -9,8 +9,8 @@
 #include <linux/mlx5/vport.h>
 #include <linux/mlx5/fs.h>
 #include <linux/mlx5/device.h>
+#include <linux/mlx5/mlx5_ifc_vdpa.h>
 #include "mlx5_vnet.h"
-#include "mlx5_vdpa_ifc.h"
 #include "mlx5_vdpa.h"

 #define to_mvdev(__vdev) container_of((__vdev), struct mlx5_vdpa_dev, vdev)
diff --git a/drivers/vdpa/mlx5/core/mlx5_vdpa_ifc.h b/include/linux/mlx5/mlx5_ifc_vdpa.h
similarity index 97%
rename from drivers/vdpa/mlx5/core/mlx5_vdpa_ifc.h
rename to include/linux/mlx5/mlx5_ifc_vdpa.h
index f6f57a29b38e..97784098a992 100644
--- a/drivers/vdpa/mlx5/core/mlx5_vdpa_ifc.h
+++ b/include/linux/mlx5/mlx5_ifc_vdpa.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
 /* Copyright (c) 2020 Mellanox Technologies Ltd. */

-#ifndef __MLX5_VDPA_IFC_H_
-#define __MLX5_VDPA_IFC_H_
+#ifndef __MLX5_IFC_VDPA_H_
+#define __MLX5_IFC_VDPA_H_

 #include <linux/mlx5/mlx5_ifc.h>

@@ -165,4 +165,4 @@ struct mlx5_ifc_modify_virtio_net_q_out_bits {
 	struct mlx5_ifc_general_obj_out_cmd_hdr_bits general_obj_out_cmd_hdr;
 };

-#endif /* __MLX5_VDPA_IFC_H_ */
+#endif /* __MLX5_IFC_VDPA_H_ */
--
2.26.2

