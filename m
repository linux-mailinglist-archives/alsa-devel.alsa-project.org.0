Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E353B591
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E77173F;
	Thu,  2 Jun 2022 11:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E77173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654160465;
	bh=Naq/KtbGAucNtb9h2QdZ6MmDJaiURo5L2H+Ws9RCjrM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fsMjFnQMBUxNp/4WKwrHlwxrFkBx1+GY0J3NmROdJvQkbl3FTlUmaXgFnMqknGEgx
	 ueTh81Mtl8lPcTl8a5oxJx2ZJA3+QRyOS3xsdDAq5tiHJ8YHyAHGMVgKREcRmqADme
	 4SYr99Rdg8jHFkvGCrCLsGj1sRWKudU5jpvfKooo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3832F8025E;
	Thu,  2 Jun 2022 11:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE020F80236; Thu,  2 Jun 2022 11:00:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374DDF80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374DDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bPkb2k3w"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DBF26116F;
 Thu,  2 Jun 2022 08:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7A8C385A5;
 Thu,  2 Jun 2022 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654160397;
 bh=Naq/KtbGAucNtb9h2QdZ6MmDJaiURo5L2H+Ws9RCjrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPkb2k3w3aZcfgFS3uqPWV5uN1zEX5rO7xasMjGnHzIfbtyHM7pTO10eK2KfiGhT3
 ulXqyOCM1aipSKUoSp6i2Vr7KbkZRizh3O/cZRW9W+RIxH3cdRgjs2+D3R5NdSFZao
 uuuImgog5e28HWEgQEToDjicEr4x+rgOpU0feyyHo5ykaLkinHyLuc7cKMit5zQHnR
 +sd5YA2Qk0E95Fp+H7/bNfgc2tM0gdoWSzaWV+/016zYMiHX24ODlySQeXYW9mzu0r
 s8LH04aib1fSSgpzPUhOKJZMaV8h3LahzFAmyDYl7xxLE5PmlSJw9alphHpk07mb51
 bJUriVtgjjdYw==
Date: Thu, 2 Jun 2022 10:59:55 +0200
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
Subject: Re: Semantics for _SX controls
Message-ID: <Yph8C3bRxcr6ogW7@sirena.org.uk>
References: <YpeElAslQxfajbdq@sirena.org.uk>
 <1cd55249-d793-9bb9-e01d-b994676f0253@cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cUOpnJNniSwyJdu2"
Content-Disposition: inline
In-Reply-To: <1cd55249-d793-9bb9-e01d-b994676f0253@cirrus.com>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 James Schulman <james.schulman@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>
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


--cUOpnJNniSwyJdu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 02:47:28PM -0500, David Rhodes wrote:

> At the very least, cs53l30 should be patched. For the other drivers, usin=
g a

OK, great - thanks for checking. =20

> macro that is more explicit about the signed bit field and removes the
> max/#-steps confusion would be an improvement. Something similar to
> SOC_DOUBLE_R_S_TLV could work.

I think as a first step it's best to refactor the current info()
callback to be clearer then refactor further from there when it's
clear what we're doing.  I do think explicitly representing the
sign bit as you suggest is probably sensible, if you or someone
else with hardware could do those changes that'd be safer than me
since I don't have any relevant hardware.

--cUOpnJNniSwyJdu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYfAoACgkQJNaLcl1U
h9BJfAf7B3joo/SYhK6oGAdaN56an7+IlkQ0/QM4LxxtzJAHTdYgPw8KvULqKNVn
9fq1qDCdQJUa0yPe/33rdcBdz5TdhzejB25PBdzGZvXxcf+9UCruYM9VbWu/EsTu
behVojQ5bgoC6KXR16vozzDd0lNA4Z8Xit/3HOMOJaQoakR1c6TM5TQ14ViBnsew
qL5+5WkZNnjLvLJ1dEiVKAHodFX7LPCFjnt4+m0IBNpCwY+WmsH+cZtTRq38atgx
COKUGvmh1OYplTFCtfpy2VfYXBZM+OjGa3KzYJoM/mJ9PcRln3kDGS/Gwu2UXNzt
VmL6EZ5wuiYVDVZtEr7ygFBBZ34xNw==
=QQ+C
-----END PGP SIGNATURE-----

--cUOpnJNniSwyJdu2--
