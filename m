Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7970A643
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 10:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C14D1EF;
	Sat, 20 May 2023 10:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C14D1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684569841;
	bh=7++HRKLZoY20CUz8KBwftjhcXwHWEPruDg1vbOrCM5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O1QbDL/IoLJ1oOdlE7jylK6HIXxMalqvcgbM3WjHCXHrLgigp+8OIpbvL9fFEfS9A
	 GAHTT+wVE1iHxXXShhzjtItGDZZcBMtXObl4IN6RDpq8j4cQXMCTKuzYM7ivGQnT6K
	 hRv8bbk7UreXHL0Hc4WsuE0myZZQVmySlkweysNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FEF9F80549; Sat, 20 May 2023 10:03:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E22BF80272;
	Sat, 20 May 2023 10:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19793F80272; Sat, 20 May 2023 10:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB882F8016D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 10:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB882F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MLFKHk7t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XUH7ouRN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28E5E220FA;
	Sat, 20 May 2023 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684569768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6gTWkXUpkruRCLRRG0oZe0W3ZCW9vuUDKYJYeRpiB9w=;
	b=MLFKHk7tFfQjT/YAaE+/zAaFMd+09oooT8+HHvl5vnxDHOdrVl07hNeu33o4JU86c3DJrX
	G7wmm0RSlEuLWQm3MZjM5lIPnqwL45CEkPApDWLk9d9VoiBM217EJa0mStHjJsb6RAQqg6
	cTNhyCxMc9zuI9Fz829TPEgg6kdfWNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684569768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6gTWkXUpkruRCLRRG0oZe0W3ZCW9vuUDKYJYeRpiB9w=;
	b=XUH7ouRN4/7BMnJmpBPp6ssNlrvkcVW5TBRfYT2lXTF4DOklKKcMlMOOep4oDLB4N3xVAA
	+3CuiPEi5TBBUIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CBEA1358F;
	Sat, 20 May 2023 08:02:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Cug0Aqh+aGTYMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 08:02:48 +0000
Date: Sat, 20 May 2023 10:02:47 +0200
Message-ID: <87lehjzazc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: alsa-devel@alsa-project.org
Subject: Re: snd_hda_codec_cirrus kernel oops
In-Reply-To: <f421a23b-498f-9075-068b-3f0b2077427d@schinagl.nl>
References: <64d95eb0-dbdb-cff8-a8b1-988dc22b24cd@schinagl.nl>
	<87zg69appu.wl-tiwai@suse.de>
	<6afd694e-8810-8197-3dd0-831daf2130f3@schinagl.nl>
	<87bkikdt66.wl-tiwai@suse.de>
	<d6e3b9ea-f98f-6404-e1ee-6973d68b64c1@schinagl.nl>
	<87y1llhfzq.wl-tiwai@suse.de>
	<f96b9b82-8bfe-ad98-c7d8-b6d7ac401961@schinagl.nl>
	<87pm6w23s7.wl-tiwai@suse.de>
	<f421a23b-498f-9075-068b-3f0b2077427d@schinagl.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VPW5QCHX64SKEDFP4RJRF6KYWW7DSF5W
X-Message-ID-Hash: VPW5QCHX64SKEDFP4RJRF6KYWW7DSF5W
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPW5QCHX64SKEDFP4RJRF6KYWW7DSF5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 18:53:16 +0200,
Olliver Schinagl wrote:
> 
> Hey Takashi,
> 
> On 19-05-2023 09:12, Takashi Iwai wrote:
> > On Thu, 18 May 2023 17:11:53 +0200,
> > Olliver Schinagl wrote:
> >> 
> >> Hey Takashi,
> >> 
> >> On 18-05-2023 16:27, Takashi Iwai wrote:
> >>> On Thu, 18 May 2023 16:24:02 +0200,
> >>> Olliver Schinagl wrote:
> >>>> 
> >>>> Hey Takashi,
> >>>> 
> >>>> I've applied the patch you've listed below. Is there some 'fool-proof'
> >>>> way to produce _any_ output however? I've stopped pulse/pipe audio,
> >>>> and only use aplay + alsamixer. Back to basics as they say. For aplay,
> >>>> I use -D sysdefault:CARD=PCH (which was listed as a cirrus card with
> >>>> -L).
> >>>> 
> >>>> Alsamixer was used to ensure all volumes are open.
> >>>> 
> >>>> Without anything running, I was able to use hdajackretask to apply
> >>>> settings. But then, what to put. I get that I have to figure out, what
> >>>> is routed where (i'll try to find the schematic for the macbook pro
> >>>> 12,1), but hence my question, is there some way to produce something?
> >>>> In hdajackretask I've enabled all pins, overriden them all, and set
> >>>> them all to the same configuration. 'Internal, internal, speaker,
> >>>> other-analog, green, not-present, 1, front'. I figured, by setting up
> >>>> verything to the internal speaker, I must get sound out of something,
> >>>> but alas.
> >>>> 
> >>>> I also have a Macbook pro from 1 or 2 generations earlier, 11,2 afaik,
> >>>> where the sound still does work. I've used the same config
> >>>> hdajackretask showed was in use there, but (obviously?) that didn't
> >>>> work.
> >>>> 
> >>>> So I'm a bit grasping at straws. Trying _every_ combination is a bit much?
> >>> 
> >>> It's the hard part.  I'd try to copy the pin config of the existing
> >>> models at first, then try shooting one pin by one if it doesn't work.
> >> 
> >> Ok, so no easy way :) I did try copying things, but didn't get sound either.
> >> 
> >> I did find the schematics for the 2013 and 2014 models of the macbook;
> >> no luck yet on the 2015 (mine). But all 3 have the same model number
> >> (A1502), and looking at the schematic (not even sure if it is just a
> >> new revision, or actually for the different boards) they seem more or
> >> less identical. Especially on the audio part. The nice thing is it
> >> tells me what pins things are connected to :) But again, might not be
> >> a perfect match to my board (crosses fingers).
> >> 
> >> What is interesting, the schematics [0] actually list the HDA configuration.
> >> 
> >> CODEC OUTPUT SIGNAL PATHS
> >> 
> >> FUNCTION   VOLUME    CONVERTER  PIN COMPLEX  MUTE CONTROL
> >> 
> >> HP/HS OUT  0x02 (2)  0x02 (2)   0x10 (16)    N/A
> >> TWEETERS   0x03 (3)  0x03 (3)   0x12 (18)    CODEC GPIO0
> >> SUB        0x04 (4)  0x04 (4)   0x13 (19)    CODEC GPIO0
> >> SPDIF OUT  N/A       0x0e (14)  0x21 (33)    N/A
> >> 
> >> DMIC 1               0x09 (9)   0x1c (18)
> >> DMIC 2               0x09 (9)   0x1c (18)
> >> 
> >> HEADSET MIC          0x07 (7)   0x18 (24)
> >> 
> >> OTHER CODEC GPIO LINES
> >> LEFT SPEAKER ID      GPIO2 INPUT             HIGH = FG, LOW = MERRY
> >> RIGHT SPEAKER ID     GPIO3 INPUT             HIGH = FG, LOW = MERRY
> >> DFET CONTROL         GPIO4 OUTPUT            HIGH = DFETs OPEN
> >> 
> >> Granted, that should yield the same infomration I can copy from the
> >> other one, but I'm trying to understand what this would mean. Function
> >> is obvious, aswell as the pin-complex, it's what hdajackretasks calls
> >> pin ID. But the rest is a bit iffy. E.g. what would the volume column
> >> indicate? What about the 'converter'? And the GPIO's? Are the's GPIO's
> >> of the codec? Maybe my confusion mostly comes as I'm not sure how to
> >> relate those fields to hdajackretask.
> > 
> > It's a good information.
> > It corresponds to spec->gpio_eapd_speaker, and GPIO2 would be the bit
> > 0x04, GPIO3 would be 0x08, so it should be set to 0x0c.  The headphone
> > has no GPIO assignment, so spec->gpio_eapd_headphone=0.
> > 
> > But subwoofers seem to have the GPIO controls as well, and the gpio
> > bit 0x01 should be set.  For that, we'll need to modify cs_automute()
> > function.  But let's investigate this later.
> > 
> > FWIW, the GPIO bits can be flipped on the fly, too.  Use hda-verb for
> > setting SET_GPIO_MASK, SET_GPIO_DIRECTION and SET_GPIO_DATA.
> 
> Thanks for that explanation! Great news. I don't know how; but I
> managed to 'fix' the bios. Strange yeah. I wanted to create an uefi
> boot image as that's something arch's mkinitcpio appearantly
> supports. So I used efiboomgr to add an additional entry.
> 
> After a reboot, I regained the apple logo at boot (which was gone for
> ages), but also the boot chime returned. And for sure, in Linux also
> sound is working again normally. I have no idea how or why this works,
> but it does.
> 
> For reference, this is what 6.3.x now shows:
> 
> [   15.642288] snd_hda_codec_cirrus hdaudioC1D0: autoconfig for
> CS4208: line_outs=2 (0x12/0x13/0x0/0x0/0x0) type:speaker
> [   15.642296] snd_hda_codec_cirrus hdaudioC1D0:    speaker_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [   15.642299] snd_hda_codec_cirrus hdaudioC1D0:    hp_outs=1
> (0x10/0x0/0x0/0x0/0x0)
> [   15.642301] snd_hda_codec_cirrus hdaudioC1D0:    mono: mono_out=0x0
> [   15.642303] snd_hda_codec_cirrus hdaudioC1D0:    dig-out=0x21/0x0
> [   15.642305] snd_hda_codec_cirrus hdaudioC1D0:    inputs:
> [   15.642307] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1c
> [   15.642309] snd_hda_codec_cirrus hdaudioC1D0:      Mic=0x18
> [   15.735257] snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops
> i915_audio_component_bind_ops [i915])
> 
> And hdajackretask (without unconnected pins):
> Pin ID: 0x10 [Green Headphone]
> Jack; External; Headphone; Combination;
> Green; Present; 2; Front;
> 
> Pin ID: 0x12 [Internal Speaker]
> <blank>; Internal; Speaker; Unknown;
> Unknown; Not present; 1; Back;
> 
> Pin ID: 0x13 [Internal Speaker]
> <blank>; Internal; Speaker; Unknown;
> Unknown; Not present; 1; Back;
> 
> Pin ID: 0x18 [Pink Mic]
> Jack; External; Microphone; Combination;
> Pink; Present; 4; Front;
> 
> Pin ID: 0x1c [Internal Mic]
> <blank>; Internal; Microphone; Other Digital;
> Unknown; Not present; <blank>; Front
> 
> Pin ID: 0x21 [White SPDIF Out]
> Jack; External; SPIDF Out; Combination;
> White; Present; 3; Front;
> 
> The blank connectivity options are a bit off, as is the blank channel
> group on the internal mic.
> 
> So curious on those ...
> 
> Anyway, leaving this here for any future in case it is needed again.

Good to hear that you managed to recover BIOS.

Could you give alsa-info.sh output from the working state?  Run the
script with --no-upload option and attach the output.  This will help
in future if it gets broken again :)


thanks,

Takashi
