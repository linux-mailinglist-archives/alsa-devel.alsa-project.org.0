Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5110CC11
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 16:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB8C16E6;
	Thu, 28 Nov 2019 16:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB8C16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574956127;
	bh=sPfTodoeJaxOVWLljR3OiHwpK91mP36+2ICnCEpcsNw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b06jLh+r9WHNUX3ve53oUjgePe51EwrLpBd+pSGNlzlIvPz3akYx0+6RAbPDYCR+G
	 j5eQxfL5hWDCUudEEgZoeusQ0k6rQIEJD3lCoYi6GkONPA4LRXdRU5WVmU3ZR6EUww
	 9obL+Q3+uwOk9ZlJXGQvxbe8jSpCoDP0r/AjQJp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D25CF801DA;
	Thu, 28 Nov 2019 16:47:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21443F80149; Thu, 28 Nov 2019 16:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E211F800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 16:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E211F800CB
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id A096F20C5462; Thu, 28 Nov 2019 16:46:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su A096F20C5462
Date: Thu, 28 Nov 2019 16:46:55 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20191128154655.GA12652@xn--80adja5bqm.su>
References: <s5hef1dthbk.wl-tiwai@suse.de>
 <20190822203031.GA22363@xn--80adja5bqm.su>
 <s5h5zmg48u2.wl-tiwai@suse.de>
 <20190829103805.GA1525@xn--80adja5bqm.su>
 <s5hsgpk2os6.wl-tiwai@suse.de>
 <20190830114510.GA10027@xn--80adja5bqm.su>
 <20191125173902.GA27981@xn--80adja5bqm.su>
 <s5h4kypy2v8.wl-tiwai@suse.de>
 <20191127161757.GC7065@xn--80adja5bqm.su>
 <s5hpnhduv95.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hpnhduv95.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
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

On Wed, Nov 27, 2019 at 05:41:42PM +0100, Takashi Iwai wrote:
[...]
> > This is unlikely as I do not have Windows or any other OS installed on this
> > system. I dug through the thread and found the following:
> > 
> > > > > set(0x01, 0x717,   0x02) # 0x01071702 (SET_GPIO_DIRECTION)
> > > >
> > > > This needs the paired SET_GPIO_DATA for a proper operation.  Your
> > > > analysis implicit assumes some default value that is already set by
> > > > the hardware.
> > >
> > >If I understand it correctly, then "some value" is zero on my hardware:
> > >
> > > # hda-verb /dev/snd/hwC0D0 0x01 GET_GPIO_DATA 0x02
> > > nid = 0x1, verb = 0xf15, param = 0x2
> > > value = 0x0
> > > 
> > > Meanwhile I also figured out that /proc/asound/card0/codec#0 is
> > > providing this info as well:
> > >
> > >  IO[1]: enable=0, dir=1, wake=0, sticky=0, data=0, unsol=0
> > >
> > > So the value seems to be 0 and I can add an explicit SET_GPIO_DATA verb quirk
> > > to set it in addition to SET_GPIO_DIRECTION, right?
> > 
> > You then helped me, explaining how I could properly initialize it, which I 
> > incorporated in the original patch.
> > 
> > So we did check that and I am positive that the LFE did work back then, which 
> > really confuses me now.
> 
> Hm, I don't know what happened then.  In most cases, the value wasn't
> correctly reflected when you actually checked (e.g. the runtime PM was
> triggered and it was cleared by some reason or such...)

I see... it's fine as long as it does not flip again on 5.4 at some later point,
otherwise I'd feel somewhat embarrased asking you to switch it back and forth :)

Should it indeed happen, then some deeper investigation would be
in order, but since you wrote that the new data value anyway makes much more 
sense now, then let's hope it will not change anymore.

> > > Please make sure that which value actually is on and which is off.
> > > You can change the GPIO bit dynamically via hda-verb, so you can check
> > > whether the speaker works or not at each flip.
> > 
> > OK, so the starting point (now with my local update to the driver):
> > # hda-verb /dev/snd/hwC0D0 0x01 GET_GPIO_DATA 0x02
> > nid = 0x1, verb = 0xf15, param = 0x2
> > value = 0x2
> > 
> > >From /proc/asound/card0/codec#0:
> > 
> > State of AFG node 0x01:
> >   Power states:  D0 D1 D2 D3 CLKSTOP
> >   Power: setting=D0, actual=D0
> > GPIO: io=2, o=0, i=0, unsolicited=1, wake=0
> >   IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
> >   IO[1]: enable=1, dir=1, wake=0, sticky=0, data=1, unsol=0
> > 
> > Pulse profile "Analog Surround 5.1 Output + Analog Stereo Input" is active,
> > speaker test (via the pulse/sound applet UI) delives audible noise on the LFE.
> > 
> > I'm flipping data in hda-analyzer now and rechecking afterwards:
> > 
> > # hda-verb /dev/snd/hwC0D0 0x01 GET_GPIO_DATA 0x02
> > nid = 0x1, verb = 0xf15, param = 0x2
> > value = 0x0
> > 
> > And:
> > State of AFG node 0x01:
> >   Power states:  D0 D1 D2 D3 CLKSTOP
> >   Power: setting=D0, actual=D0
> > GPIO: io=2, o=0, i=0, unsolicited=1, wake=0
> >   IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
> >   IO[1]: enable=1, dir=1, wake=0, sticky=0, data=0, unsol=0
> > 
> > LFE is no longer audible in speaker test.
> > 
> > Reenabling again, this time I just used hda-verb directly:
> > # hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x02
> > nid = 0x1, verb = 0x715, param = 0x2
> > value = 0x0
> > 
> > And checking:
> > # hda-verb /dev/snd/hwC0D0 0x01 GET_GPIO_DATA 0x02
> > nid = 0x1, verb = 0xf15, param = 0x2
> > value = 0x2
> > 
> > LFE becomes audible again.
> 
> OK, so it's clear now that the bit on turns on the LFE amp.

Yes, this is what I am observing with the current setup.
 
> > Now, if that would help, I could try to install Fedora 29 on some external
> > harddrive and reproduce my summer setup, to confirm that it has been working 
> > with data pin disabled. Alltough I am certain that it was the case, because
> > I retested this several times prior to submitting the patch.
> > 
> > Question is, if we would learn something from that?
> > 
> > How should I proceed? Just submit an update to have the data pin active on
> > init or is this weirdness worth debugging?
> 
> The patch like below should work, I suppose?
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -8424,6 +8424,8 @@ static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
>  	case HDA_FIXUP_ACT_PRE_PROBE:
>  		snd_hda_jack_detect_enable_callback(codec, 0x1b,
>  				alc662_aspire_ethos_mute_speakers);
> +		/* subwoofer needs an extra GPIO setting to become audible */
> +		alc_setup_gpio(codec, 0x02);
>  		break;
>  	case HDA_FIXUP_ACT_INIT:
>  		/* Make sure to start in a correct state, i.e. if
> @@ -8506,7 +8508,6 @@ enum {
>  	ALC662_FIXUP_USI_HEADSET_MODE,
>  	ALC662_FIXUP_LENOVO_MULTI_CODECS,
>  	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
> -	ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER,
>  	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
>  };
>  
> @@ -8838,18 +8839,6 @@ static const struct hda_fixup alc662_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc662_fixup_aspire_ethos_hp,
>  	},
> -	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER] = {
> -		.type = HDA_FIXUP_VERBS,
> -		/* subwoofer needs an extra GPIO setting to become audible */
> -		.v.verbs = (const struct hda_verb[]) {
> -			{0x01, AC_VERB_SET_GPIO_MASK, 0x02},
> -			{0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02},
> -			{0x01, AC_VERB_SET_GPIO_DATA, 0x00},
> -			{ }
> -		},
> -		.chained = true,
> -		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
> -	},
>  	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = (const struct hda_pintbl[]) {
> @@ -8859,7 +8848,7 @@ static const struct hda_fixup alc662_fixups[] = {
>  			{ }
>  		},
>  		.chained = true,
> -		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER
> +		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
>  	},
>  };
>

Yes! I tested it vs a6ed68d6468bd5a3da78a103344ded1435fed57a in
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git (which
was the most recent commit on the master branch at that time) and it
works fine, LFE is audible. Could you please apply it?

Thanks a lot for the help! I hope this notebooks sound won't make any
further problems :)

Kind regards,
Sergey



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
