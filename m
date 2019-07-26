Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F776574
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F77204C;
	Fri, 26 Jul 2019 14:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F77204C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143236;
	bh=BjNGfFBTusutKN30FMS2QPb+AAlHzjd6GEBJ+4i6LcE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=izBJmTKMeefhFkp4ck76H2c00ROpo7B9jY7IREb4sn21jGNsIJ+LTPnfBGprhGFa1
	 91TYL9mT4iHuPnJ4nbnz1mhVBCRLMA316FQwsHGTRf67VFjQ3/5aJVIx4lm4VTZnyW
	 6GicmRYCoiwsLnD9ikJUwJz7TqNHh0zFKt/ayOO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12AB8F801A4;
	Fri, 26 Jul 2019 14:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E11A9F803D7; Fri, 26 Jul 2019 14:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F7B8F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F7B8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s9zIlTeU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=27z2IrZ6wvjuz3JI9ojSIqbX+R8MMajI210K/ABB0A8=; b=s9zIlTeUsh7D
 afxgiMq4e5IN+HuqiN+snKDcXvy33jKOjtlPYIGSADIe9vW/I1hpoh6qpoaJwgpegnh/mqY/2rZmt
 Y8y2UWy09vWnvpxdQ14XVutTYKxvYdTvz94VELKtciA5REdI/o2FGyjr06GbtHJu/QnEy30G4Vsh7
 77098=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqz58-0001Zq-JZ; Fri, 26 Jul 2019 12:12:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1CFE72742B9F; Fri, 26 Jul 2019 13:12:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190726064244.3762-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190726121218.1CFE72742B9F@ypsilon.sirena.org.uk>
Date: Fri, 26 Jul 2019 13:12:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 jsarha@ti.com, Mark Brown <broonie@kernel.org>, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Correct slot_width
	posed constraint" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Correct slot_width posed constraint

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 1e112c35e3c96db7c8ca6ddaa96574f00c06e7db Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 26 Jul 2019 09:42:43 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Correct slot_width posed constraint

The slot_width is a property for the bus while the constraint for
SNDRV_PCM_HW_PARAM_SAMPLE_BITS is for the in memory format.

Applying slot_width constraint to sample_bits works most of the time, but
it will blacklist valid formats in some cases.

With slot_width 24 we can support S24_3LE and S24_LE formats as they both
look the same on the bus, but a a 24 constraint on sample_bits would not
allow S24_LE as it is stored in 32bits in memory.

Implement a simple hw_rule function to allow all formats which require less
or equal number of bits on the bus as slot_width (if configured).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190726064244.3762-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 43 ++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 4d611565375b..44708c8f90d6 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1257,6 +1257,28 @@ static int davinci_mcasp_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int davinci_mcasp_hw_rule_slot_width(struct snd_pcm_hw_params *params,
+					    struct snd_pcm_hw_rule *rule)
+{
+	struct davinci_mcasp_ruledata *rd = rule->private;
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_mask nfmt;
+	int i, slot_width;
+
+	snd_mask_none(&nfmt);
+	slot_width = rd->mcasp->slot_width;
+
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+		if (snd_mask_test(fmt, i)) {
+			if (snd_pcm_format_width(i) <= slot_width) {
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
@@ -1378,7 +1400,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	struct davinci_mcasp_ruledata *ruledata =
 					&mcasp->ruledata[substream->stream];
 	u32 max_channels = 0;
-	int i, dir;
+	int i, dir, ret;
 	int tdm_slots = mcasp->tdm_slots;
 
 	/* Do not allow more then one stream per direction */
@@ -1407,6 +1429,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 			max_channels++;
 	}
 	ruledata->serializers = max_channels;
+	ruledata->mcasp = mcasp;
 	max_channels *= tdm_slots;
 	/*
 	 * If the already active stream has less channels than the calculated
@@ -1432,20 +1455,22 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 				   0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &mcasp->chconstr[substream->stream]);
 
-	if (mcasp->slot_width)
-		snd_pcm_hw_constraint_minmax(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
-					     8, mcasp->slot_width);
+	if (mcasp->slot_width) {
+		/* Only allow formats require <= slot_width bits on the bus */
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_FORMAT,
+					  davinci_mcasp_hw_rule_slot_width,
+					  ruledata,
+					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * If we rely on implicit BCLK divider setting we should
 	 * set constraints based on what we can provide.
 	 */
 	if (mcasp->bclk_master && mcasp->bclk_div == 0 && mcasp->sysclk_freq) {
-		int ret;
-
-		ruledata->mcasp = mcasp;
-
 		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  davinci_mcasp_hw_rule_rate,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
