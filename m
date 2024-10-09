Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87A9961F6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2024 10:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C724E86E;
	Wed,  9 Oct 2024 10:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C724E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728461460;
	bh=B0M9xs1LqzT8oCRHj3FSkWt6xZSJRwnB2NPO0CekjJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DOUJzR8WuCvtWXu6CPRtNimL//DKmnxHsO+2GXvrzt0O8MkpPUVBw/D3Q/25UKkS0
	 OFfL1iOF4TefljmUDM/3B7QEes+yehDQCrDdtMTwx9PhpfzsMUEKagESCev738SBto
	 qsOO7zsoo6a/4zfBhOS3QiSxdOgWxWCyrbT/fu2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90AC9F805D8; Wed,  9 Oct 2024 10:10:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B96F805D6;
	Wed,  9 Oct 2024 10:10:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE1D7F80528; Wed,  9 Oct 2024 10:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15D6CF80496
	for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2024 10:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D6CF80496
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BBAD1A27D8;
	Wed,  9 Oct 2024 10:10:07 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E7AC31A1D73;
	Wed,  9 Oct 2024 10:10:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 38FFD183F0C7;
	Wed,  9 Oct 2024 16:10:05 +0800 (+08)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chancel.liu@nxp.com
Subject: [PATCH 1/2] ASoC: imx-card: Set mclk for codec
Date: Wed,  9 Oct 2024 15:46:43 +0800
Message-Id: <1728460004-364-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 64LDBHJVIUEY3RAZZSHF6ALOZCEUMWAI
X-Message-ID-Hash: 64LDBHJVIUEY3RAZZSHF6ALOZCEUMWAI
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64LDBHJVIUEY3RAZZSHF6ALOZCEUMWAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chancel Liu <chancel.liu@nxp.com>

In some cases, ASoC machine driver may modify the mclk frequency
according to sample rate but the value in codec is still initial
frequency which should be replaced. For example, we should update
mclk before setup for cs42xx8 mclk relating registers.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index a7215bad6484..2f3dbbd15791 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -370,6 +370,11 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 		dev_err(dev, "failed to set cpui dai mclk1 rate (%lu): %d\n", mclk_freq, ret);
 		return ret;
 	}
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_freq, SND_SOC_CLOCK_IN);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set codec dai mclk rate (%lu): %d\n", mclk_freq, ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

