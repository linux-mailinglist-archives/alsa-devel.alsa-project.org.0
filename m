Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7F1A3B10
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2691693;
	Thu,  9 Apr 2020 22:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2691693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462701;
	bh=urXD5joPbnaMv+4WMAzm+NfQ0M4GBk/3ogxO2OkhLXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebPnhrsveS8bqYIRYLkzbBIclsOovSKr3hi7u5LPYCnfDVtKrq3bXZMAmvcWqtks4
	 l3zuuhIxDzwjlXUcvXiZvFRofvvX0cKYe1cYKySIsXzPDtFMk3bBgWbPjDLJtrn+zJ
	 yIQjEVRa9JDSiXs+1KIzxF7PfPZNzwGGoR+uYWas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB01EF802E3;
	Thu,  9 Apr 2020 21:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE97F8028F; Thu,  9 Apr 2020 21:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C91F80213
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C91F80213
IronPort-SDR: 7l0xL8Jxxw+z7aRCnv7SO2apMLOLBhdt5sqB+Kg++t3KcM7dRY+S5qNhIY6lYnzm832n11L9JJ
 TqkqnFN2LCdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:09 -0700
IronPort-SDR: 6jL3jkk0QBWptiRUVfPumFqS71jtUzgGaS44vAnp+tf98qIV5Y02n6vQUnku29ZiAHleaErZhG
 JdUu3IZ6uy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745317"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in
 hw_params if needed
Date: Thu,  9 Apr 2020 14:58:30 -0500
Message-Id: <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Matthias Reichl <hias@horus.com>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

The SCLK is resumed by the codec driver. In case the rate specified in
hw_params does not match the current configuration, disable, set the
new rate and restart the clock.

There is no operation on hw_free, the codec suspend routine will
disable/deprepare the clock.

Note that we don't change the DAI configuration when the DAC+ PRO is
detected. All changes for the codec master mode are handled in the
topology file (DAI configuration change and scheduling change)

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 94 ++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index c1d2a53c1ec8..b5153ce954c7 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -145,6 +145,31 @@ static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int aif1_update_rate_den(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_ratnum rats_no_pll;
+	unsigned int num = 0, den = 0;
+	int err;
+
+	rats_no_pll.num = clk_get_rate(ctx->sclk) / 64;
+	rats_no_pll.den_min = 1;
+	rats_no_pll.den_max = 128;
+	rats_no_pll.den_step = 1;
+
+	err = snd_interval_ratnum(hw_param_interval(params,
+						    SNDRV_PCM_HW_PARAM_RATE),
+				  1, &rats_no_pll, &num, &den);
+	if (err >= 0 && den) {
+		params->rate_num = num;
+		params->rate_den = den;
+	}
+
+	return 0;
+}
+
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -156,6 +181,74 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int aif1_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct device *dev = rtd->card->dev;
+	int current_rate;
+	int sclk_rate;
+	int channels;
+	int width;
+	int rate;
+	int ret = 0;
+
+	if (ctx->is_dac_pro) {
+		rate = params_rate(params);
+		channels = params_channels(params);
+		width = snd_pcm_format_physical_width(params_format(params));
+
+		if (rate % 24000)
+			sclk_rate = 22579200;
+		else
+			sclk_rate = 24576000;
+
+		current_rate = clk_get_rate(ctx->sclk);
+		if (current_rate != sclk_rate) {
+			/*
+			 * The sclk clock is started and stopped by the codec
+			 * resume/suspend functions. If the rate isn't correct,
+			 * stop, set the new rate and restart the clock
+			 */
+
+			dev_dbg(dev, "reconfiguring SCLK to rate %d\n",
+				sclk_rate);
+
+			clk_disable_unprepare(ctx->sclk);
+
+			ret = clk_set_rate(ctx->sclk, sclk_rate);
+			if (ret) {
+				dev_err(dev, "Could not set SCLK rate %d\n",
+					sclk_rate);
+				return ret;
+			}
+
+			ret = clk_prepare_enable(ctx->sclk);
+			if (ret) {
+				dev_err(dev, "Failed to enable SCLK: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		ret = aif1_update_rate_den(substream, params);
+		if (ret) {
+			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
+						 channels * width);
+		if (ret) {
+			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -167,6 +260,7 @@ static void aif1_shutdown(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sof_pcm512x_ops = {
 	.startup = aif1_startup,
+	.hw_params = aif1_hw_params,
 	.shutdown = aif1_shutdown,
 };
 
-- 
2.20.1

