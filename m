Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B088012BBAC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:46:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDD7174B;
	Fri, 27 Dec 2019 23:45:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDD7174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486773;
	bh=0Uz/eLlFDImFmHmcQeJsS4K2QbYhn9X0VriC8CFWvEk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EK98SWOd6eGahS0JBpDzGFX6prrrFNY0/0whbqJExDHGQxVxv4823EtRgUMJtCxrB
	 O/3jMWsNCIQbgYjGOKW0sIbHwwn/DFV71wQWaSVBzpQQ1enCLCYRUmjTTPIIROP8CK
	 wuzv228ZXbVRZjiOOUnBRgPYhsb8hwWhCoaB+0qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 801FEF8027C;
	Fri, 27 Dec 2019 23:43:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AE11F80279; Fri, 27 Dec 2019 23:43:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B5EF80131
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 23:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B5EF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="stCMR1/S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBsKP8gtbmBJPTI5aIng2BCqn7LuKLBL/0YvXsWQfmE=; b=stCMR1/Sr1/3RfQMgganUG+10
 1f1GNXYHTXNWSZ2LmteRQgzQp/UopIFgc4crjtQYOvEl5YZy6vmqjmpYnqkZk3dt2o6MVofqOA1Qk
 skYpw1zaCwUpbdmo7YIA1auXsKjl2TwYXo/IMwRJGLXEd4s26VmNnNi/8zIszbNVuYlNs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikyKP-0006a6-SZ; Fri, 27 Dec 2019 22:43:29 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5E21BD01A22; Fri, 27 Dec 2019 22:43:29 +0000 (GMT)
Date: Fri, 27 Dec 2019 22:43:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20191227224329.GM27497@sirena.org.uk>
References: <20191227172911.4430-1-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191227172911.4430-1-sashal@kernel.org>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Shuming Fan <shumingf@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH AUTOSEL 5.4 001/187] ASoC: rt5682: fix i2c
 arbitration lost issue
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
Content-Type: multipart/mixed; boundary="===============7086775102483172394=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7086775102483172394==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 12:26:05PM -0500, Sasha Levin wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> [ Upstream commit bc094709de0192a756c6946a7c89c543243ae609 ]
>=20
> This patch modified the HW initial setting to fix i2c arbitration lost is=
sue.

It's not great to send stuff like this out during vacations,
there's a good chance people won't be looking at their mail these
two weeks...

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4GiRAACgkQJNaLcl1U
h9AyNAf/VopNHKmQBrZ3SbdvrbbTDSyxScjJd/iJURWlKw37+601meo0Y1oDME/Z
zMcmZBvH17dQDUj7iVJ2EQ0nXt8JXXmbZUUKy18RuEgYsBYpucLB2cqtwqM5Y8tW
uwr/y0tyFYv+E/NtvYLB+umh8ZccQoyAFrFVimA71Ii6EDt9OgX6Fe7JfPUdZRhZ
L3/M0vyLAlrPY1XO1Q1Z20V93DxuDZXXY5ura7O31K2JA8+ds3ovt8buQgwKUaS5
Y9FBh19Fa2Gii5n2WwQ2rX8K7rQZYccHVV31UX1GF85+cUkOUpCVwb8ggj8aqm32
6LWVBkDn8LC7xsx8rmgtpy2VAcjcTQ==
=ooCn
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--

--===============7086775102483172394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7086775102483172394==--
