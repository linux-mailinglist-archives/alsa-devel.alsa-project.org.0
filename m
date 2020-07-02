Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FF212637
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5046E16E8;
	Thu,  2 Jul 2020 16:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5046E16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593699965;
	bh=Y5N6O6LsWUo+NYj23BCEx/QuHN31mF8QF8U0nDHHLZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4zcm28sXb2vYphs0ewUEuMabW2AmqOtb6OSIEve7SJcJ8l0KEsuYDklmSe8ptNj0
	 9VjudMOSGRYeU4MIttrRzfaWJr1cu8xbzQqNwnl5BmmdLL+qadNEXCswqddz58cSzW
	 4uJOlOukiV3zNhnkhXvxutJuy2/vB43oXPEx+zaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45608F802DD;
	Thu,  2 Jul 2020 16:23:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8569F8027B; Thu,  2 Jul 2020 16:23:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB51F80247
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB51F80247
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3489A2A5C36;
 Thu,  2 Jul 2020 15:23:07 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 2/4] ASoC: fsl_asrc: allow using arbitrary input and output
 clocks
Date: Thu,  2 Jul 2020 16:22:33 +0200
Message-Id: <20200702142235.235869-3-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

fsl_asrc currently uses hardcoded input and output clocks, preventing
its use for anything other than S/PDIF output.

This patch adds the ability to select any clock as input or output (by
using new DT properties), making it possible to use this peripheral in a
more advanced way.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c        | 18 ++++++++++++++++--
 sound/soc/fsl/fsl_asrc_common.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 95f6a9617b0b..75df220e4b51 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -605,8 +605,8 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = INCLK_NONE;
-	config.outclk = OUTCLK_ASRCK1_CLK;
+	config.inclk = asrc->inclk;
+	config.outclk = asrc->outclk;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
@@ -1067,6 +1067,20 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc->channel_avail = 10;
 
+	ret = of_property_read_u32(np, "fsl,asrc-input-clock",
+				   &asrc->inclk);
+	if (ret) {
+		dev_info(&pdev->dev, "no input clock specified, using none\n");
+		asrc->inclk = INCLK_NONE;
+	}
+
+	ret = of_property_read_u32(np, "fsl,asrc-output-clock",
+				   &asrc->outclk);
+	if (ret) {
+		dev_info(&pdev->dev, "no output clock specified, using default\n");
+		asrc->outclk = OUTCLK_ASRCK1_CLK;
+	}
+
 	ret = of_property_read_u32(np, "fsl,asrc-rate",
 				   &asrc->asrc_rate);
 	if (ret) {
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..1468878fbaca 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -89,6 +89,9 @@ struct fsl_asrc {
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
 	unsigned int channel_avail;
 
+	enum asrc_inclk inclk;
+	enum asrc_outclk outclk;
+
 	int asrc_rate;
 	snd_pcm_format_t asrc_format;
 	bool use_edma;
-- 
2.27.0

