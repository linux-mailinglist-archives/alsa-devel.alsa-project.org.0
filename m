Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348FD4213F8
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 18:22:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9675F1675;
	Mon,  4 Oct 2021 18:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9675F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633364564;
	bh=ungWKopc25U9zLmTGFSVX7ebllJKMe5qNfozGGg+2YE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzMr3TlS7BTSkAPo6CubXth2sO9DAIRm4rOkeo1vjgSyj9ycCtRxA7yRlB1PXUL9/
	 D9I3dLWIy+NfwUwBYEaHecmNKEvRbViW4IN0LM8eU0XXFa8pLhhjMjsbU2SjwJxLf1
	 OIlF5ZyS+qw7IVycPEgSQulDCPvpkqsVmfKEgPVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03594F80249;
	Mon,  4 Oct 2021 18:21:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E1B9F80240; Mon,  4 Oct 2021 18:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A85F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 18:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A85F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="jMj/gjn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1633364480;
 x=1664900480; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=2TKID2Za9GYSOg5AoELfLrsUZguAVKMjn7pS3vDuwr0=;
 b=jMj/gjn3fnJ61SnfRivxWwDc13VYWUyykdvLjnPh+UX23gLSUvNPro89
 HXMSsjeqU5Th0qotmh7AfhMpvQLPc0crixupNmOJBDsyRjvZ5jmWrHYnW
 7bNkkAnbAOSMMbV1NFa605P5TgqSo06yaxftGpFrsTFmtki3ghYm/oW81
 17C1scW1SBo0tW4cjJAynw7qQ7f/ev87XQantqOIruueflDkAqiClL7fr
 0vMbleYgpZR0HiNf9r8Y3GQfiWEMQDBk1Yc8znrn2Qi59oUPr5dXs2dRQ
 W6xqjY2KyCyMlVA3A1hPTNjyT0A5ScLiDcYM5XbcdDiSj7w/msNbFnP0P w==;
Date: Mon, 4 Oct 2021 18:21:10 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
In-Reply-To: <YVsETxqzhZI8Fb6D@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail08w.axis.com (10.20.40.14) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


Thanks for your prompt review Mark!

On Mon, 4 Oct 2021, Mark Brown wrote:

> On Mon, Oct 04, 2021 at 11:19:21AM +0200, Ricard Wanderlof wrote:
> 
> There's an awful lot of code in here that just doesn't really look like
> a normal Linux driver or follow conventions for ASoC, just from a quick
> visual overview without actually reading anything it's fairly clear the
> driver needs quite a bit of a refresh for mainline.

To a large extent this is because I've retained as much of the original 
driver as possible, only changing things that seemed absolutely necessary.
However your remark makes it clear that this is a less than successful 
strategy so I'll make a general overhaul based on your remarks, and 
resubmit.

A few specific questions below, however:

> > +++ b/sound/soc/codecs/tlv320adc3xxx.c
> > @@ -0,0 +1,1239 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Based on sound/soc/codecs/tlv320aic3x.c by  Vladimir Barinov
> 
> Please make the entire comment a C++ one so things look more
> intentional.

Ok, I'll change this. I was trying to follow the style of existing 
drivers, as the majority seem to have C style header comments even though 
the SPDX line uses C++. I'm now guessing this is for legacy reasons 
(minimizing changes in existing drivers when the SPDX line was added)?

> > +static bool adc3xxx_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case PAGE_SELECT: /* required by regmap implementation */
> 
> This is not required by regmap.

Ok, I'll remove it. The regmap code was taken from tlv320aic3x.c which has 
a similar paging structure, but I see now that other drivers don't have 
this, so I guess it's not necessary for tlv320aic3x.c either and is there 
either erroneously or because it once was necessary?

> > +static const char * const micbias_voltage[] = { "off", "2V", "2.5V", 
> > "AVDD" };
> 
> This should be configured in the DT, it's going to be a property of the
> electrical design of the system.

I can very well imagine that this something that should be runtime 
userspace configurable. In fact where I work we have had products where 
the bias voltage (for an externally connected microphone) could be 
configured by the end user, (although not for this specific driver quite 
honestly, we have had the need for hardware engineers to change it runtime 
during circuit verification though).

Would it be ok to have this configurable both in the DT as well as using a 
control? Or should it be implemented in another way, such as a number of 
pre set voltages that are selected between using a control?

> > +static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
> > +	SOC_DOUBLE_R_TLV("PGA Gain Volume", LEFT_APGA_CTRL, RIGHT_APGA_CTRL,
> > +			 0, 80, 0, pga_tlv),
> 
> s/Gain //

But this would mean that the resulting control will be exposed as 
"PGA" when viewed in amixer as an scontrol which seems less than intutive, 
but perhaps there's nothing that can be done about that (other than 
perhaps expanding PGA to Programmable Gain Amplifier perhaps)?

> > +		/* Switch on NADC Divider */
> > +		snd_soc_component_update_bits(component, ADC_NADC,
> > +					      ENABLE_NADC, ENABLE_NADC);
> > +
> > +		/* Switch on MADC Divider */
> > +		snd_soc_component_update_bits(component, ADC_MADC,
> > +					      ENABLE_MADC, ENABLE_MADC);
> 
> Why are these not managed through DAPM?

The simple answer is that the driver was originally written like this and 
I saw no reason to change it.

> > +	adc3xxx->mclk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(adc3xxx->mclk)) {
> > +		if (PTR_ERR(adc3xxx->mclk) != -ENOENT)
> > +			return PTR_ERR(adc3xxx->mclk);
> > +		/* Make a note that there is no mclk specified. */
> > +		adc3xxx->mclk = NULL;
> 
> Does the device work without a MCLK?

Yes, if so configured it can use the BCLK as the source clock for the 
clock generation using the internal PLL.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
