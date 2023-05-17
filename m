Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC170732C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 22:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290501FC;
	Wed, 17 May 2023 22:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290501FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684355894;
	bh=0sZRqv1KWAWithQ9nlJugtjb9IAxFtp8ISoKpSyztro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sfi+NjR1ACHUXWzKaVImbsQ102JycS7p/ylvwynmei1eygBOMqyyfxxGAAgbkJxvL
	 L5lK1XeWu0HRvHL/XMJAS5odalFzmt9cZ3sqCWxOmaFDVcLKl2vN8zvJOABLpf+mEd
	 FMp3TU8CxXH43Czonp1jxTu78LsG5Ga72dDUo5kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60996F80548; Wed, 17 May 2023 22:37:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16671F8025A;
	Wed, 17 May 2023 22:37:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9BD4F80272; Wed, 17 May 2023 22:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46531F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 22:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46531F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hRsY5+SW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hMTs3d4d
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 419092263A;
	Wed, 17 May 2023 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684355829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppxaH8AqWOQLSpfngt7ztyTGzgAkX4F/p+BGuLGBWTQ=;
	b=hRsY5+SW1fpQQEVy8WC5KOk63Rd6E8AA9mFLFs6VfgZ+tKuCIL6AJjuwHh2YeHJJfRtzaW
	HULyPyqmZXo8+iucWKfvQUUjXG/toIR5Q8byLQVQboVTmwOu/jupGDPGGzxDInHt2Aykw/
	KrBuCBZq7jU26rdiqfHjXX63tuZpq4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684355829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppxaH8AqWOQLSpfngt7ztyTGzgAkX4F/p+BGuLGBWTQ=;
	b=hMTs3d4d1tIa712WbU83BSCG8E2Fb9LlurYF3zZ9Bnf9w2WRji/ZJAs3ZmI5Bx657ck6+5
	gaCDoFkDMAk8ZMCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14BC113478;
	Wed, 17 May 2023 20:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ScnSA/U6ZWQQDAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 20:37:09 +0000
Date: Wed, 17 May 2023 22:37:08 +0200
Message-ID: <871qje1yq3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Aur=E9lien=22?= <aurelien@ap2c.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: No sound with Realtek ALC298 on a Samsung Galaxy book
In-Reply-To: <441231b80626cca3862320ff8b8d35430234518c@ap2c.com>
References: <441231b80626cca3862320ff8b8d35430234518c@ap2c.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PEZ63LY26ZLQMK6PYEPFDJLLG2X4CRFP
X-Message-ID-Hash: PEZ63LY26ZLQMK6PYEPFDJLLG2X4CRFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEZ63LY26ZLQMK6PYEPFDJLLG2X4CRFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 09:04:57 +0200,
Aurélien wrote:
> 
> Hi, 
> 
> Several years ago I sent several mails about problem with Realtek ALC 298 sound card not working on Samsung Galaxy book. Due to a computer problem i had to stop working on it. However I succeed to get it working and I'm submitting the patch attached to this email.
> 
> Internal speakers works very well.
> In order to get headset working I had to hack a little bit since it shares the same pin widget (0x17) with the internal speaker. It seems that the ALSA code have solutions to declare a pin widget as both internal and jack but if I use that it doesn't recognize the presence of the jack.. Maybe I'm wrong somewhere.

This part looks weird.  If the pin detection should be enabled, it
shouldn't be declared as a phantom jack.  Maybe the bogus pin
configuration?

> Last but not least i saw that under windows the driver uses another mixer (0xd through the out widget 0x3 rather than mixer 0xc throught the out widget 0x2) when it uses the headset. It offers the opportunity to have a dedicated volume control for the headset independant from the internal speaker. Maybe it could be interesting to do the same under the Linux driver. Unfortunately I don't know how to do that. 

I don't think Windows driver uses any amp value adjustment; they
usually done only in software.

> Do you think is it possible to integrate this patch to the ALSA code?

Please make the patch clean.  Try to run checkpatch.pl and fix as much
as possible.

Then, check the proper patch submission procedure, as described in
Documentation/process/submitting-patches.rst.  It needs a proper
subject line, the patch description text, and your Signed-off-by tag.
And the diff should be generated to be applicable via patch -p1
option.


thanks,

Takashi

> 
> Thanks in advance.
> 
> Aurélien
> *** patch_realtek.c.orig	2023-01-24 07:24:44.000000000 +0100
> --- patch_realtek.c	2023-02-03 18:22:41.152930752 +0100
> *************** static void alc298_fixup_samsung_amp(str
> *** 4752,4757 ****
> --- 4752,4916 ----
>   	}
>   }
>   
> + 
> + 
> + static int alc298_samsung_set_amp_reg(struct hda_codec *codec,
> + 	unsigned short reg22, unsigned short reg23, unsigned short reg25)
> + {
> + 	// Set values
> + 	for (int i=0; i < 8; i++)
> + 		snd_hda_codec_write(codec, 0x00, 0, AC_VERB_PARAMETERS, 
> + 			AC_PAR_VENDOR_ID);
> + 	snd_hda_codec_write(codec, 0x06, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x80);
> + 	alc_update_coef_idx(codec, 0x26, 0, 0x4000);
> + 
> + 	if (reg22)
> + 		alc_write_coef_idx(codec, 0x22, reg22);
> + 	alc_write_coef_idx(codec, 0x23, reg23);
> + 	alc_write_coef_idx(codec, 0x25, reg25);
> + 	alc_write_coef_idx(codec, 0x26, 0xb010);
> + 
> + 	// Wait for ack
> + 	for (int i=0; i < 8; i++)
> + 		snd_hda_codec_write(codec, 0x00, 0, AC_VERB_PARAMETERS, 
> + 			AC_PAR_VENDOR_ID);
> + 	snd_hda_codec_write(codec, 0x06, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x00);
> + 	alc_update_coef_idx(codec, 0x26, 0x10, 0x0);
> + 	if (alc_read_coef_idx(codec, 0x26) != 0xB000)
> + 		return 0;
> + 	return 1;
> + }
> + 
> + static inline void alc298_samsung_write_coef_pack2(struct hda_codec *codec,
> + 						  const unsigned short coefs[2])
> + {
> + 	int i;
> + 
> + 	for (i=0; i < 10; i++) {
> + 		if ((alc_read_coef_idx(codec, 0x26) & 0x4000) == 0)
> + 			break;
> + 	}
> + 	if (i == 10)
> + 		return;
> + 	alc_write_coef_idx(codec, 0x23, coefs[0]);
> + 	alc_write_coef_idx(codec, 0x24, 0);
> + 	alc_write_coef_idx(codec, 0x25, coefs[1]);
> + 	alc_write_coef_idx(codec, 0x26, 0xb013);
> + }
> + 
> + static void alc298_fixup_samsung_amp2_headset(struct hda_codec *codec)
> + {
> + 	static const unsigned short headsetMode[][2] = {
> + 		{ 0x07a, 0x0006 }, { 0x061, 0x8100 }, { 0x062, 0x0400 }, 
> + 		{ 0x194, 0x0000 }, { 0x010, 0x4040 }};
> + 	static const unsigned short speakerMode[][2] = {
> + 		{ 0x07a, 0x0400 }, { 0x061, 0xa000 }, { 0x062, 0x8400 }, 
> + 		{ 0x194, 0x0240 }, { 0x010, 0x0000 }};
> + 
> + 	alc_write_coef_idx(codec, 0x22, 0x1b);
> + 	/*
> + 	 * This port is FIXED and JACK port. Unfortunately the
> + 	 * snd_hda_jack_detect always returns JACK_PRESENT because phantom_jack
> + 	 * is set (even if this port is set to BOTH.
> + 	 * So perform the query manually.
> + 	 */
> + 	if (snd_hda_codec_read(codec, 0x17, 0, AC_VERB_GET_PIN_SENSE, 0) == 
> + 			0x80000000) {
> + 		for (int i=0; i < ARRAY_SIZE(headsetMode); i++) {
> + 			alc298_samsung_write_coef_pack2(codec, headsetMode[i]);
> + 		}
> + 	} else {
> + 		for (int i=0; i < ARRAY_SIZE(speakerMode); i++) {
> + 			alc298_samsung_write_coef_pack2(codec, speakerMode[i]);
> + 		}
> + 	}
> + }
> + 
> + static void alc298_fixup_samsung_headset(struct hda_codec *codec,
> + 				   struct hda_jack_callback *jack)
> + {
> + 	alc298_fixup_samsung_amp2_headset(codec);
> + }
> + 
> + static void alc298_fixup_samsung_amp2(struct hda_codec *codec,
> + 				      const struct hda_fixup *fix, int action)
> + {
> + 	static const unsigned short amp_reg_31[][2] = {
> + 		{ 0x0b, 0x00 }, { 0x0c, 0x00 }, { 0x0d, 0x00 }, { 0x1a, 0x00 },
> + 		{ 0x1b, 0x82 }, { 0x1c, 0x00 }, { 0x1d, 0x00 }, { 0x1e, 0x00 },
> + 		{ 0x1f, 0x00 }, { 0x20, 0xe2 }, { 0x21, 0xc0 }, { 0x22, 0x20 },
> + 		{ 0x23, 0x22 }, { 0x24, 0x00 }, { 0x26, 0x00 }, { 0x27, 0xff },
> + 		{ 0x28, 0xff }, { 0x29, 0xff }, { 0x2a, 0xfc }, { 0x2b, 0x02 },
> + 		{ 0x2c, 0x48 }, { 0x2d, 0x14 }, { 0x2e, 0x02 }, { 0x2f, 0x00 },
> + 		{ 0x30, 0x00 }, { 0x31, 0x00 }, { 0x32, 0x00 }, { 0x33, 0x00 },
> + 		{ 0x34, 0x00 }, { 0x35, 0x01 }, { 0x36, 0x93 }, { 0x37, 0x00 },
> + 		{ 0x38, 0x80 }, { 0x39, 0x00 }, { 0x3a, 0xf0 }};
> + 	static const unsigned short amp_reg_34[][2] = {
> + 		{ 0x0b, 0x00 }, { 0x0c, 0x00 }, { 0x0d, 0x00 }, { 0x1a, 0x00 },
> + 		{ 0x1b, 0x82 }, { 0x1c, 0x00 }, { 0x1d, 0x00 }, { 0x1e, 0x00 },
> + 		{ 0x1f, 0x00 }, { 0x20, 0xe2 }, { 0x21, 0xc0 }, { 0x22, 0x20 },
> + 		{ 0x23, 0x22 }, { 0x24, 0x04 }, { 0x26, 0x00 }, { 0x27, 0xff },
> + 		{ 0x28, 0xff }, { 0x29, 0xff }, { 0x2a, 0xcf }, { 0x2b, 0x02 },
> + 		{ 0x2c, 0x48 }, { 0x2d, 0x34 }, { 0x2e, 0x02 }, { 0x2f, 0x00 },
> + 		{ 0x30, 0x00 }, { 0x31, 0x00 }, { 0x32, 0x00 }, { 0x33, 0x00 },
> + 		{ 0x34, 0x00 }, { 0x35, 0x01 }, { 0x36, 0x93 }, { 0x37, 0x00 },
> + 		{ 0x38, 0x80 }, { 0x39, 0x00 }, { 0x3a, 0xf0 }};
> + 	static const unsigned short regs[][2] = {
> + 		{ 0x0c0, 0x2a86 }, { 0x0c1, 0xcaaa }, { 0x0fa, 0x0001 }, 
> + 		{ 0x01c, 0xafaf }, { 0x073, 0x0000 }, { 0x074, 0x8000 }, 
> + 		{ 0x0a0, 0x0000 }, { 0x070, 0x8020 }, { 0x071, 0x1020 }, 
> + 		{ 0x080, 0x0000 }, { 0x0fa, 0x0001 }, { 0x02a, 0x2a8a }, 
> + 		{ 0x061, 0xa100 }, { 0x062, 0x8400 }, { 0x026, 0x8080 }, 
> + 		{ 0x02f, 0x0000 }, { 0x085, 0x5000 }, { 0x01c, 0x2f2f },
> + 		{ 0x190, 0x8430 }, { 0x190, 0x8431 }, { 0x194, 0x0240 }, 
> + 		{ 0x196, 0x3000 }, { 0x07a, 0x0400 }, { 0x063, 0xa23e },
> + 		{ 0x063, 0xf23e }, { 0x111, 0xa602 }, { 0x08e, 0x0068 },
> + 		{ 0x125, 0x0110 }, { 0x091, 0x0e26 }, { 0x125, 0x0410 },
> + 		{ 0x13a, 0x3030 }, { 0x1db, 0x0003 }, { 0x161, 0x0041 },
> + 		{ 0x162, 0x040c }, { 0x160, 0xceff }, { 0x003, 0xc000 },
> + 		{ 0x198, 0x0000 }};
> + 	unsigned short reg22;
> + 	int val;
> + 
> + 
> + 	// Set the jack detection
> + 	if (action == HDA_FIXUP_ACT_PROBE) {
> + 		snd_hda_jack_detect_enable_callback(codec, 0x17,
> + 			alc298_fixup_samsung_headset);
> + 		return;
> + 	}
> + 
> + 	if (action != HDA_FIXUP_ACT_INIT)
> + 		return;
> + 
> + 	// Set the amp registers
> + 	val = alc_read_coef_idx(codec, 0x26);
> + 	if ((val & 0x3000) == 0)
> + 		 alc_write_coef_idx(codec, 0x26, val | 0x3000);
> + 	reg22 = 0x31;
> + 	for (int i=0; i < ARRAY_SIZE(amp_reg_31); i++) {
> + 		alc298_samsung_set_amp_reg(codec, reg22, amp_reg_31[i][0], 
> + 			amp_reg_31[i][1]);
> + 		reg22 = 0;
> + 	}
> + 	reg22 = 0x34;
> + 	for (int i=0; i < ARRAY_SIZE(amp_reg_34); i++) {
> + 		alc298_samsung_set_amp_reg(codec, reg22, amp_reg_34[i][0], 
> + 			amp_reg_34[i][1]);
> + 		reg22 = 0;
> + 	}
> + 
> + 	// Set other registers
> + 	alc_write_coef_idx(codec, 0x22, 0x1b);
> + 	for (int i=0; i < ARRAY_SIZE(regs); i++) {
> + 		alc298_samsung_write_coef_pack2(codec, regs[i]);
> + 	}
> + 
> + 	// Finalize the initialization depending on headset connected
> + 	alc298_fixup_samsung_amp2_headset(codec);
> + }
> + 
> + 
>   #if IS_REACHABLE(CONFIG_INPUT)
>   static void gpio2_mic_hotkey_event(struct hda_codec *codec,
>   				   struct hda_jack_callback *event)
> *************** enum {
> *** 7130,7135 ****
> --- 7289,7295 ----
>   	ALC236_FIXUP_HP_MUTE_LED,
>   	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
>   	ALC298_FIXUP_SAMSUNG_AMP,
> + 	ALC298_FIXUP_SAMSUNG_AMP2,
>   	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
>   	ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
>   	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
> *************** static const struct hda_fixup alc269_fix
> *** 8522,8527 ****
> --- 8682,8691 ----
>   		.type = HDA_FIXUP_FUNC,
>   		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
>   	},
> + 	[ALC298_FIXUP_SAMSUNG_AMP2] = {
> + 		.type = HDA_FIXUP_FUNC,
> + 		.v.func = alc298_fixup_samsung_amp2,
> + 	},
>   	[ALC298_FIXUP_SAMSUNG_AMP] = {
>   		.type = HDA_FIXUP_FUNC,
>   		.v.func = alc298_fixup_samsung_amp,
> *************** static const struct snd_pci_quirk alc269
> *** 9511,9516 ****
> --- 9675,9681 ----
>   	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
>   	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
>   	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
> + 	SND_PCI_QUIRK(0x144d, 0xc14f, "Samsung Galaxy book 12", ALC298_FIXUP_SAMSUNG_AMP2),
>   	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
>   	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
>   	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
> *************** static const struct hda_model_fixup alc2
> *** 9890,9895 ****
> --- 10055,10061 ----
>   	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
>   	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
>   	{.id = ALC298_FIXUP_SAMSUNG_AMP, .name = "alc298-samsung-amp"},
> + 	{.id = ALC298_FIXUP_SAMSUNG_AMP2, .name = "alc298-samsung-amp2"},
>   	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
>   	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
>   	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
