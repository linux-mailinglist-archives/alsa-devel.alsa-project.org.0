Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEA7B983
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 08:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38C71721;
	Wed, 31 Jul 2019 08:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38C71721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564553453;
	bh=mPmfRqccCnys7yNNUHBZnQzn/y5sXmiXbLSZFrfFmtk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8AfBjXcBb7PhV6NabICs/Qe2KsAzKTbuLVHN93jAZgaRXV2KNoT0R5TRQ41n+B67
	 8I4cBA/yWE4H209oiv233QhJ4Wva1gM16hD+UpUgbrcI+56s0v8SBNmTge8loN705s
	 85H5YY4w3UfTVa/iDK7lQhfpw36buNik+0mZc2+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF4A7F8048E;
	Wed, 31 Jul 2019 08:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ECC9F80483; Wed, 31 Jul 2019 08:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 180D1F80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 08:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180D1F80214
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hshlD-0001W1-99; Wed, 31 Jul 2019 08:06:51 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hshl6-0004Dx-RL; Wed, 31 Jul 2019 08:06:44 +0200
Date: Wed, 31 Jul 2019 08:06:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190731060644.yrewu2kvrlootyyl@pengutronix.de>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
 <20190730145844.GI4264@sirena.org.uk>
 <fe11c806-2285-558c-e35c-d8f61de00784@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe11c806-2285-558c-e35c-d8f61de00784@codethink.co.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:04:35 up 74 days, 12:22, 46 users,  load average: 0.05, 0.07, 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Annaliese McDermond <nh6z@nh6z.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Patrick Glaser <pglaser@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Nate Case <ncase@tesla.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Hi Thomas,

again sorry for jumping in..

On 19-07-30 18:26, Thomas Preston wrote:
> On 30/07/2019 15:58, Mark Brown wrote:
> > On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:
> > 
> >> index 000000000000..0f82a88bc1a4
> >> --- /dev/null
> >> +++ b/sound/soc/codecs/tda7802.c
> >> @@ -0,0 +1,509 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * tda7802.c  --  codec driver for ST TDA7802
> > 
> > Please make the entire comment a C++ one so this looks intentional.
> > 
> 
> Ok thanks.
> 
> >> +static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
> >> +{
> >> +	const u8 mute_disabled = mute ? 0 : IB2_DIGITAL_MUTE_DISABLED;
> > 
> > Please write normal conditional statements to make the code easier to
> > read.
> > 
> 
> On it.
> 
> >> +	case SND_SOC_BIAS_STANDBY:
> >> +		err = regulator_enable(tda7802->enable_reg);
> >> +		if (err < 0) {
> >> +			dev_err(component->dev, "Could not enable.\n");
> >> +			return err;
> >> +		}
> >> +		dev_dbg(component->dev, "Regulator enabled\n");
> >> +		msleep(ENABLE_DELAY_MS);
> > 
> > Is this delay needed by the device or is it for the regulator to ramp?
> > If it's for the regulator to ramp then the regulator should be doing it.
> > 
> 
> According to the datasheet the device itself takes 10ms to rise from 0V
> after PLLen is enabled. There are additional rise times but they are
> negligible with default capacitor configuration (which we have).
> 
> Good to know about the regulator rising configuration though. Thanks.

Isn't it the regulator we mentioned to not use that because it is a
GPIO?

Regards,
  Marco

> >> +	case SND_SOC_BIAS_OFF:
> >> +		regcache_mark_dirty(component->regmap);
> > 
> > If the regulator is going off you should really be marking the device as
> > cache only.
> > 
> 
> Got it, thanks.
> 
> >> +		err = regulator_disable(tda7802->enable_reg);
> >> +		if (err < 0)
> >> +			dev_err(component->dev, "Could not disable.\n");
> > 
> > Any non-zero value from regulator_disable() is an error, there's similar
> > error checking issues in other places.
> > 
> 
> I return the error at the end of the function, but I'll bring it back here
> for consistency.
> 
> >> +static const struct snd_kcontrol_new tda7802_snd_controls[] = {
> >> +	SOC_SINGLE("Channel 4 Tristate", TDA7802_IB0, 7, 1, 0),
> >> +	SOC_SINGLE("Channel 3 Tristate", TDA7802_IB0, 6, 1, 0),
> >> +	SOC_SINGLE("Channel 2 Tristate", TDA7802_IB0, 5, 1, 0),
> >> +	SOC_SINGLE("Channel 1 Tristate", TDA7802_IB0, 4, 1, 0),
> > 
> > These look like simple on/off switches so should have Switch at the end
> > of the control name.  It's also not clear to me why this is exported to
> > userspace - why would this change at runtime and won't any changes need
> > to be coordinated with whatever else is connected to the signal?
> > 
> >> +	SOC_ENUM("Mute time", mute_time),
> >> +	SOC_SINGLE("Unmute channels 1 & 3", TDA7802_IB2, 4, 1, 0),
> >> +	SOC_SINGLE("Unmute channels 2 & 4", TDA7802_IB2, 3, 1, 0),
> > 
> > These are also Switch controls.  There are *lots* of problems with
> > control names, see control-names.rst.
> > 
> 
> Ok thanks, I didn't know about the "Switch" suffix, I will read
> control-names.rst.
> 
> I will move Tristate to DT properties. I was also unsure about the
> Impedance Efficiency Optimiser but the datasheet doesn't go into much
> detail about this so I left it exposed.
> 
> They both seemed like user configurable options in the context of a
> test rig, but I agree - who knows what this output might be connected
> to in other systems. I will lock them down in DT. Thanks.
> 
> >> +static const struct snd_soc_component_driver tda7802_component_driver = {
> >> +	.set_bias_level = tda7802_set_bias_level,
> >> +	.idle_bias_on = 1,
> > 
> > Any reason to keep the device powered up?  It looks like the power on
> > process is just powering things up and writing the register cache out
> > and there's not that many registers so the delay is trivial.
> > 
> 
> Ah no, I think that's a mistake. I want the PLLen to switch off in
> idle/suspend and the device should restore on wake.
> 
> >> +	tda7802->enable_reg = devm_regulator_get(dev, "enable");
> >> +	if (IS_ERR(tda7802->enable_reg)) {
> >> +		dev_err(dev, "Failed to get enable regulator\n");
> > 
> > It's better to print error codes if you have them and are printing a
> > diagnostic so people have more to go on when debugging problems.
> 
> Yep on it.
> 
> Many thanks, I appreciate the feedback.
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
