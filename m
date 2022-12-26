Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A36565AA
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 23:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71BD3643A;
	Mon, 26 Dec 2022 23:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71BD3643A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672095506;
	bh=Wti5O+00kVoBmzkKswTPUDc+8JKLmMqF4b5CHt77e60=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gm8BjF1f+qqJkcJV3O1wkGWm4Ej+RiN/5BXQ5YwkX95z163i9jDgJKj7dRFUJ6Cst
	 R3NHWATjaXd1PPxXKvotGxHIlT/a1pG7FSVxmjMrbyMwM49UCaCbUx5OCYeoob7gDN
	 e4b/QXIHd8MdnLelqIPIS+kczV4BoY+LzcZ6J9QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D997EF802A0;
	Mon, 26 Dec 2022 23:57:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB28EF8042F; Mon, 26 Dec 2022 23:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 628E1F800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 23:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 628E1F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mM5WMwZZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 409FD60EE0;
 Mon, 26 Dec 2022 22:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAA8C433D2;
 Mon, 26 Dec 2022 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672095438;
 bh=Wti5O+00kVoBmzkKswTPUDc+8JKLmMqF4b5CHt77e60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mM5WMwZZSj4y5reqpjVqwaFFLgUdoLXqlSI/D9TJfClLz9ZQo5/wnnnqUVNc8Y25o
 M0gvOqg3oSboFXCnk7e5VnuFC+29uVViQ6cK/KBXc5BNirjRvcSu2SprbyRkqz4dll
 9x7B0LNEXFtTLfI16iX/MWQKFY8dDWViSrfCVSEfH9cQ5GYYFPn7FAL7YIwrAkVRpC
 N33F6qNE4NV8pjgHQmraElbqgI5P3uLRmqtj+J140r24NriBV8xWK4kHRbuPHOVI6X
 tntGhtlByw2YUl6rw2o7E8lIn3CdQwZF9oUMTi7hhrDGZTkOTk+QB7SshiT33tXtA5
 bu3bd2YHvDggA==
Date: Mon, 26 Dec 2022 22:57:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 3/5] ASoC: amd: acp: Refactor dai format implementation
Message-ID: <Y6omyPeaZIaGL/EW@sirena.org.uk>
References: <20221220072705.1456908-1-venkataprasad.potturu@amd.com>
 <20221220072705.1456908-4-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h5fGREPqKqgMueed"
Content-Disposition: inline
In-Reply-To: <20221220072705.1456908-4-venkataprasad.potturu@amd.com>
X-Cookie: Noone ever built a statue to a critic.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 open list <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--h5fGREPqKqgMueed
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 12:57:03PM +0530, Venkata Prasad Potturu wrote:
> Refactor dai format implementation in dai_link specific
> snd_soc_ops.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c: In function =E2=80=
=98acp_card_maxim_hw_params=E2=80=99:
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:454:13: error: =E2=
=80=98drvdata=E2=80=99 undeclared (first use in this function)
  454 |         if (drvdata->soc_mclk)
      |             ^~~~~~~
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:454:13: note: each u=
ndeclared identifier is reported only once for each function it appears in

--h5fGREPqKqgMueed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOqJscACgkQJNaLcl1U
h9A9WAf7BvZ7QNfzBCPPyXGxrXWwjIKX83E0fKopQpPw+AAwbjjH4TCk8gx1hTC6
GGmNtlgTGDgsSUE6+3/CdvcNBJUw0joK+mjaCZBC3oeAwr4Ku/KlQjRqW82S1Hxd
oRT0JlJ/dglR2WhZvgMUlPBbZNLlL0rHuM4ghe8AAfTLBhhigOBQpyFbiYhb2MH8
P2bHd+IQ9U1jVZ8Ejuw5a9XrSHCnbYkpuH9YdaF6HIDGlnTO2f5hT84kbyFBDmtp
/7kva/qQzRGLKOec5sF16sizwnNhK6rb7BY9ByiipGR4RHrWmsdi5Q5bDHyz3RTz
vZj0Wy8cDERGIrsQlX3hnGc5l77Eiw==
=3Fz1
-----END PGP SIGNATURE-----

--h5fGREPqKqgMueed--
