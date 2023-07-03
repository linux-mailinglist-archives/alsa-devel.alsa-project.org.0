Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE57745F9E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 17:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732AC203;
	Mon,  3 Jul 2023 17:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732AC203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688397274;
	bh=xxpspjZWFoDg9qr/jEmvLoz/eQaYGCFzaJ9B3Ev2VGI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fHSLNQo9Ce9vC4C6hS+LmHeaW03L563z3sb423DEiVHJibHbglc+KQHgVXo6J3tFE
	 RUnmvYQWdCS6sGB2GZYx0iJ9/7GNH4VnGYdgvmg+bJH0cXF7AsCeIBuxaPP0kg0Df+
	 5yl59XESy6LbdlhJeH7aWHB/GUwgprR3m5iC9824=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD35F80153; Mon,  3 Jul 2023 17:13:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D043F80124;
	Mon,  3 Jul 2023 17:13:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6153F80125; Mon,  3 Jul 2023 17:13:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D28D3F80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 17:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28D3F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QeARC4sb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=y8e7fSN/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 157D21FEE2;
	Mon,  3 Jul 2023 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688397212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XYK3JhaJ5qtklFAcL4Ab0ZphGfyNSKUJRl9bXh8Qy4=;
	b=QeARC4sb7YbOE+ALTChd9oaZA8hY9iv5xC38X5FoNJmV+o4mDkYfyLUdxAEA53Rkf+aTfH
	ftJNjdXD4iSJT8TJNqq2Of4ByFWe4tc6ntnKmRydnp8Gqkij4RoKxGdvTZWSy1zE+VhTdm
	AHB3Aga0lAYwOK7aEqJCsfVuib4zhSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688397212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XYK3JhaJ5qtklFAcL4Ab0ZphGfyNSKUJRl9bXh8Qy4=;
	b=y8e7fSN/9HksPzkl1REx3A8LCD+/eOHDCXc06HcfDANJBzndAGA3sxwwCZU1TFnPptAwld
	lLx2rBLFRlqY7cCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9C451358E;
	Mon,  3 Jul 2023 15:13:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wpZmLJvlomTlVgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 15:13:31 +0000
Date: Mon, 03 Jul 2023 17:13:31 +0200
Message-ID: <87o7kt3u5g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <13916275206@139.com>
Cc: broonie@kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com
Subject: Re: [PATCH v1 1/3] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230702081857.799693-1-13916275206@139.com>
References: <20230702081857.799693-1-13916275206@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QPY6PPJKTBHKK2HKXBG4TZBUICDXKD47
X-Message-ID-Hash: QPY6PPJKTBHKK2HKXBG4TZBUICDXKD47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPY6PPJKTBHKK2HKXBG4TZBUICDXKD47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 02 Jul 2023 10:18:55 +0200,
Shenghao Ding wrote:
> 
> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> laptop will be aggregated as one speaker. The code support realtek as the
> primary codec.

It's not only that -- you changed the struct name used in the code,
too.  Please describe it, too.

> @@ -5883,7 +5883,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
>  		struct alc_spec *spec = codec->spec;
>  		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
>  		alc255_set_default_jack_type(codec);
> -	} 
> +	}
>  	else
>  		alc_fixup_headset_mode(codec, fix, action);
>  }

This change is irrelevant with your code, and should be fixed
individually.  Please drop the hunk.

> @@ -9255,6 +9317,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
>  	},
> +	[ALC287_FIXUP_TAS2781_I2C] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = tas2781_fixup_i2c,
> +		.chained = true,
> +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
> +	},

So this is supposed to be Lenovo-specific, and maybe better to rename,
e.g. ALC287_FIXUP_LENOVO_TAS2781_I2C or such?


> @@ -9813,6 +9881,33 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
>  	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual powe mode2 YC",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x3884, "Y780 YG DUAL",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38bb, "Yoga S780-14.5 Air AMD quad AAC",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38bf, "Yoga S980-14.5 proX LX Dual",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38c3, "Y980 DUAL", ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38cb, "Y790 YG DUAL",
> +		ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL",
> +		ALC287_FIXUP_TAS2781_I2C),

Please keep one entry per line.  Let's ignore the checkpatch
complaints.

> @@ -10728,6 +10823,17 @@ static int patch_alc269(struct hda_codec *codec)
>  		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
>  	}
>  
> +	/* FIXME: Laptop 0x17aa38be will get the wrong fixup_id and
> +	 * enter into the wrong entry.
> +	 * Correct the wrong entry.
> +	 */
> +	if (codec->fixup_id == ALC287_FIXUP_YOGA7_14ITL_SPEAKERS &&
> +		codec->core.vendor_id == 0x10ec0287 &&
> +		codec->core.subsystem_id == 0x17aa38be) {
> +		codec_dbg(codec, "Clear wrong fixup for 17aa38be\n");
> +		codec->fixup_id = ALC287_FIXUP_TAS2781_I2C;
> +	}

Why this is needed at all?  IOW, which entry causes this wrong
attribute?


thanks,

Takashi
