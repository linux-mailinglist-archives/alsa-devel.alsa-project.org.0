Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE61A0995
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61441663;
	Tue,  7 Apr 2020 10:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61441663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249640;
	bh=TydOUIYqPMcioxPVpD9UvhCk9E4ugwo89Zc3DH+p5r4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0+lSN0yz/oEwAEyvVidVPDBHmw/WoxmS3lI0BWstVyDQklaeYIG3fLUJb/GKThbW
	 +3L+hC2IIddNHmMKwEW9fvNpeolGmSd79O7gTJfkTTwNtWgdlqGOj9I40PL6oZ0X44
	 SuWqjO8jeo0dPcQTPqvl8UhGUCDY5GPyuawLXHWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E52BCF80248;
	Tue,  7 Apr 2020 10:51:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0B39F80143; Mon,  6 Apr 2020 15:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB76F80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 15:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB76F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="KqF9qKW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586181413;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=HCkobm6WVxFivuVMVb0Qlziw5czUnYwYei1vVlTv3VQ=;
 b=KqF9qKW5sQUbk8SW8Bwr1ZziIg2O5vuBttmOnQb+zX+lVorv0GTJMEJ34Zn9IEzTCL
 a33kEeDPu7p8yHKGDlbApcjptw00ZyVusj3LwcdBpTKi0iOGWIFIecW7SW2o69c0Y/8L
 Py3fKeAoxoWoX27mYmLc2yhtYD3Y9vHCHHrhTqYY9LDJwoJVXvkSgbzMc8jSfjnIX4D6
 8vOaTK39d3rj0A4dBGEB9DUOuL9K//oezDSPDo/Q+iVe3PY66bMJVp7qlq/zrfNrJc2g
 DIjGY4kYWGgwcICGnANIPleXzVUrX3lw7PJk7IxED9cbpBHeUrQXYJ3EW+D0HWcLU/ez
 lUTw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id u043b8w36Duh2ON
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 6 Apr 2020 15:56:43 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: qcom: lpass-cpu: Make I2S SD lines configurable
Date: Mon,  6 Apr 2020 15:56:08 +0200
Message-Id: <20200406135608.126171-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406135608.126171-1-stephan@gerhold.net>
References: <20200406135608.126171-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:51:32 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Kenneth Westfield <kwestfie@codeaurora.org>
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

The LPASS hardware allows configuring the MI2S SD lines to use
when playing/recording audio. However, at the moment the lpass-cpu
driver has SD0 hard-coded for mono/stereo (or additional fixed
SD lines for more channels).

For weird reasons there seems to be hardware that uses one of the
other SD lines for mono/stereo. For example, some Samsung devices
use an external Speaker amplifier connected to Quaternary MI2S.
For some reason, the SD line for audio playback was connected to
SD1 rather than SD0. (I have no idea why...)
At the moment, the lpass-cpu driver cannot be configured to work
for the Speaker on these devices.

The q6afe driver already allows configuring the MI2S SD lines
through the "qcom,sd-lines" device tree property, but this works
only when routing audio through the ADSP.

This commit adds a very similar configuration for the lpass-cpu driver.
It is now possible to add additional subnodes to the lpass device in
the device tree, to configure the SD lines for playback and/or capture.
E.g. for the Samsung devices mentioned above:

&lpass {
	mi2s-quaternary@3 {
		reg = <MI2S_QUATERNARY>;
		qcom,playback-sd-lines = <1>;
	};
};

qcom,playback/capture-sd-lines takes a list of SD lines (0-3)
in the same format as the q6afe driver. (The difference here is that
q6afe has separate DAIs for playback/capture, while lpass-cpu has one
for both...)

For backwards compatibility with older device trees, the lpass-cpu driver
defaults to LPAIF_I2SCTL_MODE_8CH if the subnode for a DAI is missing.
This is equivalent to the previous behavior: Up to 8 channels can be
configured, and SD0/QUAT01 will be chosen when setting up a stream
with fewer channels.

This allows the speaker to work on Samsung MSM8916 devices
that use an external speaker amplifier.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/lpass-cpu.c       | 196 +++++++++++++++++++++++--------
 sound/soc/qcom/lpass-lpaif-reg.h |  30 ++---
 sound/soc/qcom/lpass.h           |   4 +
 3 files changed, 166 insertions(+), 64 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbce7e92baf3..de2b6d60ce6a 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -19,6 +19,16 @@
 #include "lpass-lpaif-reg.h"
 #include "lpass.h"
 
+#define LPASS_CPU_MAX_MI2S_LINES	4
+#define LPASS_CPU_I2S_SD0_MASK		BIT(0)
+#define LPASS_CPU_I2S_SD1_MASK		BIT(1)
+#define LPASS_CPU_I2S_SD2_MASK		BIT(2)
+#define LPASS_CPU_I2S_SD3_MASK		BIT(3)
+#define LPASS_CPU_I2S_SD0_1_MASK	GENMASK(1, 0)
+#define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
+#define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
+#define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
+
 static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		unsigned int freq, int dir)
 {
@@ -72,6 +82,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	unsigned int mode;
 	unsigned int regval;
 	int bitwidth, ret;
 
@@ -99,60 +110,84 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		switch (channels) {
-		case 1:
-			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
-			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
-			break;
-		case 2:
-			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
-			break;
-		case 4:
-			regval |= LPAIF_I2SCTL_SPKMODE_QUAD01;
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
-			break;
-		case 6:
-			regval |= LPAIF_I2SCTL_SPKMODE_6CH;
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		mode = drvdata->mi2s_playback_sd_mode[dai->driver->id];
+	else
+		mode = drvdata->mi2s_capture_sd_mode[dai->driver->id];
+
+	if (!mode) {
+		dev_err(dai->dev, "no line is assigned\n");
+		return -EINVAL;
+	}
+
+	switch (channels) {
+	case 1:
+	case 2:
+		switch (mode) {
+		case LPAIF_I2SCTL_MODE_QUAD01:
+		case LPAIF_I2SCTL_MODE_6CH:
+		case LPAIF_I2SCTL_MODE_8CH:
+			mode = LPAIF_I2SCTL_MODE_SD0;
 			break;
-		case 8:
-			regval |= LPAIF_I2SCTL_SPKMODE_8CH;
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
+		case LPAIF_I2SCTL_MODE_QUAD23:
+			mode = LPAIF_I2SCTL_MODE_SD2;
 			break;
-		default:
-			dev_err(dai->dev, "invalid channels given: %u\n",
-				channels);
+		}
+
+		break;
+	case 4:
+		if (mode < LPAIF_I2SCTL_MODE_QUAD01) {
+			dev_err(dai->dev, "cannot configure 4 channels with mode %d\n",
+				mode);
 			return -EINVAL;
 		}
-	} else {
-		switch (channels) {
-		case 1:
-			regval |= LPAIF_I2SCTL_MICMODE_SD0;
-			regval |= LPAIF_I2SCTL_MICMONO_MONO;
-			break;
-		case 2:
-			regval |= LPAIF_I2SCTL_MICMODE_SD0;
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
-			break;
-		case 4:
-			regval |= LPAIF_I2SCTL_MICMODE_QUAD01;
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
-			break;
-		case 6:
-			regval |= LPAIF_I2SCTL_MICMODE_6CH;
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
+
+		switch (mode) {
+		case LPAIF_I2SCTL_MODE_6CH:
+		case LPAIF_I2SCTL_MODE_8CH:
+			mode = LPAIF_I2SCTL_MODE_QUAD01;
 			break;
-		case 8:
-			regval |= LPAIF_I2SCTL_MICMODE_8CH;
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
+		}
+		break;
+	case 6:
+		if (mode < LPAIF_I2SCTL_MODE_6CH) {
+			dev_err(dai->dev, "cannot configure 6 channels with mode %d\n",
+				mode);
+			return -EINVAL;
+		}
+
+		switch (mode) {
+		case LPAIF_I2SCTL_MODE_8CH:
+			mode = LPAIF_I2SCTL_MODE_6CH;
 			break;
-		default:
-			dev_err(dai->dev, "invalid channels given: %u\n",
-				channels);
+		}
+		break;
+	case 8:
+		if (mode < LPAIF_I2SCTL_MODE_8CH) {
+			dev_err(dai->dev, "cannot configure 8 channels with mode %d\n",
+				mode);
 			return -EINVAL;
 		}
+		break;
+	default:
+		dev_err(dai->dev, "invalid channels given: %u\n", channels);
+		return -EINVAL;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regval |= LPAIF_I2SCTL_SPKMODE(mode);
+
+		if (channels >= 2)
+			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
+		else
+			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
+	} else {
+		regval |= LPAIF_I2SCTL_MICMODE(mode);
+
+		if (channels >= 2)
+			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
+		else
+			regval |= LPAIF_I2SCTL_MICMONO_MONO;
 	}
 
 	ret = regmap_write(drvdata->lpaif_map,
@@ -413,6 +448,73 @@ static struct regmap_config lpass_cpu_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
+						struct device_node *node,
+						const char *name)
+{
+	unsigned int lines[LPASS_CPU_MAX_MI2S_LINES];
+	unsigned int sd_line_mask = 0;
+	int num_lines, i;
+
+	num_lines = of_property_read_variable_u32_array(node, name, lines, 0,
+							LPASS_CPU_MAX_MI2S_LINES);
+	if (num_lines < 0)
+		return LPAIF_I2SCTL_MODE_NONE;
+
+	for (i = 0; i < num_lines; i++)
+		sd_line_mask |= BIT(lines[i]);
+
+	switch (sd_line_mask) {
+	case LPASS_CPU_I2S_SD0_MASK:
+		return LPAIF_I2SCTL_MODE_SD0;
+	case LPASS_CPU_I2S_SD1_MASK:
+		return LPAIF_I2SCTL_MODE_SD1;
+	case LPASS_CPU_I2S_SD2_MASK:
+		return LPAIF_I2SCTL_MODE_SD2;
+	case LPASS_CPU_I2S_SD3_MASK:
+		return LPAIF_I2SCTL_MODE_SD3;
+	case LPASS_CPU_I2S_SD0_1_MASK:
+		return LPAIF_I2SCTL_MODE_QUAD01;
+	case LPASS_CPU_I2S_SD2_3_MASK:
+		return LPAIF_I2SCTL_MODE_QUAD23;
+	case LPASS_CPU_I2S_SD0_1_2_MASK:
+		return LPAIF_I2SCTL_MODE_6CH;
+	case LPASS_CPU_I2S_SD0_1_2_3_MASK:
+		return LPAIF_I2SCTL_MODE_8CH;
+	default:
+		dev_err(dev, "Unsupported SD line mask: %#x\n", sd_line_mask);
+		return LPAIF_I2SCTL_MODE_NONE;
+	}
+}
+
+static void of_lpass_cpu_parse_dai_data(struct device *dev,
+					struct lpass_data *data)
+{
+	struct device_node *node;
+	int ret, id;
+
+	/* Allow all channels by default for backwards compatibility */
+	for (id = 0; id < data->variant->num_dai; id++) {
+		data->mi2s_playback_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
+		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
+	}
+
+	for_each_child_of_node(dev->of_node, node) {
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= data->variant->num_dai) {
+			dev_err(dev, "valid dai id not found: %d\n", ret);
+			continue;
+		}
+
+		data->mi2s_playback_sd_mode[id] =
+			of_lpass_cpu_parse_sd_lines(dev, node,
+						    "qcom,playback-sd-lines");
+		data->mi2s_capture_sd_mode[id] =
+			of_lpass_cpu_parse_sd_lines(dev, node,
+						    "qcom,capture-sd-lines");
+	}
+}
+
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata;
@@ -442,6 +544,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	drvdata->variant = (struct lpass_variant *)match->data;
 	variant = drvdata->variant;
 
+	of_lpass_cpu_parse_dai_data(dev, drvdata);
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(&pdev->dev, res);
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 3d74ae123e9d..72a3e2f69572 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -22,17 +22,19 @@
 #define LPAIF_I2SCTL_SPKEN_DISABLE	(0 << LPAIF_I2SCTL_SPKEN_SHIFT)
 #define LPAIF_I2SCTL_SPKEN_ENABLE	(1 << LPAIF_I2SCTL_SPKEN_SHIFT)
 
+#define LPAIF_I2SCTL_MODE_NONE		0
+#define LPAIF_I2SCTL_MODE_SD0		1
+#define LPAIF_I2SCTL_MODE_SD1		2
+#define LPAIF_I2SCTL_MODE_SD2		3
+#define LPAIF_I2SCTL_MODE_SD3		4
+#define LPAIF_I2SCTL_MODE_QUAD01	5
+#define LPAIF_I2SCTL_MODE_QUAD23	6
+#define LPAIF_I2SCTL_MODE_6CH		7
+#define LPAIF_I2SCTL_MODE_8CH		8
+
 #define LPAIF_I2SCTL_SPKMODE_MASK	0x3C00
 #define LPAIF_I2SCTL_SPKMODE_SHIFT	10
-#define LPAIF_I2SCTL_SPKMODE_NONE	(0 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_SD0	(1 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_SD1	(2 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_SD2	(3 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_SD3	(4 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_QUAD01	(5 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_QUAD23	(6 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_6CH	(7 << LPAIF_I2SCTL_SPKMODE_SHIFT)
-#define LPAIF_I2SCTL_SPKMODE_8CH	(8 << LPAIF_I2SCTL_SPKMODE_SHIFT)
+#define LPAIF_I2SCTL_SPKMODE(mode)	((mode) << LPAIF_I2SCTL_SPKMODE_SHIFT)
 
 #define LPAIF_I2SCTL_SPKMONO_MASK	0x0200
 #define LPAIF_I2SCTL_SPKMONO_SHIFT	9
@@ -46,15 +48,7 @@
 
 #define LPAIF_I2SCTL_MICMODE_MASK	GENMASK(7, 4)
 #define LPAIF_I2SCTL_MICMODE_SHIFT	4
-#define LPAIF_I2SCTL_MICMODE_NONE	(0 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_SD0	(1 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_SD1	(2 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_SD2	(3 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_SD3	(4 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_QUAD01	(5 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_QUAD23	(6 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_6CH	(7 << LPAIF_I2SCTL_MICMODE_SHIFT)
-#define LPAIF_I2SCTL_MICMODE_8CH	(8 << LPAIF_I2SCTL_MICMODE_SHIFT)
+#define LPAIF_I2SCTL_MICMODE(mode)	((mode) << LPAIF_I2SCTL_MICMODE_SHIFT)
 
 #define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
 #define LPAIF_I2SCTL_MICMONO_SHIFT	3
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 17113d380dcc..bd19ec57c73d 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -29,6 +29,10 @@ struct lpass_data {
 	/* MI2S bit clock (derived from system clock by a divider */
 	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
 
+	/* MI2S SD lines to use for playback/capture */
+	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
+	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
+
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
 
-- 
2.26.0

