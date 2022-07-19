Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F9579699
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 11:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2208C16DC;
	Tue, 19 Jul 2022 11:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2208C16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658223982;
	bh=36ICGYrtvF7Ty8e8VB08wM/riCa3xLtIQApietZ3vS0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgOgwiFShuzcDGhjs6CP4qT4EbbGCnNBJmZb7nRC1yU6gByoiWjZVr8eO/fULmGc4
	 ijz7VacGWVVfQC9n415qLjpIkxPHgHRuAQVW7kcFXwJvIhIVL5SozPdkMLd+c6VZLr
	 VnusB2i3uJ2W2FP3J0avcT121Md2KC+C8BzuH/8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9128CF8055A;
	Tue, 19 Jul 2022 11:44:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 961ECF80559; Tue, 19 Jul 2022 11:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A6F5F8016D
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 11:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6F5F8016D
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A247E200C11;
 Tue, 19 Jul 2022 11:44:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BAA1200C05;
 Tue, 19 Jul 2022 11:44:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AFE23181D0CA;
 Tue, 19 Jul 2022 17:44:19 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Date: Tue, 19 Jul 2022 17:27:41 +0800
Message-Id: <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
 sound/soc/fsl/fsl_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 20a9f8e924b3..544395efd605 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1174,7 +1174,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", (u32 *)&asrc->asrc_format);
 	if (ret) {
 		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 		if (ret) {
@@ -1197,7 +1197,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
+	if (!(FSL_ASRC_FORMATS & (1ULL << (__force u32)asrc->asrc_format))) {
 		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
 		asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
-- 
2.34.1

