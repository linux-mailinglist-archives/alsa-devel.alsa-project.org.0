Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA67AFE9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 19:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BFA17AA;
	Tue, 30 Jul 2019 19:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BFA17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564507799;
	bh=IFHOeo0H+jRDzg2h3+DCsqM/hVJM5XcafOGIObFK00o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XFelzUBsyYsarb9Lpg4ixv/E+5dF9GiAFtWtI+aAOAmZ19QHwv33gVKQ3M5PddVyY
	 DzIx1Oa6lOR7WW6rTqoGMvZgXuYFWB3Y4qNgCpQZI0pnnFxEMUARTnaEmCBYPRAX9d
	 izmezHJ1H0Xajl3z6XHqGWyA2DanOb+LS5trsa9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD98F804CA;
	Tue, 30 Jul 2019 19:28:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D97BAF804CA; Tue, 30 Jul 2019 19:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2FEAF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FEAF800BF
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsVsz-00044M-Ve; Tue, 30 Jul 2019 18:26:06 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
 <20190730145844.GI4264@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <fe11c806-2285-558c-e35c-d8f61de00784@codethink.co.uk>
Date: Tue, 30 Jul 2019 18:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730145844.GI4264@sirena.org.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Patrick Glaser <pglaser@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Nate Case <ncase@tesla.com>,
 linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Add codec driver for ST
	TDA7802
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

On 30/07/2019 15:58, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:
> 
>> index 000000000000..0f82a88bc1a4
>> --- /dev/null
>> +++ b/sound/soc/codecs/tda7802.c
>> @@ -0,0 +1,509 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * tda7802.c  --  codec driver for ST TDA7802
> 
> Please make the entire comment a C++ one so this looks intentional.
> 

Ok thanks.

>> +static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
>> +{
>> +	const u8 mute_disabled = mute ? 0 : IB2_DIGITAL_MUTE_DISABLED;
> 
> Please write normal conditional statements to make the code easier to
> read.
> 

On it.

>> +	case SND_SOC_BIAS_STANDBY:
>> +		err = regulator_enable(tda7802->enable_reg);
>> +		if (err < 0) {
>> +			dev_err(component->dev, "Could not enable.\n");
>> +			return err;
>> +		}
>> +		dev_dbg(component->dev, "Regulator enabled\n");
>> +		msleep(ENABLE_DELAY_MS);
> 
> Is this delay needed by the device or is it for the regulator to ramp?
> If it's for the regulator to ramp then the regulator should be doing it.
> 

According to the datasheet the device itself takes 10ms to rise from 0V
after PLLen is enabled. There are additional rise times but they are
negligible with default capacitor configuration (which we have).

Good to know about the regulator rising configuration though. Thanks.

>> +	case SND_SOC_BIAS_OFF:
>> +		regcache_mark_dirty(component->regmap);
> 
> If the regulator is going off you should really be marking the device as
> cache only.
> 

Got it, thanks.

>> +		err = regulator_disable(tda7802->enable_reg);
>> +		if (err < 0)
>> +			dev_err(component->dev, "Could not disable.\n");
> 
> Any non-zero value from regulator_disable() is an error, there's similar
> error checking issues in other places.
> 

I return the error at the end of the function, but I'll bring it back here
for consistency.

>> +static const struct snd_kcontrol_new tda7802_snd_controls[] = {
>> +	SOC_SINGLE("Channel 4 Tristate", TDA7802_IB0, 7, 1, 0),
>> +	SOC_SINGLE("Channel 3 Tristate", TDA7802_IB0, 6, 1, 0),
>> +	SOC_SINGLE("Channel 2 Tristate", TDA7802_IB0, 5, 1, 0),
>> +	SOC_SINGLE("Channel 1 Tristate", TDA7802_IB0, 4, 1, 0),
> 
> These look like simple on/off switches so should have Switch at the end
> of the control name.  It's also not clear to me why this is exported to
> userspace - why would this change at runtime and won't any changes need
> to be coordinated with whatever else is connected to the signal?
> 
>> +	SOC_ENUM("Mute time", mute_time),
>> +	SOC_SINGLE("Unmute channels 1 & 3", TDA7802_IB2, 4, 1, 0),
>> +	SOC_SINGLE("Unmute channels 2 & 4", TDA7802_IB2, 3, 1, 0),
> 
> These are also Switch controls.  There are *lots* of problems with
> control names, see control-names.rst.
> 

Ok thanks, I didn't know about the "Switch" suffix, I will read
control-names.rst.

I will move Tristate to DT properties. I was also unsure about the
Impedance Efficiency Optimiser but the datasheet doesn't go into much
detail about this so I left it exposed.

They both seemed like user configurable options in the context of a
test rig, but I agree - who knows what this output might be connected
to in other systems. I will lock them down in DT. Thanks.

>> +static const struct snd_soc_component_driver tda7802_component_driver = {
>> +	.set_bias_level = tda7802_set_bias_level,
>> +	.idle_bias_on = 1,
> 
> Any reason to keep the device powered up?  It looks like the power on
> process is just powering things up and writing the register cache out
> and there's not that many registers so the delay is trivial.
> 

Ah no, I think that's a mistake. I want the PLLen to switch off in
idle/suspend and the device should restore on wake.

>> +	tda7802->enable_reg = devm_regulator_get(dev, "enable");
>> +	if (IS_ERR(tda7802->enable_reg)) {
>> +		dev_err(dev, "Failed to get enable regulator\n");
> 
> It's better to print error codes if you have them and are printing a
> diagnostic so people have more to go on when debugging problems.

Yep on it.

Many thanks, I appreciate the feedback.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
