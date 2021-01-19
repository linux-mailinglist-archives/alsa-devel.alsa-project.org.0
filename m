Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDE82FC4F8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 00:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A33BC18B0;
	Wed, 20 Jan 2021 00:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A33BC18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611099785;
	bh=lMm9Zm9VRIsq1qN2ygyTciu4i+Mi3mRLA+Ig65Ghwc0=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y9FPBcGR9VZqEvcSZkNzPvT9/oY+yUFnjrVGuLsHbsDMoNdneuoKm+V0rx10oXOt5
	 EBMlQZfCAECqLuyX2tBXOFzBHHEu5n8ziEJwyP1DFZVIvl7LJ2ykOehJw3k9H2lfnK
	 kPFWYXC/nBH4+i8eAywLDXQSSh2y3FYKDSyHecck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F57F80117;
	Wed, 20 Jan 2021 00:41:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43B93F80257; Wed, 20 Jan 2021 00:41:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from omr.mail.isx.net.nz (omr.mail.isx.net.nz [111.65.230.130])
 (using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A0E5F80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A0E5F80137
Received: from [10.36.0.145] (unknown [27.252.196.81])
 (Authenticated sender: eliot@blennerhassett.gen.nz)
 by omr.mail.isx.net.nz (Postfix) with ESMTPA id 8A1E0AE6B31;
 Wed, 20 Jan 2021 12:41:18 +1300 (NZDT)
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Subject: ASoC: simple-card, fsl-sai, ak4458, imx-ak4458
Message-ID: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
Date: Wed, 20 Jan 2021 12:41:18 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, daniel.baluta@nxp.com, kuninori.morimoto.gx@renesas.com,
 Delio Brignoli <dbrignoli@audioscience.com>
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

Greetings,

late last year I worked on a project using $SUBJECT. That has been
suspended at least for now, so I'm writing these notes to my future
self, or anyone else who may want to tread the same path.
I'm happy to expand on explanation, or work on patches if anyone is
interested.

Background:

Normally, fsl-sai is used with the platform-specific imx-ak4458 (afaik
only in vendor tree).

However, our project wished to be able use pcm1789 which has no imx
specific driver so I started trying to use simple-card with the generic
ak4458 driver.  I encountered a some of problems doing this:


------------------------------------------------------------------------
1) Reset polarity of ak4458.

When imx-ak4458 is used, the platform driver handles the codec reset
specified in DT
	compatible = "fsl,imx-audio-ak4458";
	ak4458,pdn-gpio = <&gpio4 20 GPIO_ACTIVE_LOW>;

Used here. Afaics gpio_set_value sets the raw value given, ignoring the
polarity specified by the DT?

	gpio_set_value_cansleep(priv->pdn_gpio, 0);
	usleep_range(1000, 2000);
	gpio_set_value_cansleep(priv->pdn_gpio, 1);
	usleep_range(1000, 2000);


The codec driver reset code is not used.



When simple-card is used, the codec driver handles reset, specified like:
	compatible = "asahi-kasei,ak4458";
	reset-gpios  = <&gpio4 20 GPIO_ACTIVE_LOW>;

and used here (inverse for power on)
static void ak4458_power_off(struct ak4458_priv *ak4458)
{
	if (ak4458->reset_gpiod) {
		gpiod_set_value_cansleep(ak4458->reset_gpiod, 0);
		usleep_range(1000, 2000);
	}
}

My understanding of gpiod functions is that value being set is the
*logical* value of the GPIO. I.e. setting an active low gpio to 0 will
set the hardware pin high.
So it appears that the power_off and power_on functions are doing the
opposite of what is intended.
This is borne out by my hardware working correctly when the


------------------------------------------------------------------------
2) Clock rate setting with simple-card

When simple-card is used and DT specifies mclk fs:
	simple-audio-card,mclk-fs = <256>;

asoc_simple_hw_params() calls snd_soc_dai_set_sysclk(..., clk_id=0, ...)

The hard-coded clk_id=0 doesn't work with fsl-sai, which requires clk_id==1.

For my testing purposes I changed the hard-coded value, but I think the
proper solution could be to add a DT property to specify the clk_id
(default=0) ?


------------------------------------------------------------------------
3) Memory mapped stream access by aplay does not work.
This precludes use of alsa plugins e.g. dmix

I have found no reason or solution for this so far

------------------------------------------------------------------------
4) Unable to get multiple source clocks working with fsl-sai

With a single assigned-clock, switching between 48k and 44k1 clock rate
families is accomplished by reparenting the root clock to the
appropriate audio pll clock.

&sai2 {
	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
	assigned-clocks        = <&clk IMX8MM_CLK_SAI2>;
	assigned-clock-rates   = <12288000>;
	...
};



However if two of the sai mclks could be set to 48k and 44k1 derived
rates respectively, the clock reparenting would not be required, and
fsl_sai_set_bclk() would search the mclks and choose the appropriate
mclk for the requested rate.

DT would be something like this:

&sai2 {
	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>, <&clk
IMX8MM_AUDIO_PLL2_OUT>;
	assigned-clocks        = <&clk IMX8MM_CLK_SAI2>,       <&clk
IMX8MM_CLK_SAI1>;
	assigned-clock-rates   = <12288000>,                   <11289600>;
};

This setup doesn't work as I hoped it would, don't know why not.

regards

-- 
Eliot Blennerhassett

