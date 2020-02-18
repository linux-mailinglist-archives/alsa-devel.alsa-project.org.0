Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAB16297C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 16:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0C71690;
	Tue, 18 Feb 2020 16:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0C71690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582040047;
	bh=nclSHjLYccvgwHZomC+w1jjFHcCyZkWP79A3CjaZwZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dwvm8KN/izv6tP2lusfna6NU73UY9j6YSL7fgTStRTaqwp9jAVJyUaz9DmwglccPH
	 37jb+vqibLx5F0HF773Zqr6zRVMNqH53PG8xJLbjnpLru7Yh61V1w/KBWIkwZAdKrb
	 MHCsMHcMyuNIynR6RiZUklqcLRrkko2kyK9EGIdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92E08F8014C;
	Tue, 18 Feb 2020 16:32:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FA72F8014A; Tue, 18 Feb 2020 16:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id E8656F80145
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 16:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8656F80145
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 069CF8043;
 Tue, 18 Feb 2020 15:32:58 +0000 (UTC)
Date: Tue, 18 Feb 2020 07:32:11 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
Message-ID: <20200218153211.GI35972@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 15:16]:
> On 18/02/2020 1.23, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200214 13:30]:
> >> Hi Tony,
> >>
> >> On 12/02/2020 16.46, Tony Lindgren wrote:
> >>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
> >>>> On 11/02/2020 20.10, Tony Lindgren wrote:
> >>>>> +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
> >>>>> +				    unsigned int tx_mask, unsigned int rx_mask,
> >>>>> +				    int slots, int slot_width)
> >>>>> +{
> >>>>> +	struct snd_soc_component *component = dai->component;
> >>>>> +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
> >>>>> +	int err, ts_mask, mask;
> >>>>> +	bool voice_call;
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Primitive test for voice call, probably needs more checks
> >>>>> +	 * later on for 16-bit calls detected, Bluetooth headset etc.
> >>>>> +	 */
> >>>>> +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
> >>>>> +		voice_call = true;
> >>>>> +	else
> >>>>> +		voice_call = false;
> >>>>
> >>>> You only have voice call if only rx slot0 is in use?
> >>>
> >>> Yeah so it seems. Then there's the modem to wlcore bluetooth path that
> >>> I have not looked at. But presumably that's again just configuring some
> >>> tdm slot on the PMIC.
> >>>
> >>>> If you record mono on the voice DAI, then rx_mask is also 1, no?
> >>>
> >>> It is above :) But maybe I don't follow what you're asking here
> >>
> >> If you arecrod -Dvoice_pcm -c1 -fS8 > /dev/null
> >> then it is reasonable that the machine driver will set rx_mask = 1
> >>
> >>> and maybe you have some better check in mind.
> >>
> >> Not sure, but relying on set_tdm_slots to decide if we are in a call
> >> case does not sound right.
> > 
> > OK yeah seems at least bluetooth would need to be also handled
> > in the set_tdm_slots.
> 
> set_tdm_slots() is for setting how the TDM slots supposed to be used by
> the component and not really for things to configure different operating
> modes.
> 
> If you hardwire things in set_tdm_slots() for the droid4 then how the
> codec driver can be reused in other setups?

Right, I'm all go for better solutions :)

> >>>> You will also set the sampling rate for voice in
> >>>> cpcap_voice_hw_params(), but that is for normal playback/capture, right?
> >>>
> >>> Yeah so normal playback/capture is already working with cpcap codec driver
> >>> with mainline Linux. The voice call needs to set rate to 8000.
> >>
> >> But if you have a voice call initiated should not the rate be set by the
> >> set_sysclk()?
> > 
> > Hmm does set_sysclk called from modem codec know that cpcap codec
> > is the clock master based on bitclock-master and set the rate
> > for cpcap codec?
> 
> Neither component should call set_sysclk, set_tdm_slots. The machine
> driver should as it is the only one who know how things are wired...

OK, but so what's the machine driver part in this case?

Regards,

Tony

