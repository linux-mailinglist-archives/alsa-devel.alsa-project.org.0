Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A98929BA
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Mar 2024 09:40:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFB72367;
	Sat, 30 Mar 2024 09:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFB72367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711788057;
	bh=hM4zzObcqkeasLl3jnP0T9cpvHHhPp0Da05+trJoYeE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iyaCKMXFxrLu1bbFeZNp1+zlkC7xwovsSYDwQaSsLqvZkYZWkim6PMI1BsmXH2FF2
	 PYrBC2IkRiC+Dqe813yxjE00Y6giLiSn/ZqBa60V9EQJT3XemnMUW4G4J/ocEGSrDa
	 SWvfKGPZYuhKe+UZpwl0di+h3hWanVmmYCigkDRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A90D6F8057E; Sat, 30 Mar 2024 09:40:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8473F8059F;
	Sat, 30 Mar 2024 09:40:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9CE7F8025F; Sat, 30 Mar 2024 09:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0E74F801EB
	for <alsa-devel@alsa-project.org>; Sat, 30 Mar 2024 09:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E74F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=L2dWxHdh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZrvUGSan
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E75D37742;
	Sat, 30 Mar 2024 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711787755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2rff1aQCpGhc3FhH7+YpI1m0oW/YTR5lwhWBWR+MWM=;
	b=L2dWxHdhHQBbmDnWDDY/twSTB0Y7np0RtUa6rulFdt40+f6hSfH81QlGBHZ83XNmr1WAMa
	im7x6Jgn585hVUkof4uIGPsNyJlk8vN/VtgbvKSRPeVrfScdmD4rFCgYyRtEsjYCTUNFHP
	7LCvbiMHXD8cVOPYWTh+/HmDSo9hSDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711787755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2rff1aQCpGhc3FhH7+YpI1m0oW/YTR5lwhWBWR+MWM=;
	b=ZrvUGSanyUfJVvEv88A9+YDSxEJDknzi7Cc2RWTiJxizoQmdmP65PvgBCBz2HaC3WfRwtA
	y76R4wu3P9BDp8Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CE77513A90;
	Sat, 30 Mar 2024 08:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id h6WLMOrOB2bgbQAAn2gu4w
	(envelope-from <tiwai@suse.de>); Sat, 30 Mar 2024 08:35:54 +0000
Date: Sat, 30 Mar 2024 09:35:57 +0100
Message-ID: <87r0fsnmky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian@bendiksen.me
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	foss@athaariq.my.id,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Bendiksen <christian@bendiksen.me>
Subject: Re: [PATCH] Add sound quirks for Lenovo Legion slim 7 16ARHA7 models.
In-Reply-To: <20240329185406.9802-1-christian@bendiksen.me>
References: <20240329185406.9802-1-christian@bendiksen.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.91 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.80)[-0.796];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4E75D37742
Message-ID-Hash: YIN7R2P62ABHM75MHPVVZR23ZA56467X
X-Message-ID-Hash: YIN7R2P62ABHM75MHPVVZR23ZA56467X
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIN7R2P62ABHM75MHPVVZR23ZA56467X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Mar 2024 19:54:14 +0100,
Christian@bendiksen.me wrote:
> 
> From: Christian Bendiksen <christian@bendiksen.me>
> 
> This fixes the sound not working from internal speakers on
> Lenovo Legion Slim 7 16ARHA7 models. The correct subsystem ID
> have been added to cs35l41_hda_property.c and patch_realtek.c.
> 
> Signed-off-by: Christian Bendiksen <christian@bendiksen.me>

The entries are sorted in SSID order.  Could you put them at the right
positions?


thanks,

Takashi

> ---
>  sound/pci/hda/cs35l41_hda_property.c | 4 ++++
>  sound/pci/hda/patch_realtek.c        | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index 72ec872afb8d..959864994eca 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -115,6 +115,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>  	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
> +	{ "17AA3877", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
> +	{ "17AA3878", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
>  	{}
>  };
>  
> @@ -503,6 +505,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "17AA38B5", generic_dsd_config },
>  	{ "CSC3551", "17AA38B6", generic_dsd_config },
>  	{ "CSC3551", "17AA38B7", generic_dsd_config },
> +	{ "CSC3551", "17AA3877", generic_dsd_config },
> +	{ "CSC3551", "17AA3878", generic_dsd_config },
>  	{}
>  };
>  
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a17c36a36aa5..540868d6c602 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10347,6 +10347,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x17aa, 0x3877, "Legion Slim 7 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x17aa, 0x3878, "Legion Slim 7 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x38bb, "Yoga S780-14.5 Air AMD quad AAC", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual", ALC287_FIXUP_TAS2781_I2C),
> -- 
> 2.44.0
> 
> 
