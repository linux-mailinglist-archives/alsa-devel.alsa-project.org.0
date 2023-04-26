Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD26EF36F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 13:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4291E1077;
	Wed, 26 Apr 2023 13:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4291E1077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682508629;
	bh=GBEE4elFhwUK1G7W0thBHiV17vI4CyaESyN1ZdJ1tEA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNccHX3ouo37jQLjN/wtsp4pi57cujfNemDPL1QKnf7gUCJWj/TE7eNrkFxQgPdoH
	 hfzy6X8MkhH/jLKhTXtjt3/Xg4UWzX+tuPsDqCuh5KGiHXuaS0UUutAXSHlRyWmBT+
	 bW9dQvetpbDlXCmD0ixCQ4Z9aTyeBXliuXlj61rI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 504BCF80236;
	Wed, 26 Apr 2023 13:29:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 609A7F8025E; Wed, 26 Apr 2023 13:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FA52F800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 13:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA52F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J2yPfDkS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B53F62C37;
	Wed, 26 Apr 2023 11:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9EDC4339E;
	Wed, 26 Apr 2023 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682508560;
	bh=GBEE4elFhwUK1G7W0thBHiV17vI4CyaESyN1ZdJ1tEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2yPfDkSFMUY3J5xAbChkGYgWDXAj/A7Xc484VfHpLHFwsSG0hmIdwQgAcd8SaeBJ
	 X1bNrA8GVDyUOt1Kwbb+Q82VgJD9ql+YhZQ70jy72PSRV0LXAhqKnRXFPCKjwGAuCg
	 5iyAV1pn1vJKr2zie93+Q9jQ6YywB+fdnEPPtQCEK+LVm2IaBi2jYsf6KEOguJVvl/
	 nCG8MY5LSNhLTq3FRrXqGW2SrJ0bde5UcP7sIA4C45zUo7WG/tkhRfPVI5BKiHEJUv
	 nDj2UfLuUzDdl9crUlt9yfjyAW6ztmZ6A7gpIfk4nlEX7nd55I2WjZ6Am+kf1++15z
	 NAoNp751HPrAA==
Date: Wed, 26 Apr 2023 12:29:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH] ASoC: dwc: add reset support
Message-ID: <b43effb0-0473-4580-afc3-e9652f821bdd@sirena.org.uk>
References: <20230421193319.14066-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RS4w6fKQ6BRvf/MV"
Content-Disposition: inline
In-Reply-To: <20230421193319.14066-1-fido_max@inbox.ru>
X-Cookie: Drilling for oil is boring.
Message-ID-Hash: TY4KAUC7KWPIQMUUHALHIUIDBMRTTWKH
X-Message-ID-Hash: TY4KAUC7KWPIQMUUHALHIUIDBMRTTWKH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TY4KAUC7KWPIQMUUHALHIUIDBMRTTWKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RS4w6fKQ6BRvf/MV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 10:33:19PM +0300, Maxim Kochetkov wrote:
> Some SoC may have resets for I2S subsystem. So add optional reset
> deassert at startup.
>=20
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  sound/soc/dwc/dwc-i2s.c | 9 +++++++++
>  sound/soc/dwc/local.h   | 1 +
>  2 files changed, 10 insertions(+)

I'd expect to see a binding update along with this?

--RS4w6fKQ6BRvf/MV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRJCwoACgkQJNaLcl1U
h9Burgf/cOG6Bfw+D7ZOtoYVE71WWU91twyrCC0yT1GYiS97ZuEXvrcyZEbRhQpu
JooNJHEDe6vkoP10hki0TcyAp9X6G/Fd65/9wg2N5wNcztE1v48ZF9wIEvhog2Gg
rId8+OgQVSWGz+GM8WIOVKrDvXIZwrI9PsuOvu9LSB37mW6jQI3Q9sdTRGuoTuet
4VIbOPP2vxkXz9HULU2uiIze33fvY6fSIXdxKi5R44xDMnPx8Ne8H+uQn2uFEAZK
Px7jOg5qt2Shlk+3rOGp3sLHL6x96j4CLWqp6FdTkvyK8C9cSWhzYL26unwf7o/W
dbpzasgA2K4W/BR7SuUsy9SGsnwyYw==
=Nu2Z
-----END PGP SIGNATURE-----

--RS4w6fKQ6BRvf/MV--
