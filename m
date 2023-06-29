Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587047427EA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760AA839;
	Thu, 29 Jun 2023 16:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760AA839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688047472;
	bh=kqlJRRYbTz0kcPNhpqhUhISpOUsIiXZtAzvcGl/OX2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sFCVV9J7sYw9aCanZHIdanaYgXbUA+XWLfZoadZFROZqB+MiLmP6Wgr55slIN/i/x
	 TcwFToAaH5riG3Bgj3zYy8cNPF1bZupGbeiwzQ+BUeuPh63ZSHnCUfdsFv1M2VA9FQ
	 6Ra67SF9r1fmnB1WCflCmi7rFD3fdf2aYhive6pA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEB02F80246; Thu, 29 Jun 2023 16:03:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A17F80212;
	Thu, 29 Jun 2023 16:03:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AE82F80246; Thu, 29 Jun 2023 16:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A6D6F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A6D6F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1CMVw9q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 793C76153C;
	Thu, 29 Jun 2023 14:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C67C433C0;
	Thu, 29 Jun 2023 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688047409;
	bh=kqlJRRYbTz0kcPNhpqhUhISpOUsIiXZtAzvcGl/OX2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1CMVw9qXNDxy5fsWo2OUD51GWhkbP8ZU7BpzrwpXjgQeQpoNx+qVJvX+mjtVDhvl
	 Voj0hHJbGZHTtN88pr2L6/SqM5/AjB0ju/9x/fwnrJzfOFbOhyUtFxK83AsdL+Riry
	 21Jqs3gtvt2vMstfQvIbKvOXX+yXfTzRiSj12Fenhw6M2aGHXdy1Dmp70Tj4/N4ZUS
	 Q5WX9p1Q5kUX7xR/lTKMYTqdS2IyyD7EcjKeMVWXSKozMB8L6uB269B2CWR7XgN2Jy
	 jam9jKQwihF6l5CjokFskKTSluwXw+SNm81cHKDMJtgng7zfeoZFVs/93KAqXpeU3U
	 bDvInkKBMdb+A==
Date: Thu, 29 Jun 2023 15:03:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: refactor TDM slots calculation into
 helper function
Message-ID: <792436b9-8430-47bd-ae3f-2545733a2f88@sirena.org.uk>
References: <20230629135820.2631908-1-s.hauer@pengutronix.de>
 <20230629135820.2631908-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="03HDytV/9CY3vQzX"
Content-Disposition: inline
In-Reply-To: <20230629135820.2631908-2-s.hauer@pengutronix.de>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: JDNS6NECWGL4T5VHYABWUF6C32XNEJNV
X-Message-ID-Hash: JDNS6NECWGL4T5VHYABWUF6C32XNEJNV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDNS6NECWGL4T5VHYABWUF6C32XNEJNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--03HDytV/9CY3vQzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 03:58:19PM +0200, Sascha Hauer wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>=20
> Splitting the calculation between the initializer and later on makes it
> harder to follow. A follow-up commit will also need to do this calculatio=
n,
> so move it into a helper function. No functional change.
>=20
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--03HDytV/9CY3vQzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdjysACgkQJNaLcl1U
h9BgAAf/QjajHCFH9Y6FALkvARXuq+QBQF5sdXwUkvJToBcUuCFGNggXZPe9eODE
kkp/fXdOmyXw3rcOCG8khZgu1mJyfVAZMrBT9N1Ux3nIn4+onP2I0eRMsMZk8pqt
sACuOrP5fHX+WP3Olk9MJXf3PzV4jOtOBu/waszg0z1BWmqzH2E9RsPtcAHTk1HL
iS4Mk8GPpXZ81pdPW0wE+qKfur2i+bHGauMIw7OyHL/J5wYIkHNmWggqvqrlCVkD
EdJX9mlQH6bM3irPPvo02zHjk5OF/Solz2iNxwIyJ3ohMfQzBDN+M5vudB/sd+sC
l6M2Fq6aWRApQoe+ChNVBwFP/sYliw==
=yJrc
-----END PGP SIGNATURE-----

--03HDytV/9CY3vQzX--
