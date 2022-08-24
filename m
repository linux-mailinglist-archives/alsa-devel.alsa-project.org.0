Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434FA59FC92
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 16:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C79C2204;
	Wed, 24 Aug 2022 16:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C79C2204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661349745;
	bh=laXM6lyBiYvs+XzB8BFEK5j81iYzsKzZFFBxOwJyqwE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DY+0ukhx7M/XapgGBSF/isAefzG25BNkMsvxk0bSjmJY2qOJAdMp9bCtd7VjJ2Jko
	 ntTXTNH3HnoGJpHghxQ1ghSUsPG7luXcZrogfd8aGiH6t0J4NNAUSxn/ITPRAb2qpU
	 r9EQcJ979IRI6oHq6P7F/ceG+Skh+jANsUgQD8Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84769F8054A;
	Wed, 24 Aug 2022 16:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4476F80548; Wed, 24 Aug 2022 16:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E63FEF80536
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 16:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E63FEF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="YEgVk8kK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D028617D7;
 Wed, 24 Aug 2022 14:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359F9C433C1;
 Wed, 24 Aug 2022 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661349609;
 bh=laXM6lyBiYvs+XzB8BFEK5j81iYzsKzZFFBxOwJyqwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YEgVk8kKEceE2CWXuFKiYOQH/RZ2cjiIBL4YyzW7FyvQMhhjcf+Kgwzm41FXyWt8b
 yVqRWtDnaUn8YTjvo07Tn6Os7B3z2JrGnD7GNrKlhVRUWibUtaBrKteL9n637kC9am
 4WemvuuILboR6VieSnCAmmzhzwLQ0+8300gPwDak=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] soundwire: sysfs: remove sdw_slave_sysfs_init()
Date: Wed, 24 Aug 2022 15:59:50 +0200
Message-Id: <20220824135951.3604059-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3155;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=laXM6lyBiYvs+XzB8BFEK5j81iYzsKzZFFBxOwJyqwE=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMlsetfbZtb5vM9Oy9M9rv91x5OwOVM7eC9JOWf96Sys6Pln
 9HhdRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEwkNYJhDrc/788lyn1bpXaaLJDeW+
 cy+ZC+BsOCCVZfTs90+iy8/7dfhvL7Tcx7Nmd5AgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Now that sdw_slave_sysfs_init() only calls sdw_slave_sysfs_dpn_init(),
just do that instead and remove sdw_slave_sysfs_init() to get it out of
the way to save a bit of logic and code size.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebased on 6.0-rc1

 drivers/soundwire/bus_type.c        |  4 ++--
 drivers/soundwire/sysfs_local.h     |  1 -
 drivers/soundwire/sysfs_slave.c     | 13 -------------
 drivers/soundwire/sysfs_slave_dpn.c |  3 +++
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 397fe9179369..5e488dd64724 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -123,8 +123,8 @@ static int sdw_drv_probe(struct device *dev)
 	if (drv->ops && drv->ops->read_prop)
 		drv->ops->read_prop(slave);
 
-	/* init the sysfs as we have properties now */
-	ret = sdw_slave_sysfs_init(slave);
+	/* init the dynamic sysfs attributes we need */
+	ret = sdw_slave_sysfs_dpn_init(slave);
 	if (ret < 0)
 		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
 
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
index 3ab8658a7782..fa048e112629 100644
--- a/drivers/soundwire/sysfs_local.h
+++ b/drivers/soundwire/sysfs_local.h
@@ -15,7 +15,6 @@ extern const struct attribute_group *sdw_slave_status_attr_groups[];
 extern const struct attribute_group *sdw_attr_groups[];
 
 /* additional device-managed properties reported after driver probe */
-int sdw_slave_sysfs_init(struct sdw_slave *slave);
 int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
 
 #endif /* __SDW_SYSFS_LOCAL_H */
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 4c716c167493..070e0d84be94 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -211,19 +211,6 @@ const struct attribute_group *sdw_attr_groups[] = {
 	NULL,
 };
 
-int sdw_slave_sysfs_init(struct sdw_slave *slave)
-{
-	int ret;
-
-	if (slave->prop.source_ports || slave->prop.sink_ports) {
-		ret = sdw_slave_sysfs_dpn_init(slave);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 /*
  * the status is shown in capital letters for UNATTACHED and RESERVED
  * on purpose, to highligh users to the fact that these status values
diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
index c4b6543c09fd..a3fb380ee519 100644
--- a/drivers/soundwire/sysfs_slave_dpn.c
+++ b/drivers/soundwire/sysfs_slave_dpn.c
@@ -283,6 +283,9 @@ int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
 	int ret;
 	int i;
 
+	if (!slave->prop.source_ports && !slave->prop.sink_ports)
+		return 0;
+
 	mask = slave->prop.source_ports;
 	for_each_set_bit(i, &mask, 32) {
 		ret = add_all_attributes(&slave->dev, i, 1);
-- 
2.37.2

