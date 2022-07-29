Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2361585126
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460831660;
	Fri, 29 Jul 2022 15:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460831660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659102780;
	bh=Xi/suYWq5yRzsGd5eqkdgLrr3CqV7gd+MC6h1EUQO6c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0IuDDDUevbslX/ZhKR61zqiLscFpNC2LrrjLZdmcUDycrYnNBoqrEB3CSl1nlbMx
	 hgG2g3gDi49NSXHAgJgvYdRHDbF5797sppLWSehw1qjV68qSz6fH//sjFCe/v8EIzN
	 agXPHYpgF4hQiHOf2PsHHne7MP+QO4UiqrHgDws4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14EB4F8055A;
	Fri, 29 Jul 2022 15:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C37CF80558; Fri, 29 Jul 2022 15:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62D9FF804E5
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D9FF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="zW/P9Bcv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25365B827E0;
 Fri, 29 Jul 2022 13:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49381C433C1;
 Fri, 29 Jul 2022 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659102653;
 bh=Xi/suYWq5yRzsGd5eqkdgLrr3CqV7gd+MC6h1EUQO6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zW/P9BcvxuXQG/nj4vKXKn27AqgRPEXH+PyQL/1e9uxxEihUmwncXHzB4uGPKDpaN
 eihpB0EsgHA0As6n36gcGWBmB3tPeASifzER7qSjrwJ35U+C+WRAjU6BhVA7HZOihS
 ShBvUvhsJNwXQkmR0BHFKJIJj5Z/qslXTQUJRDrE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] soundwire: sysfs: have the driver core handle the
 creation of the device groups
Date: Fri, 29 Jul 2022 15:50:39 +0200
Message-Id: <20220729135041.2285908-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=Xi/suYWq5yRzsGd5eqkdgLrr3CqV7gd+MC6h1EUQO6c=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDEmPn274xhL0prnw/j+zp17aHMu6MsJadO7lfVg1/UKfdXrq
 tCD+jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIxVSG+aHnu3Wdv5unsKiH3V3TFN
 e/bsfiSQyzWTwPz8heoLCvMoKzro7163fPuKvuAA==
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
index 893296f3fe39..81c77e6ddbad 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -193,6 +193,7 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 
 	drv->driver.owner = owner;
 	drv->driver.probe = sdw_drv_probe;
+	drv->driver.dev_groups = sdw_attr_groups;
 
 	if (drv->remove)
 		drv->driver.remove = sdw_drv_remove;
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
index 3723333a5c2b..4c716c167493 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -204,7 +204,7 @@ static const struct attribute_group dp0_group = {
 	.name = "dp0",
 };
 
-static const struct attribute_group *slave_groups[] = {
+const struct attribute_group *sdw_attr_groups[] = {
 	&slave_attr_group,
 	&sdw_slave_dev_attr_group,
 	&dp0_group,
@@ -215,10 +215,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
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
2.37.1

