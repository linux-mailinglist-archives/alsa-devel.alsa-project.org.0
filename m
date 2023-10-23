Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55C7D3A91
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 17:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C76684B;
	Mon, 23 Oct 2023 17:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C76684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698074361;
	bh=4gDTkvnnBRqSf/jHzY8R1MU1NWwhjhsP2zUpHSJaHOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lk4tf6T4DJYAogL5TXR+X9fvyWlMNScMhbxUzXIKQxs6VvKI7u3qdERCDG3K7SUFe
	 SKloask5GFgbCXmvqLPdfP6Z+PYE3kgZ9HS1b4kqrAm2hI6ANtimefpVJmLJYywnup
	 aPwKGS30X+YT59REfyLOme7hjZCZ4xXWrri9FwIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0651F8032D; Mon, 23 Oct 2023 17:18:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A84F804F3;
	Mon, 23 Oct 2023 17:18:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F62F80527; Mon, 23 Oct 2023 17:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1A7AF80027
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 17:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A7AF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T13CgJVi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55DCC61B7D;
	Mon, 23 Oct 2023 15:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197B9C433C7;
	Mon, 23 Oct 2023 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698074300;
	bh=4gDTkvnnBRqSf/jHzY8R1MU1NWwhjhsP2zUpHSJaHOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T13CgJVib3X5lxOC0U+nLeucszLx/a+oOCHdlcHjmI7tqxqj7Ny/iIGlg3FWmjdZ1
	 pXgmq3swG48QcCE7laMRAcM7JrDyA7t5j1O1Xf9hzPHAKKi14xQE7Ul035YR0EcE9c
	 k09ozI4rf4rhwBh0sumOLuLYZXUK20pegEObZNvdqqMp5hOkFU4/cg1gBkjVB0iVea
	 2Q2C5twa5+eThp/8b09Ggm72Y61oySWQ1melUZ2LdKkY/SQRHbNankESb8FpdqV1Y2
	 GBdIY1HhueeL/qEWkpiEn7Uz2kj8+cwyNusZ0XzrF2AcG0V3WDVIA2V5xXK18m9AGr
	 1LiZ1M3sFc2oA==
Date: Mon, 23 Oct 2023 16:18:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: pass max number of
 channels to Audioreach
Message-ID: <673374d2-e8fb-496d-b89d-092df2f1fbc0@sirena.org.uk>
References: <20231017161429.431663-1-krzysztof.kozlowski@linaro.org>
 <2c2941f5-9909-433a-a35e-fbe7611c0ef4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="364xxEhdSOi/QbR0"
Content-Disposition: inline
In-Reply-To: <2c2941f5-9909-433a-a35e-fbe7611c0ef4@linaro.org>
X-Cookie: Never reveal your best argument.
Message-ID-Hash: YMTAX4NUMYLXWSR5WQWTIUW26IKKMB2B
X-Message-ID-Hash: YMTAX4NUMYLXWSR5WQWTIUW26IKKMB2B
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMTAX4NUMYLXWSR5WQWTIUW26IKKMB2B/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--364xxEhdSOi/QbR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 10:14:03AM +0200, Krzysztof Kozlowski wrote:
> On 17/10/2023 18:14, Krzysztof Kozlowski wrote:

> > Using the params_channels() helper when setting hw_params, results in
> > passing to Audioreach minimum number of channels valid for given
> > hardware.  This is not valid for any hardware which sets minimum
> > channels to two and maximum to something bigger, like four channels.
> >=20
> > Instead pass the maximum number of supported channels to allow playback
> > of multi-channel formats.

> I am not sure if this is correct fix. I think sound machine drivers
> should just not override channels like:

You *can* get cases where machine specific wiring or clocking limits
mean that even if both ends of a link are capable of some number of
channels the actual limit is lower.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
ound/soc/qcom/sm8250.c?h=3Dv6.6-rc6#n44

That's:

| static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
|				     struct snd_pcm_hw_params *params)

=2E..

|	rate->min =3D rate->max =3D 48000;
|	channels->min =3D channels->max =3D 2;

which is DPCM which is it's own special thing - in this case it's saying
that whatever the front end takes in the thing that comes out of the SoC
will have been reformatted to 48kHz stereo (so mono will be turned into
stereo for example) which is a perfectly reasonable thing for a DSP to
do.  See previous discussions of how we should handle this better, DPCM
isn't ideal.

--364xxEhdSOi/QbR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU2jrUACgkQJNaLcl1U
h9BlZwf8Daf0x7Ql27BkYOX9pul+TZ7dzsf40sT7NfeZ75WmyRmYVOamtN5MUknr
8I9wOrmwwU/zP6hWoL8DQU6kJyv6jeCnuGOseoIeQHg0o4NUcaXvSvPZn0fTHXOn
JPz+pwnyLGtLQxpcdMOwDEAuihQqXU5+861Cdtp9wBi9IyN3BlfxwpsnJOIwwErp
KK3MFn8124hBmLwFbgI+CaNBZ28RrgGdEGr3q7tnD0S0uSDfeXn9+eCnoWyiVXLg
T8JDDpNoThG45jz7urTBBaumwDLZUiCPATR+KFgPI1URX34pu/drGMVNzIXvjcSU
m1Zn72LpU7RsxuAVlNvMtZjTBUj9Bw==
=2lGy
-----END PGP SIGNATURE-----

--364xxEhdSOi/QbR0--
