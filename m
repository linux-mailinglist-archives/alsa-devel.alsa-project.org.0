Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331997915
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC26166A;
	Wed, 21 Aug 2019 14:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC26166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389919;
	bh=Sv0WEf/RTOgVYuXQ8xpuhgzsPlQ+r5bUp2+yFbdrRSM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KU43c3M4/hj/Aj5HxLcMSpTTxJiLGgJ3b/hPdOkcJxrl4GguIn1CfplBZE8ayR7o0
	 vXBevzkD5w9xcRkkb8vflEbKQq+GU5IocHF0nhkLj4g9DKh1CJSiZa3CmbGz9KwrrS
	 ub4Jd/55DvZH/DBgnpLtzW4KYqC2Ekqn4K7Xo6rE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D41AF805FB;
	Wed, 21 Aug 2019 14:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 575B7F805F6; Wed, 21 Aug 2019 14:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B6BFF8036B
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6BFF8036B
Received: by mail-wr1-f97.google.com with SMTP id z11so1825028wrt.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=nP0rewb3IBXjR8ah44Y3B+/Ww8/H0gkDfZYTICHG0rc=;
 b=lBRDE0OLbwxz0psl+yP1clP/db54WCWFcPC3st11hVYloySHMIGVpreOdoYDGLluF6
 cZe2kbPjDGkTqkuzlKxEVqFb4bfF7ioLbs7+ZOt6Grste+DplrUDq+w5nnWJAjHwNjrt
 VSMPEJaNNpNIgv/UEUhlXMRX30aqWr33Br8tiVAwmDRTFMLAUDBHWjvrfY2GSSZSTfhq
 frVi7hkay6GXACyXpqBtIh/iAsBHhvbdWPArU9pSVzYugVGpiyRKxJ6Zde9Z2NUAfOM1
 dFPJg4irW84Y8NNq8VP6UF8jxTy0wZJ4bMKrNMUuhhpFq9f4F1/f/k+emsEjGejEHUPe
 nGUg==
X-Gm-Message-State: APjAAAVW2fgPGK4jHqxpRewKBbZWm7PP1iq54mvVz/JZR03Xcj9mk3da
 phbkSfblkixjS16x5RwaaiUhucy6wu9ZU7f0SMRDLHebOLCFie09JmgUCZHFH1yYiQ==
X-Google-Smtp-Source: APXvYqyQSDa3qh0AJjqQXicye2RW0x9sVjyglot1pi4YsrC8rjE3vs+Ee79jSQBkTwqgRv3Hei+tz7XSNock
X-Received: by 2002:a5d:408c:: with SMTP id o12mr38199196wrp.176.1566389733984; 
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id q3sm406651wrs.61.2019.08.21.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PWX-00077F-Lt; Wed, 21 Aug 2019 12:15:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E3E7D2742BAE; Wed, 21 Aug 2019 13:15:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190814082911.665-2-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190821121532.E3E7D2742BAE@ypsilon.sirena.org.uk>
Date: Wed, 21 Aug 2019 13:15:32 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, viorel.suman@nxp.com, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Add support for imx8qm" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: fsl_sai: Add support for imx8qm

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6eeb60be5ebb73b2e5911e26fb1aed02940b7d09 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 14 Aug 2019 11:29:10 +0300
Subject: [PATCH] ASoC: fsl_sai: Add support for imx8qm

SAI module on imx8qm features a register map similar with imx6 series
(it doesn't have VERID and PARAM registers at the beginning
of address spece).

Also, it has one FIFO which can help up to 64 * 32 bit samples.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190814082911.665-2-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4a346fcb5630..728307acab90 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1031,12 +1031,19 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.reg_offset = 8,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
+	.use_imx_pcm = true,
+	.fifo_depth = 64,
+	.reg_offset = 0,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
 	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
 	{ .compatible = "fsl,imx7ulp-sai", .data = &fsl_sai_imx7ulp_data },
 	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8mq_data },
+	{ .compatible = "fsl,imx8qm-sai", .data = &fsl_sai_imx8qm_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
