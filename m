Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D58C7586
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 13:59:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09120868;
	Thu, 16 May 2024 13:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09120868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715860773;
	bh=E7UsGb6Za+wHEcmHsLVrZiP4f3obI82j8AUAXJwI+Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=prJMIKUjHxUSt+IAT8UfskoWRF+4NMTJ0yWzipcqqAUDjNic5Q3z+s0mYGwGoQrDP
	 fLM3jXTFjqOHK42Jko2cFcGeI7GdVoS0JSLrpT+r0hdiNn937ePivqHJwHlqiTp1sK
	 ru46PwzT8S05Jop8+4G1bjCa8vQfoE6TQLANaUrk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B3A4F805AC; Thu, 16 May 2024 13:59:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 667ECF80564;
	Thu, 16 May 2024 13:59:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95305F8024C; Thu, 16 May 2024 13:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF9BEF800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 13:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF9BEF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pvISL2g5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37AA96166F;
	Thu, 16 May 2024 11:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F72C113CC;
	Thu, 16 May 2024 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715860726;
	bh=E7UsGb6Za+wHEcmHsLVrZiP4f3obI82j8AUAXJwI+Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvISL2g5xA9A7ryhfZ4/mtSa5WAkWW7GkBPMWB7qu6TEZ90UmAWOOerEh3/Cl2Ph0
	 +TDkQY81351Z8KKw8h27YPRDj4Og2lsD9wH8zIVlH/tCkCfqVe6UN8XdUdx1XO5Gm/
	 YPEyc8Ijvy2zull41IQX+Sdfzo88p/rXYUNmzTm6718wMQeVdtUDuRt85tvlgcjaED
	 ueOH0onP7/5O8fFYXJ9/EFeE5Y2I8QTkT5XXwUd59T0H9JrvFb/zkFXpZWsauxOTwL
	 Sqy5Kfvp7ltuVMUDfp8e3KYMT7VyK6BoI50J912bQDEpY5p4XBvRGuRpB2u9S82VG+
	 wdR+ks55in61w==
Date: Thu, 16 May 2024 12:58:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v4 4/7] ASoC: codecs: wcd937x: add basic controls
Message-ID: <f766e8fc-64e7-4579-ac5a-4afcdae067cc@sirena.org.uk>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-5-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bEuBL+UqcAprloOC"
Content-Disposition: inline
In-Reply-To: <20240516044801.1061838-5-quic_mohs@quicinc.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
Message-ID-Hash: R2JEUXG7GU4QI5CBVX327P6WYQOUZLJ6
X-Message-ID-Hash: R2JEUXG7GU4QI5CBVX327P6WYQOUZLJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2JEUXG7GU4QI5CBVX327P6WYQOUZLJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bEuBL+UqcAprloOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 10:17:58AM +0530, Mohammad Rafi Shaik wrote:

> +static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +				snd_soc_kcontrol_component(kcontrol);
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
> +	u32 mode_val;
> +
> +	mode_val = ucontrol->value.enumerated.item[0];
> +	if (!mode_val) {
> +		dev_warn(component->dev, "Invalid HPH Mode, default to class_AB\n");
> +		mode_val = CLS_AB;

This should be silent (or return an error) otherwise people can DoS the
logs by just spamming in invalid values.

> +	}
> +
> +	wcd937x->hph_mode = mode_val;

I would expect there's more validation needed here, this will blindly
assign any non-zero mode.  Please run the mixer-test selftests on a card
with this device in it and show the results on future submissions, this
will detect this and other issues for you.

Several of the other controls look like they're also missing validation.

> +static int wcd937x_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
> +	struct wcd937x_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd = wcd937x->sdw_priv[dai_id];
> +
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	enable = !!ucontrol->value.integer.value[0];
> +
> +	wcd->port_enable[portidx] = enable;
> +	wcd937x_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}

This unconditionally reports that the value changed so will generate
spurious events.
> +
> +static const char * const rx_hph_mode_mux_text[] = {
> +	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
> +	"CLS_H_ULP", "CLS_AB_HIFI",
> +};

It would be more idiomatic to write these in a more human readable form.

> +static const char * const wcd937x_ear_pa_gain_text[] = {
> +	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
> +	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
> +	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
> +	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
> +	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
> +};

Why is this an enum and not TLV information?

--bEuBL+UqcAprloOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF9PAACgkQJNaLcl1U
h9BE5gf+MZfo6xckou+1xaQ1x8WUvInmUJO84njGHB6R6hSHjjnEG+XIuVw/g7EZ
yZ9OiZFuYfRQlTp2Gw/GYO+9DG/+gLGcBZQ7TGVFU8mP/i8hSVF0U7wNXRF1+uG1
qbpx4Qqh2Nl5Rr3SHsSaxscGjNKvOI27Vm9eb2Dq9uVuy/nfDymCUiFwrVUQGleE
2XUfQeW3IlyZI1INfjNcQ1e/I5a36bh1mFtD+GHk1jbGp/YLImU2sGbJPBmQwpzQ
F9eKub3szoFc2Xh9kMoc8Vlxi0mYOphxhK21yNk+aVaWTV74teJcBC66oumbC/nI
xpHyAPFWN0WtuFOXrz40J+//3ils/w==
=TStU
-----END PGP SIGNATURE-----

--bEuBL+UqcAprloOC--
