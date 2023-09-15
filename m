Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9A7A164B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 08:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323A484B;
	Fri, 15 Sep 2023 08:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323A484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694760106;
	bh=RQVMXvEughjlvtNhY+zYh7g42/ymB7HlJZr3lZRW+Do=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E0sz6eBp7f6yotM4K1SajaXoJB6EK5MwavEkxCIqTrNxUyNmApHu74RjbfDWtV+51
	 m0Lcdzrd7gxnd4gmE0WPJ1K6U3qWNPkWhN7k8vGTl7yfDZNNZFOEv7SmSKJNdDZfor
	 QgpgyETiqD8vgyW7Bf+AAtpdpVFKEllnxRX4MTLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8FDF80425; Fri, 15 Sep 2023 08:40:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 398A9F80246;
	Fri, 15 Sep 2023 08:40:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 052BCF80425; Fri, 15 Sep 2023 08:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 286FEF801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 08:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286FEF801F5
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71D0D200AA6;
	Fri, 15 Sep 2023 08:38:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 38EF0200AAA;
	Fri, 15 Sep 2023 08:38:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A2C6B180222B;
	Fri, 15 Sep 2023 14:38:42 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-audmix: Fix return error with devm_clk_get()
Date: Fri, 15 Sep 2023 14:02:11 +0800
Message-Id: <1694757731-18308-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: X75YH7T7WYC64Y244O4LKOZ6LXFW4UAS
X-Message-ID-Hash: X75YH7T7WYC64Y244O4LKOZ6LXFW4UAS
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X75YH7T7WYC64Y244O4LKOZ6LXFW4UAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The devm_clk_get() can return -EPROBE_DEFER error,
modify the error code to be -EINVAL is not correct, which
cause the -EPROBE_DEFER error is not correctly handled.

This patch is to fix the return error code.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-audmix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 0b58df56f4da..aeb81aa61184 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -315,7 +315,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->cpu_mclk)) {
 		ret = PTR_ERR(priv->cpu_mclk);
 		dev_err(&cpu_pdev->dev, "failed to get DAI mclk1: %d\n", ret);
-		return -EINVAL;
+		return ret;
 	}
 
 	priv->audmix_pdev = audmix_pdev;
-- 
2.34.1

