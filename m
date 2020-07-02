Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4881212642
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5380B16DD;
	Thu,  2 Jul 2020 16:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5380B16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593700027;
	bh=9JZ4Q/jab7SpPdou5WA7QO+VuvLfk5iWbPOtYXHsjOs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExifkJykAt05VXVjAcLO0UWAuo2vOxApMKCz1qDkT6jDBMET3KMCHlqxu6tkj7aZU
	 WTATFUirPynYxR+xASG/gB5P/TsigZPSQ4GSmUD6kk73sQ50aKN2jsthQyTF7mcd8l
	 7+kM36SHXFWDiFGynFq2IpEF7++WAsEZ1hX2oZSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F6BF802E7;
	Thu,  2 Jul 2020 16:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5E57F802DB; Thu,  2 Jul 2020 16:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BDB7F80252
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BDB7F80252
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34A3E2A5EC7;
 Thu,  2 Jul 2020 15:23:10 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 4/4] ASoC: fsl_asrc: swap input and output clocks in capture
 mode
Date: Thu,  2 Jul 2020 16:22:35 +0200
Message-Id: <20200702142235.235869-5-arnaud.ferraris@collabora.com>
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

The input clock is the reference clock we need to convert the stream to,
which therefore has to be the clock of the origin stream/device.

When the stream is bi-directional and we want ASRC to act on both
directions, we need to swap the input and output clocks between the
playback and capture streams.

As some of the clocks have different ID's depending on whether they are
used as input or output, this requires adding a new function to find the
output clock ID corresponding to a given input clock.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c | 50 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 65e7307a3df0..5aeab1fbcdd9 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -506,6 +506,50 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
 
+/**
+ * Select the output clock corresponding to a given input clock (and vice-versa)
+ *
+ * If we want to setup a capture channel, the input and output clocks have to
+ * be swapped.
+ * However, even if most of the clocks have the same index when used as input
+ * or output, some of them (ESAI, SSI* and SPDIF) are different:
+ * - the TX output clock has the index of the corresponding RX input clock
+ * - the RX output clock has the index of the corresponding TX input clock
+ *
+ * This function makes sure that we use the proper clock index when swapping
+ * the input and output clocks.
+ */
+static enum asrc_outclk fsl_asrc_get_capture_clock(enum asrc_inclk inclk)
+{
+	enum asrc_outclk outclk;
+
+	switch (inclk) {
+	case INCLK_ESAI_RX:
+	case INCLK_SSI1_RX:
+	case INCLK_SSI2_RX:
+	case INCLK_SPDIF_RX:
+		outclk = inclk + 0x8;
+		break;
+	case INCLK_SSI3_RX:
+		outclk = OUTCLK_SSI3_RX;
+		break;
+	case INCLK_ESAI_TX:
+	case INCLK_SSI1_TX:
+	case INCLK_SSI2_TX:
+	case INCLK_SPDIF_TX:
+		outclk = inclk - 0x8;
+		break;
+	case INCLK_SSI3_TX:
+		outclk = OUTCLK_SSI3_TX;
+		break;
+	default:
+		outclk = inclk;
+		break;
+	}
+
+	return outclk;
+}
+
 /**
  * Start the assigned ASRC pair
  *
@@ -604,15 +648,17 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = asrc->inclk;
-	config.outclk = asrc->outclk;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		config.inclk = asrc->inclk;
+		config.outclk = asrc->outclk;
 		config.input_format   = params_format(params);
 		config.output_format  = asrc->asrc_format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc->asrc_rate;
 	} else {
+		config.inclk = fsl_asrc_get_capture_clock(asrc->outclk);
+		config.outclk = fsl_asrc_get_capture_clock(asrc->inclk);
 		config.input_format   = asrc->asrc_format;
 		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc->asrc_rate;
-- 
2.27.0

