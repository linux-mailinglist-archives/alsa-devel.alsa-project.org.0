Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E696FF69B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 17:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13446F01;
	Thu, 11 May 2023 17:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13446F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683820762;
	bh=rwhJJc5W18/UTZtHOLWNNuakGwpvVJ0woMDPbZSPfzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uDaAQEpptoaZvAonD8OipaStJJwGBHV39zfZVH5Tll2Hqg8pNfEjiw20Da3LhxvPD
	 zW/8AMpzxm/TuGQir52p4gKjx0l+wmXgS0DrEWo8okVBm5FdBbRfKbA4uYvtFzVE6U
	 8Xuaf/3kMYtScOyWnCr28mFDUlVymeF9J390HMl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 388C2F80544; Thu, 11 May 2023 17:58:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B73D4F8032D;
	Thu, 11 May 2023 17:58:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E03F8052E; Thu, 11 May 2023 17:58:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30688F8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 17:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30688F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BGK7xkkK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Li5/b7X0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C25D21E26;
	Thu, 11 May 2023 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683820700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIKN/2yqSCxMU2iiY+xpnYmCFxUutT54XBZXSpzuDS8=;
	b=BGK7xkkKbydX2GfRLzqtq/E7yx/BNqTDdVjFdY3Q/LEw7+9SOOliosQ3BLsxHB/5j+ZSm0
	E/IP9LYuO41ICEk2USLH6/Spab6DFRFXcbF+kRntFRvOjfzb88PVyN09lwLa0PwUeQqSHT
	koJhA9A8JC0XLGcuRxubPZf3vPoSBiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683820700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIKN/2yqSCxMU2iiY+xpnYmCFxUutT54XBZXSpzuDS8=;
	b=Li5/b7X0Wi5PAB4FaFu+RHywKAeyQVOIHdlkyBo5bcjLFbqyVkQ9hHanVmyNSOrHdh2sp0
	+g/7uqZzYjziOjAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C8F4138FA;
	Thu, 11 May 2023 15:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EyKrGZwQXWTafgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 11 May 2023 15:58:20 +0000
Date: Thu, 11 May 2023 17:58:19 +0200
Message-ID: <87jzxe5084.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
	<878rdwjs1s.wl-tiwai@suse.de>
	<cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KISZEJCXIGQW2P6VRCKFHNKQJN2NMLT6
X-Message-ID-Hash: KISZEJCXIGQW2P6VRCKFHNKQJN2NMLT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KISZEJCXIGQW2P6VRCKFHNKQJN2NMLT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 17:31:37 +0200,
Amadeusz S³awiñski wrote:
> 
> On 5/10/2023 2:21 PM, Takashi Iwai wrote:
> > On Tue, 09 May 2023 12:10:06 +0200,
> > Amadeusz S³awiñski wrote:
> >> 
> >> Hi Takashi,
> >> 
> >> I have a question related to HDA codecs, power saving and sending verb
> >> configuration. In our tests we test avs driver with HDA codec
> >> configuration and we see problem when arecord is started before codec
> >> goes to first sleep.
> >> 
> >> In ASoC code we set power save timeout to 2 seconds [1], if we start
> >> recording before codec goes to sleep, we record only silence.
> >> 
> >> Now I've spend some time investigating the issue and as far as I can
> >> tell, when codec is being initialized channels are being set to mute
> >> and when one starts stream before first "sleep" it never sends proper
> >> configuration to codec.
> > 
> > Who does set channels to mute?  Or do you mean that the hardware
> > initial value set on the codec is muted?  If yes, anyone should have
> > unmuted.  Was it tracked?
> > 
> 
> It is done on probe, first two backtraces in my dmesg show it (one for
> left and other for right channel). It is something along the lines of:
> hda_codec_driver_probe -> snd_hda_codec_build_controls -> alc_init ->
> snd_hda_codec_amp_init_stereo and then it writes mute verbs
> (0x00935080 and 0x00936080)

Sofar, that's the expected behavior.  The driver initially mutes the
mixers explicitly.  But, something else must unmute the mixer
afterwards for allowing recording.

> >> However if one allows codec to go to sleep
> >> proper configuration is being send on resume.
> > 
> > We need to track down in which level the inconsistency happens.
> > First of all, we need to check whether the HD-audio regmap holds the
> > right value (unmuted) at the time of the first arecord, as well as the
> > actual (raw) value from the codec.
> > 
> > 
> 
> Well, my first idea was that some interaction between power management
> and regmap goes awry somehow.
> 
> >> I've also managed to reproduce it with non DSP configuration (using
> >> snd_hda_intel driver). One needs to set power_save to non zero value
> >> and start recording, before it first goes into first sleep.
> >> 
> >> Here are the steps:
> >> 1. Add following to /etc/modprobe.d/test.conf
> >> options snd_intel_dspcfg dsp_driver=1
> >> options snd_hda_intel power_save=5
> >> blacklist snd_hda_intel
> >> 2. Reboot the machine
> >> 3. Run something like (it is time sensitive, so I just run it all in
> >> one line):
> >> echo "PRE MODPROBE" > /dev/kmsg; modprobe snd_hda_intel; echo "POST
> >> MODPROBE" > /dev/kmsg; sleep 1; echo "PRE ARECORD" > /dev/kmsg;
> >> arecord -Dhw:PCH,0 -r48 -c2 -fS16_LE -d 20 -vvv /tmp/cap.wav; echo
> >> "POST ARECORD" > /dev/kmsg;
> >> 4. Observe silence in above file
> >> 5. Run after waiting more than 5 seconds:
> >> echo "PRE SECOND ARECORD" > /dev/kmsg; arecord -Dhw:PCH,0 -r48 -c2
> >> -fS16_LE -d 20 -vvv /tmp/cap.wav; echo "POST SECOND ARECORD" >
> >> /dev/kmsg;
> >> 
> >> I'm also attaching logs from my reproduction with debug.diff (also
> >> attached) applied. Main purpose of debug.diff is to log when
> >> snd_hdac_exec_verb() is called and to log backtraces for when record
> >> input is muted on load and set on startup.
> >> 
> >> When looking at attached dmesg, it is easy to see that when first
> >> arecord is being run almost no configuration happens.
> > 
> > The driver itself doesn't unmute.  It should be alsactl or PA/PW that
> > unmutes.  At the initialization, HDA codec driver calls
> > snd_hda_codec_amp_init() for each codec amp, and this reads the
> > current value from the chip and updates *only* the regmap cache.
> > When a program like alsactl/PA/PW updates the mute/volume, it's
> > checked with the regmap cache and updated only if the value differs.
> > 
> > So, the inconsistency may happen at this level, too.  By some reason,
> > it might believe the values unchanged, hence the registers might be
> > left untouched.
> > 
> > This needs further checks, obviously...
> > 
> 
> And playing with controls is good suggestion, it made it a bit easier
> to debug. Seems like hda_reg_write() exits early here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/hda/hdac_regmap.c#n297
> this happens because codec_pm_lock returns -1. While in working case
> it goes through whole hda_reg_write() function.
> 
> So codec_pm_lock() calls snd_hdac_keep_power_up(), according to
> comment snd_hdac_keep_power_up() returns -1 when codec is not powered
> up.
> 
> With additional logs I see that when snd_hdac_keep_power_up() is
> called codec->dev->power.usage_count indeed is 0.
> 
> 
> The call to snd_hda_power_down() which seems to set power to off,
> seems to be in:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n833
> 
> 
> So broken order of operations seems to be:
> snd_hda_intel driver gets loaded, it initializes codec. While it
> initializes it sets amplifier to mute. It finishes initialization and
> powers off. Then control gets set from alsactl, but as power is off it
> gets cached.

So far, so good.  The mixer amp update during the codec power down
changes only the cache.  And, this modified cached value must be
written to the hardware at the codec power up.  But...

> Then capture stream starts and seems to assume that
> registers were already set, so it doesn't write them to hw.

... it seems this didn't happen, and that's the inconsistency.

So the further question is:
At the point just before you start recording, is the codec in runtime
suspended?  Or it's running?

If it's runtime-suspended, snd_hda_regmap_sync() must be called from
alc269_resume() via runtime-resume, and this must write out the
cached values.  Then the bug can be along with that line.

Or if it's running, it means that the previous check of
snd_hdac_keep_power_up() was bogus (or racy).


Takashi

> Also using
> alsamixer while "broken" stream is running doesn't result in any
> writes being done.
>
> Contrasted with working case:
> Codec is being brought up from sleep, registers get set to proper
> value via call to snd_hda_regmap_sync(). Capture stream gets started
> (and assumes that registers were set, and they were this time, as
> runtime resume sets them) and continues with working volume set.
> 
> 
> However when I tried to put snd_hda_regmap_sync() in few places while
> stream is started it doesn't seem to help :/ I will continue looking
> tomorrow, but any suggestions are still welcome.
> 
