Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52824990D98
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 21:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1CD868;
	Fri,  4 Oct 2024 21:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1CD868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728069272;
	bh=LO7IT7YT1qD7yM7AZD5y61ywl5y1t7QTlluAg+gpH6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VawWXixhPB3R5AInavs1vwvDGpmVfTUiDUUiDnQ9eCS/7PGMlLKhzoCUrUcpTS+Sv
	 7PEoNc1C4Afm+fOSspywKm0fqcqk+rLmRAPqkwcFwbfw7A1IUkE0Ezdd6tlLDh/YH9
	 050vKAQqs2U1HqdmiIIRralYTwu7FQct2WGYWC4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9B81F805B3; Fri,  4 Oct 2024 21:14:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD247F805B0;
	Fri,  4 Oct 2024 21:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD3D7F80517; Fri,  4 Oct 2024 21:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91A23F80107
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 21:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A23F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A4AxrR7i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E1BF5C59B6;
	Fri,  4 Oct 2024 19:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C786BC4CEC6;
	Fri,  4 Oct 2024 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728069223;
	bh=LO7IT7YT1qD7yM7AZD5y61ywl5y1t7QTlluAg+gpH6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4AxrR7iqWKCHfmYLaiYLbU/xQvHK4wZ83aSmDGQ7Zn80DJ7NTPhISoM5jxKTN7u5
	 tFxT9yZ0yQW+Q8tqwIUb4hSWbnUSespXXO5fI1jFl7TGljrRg4H91qqheql/2qCmcd
	 Towrz29qpcofP54F1gEZ0YM5iuknG0TElu7tLnrbU7zJi8OxKRezkCOBBz/G9I4D+Y
	 Wl2rPeGl1mn1Il6lzeYwUlKoeG+/yflZrMfW5Ed7+bxNRtHlRe0cCOc/Ve62rJHLF5
	 q07GPbmfhyOaScGz+4T+1/aMLVFHWSNia4WLPRsrfQHkKIeS+O539yTB36vkrLZNYg
	 HcPYFmAcYl8mw==
Date: Fri, 4 Oct 2024 20:13:38 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?KO+/vdC777+9KSDvv73vv73vv73Ose+/vSAo77+977+9x7vvv73NsO+/vQ==?=
	=?utf-8?B?77+90LDvv70p?= <ingyujang25@unist.ac.kr>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sound: soc: uniphier: Handle regmap_write errors in
 aio_src_set_param()
Message-ID: <1fe9cb78-2412-47fd-a0b1-1d3a42385684@sirena.org.uk>
References: 
 <SE1P216MB2287F4D575CFBDC9755E896BFD6A2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8USiPpMzZodHO/3"
Content-Disposition: inline
In-Reply-To: 
 <SE1P216MB2287F4D575CFBDC9755E896BFD6A2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
X-Cookie: A bachelor is an unaltared male.
Message-ID-Hash: XABJCVHCDIESYGMFOG2OPMVCF5SVWSOQ
X-Message-ID-Hash: XABJCVHCDIESYGMFOG2OPMVCF5SVWSOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XABJCVHCDIESYGMFOG2OPMVCF5SVWSOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Z8USiPpMzZodHO/3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 09:15:18PM +0000, (=EF=BF=BD=D0=BB=EF=BF=BD) =EF=BF=
=BD=EF=BF=BD=EF=BF=BD=CE=B1=EF=BF=BD (=EF=BF=BD=EF=BF=BD=C7=BB=EF=BF=BD=CD=
=B0=EF=BF=BD=EF=BF=BD=D0=B0=EF=BF=BD) wrote:
> From 791716bf359b8540c519810848fd1f8006d7c3c5 Mon Sep 17 00:00:00 2001
> From: Ingyu Jang <ingyujang25@unist.ac.kr>
> Date: Thu, 26 Sep 2024 19:40:04 +0900
> Subject: [PATCH] sound: soc: uniphier: Handle regmap_write errors in
>  aio_src_set_param()

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Z8USiPpMzZodHO/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcAPmIACgkQJNaLcl1U
h9CViAf/e5GEbzMuPdV1VC3qzLJlu8BlGwAP2eFN0CsIpEOGlvD8UoyDbmG4tHhb
Hh50h1x8mEF9kLS8pnpP+z137DhTDy4LreUXSGyQywl3r1gn4anWTLzaDy8ed7+E
1xRO3IXBttz/FVt84rx8PPidcz87NYDpb4+oJmEYnwWdGj3Wf9ADeIJlqcf2c3Mz
dyQId5XyAJJ8Pf1RAi+TfAMV5wh7gjP5UmQ/tkcFuxSEdc9KqlcsBiYUimnRFaBh
Qwli+uvo8lelH6m2hj20GfgBt15jviaC3gvovs1odVw1VNakCay9Xsxa5b3rJ0Li
Fybnn7jTP7DNQYfDu3H03Mo2FEfM5A==
=eplN
-----END PGP SIGNATURE-----

--Z8USiPpMzZodHO/3--
