Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C015AB3E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 15:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA8F167A;
	Wed, 12 Feb 2020 15:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA8F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581518909;
	bh=CvB7LaFDJvzxDSEteabJzqmvbFbIAwbvIhklu9vY6kg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qc5Yz5fTwHUw2LImOsO4gHm4BrDyO9r2DaUdKYJN8WRG0W7j5ckxHbLl1ncT0t2xu
	 mNlSXD0tJc6NdR8ZLcDvAJ5dlT/mPkSPNaEnFaHtd2M66F6MeyiItbvjPg/6rwFE6N
	 inwm5QzVWWd79ScaEYIXVJyX1pSRpBIo6hMoUtNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4921BF80158;
	Wed, 12 Feb 2020 15:46:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37EBBF80157; Wed, 12 Feb 2020 15:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 2160AF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 15:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2160AF80125
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 4A8A680F6;
 Wed, 12 Feb 2020 14:47:07 +0000 (UTC)
Date: Wed, 12 Feb 2020 06:46:20 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20200212144620.GJ64767@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cpcap: Implement set_tdm_slot for
 voice call support
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

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
> On 11/02/2020 20.10, Tony Lindgren wrote:
> > +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
> > +				    unsigned int tx_mask, unsigned int rx_mask,
> > +				    int slots, int slot_width)
> > +{
> > +	struct snd_soc_component *component = dai->component;
> > +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
> > +	int err, ts_mask, mask;
> > +	bool voice_call;
> > +
> > +	/*
> > +	 * Primitive test for voice call, probably needs more checks
> > +	 * later on for 16-bit calls detected, Bluetooth headset etc.
> > +	 */
> > +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
> > +		voice_call = true;
> > +	else
> > +		voice_call = false;
> 
> You only have voice call if only rx slot0 is in use?

Yeah so it seems. Then there's the modem to wlcore bluetooth path that
I have not looked at. But presumably that's again just configuring some
tdm slot on the PMIC.

> If you record mono on the voice DAI, then rx_mask is also 1, no?

It is above :) But maybe I don't follow what you're asking here and
maybe you have some better check in mind.

I have no idea where we would implement recording voice calls for
example, I guess mcbsp could do that somewhere to dump out a tdm slot
specific traffic.

> > +
> > +	ts_mask = 0x7 << CPCAP_BIT_MIC2_TIMESLOT0;
> > +	ts_mask |= 0x7 << CPCAP_BIT_MIC1_RX_TIMESLOT0;
> > +
> > +	mask = (tx_mask & 0x7) << CPCAP_BIT_MIC2_TIMESLOT0;
> > +	mask |= (rx_mask & 0x7) << CPCAP_BIT_MIC1_RX_TIMESLOT0;
> > +
> > +	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
> > +				 ts_mask, mask);
> > +	if (err)
> > +		return err;
> > +
> > +	err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, slot_width * 1000);
> > +	if (err)
> > +		return err;
> 
> You will also set the sampling rate for voice in
> cpcap_voice_hw_params(), but that is for normal playback/capture, right?

Yeah so normal playback/capture is already working with cpcap codec driver
with mainline Linux. The voice call needs to set rate to 8000.

> > +
> > +	err = cpcap_voice_call(cpcap, dai, voice_call);
> > +	if (err)
> > +		return err;
> 
> It feels like that these should be done via DAPM with codec to codec route?

Sure if you have some better way of doing it :) Do you have an example to
point me to?

Regards,

Tony
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
