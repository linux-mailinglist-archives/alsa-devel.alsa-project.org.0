Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2DA954B62
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 15:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00262367;
	Fri, 16 Aug 2024 15:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00262367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723816123;
	bh=zWyI9QcPJZwGSCB+6kPF4tKlClYbNczNCOQo39S3Nwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LiiNrpkxL8akDGmjDH9oFzNpqrETmcSlBqB4ggFIQ4/o35FPb9mZlPVuGE1prnxlj
	 eHNkZ7bGYK490iIgi9uIOqnoNeFaLPJTlUeZ6T4V9BHoln7m7ifsoWojuqbAVRDSWm
	 p4sahtWzP+tryrFhFlreSuHUb0Ce2al+V2tpY0Tk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54715F805D8; Fri, 16 Aug 2024 15:48:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 598A8F805B4;
	Fri, 16 Aug 2024 15:48:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5991FF80423; Fri, 16 Aug 2024 13:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0CC8F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 13:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CC8F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TW0WiuCi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2657CE1F30;
	Fri, 16 Aug 2024 11:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B345C4AF0C;
	Fri, 16 Aug 2024 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723808082;
	bh=zWyI9QcPJZwGSCB+6kPF4tKlClYbNczNCOQo39S3Nwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TW0WiuCi3zZ0vc95MpKZ2ygLV9yvk/X7XfX+gi0K+6D5W4vRppYbJdwVRTjleXar2
	 dg3c8qOnj2H3MffscxJ2K7fE6DYyOuLqlcddZz9C3M7YiHA6zgknByANgjDpn+DcKM
	 8Za0IPTY/JCrlu32IZ8Gr9dZ57XWcc+bvYOG/WlQTFj5ZNbNEbHbxl78ywcannpvx5
	 8mIjxeJ2rxRX4PpV1TZUiZ1weKdiJZ/UH5clBIzKVhxV8/trwBvrHDwmBmU9udcOM8
	 A+Io1yqfE+WeQ3ivhyZHIYgT19Le5fU7eRMlKuZx+VTphQS0l9+X3yrNf0+vuiD54n
	 plHSZAOcKFp+w==
Date: Fri, 16 Aug 2024 12:34:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH v1] ASoC: codecs: ES8326: Adjust buttons
Message-ID: <099901fe-386e-46c2-90a1-c6f52c6d85e7@sirena.org.uk>
References: <20240816102034.48617-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cqVOk/BnqWlM1Emq"
Content-Disposition: inline
In-Reply-To: <20240816102034.48617-1-zhangyi@everest-semi.com>
X-Cookie: A Smith & Wesson beats four aces.
Message-ID-Hash: GSW6VKINJCZ3WQR6I6T6BG2YLYLYABTL
X-Message-ID-Hash: GSW6VKINJCZ3WQR6I6T6BG2YLYLYABTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSW6VKINJCZ3WQR6I6T6BG2YLYLYABTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cqVOk/BnqWlM1Emq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 06:20:34PM +0800, Zhang Yi wrote:

> > > > +#if IS_ENABLED(CONFIG_SND_SOC_MT8188_MT6359)
> > > > +	const int hs_keys[] =3D {
> > > > +		SND_JACK_BTN_0, SND_JACK_BTN_2, SND_JACK_BTN_3
> > > > +	};
> > > > +#else
> > > > +	const int hs_keys[] =3D {
> > > > +		SND_JACK_BTN_0, SND_JACK_BTN_1, SND_JACK_BTN_2
> > > > +	};
> > > > +#endif

> > > The support for this device was added in e794a894427b1d ("ASoC:
> > > mediatek: mt8188-mt6359: add es8326 support") which was added in v6.8
> > > so this would also be a potential issue in mainline, given that this =
is
> > > likely only used by Chromebooks and didn't make it to a LTS yet we co=
uld
> > > possibly give it a go but we might have to revert.

> > Because this change is to adapt mt8188-mt6359.On mt8188-mt6359, SND_JAC=
K_BTN_2=20
> > corresponds to KEY_VOLUMEUP and SND_JACK_BTN_3 corresponds to KEY_VOLUM=
EDOWN.
> > So we modified the es8326 driver to adapt the mt8188-mt6359.
> > The changes we are making will not affect the application on all platfo=
rms.

> If you feel that this approach may still be risky, we can solve this issu=
e=20
> by modifying the button about ES8326 in the machine driver of the mt8188

Yes, doing things in the machine driver would be much better.  Since
that machine driver supports a bunch of machines it should probably
still be runtime detected even there.

--cqVOk/BnqWlM1Emq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma/OU0ACgkQJNaLcl1U
h9Cvkwf+P6hXPpiQADqYl9sRbpqVDtwOTnmzMq14ZsMebH3D+Du/55B41ourtdxE
dCwUfFPkhNJyX3kOzmdAY28gACrzSsTosioAvVDxXMYP6u/sA8hIYZpK351QX8jh
PuAfyO5yHvpI9xtnJ+amDyQELWb4tjDCvSKOzjb0P7ZAn1f6aKmja5PZ7gjQyBFf
xkMkVuVMtdQD912Dskami8zN4BswWq6ob5tWS8VgNJwFQ5v9qNGQxzNi5d9CacxP
PIxT298GwVeBFq93bweT70ALQqTXiqaqJbK9VEV/Nf5TaGIKHyK+Lh2oI3t8ic6c
5pIaBIbGm36WMeaUornWMN8JB8vniQ==
=bUjN
-----END PGP SIGNATURE-----

--cqVOk/BnqWlM1Emq--
