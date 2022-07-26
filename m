Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E258116E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3981115DC;
	Tue, 26 Jul 2022 12:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3981115DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658832524;
	bh=ci/EEXJm+0aiaYmwA6HNzBCEI0fWGk+Bm/b7csyVWHY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwXoxiOscNjLgyPOy3NQ5SWrpQll4HG9KdnV5jGWQtA0C74ERTC8fgTsJtXzhiddr
	 wdaKPdWWwq8307y6RPik0VGrb0wmKgOzap1zDnxgA1YE/U7u7RJKKqv7LyWoHteF5i
	 C+m7v3r4IULS0FL2ZAsswZWQGqI3MAL7ydDrTBhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33B2F80238;
	Tue, 26 Jul 2022 12:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E930F8025A; Tue, 26 Jul 2022 12:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DCC1F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DCC1F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yk/LBf0y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C92BAB81544;
 Tue, 26 Jul 2022 10:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB0DC341C0;
 Tue, 26 Jul 2022 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658832456;
 bh=ci/EEXJm+0aiaYmwA6HNzBCEI0fWGk+Bm/b7csyVWHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yk/LBf0yH+zt7E0wDUR5SpFbGsoBYCwikzqadLeixwt08orqi0hjgIHvEbq3xRp82
 liTd5bhrYdXUz9S/m8IuayYGRq9YVkhM3maUfNvDiZV8eURadjZoWZOqVWmXNmwYbT
 ApEtZThUc36vjsmADT4hYaJkEImhovw5gjm5QCI6MZnOZR5Ny4JtP/drsjlIuvhIb4
 6Yxd062jcHAYO581QwQ2dPblQBgBOZioN9ShG5vqZ1e9zDkkfAGDYxNRws+6/jGs+h
 MJKEWwcCY740a+h+rMOTA9LVrl1IGZYOmIjp+FblBAX6nW1ECiiAwAtltbCk4TFGmN
 DW3XCNSoyPrPw==
Date: Tue, 26 Jul 2022 11:47:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 3/5] ASoC: mchp-spdiftx: remove references to
 mchp_i2s_caps
Message-ID: <Yt/GQ80pj2JiRA0a@sirena.org.uk>
References: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
 <20220725130925.1781791-4-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ck+mz0KY5S4xoQrf"
Content-Disposition: inline
In-Reply-To: <20220725130925.1781791-4-claudiu.beznea@microchip.com>
X-Cookie: Save energy:  Drive a smaller shell.
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Ck+mz0KY5S4xoQrf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 04:09:23PM +0300, Claudiu Beznea wrote:

> @@ -782,11 +780,6 @@ static int mchp_spdiftx_probe(struct platform_device=
 *pdev)
>  	if (!dev)
>  		return -ENOMEM;
> =20
> -	/* Get hardware capabilities. */
> -	match =3D of_match_node(mchp_spdiftx_dt_ids, np);
> -	if (match)
> -		dev->caps =3D match->data;
> -

This breaks an x86_64 allmodconfig build:

/build/stage/linux/sound/soc/atmel/mchp-spdiftx.c: In function =E2=80=98mch=
p_spdiftx_pro
be=E2=80=99:
/build/stage/linux/sound/soc/atmel/mchp-spdiftx.c:766:29: error: unused var=
iable
 =E2=80=98np=E2=80=99 [-Werror=3Dunused-variable]
  766 |         struct device_node *np =3D pdev->dev.of_node;
      |                             ^~
cc1: all warnings being treated as errors

--Ck+mz0KY5S4xoQrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLfxkIACgkQJNaLcl1U
h9D77gf/bl83AEFzuWVWM277by6LYfmiOQGjOsbYdS0yiwS8s1eCd+HXf5d+EweF
MQuMRPpBIfU3XGNJlBM3SQOmhzMIUdRN9Dvg8c1xJ7gaa0TTGApwyW6HQvHTurfV
zGF0dVXz//tufIcn5WLmIX1cQiCs17yswvnH5EZ6nLuaUyCvr00zT7jPgciy4toR
TKQKbpYJ07B09nW4ppFAGk8ugQCPpC7tJ70dBhj4rSOTLqAHNApMR5N2v6mpJ0Rg
9epAgxxjzaqgIDwC0t7Pfp5KMGuD3czaT82riH4O+K4GRLHNn9cJYu7LThuk3f0W
U4zvcoUSL+7KVF+qhjk4Fdw1AV3SLQ==
=YTMR
-----END PGP SIGNATURE-----

--Ck+mz0KY5S4xoQrf--
