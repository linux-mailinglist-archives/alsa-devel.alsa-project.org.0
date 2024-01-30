Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD4842C19
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 19:48:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A95ADEE;
	Tue, 30 Jan 2024 19:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A95ADEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706640519;
	bh=+h2BNyNBH2PQ5+Cwjewz2w+MpDwd4+tscGSgxiN4bBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tUzz9FUx6vghsXz9UNWH+EEw2MHzXDa32pJXU/7OfyyfyUA8AfmKfnNc+tiexEED+
	 1/dJ7znBpnA7y5tt5pcy2r3b0iL8hKd7yfbMrubJYCCQDuiEi9zFj/61Wi0F0qcZdS
	 Y9DyHDz9eC8tiEFCDvjaiqQEPhmihKgkTrVNWCaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB67F80630; Tue, 30 Jan 2024 19:47:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDB8F80652;
	Tue, 30 Jan 2024 19:47:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D3C4F805E2; Tue, 30 Jan 2024 19:47:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B77BF80563
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 19:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B77BF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=gxE/1m3L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6D980CE1C3A;
	Tue, 30 Jan 2024 18:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99253C43390;
	Tue, 30 Jan 2024 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706640402;
	bh=+h2BNyNBH2PQ5+Cwjewz2w+MpDwd4+tscGSgxiN4bBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxE/1m3LBF4/0Uug8Ja3628zL9XNu1jPKRDjIb+WoJn9bSz80+kQE1VSaK8IGV36w
	 kY6fxwphK6yqq4kk4NJSjj89nLgrv9NOzmBSNj/AeKTgQYNP73fFIr+OMI9g4eIS2q
	 bOWkXgSN95hGjetUpnZIgmPF5aJFt6dD6DXjrFjU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH 3/6] soundwire: sysfs: cleanup the logic for creating the dp0
 sysfs attributes
Date: Tue, 30 Jan 2024 10:46:29 -0800
Message-ID: <2024013029-budget-mulled-5b34@gregkh>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024013025-spoiling-exact-ad20@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
MIME-Version: 1.0
Lines: 80
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=+h2BNyNBH2PQ5+Cwjewz2w+MpDwd4+tscGSgxiN4bBw=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKk7XVhfd9kz3i+ziuUsbZn91kua31/nxW6Lq/e7v0ZWH
 3Hb2FLYEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABOpz2WYn5egX7lZUK/wMuuz
 qjcsv3dWRTbuY5jvNWNKbtb0F41zllTeZXxww81vwYR8AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V5O4YFIVJGX5ZUZB74KGKHLMHPDYCXWX
X-Message-ID-Hash: V5O4YFIVJGX5ZUZB74KGKHLMHPDYCXWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5O4YFIVJGX5ZUZB74KGKHLMHPDYCXWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
 drivers/soundwire/sysfs_slave.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 83e3f6cc3250..8876c7807048 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -184,18 +184,40 @@ static struct attribute *dp0_attrs[] = {
 	NULL,
 };
 
+static umode_t dp0_attr_visible(struct kobject *kobj, struct attribute *attr,
+			      int n)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
+
+	if (slave->prop.dp0_prop)
+		return attr->mode;
+	return 0;
+}
+
+static bool dp0_group_visible(struct kobject *kobj)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
+
+	if (slave->prop.dp0_prop)
+		return true;
+	return false;
+}
+DEFINE_SYSFS_GROUP_VISIBLE(dp0);
+
 /*
  * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
  * for dp0-level properties
  */
 static const struct attribute_group dp0_group = {
 	.attrs = dp0_attrs,
+	.is_visible = SYSFS_GROUP_VISIBLE(dp0),
 	.name = "dp0",
 };
 
 static const struct attribute_group *slave_groups[] = {
 	&slave_attr_group,
 	&sdw_slave_dev_attr_group,
+	&dp0_group,
 	NULL,
 };
 
@@ -207,12 +229,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
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
2.43.0

