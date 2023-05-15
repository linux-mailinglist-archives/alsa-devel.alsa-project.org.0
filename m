Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D330B703E0E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 22:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60DE1F6;
	Mon, 15 May 2023 22:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60DE1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684180879;
	bh=ox93k1GPAvmNpnHR3W2hNHFZaLf+14dGTjH10B7/Rdo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l6ZKXgWmcNNKbsYAibfa48JkWWgT7xsPSdb+MqknHZ2QHgzEIZf32OCabiMM591oj
	 N31UY+sf09r1fQfyKDAlfCtcPa+vl9W/n9BAl+jX07VQCdDbViYb4uqEKISln81dz2
	 KLvje/0CapCnV8Ujc6TadlsPewvSiCrSjpXozRQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEED0F80431; Mon, 15 May 2023 22:00:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57DFEF8024E;
	Mon, 15 May 2023 22:00:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D675F80272; Mon, 15 May 2023 22:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59195F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 22:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59195F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gnnaKoPS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DyjeIZ+7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0EA01F8B2;
	Mon, 15 May 2023 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684180806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/uWSH5KUii9p5TDhrKb0mtbFtjVLKPINE+aYdHd+Ek=;
	b=gnnaKoPSWfZygleD1ZfF4UwjHRv9p3W78EaL06HyyfVxT0zY/zO2tx6yjz5SRsMaPE6I3A
	nRaM3webhk4wiWKgAJeqr9vOLlkH7H00rLkOpBAsiTqYr1xRa1nq10VqtOtuLDPjPiyOcW
	EDYpbSo9HvK0buKwGWOLFNMThJae+Fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684180806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/uWSH5KUii9p5TDhrKb0mtbFtjVLKPINE+aYdHd+Ek=;
	b=DyjeIZ+70JSlrfz12YMgqdM3+CNrGHT3DjWLgHUpZ0iN9T6ooZN/zGDt1OdXdyeDKqf/+K
	fJXvSnCjbURYLvBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1A69138E5;
	Mon, 15 May 2023 20:00:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HM4mKkaPYmSmeQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 15 May 2023 20:00:06 +0000
Date: Mon, 15 May 2023 22:00:06 +0200
Message-ID: <87a5y5pdq1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Cc: alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
In-Reply-To: <ZGJSRmtZ5SBOLe5u@mail-itl>
References: <ZGJSRmtZ5SBOLe5u@mail-itl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SOJXQYBAIL763L4ZAUW6DYCZHAI32MNR
X-Message-ID-Hash: SOJXQYBAIL763L4ZAUW6DYCZHAI32MNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOJXQYBAIL763L4ZAUW6DYCZHAI32MNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 17:39:50 +0200,
Marek Marczykowski-Górecki wrote:
> 
> Hi,
> 
> I have a rather interesting issue on HP EliteBook 1040, with Intel ADL
> HDA. Sometimes (often) audio output is heavily distorted, but then
> opening pavucontrol or just launching `parecord /dev/null` fixes the issue
> instantly. But, when the mixer or recording is closed, then few seconds
> later issue comes back.
> 
> You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
> Initially recording was running, then about 10s stopped and you can
> hear the issue few seconds later. Then I starter recording again, and
> the issue is gone.
> This is how it should sound: https://youtube.com/watch?v=4Tr0otuiQuU
> I do not see any kernel messages when issue happens.
> 
> The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tested
> other versions. It happens only when running under Xen (in PV dom0). The
> very same Linux started directly works fine. Full dmesg of both native
> and Xen boots is at https://gist.github.com/marmarek/548ee79282446344a172109bcd943930
> 
> When running Linux 6.3.2 there, I noticed that just after boot first
> playback is okay, but if I start and stop recording it breaks. And then
> after some time of idle it fixes itself again. I have not observed this
> behavior on 6.2.10 (it was broken initially too), but I could be also
> doing some things differently. 
> 
> I have few other ADL-based systems (but not HP), and they do not show
> this issue, only this HP laptop is affected. Example dmesg from another
> ADL-based system:
> https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5
> 
> I'm not sure if that's the relevant difference, but comparing dmesg from
> working and not working systems, I see those on boot for the
> problematic case:
>   snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100                                                                                                                                                                                                                                 
>   snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver                                                                                                                                                                                                                                  
>   sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100                                                                                                                                                                                                                       
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver                                                                                                                                                                                                                        
>   sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002)                                                                                                                                                                                                                                                   
>   xen: registering gsi 16 triggering 0 polarity 1                                                                                                                                                                                                                                                                        
>   Already setup the GSI :16                                                                                                                                                                                                                                                                                              
>   sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100                                                                                                                                                                                                                            
>   sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])                                                                                                                                                                                                                    
>   sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode                                                                                                                                                                                                                                                           
>   sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 5                                                                                                                                                                                                                                                         
>   sof-audio-pci-intel-tgl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now                                                                                                                                                                                                                                 
>   sof-audio-pci-intel-tgl 0000:00:1f.3: DMICs detected in NHLT tables: 2                                                                                                                                                                                                                                                 
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864                                                                                                                                                                                                                                               
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0                                                                                                                                                                                                                                           
>   sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30                                                                                                                                                                                                                                      
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864                                                                                                                                                                                                                                               
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0                                                                                                                                                                                                                                           
>   sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0                                                                                                                                                                                                                                           
>   skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred                                                                                                                                                                                                             
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware version: 3                                                                                                                                                                                                                                                   
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time                                                                                                                                                                          
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: 0x2 v0.43.1, 2 algorithms                                                                                                                                                                                                                     
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 0: ID cd v29.63.1 XM@94 YM@e                                                                                                                                                                                                                                          
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: 1: ID f20b v0.1.0 XM@176 YM@0                                                                                                                                                                                                                                         
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: E:\Amp Tuning\HP\840\0527\103C8972_220527.bin                                                                                                                                                                                                               
>   snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])                                                                                                                                                                                             
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware version: 3                                                                                                                                                                                                                                                   
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8974.wmfw: Fri 27 Aug 2021 14:58:19 W. Europe Daylight Time                                                                                                                                                                          
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: 0x2 v0.43.1, 2 algorithms                                                                                                                                                                                                                     
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 0: ID cd v29.63.1 XM@94 YM@e                                                                                                                                                                                                                                          
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: 1: ID f20b v0.1.0 XM@176 YM@0                                                                                                                                                                                                                                         
>   cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: E:\Amp Tuning\HP\840\0527\103C8972_220527.bin                                                                                                                                                                                                               
>   snd_hda_codec_realtek ehdaudio0D0: bound spi0-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
> 
> 
> Any ideas?

Could you try to switch to the legacy HD-audio driver (e.g. by passing
snd_intel_dspcfg.dsp_driver=1 option) and check whether the issue
persists or not?  This will narrow down whether it's SOF-specific
problem or not, at least.


thanks,

Takashi
