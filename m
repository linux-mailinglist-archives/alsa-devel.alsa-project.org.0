Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782145D5C6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 08:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC894183B;
	Thu, 25 Nov 2021 08:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC894183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637826687;
	bh=Y7XxShZyKG5phNxS1EqJ2qLvnP7Uqjnh+sla1d6Nx4Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=THMoCdA03FIe9TuHBdezZB7cE114swe10LJ5seb1IdQUWO2MJGGOLWeCS3ws6Wio6
	 vfCSMy+bkJW8PP1qRvCS94Lohj1jnUZ2ueRTftq2nBwSZo8DWUEm/wPS6ND7tI9DRr
	 lhRKlWXdkpniz2dnx7UdwPTr/AVdez3U4IDxTUpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52251F80087;
	Thu, 25 Nov 2021 08:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22DC4F80087; Thu, 25 Nov 2021 08:50:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 388F7F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 08:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388F7F80302
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb619f400fb2d-0a371;
 Thu, 25 Nov 2021 15:49:35 +0800 (CST)
X-RM-TRANSID: 2eeb619f400fb2d-0a371
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9619f400cee5-5f5ba;
 Thu, 25 Nov 2021 15:49:35 +0800 (CST)
X-RM-TRANSID: 2ee9619f400cee5-5f5ba
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 yang.jie@linux.intel.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify the code
Date: Thu, 25 Nov 2021 15:50:28 +0800
Message-Id: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

In the function sst_platform_get_resources(), if platform_get_irq()
failed, the return should not be zero, as the example in
platform.c is
  * int irq = platform_get_irq(pdev, 0)
  * if (irq < 0)
  * return irq;
So remove the redundant check to simplify the code.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/intel/atom/sst/sst_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 3be64430c..696d547c5 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -226,8 +226,8 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	/* Find the IRQ */
 	ctx->irq_num = platform_get_irq(pdev,
 				ctx->pdata->res_info->acpi_ipc_irq_index);
-	if (ctx->irq_num <= 0)
-		return ctx->irq_num < 0 ? ctx->irq_num : -EIO;
+	if (ctx->irq_num < 0)
+		return ctx->irq_num;
 
 	return 0;
 }
-- 
2.20.1.windows.1



