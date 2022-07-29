Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E4585124
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDBF3161E;
	Fri, 29 Jul 2022 15:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDBF3161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659102747;
	bh=PdD5DoxCq3xT3nYlDAEaxAsKCwoQDZbmle9bPVklpBM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G1dQ7mgULPZ+SeHso6SPEgHIL2M+GUSwq+tF3uJGHu86h74Gh8XycnYIYiW0LVK2B
	 MWrwC+zRXmtlxu6FuFstaKpBSvwF5F27epgxiOrucm7k1UmnGzWQCoQRSG71+eim4h
	 LtFSpaV23pmlTKJpRT1j7dQXdWW71vt42x2NOdg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D54DF8053C;
	Fri, 29 Jul 2022 15:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49686F804FB; Fri, 29 Jul 2022 15:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NO_DNS_FOR_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6487EF80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6487EF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="l9YUvb/a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0865FB827DF;
 Fri, 29 Jul 2022 13:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D7CC433C1;
 Fri, 29 Jul 2022 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659102648;
 bh=PdD5DoxCq3xT3nYlDAEaxAsKCwoQDZbmle9bPVklpBM=;
 h=From:To:Cc:Subject:Date:From;
 b=l9YUvb/aAavgCsJD0172mHm5qBzjtuZsfVrR6MwfV/IDB+HALe4kHhHHUmiiCfDre
 YrHTcPABa772LBEmED/G1ggBWngQ61Yaxi3JoaC4M7UUHHNT7DEJb5/R2jSgl+CHXY
 3tswxNHTFXsbu48LNVASnrSDN7ODfBWrEm8ie/K0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] soundwire: sysfs: move sdw_slave_dev_attr_group into the
 existing list of groups
Date: Fri, 29 Jul 2022 15:50:37 +0200
Message-Id: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=PdD5DoxCq3xT3nYlDAEaxAsKCwoQDZbmle9bPVklpBM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDEmPn66/43DHLLLju1AKw1VT9mgmvkyjAv7JDT1CiSWlQjf8
 nbZ2xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwERmszPMZDzXfl/ozZGog0nH/n2x4C
 jfESvAybBgQqTj9K7Oddlq/XwP9xW5mTQJ1PoAAA==
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

The sysfs logic already creates a list of groups for the device, so add
the sdw_slave_dev_attr_group group to that list instead of having to do
a two-step process of adding a group list and then an individual group.

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
 drivers/soundwire/sysfs_slave.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 3210359cd944..83e3f6cc3250 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -105,7 +105,10 @@ static struct attribute *slave_attrs[] = {
 	&dev_attr_modalias.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(slave);
+
+static const struct attribute_group slave_attr_group = {
+	.attrs = slave_attrs,
+};
 
 static struct attribute *slave_dev_attrs[] = {
 	&dev_attr_mipi_revision.attr,
@@ -190,6 +193,12 @@ static const struct attribute_group dp0_group = {
 	.name = "dp0",
 };
 
+static const struct attribute_group *slave_groups[] = {
+	&slave_attr_group,
+	&sdw_slave_dev_attr_group,
+	NULL,
+};
+
 int sdw_slave_sysfs_init(struct sdw_slave *slave)
 {
 	int ret;
@@ -198,10 +207,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
-	ret = devm_device_add_group(&slave->dev, &sdw_slave_dev_attr_group);
-	if (ret < 0)
-		return ret;
-
 	if (slave->prop.dp0_prop) {
 		ret = devm_device_add_group(&slave->dev, &dp0_group);
 		if (ret < 0)
-- 
2.37.1

