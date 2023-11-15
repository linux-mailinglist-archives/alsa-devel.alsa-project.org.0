Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AD7EC354
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 14:10:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 738F0827;
	Wed, 15 Nov 2023 14:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 738F0827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700053837;
	bh=q69noF+4OOqrwFOS3+eqaFGlskwc0zXa8OPh6dnisWM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Es0fX6LJSIva88lIG/mbMW//yX8GJ5TUgrBwslwGaaitowBx3QsmZSyoywC4Wnr25
	 wa9u0vPjnECc7/9YWeWoI59d0CiY0vvVVDybl6EZ/XHj3TG137tTWQdCdHVz1F6Di0
	 d2+IuPa/kuPScdOSr6Q3WDXlyKx5BgMmkidlZi9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1FCAF80551; Wed, 15 Nov 2023 14:09:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB7CF8016E;
	Wed, 15 Nov 2023 14:09:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C14E6F801D5; Wed, 15 Nov 2023 10:54:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by alsa1.perex.cz (Postfix) with SMTP id BC9EEF80166
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 10:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC9EEF80166
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 35B63602806DA;
	Wed, 15 Nov 2023 17:54:40 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soundwire: amd: add an error code check in
 amd_sdw_clock_stop_exit
Date: Wed, 15 Nov 2023 17:54:08 +0800
Message-Id: <20231115095407.1059704-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: suhui@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2R2LLAJZ6VYXKUXEXC4KOTE6SUI5JRAW
X-Message-ID-Hash: 2R2LLAJZ6VYXKUXEXC4KOTE6SUI5JRAW
X-Mailman-Approved-At: Wed, 15 Nov 2023 13:09:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2R2LLAJZ6VYXKUXEXC4KOTE6SUI5JRAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang static analyzer complains that value stored to 'ret' is never read.
Add an error code check and print an error message if 'readl_poll_timeout'
failed.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/soundwire/amd_manager.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3a99f6dcdfaf..f391b541f4b7 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
 					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
 					 AMD_SDW_TIMEOUT);
+		if (ret)
+			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
+				ERR_PTR(ret));
+
 		if (val & AMD_SDW_CLK_RESUME_DONE) {
 			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
-- 
2.30.2

