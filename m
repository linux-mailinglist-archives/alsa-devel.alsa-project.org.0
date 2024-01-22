Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C6836E80
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 18:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB75950;
	Mon, 22 Jan 2024 18:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB75950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705946129;
	bh=Z23kcrIIJLVGbWuksIJ++SYxhVw2LPkVMEi+WQmYNMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sa+V1qjlQ0T07hkT2y+OkGkRBb8xIbLGrwhHK+m2llDMCqFBDwioSan4c5u2CWmfT
	 00nsEmY5YFtaQorb5LZpCRVP8HvAMe1Fu7qjc+E832rsHVKlPMm4g5oEYKfSxDZHGG
	 F0WQwUJ6csQ4azZ8bSv3Q4Oawu8R35eRDREB5iK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBCD1F80580; Mon, 22 Jan 2024 18:54:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F703F8025F;
	Mon, 22 Jan 2024 18:54:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F648F8025F; Mon, 22 Jan 2024 18:54:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96A6AF800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 18:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A6AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GqZJE3UL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27E4CCE1AAF;
	Mon, 22 Jan 2024 17:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9325C433C7;
	Mon, 22 Jan 2024 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705946085;
	bh=Z23kcrIIJLVGbWuksIJ++SYxhVw2LPkVMEi+WQmYNMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqZJE3ULkLzF1nTrohxKhmrPIhX86oIxnbgublM6M6iWYm0bkq1eBRu8lCe8H3yH+
	 xWW/s3rNV9l0UNHR22qBovMxfjanXrcFCvO/U+f9LrzFo3NPUIyvYXHzOWCuCwrVoZ
	 sY+mLqrxkQwK0hvD6suoHpAAf3I5lkUi4pFyqO9zZwyyk3n7eEPa2g1fKyfbVhDYv7
	 Ho1nFVJpuM3goIxlJ/eVE24kbnWzk9kmqj2IGZo4dQjvXZxFyc9NAoeI7D9GMB6xWl
	 Zw8xcmvJy+dD1rEHjwq8VLoXL5uEdNan0D7lu30lHYf3kqHt+E07sask4bc3NhptmU
	 r7We24eC3o9wQ==
Date: Mon, 22 Jan 2024 17:54:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com, zhangyi@everest-semi.com
Subject: Re: [PATCH v1 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Message-ID: <0bb6ad45-f252-422c-8003-3a5679ca1cd0@sirena.org.uk>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
 <20240120101240.12496-4-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BvhB9rMmAf3K4zEP"
Content-Disposition: inline
In-Reply-To: <20240120101240.12496-4-zhuning0077@gmail.com>
X-Cookie: Nice guys don't finish nice.
Message-ID-Hash: 2ATDYGJ32HV3RJL54JORFXRUC52HQI6M
X-Message-ID-Hash: 2ATDYGJ32HV3RJL54JORFXRUC52HQI6M
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ATDYGJ32HV3RJL54JORFXRUC52HQI6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BvhB9rMmAf3K4zEP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 20, 2024 at 06:12:38PM +0800, Zhu Ning wrote:
> ES8326 features a headphone volume control register and four DAC
> volume control registers.
> We add new volume Kcontrols for these registers to enhance the
> configurability of the volume settings, providing users with
> greater flexibility.

This is much better integrated than the earlier version, but there's
still a few issues.

> +static int es8326_hplvol_set(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +	unsigned int hp_vol;
> +
> +	if (ucontrol->value.integer.value[0] == 3) {
> +		dev_dbg(component->dev, "HPL_VOL does not change");
> +		return 0;
> +	}

This will silently ignore attempts to write the invalid value which
isn't great any might confuse some userspace code, it would be better to
do something like

	val = ucontrol->value.integer.value[0];
	if (val >= 3)
		val++;

(with corresponding changes to the other functions) so that we just skip
over the invalid value without userspace being aware of it.  We should
also be validating that out of range values are rejected or at least
constained to the relevant bitfield, other than 3 any invalid value will
just be written straight into the register (rejecting should be more
robust).

> +	regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
> +	hp_vol &= 0x8F;
> +	hp_vol |= ucontrol->value.integer.value[0] << 4;
> +	regmap_write(es8326->regmap, ES8326_HP_VOL, hp_vol);

regmap_update_bits().

> +
> +	return 0;
> +}

Also please run mixer-test on your driver - for this control it'll tell
you that this function isn't returning 1 when the value changes, meaning
that events won't be generated when the value changes.

> +	SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
> +	SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
> +	SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
> +	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),

It would be *better* if these were stereo controls, but it's not
essential.

> +
> +	SOC_ENUM("HPVol SPKVol switch", hpvol_spkvol_switch),

Switch should have a capital letter (mixer-test should catch this as
well).

--BvhB9rMmAf3K4zEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWuq98ACgkQJNaLcl1U
h9CF4gf+JU7z9T2JdfI+ysHHJjJ1X8jOjlEfS8tbS8zW2PjkyQ96Im5Xh3ISyQBu
2towfdq55g2knX9AJGvVbi6bcLWnFjok1+UVpnvPujrliyM85DPnR32BBGx4RkAY
8Vn7FGooV/rVsYUTZeNh7+8njHhADs4PtSF8VhCFKvhhyO0gJsgouu1oVNZw8Rad
TfuuRYy+PIB5PSSQ65kq7pHa8U03BWk/gVskndkk/89ijPu80GjdRqqLPrb9nLJr
ZzO5SdmisjnO1lEOyLRWnVCged3GNlCVlTkabLm87aXudGpK0rpJmR2z29qzT6Pu
PZJpwmq7Sm6JIEtnpUPznELg/PTKUQ==
=5x1k
-----END PGP SIGNATURE-----

--BvhB9rMmAf3K4zEP--
