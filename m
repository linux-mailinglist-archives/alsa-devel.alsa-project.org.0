Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755F1A8D2B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 23:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BD61662;
	Tue, 14 Apr 2020 23:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BD61662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586898241;
	bh=6avD9jW52n48oKSD1wjtLeCWI3k/p97RjNLe4AH8Pag=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6PHZGcHiHbI08jbVQ2SEq6eL7D0WRtLdKj+AmnpA1imz60BuHu3HXjRHEe4V7w0h
	 ImfpCbMwQPQh02zntuhYH9npYuMQObpFymYTX8KmW/sAooun5z3oH6hBtLxH5Cl8kZ
	 I5q2WYy2S/pPMCldm5fQ4wurMp7vpSXK3eR5PovA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8308FF8014E;
	Tue, 14 Apr 2020 23:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B67F8013D; Tue, 14 Apr 2020 23:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DDBFF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 23:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DDBFF800F5
IronPort-SDR: ap3JSsUYmqXXJMkCuV1TYV0Dop7/gpEivn+aW/qSkeaslydfw3fLJKNrExh/2EjXdG15JPNcgX
 J8Gw6GuKeztQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 14:02:04 -0700
IronPort-SDR: sw1v3qoJwpCrhjXAgPjxDhUcU/4wBNvdpeM9QheHiQWt58QksZR0M6gHG0dH14uaMOYVbz+gW0
 ym3KsPoQZizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="253310592"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 14:02:01 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
Message-ID: <8876c7ef-89f1-b79f-c7c4-7862b9f37db1@linux.intel.com>
Date: Tue, 14 Apr 2020 16:02:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>
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


>>>> Wait, so SCLK is in the *global* namespace and the provider has to
>>>> register the same name?  That doesn't sound clever.  It might be better
>>>> to have the board register the connection from the clock provider to 
>>>> the
>>>> device rather than hard code global namespace strings like this, that
>>>> sounds like a recipie for misery.

Thinking a bit more on this, is the objection on the notion of using a 
fixed string, on the way it's registered or the lack of support for 
clocks in ACPI?

 From a quick look, the use of a fixed string is rather prevalent, see 
below. Less than 10% of codec drivers rely on a NULL string, so is it 
really a dangerous precedent so use "sclk" in this case? It seems to me 
that all clk providers need to use a unique string - what am I missing here?

adau17x1.c:	adau->mclk = devm_clk_get(dev, "mclk");
cs42l51.c:	cs42l51->mclk_handle = devm_clk_get(dev, "MCLK");
cs42xx8.c:	cs42xx8->clk = devm_clk_get(dev, "mclk");
cs53l30.c:	cs53l30->mclk = devm_clk_get(dev, "mclk");
cx2072x.c:	cx2072x->mclk = devm_clk_get(cx2072x->dev, "mclk");
da7213.c:	da7213->mclk = devm_clk_get(component->dev, "mclk");
da7218.c:	da7218->mclk = devm_clk_get(component->dev, "mclk");
da7219.c:	da7219->mclk = devm_clk_get(component->dev, "mclk");
es8316.c:	es8316->mclk = devm_clk_get_optional(component->dev, "mclk");
es8328.c:	es8328->clk = devm_clk_get(component->dev, NULL);
inno_rk3036.c:	priv->pclk = devm_clk_get(&pdev->dev, "acodec_pclk");
jz4725b.c:	icdc->clk = devm_clk_get(&pdev->dev, "aic");
jz4770.c:	codec->clk = devm_clk_get(dev, "aic");
lochnagar-sc.c:	priv->mclk = devm_clk_get(&pdev->dev, "mclk");
max98088.c:	max98088->mclk = devm_clk_get(&i2c->dev, "mclk");
max98090.c:	max98090->mclk = devm_clk_get(component->dev, "mclk");
max98095.c:	max98095->mclk = devm_clk_get(component->dev, "mclk");
max9860.c:	mclk = clk_get(dev, "mclk");
msm8916-wcd-analog.c:	priv->mclk = devm_clk_get(dev, "mclk");
msm8916-wcd-digital.c:	priv->ahbclk = devm_clk_get(dev, "ahbix-clk");
msm8916-wcd-digital.c:	priv->mclk = devm_clk_get(dev, "mclk");
msm8916-wcd-digital.c:	mclk_rate = clk_get_rate(msm8916_wcd->mclk);
nau8825.c:	nau8825->mclk = devm_clk_get(nau8825->dev, "mclk");
nau8825.c:	nau8825->mclk = devm_clk_get(dev, "mclk");
pcm3168a.c:	pcm3168a->scki = devm_clk_get(dev, "scki");
pcm512x.c:	pcm512x->sclk = devm_clk_get(dev, NULL);
rk3328_codec.c:	rk3328->mclk = devm_clk_get(&pdev->dev, "mclk");
rk3328_codec.c:	rk3328->pclk = devm_clk_get(&pdev->dev, "pclk");
rt5514.c:	rt5514->mclk = devm_clk_get(component->dev, "mclk");
rt5616.c:	rt5616->mclk = devm_clk_get(component->dev, "mclk");
rt5640.c:	rt5640->mclk = devm_clk_get(component->dev, "mclk");
rt5659.c:	rt5659->mclk = devm_clk_get(&i2c->dev, "mclk");
rt5660.c:	rt5660->mclk = devm_clk_get(&i2c->dev, "mclk");
rt5682.c:		rt5682->mclk = devm_clk_get(component->dev, "mclk");
sirf-audio-codec.c:	sirf_audio_codec->clk = devm_clk_get(&pdev->dev, NULL);
sta32x.c:	sta32x->xti_clk = devm_clk_get(dev, "xti");
tas571x.c:	priv->mclk = devm_clk_get(dev, "mclk");
tlv320aic32x4.c:	pll = devm_clk_get(component->dev, "pll");
tscs42xx.c:		tscs42xx->sysclk = devm_clk_get(&i2c->dev, src_names[src]);
tscs454.c:		freq = clk_get_rate(tscs454->sysclk);
tscs454.c:		tscs454->sysclk = devm_clk_get(&i2c->dev, src_names[src]);
wcd9335.c:	wcd->mclk = devm_clk_get(dev, "mclk");
wcd9335.c:	wcd->native_clk = devm_clk_get(dev, "slimbus");
wm2000.c:	wm2000->mclk = devm_clk_get(&i2c->dev, "MCLK");
wm8731.c:	wm8731->mclk = devm_clk_get(&spi->dev, "mclk");
wm8731.c:	wm8731->mclk = devm_clk_get(&i2c->dev, "mclk");
wm8904.c:	wm8904->mclk = devm_clk_get(&i2c->dev, "mclk");
wm8960.c:	wm8960->mclk = devm_clk_get(&i2c->dev, "mclk");
wm8962.c:	pdata->mclk = devm_clk_get(&i2c->dev, NULL);


