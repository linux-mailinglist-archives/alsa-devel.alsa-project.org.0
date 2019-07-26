Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACA75F37
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 08:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 432411FC4;
	Fri, 26 Jul 2019 08:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 432411FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564123574;
	bh=iUT6zJv+2W+pqIuBNojccXvlJ8VPOyE6A39zeZ/OKNU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=veX08M0cMRrNlFCrCUs39x1R4YuNfrFRoK9PAmo7qCMXYEh1/alMWRiEJOog2cl1+
	 PLnVz2EyvEQ8vuEm7OsZVMUQypOEgVUeM79g+9+qv2KlN2TftsJTz14fbFckxBtRYQ
	 WzKEJx9sN4T82R7FC7cuyHkEtK/5VE0N886/kR+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9A3F800E8;
	Fri, 26 Jul 2019 08:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FC99F801A4; Fri, 26 Jul 2019 08:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51DF1F80368
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 08:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51DF1F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dyyFby5Y"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6Q6govb056682;
 Fri, 26 Jul 2019 01:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564123370;
 bh=DPTRvKqFy10XPUrecMej+mMAtTro9MkfsCHto0reU4I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dyyFby5Y+EkvaqsyLDo3ELVLgULgAZqO74V/rsfcx2d0DrMJhzketmnOg8w8dG+oZ
 H/bFiNiqTC8dmLmV3Yq9J8A+iH66Fz+vW61y9dJCrN08GEAJoSzKokokEg2kLX8ox6
 fmGe0fmQW+mbey6Vaoyaa5t1+ykgulK6JmVXGHQc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6Q6go2V017142
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jul 2019 01:42:50 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 01:42:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 26 Jul 2019 01:42:49 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6Q6gh48099394;
 Fri, 26 Jul 2019 01:42:48 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 26 Jul 2019 09:42:44 +0300
Message-ID: <20190726064244.3762-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726064244.3762-1-peter.ujfalusi@ti.com>
References: <20190726064244.3762-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, tiwai@suse.com,
 jsarha@ti.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: ti: davinci-mcasp: Support for
	correct symmetric sample bits
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
