Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533B76579
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9423204B;
	Fri, 26 Jul 2019 14:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9423204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143282;
	bh=fvcI6PJHmuv2ffb8q5ux6CVWxGHYJ1EnbKj1wFEyYHI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P16XuH+12To7Vc5DcZgY8O2eiIJl9SnXDxN91BpxAbrVDa6Fbb5AUTmxCCTG2eB3W
	 9Tc304FLwdQoc2dJn5pIQ+M2yTKz1laZwAMKUS5dzCMUPA2M7tJ5YbOSalhN7hJK2m
	 clY/htoUqCXkE8I9xN7NwtXhxWybn+cBEfLKn/gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03D24F803D7;
	Fri, 26 Jul 2019 14:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 426BCF803D6; Fri, 26 Jul 2019 14:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80B7AF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B7AF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KIcO+Pgk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PlHL85uyogNgMszDfc1x4iHfxw+2mx7nkWuU0U4eMno=; b=KIcO+PgkhyTk
 IzOoWO7RTtceyQZnKFZV794/jef9CMQhmBNyMmrpsdU3c+4UaVCzvD+AIZ37rKHIWqlS0iWVpA6jM
 o0O1whpClZ6JGkdlKmVwKNynDWnUtrWgsV7HANeFttYOgYzqkE328Qt2xmTJ5ufPPQ0iMdpCi9SJA
 DXxRA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqz58-0001Zn-JS; Fri, 26 Jul 2019 12:12:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E02172742B66; Fri, 26 Jul 2019 13:12:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190726064244.3762-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190726121217.E02172742B66@ypsilon.sirena.org.uk>
Date: Fri, 26 Jul 2019 13:12:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 jsarha@ti.com, Mark Brown <broonie@kernel.org>, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Support for correct
	symmetric sample bits" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Support for correct symmetric sample bits

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

From 2448c813b12cf1fb08da1d20bdb2ae583cda2d6f Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 26 Jul 2019 09:42:44 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Support for correct symmetric sample
 bits

Implement custom snd_pcm_hw_rule to filter the available formats for the
second stream to make it symmetric and allow only formats which require
the same amount of bits on the bus as the running stream.

A simple constraint is not working correctly because for example:
the first stream is started with S24_LE

If we place 24 as constraint for the SAMPLE_BITS then the second stream
can not use S24_LE as it is physically 32bits.

If we would place 32 as constraint (physical width) then S32_LE would have
been allowed, but S24_3LE is not.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190726064244.3762-3-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 87ae19329e71..7aa3c32e4a49 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -109,6 +109,7 @@ struct davinci_mcasp {
 
 	/* Used for comstraint setting on the second stream */
 	u32	channels;
+	int	max_format_width;
 	u8	active_serializers[2];
 
 #ifdef CONFIG_GPIOLIB
@@ -766,6 +767,8 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 
 	if (mcasp->slot_width)
 		slot_width = mcasp->slot_width;
+	else if (mcasp->max_format_width)
+		slot_width = mcasp->max_format_width;
 	else
 		slot_width = sample_width;
 	/*
@@ -1233,8 +1236,11 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 
 	davinci_config_channel_size(mcasp, word_length);
 
-	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
+	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
 		mcasp->channels = channels;
+		if (!mcasp->max_format_width)
+			mcasp->max_format_width = word_length;
+	}
 
 	return 0;
 }
@@ -1286,6 +1292,28 @@ static int davinci_mcasp_hw_rule_slot_width(struct snd_pcm_hw_params *params,
 	return snd_mask_refine(fmt, &nfmt);
 }
 
+static int davinci_mcasp_hw_rule_format_width(struct snd_pcm_hw_params *params,
+					      struct snd_pcm_hw_rule *rule)
+{
+	struct davinci_mcasp_ruledata *rd = rule->private;
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_mask nfmt;
+	int i, format_width;
+
+	snd_mask_none(&nfmt);
+	format_width = rd->mcasp->max_format_width;
+
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+		if (snd_mask_test(fmt, i)) {
+			if (snd_pcm_format_width(i) == format_width) {
+				snd_mask_set(&nfmt, i);
+			}
+		}
+	}
+
+	return snd_mask_refine(fmt, &nfmt);
+}
+
 static const unsigned int davinci_mcasp_dai_rates[] = {
 	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000,
 	88200, 96000, 176400, 192000,
@@ -1463,7 +1491,20 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 				   0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &mcasp->chconstr[substream->stream]);
 
-	if (mcasp->slot_width) {
+	if (mcasp->max_format_width) {
+		/*
+		 * Only allow formats which require same amount of bits on the
+		 * bus as the currently running stream
+		 */
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_FORMAT,
+					  davinci_mcasp_hw_rule_format_width,
+					  ruledata,
+					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+		if (ret)
+			return ret;
+	}
+	else if (mcasp->slot_width) {
 		/* Only allow formats require <= slot_width bits on the bus */
 		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -1514,8 +1555,10 @@ static void davinci_mcasp_shutdown(struct snd_pcm_substream *substream,
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		return;
 
-	if (!cpu_dai->active)
+	if (!cpu_dai->active) {
 		mcasp->channels = 0;
+		mcasp->max_format_width = 0;
+	}
 }
 
 static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
@@ -1571,7 +1614,6 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 		},
 		.ops 		= &davinci_mcasp_dai_ops,
 
-		.symmetric_samplebits	= 1,
 		.symmetric_rates	= 1,
 	},
 	{
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
