Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45C4FD347
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0718F1713;
	Tue, 12 Apr 2022 11:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0718F1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649755541;
	bh=tCv+TZZEXlITvJtCJSNByaXqwkKfoOuZ9PAYE3feey4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dOopl3ghdQSJmed2MeFQZF9F4MtykYH/TM2HgRuomcorxnCMVKQMsTRr0VACRNCRb
	 7CPcK2Jy5jVVSWrR9G+Mj3h4biwvpH87xwCH7qY7N03eehVfM4//MFWupD3lxcwIuE
	 0/a5DHo1hXYUMllRG3ZB3ur2cUfj5ighKorqLKHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D355F80245;
	Tue, 12 Apr 2022 11:24:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A32FF8011C; Tue, 12 Apr 2022 11:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55945F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55945F8011C
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2FD681A227D;
 Tue, 12 Apr 2022 11:24:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE26E1A224E;
 Tue, 12 Apr 2022 11:24:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AF84E184BDC5;
 Tue, 12 Apr 2022 17:24:31 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: wm8524: remove rate constraint for FE-BE case
Date: Tue, 12 Apr 2022 17:13:46 +0800
Message-Id: <1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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

The constraint is propagate to Front End Bitstream
for Front End and Back End share same snd_soc_pcm_runtime.

The constraint is not needed for Back End Bitstream
when there is be_hw_params_fixup() defined.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Tested-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/wm8524.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 81f858f6bd67..442a59857875 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -61,6 +61,7 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
 	/* The set of sample rates that can be supported depends on the
 	 * MCLK supplied to the CODEC - enforce this.
@@ -71,9 +72,10 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE,
-				   &wm8524->rate_constraint);
+	if (!rtd->dai_link->be_hw_params_fixup)
+		snd_pcm_hw_constraint_list(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   &wm8524->rate_constraint);
 
 	gpiod_set_value_cansleep(wm8524->mute, 1);
 
-- 
2.17.1

