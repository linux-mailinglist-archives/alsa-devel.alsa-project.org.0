Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D874D90F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 16:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D84207;
	Mon, 10 Jul 2023 16:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D84207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688999521;
	bh=LJFJauwkckXYADCm6I1mTNoFUBen6qA8EKay4zwpmNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JBm/nv3vwtO7G7BGCGPVdZtEgS6S7FKyBppV2IcviamElrqobue9dvpF1rFMR4Frr
	 LQjKsnY5TZe2Cws1XoyRZZGS3OUtMcKVuY1hF/n2p1n/m9jI/tyhb8YvsV1k0Zc5wT
	 2QRJTMJX611EP4U563rK/TXvwzlESpobVCECQc+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D00CCF80153; Mon, 10 Jul 2023 16:31:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DBC5F80093;
	Mon, 10 Jul 2023 16:31:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AC1CF80249; Mon, 10 Jul 2023 16:31:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FFFCF800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 16:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FFFCF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O2gr+3UK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1x34zqIm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8CF8B1FFA2;
	Mon, 10 Jul 2023 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688999454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjlMk0EbffxuJOjramPPb1TR2XCPnRGkKXj9Qt7aAIQ=;
	b=O2gr+3UKqOIqNDknFnuyExnyA2GyVIpvfbTUZDFkgROlAWUvecJcwYBk3f9qGdVarxw/ps
	iYm9yXIxGqTMj6uOyBg9AOjOa6C47zxfKmHOjkBeM2H6wJPzHQFk4GzPrYOUFukNxmzOIN
	sIbyCBg0nbtitfhDHZO7FLFcMSBlk64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688999454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjlMk0EbffxuJOjramPPb1TR2XCPnRGkKXj9Qt7aAIQ=;
	b=1x34zqImdfaqQE5pWTOJvMwf0R480bRp7n1ETIvCExjCri9k/g4gKTj4ALsioIT21D4zyp
	5bOQX6oDJRF4NWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E1E713A05;
	Mon, 10 Jul 2023 14:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SJlECh4WrGS8QwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 10 Jul 2023 14:30:54 +0000
Date: Mon, 10 Jul 2023 16:30:53 +0200
Message-ID: <87351vzvmq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <13916275206@139.com>
Cc: broonie@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com
Subject: Re: [PATCH v2 1/3] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230710041217.151099-1-13916275206@139.com>
References: <20230710041217.151099-1-13916275206@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OLA3NRVIL4AZWONYBC43ROJS3ER35EVX
X-Message-ID-Hash: OLA3NRVIL4AZWONYBC43ROJS3ER35EVX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLA3NRVIL4AZWONYBC43ROJS3ER35EVX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 06:12:15 +0200,
Shenghao Ding wrote:
> 
> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> laptop will be aggregated as one audio device. The code support realtek
> as the primary codec. Rename "struct cs35l41_dev_name" to
> "struct scodec_dev_name" for all other side codecs instead of the certain
> one.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v2:
>  -  simplify the check of vendor id with Lenovo
>  - ThinkPad is one of Lenovo's brands, they suggested me to use
>    ALC269_FIXUP_THINKPAD_ACPI.
>  - Add comments on ACARD_SINGLE_RANGE_EXT_TLV
>  - Add the range check for tas_priv->tasdevice[] in tas2781_acpi_get_i2c_res.
>  - remove acpi_subsystem_id
>  - Issue in Laptop 0x17aa38be ACPI talbe caused codec->bus->pci->subsystem_device
>    is not equal to (codec->core.subsystem_id & 0xffff) in snd_hda_pick_fixup.
>    The former is 0x3802 and the latter is 0x38be leads to getting the wrong
>    fixup_id and enter into the wrong entry. Although, this issue has been raised
>    to the laptop manufacturer, but the ACPI table is locked, cannot be changed
>    any more. Correct the wrong entry in the code.
>  - Rename "struct cs35l41_dev_name" to "struct scodec_dev_name" for all
>    other side codecs instead of one certain codec.
>  - Ignore the checkpatch complaints in alc269_fixup_tbl
>  - Drop the hunk which is irrelevant with my code in
>    alc_fixup_headset_mode_alc255_no_hp_mic
>  - Add tiwai@suse.de into Cc list
>  - remove useless index
>  - combine ALC287_FIXUP_TAS2781_I2C_2 and ALC287_FIXUP_TAS2781_I2C_4 together as
>    ALC287_FIXUP_TAS2781_I2C, The code view all the tas2781s in the laptop as one instance.
>  - delete the white space at the end of the line in alc_fixup_headset_mode_alc255_no_hp_mic

The patch looks almost fine.  Just a few things:

> @@ -6730,12 +6730,32 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  	return !strcmp(d + n, tmp);
>  }
>  
> +static int comp_match_tas2781_dev_name(struct device *dev,
> +	void *data)

The indentation in the patch doesn't look good.
I don't want to be too strict about it, but this inconsistent
indentation makes reading quite difficult, so better to be fixed.
In general, it's recommended to align the opened parenthesis.
(But, in the case above, you don't need to break the line at all.)

> @@ -10761,6 +10843,22 @@ static int patch_alc269(struct hda_codec *codec)
>  		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
>  	}
>  
> +	/* FIXME: Issue in Laptop 0x17aa38be ACPI talbe caused
> +	 * codec->bus->pci->subsystem_device is not equal to
> +	 * (codec->core.subsystem_id & 0xffff) in snd_hda_pick_fixup.
> +	 * The former is 0x3802 and the latter is 0x38be leads to getting the
> +	 * wrong fixup_id and enter into the wrong entry. Although, this issue
> +	 * has been raised to the laptop manufacturer, but the ACPI table is
> +	 * locked, cannot be changed any more. Correct the wrong entry in the
> +	 * code.
> +	 */
> +	if (codec->fixup_id == ALC287_FIXUP_YOGA7_14ITL_SPEAKERS &&
> +		codec->core.vendor_id == 0x10ec0287 &&
> +		codec->core.subsystem_id == 0x17aa38be) {
> +		codec_dbg(codec, "Clear wrong fixup for 17aa38be\n");
> +		codec->fixup_id = ALC287_FIXUP_TAS2781_I2C;
> +	}

This should be rather applied differently.  A similar workaround was
found in the commit 56ec3e755bd1041d35bdec020a99b327697ee470
    ALSA: hda/realtek: Apply fixup for Lenovo Yoga Duet 7 properly


thanks,

Takashi
