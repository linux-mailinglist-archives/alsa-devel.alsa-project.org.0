Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBB1A8776
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6355816A4;
	Tue, 14 Apr 2020 19:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6355816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586885210;
	bh=LfisnQrfyusSdLWGF7Z1+gGkwgbBMGegkSobI9BzgtI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDwUIXuqXaGjF0KBYmaXRx1K/VKcon42zPGTYc5m7BnrQ2zgIN1y49n38zp3OBYsa
	 A8Bb4/clLdnJXW+cNayNzwNsu5IMu3SzY1xhF0HLcdwTKT9nry3gX4s91aqhiOGpxo
	 3Dwa330/VgqJGcpP/AsWUXOoEv/r4zZSUF+Cb3Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86517F80126;
	Tue, 14 Apr 2020 19:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC2B5F8013D; Tue, 14 Apr 2020 19:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C8EF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C8EF800B9
IronPort-SDR: ebEafDlZJPUvH7XKJVaoK7MwLs3M1Y2kxxYYRtNQCMXfx3MnUSislUIAzE7R/m9fofQMR9AEAI
 +ExTbLbAt0IQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 10:24:59 -0700
IronPort-SDR: xlHs8W7KkTNiYUqjgzghdeYN2bxqCo5LerU2aDyjK9kylOT0QjL+HpDdT2nXSFZCMyW9ghrHWu
 LQ7pKUVKR8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="454631045"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2020 10:24:56 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOPIx-000ZtJ-5F; Tue, 14 Apr 2020 20:24:59 +0300
Date: Tue, 14 Apr 2020 20:24:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in
 hw_params if needed
Message-ID: <20200414172459.GE34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Thu, Apr 09, 2020 at 02:58:30PM -0500, Pierre-Louis Bossart wrote:
> The SCLK is resumed by the codec driver. In case the rate specified in
> hw_params does not match the current configuration, disable, set the
> new rate and restart the clock.
> 
> There is no operation on hw_free, the codec suspend routine will
> disable/deprepare the clock.
> 
> Note that we don't change the DAI configuration when the DAC+ PRO is
> detected. All changes for the codec master mode are handled in the
> topology file (DAI configuration change and scheduling change)

...

> +	err = snd_interval_ratnum(hw_param_interval(params,
> +						    SNDRV_PCM_HW_PARAM_RATE),
> +				  1, &rats_no_pll, &num, &den);

> +	if (err >= 0 && den) {

Perhaps usual pattern, i.e.

	if (err < 0 || !den)
		return 0;
(so, above seems optional configuration)

	params...;
	return 0;

> +		params->rate_num = num;
> +		params->rate_den = den;
> +	}
> +
> +	return 0;

...

> +static int aif1_hw_params(struct snd_pcm_substream *substream,
> +			  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> +	struct device *dev = rtd->card->dev;
> +	int current_rate;
> +	int sclk_rate;
> +	int channels;
> +	int width;
> +	int rate;
> +	int ret = 0;
> +

> +	if (ctx->is_dac_pro) {

	if (!...)
		return 0;

...and drop the redundant ret assignment above.

> +		rate = params_rate(params);
> +		channels = params_channels(params);
> +		width = snd_pcm_format_physical_width(params_format(params));
> +
> +		if (rate % 24000)
> +			sclk_rate = 22579200;
> +		else
> +			sclk_rate = 24576000;
> +
> +		current_rate = clk_get_rate(ctx->sclk);
> +		if (current_rate != sclk_rate) {
> +			/*
> +			 * The sclk clock is started and stopped by the codec
> +			 * resume/suspend functions. If the rate isn't correct,
> +			 * stop, set the new rate and restart the clock
> +			 */
> +
> +			dev_dbg(dev, "reconfiguring SCLK to rate %d\n",
> +				sclk_rate);
> +
> +			clk_disable_unprepare(ctx->sclk);
> +
> +			ret = clk_set_rate(ctx->sclk, sclk_rate);
> +			if (ret) {
> +				dev_err(dev, "Could not set SCLK rate %d\n",
> +					sclk_rate);
> +				return ret;
> +			}
> +
> +			ret = clk_prepare_enable(ctx->sclk);
> +			if (ret) {
> +				dev_err(dev, "Failed to enable SCLK: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +
> +		ret = aif1_update_rate_den(substream, params);
> +		if (ret) {
> +			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
> +			return ret;
> +		}

Do you still need below steps when current_rate == sclk_rate?

> +		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
> +						 channels * width);
> +		if (ret) {
> +			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


