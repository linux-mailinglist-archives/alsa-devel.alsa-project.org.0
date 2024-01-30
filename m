Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89D842C18
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 19:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CFF14E0;
	Tue, 30 Jan 2024 19:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CFF14E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706640509;
	bh=zjX6COLrzX2UnAbnR13vMj+lXPKV02pQPeYFqk/O8jM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEAIDO+XpqPEK8iXTcNm7BEFEBiAp1QZghaJ/lbfQI+BDupvd+ycwpzwG0Vos9G1U
	 9LusmqSXjcp2kdCx0FXi48GtIVdK/MJRz0cpb6fDf39ItbD+SUSe6z2ZRVka15FIAp
	 2P2Nh/NUBgcmp/dgESQdSKySlv39FTx8EvWxsJV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E55F80632; Tue, 30 Jan 2024 19:47:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A14C0F80623;
	Tue, 30 Jan 2024 19:47:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5133F80567; Tue, 30 Jan 2024 19:46:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E035F80567
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 19:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E035F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=PlUdiYBw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D84CCE1C42;
	Tue, 30 Jan 2024 18:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662CCC433B1;
	Tue, 30 Jan 2024 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706640403;
	bh=zjX6COLrzX2UnAbnR13vMj+lXPKV02pQPeYFqk/O8jM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PlUdiYBw+1A31R3cg/zeFou3VlBY2FXsJc2k9fFlothmw0HEIqEvAYL16dRxQycAL
	 2Ad8G0ET9DNs45zDq2jLaVCauoMZ0P5LO07A5Kw/xmq+o8mVI+oYQcrVIjtAWENE7O
	 3RzcN/XIYRO3TVH3L3BrR0T0eLespWFNanVPrR7E=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH 4/6] soundwire: sysfs: have the driver core handle the
 creation of the device groups
Date: Tue, 30 Jan 2024 10:46:30 -0800
Message-ID: <2024013030-worsening-rocket-a3cb@gregkh>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024013025-spoiling-exact-ad20@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
MIME-Version: 1.0
Lines: 70
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=zjX6COLrzX2UnAbnR13vMj+lXPKV02pQPeYFqk/O8jM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKk7XdgyEnavUmgT0xffUnLtkcSzDOGKlGfCq1+f8uq5f
 FTmnvurjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIvD0M81POZVT+i332yPDM
 3vv9fG8fbt8zI5lhntY6xaNLhE60zDFxWbjeedGtJx+nBwEA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4HTP7FTZZZM54KDXKITABQCMBCFVD3TT
X-Message-ID-Hash: 4HTP7FTZZZM54KDXKITABQCMBCFVD3TT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HTP7FTZZZM54KDXKITABQCMBCFVD3TT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver core supports the ability to handle the creation and removal
of device-specific sysfs files in a race-free manner.  Take advantage of
that by converting this driver to use this by moving the sysfs
attributes into a group and assigning the dev_groups pointer to it.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soundwire/bus_type.c    | 1 +
 drivers/soundwire/sysfs_local.h | 3 +++
 drivers/soundwire/sysfs_slave.c | 6 +-----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 9fa93bb923d7..5abe5593395a 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -221,6 +221,7 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 	drv->driver.probe = sdw_drv_probe;
 	drv->driver.remove = sdw_drv_remove;
 	drv->driver.shutdown = sdw_drv_shutdown;
+	drv->driver.dev_groups = sdw_attr_groups;
 
 	return driver_register(&drv->driver);
 }
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
index 7268bc24c538..3ab8658a7782 100644
--- a/drivers/soundwire/sysfs_local.h
+++ b/drivers/soundwire/sysfs_local.h
@@ -11,6 +11,9 @@
 /* basic attributes to report status of Slave (attachment, dev_num) */
 extern const struct attribute_group *sdw_slave_status_attr_groups[];
 
+/* attributes for all soundwire devices */
+extern const struct attribute_group *sdw_attr_groups[];
+
 /* additional device-managed properties reported after driver probe */
 int sdw_slave_sysfs_init(struct sdw_slave *slave);
 int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 8876c7807048..3afc0dc06c98 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -214,7 +214,7 @@ static const struct attribute_group dp0_group = {
 	.name = "dp0",
 };
 
-static const struct attribute_group *slave_groups[] = {
+const struct attribute_group *sdw_attr_groups[] = {
 	&slave_attr_group,
 	&sdw_slave_dev_attr_group,
 	&dp0_group,
@@ -225,10 +225,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 {
 	int ret;
 
-	ret = devm_device_add_groups(&slave->dev, slave_groups);
-	if (ret < 0)
-		return ret;
-
 	if (slave->prop.source_ports || slave->prop.sink_ports) {
 		ret = sdw_slave_sysfs_dpn_init(slave);
 		if (ret < 0)
-- 
2.43.0

