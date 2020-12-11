Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC42D800F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 21:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A58F16CB;
	Fri, 11 Dec 2020 21:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A58F16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607718982;
	bh=R/a+MzF3QDSiZW2gx1QTpVIPq/BrsOE5wtYO9B7Qhjg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hV2/HsA4CdTL/TdnmcyDokzi3vdAk+ue0VA9y5E3It2p4ZJ06WzyBtx00lH28C73X
	 +elEo3LkNjEzBo9Ef4PjTSpMbjb5EGs5hCKYU1I+yTW8OffhH1pQdoHrgNWwkotW4z
	 A522+8MPMEn+vZyMxLYP8htXX83rt2snLM9RuA0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07A3F80217;
	Fri, 11 Dec 2020 21:34:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6375F8020D; Fri, 11 Dec 2020 21:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE231F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 21:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE231F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="VI4jDJjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607718879;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
 bh=Q5ygFn87+v45sNbh7ordjln5uqLqMUwNkSjAyd8qCzM=;
 b=VI4jDJjbuOlkBV6FqKRch2E31N3I/1kl0zwlNBTHpoGgWczs1Zx5CrR/klgAr/agYK
 y1naiFOet9UQ91rNh4STpspJ3sqxz3qhmRFO/7iZ9P5NrHexjjSPr3zG+8YVvuR/Tyzb
 spPEwI2C2jjVWqHJcV1ogvWxCbwykwceMHq1PoJBCz/Cn6fc/WLKQZEvbctd7AhP+0f3
 5Q+ffRkBf+EyaIcJZLkL+9Urkh6dNvOCVdXXmW2RwsO5E+I4QzXI9ZwoT5j9XtaJZ7DI
 FMweJM/hJ9sCEjNdiWpCT7Rov+NDkIEoAgYyw7NAGsNdXoGgWaFiBaBdjFpLVOk5ek91
 9TxQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB626OARkI"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.7.1 DYNA|AUTH)
 with ESMTPSA id 409b08wBBKYa5hq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 11 Dec 2020 21:34:36 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai
Date: Fri, 11 Dec 2020 21:32:55 +0100
Message-Id: <20201211203255.148246-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

At the moment it is necessary to set up the DAPM routes between
front-end AIF<->DAI explicitly in the device tree, e.g. using

	audio-routing =
		"MM_DL1", "MultiMedia1 Playback",
		"MM_DL3", "MultiMedia3 Playback",
		"MM_DL4", "MultiMedia4 Playback",
		"MultiMedia2 Capture", "MM_UL2";

This is prone to mistakes and (sadly) there is no clear error if one
of these routes is missing. :(

Actually, this should not be necessary because the ASoC core normally
automatically links AIF<->DAI within snd_soc_dapm_link_dai_widgets().
This is done using the "stname" parameter of SND_SOC_DAPM_AIF_IN/OUT.

For SND_SOC_DAPM_AIF_IN("MM_DL1", "MultiMedia1 Playback", 0, 0, 0, 0),
it should create the route from above: MM_DL1 <-> MultiMedia1 Playback.

This does not work at the moment because the AIF widget (MM_DL1)
and the DAI widget (MultiMedia1 Playback) belong to different
DAPM contexts (q6routing / q6asm-dai).

Fix this by declaring the AIF widgets in the same driver as the DAIs
(q6asm-dai). Now the routes above are created automatically
and no longer need to be specified in the device tree.

This is also more consistent with the back-end AIFs which are already
declared in q6afe-dais instead of q6routing. q6routing should only link
the components together using mixers.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 21 +++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c | 18 ------------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c9ac9c1d26c4..9766725c2916 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1233,6 +1233,25 @@ static void q6asm_dai_pcm_free(struct snd_soc_component *component,
 	}
 }
 
+static const struct snd_soc_dapm_widget q6asm_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("MM_DL1", "MultiMedia1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL2", "MultiMedia2 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL3", "MultiMedia3 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL4", "MultiMedia4 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL5", "MultiMedia5 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL6", "MultiMedia6 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL7", "MultiMedia7 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("MM_DL8", "MultiMedia8 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL1", "MultiMedia1 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL2", "MultiMedia2 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL3", "MultiMedia3 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL4", "MultiMedia4 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL5", "MultiMedia5 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL6", "MultiMedia6 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL7", "MultiMedia7 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("MM_UL8", "MultiMedia8 Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.name		= DRV_NAME,
 	.open		= q6asm_dai_open,
@@ -1245,6 +1264,8 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.pcm_construct	= q6asm_dai_pcm_new,
 	.pcm_destruct	= q6asm_dai_pcm_free,
 	.compress_ops	= &q6asm_dai_compress_ops,
+	.dapm_widgets	= q6asm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(q6asm_dapm_widgets),
 };
 
 static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 53185e26fea1..0a6b9433f6ac 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -713,24 +713,6 @@ static const struct snd_kcontrol_new mmul8_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA8) };
 
 static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
-	/* Frontend AIF */
-	SND_SOC_DAPM_AIF_IN("MM_DL1", "MultiMedia1 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL2", "MultiMedia2 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL3", "MultiMedia3 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL4", "MultiMedia4 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL5", "MultiMedia5 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL6", "MultiMedia6 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL7", "MultiMedia7 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("MM_DL8", "MultiMedia8 Playback", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL1", "MultiMedia1 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL2", "MultiMedia2 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL3", "MultiMedia3 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL4", "MultiMedia4 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL5", "MultiMedia5 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL6", "MultiMedia6 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL7", "MultiMedia7 Capture", 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("MM_UL8", "MultiMedia8 Capture", 0, 0, 0, 0),
-
 	/* Mixer definitions */
 	SND_SOC_DAPM_MIXER("HDMI Mixer", SND_SOC_NOPM, 0, 0,
 			   hdmi_mixer_controls,
-- 
2.29.2

