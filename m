Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D0756372
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3944FAE8;
	Mon, 17 Jul 2023 14:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3944FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689598587;
	bh=Iqh7TfjijModD1NwjJzA82R/SnUFVzZQQvN3iUdM0Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qHC9pE4u0g68MSGnFEzt8b0HH7ETcMQ3suAf5oBmTIafsvHVGQ3gJ6hZeGPrBcM5e
	 /PKimQnNJM//498tBq6zqVn5y77nJjHwtThgFkZftQmDzMW5SC32/Nqa0MAKQxeOVh
	 Dl6m8upwkhbFSVYQ8A+vWIJPhYWPUoEUVCM4/stg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0353F80520; Mon, 17 Jul 2023 14:55:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C32AF8032D;
	Mon, 17 Jul 2023 14:55:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D35F8047D; Mon, 17 Jul 2023 14:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5016CF8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 14:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5016CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cqxtSMHe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 009BF61059;
	Mon, 17 Jul 2023 12:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DB5C433C8;
	Mon, 17 Jul 2023 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689598526;
	bh=Iqh7TfjijModD1NwjJzA82R/SnUFVzZQQvN3iUdM0Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqxtSMHeVaOO2y+5T7XvfymkK6ZiMuedPIKRkPc7kZ9pVnWDBY2HBK+wDsN53yylv
	 s5GLwxI0ftOyPwsJcIqnGzeGNPUuQ+jlhngpUgzqdlA4rGdKxeTjsP5V1RCLp4LfJY
	 ICOTTmXoJYPGBTJiXJ73iT/WbmIkOia21Eybua6b79PomacrGD6uPmyeE5gOy2znNQ
	 L3mgvj27TR3Qx+jTbphosG7wrF6TRG0HTAM+IjG5/Z75NRGyC7vZNHdewK/rT863FD
	 C8D8jblHKb4vGXwarkv/u5Wk4wSfeviBjcOW6yuC6+49sbSPihS2kIKmSbdXyzlXdt
	 XM0QSQqyU1rTQ==
Date: Mon, 17 Jul 2023 13:55:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Matus Gajdos <matuszpd@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
Message-ID: <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
References: <20230712124934.32232-1-matuszpd@gmail.com>
 <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PksENF3NvhBOBXfu"
Content-Disposition: inline
In-Reply-To: 
 <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
X-Cookie: Not a flying toy.
Message-ID-Hash: P3WXSS4ZAJV6F2JO5SH4X436BETV5JGN
X-Message-ID-Hash: P3WXSS4ZAJV6F2JO5SH4X436BETV5JGN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3WXSS4ZAJV6F2JO5SH4X436BETV5JGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PksENF3NvhBOBXfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 09:31:38AM -0300, Fabio Estevam wrote:
> On Wed, Jul 12, 2023 at 9:53=E2=80=AFAM Matus Gajdos <matuszpd@gmail.com>=
 wrote:
> >
> > Otherwise bit clock remains running writing invalid data to the DAC.
> >
> > Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
>=20
> Should this contain a Fixes tag so that it could be backported to
> stable kernels?

I'll just put a non-specific Cc stable tag on it, that should be enough
to get it backported.

--PksENF3NvhBOBXfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS1OjcACgkQJNaLcl1U
h9DS1wf/c16EisoD6DHiFlMXL2USTW4POzR71yM0WbVK9sShUOKNMw++l2llTr8F
+2lfuS0cGsgEJxtBPRJnWJlUleMwVRHpZJ9Vhl7TdwFQF7X2G6jXGFO6EFg7aBqz
knhGCxOTfYZO3MqD3ppBKGhcaNJdoWOWi8Dre2NNh6StSURThYv+hSIwp92OQP3W
09ssoeCBkrVkOmvWoxIJ8fgkr0b2ySIXi0dDLeeTAhZ73xydCGq9GehXiJphnshX
iSAYkBqrD6ioCD+8n1kO4a4Jp18sTF1IVvGEonzv9sVpSavKrqWIohI5Kiu318TP
lVKVvYs/7EH4FswQ2FztkW7ksidFZQ==
=3WHI
-----END PGP SIGNATURE-----

--PksENF3NvhBOBXfu--
