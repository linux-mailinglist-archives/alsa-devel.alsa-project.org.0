Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D098842C1D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 19:49:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0895A14F2;
	Tue, 30 Jan 2024 19:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0895A14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706640552;
	bh=EAByQhXyu/+Nq0/YEitbsn1bxLp9uFAhGiUot7pVcwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nMxwcynm5nxsMf6LSK2uu/I6+u1g/7Qq8YoSxjvG6okHOSzwyCn33GC1NDTo3u9wE
	 L1B7MUg9mPCsPVFpSrJBx+a4wXuSaO600Gdn2+HePxW12nvuNRbkfb4SlHk4ZY3mIi
	 A+6a3hYpofzN3FgySMGQ0blnGViJPG/BfKTWsEvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11142F8069D; Tue, 30 Jan 2024 19:47:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C591F805A9;
	Tue, 30 Jan 2024 19:47:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E2D8F805F9; Tue, 30 Jan 2024 19:47:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63944F80568
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 19:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63944F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=cvR/3SDG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1FA260FC3;
	Tue, 30 Jan 2024 18:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08DDC433B1;
	Tue, 30 Jan 2024 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706640405;
	bh=EAByQhXyu/+Nq0/YEitbsn1bxLp9uFAhGiUot7pVcwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvR/3SDGO4jTwkZ5iAip4p0J9YwtCR4gfiJOQ9HwN9++C/impGwuYy17Bk7FeEZon
	 WKSLPpavHEe8u1jGIknmoYjShSFbVOiObMq9ssSXYRazX9QZlvNco91PnEPTt0sXeR
	 tk/EuoyJMviDztCrMyCIMX4qrzbPrsCQE//z1wwI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH 6/6] soundwire: sysfs: remove unneeded ATTRIBUTE_GROUPS()
 comments
Date: Tue, 30 Jan 2024 10:46:32 -0800
Message-ID: <2024013031-tranquil-matador-a554@gregkh>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024013025-spoiling-exact-ad20@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
MIME-Version: 1.0
Lines: 43
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=EAByQhXyu/+Nq0/YEitbsn1bxLp9uFAhGiUot7pVcwI=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKk7Xdg/LmraJeW/8MSxm48mi0WrKM6cWl/kw3Jtq4FSw
 rbUW9P4OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi5ecZ5sd8rV52tMg7taio
 0EfyyJ6VXXvD+hgWTBezWyW2vSXnLv/X/6saZFKXHT9sDwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWNRGI7DXW3PYY643HZIXJHFR26JUPSJ
X-Message-ID-Hash: BWNRGI7DXW3PYY643HZIXJHFR26JUPSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWNRGI7DXW3PYY643HZIXJHFR26JUPSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that we manually created our own attribute group list, the outdated
ATTRIBUTE_GROUPS() comments can be removed as they are not needed at
all.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soundwire/sysfs_slave.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 0eefc205f697..f4259710dd0f 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -129,10 +129,6 @@ static struct attribute *slave_dev_attrs[] = {
 	NULL,
 };
 
-/*
- * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
- * for device-level properties
- */
 static const struct attribute_group sdw_slave_dev_attr_group = {
 	.attrs	= slave_dev_attrs,
 	.name = "dev-properties",
@@ -204,10 +200,6 @@ static bool dp0_group_visible(struct kobject *kobj)
 }
 DEFINE_SYSFS_GROUP_VISIBLE(dp0);
 
-/*
- * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
- * for dp0-level properties
- */
 static const struct attribute_group dp0_group = {
 	.attrs = dp0_attrs,
 	.is_visible = SYSFS_GROUP_VISIBLE(dp0),
-- 
2.43.0

