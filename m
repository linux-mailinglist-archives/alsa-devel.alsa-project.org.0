Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8A6E28AD
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 18:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B7F9F6;
	Fri, 14 Apr 2023 18:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B7F9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681490891;
	bh=kLySdUEMQr1iUvlQq6Htdfgpuyp1tU6kNYr8ymjcJnQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIO5mqFQL0zaKdl5PUW+iHzF+lPw5xuprXjL0ifaJptR09+hvFX21jM2Dhm97M1o3
	 Dikjk4wYWd/imaO+s9TCQaAjUGEq9h9MTAZpT92uEbXh42mfP2P6tzaSIgytboq/sP
	 DWjvJNMKNDRWLTyVnPKh2PPAF5xLrK7XKpXZMYaI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC4FF8025E;
	Fri, 14 Apr 2023 18:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F30C6F8032B; Fri, 14 Apr 2023 18:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D18CCF80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 18:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18CCF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XZEjQWuo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 656D66492F;
	Fri, 14 Apr 2023 16:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7B7C433EF;
	Fri, 14 Apr 2023 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681490828;
	bh=kLySdUEMQr1iUvlQq6Htdfgpuyp1tU6kNYr8ymjcJnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZEjQWuoiaLMzrotKOefVL+KiaM61y6oJKqWG8HFdNkhwH2QW1Efhz7uwpZtwl6K6
	 WilqvCdPSuY2QoommbloPIYgOiKpHYPdZaL4AmnjffO1mSDkbcrXBopNbiB6I3rk4W
	 9ECmmny4LI3rkqydUbpL7fy35cxKUj5LQpPvCqDHwnsPl/6cT/HNAwHQQG2kByojwy
	 szLQElxMKHDl6PPrQb7NlXFE9D3yyu1jle6XZg8zHfWNo4eDkTz6+PgGRe68r5bvaW
	 gKTj7wdyFyw7/86HcMpL3EZwShkxgfj/azOQTpdRlKoR/+EG1qydfVIuKH6rgBPIkI
	 BoVXZFUikBiJg==
Date: Fri, 14 Apr 2023 17:47:02 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 0/9] Add Chameleon v3 ASoC audio
Message-ID: <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6K3bg/ncOMgdX1Ax"
Content-Disposition: inline
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
X-Cookie: One Bell System - it works.
Message-ID-Hash: V77AFZIT7BPMKNLD2KHXOZPPNQAPXUIE
X-Message-ID-Hash: V77AFZIT7BPMKNLD2KHXOZPPNQAPXUIE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V77AFZIT7BPMKNLD2KHXOZPPNQAPXUIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6K3bg/ncOMgdX1Ax
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 04:01:54PM +0200, Pawe=C5=82 Anikiel wrote:

>  sound/soc/Makefile                            |   1 +
>  sound/soc/chameleonv3/Kconfig                 |   7 +
>  sound/soc/chameleonv3/Makefile                |   2 +
>  sound/soc/chameleonv3/chv3-audio.c            | 111 ++++++
>  sound/soc/chameleonv3/chv3-i2s.c              | 347 ++++++++++++++++++
>  sound/soc/chameleonv3/chv3-it68051.c          |  41 +++

Please at least make a directory for Google as a vendor, we don't want
people adding directories for each individual product.  That said
generally we add machine drivers in the directory for the relevant SoC
family, is there any reason that pattern isn't followed here?

--6K3bg/ncOMgdX1Ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5g4IACgkQJNaLcl1U
h9Awagf/ddeh9NiL6xTm0jG7Plq85gP3Pyvhk2dVP91pSzF9F2Ji14MAlnMxtKdW
I01PMKID+Zk7oMMvVWT6XwDfK6F6ScWBXR+uwqhtD2m+5Qz+srCzqKyZZpWevujg
KSrw9av66SOmEHB8BYWK7PnhBGV27/0E8mxzHqaxWNyyVkJhgxhBakVda9ocacmY
hBjUSiivVFpEV36uNZrn2N9ivcj8Ux5mVpNhFLF1BGnlMGLvYyZMcbfAUtkAm9AN
rgduYeGNGttpn7p3/xjusIeboE0QZU/6JYfQ+tX6FTSm1QeklwL6e0G8hb8OzLQz
OYG7LQgbQju5RMftb4EWn0bLI/4qsw==
=rrTF
-----END PGP SIGNATURE-----

--6K3bg/ncOMgdX1Ax--
