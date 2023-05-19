Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC188709037
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 09:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C559E208;
	Fri, 19 May 2023 09:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C559E208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684480440;
	bh=wi10oNdSuEDJZN3FuMhmysbHki+FdSOch5ReUU1Zvdo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1DVft+20q6UTBnx5+XOc1a3CX0IIce9r44YdwWhsDRFs00Uctb+QClT9QwOKNAVA
	 nz/9Hidl7NHvS3dbJVGrVkrPqxooWpoDxlAo+QYFoYKBUznEAQqrKnfl4rPV26rzcc
	 HUMVlasLdn/MpWXAUui+ymTfW9+2RL7ue2tY63qc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A29B9F802E8; Fri, 19 May 2023 09:12:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F56CF8024E;
	Fri, 19 May 2023 09:12:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F2CF8025A; Fri, 19 May 2023 09:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD07BF80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 09:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD07BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=erEyJCDA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XYsyWbHM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B6BCD2230F;
	Fri, 19 May 2023 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684480344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOtQ5Mw3ZhNy2oYykHN5gEBjT166jrpCIX9C2UfrJ6o=;
	b=erEyJCDAJidwdfKvyCSTm538swnbBc4RMHwSboQYa3H1XX2TWzS64CnXyy7rFc+l9YP7JX
	8M5JQRImYlMMihbDdlfzOwbBbjeeJDGNOumT5WGn5iO4onRwXshsZ8E4vb0zI3aoX3js9e
	Wwzq7dOSZSphplwJpiKH+1R9VNM3d8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684480344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOtQ5Mw3ZhNy2oYykHN5gEBjT166jrpCIX9C2UfrJ6o=;
	b=XYsyWbHM3JOG4mcZ9UWlCvMIz/bA90uy8PoqCgCJVcD4w5QqbceHdyUEj++wcAEOSCRCYe
	b0m6BYzoIOQNJ2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9933213A12;
	Fri, 19 May 2023 07:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2ixtJFghZ2QyZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 07:12:24 +0000
Date: Fri, 19 May 2023 09:12:24 +0200
Message-ID: <87pm6w23s7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: alsa-devel@alsa-project.org
Subject: Re: snd_hda_codec_cirrus kernel oops
In-Reply-To: <f96b9b82-8bfe-ad98-c7d8-b6d7ac401961@schinagl.nl>
References: <64d95eb0-dbdb-cff8-a8b1-988dc22b24cd@schinagl.nl>
	<87zg69appu.wl-tiwai@suse.de>
	<6afd694e-8810-8197-3dd0-831daf2130f3@schinagl.nl>
	<87bkikdt66.wl-tiwai@suse.de>
	<d6e3b9ea-f98f-6404-e1ee-6973d68b64c1@schinagl.nl>
	<87y1llhfzq.wl-tiwai@suse.de>
	<f96b9b82-8bfe-ad98-c7d8-b6d7ac401961@schinagl.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SC2UFP2ITLZQ7CQNSMDZUVDPSWB3WTLR
X-Message-ID-Hash: SC2UFP2ITLZQ7CQNSMDZUVDPSWB3WTLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC2UFP2ITLZQ7CQNSMDZUVDPSWB3WTLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 17:11:53 +0200,
Olliver Schinagl wrote:
> 
> Hey Takashi,
> 
> On 18-05-2023 16:27, Takashi Iwai wrote:
> > On Thu, 18 May 2023 16:24:02 +0200,
> > Olliver Schinagl wrote:
> >> 
> >> Hey Takashi,
> >> 
> >> I've applied the patch you've listed below. Is there some 'fool-proof'
> >> way to produce _any_ output however? I've stopped pulse/pipe audio,
> >> and only use aplay + alsamixer. Back to basics as they say. For aplay,
> >> I use -D sysdefault:CARD=PCH (which was listed as a cirrus card with
> >> -L).
> >> 
> >> Alsamixer was used to ensure all volumes are open.
> >> 
> >> Without anything running, I was able to use hdajackretask to apply
> >> settings. But then, what to put. I get that I have to figure out, what
> >> is routed where (i'll try to find the schematic for the macbook pro
> >> 12,1), but hence my question, is there some way to produce something?
> >> In hdajackretask I've enabled all pins, overriden them all, and set
> >> them all to the same configuration. 'Internal, internal, speaker,
> >> other-analog, green, not-present, 1, front'. I figured, by setting up
> >> verything to the internal speaker, I must get sound out of something,
> >> but alas.
> >> 
> >> I also have a Macbook pro from 1 or 2 generations earlier, 11,2 afaik,
> >> where the sound still does work. I've used the same config
> >> hdajackretask showed was in use there, but (obviously?) that didn't
> >> work.
> >> 
> >> So I'm a bit grasping at straws. Trying _every_ combination is a bit much?
> > 
> > It's the hard part.  I'd try to copy the pin config of the existing
> > models at first, then try shooting one pin by one if it doesn't work.
> 
> Ok, so no easy way :) I did try copying things, but didn't get sound either.
> 
> I did find the schematics for the 2013 and 2014 models of the macbook;
> no luck yet on the 2015 (mine). But all 3 have the same model number
> (A1502), and looking at the schematic (not even sure if it is just a
> new revision, or actually for the different boards) they seem more or
> less identical. Especially on the audio part. The nice thing is it
> tells me what pins things are connected to :) But again, might not be
> a perfect match to my board (crosses fingers).
> 
> What is interesting, the schematics [0] actually list the HDA configuration.
> 
> CODEC OUTPUT SIGNAL PATHS
> 
> FUNCTION   VOLUME    CONVERTER  PIN COMPLEX  MUTE CONTROL
> 
> HP/HS OUT  0x02 (2)  0x02 (2)   0x10 (16)    N/A
> TWEETERS   0x03 (3)  0x03 (3)   0x12 (18)    CODEC GPIO0
> SUB        0x04 (4)  0x04 (4)   0x13 (19)    CODEC GPIO0
> SPDIF OUT  N/A       0x0e (14)  0x21 (33)    N/A
> 
> DMIC 1               0x09 (9)   0x1c (18)
> DMIC 2               0x09 (9)   0x1c (18)
> 
> HEADSET MIC          0x07 (7)   0x18 (24)
> 
> OTHER CODEC GPIO LINES
> LEFT SPEAKER ID      GPIO2 INPUT             HIGH = FG, LOW = MERRY
> RIGHT SPEAKER ID     GPIO3 INPUT             HIGH = FG, LOW = MERRY
> DFET CONTROL         GPIO4 OUTPUT            HIGH = DFETs OPEN
> 
> Granted, that should yield the same infomration I can copy from the
> other one, but I'm trying to understand what this would mean. Function
> is obvious, aswell as the pin-complex, it's what hdajackretasks calls
> pin ID. But the rest is a bit iffy. E.g. what would the volume column
> indicate? What about the 'converter'? And the GPIO's? Are the's GPIO's
> of the codec? Maybe my confusion mostly comes as I'm not sure how to
> relate those fields to hdajackretask.

It's a good information.
It corresponds to spec->gpio_eapd_speaker, and GPIO2 would be the bit
0x04, GPIO3 would be 0x08, so it should be set to 0x0c.  The headphone
has no GPIO assignment, so spec->gpio_eapd_headphone=0.

But subwoofers seem to have the GPIO controls as well, and the gpio
bit 0x01 should be set.  For that, we'll need to modify cs_automute()
function.  But let's investigate this later.

FWIW, the GPIO bits can be flipped on the fly, too.  Use hda-verb for
setting SET_GPIO_MASK, SET_GPIO_DIRECTION and SET_GPIO_DATA.


Takashi

> 
> Olliver
> 
> [0]:
> https://www.alisaler.com/macbook-pro-retina-13-a1502-x304-mlb-820-4924-schematic/
> 
> > 
> > 
> > Takashi
> > 
> >> 
> >> Olliver
> >> 
> >> On 16-05-2023 20:31, Takashi Iwai wrote:
> >>> On Tue, 16 May 2023 18:49:55 +0200,
> >>> Olliver Schinagl wrote:
> >>>> 
> >>>> Hey Takashi,
> >>>> 
> >>>>>> [   90.497004] CPU: 3 PID: 343 Comm: modprobe Not tainted
> >>>>>> 6.3.1-arch2-1 #1 4c16b0b90f71a940c7f1bb2eb00cdd9db2a83452
> >>>>>> [   90.497008] Hardware name: Apple
> >>>>>> Inc. MacBookPro12,1/Mac-E43C1C25D4880AD6, BIOS 481.0.0.0.0 01/12/2023
> >>>>>> [   90.497010] RIP: 0010:get_line_out_pfx+0x2dd/0x3e0
> >>>>>> [snd_hda_codec_generic]
> >>>>> 
> >>>>> Can you try to decode which line does it hit?
> >>>> This was the arch 'vendor' kernel, so not easily? I could have tried
> >>>> though I suppose :)
> >>>> 
> >>>> Instead, I just applied your patch and tried that instead.
> >>>> 
> >>>>> 
> >>>>> Also, as a blind shot, does the patch below work around the bug?
> >>>> [   16.593760] 0x000000000000-0x000000800000 : "BIOS"
> >>>> [   16.603877] snd_hda_codec_cirrus hdaudioC1D0: autoconfig for
> >>>> CS4208: line_outs=5 (0x11/0x12/0x13/0x14/0x1d) type:speaker
> >>>> [   16.603885] snd_hda_codec_cirrus hdaudioC1D0:    speaker_outs=0
> >>>> (0x0/0x0/0x0/0x0/0x0)
> >>>> [   16.603888] snd_hda_codec_cirrus hdaudioC1D0:    hp_outs=1
> >>>> (0x10/0x0/0x0/0x0/0x0)
> >>>> [   16.603890] snd_hda_codec_cirrus hdaudioC1D0:    mono: mono_out=0x0
> >>>> [   16.603892] snd_hda_codec_cirrus hdaudioC1D0:    dig-out=0x1e/0x21
> >>>> [   16.603894] snd_hda_codec_cirrus hdaudioC1D0:    inputs:
> >>>> [   16.603895] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x16
> >>>> [   16.603897] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x15
> >>>> [   16.603899] snd_hda_codec_cirrus hdaudioC1D0:      Mic=0x18
> >>>> [   16.603900] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x19
> >>>> [   16.603902] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1a
> >>>> [   16.603904] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1b
> >>>> [   16.603919] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1c
> >>>> [   16.603921] snd_hda_codec_cirrus hdaudioC1D0:      Line=0x17
> >>>> [   16.603922] snd_hda_codec_cirrus hdaudioC1D0:    dig-in=0x22
> >>>> [   16.605152] snd_hda_codec_cirrus hdaudioC1D0: Too many channels in
> >>>> get_line_out_pfx: 4
> >>>> [   16.605215] snd_hda_codec_cirrus hdaudioC1D0: Too many channels in
> >>>> get_line_out_pfx: 4
> >>>> 
> >>>> the good thing, you fixed the oops; the bad thing, it's no working,
> >>>> but hopefully this helps you gain more insight?
> >>> 
> >>> Below is a bit better patch for fixing the Oops.
> >>> 
> >>> But, judging from the output above, I guess it won't help completely,
> >>> because the pin configuration looks broken; e.g. it reports too many
> >>> "Internal Mic" pins (which must be only one usually).
> >>> 
> >>> That said, the actual breakage (except for kernel Oops) is the pin
> >>> config set by BIOS.  Maybe it doesn't set up things properly *at all*
> >>> You'll need to correct it by providing the full pin config with a
> >>> quirk table.  And for that, you'll need to figure out the pins via
> >>> trial-and-error, for example, with the help of hdajackretask.
> >>> 
> >>> 
> >>> thanks,
> >>> 
> >>> Takashi
> >>> 
> >>> -- 8< --
> >>> From: Takashi Iwai <tiwai@suse.de>
> >>> Subject: [PATCH] ALSA: hda: Fix Oops by 9.1 surround channel names
> >>> 
> >>> get_line_out_pfx() may trigger an Oops by overflowing the static array
> >>> with more than 8 channels.  This was reported for MacBookPro 12,1 with
> >>> Cirrus codec.
> >>> 
> >>> As a workaround, extend for the 9.1 channels and also fix the
> >>> potential Oops by unifying the code paths accessing the same array
> >>> with the proper size check.
> >>> 
> >>> Reported-by: Olliver Schinagl <oliver@schinagl.nl>
> >>> Cc: <stable@vger.kernel.org>
> >>> Link: https://lore.kernel.org/r/64d95eb0-dbdb-cff8-a8b1-988dc22b24cd@schinagl.nl
> >>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >>> ---
> >>>    sound/pci/hda/hda_generic.c | 7 ++++---
> >>>    1 file changed, 4 insertions(+), 3 deletions(-)
> >>> 
> >>> diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
> >>> index fc114e522480..dbf7aa88e0e3 100644
> >>> --- a/sound/pci/hda/hda_generic.c
> >>> +++ b/sound/pci/hda/hda_generic.c
> >>> @@ -1155,8 +1155,8 @@ static bool path_has_mixer(struct hda_codec *codec, int path_idx, int ctl_type)
> >>>    	return path && path->ctls[ctl_type];
> >>>    }
> >>>    -static const char * const channel_name[4] = {
> >>> -	"Front", "Surround", "CLFE", "Side"
> >>> +static const char * const channel_name[] = {
> >>> +	"Front", "Surround", "CLFE", "Side", "Back",
> >>>    };
> >>>      /* give some appropriate ctl name prefix for the given line out
> >>> channel */
> >>> @@ -1182,7 +1182,7 @@ static const char *get_line_out_pfx(struct hda_codec *codec, int ch,
> >>>      	/* multi-io channels */
> >>>    	if (ch >= cfg->line_outs)
> >>> -		return channel_name[ch];
> >>> +		goto fixed_name;
> >>>      	switch (cfg->line_out_type) {
> >>>    	case AUTO_PIN_SPEAKER_OUT:
> >>> @@ -1234,6 +1234,7 @@ static const char *get_line_out_pfx(struct hda_codec *codec, int ch,
> >>>    	if (cfg->line_outs == 1 && !spec->multi_ios)
> >>>    		return "Line Out";
> >>>    + fixed_name:
> >>>    	if (ch >= ARRAY_SIZE(channel_name)) {
> >>>    		snd_BUG();
> >>>    		return "PCM";
> >> 
> 
