Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C630672A9B8
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 09:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1B720C;
	Sat, 10 Jun 2023 09:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1B720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686381074;
	bh=NHF3hF42BCfzWyYzrWmN5rTIKbyTJ0q/5cDj8L6vt4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=karn7lJwMFuuWgm8hKpcdexIwe7yZliOBtBlasTwUogFdREGzKjvNHhb2FTRzY4+p
	 xY1IxszqF8XhMDsMniN4RycsKmbuKrGqrqFR+vodt71cWfyfdEDiAx4lCmAO+ibTCp
	 175J6sHY3Bafu4348kwZJ+R0egPwIUrOT0EKutl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F97CF80527; Sat, 10 Jun 2023 09:10:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF8AF8016C;
	Sat, 10 Jun 2023 09:10:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 369EBF80199; Sat, 10 Jun 2023 09:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86157F800ED
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 09:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86157F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KYuZbmGZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ri1V4Z7t
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1CB61F893;
	Sat, 10 Jun 2023 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686380956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV3f6CdR8zYtBiMR/S3MsI2XnBSDKj3+2pfZEBgyrk8=;
	b=KYuZbmGZyGCteDaE4Q/RP8lFYwp+FAyTUpgx/BCvBqxvtR416ZjE7GJ649rwkV44IuLuIb
	+Lo/YcWyE0xWU3dSrjxeQvZq6XiSjwKvexhGf+Amr1exRfEZRwvWAbukrkP2USXvNATjaA
	rfzhnc1xrvkGnI1Wpp6TYQ77tZOWp/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686380956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV3f6CdR8zYtBiMR/S3MsI2XnBSDKj3+2pfZEBgyrk8=;
	b=Ri1V4Z7tV8wJvtW8Rg3Be4umX/3BQ9Fw2qdghriX0/5u4Pr/9OIupb/PfWJyXgeQFUs2TJ
	CIwj6JaL2vdDTVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E7AF13398;
	Sat, 10 Jun 2023 07:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HeMiFpwhhGTmaQAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 10 Jun 2023 07:09:16 +0000
Date: Sat, 10 Jun 2023 09:09:15 +0200
Message-ID: <875y7vbxpg.wl-tiwai@suse.de>
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
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
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
	<878rctcavz.wl-tiwai@suse.de>
	<874jnhc9u4.wl-tiwai@suse.de>
	<CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HB2J4CXVOZ45XSFMA33DPGVRXAN4WHGH
X-Message-ID-Hash: HB2J4CXVOZ45XSFMA33DPGVRXAN4WHGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HB2J4CXVOZ45XSFMA33DPGVRXAN4WHGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 18:47:19 +0200,
Joseph C. Sible wrote:
> 
> On Fri, Jun 9, 2023 at 4:35 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > When you load snd-hda-intel module with "model=,generic" option (the
> > > command is intentional), does the codec content show up?
> >
> > Also, assuming it being some timing issue, adding the delay forcibly
> > like below has any influence on the AFG error?
> >
> >
> > Takashi
> >
> > --- a/sound/pci/hda/hda_proc.c
> > +++ b/sound/pci/hda/hda_proc.c
> > @@ -792,6 +792,7 @@ static void print_codec_info(struct snd_info_entry *entry,
> >         snd_iprintf(buffer, "State of AFG node 0x%02x:\n", fg);
> >         print_power_state(buffer, codec, fg);
> >
> > +       msleep(100); // XXX
> >         nodes = snd_hda_get_sub_nodes(codec, fg, &nid);
> >         if (! nid || nodes < 0) {
> >                 snd_iprintf(buffer, "Invalid AFG subtree\n");
> 
> I attached three more alsa-info dumps. In all of them, the kernel had
> my partial revert patch and "snd_hda_intel.power_save=0" on the kernel
> command line. The ones with "generic" in the name additionally had
> "snd_hda_intel.model=,generic" on the kernel command line. The ones
> with "delay" in the name additionally had your above delay patch.

Thanks for quick testing.

But, the patch to add a delay was meant to apply on top of the two
patches from Kailang but only with power_save=0 option.  The model
option changes the behavior completely and no Realtek codec driver is
bound when the option is given in that way.

> It looks like the delay didn't change anything in the dumps, but
> snd_hda_intel.model=,generic did result in "Invalid AFG subtree" not
> being there anymore.

In anyway, the fact that "model=,generic" makes the AFG error away
implies that some verbs in Realtek codec driver screws up the codec
chip.  If the delay doesn't help, we'll need to identify which verb is
the culprit -- which is cumbersome...


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
> !!Script ran on: Fri Jun  9 16:37:48 UTC 2023
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
> Kernel release:    6.3.6-delayrevert256
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.3.6-delayrevert256
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
> crw-rw----+ 1 root audio 116,  4 Jun  9 12:37 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  8 Jun  9 12:37 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  3 Jun  9 12:37 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  7 Jun  9 12:37 /dev/snd/hwC1D0
> crw-rw----+ 1 root audio 116,  2 Jun  9 12:37 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  6 Jun  9 12:37 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  5 Jun  9 12:37 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116,  1 Jun  9 12:37 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 12:37 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Jun  9 12:37 .
> drwxr-xr-x 3 root root 240 Jun  9 12:37 ..
> lrwxrwxrwx 1 root root  12 Jun  9 12:37 pci-0000:03:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Jun  9 12:37 pci-0000:03:00.6 -> ../controlC1
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
> cmac
> algif_hash
> algif_skcipher
> af_alg
> bnep
> intel_rapl_msr
> intel_rapl_common
> edac_mce_amd
> kvm_amd
> snd_soc_acp6x_mach
> snd_acp6x_pdm_dma
> kvm
> snd_soc_dmic
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> snd_sof_pci
> uvcvideo
> videobuf2_vmalloc
> uvc
> snd_hda_codec_realtek
> videobuf2_memops
> snd_sof_xtensa_dsp
> snd_hda_codec_generic
> ledtrig_audio
> snd_hda_codec_hdmi
> videobuf2_v4l2
> irqbypass
> crct10dif_pclmul
> snd_sof
> polyval_clmulni
> amdgpu
> snd_sof_utils
> polyval_generic
> videodev
> ghash_clmulni_intel
> snd_hda_intel
> sha512_ssse3
> snd_intel_dspcfg
> aesni_intel
> btusb
> snd_intel_sdw_acpi
> crypto_simd
> snd_soc_core
> btrtl
> iommu_v2
> videobuf2_common
> cryptd
> btbcm
> drm_buddy
> snd_compress
> btintel
> joydev
> snd_hda_codec
> mc
> gpu_sched
> ac97_bus
> snd_hda_core
> snd_pcm_dmaengine
> btmtk
> rapl
> snd_hwdep
> snd_pci_ps
> drm_ttm_helper
> snd_rpl_pci_acp6x
> ttm
> snd_acp_pci
> drm_display_helper
> input_leds
> snd_seq_midi
> cec
> bluetooth
> rtw89_8852be
> snd_seq_midi_event
> snd_pci_acp6x
> rtw89_8852b
> ecdh_generic
> hid_multitouch
> snd_rawmidi
> hp_wmi
> ecc
> snd_pcm
> rc_core
> rtw89_pci
> sparse_keymap
> platform_profile
> rtw89_core
> k10temp
> drm_kms_helper
> serio_raw
> snd_seq
> binfmt_misc
> snd_pci_acp5x
> wmi_bmof
> snd_seq_device
> i2c_algo_bit
> snd_rn_pci_acp3x
> nls_iso8859_1
> syscopyarea
> mac80211
> snd_timer
> snd
> snd_acp_config
> sysfillrect
> snd_soc_acpi
> sysimgblt
> ccp
> snd_pci_acp3x
> soundcore
> cfg80211
> libarc4
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
> ramoops
> drm
> pstore_blk
> reed_solomon
> efi_pstore
> pstore_zone
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
> [    0.000000] Linux version 6.3.6-delayrevert256 (root@d7eba8393795) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #25 SMP PREEMPT_DYNAMIC Fri Jun  9 13:40:12 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.000000] KERNEL supported cpus:
> --
> [    0.021703] Policy zone: Normal
> [    0.021705] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0
> [    0.021819] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256", will be passed to user space.
> --
> [    0.242806] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.243073] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.243295] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    2.975325] rtw89_8852be 0000:02:00.0: enabling device (0000 -> 0003)
> [    2.976435] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    2.977931] input: HP WMI hotkeys as /devices/virtual/input/input8
> --
> [    3.558557] Bluetooth: hci0: RTL: cfg_sz 6, total sz 38955
> [    3.559143] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    3.565020] videodev: Linux video capture interface: v2.00
> [    3.604652] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    3.607841] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    3.742133] rtw89_8852be 0000:02:00.0 wlp2s0: renamed from wlan0
> --
> [    5.352565] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x1506 0x103C:0x8B2F 0xC4).
> [    5.370605] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC236: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    5.370612] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    5.370613] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    5.370615] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    5.370616] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    5.370617] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
> [    5.372701] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    5.400647] usb 5-1: Found UVC 1.50 device HP True Vision FHD Camera (30c9:009f)
> --
> [    5.419049] amdgpu: ATOM BIOS: 102-MENDOCINO-006
> [    5.425992] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    5.443060] [drm] VCN(0) decode is enabled in VM mode
> --
> [    5.445007] [drm] JPEG decode is enabled in VM mode
> [    5.456299] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input14
> [    5.470400] Console: switching to colour dummy device 80x25
> --
> [    5.748875] [drm] Display Core initialized with v3.2.223!
> [    5.748880] [drm] DP-HDMI FRL PCON supported
> [    5.751660] [drm] DMUB hardware initialized: version=0x06000800
> [    5.807792] NET: Registered PF_ALG protocol family
> [    5.895334] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    5.975990] kauditd_printk_skb: 59 callbacks suppressed
> 
> 
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.4.63
> !!################################
> 
> !!Script ran on: Fri Jun  9 16:28:22 UTC 2023
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
>                       HD-Audio Generic at 0xfccc8000 irq 58
>  1 [Generic_1      ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc0000 irq 59
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
> snd_hda_intel: model=,generic
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
> 	model : ,generic,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
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
> 	model : ,generic,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
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
> Codec: Realtek Generic
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0236
> Subsystem Id: 0x103c8b2f
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
>   Power: setting=D0, actual=D0
> GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
>   IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
> Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Speaker Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x33 0x33]
>   Converter: stream=5, channel=0
>   PCM:
>     rates [0x60]: 44100 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Headphone Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Device: name="Generic Analog", type="Audio", device=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x00 0x00]
>   Converter: stream=5, channel=0
>   PCM:
>     rates [0x60]: 44100 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
>   PCM:
>     rates [0x5e0]: 44100 48000 88200 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x24
> Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Control: name="Capture Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Control: name="Capture Switch", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Device: name="Generic Analog", type="Audio", device=0
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x27 0x27]
>   Converter: stream=1, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x23
> Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x22
> Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x40000000: [N/A] Line Out at Ext N/A
>     Conn = Unknown, Color = Unknown
>     DefAssociation = 0x0, Sequence = 0x0
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Speaker Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x00 0x00]
>   Pincap 0x00010014: OUT EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x90170110: [Fixed] Speaker at Int N/A
>     Conn = Analog, Color = Unknown
>     DefAssociation = 0x1, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x02
> Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x17 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x20: IN VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Control: name="Mic Boost Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x03a11020: [Jack] Mic at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x2, Sequence = 0x0
>   Pin-ctls: 0x24: IN VREF_80
>   Unsolicited: tag=02, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00: VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x00013734: IN OUT EAPD Detect
>     Vref caps: HIZ 50 GRD 80 100
>   EAPD 0x2: EAPD
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x20: IN VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02* 0x03
> Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x1d [Pin Complex] wcaps 0x400400: Mono
>   Pincap 0x00000020: IN
>   Pin Default 0x40600001: [N/A] Modem Line at Ext N/A
>     Conn = Unknown, Color = Unknown
>     DefAssociation = 0x0, Sequence = 0x1
>   Pin-ctls: 0x20: IN
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
>   Pincap 0x00000014: OUT Detect
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x06
> Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
>   Processing caps: benign=0, ncoeff=91
>     Coeff 0x00: 0x1002
>     Coeff 0x01: 0xca4c
>     Coeff 0x02: 0x8a2a
>     Coeff 0x03: 0x0002
>     Coeff 0x04: 0xaa09
>     Coeff 0x05: 0x0700
>     Coeff 0x06: 0x6114
>     Coeff 0x07: 0x0200
>     Coeff 0x08: 0x6a0c
>     Coeff 0x09: 0xe003
>     Coeff 0x0a: 0x7770
>     Coeff 0x0b: 0x7778
>     Coeff 0x0c: 0x01ef
>     Coeff 0x0d: 0x8020
>     Coeff 0x0e: 0x0000
>     Coeff 0x0f: 0x7778
>     Coeff 0x10: 0x0020
>     Coeff 0x11: 0x7418
>     Coeff 0x12: 0xebc4
>     Coeff 0x13: 0x422f
>     Coeff 0x14: 0x0400
>     Coeff 0x15: 0x8ccc
>     Coeff 0x16: 0x6e50
>     Coeff 0x17: 0xff00
>     Coeff 0x18: 0x0003
>     Coeff 0x19: 0x3e12
>     Coeff 0x1a: 0x8003
>     Coeff 0x1b: 0x0a4b
>     Coeff 0x1c: 0x0000
>     Coeff 0x1d: 0x0000
>     Coeff 0x1e: 0x0000
>     Coeff 0x1f: 0x0000
>     Coeff 0x20: 0x51ff
>     Coeff 0x21: 0x8000
>     Coeff 0x22: 0x8f00
>     Coeff 0x23: 0x88f4
>     Coeff 0x24: 0x0000
>     Coeff 0x25: 0x0000
>     Coeff 0x26: 0x0000
>     Coeff 0x27: 0x0000
>     Coeff 0x28: 0x0000
>     Coeff 0x29: 0x3000
>     Coeff 0x2a: 0x0000
>     Coeff 0x2b: 0x0000
>     Coeff 0x2c: 0x0f00
>     Coeff 0x2d: 0x1f4f
>     Coeff 0x2e: 0x4001
>     Coeff 0x2f: 0xd557
>     Coeff 0x30: 0x1000
>     Coeff 0x31: 0xe200
>     Coeff 0x32: 0x5f24
>     Coeff 0x33: 0x8400
>     Coeff 0x34: 0xa20c
>     Coeff 0x35: 0x8c6a
>     Coeff 0x36: 0x7151
>     Coeff 0x37: 0xfe05
>     Coeff 0x38: 0xa901
>     Coeff 0x39: 0x330a
>     Coeff 0x3a: 0x0050
>     Coeff 0x3b: 0x60d9
>     Coeff 0x3c: 0x0314
>     Coeff 0x3d: 0xc2ba
>     Coeff 0x3e: 0xa928
>     Coeff 0x3f: 0x0001
>     Coeff 0x40: 0x9800
>     Coeff 0x41: 0x0000
>     Coeff 0x42: 0x2000
>     Coeff 0x43: 0x3c90
>     Coeff 0x44: 0x2200
>     Coeff 0x45: 0x5089
>     Coeff 0x46: 0x0004
>     Coeff 0x47: 0xa47a
>     Coeff 0x48: 0xd049
>     Coeff 0x49: 0x0049
>     Coeff 0x4a: 0x0000
>     Coeff 0x4b: 0x5555
>     Coeff 0x4c: 0x465c
>     Coeff 0x4d: 0x7fff
>     Coeff 0x4e: 0x7fff
>     Coeff 0x4f: 0x0000
>     Coeff 0x50: 0x0000
>     Coeff 0x51: 0x2f2f
>     Coeff 0x52: 0x0100
>     Coeff 0x53: 0x3320
>     Coeff 0x54: 0xcc00
>     Coeff 0x55: 0x0000
>     Coeff 0x56: 0x3f00
>     Coeff 0x57: 0x0000
>     Coeff 0x58: 0x0000
>     Coeff 0x59: 0x0000
>     Coeff 0x5a: 0x1300
> Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Headphone Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x0001001c: OUT HP EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x03211040: [Jack] HP Out at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x4, Sequence = 0x0
>   Pin-ctls: 0xc0: OUT HP
>   Unsolicited: tag=01, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02 0x03*
> Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 5
>      0x18 0x19 0x1a 0x1b 0x1d
> Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x80 0x80] [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 6
>      0x18 0x19 0x1a 0x1b 0x1d 0x12
> Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
>   Connection: 2
>      0x12* 0x13
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  4 Jun  9 12:21 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  8 Jun  9 12:21 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  3 Jun  9 12:21 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  7 Jun  9 12:21 /dev/snd/hwC1D0
> crw-rw----+ 1 root audio 116,  2 Jun  9 12:21 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  6 Jun  9 12:21 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  5 Jun  9 12:21 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116,  1 Jun  9 12:21 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 12:21 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Jun  9 12:21 .
> drwxr-xr-x 3 root root 240 Jun  9 12:21 ..
> lrwxrwxrwx 1 root root  12 Jun  9 12:21 pci-0000:03:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Jun  9 12:21 pci-0000:03:00.6 -> ../controlC1
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
> card 1: Generic_1 [HD-Audio Generic], device 0: Generic Analog [Generic Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> card 1: Generic_1 [HD-Audio Generic], device 0: Generic Analog [Generic Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
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
> !!-------Mixer controls for card 1 [Generic_1]
> 
> Card sysdefault:1 'Generic_1'/'HD-Audio Generic at 0xfccc0000 irq 59'
>   Mixer name	: 'Realtek Generic'
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
> cpuid
> ccm
> rfcomm
> cmac
> algif_hash
> algif_skcipher
> af_alg
> bnep
> snd_soc_acp6x_mach
> snd_soc_dmic
> snd_acp6x_pdm_dma
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> intel_rapl_msr
> snd_sof_pci
> snd_sof_xtensa_dsp
> snd_sof
> amdgpu
> rtw89_8852be
> rtw89_8852b
> rtw89_pci
> snd_hda_codec_realtek
> intel_rapl_common
> snd_sof_utils
> rtw89_core
> edac_mce_amd
> kvm_amd
> snd_soc_core
> kvm
> snd_hda_codec_generic
> ledtrig_audio
> snd_hda_codec_hdmi
> snd_hda_intel
> snd_intel_dspcfg
> snd_intel_sdw_acpi
> uvcvideo
> btusb
> snd_hda_codec
> btrtl
> btbcm
> mac80211
> btintel
> btmtk
> snd_hda_core
> videobuf2_vmalloc
> snd_hwdep
> irqbypass
> uvc
> bluetooth
> crct10dif_pclmul
> iommu_v2
> videobuf2_memops
> snd_compress
> ac97_bus
> polyval_clmulni
> drm_buddy
> snd_pcm_dmaengine
> videobuf2_v4l2
> polyval_generic
> ghash_clmulni_intel
> snd_pci_ps
> sha512_ssse3
> gpu_sched
> input_leds
> snd_rpl_pci_acp6x
> snd_acp_pci
> snd_pci_acp6x
> snd_seq_midi
> videodev
> aesni_intel
> snd_seq_midi_event
> ecdh_generic
> ecc
> drm_ttm_helper
> ttm
> crypto_simd
> snd_rawmidi
> cryptd
> hp_wmi
> binfmt_misc
> sparse_keymap
> videobuf2_common
> rapl
> platform_profile
> mc
> snd_pcm
> serio_raw
> wmi_bmof
> joydev
> snd_seq
> drm_display_helper
> nls_iso8859_1
> hid_multitouch
> snd_seq_device
> cec
> cfg80211
> rc_core
> snd_timer
> k10temp
> snd_pci_acp5x
> drm_kms_helper
> snd_rn_pci_acp3x
> snd
> snd_acp_config
> snd_soc_acpi
> snd_pci_acp3x
> libarc4
> soundcore
> ccp
> i2c_algo_bit
> syscopyarea
> sysfillrect
> sysimgblt
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
> ramoops
> reed_solomon
> pstore_blk
> pstore_zone
> drm
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
> [    0.000000] Linux version 6.3.6-revert256 (root@9e641f150fc9) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #24 SMP PREEMPT_DYNAMIC Thu Jun  8 14:10:29 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-revert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0 snd_hda_intel.model=,generic
> [    0.000000] KERNEL supported cpus:
> --
> [    0.021433] Policy zone: Normal
> [    0.021435] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-revert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0 snd_hda_intel.model=,generic
> [    0.021563] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-revert256", will be passed to user space.
> --
> [    0.241551] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.241818] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.242042] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    3.211773] AES CTR mode by8 optimization enabled
> [    3.224143] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    3.236393] input: HP WMI hotkeys as /devices/virtual/input/input11
> --
> [    3.436389] Bluetooth: hci0: RTL: cfg_sz 6, total sz 38955
> [    3.489457] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    3.520442] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    3.522602] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    3.529351] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input12
> [    3.542505] snd_hda_codec_generic hdaudioC1D0: autoconfig for Generic: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    3.542518] snd_hda_codec_generic hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    3.542520] snd_hda_codec_generic hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    3.542521] snd_hda_codec_generic hdaudioC1D0:    mono: mono_out=0x0
> [    3.542522] snd_hda_codec_generic hdaudioC1D0:    inputs:
> [    3.542523] snd_hda_codec_generic hdaudioC1D0:      Mic=0x19
> [    3.549589] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    3.549627] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input14
> [    3.579206] usb 5-1: Found UVC 1.50 device HP True Vision FHD Camera (30c9:009f)
> --
> [    6.141914] [drm] Display Core initialized with v3.2.223!
> [    6.141916] [drm] DP-HDMI FRL PCON supported
> [    6.143864] [drm] DMUB hardware initialized: version=0x06000800
> [    6.213648] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.331287] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> 
> 
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.4.63
> !!################################
> 
> !!Script ran on: Fri Jun  9 16:32:40 UTC 2023
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
> Kernel release:    6.3.6-delayrevert256
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         x86_64
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.3.6-delayrevert256
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
>  0 [Generic_1      ]: HDA-Intel - HD-Audio Generic
>                       HD-Audio Generic at 0xfccc8000 irq 60
>  1 [Generic        ]: HDA-Intel - HD-Audio Generic
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
> snd_hda_intel: model=,generic
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
> 	model : ,generic,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
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
> 	model : ,generic,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
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
> Codec: Realtek Generic
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0236
> Subsystem Id: 0x103c8b2f
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
>   Power: setting=D0, actual=D0
> GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
>   IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
> Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Speaker Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x33 0x33]
>   Converter: stream=5, channel=0
>   PCM:
>     rates [0x60]: 44100 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Headphone Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Device: name="Generic Analog", type="Audio", device=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x00 0x00]
>   Converter: stream=5, channel=0
>   PCM:
>     rates [0x60]: 44100 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
>   Converter: stream=0, channel=0
>   Digital:
>   Digital category: 0x0
>   IEC Coding Type: 0x0
>   PCM:
>     rates [0x5e0]: 44100 48000 88200 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x24
> Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Control: name="Capture Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Control: name="Capture Switch", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Device: name="Generic Analog", type="Audio", device=0
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x27 0x27]
>   Converter: stream=1, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x23
> Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x22
> Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x40000000: [N/A] Line Out at Ext N/A
>     Conn = Unknown, Color = Unknown
>     DefAssociation = 0x0, Sequence = 0x0
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Speaker Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x00 0x00]
>   Pincap 0x00010014: OUT EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x90170110: [Fixed] Speaker at Int N/A
>     Conn = Analog, Color = Unknown
>     DefAssociation = 0x1, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x02
> Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x17 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x20: IN VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Control: name="Mic Boost Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x03a11020: [Jack] Mic at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x2, Sequence = 0x0
>   Pin-ctls: 0x24: IN VREF_80
>   Unsolicited: tag=02, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00: VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x00013734: IN OUT EAPD Detect
>     Vref caps: HIZ 50 GRD 80 100
>   EAPD 0x2: EAPD
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x20: IN VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02* 0x03
> Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x1d [Pin Complex] wcaps 0x400400: Mono
>   Pincap 0x00000020: IN
>   Pin Default 0x40600001: [N/A] Modem Line at Ext N/A
>     Conn = Unknown, Color = Unknown
>     DefAssociation = 0x0, Sequence = 0x1
>   Pin-ctls: 0x20: IN
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
>   Pincap 0x00000014: OUT Detect
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x06
> Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
>   Processing caps: benign=0, ncoeff=91
>     Coeff 0x00: 0x1002
>     Coeff 0x01: 0xca4c
>     Coeff 0x02: 0x8a2a
>     Coeff 0x03: 0x0002
>     Coeff 0x04: 0xaa09
>     Coeff 0x05: 0x0700
>     Coeff 0x06: 0x6114
>     Coeff 0x07: 0x0200
>     Coeff 0x08: 0x6a0c
>     Coeff 0x09: 0xe003
>     Coeff 0x0a: 0x7770
>     Coeff 0x0b: 0x7778
>     Coeff 0x0c: 0x01ef
>     Coeff 0x0d: 0x8020
>     Coeff 0x0e: 0x0000
>     Coeff 0x0f: 0x7778
>     Coeff 0x10: 0x0020
>     Coeff 0x11: 0x7418
>     Coeff 0x12: 0xebc4
>     Coeff 0x13: 0x422f
>     Coeff 0x14: 0x0400
>     Coeff 0x15: 0x8ccc
>     Coeff 0x16: 0x6e50
>     Coeff 0x17: 0xff00
>     Coeff 0x18: 0x0003
>     Coeff 0x19: 0x3e12
>     Coeff 0x1a: 0x8003
>     Coeff 0x1b: 0x0a4b
>     Coeff 0x1c: 0x0000
>     Coeff 0x1d: 0x0000
>     Coeff 0x1e: 0x0000
>     Coeff 0x1f: 0x0000
>     Coeff 0x20: 0x51ff
>     Coeff 0x21: 0x8000
>     Coeff 0x22: 0x8f00
>     Coeff 0x23: 0x88f4
>     Coeff 0x24: 0x0000
>     Coeff 0x25: 0x0000
>     Coeff 0x26: 0x0000
>     Coeff 0x27: 0x0000
>     Coeff 0x28: 0x0000
>     Coeff 0x29: 0x3000
>     Coeff 0x2a: 0x0000
>     Coeff 0x2b: 0x0000
>     Coeff 0x2c: 0x0f00
>     Coeff 0x2d: 0x1f4f
>     Coeff 0x2e: 0x4001
>     Coeff 0x2f: 0xd557
>     Coeff 0x30: 0x1000
>     Coeff 0x31: 0xe200
>     Coeff 0x32: 0x5f24
>     Coeff 0x33: 0x8400
>     Coeff 0x34: 0xa20c
>     Coeff 0x35: 0x8c6a
>     Coeff 0x36: 0x7151
>     Coeff 0x37: 0xfe05
>     Coeff 0x38: 0xa901
>     Coeff 0x39: 0x330a
>     Coeff 0x3a: 0x0050
>     Coeff 0x3b: 0x60d9
>     Coeff 0x3c: 0x0314
>     Coeff 0x3d: 0xc2ba
>     Coeff 0x3e: 0xa928
>     Coeff 0x3f: 0x0001
>     Coeff 0x40: 0x9800
>     Coeff 0x41: 0x0000
>     Coeff 0x42: 0x2000
>     Coeff 0x43: 0x3c90
>     Coeff 0x44: 0x2200
>     Coeff 0x45: 0x5089
>     Coeff 0x46: 0x0004
>     Coeff 0x47: 0xa47a
>     Coeff 0x48: 0xd049
>     Coeff 0x49: 0x0049
>     Coeff 0x4a: 0x0000
>     Coeff 0x4b: 0x5555
>     Coeff 0x4c: 0x465c
>     Coeff 0x4d: 0x7fff
>     Coeff 0x4e: 0x7fff
>     Coeff 0x4f: 0x0000
>     Coeff 0x50: 0x0000
>     Coeff 0x51: 0x2f2f
>     Coeff 0x52: 0x0100
>     Coeff 0x53: 0x3320
>     Coeff 0x54: 0xcc00
>     Coeff 0x55: 0x0000
>     Coeff 0x56: 0x3f00
>     Coeff 0x57: 0x0000
>     Coeff 0x58: 0x0000
>     Coeff 0x59: 0x0000
>     Coeff 0x5a: 0x1300
> Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Headphone Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x0001001c: OUT HP EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x03211040: [Jack] HP Out at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x4, Sequence = 0x0
>   Pin-ctls: 0xc0: OUT HP
>   Unsolicited: tag=01, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02 0x03*
> Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 5
>      0x18 0x19 0x1a 0x1b 0x1d
> Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x80 0x80] [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 6
>      0x18 0x19 0x1a 0x1b 0x1d 0x12
> Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
>   Connection: 2
>      0x12* 0x13
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  8 Jun  9 12:31 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  5 Jun  9 12:31 /dev/snd/controlC1
> crw-rw----+ 1 root audio 116,  7 Jun  9 12:31 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  4 Jun  9 12:31 /dev/snd/hwC1D0
> crw-rw----+ 1 root audio 116,  6 Jun  9 12:31 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  3 Jun  9 12:31 /dev/snd/pcmC1D0c
> crw-rw----+ 1 root audio 116,  2 Jun  9 12:32 /dev/snd/pcmC1D0p
> crw-rw----+ 1 root audio 116,  1 Jun  9 12:31 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Jun  9 12:31 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x 2 root root  80 Jun  9 12:31 .
> drwxr-xr-x 3 root root 240 Jun  9 12:31 ..
> lrwxrwxrwx 1 root root  12 Jun  9 12:31 pci-0000:03:00.1 -> ../controlC0
> lrwxrwxrwx 1 root root  12 Jun  9 12:31 pci-0000:03:00.6 -> ../controlC1
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: Generic_1 [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 1: Generic [HD-Audio Generic], device 0: Generic Analog [Generic Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> card 1: Generic [HD-Audio Generic], device 0: Generic Analog [Generic Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card 0 [Generic_1]
> 
> Card sysdefault:0 'Generic_1'/'HD-Audio Generic at 0xfccc8000 irq 60'
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
> !!-------Mixer controls for card 1 [Generic]
> 
> Card sysdefault:1 'Generic'/'HD-Audio Generic at 0xfccc0000 irq 61'
>   Mixer name	: 'Realtek Generic'
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
> state.Generic_1 {
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
> state.Generic {
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
> cmac
> algif_hash
> algif_skcipher
> af_alg
> bnep
> snd_soc_acp6x_mach
> snd_soc_dmic
> snd_acp6x_pdm_dma
> snd_hda_codec_realtek
> snd_sof_amd_rembrandt
> snd_sof_amd_renoir
> snd_sof_amd_acp
> snd_sof_pci
> snd_sof_xtensa_dsp
> snd_sof
> snd_sof_utils
> snd_soc_core
> snd_hda_codec_hdmi
> snd_hda_codec_generic
> ledtrig_audio
> snd_hda_intel
> snd_intel_dspcfg
> snd_compress
> snd_intel_sdw_acpi
> ac97_bus
> snd_pcm_dmaengine
> snd_hda_codec
> snd_pci_ps
> snd_rpl_pci_acp6x
> snd_acp_pci
> intel_rapl_msr
> snd_hda_core
> uvcvideo
> snd_pci_acp6x
> snd_hwdep
> intel_rapl_common
> videobuf2_vmalloc
> uvc
> edac_mce_amd
> videobuf2_memops
> snd_pcm
> videobuf2_v4l2
> kvm_amd
> amdgpu
> rtw89_8852be
> rtw89_8852b
> rtw89_pci
> rtw89_core
> snd_seq_midi
> snd_seq_midi_event
> kvm
> videodev
> snd_rawmidi
> videobuf2_common
> mac80211
> mc
> snd_seq
> irqbypass
> crct10dif_pclmul
> btusb
> polyval_clmulni
> iommu_v2
> btrtl
> polyval_generic
> ghash_clmulni_intel
> btbcm
> btintel
> btmtk
> drm_buddy
> sha512_ssse3
> bluetooth
> gpu_sched
> aesni_intel
> binfmt_misc
> crypto_simd
> drm_ttm_helper
> cryptd
> ecdh_generic
> ecc
> snd_seq_device
> rapl
> ttm
> snd_timer
> joydev
> input_leds
> drm_display_helper
> cec
> serio_raw
> rc_core
> cfg80211
> hp_wmi
> wmi_bmof
> sparse_keymap
> platform_profile
> hid_multitouch
> k10temp
> snd
> nls_iso8859_1
> snd_pci_acp5x
> drm_kms_helper
> snd_rn_pci_acp3x
> snd_acp_config
> snd_soc_acpi
> i2c_algo_bit
> snd_pci_acp3x
> syscopyarea
> sysfillrect
> ccp
> soundcore
> sysimgblt
> libarc4
> mac_hid
> wireless_hotkey
> acpi_tad
> amd_pmc
> sch_fq_codel
> msr
> parport_pc
> ppdev
> lp
> parport
> ramoops
> drm
> pstore_blk
> reed_solomon
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
> [    0.000000] Linux version 6.3.6-delayrevert256 (root@d7eba8393795) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #25 SMP PREEMPT_DYNAMIC Fri Jun  9 13:40:12 UTC 2023
> [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0 snd_hda_intel.model=,generic
> [    0.000000] KERNEL supported cpus:
> --
> [    0.021648] Policy zone: Normal
> [    0.021650] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256 root=UUID=37b2f75c-c227-423d-a77d-861356b0370d ro rootflags=subvol=@ quiet splash vt.handoff=7 snd_hda_intel.power_save=0 snd_hda_intel.model=,generic
> [    0.021777] Unknown kernel command line parameters "splash BOOT_IMAGE=/@/boot/vmlinuz-6.3.6-delayrevert256", will be passed to user space.
> --
> [    0.241559] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
> [    0.241827] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
> [    0.242049] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
> --
> [    5.895364] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0x1506 0x103C:0x8B2F 0xC4).
> [    5.897172] snd_pci_acp6x 0000:03:00.5: enabling device (0000 -> 0002)
> [    5.904012] rtw89_8852be 0000:02:00.0 wlp2s0: renamed from wlan0
> --
> [    5.911568] intel_rapl_common: Found RAPL domain core
> [    5.943277] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [    5.943362] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [    5.943608] snd_hda_intel 0000:03:00.6: enabling device (0000 -> 0002)
> [    5.954689] usbcore: registered new interface driver uvcvideo
> [    5.983312] snd_hda_codec_generic hdaudioC1D0: autoconfig for Generic: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    5.983320] snd_hda_codec_generic hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    5.983322] snd_hda_codec_generic hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    5.983323] snd_hda_codec_generic hdaudioC1D0:    mono: mono_out=0x0
> [    5.983324] snd_hda_codec_generic hdaudioC1D0:    inputs:
> [    5.983325] snd_hda_codec_generic hdaudioC1D0:      Mic=0x19
> [    6.014384] [drm] register mmio base: 0xFCC00000
> [    6.014390] [drm] register mmio size: 524288
> [    6.016593] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input12
> [    6.016642] input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:03:00.6/sound/card1/input13
> [    6.024157] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:03:00.1/sound/card0/input14
> [    6.034268] [drm] add ip block number 0 <nv_common>
> --
> [    6.361457] [drm] Display Core initialized with v3.2.223!
> [    6.361460] [drm] DP-HDMI FRL PCON supported
> [    6.362680] [drm] DMUB hardware initialized: version=0x06000800
> [    6.513198] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    6.568034] [drm] PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> 
> 
