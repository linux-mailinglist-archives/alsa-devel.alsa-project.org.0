Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F74585122
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9FB162F;
	Fri, 29 Jul 2022 15:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9FB162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659102717;
	bh=EP6Yu3dCPvwyTA4MaOkILpl77d2Wl68YPVt+IAE/yX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6f7Hgh78FWdIgN2SSQhQcJIWa1sG5tOzIo8usAd+wTemg6FyQfK2EDOxmd7DPDfn
	 dGUaIiCT/DouSCqvY0xmDuLww/bsD6Et9Rg+P7FBIQKWHjNdXOLwQT1SUgUYi8enyp
	 vaCu70+/OOYOtNlufqOSP/lRKHlFRyNpdRFM90Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E96ACF80430;
	Fri, 29 Jul 2022 15:50:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E4DF804B1; Fri, 29 Jul 2022 15:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30615F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30615F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="JUwCS+jc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B52F61F5B;
 Fri, 29 Jul 2022 13:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E0EC433D6;
 Fri, 29 Jul 2022 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659102645;
 bh=EP6Yu3dCPvwyTA4MaOkILpl77d2Wl68YPVt+IAE/yX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JUwCS+jctbLKighaJvxZGtBxHAWr9YA6UQ0DzapxLFd762XQvhyosSWYc0bad7ic9
 tA7eynlL3DjsTcUPbCrFYRm8xPnzYUbnjesMIrOaGrGB0za0QDASpTG4Xj3xqEKWD/
 +jIFL0ZsvVy8YTeQFGpcreYBYX/iZEdIuHNg23UY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the dp0
 sysfs attributes
Date: Fri, 29 Jul 2022 15:50:38 +0200
Message-Id: <20220729135041.2285908-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=EP6Yu3dCPvwyTA4MaOkILpl77d2Wl68YPVt+IAE/yX8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDEmPn25Y2nKgevpxoUhnD0nvr7UR/lwfEld+eaWj5ve+8ed+
 lUtZHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRvK8MC3ZLmxnt0LvLlbL4pj2b0Y
 N/X05de8IwV0pbcEuZvsX8w3u0lPM2LLG5Jy29FAA=
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

There's no need to special-case the dp0 sysfs attributes, the
is_visible() callback in the attribute group can handle that for us, so
add that and add it to the attribute group list making the logic simpler
overall.

This is a step on the way to moving all of the sysfs attribute handling
into the default driver core attribute group logic so that the soundwire
core does not have to do any of it manually.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soundwire/sysfs_slave.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 83e3f6cc3250..3723333a5c2b 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(words);
 
+static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
+			      int n)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
+
+	if (slave->prop.dp0_prop)
+		return attr->mode;
+	return 0;
+}
+
 static struct attribute *dp0_attrs[] = {
 	&dev_attr_max_word.attr,
 	&dev_attr_min_word.attr,
@@ -190,12 +200,14 @@ static struct attribute *dp0_attrs[] = {
  */
 static const struct attribute_group dp0_group = {
 	.attrs = dp0_attrs,
+	.is_visible = dp0_is_visible,
 	.name = "dp0",
 };
 
 static const struct attribute_group *slave_groups[] = {
 	&slave_attr_group,
 	&sdw_slave_dev_attr_group,
+	&dp0_group,
 	NULL,
 };
 
@@ -207,12 +219,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
-	if (slave->prop.dp0_prop) {
-		ret = devm_device_add_group(&slave->dev, &dp0_group);
-		if (ret < 0)
-			return ret;
-	}
-
 	if (slave->prop.source_ports || slave->prop.sink_ports) {
 		ret = sdw_slave_sysfs_dpn_init(slave);
 		if (ret < 0)
-- 
2.37.1

