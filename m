Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84E729262
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 10:13:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C566C1;
	Fri,  9 Jun 2023 10:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C566C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686298420;
	bh=yz4TCabwLJDMLPG9flvqzQdNIFQjLz1Lokoc+r+dZrw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T9iDmabPAYz7q0bOPjZa9Djc8iu9W1FY3Mj7ekQtWO7rYkkhTdLaD6XZlk+sVWLSN
	 DZ5dnMiAlWWlSZSLHUPmlkSbdsaVY6gxGyzp4UFbQZryz5uwe3cOwMMHEkObEKfwQR
	 x20xTcAOXCGNERc8OiWO/KVG02rL6ngIJPuyIKRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC345F80494; Fri,  9 Jun 2023 10:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5687BF8016C;
	Fri,  9 Jun 2023 10:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C298BF80199; Fri,  9 Jun 2023 10:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDA22F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 10:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA22F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=C09o6fVS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=q5N9WR5C
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A03B1FDF3;
	Fri,  9 Jun 2023 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686298337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzPadJmke3bRsbWxIsqv26w7hATeTG1oFrZOONVHn1I=;
	b=C09o6fVSfhIy5mDvRXWBG72l8ddQw179BRKjEpPvZuqcqmns4MkGN7Eb17XdCqRBzbLzQ0
	JVTBADwLNH0XRp7whfoWPXCGu0ONhOTWMOp6nE9brSzSowK5Ms7rWgVqTgjTaYkaWzwp7N
	IyYLEb9yeHlLHQDkwP9VSEQcucP82l4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686298337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzPadJmke3bRsbWxIsqv26w7hATeTG1oFrZOONVHn1I=;
	b=q5N9WR5CK/8UuZ37EtJwUR9Hj88AYiliPXhzeXCrMLvDFHPYouPJqU7hn8U+Gvp7tyMFNw
	we9kdZWfkvVc7JAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0055413A47;
	Fri,  9 Jun 2023 08:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oc6vOuDegmSFWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 09 Jun 2023 08:12:16 +0000
Date: Fri, 09 Jun 2023 10:12:16 +0200
Message-ID: <878rctcavz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joseph C. Sible" <josephcsible@gmail.com>
Cc: Kailang <kailang@realtek.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: 
 <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>
	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>
	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
	<87353kd8b9.wl-tiwai@suse.de>
	<1170325957764b4cbd7cd3639575f285@realtek.com>
	<CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
	<873536js7q.wl-tiwai@suse.de>
	<CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
	<2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
	<CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
	<485f99149508488080d563144454040e@realtek.com>
	<CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
	<2831c55638a5431ca9e37d9caf365ed2@realtek.com>
	<CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
	<3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
	<CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com>
	<87h6rhcef2.wl-tiwai@suse.de>
	<0990300d759846d890de9c92fcad9a9d@realtek.com>
	<CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HBYU3363MJJ2FOIIO3A4NURXQTO4RZSZ
X-Message-ID-Hash: HBYU3363MJJ2FOIIO3A4NURXQTO4RZSZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBYU3363MJJ2FOIIO3A4NURXQTO4RZSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 09:34:37 +0200,
Joseph C. Sible wrote:
> 
> On Fri, Jun 9, 2023 at 3:04 AM Kailang <kailang@realtek.com> wrote:
> >
> > echo 0 > /sys/module/snd_hda_intel/parameters/power_save
> >
> > Could you give it a try? Then got dump also.
> >
> > If it passed, please test my two patches also. Then get dump again.
> 
> I ran that command under the kernel with my patch and then got an
> alsa-info dump again, and it still said "Invalid AFG subtree". The
> full result is attached as alsa-info-1.txt.
> 
> I then added snd_hda_intel.power_save=0 to the kernel command line and
> tried under the kernel with your patches again. No change here either:
> still "Invalid AFG subtree", and upon a warm boot, it still breaks.
> Attached from this test are alsa-info-2.txt (cold boot) and
> alsa-info-3.txt (warm boot).

Thanks.  It's puzzling.

The power setting of AFG looks already unusual:

State of AFG node 0x01:
  Power states:  D0 D2 (null) (null) (null) (null) (null) (null) (null)
  Power: setting=UNKNOWN, actual=D0, Clock-stop-OK, Setting-reset

So apparently the codec isn't ready yet for accessing.

But, the fact that the codec got parsed (hence you see the parsed
results in dmesg) means that this subtree call could succeed at the
beginning.

When you load snd-hda-intel module with "model=,generic" option (the
command is intentional), does the codec content show up?


Takashi

> 
> Regards,
> 
> Joseph C. Sible
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.4.63
> !!################################
> 
> !!Script ran on: Fri Jun  9 07:25:41 UTC 2023
> 
> 
> !!Linux Distribution
> !!------------------
> 
> Ubuntu 22.04.2 LTS \n \l DISTRIB_ID=Ubuntu DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS" PRETTY_NAME="Ubuntu 22.04.2 LTS" NAME="Ubuntu" ID=ubuntu ID_LIKE=debian HOME_URL="https://www.ubuntu.com/" SUPPORT_URL="https://help.ubuntu.com/" BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENAME=jammy
> 
> 
> !!DMI Information
> !!---------------
> 
> Manufacturer:      HP
> Product Name:      HP Laptop 15z-fc000
> Product Version:   
> Firmware Version:  F.07
> 
> 
> !!Kernel Information
> !!------------------
> 
> Kernel release:    6.3.6-2023jun07both
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.3.6-2023jun07both
> Library version:    1.2.6.1
> Utilities version:  1.2.6
> 
> 
> !!Loaded ALSA modules
> !!-------------------
> 
> snd_hda_intel
> snd_hda_intel
> 
> 
> !!Sound Servers on this system
> !!----------------------------
> 
> Pulseaudio:
>       Installed - Yes (/usr/bin/pulseaudio)
>       Running - Yes
> 
> 
> !!Soundcards recognised by ALSA
> !!-----------------------------
> 
>  0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc8000 irq 60
>  1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc0000 irq 61
> 
> 
> !!PCI Soundcards installed in the system
> !!--------------------------------------
> 
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1640
> 03:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor (rev 6f)
> 03:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller
> 
> 
> !!Advanced information - PCI Vendor/Device/Subsystem ID's
> !!-------------------------------------------------------
> 
> 03:00.1 0403: 1002:1640
> 	Subsystem: 103c:8b2f
> --
> 03:00.6 0403: 1022:15e3
> 	Subsystem: 103c:8b2f
> 
> 
> !!Modprobe options (Sound related)
> !!--------------------------------
> 
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_usb_audio: index=-2
> snd_usb_caiaq: index=-2
> snd_usb_ua101: index=-2
> snd_usb_us122l: index=-2
> snd_usb_usx2y: index=-2
> snd_cmipci: mpu_port=0x330 fm_port=0x388
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> snd_hda_intel: power_save=0
> 
> 
> !!Loaded sound module options
> !!---------------------------
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 0
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 0
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> 
> !!HDA-Intel Codec information
> !!---------------------------
> --startcollapse--
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100800
> No Modem Function Group found
> Default PCM:
>     rates [0x70]: 32000 44100 48000
>     bits [0x2]: 16
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D3 CLKSTOP EPSS
>   Power: setting=D0, actual=D0, Clock-stop-OK
> GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
> Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x02
> Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x04
> Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x06
> Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x08
> Node 0x0a [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x0b [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x0a
> Codec: Realtek ALC236
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0236
> Subsystem Id: 0x103c8b2f
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>     rates [0xe05]: 8000 16000 176400 192000 384000
>     bits [0x0]:
>     formats [0x5]: PCM AC3
> Default Amp-In caps: ofs=0x05, nsteps=0x7e, stepsize=0x00, mute=0
> Default Amp-Out caps: ofs=0x05, nsteps=0x7e, stepsize=0x00, mute=0
> State of AFG node 0x01:
>   Power states:  D0 D2 (null) (null) (null) (null) (null) (null) (null)
>   Power: setting=UNKNOWN, actual=D0, Clock-stop-OK, Setting-reset
> Invalid AFG subtree
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  4 Jun  9 03:24 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  8 Jun  9 03:24 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  3 Jun  9 03:24 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  7 Jun  9 03:24 /dev/snd/hwC1D0
> crw-rw----+ 1 root audio 116,  2 Jun  9 03:24 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  6 Jun  9 03:24 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  5 Jun  9 03:24 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116,  1 Jun  9 03:24 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 03:24 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Jun  9 03:24 .
> drwxr-xr-x 3 root root 240 Jun  9 03:24 ..
> lrwxrwxrwx 1 root root  12 Jun  9 03:24 pci-0000:03:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Jun  9 03:24 pci-0000:03:00.6 -> ../controlC1
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: Generic_1 [HD-Audio Generic], device 0: ALC236 Analog [ALC236 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> card 1: Generic_1 [HD-Audio Generic], device 0: ALC236 Analog [ALC236 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card 0 [Generic]
> 
> Card sysdefault:0 'Generic'/'HD-Audio Generic at 0xfccc8000 irq 60'
>   Mixer name	: 'ATI R6xx HDMI'
>   Components	: 'HDA:1002aa01,00aa0100,00100800'
>   Controls      : 8
>   Simple ctrls  : 2
> Simple mixer control 'PCM',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 255
>   Mono:
>   Front Left: Playback 255 [100%] [0.00dB]
>   Front Right: Playback 255 [100%] [0.00dB]
> Simple mixer control 'IEC958',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> 
> !!-------Mixer controls for card 1 [Generic_1]
> 
> Card sysdefault:1 'Generic_1'/'HD-Audio Generic at 0xfccc0000 irq 61'
>   Mixer name	: 'Realtek ALC236'
>   Components	: 'HDA:10ec0236,103c8b2f,00100002'
>   Controls      : 16
>   Simple ctrls  : 7
> Simple mixer control 'Master',0
>   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>   Playback channels: Mono
>   Limits: Playback 0 - 87
>   Mono: Playback 51 [59%] [-27.00dB] [on]
> Simple mixer control 'Headphone',0
>   Capabilities: pvolume pswitch
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 87
>   Mono:
>   Front Left: Playback 0 [0%] [-65.25dB] [off]
>   Front Right: Playback 0 [0%] [-65.25dB] [off]
> Simple mixer control 'Speaker',0
>   Capabilities: pvolume pswitch
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 87
>   Mono:
>   Front Left: Playback 87 [100%] [0.00dB] [on]
>   Front Right: Playback 87 [100%] [0.00dB] [on]
> Simple mixer control 'PCM',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 255
>   Mono:
>   Front Left: Playback 255 [100%] [0.00dB]
>   Front Right: Playback 255 [100%] [0.00dB]
> Simple mixer control 'Mic Boost',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 3
>   Front Left: 0 [0%] [0.00dB]
>   Front Right: 0 [0%] [0.00dB]
> Simple mixer control 'Capture',0
>   Capabilities: cvolume cswitch
>   Capture channels: Front Left - Front Right
>   Limits: Capture 0 - 63
>   Front Left: Capture 39 [62%] [12.00dB] [on]
>   Front Right: Capture 39 [62%] [12.00dB] [on]
> Simple mixer control 'Auto-Mute Mode',0
>   Capabilities: enum
>   Items: 'Disabled' 'Enabled'
>   Item0: 'Disabled'
> 
> 
> !!Alsactl output
> !!--------------
> 
> --startcollapse--
> state.Generic {
> 	control.1 {
> 		iface CARD
> 		name 'HDMI/DP,pcm=3 Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'IEC958 Playback Con Mask'
> 		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'IEC958 Playback Pro Mask'
> 		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'IEC958 Playback Default'
> 		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access 'read write'
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'IEC958 Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.6 {
> 		iface PCM
> 		device 3
> 		name ELD
> 		value ''
> 		comment {
> 			access 'read volatile'
> 			type BYTES
> 			count 0
> 		}
> 	}
> 	control.7 {
> 		iface PCM
> 		device 3
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		value.2 0
> 		value.3 0
> 		value.4 0
> 		value.5 0
> 		value.6 0
> 		value.7 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 8
> 			range '0 - 36'
> 		}
> 	}
> 	control.8 {
> 		iface MIXER
> 		name 'PCM Playback Volume'
> 		value.0 255
> 		value.1 255
> 		comment {
> 			access 'read write user'
> 			type INTEGER
> 			count 2
> 			range '0 - 255'
> 			tlv '0000000100000008ffffec1400000014'
> 			dbmin -5100
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> }
> state.Generic_1 {
> 	control.1 {
> 		iface MIXER
> 		name 'Headphone Playback Volume'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 -6525
> 			dbvalue.1 -6525
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'Headphone Playback Switch'
> 		value.0 false
> 		value.1 false
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'Speaker Playback Volume'
> 		value.0 87
> 		value.1 87
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'Speaker Playback Switch'
> 		value.0 true
> 		value.1 true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'Auto-Mute Mode'
> 		value Disabled
> 		comment {
> 			access 'read write'
> 			type ENUMERATED
> 			count 1
> 			item.0 Disabled
> 			item.1 Enabled
> 		}
> 	}
> 	control.6 {
> 		iface MIXER
> 		name 'Capture Volume'
> 		value.0 39
> 		value.1 39
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 63'
> 			dbmin -1725
> 			dbmax 3000
> 			dbvalue.0 1200
> 			dbvalue.1 1200
> 		}
> 	}
> 	control.7 {
> 		iface MIXER
> 		name 'Capture Switch'
> 		value.0 true
> 		value.1 true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.8 {
> 		iface MIXER
> 		name 'Mic Boost Volume'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 3'
> 			dbmin 0
> 			dbmax 3000
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> 	control.9 {
> 		iface MIXER
> 		name 'Master Playback Volume'
> 		value 51
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 1
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 -2700
> 		}
> 	}
> 	control.10 {
> 		iface MIXER
> 		name 'Master Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.11 {
> 		iface CARD
> 		name 'Mic Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.12 {
> 		iface CARD
> 		name 'Headphone Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.13 {
> 		iface CARD
> 		name 'Speaker Phantom Jack'
> 		value true
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.14 {
> 		iface PCM
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access read
> 			type INTEGER
> 			count 2
> 			range '0 - 36'
> 		}
> 	}
> 	control.15 {
> 		iface PCM
> 		name 'Capture Channel Map'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access read
> 			type INTEGER
> 			count 2
> 			range '0 - 36'
> 		}
> 	}
> 	control.16 {
> 		iface MIXER
> 		name 'PCM Playback Volume'
> 		value.0 255
> 		value.1 255
> 		comment {
> 			access 'read write user'
> 			type INTEGER
> 			count 2
> 			range '0 - 255'
> 			tlv '0000000100000008ffffec1400000014'
> 			dbmin -5100
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> }
> --endcollapse--
> 
> 
> !!All Loaded Modules
> !!------------------
> 
> Module
> ccm
> rfcomm
> snd_soc_acp6x_mach
> snd_soc_dmic
> snd_acp6x_pdm_dma
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> snd_sof_pci
> intel_rapl_msr
> snd_sof_xtensa_dsp
> intel_rapl_common
> snd_sof
> edac_mce_amd
> snd_hda_codec_hdmi
> snd_sof_utils
> snd_hda_codec_realtek
> kvm_amd
> snd_hda_codec_generic
> ledtrig_audio
> snd_hda_intel
> snd_soc_core
> snd_intel_dspcfg
> snd_intel_sdw_acpi
> cmac
> snd_hda_codec
> snd_compress
> algif_hash
> snd_hda_core
> ac97_bus
> snd_hwdep
> snd_pcm_dmaengine
> snd_pci_ps
> algif_skcipher
> snd_rpl_pci_acp6x
> af_alg
> snd_acp_pci
> snd_pci_acp6x
> uvcvideo
> bnep
> kvm
> videobuf2_vmalloc
> uvc
> videobuf2_memops
> videobuf2_v4l2
> irqbypass
> snd_pcm
> rtw89_8852be
> crct10dif_pclmul
> snd_seq_midi
> polyval_clmulni
> videodev
> videobuf2_common
> mc
> snd_seq_midi_event
> rtw89_8852b
> polyval_generic
> ghash_clmulni_intel
> btusb
> btrtl
> btbcm
> btintel
> btmtk
> sha512_ssse3
> snd_rawmidi
> rtw89_pci
> bluetooth
> aesni_intel
> snd_seq
> crypto_simd
> cryptd
> rapl
> amdgpu
> rtw89_core
> ecdh_generic
> ecc
> joydev
> binfmt_misc
> input_leds
> hp_wmi
> sparse_keymap
> snd_seq_device
> mac80211
> hid_multitouch
> platform_profile
> snd_timer
> serio_raw
> wmi_bmof
> nls_iso8859_1
> k10temp
> iommu_v2
> drm_buddy
> gpu_sched
> drm_ttm_helper
> ttm
> snd
> drm_display_helper
> cec
> cfg80211
> snd_pci_acp5x
> snd_rn_pci_acp3x
> snd_acp_config
> rc_core
> snd_soc_acpi
> snd_pci_acp3x
> drm_kms_helper
> i2c_algo_bit
> syscopyarea
> soundcore
> sysfillrect
> sysimgblt
> libarc4
> ccp
> mac_hid
> wireless_hotkey
> acpi_tad
> amd_pmc
> sch_fq_codel
> msr
> parport_pc
> ppdev
> lp
> ramoops
> parport
> reed_solomon
> drm
> pstore_blk
> pstore_zone
> efi_pstore
> ip_tables
> x_tables
> autofs4
> btrfs
> blake2b_generic
> xor
> raid6_pq
> libcrc32c
> hid_generic
> nvme
> nvme_core
> video
> crc32_pclmul
> xhci_pci
> xhci_pci_renesas
> i2c_piix4
> nvme_common
> wmi
> i2c_hid_acpi
> i2c_hid
> hid
> 
> 
> !!Sysfs Files
> !!-----------
> 
> /sys/class/sound/hwC0D0/init_pin_configs:
> 0x03 0x185600f0
> 0x05 0x585600f0
> 0x07 0x585600f0
> 0x09 0x585600f0
> 0x0b 0x585600f0
> 
> /sys/class/sound/hwC0D0/driver_pin_configs:
> 
> /sys/class/sound/hwC0D0/user_pin_configs:
> 
> /sys/class/sound/hwC0D0/init_verbs:
> 
> /sys/class/sound/hwC0D0/hints:
> 
> /sys/class/sound/hwC1D0/init_pin_configs:
> 0x12 0x411111f0
> 0x13 0x40000000
> 0x14 0x90170110
> 0x18 0x411111f0
> 0x19 0x03a11020
> 0x1a 0x411111f0
> 0x1b 0x411111f0
> 0x1d 0x40600001
> 0x1e 0x411111f0
> 0x21 0x03211040
> 
> /sys/class/sound/hwC1D0/driver_pin_configs:
> 0x1f0f 0x89485500
> 0x974 0x5de9d789
> 0x5566 0xe8e58948
> 0xfe94 0x89d2315d
> 0xe9d7 0x2e66c155
> 0x9090 0x90909090
> 0x470 0x2574d285
> 0xfa83 0x89485515
> 0xe8e5 0x315dffff
> 0x89c0 0x66a6e9c7
> 0xc155 0xc789c289
> 0x9be9 0xd08880c1
> 0x17 0xc289c031
> 0xc789 0x66c15566
> 0xfdf4 0x89d2315d
> 0x53e5 0x0004709f
> 0x8500 0x02fa831f
> 0x575 0x48fffffd
> 0x5d8b 0xd189d231
> 0xd689 0xe9d08941
> 0x65fc 0x5000b841
> 
> /sys/class/sound/hwC1D0/user_pin_configs:
> 
> /sys/class/sound/hwC1D0/init_verbs:
> 
> /sys/class/sound/hwC1D0/hints:
> 
> 
> !!ALSA/HDA dmesg
> !!--------------
> 
> [    0.000000] Linux version 6.3.6-2023jun07both (root@04db45a9ce31) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #21 SMP PREEMPT_DYNAMIC Wed Jun  7 14:43:43 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.000000] KERNEL supported cpus:
> --
> [    0.021641] Policy zone: Normal
> [    0.021643] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.021756] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both", will be passed to user space.
> --
> [    0.241202] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.241468] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.241691] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    5.547635] Bluetooth: MGMT ver 1.22
> [    5.551795] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    5.588775] NET: Registered PF_ALG protocol family
> --
> [    5.895984] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x1506 0x103C:0x8B2F 0xC4).
> [    5.931435] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    5.932178] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    5.933204] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    5.961721] [drm] register mmio base: 0xFCC00000
> --
> [    6.063648] kvm_amd: LBR virtualization supported
> [    6.082315] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC236: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    6.082322] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    6.082324] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    6.082326] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    6.082327] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    6.082328] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
> [    6.088319] [drm] VCN(0) decode is enabled in VM mode
> --
> [    6.130064] amdgpu 0000:03:00.0: amdgpu: Will use PSP to load VCN firmware
> [    6.156209] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    6.177555] [drm] reserve 0xa00000 from 0xf41e000000 for PSP TMR
> [    6.194019] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    6.194116] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input14
> [    6.216595] intel_rapl_common: Found RAPL domain package
> --
> [    6.454609] [drm] Display Core initialized with v3.2.223!
> [    6.454613] [drm] DP-HDMI FRL PCON supported
> [    6.455860] [drm] DMUB hardware initialized: version=0x06000800
> [    6.482109] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.538648] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> 
> 
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.4.63
> !!################################
> 
> !!Script ran on: Fri Jun  9 07:22:17 UTC 2023
> 
> 
> !!Linux Distribution
> !!------------------
> 
> Ubuntu 22.04.2 LTS \n \l DISTRIB_ID=Ubuntu DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS" PRETTY_NAME="Ubuntu 22.04.2 LTS" NAME="Ubuntu" ID=ubuntu ID_LIKE=debian HOME_URL="https://www.ubuntu.com/" SUPPORT_URL="https://help.ubuntu.com/" BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENAME=jammy
> 
> 
> !!DMI Information
> !!---------------
> 
> Manufacturer:      HP
> Product Name:      HP Laptop 15z-fc000
> Product Version:   
> Firmware Version:  F.07
> 
> 
> !!Kernel Information
> !!------------------
> 
> Kernel release:    6.3.6-revert256
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.3.6-revert256
> Library version:    1.2.6.1
> Utilities version:  1.2.6
> 
> 
> !!Loaded ALSA modules
> !!-------------------
> 
> snd_hda_intel
> snd_hda_intel
> 
> 
> !!Sound Servers on this system
> !!----------------------------
> 
> Pulseaudio:
>       Installed - Yes (/usr/bin/pulseaudio)
>       Running - Yes
> 
> 
> !!Soundcards recognised by ALSA
> !!-----------------------------
> 
>  0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc8000 irq 59
>  1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc0000 irq 60
> 
> 
> !!PCI Soundcards installed in the system
> !!--------------------------------------
> 
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1640
> 03:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor (rev 6f)
> 03:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller
> 
> 
> !!Advanced information - PCI Vendor/Device/Subsystem ID's
> !!-------------------------------------------------------
> 
> 03:00.1 0403: 1002:1640
> 	Subsystem: 103c:8b2f
> --
> 03:00.6 0403: 1022:15e3
> 	Subsystem: 103c:8b2f
> 
> 
> !!Modprobe options (Sound related)
> !!--------------------------------
> 
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_usb_audio: index=-2
> snd_usb_caiaq: index=-2
> snd_usb_ua101: index=-2
> snd_usb_us122l: index=-2
> snd_usb_usx2y: index=-2
> snd_cmipci: mpu_port=0x330 fm_port=0x388
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> 
> 
> !!Loaded sound module options
> !!---------------------------
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 0
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 0
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> 
> !!HDA-Intel Codec information
> !!---------------------------
> --startcollapse--
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100800
> No Modem Function Group found
> Default PCM:
>     rates [0x70]: 32000 44100 48000
>     bits [0x2]: 16
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D3 CLKSTOP EPSS
>   Power: setting=D0, actual=D0, Clock-stop-OK
> GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
> Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x02
> Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x04
> Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x06
> Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x08
> Node 0x0a [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x0b [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x0a
> Codec: Realtek ALC236
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0236
> Subsystem Id: 0x103c8b2f
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>     rates [0xe05]: 8000 16000 176400 192000 384000
>     bits [0x0]:
>     formats [0x5]: PCM AC3
> Default Amp-In caps: ofs=0x05, nsteps=0x7e, stepsize=0x00, mute=0
> Default Amp-Out caps: ofs=0x05, nsteps=0x7e, stepsize=0x00, mute=0
> State of AFG node 0x01:
>   Power states:  D0 D2 (null) (null) (null) (null) (null) (null) (null)
>   Power: setting=UNKNOWN, actual=D0, Clock-stop-OK, Setting-reset
> Invalid AFG subtree
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  4 Jun  9 03:21 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  8 Jun  9 03:21 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  3 Jun  9 03:21 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  7 Jun  9 03:21 /dev/snd/hwC1D0
> crw-rw----+ 1 root audio 116,  2 Jun  9 03:21 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  6 Jun  9 03:21 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  5 Jun  9 03:21 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116,  1 Jun  9 03:21 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 03:21 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Jun  9 03:21 .
> drwxr-xr-x 3 root root 240 Jun  9 03:21 ..
> lrwxrwxrwx 1 root root  12 Jun  9 03:21 pci-0000:03:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Jun  9 03:21 pci-0000:03:00.6 -> ../controlC1
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: Generic_1 [HD-Audio Generic], device 0: ALC236 Analog [ALC236 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> card 1: Generic_1 [HD-Audio Generic], device 0: ALC236 Analog [ALC236 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card 0 [Generic]
> 
> Card sysdefault:0 'Generic'/'HD-Audio Generic at 0xfccc8000 irq 59'
>   Mixer name	: 'ATI R6xx HDMI'
>   Components	: 'HDA:1002aa01,00aa0100,00100800'
>   Controls      : 8
>   Simple ctrls  : 2
> Simple mixer control 'PCM',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 255
>   Mono:
>   Front Left: Playback 255 [100%] [0.00dB]
>   Front Right: Playback 255 [100%] [0.00dB]
> Simple mixer control 'IEC958',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> 
> !!-------Mixer controls for card 1 [Generic_1]
> 
> Card sysdefault:1 'Generic_1'/'HD-Audio Generic at 0xfccc0000 irq 60'
>   Mixer name	: 'Realtek ALC236'
>   Components	: 'HDA:10ec0236,103c8b2f,00100002'
>   Controls      : 16
>   Simple ctrls  : 7
> Simple mixer control 'Master',0
>   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>   Playback channels: Mono
>   Limits: Playback 0 - 87
>   Mono: Playback 56 [64%] [-23.25dB] [on]
> Simple mixer control 'Headphone',0
>   Capabilities: pvolume pswitch
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 87
>   Mono:
>   Front Left: Playback 0 [0%] [-65.25dB] [off]
>   Front Right: Playback 0 [0%] [-65.25dB] [off]
> Simple mixer control 'Speaker',0
>   Capabilities: pvolume pswitch
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 87
>   Mono:
>   Front Left: Playback 87 [100%] [0.00dB] [on]
>   Front Right: Playback 87 [100%] [0.00dB] [on]
> Simple mixer control 'PCM',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 255
>   Mono:
>   Front Left: Playback 255 [100%] [0.00dB]
>   Front Right: Playback 255 [100%] [0.00dB]
> Simple mixer control 'Mic Boost',0
>   Capabilities: volume
>   Playback channels: Front Left - Front Right
>   Capture channels: Front Left - Front Right
>   Limits: 0 - 3
>   Front Left: 0 [0%] [0.00dB]
>   Front Right: 0 [0%] [0.00dB]
> Simple mixer control 'Capture',0
>   Capabilities: cvolume cswitch
>   Capture channels: Front Left - Front Right
>   Limits: Capture 0 - 63
>   Front Left: Capture 39 [62%] [12.00dB] [on]
>   Front Right: Capture 39 [62%] [12.00dB] [on]
> Simple mixer control 'Auto-Mute Mode',0
>   Capabilities: enum
>   Items: 'Disabled' 'Enabled'
>   Item0: 'Disabled'
> 
> 
> !!Alsactl output
> !!--------------
> 
> --startcollapse--
> state.Generic {
> 	control.1 {
> 		iface CARD
> 		name 'HDMI/DP,pcm=3 Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'IEC958 Playback Con Mask'
> 		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'IEC958 Playback Pro Mask'
> 		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'IEC958 Playback Default'
> 		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access 'read write'
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'IEC958 Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.6 {
> 		iface PCM
> 		device 3
> 		name ELD
> 		value ''
> 		comment {
> 			access 'read volatile'
> 			type BYTES
> 			count 0
> 		}
> 	}
> 	control.7 {
> 		iface PCM
> 		device 3
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		value.2 0
> 		value.3 0
> 		value.4 0
> 		value.5 0
> 		value.6 0
> 		value.7 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 8
> 			range '0 - 36'
> 		}
> 	}
> 	control.8 {
> 		iface MIXER
> 		name 'PCM Playback Volume'
> 		value.0 255
> 		value.1 255
> 		comment {
> 			access 'read write user'
> 			type INTEGER
> 			count 2
> 			range '0 - 255'
> 			tlv '0000000100000008ffffec1400000014'
> 			dbmin -5100
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> }
> state.Generic_1 {
> 	control.1 {
> 		iface MIXER
> 		name 'Headphone Playback Volume'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 -6525
> 			dbvalue.1 -6525
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'Headphone Playback Switch'
> 		value.0 false
> 		value.1 false
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'Speaker Playback Volume'
> 		value.0 87
> 		value.1 87
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'Speaker Playback Switch'
> 		value.0 true
> 		value.1 true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'Auto-Mute Mode'
> 		value Disabled
> 		comment {
> 			access 'read write'
> 			type ENUMERATED
> 			count 1
> 			item.0 Disabled
> 			item.1 Enabled
> 		}
> 	}
> 	control.6 {
> 		iface MIXER
> 		name 'Capture Volume'
> 		value.0 39
> 		value.1 39
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 63'
> 			dbmin -1725
> 			dbmax 3000
> 			dbvalue.0 1200
> 			dbvalue.1 1200
> 		}
> 	}
> 	control.7 {
> 		iface MIXER
> 		name 'Capture Switch'
> 		value.0 true
> 		value.1 true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 2
> 		}
> 	}
> 	control.8 {
> 		iface MIXER
> 		name 'Mic Boost Volume'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 2
> 			range '0 - 3'
> 			dbmin 0
> 			dbmax 3000
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> 	control.9 {
> 		iface MIXER
> 		name 'Master Playback Volume'
> 		value 56
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 1
> 			range '0 - 87'
> 			dbmin -6525
> 			dbmax 0
> 			dbvalue.0 -2325
> 		}
> 	}
> 	control.10 {
> 		iface MIXER
> 		name 'Master Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.11 {
> 		iface CARD
> 		name 'Mic Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.12 {
> 		iface CARD
> 		name 'Headphone Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.13 {
> 		iface CARD
> 		name 'Speaker Phantom Jack'
> 		value true
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.14 {
> 		iface PCM
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access read
> 			type INTEGER
> 			count 2
> 			range '0 - 36'
> 		}
> 	}
> 	control.15 {
> 		iface PCM
> 		name 'Capture Channel Map'
> 		value.0 0
> 		value.1 0
> 		comment {
> 			access read
> 			type INTEGER
> 			count 2
> 			range '0 - 36'
> 		}
> 	}
> 	control.16 {
> 		iface MIXER
> 		name 'PCM Playback Volume'
> 		value.0 255
> 		value.1 255
> 		comment {
> 			access 'read write user'
> 			type INTEGER
> 			count 2
> 			range '0 - 255'
> 			tlv '0000000100000008ffffec1400000014'
> 			dbmin -5100
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> }
> --endcollapse--
> 
> 
> !!All Loaded Modules
> !!------------------
> 
> Module
> ccm
> rfcomm
> snd_soc_dmic
> snd_soc_acp6x_mach
> snd_acp6x_pdm_dma
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> snd_sof_pci
> snd_sof_xtensa_dsp
> snd_sof
> snd_hda_codec_realtek
> snd_hda_codec_generic
> ledtrig_audio
> intel_rapl_msr
> snd_sof_utils
> intel_rapl_common
> snd_hda_codec_hdmi
> snd_hda_intel
> snd_soc_core
> snd_intel_dspcfg
> edac_mce_amd
> snd_compress
> ac97_bus
> snd_pcm_dmaengine
> snd_pci_ps
> kvm_amd
> snd_rpl_pci_acp6x
> snd_acp_pci
> snd_intel_sdw_acpi
> snd_pci_acp6x
> cmac
> algif_hash
> snd_hda_codec
> algif_skcipher
> snd_hda_core
> af_alg
> bnep
> snd_hwdep
> rtw89_8852be
> rtw89_8852b
> kvm
> rtw89_pci
> irqbypass
> crct10dif_pclmul
> polyval_clmulni
> snd_pcm
> rtw89_core
> polyval_generic
> snd_seq_midi
> uvcvideo
> snd_seq_midi_event
> amdgpu
> snd_rawmidi
> ghash_clmulni_intel
> sha512_ssse3
> aesni_intel
> crypto_simd
> cryptd
> videobuf2_vmalloc
> rapl
> btusb
> btrtl
> uvc
> btbcm
> videobuf2_memops
> btintel
> btmtk
> videobuf2_v4l2
> mac80211
> videodev
> snd_seq
> videobuf2_common
> mc
> bluetooth
> snd_seq_device
> snd_timer
> iommu_v2
> drm_buddy
> gpu_sched
> drm_ttm_helper
> input_leds
> joydev
> hp_wmi
> ecdh_generic
> ecc
> ttm
> sparse_keymap
> binfmt_misc
> platform_profile
> wmi_bmof
> serio_raw
> drm_display_helper
> hid_multitouch
> snd
> nls_iso8859_1
> k10temp
> cec
> cfg80211
> snd_pci_acp5x
> snd_rn_pci_acp3x
> rc_core
> snd_acp_config
> snd_soc_acpi
> snd_pci_acp3x
> drm_kms_helper
> i2c_algo_bit
> syscopyarea
> sysfillrect
> libarc4
> sysimgblt
> soundcore
> ccp
> mac_hid
> wireless_hotkey
> amd_pmc
> acpi_tad
> sch_fq_codel
> msr
> parport_pc
> ppdev
> lp
> parport
> efi_pstore
> pstore_blk
> ramoops
> pstore_zone
> reed_solomon
> drm
> ip_tables
> x_tables
> autofs4
> btrfs
> blake2b_generic
> xor
> raid6_pq
> libcrc32c
> hid_generic
> nvme
> nvme_core
> video
> crc32_pclmul
> i2c_piix4
> xhci_pci
> xhci_pci_renesas
> nvme_common
> wmi
> i2c_hid_acpi
> i2c_hid
> hid
> 
> 
> !!Sysfs Files
> !!-----------
> 
> /sys/class/sound/hwC0D0/init_pin_configs:
> 0x03 0x185600f0
> 0x05 0x585600f0
> 0x07 0x585600f0
> 0x09 0x585600f0
> 0x0b 0x585600f0
> 
> /sys/class/sound/hwC0D0/driver_pin_configs:
> 
> /sys/class/sound/hwC0D0/user_pin_configs:
> 
> /sys/class/sound/hwC0D0/init_verbs:
> 
> /sys/class/sound/hwC0D0/hints:
> 
> /sys/class/sound/hwC1D0/init_pin_configs:
> 0x12 0x411111f0
> 0x13 0x40000000
> 0x14 0x90170110
> 0x18 0x411111f0
> 0x19 0x03a11020
> 0x1a 0x411111f0
> 0x1b 0x411111f0
> 0x1d 0x40600001
> 0x1e 0x411111f0
> 0x21 0x03211040
> 
> /sys/class/sound/hwC1D0/driver_pin_configs:
> 
> /sys/class/sound/hwC1D0/user_pin_configs:
> 
> /sys/class/sound/hwC1D0/init_verbs:
> 
> /sys/class/sound/hwC1D0/hints:
> 
> 
> !!ALSA/HDA dmesg
> !!--------------
> 
> [    0.242492] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.242756] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.242983] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    5.909971] [drm] amdgpu kernel modesetting enabled.
> [    6.074322] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    6.077170] amdgpu: Virtual CRAT table created for CPU
> --
> [    6.138613] amdgpu: ATOM BIOS: 102-MENDOCINO-006
> [    6.143415] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    6.143523] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    6.143704] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    6.188317] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    6.205666] intel_rapl_common: Found RAPL domain package
> --
> [    6.214814] [drm] VCN(0) encode is enabled in VM mode
> [    6.215434] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC236: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    6.215439] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    6.215440] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    6.215441] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    6.215442] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    6.215443] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
> [    6.253267] [drm] JPEG decode is enabled in VM mode
> --
> [    6.276850] [drm] Loading DMUB firmware via PSP: version=0x06000800
> [    6.279531] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    6.279592] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input14
> [    6.301748] [drm] use_doorbell being set to: [true]
> --
> [    6.541002] [drm] Display Core initialized with v3.2.223!
> [    6.541005] [drm] DP-HDMI FRL PCON supported
> [    6.547857] [drm] DMUB hardware initialized: version=0x06000800
> [    6.589156] rtw89_8852be 0000:02:00.0 wlp2s0: renamed from wlan0
> [    6.592714] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.714541] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> 
> 
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.4.63
> !!################################
> 
> !!Script ran on: Fri Jun  9 07:31:11 UTC 2023
> 
> 
> !!Linux Distribution
> !!------------------
> 
> Ubuntu 22.04.2 LTS \n \l DISTRIB_ID=Ubuntu DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS" PRETTY_NAME="Ubuntu 22.04.2 LTS" NAME="Ubuntu" ID=ubuntu ID_LIKE=debian HOME_URL="https://www.ubuntu.com/" SUPPORT_URL="https://help.ubuntu.com/" BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENAME=jammy
> 
> 
> !!DMI Information
> !!---------------
> 
> Manufacturer:      HP
> Product Name:      HP Laptop 15z-fc000
> Product Version:   
> Firmware Version:  F.07
> 
> 
> !!Kernel Information
> !!------------------
> 
> Kernel release:    6.3.6-2023jun07both
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.3.6-2023jun07both
> Library version:    1.2.6.1
> Utilities version:  1.2.6
> 
> 
> !!Loaded ALSA modules
> !!-------------------
> 
> snd_hda_intel
> 
> 
> !!Sound Servers on this system
> !!----------------------------
> 
> Pulseaudio:
>       Installed - Yes (/usr/bin/pulseaudio)
>       Running - Yes
> 
> 
> !!Soundcards recognised by ALSA
> !!-----------------------------
> 
>  0 [Generic        ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc8000 irq 58
> 
> 
> !!PCI Soundcards installed in the system
> !!--------------------------------------
> 
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1640
> 03:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor (rev 6f)
> 03:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller
> 
> 
> !!Advanced information - PCI Vendor/Device/Subsystem ID's
> !!-------------------------------------------------------
> 
> 03:00.1 0403: 1002:1640
> 	Subsystem: 103c:8b2f
> --
> 03:00.6 0403: 1022:15e3
> 	Subsystem: 103c:8b2f
> 
> 
> !!Modprobe options (Sound related)
> !!--------------------------------
> 
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_usb_audio: index=-2
> snd_usb_caiaq: index=-2
> snd_usb_ua101: index=-2
> snd_usb_us122l: index=-2
> snd_usb_usx2y: index=-2
> snd_cmipci: mpu_port=0x330 fm_port=0x388
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> snd_hda_intel: power_save=0
> 
> 
> !!Loaded sound module options
> !!---------------------------
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : Y
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 0
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> 
> !!HDA-Intel Codec information
> !!---------------------------
> --startcollapse--
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100800
> No Modem Function Group found
> Default PCM:
>     rates [0x70]: 32000 44100 48000
>     bits [0x2]: 16
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D3 CLKSTOP EPSS
>   Power: setting=D0, actual=D0, Clock-stop-OK
> GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
> Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital: Enabled
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x02
> Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x04
> Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x06
> Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x08
> Node 0x0a [Audio Output] wcaps 0x221: Stereo Digital Stripe
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
> Node 0x0b [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0xf, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x0a
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  4 Jun  9 03:26 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  3 Jun  9 03:26 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  2 Jun  9 03:26 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  1 Jun  9 03:26 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 03:26 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  60 Jun  9 03:26 .
> drwxr-xr-x 3 root root 160 Jun  9 03:26 ..
> lrwxrwxrwx 1 root root  12 Jun  9 03:26 pci-0000:03:00.1 -> ../controlC0
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card 0 [Generic]
> 
> Card sysdefault:0 'Generic'/'HD-Audio Generic at 0xfccc8000 irq 58'
>   Mixer name	: 'ATI R6xx HDMI'
>   Components	: 'HDA:1002aa01,00aa0100,00100800'
>   Controls      : 8
>   Simple ctrls  : 2
> Simple mixer control 'PCM',0
>   Capabilities: pvolume
>   Playback channels: Front Left - Front Right
>   Limits: Playback 0 - 255
>   Mono:
>   Front Left: Playback 255 [100%] [0.00dB]
>   Front Right: Playback 255 [100%] [0.00dB]
> Simple mixer control 'IEC958',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> 
> 
> !!Alsactl output
> !!--------------
> 
> --startcollapse--
> state.Generic {
> 	control.1 {
> 		iface CARD
> 		name 'HDMI/DP,pcm=3 Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'IEC958 Playback Con Mask'
> 		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'IEC958 Playback Pro Mask'
> 		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'IEC958 Playback Default'
> 		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access 'read write'
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'IEC958 Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.6 {
> 		iface PCM
> 		device 3
> 		name ELD
> 		value ''
> 		comment {
> 			access 'read volatile'
> 			type BYTES
> 			count 0
> 		}
> 	}
> 	control.7 {
> 		iface PCM
> 		device 3
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		value.2 0
> 		value.3 0
> 		value.4 0
> 		value.5 0
> 		value.6 0
> 		value.7 0
> 		comment {
> 			access 'read write'
> 			type INTEGER
> 			count 8
> 			range '0 - 36'
> 		}
> 	}
> 	control.8 {
> 		iface MIXER
> 		name 'PCM Playback Volume'
> 		value.0 255
> 		value.1 255
> 		comment {
> 			access 'read write user'
> 			type INTEGER
> 			count 2
> 			range '0 - 255'
> 			tlv '0000000100000008ffffec1400000014'
> 			dbmin -5100
> 			dbmax 0
> 			dbvalue.0 0
> 			dbvalue.1 0
> 		}
> 	}
> }
> --endcollapse--
> 
> 
> !!All Loaded Modules
> !!------------------
> 
> Module
> rfcomm
> ccm
> cmac
> algif_hash
> algif_skcipher
> af_alg
> bnep
> snd_acp6x_pdm_dma
> snd_soc_acp6x_mach
> snd_soc_dmic
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> snd_sof_pci
> snd_sof_xtensa_dsp
> snd_sof
> snd_sof_utils
> snd_soc_core
> snd_compress
> ac97_bus
> snd_pcm_dmaengine
> rtw89_8852be
> intel_rapl_msr
> intel_rapl_common
> snd_pci_ps
> rtw89_8852b
> snd_rpl_pci_acp6x
> snd_acp_pci
> rtw89_pci
> edac_mce_amd
> snd_pci_acp6x
> amdgpu
> snd_hda_codec_hdmi
> kvm_amd
> snd_seq_midi
> snd_hda_intel
> snd_intel_dspcfg
> rtw89_core
> snd_seq_midi_event
> snd_intel_sdw_acpi
> snd_hda_codec
> snd_hda_core
> uvcvideo
> kvm
> snd_hwdep
> snd_rawmidi
> videobuf2_vmalloc
> uvc
> videobuf2_memops
> videobuf2_v4l2
> videodev
> snd_pcm
> irqbypass
> btusb
> videobuf2_common
> btrtl
> btbcm
> crct10dif_pclmul
> mac80211
> polyval_clmulni
> polyval_generic
> ghash_clmulni_intel
> sha512_ssse3
> btintel
> aesni_intel
> mc
> binfmt_misc
> crypto_simd
> btmtk
> cryptd
> snd_seq
> rapl
> iommu_v2
> snd_seq_device
> bluetooth
> drm_buddy
> joydev
> snd_timer
> input_leds
> gpu_sched
> hp_wmi
> drm_ttm_helper
> sparse_keymap
> serio_raw
> platform_profile
> wmi_bmof
> ecdh_generic
> hid_multitouch
> ecc
> nls_iso8859_1
> snd
> ttm
> k10temp
> drm_display_helper
> cec
> rc_core
> drm_kms_helper
> snd_pci_acp5x
> snd_rn_pci_acp3x
> snd_acp_config
> i2c_algo_bit
> snd_soc_acpi
> ccp
> soundcore
> syscopyarea
> snd_pci_acp3x
> sysfillrect
> sysimgblt
> cfg80211
> libarc4
> mac_hid
> amd_pmc
> wireless_hotkey
> acpi_tad
> sch_fq_codel
> msr
> parport_pc
> ppdev
> lp
> ramoops
> parport
> reed_solomon
> drm
> pstore_blk
> pstore_zone
> efi_pstore
> ip_tables
> x_tables
> autofs4
> btrfs
> blake2b_generic
> xor
> raid6_pq
> libcrc32c
> hid_generic
> nvme
> nvme_core
> video
> crc32_pclmul
> i2c_piix4
> xhci_pci
> xhci_pci_renesas
> nvme_common
> wmi
> i2c_hid_acpi
> i2c_hid
> hid
> 
> 
> !!Sysfs Files
> !!-----------
> 
> /sys/class/sound/hwC0D0/init_pin_configs:
> 0x03 0x185600f0
> 0x05 0x585600f0
> 0x07 0x585600f0
> 0x09 0x585600f0
> 0x0b 0x585600f0
> 
> /sys/class/sound/hwC0D0/driver_pin_configs:
> 
> /sys/class/sound/hwC0D0/user_pin_configs:
> 
> /sys/class/sound/hwC0D0/init_verbs:
> 
> /sys/class/sound/hwC0D0/hints:
> 
> 
> !!ALSA/HDA dmesg
> !!--------------
> 
> [    0.000000] Linux version 6.3.6-2023jun07both (root@04db45a9ce31) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #21 SMP PREEMPT_DYNAMIC Wed Jun  7 14:43:43 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.000000] KERNEL supported cpus:
> --
> [    0.021560] Policy zone: Normal
> [    0.021561] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.021675] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-2023jun07both", will be passed to user space.
> --
> [    0.241538] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.241809] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.242032] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    3.208185] usb 5-1: Found UVC 1.50 device HP True Vision FHD Camera (30c9:009f)
> [    3.298605] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    3.298710] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    3.298866] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    3.315633] usbcore: registered new interface driver uvcvideo
> [    3.316826] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    3.347970] kvm_amd: TSC scaling supported
> --
> [    3.925511] Bluetooth: hci0: AOSP quality report is not supported
> [    5.099873] snd_hda_intel 0000:03:00.6: azx_get_response timeout, switching to polling mode: last cmd=0x800f0005
> [    5.100253] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    5.106005] MCE: In-kernel MCE decoding enabled.
> --
> [    5.990298] [drm] Display Core initialized with v3.2.223!
> [    5.990305] [drm] DP-HDMI FRL PCON supported
> [    6.001698] [drm] DMUB hardware initialized: version=0x06000800
> [    6.102000] snd_hda_intel 0000:03:00.6: No response from codec, disabling MSI: last cmd=0x800f0005
> [    6.118503] Bluetooth: hci0: Failed to read codec capabilities (-22)
> --
> [    6.138508] Bluetooth: hci0: AOSP quality report is not supported
> [    6.183564] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.286096] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> --
> [    6.663704] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    7.107135] snd_hda_intel 0000:03:00.6: azx_get_response timeout, switching to single_cmd mode: last cmd=0x800f0005
> [    7.628111] loop13: detected capacity change from 0 to 8
> --
> [   13.168364] hdaudio hdaudioC1D0: no AFG or MFG node found
> [   13.168378] snd_hda_intel 0000:03:00.6: no codecs initialized
> [   13.913800] Bluetooth: RFCOMM TTY layer initialized
> 
> 
