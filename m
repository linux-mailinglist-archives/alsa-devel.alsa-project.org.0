Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4C57C954
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7246B17E8;
	Thu, 21 Jul 2022 12:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7246B17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658400451;
	bh=sKcobVxn3ZnhW7YVaGY2guuoAq+9sB8ZxXGFyqVqIhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nD8+UKvcq636lnMWC6oR/3BdsVF6Xb4ZN4tbYGw+PLl61VjY5kFAuir7VusRSlU9x
	 FGa6V2rMK39lI+M6WrtIcTGe00+0RcizagZCthcTK+yI5lAjy1popGckX6B+cTRvLC
	 A8bnQfrzHyjhcDtV6/3Z8UhWKjEc3nxnx913pER8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABEA1F80538;
	Thu, 21 Jul 2022 12:45:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E74D7F80528; Thu, 21 Jul 2022 12:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85BB8F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85BB8F80166
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B83611A0BE4;
 Thu, 21 Jul 2022 12:45:42 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 811F21A362D;
 Thu, 21 Jul 2022 12:45:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0EE7C180222A;
 Thu, 21 Jul 2022 18:45:40 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH v2 -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Date: Thu, 21 Jul 2022 18:29:50 +0800
Message-Id: <1658399393-28777-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Fix sparse warning:
sound/soc/fsl/fsl_asrc.c:1177:60: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    got restricted snd_pcm_format_t *
sound/soc/fsl/fsl_asrc.c:1200:47: sparse: warning: restricted snd_pcm_format_t degrades to integer

Fixes: 4520af41fd21 ("ASoC: fsl_asrc: Support new property fsl,asrc-format")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 20a9f8e924b3..aa5edf32d988 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1066,6 +1066,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	u32 asrc_fmt = 0;
 	u32 map_idx;
 	char tmp[16];
 	u32 width;
@@ -1174,7 +1175,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+	asrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
 	if (ret) {
 		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 		if (ret) {
@@ -1197,7 +1199,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
+	if (!(FSL_ASRC_FORMATS & pcm_format_to_bits(asrc->asrc_format))) {
 		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
 		asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
-- 
2.34.1

