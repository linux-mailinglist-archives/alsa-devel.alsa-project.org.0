Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5487383BD
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D7674C;
	Wed, 21 Jun 2023 14:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D7674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687350497;
	bh=PLITsDgO3ORD0mg3V7mhV6h2SmUAQMBGXJc9EYuerXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=udmUal1DZFsop43ZettESfC/7TpCMLZPn2Gi5ER8mOr3Js0vv5L7VvcG3MUHoCe4d
	 V9g09p6KX6dbvIq1E1bio7My5azdKc8QtZAF+sNPh6YbkDgFTc/uH5GoEHomcX6je8
	 Paa+hwegm9v/9WM+NpP8E9WAsq3QAIvJVTSplxB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2171F80022; Wed, 21 Jun 2023 14:27:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 576AFF80132;
	Wed, 21 Jun 2023 14:27:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D431F80141; Wed, 21 Jun 2023 14:26:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A785F80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 14:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A785F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PLV/oYtb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A509261549;
	Wed, 21 Jun 2023 12:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F59C433C0;
	Wed, 21 Jun 2023 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687350414;
	bh=PLITsDgO3ORD0mg3V7mhV6h2SmUAQMBGXJc9EYuerXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLV/oYtbs/fbY/+X+RrQQ3etO+S2POSQOMlWQUHaHBV0nxettqx44kC2XPj3PsGSv
	 h0PmIUC+uPI8hGVnINnWpio+bRB8P1u11+htVaIrHEOFcn+3m1rSCIQX3hGiIs2xee
	 LiE/7Iclz5wCAEKygcc9t1vrMZ0csidLUFmQJj4+J90up/pHb0Ri5YRlC7JzgiYoau
	 BkcAqeK+pP7ptB7EDk0GTQsbjCKRvCTL9lQIt4TkZLwt65XQ/uU2W6LG2Z/WJp2vLn
	 CTepY8KbcEC7QTao/nyIUvM7y1Su3VynJnIPUerRbTzsq+Ho8rwiHdDn1li5iq4nhd
	 i/Nxh5NDa97Nw==
Date: Wed, 21 Jun 2023 13:26:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Message-ID: <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
References: <20230621115328.156457-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1wavB8RUXkPItFLO"
Content-Disposition: inline
In-Reply-To: <20230621115328.156457-1-fido_max@inbox.ru>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: UHKFDW7F4GUVYNWSOQN4ZCBPTENKJR3U
X-Message-ID-Hash: UHKFDW7F4GUVYNWSOQN4ZCBPTENKJR3U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHKFDW7F4GUVYNWSOQN4ZCBPTENKJR3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1wavB8RUXkPItFLO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 02:53:27PM +0300, Maxim Kochetkov wrote:

> TDM mode for max98090 is dsp_a compatible. So allow it.

>  		case SND_SOC_DAIFMT_DSP_A:
> -			/* Not supported mode */
> +			break;

This is configuring DSP A identically to left justified mode, it looks
like the format configuration needs at least some interlock with the TDM
configuration.

--1wavB8RUXkPItFLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSS7IcACgkQJNaLcl1U
h9Cw1Af/Zrtw6Cu27PuZfjQDBdN6p8BYFU4FGO6T63zJOyqe6zD3US6X2RfJm/nK
VFJ9fBoluougbUsISB5OvDmrmatK4z2PHbHS4VNh8JxHyoFkq94S11ljUB2NbGHl
EeqoNI8gvJ8k3bx3Qubyn/6YkJL1wWprlbwQ6cY3Vmq/DKH8A+iZgnnotw53AgYy
e3gs6k1xAJNavHHz+IjumhjBPpnwhZaF8yNCPu+rWbbaB3Xs8vWnIvJocoJzHC59
uYmrmhPYcUCJHLVdbRPKehqLvJxgDhFcgr+C5P1sBnRtWdv0VmnkaWrdh39bdnOZ
IWbvDkGM6scf87qrJDCl6xuZutQDzw==
=kkOL
-----END PGP SIGNATURE-----

--1wavB8RUXkPItFLO--
