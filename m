Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9DB120582
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E35E11C;
	Mon, 16 Dec 2019 13:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E35E11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576499089;
	bh=0CFdWaN4qmAPjtcHx7bD4493QLW+gz877nJtO/4GKN0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdPnHNoeixXRyrupqNjckO5tzLoK/bbFVjy1vtxVkN/H5fFe9YYAI7Dq7AjWd55OE
	 IdTbcfnebTECITOfJMY/5jZeSwuaXO21UGmaNvKyDgbM8u1eqUqFKU1Lh5Vuw7p2de
	 uOZNDCLaVOSJ8M2xCuH4R3x6HxYpO2TZ5BPFfAag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A676F8014F;
	Mon, 16 Dec 2019 13:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A7EF80255; Mon, 16 Dec 2019 13:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A33BF800AD
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A33BF800AD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DB851FB;
 Mon, 16 Dec 2019 04:23:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE57D3F719;
 Mon, 16 Dec 2019 04:22:59 -0800 (PST)
Date: Mon, 16 Dec 2019 12:22:58 +0000
From: Mark Brown <broonie@kernel.org>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Message-ID: <20191216122258.GC4161@sirena.org.uk>
References: <20191214235550.31257-1-angus@akkea.ca>
MIME-Version: 1.0
In-Reply-To: <20191214235550.31257-1-angus@akkea.ca>
X-Cookie: Backed up the system lately?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel@puri.sm,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 0/2] Add the broadmobi BM818
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
Content-Type: multipart/mixed; boundary="===============8701142540930498348=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8701142540930498348==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 14, 2019 at 03:55:48PM -0800, Angus Ainslie (Purism) wrote:

> Angus Ainslie (Purism) (2):
>   sound: codecs: gtm601: add Broadmobi bm818 sound profile
>   dt-bindings: sound: gtm601: add the broadmobi interface

As I said in reply to v1:

| These subject styles don't even agree with each other :( - please
| try to be consistent with the style for the subsystem (the latter
| one matches, the first one doesn't).

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl33dyEACgkQJNaLcl1U
h9CPKwf/Yi58Hf8HxHeOBIXk0Y27oK1tnQS/WvB4x3RVFfqXyikECz5ERE6pdUzc
5fpXeRbxwO7kTznK/2YE6aP0S332ZVMhxt3nG/BqJLSjn/a6EzSFGQ6jiHSQ1Kvj
YqGNOyPONPfN37I4h5j6oviotmeLr2QhhL7wySQsifL9L21S/xVVyy3lj6H8HgS/
e6AqlPkavFIEW3OaGI3Tj9x1iO4TG8tadg+2IlggE46MZunxvlXhrQuLwPxeZSQ5
65revyyoOPDRbDHMIOVaK/v2598LDohjgKyxRXD2IXiiz2X48IHcT71f6vSk+Bo2
YcUYhAEeMUrSq5ZwzcvtJl2vV2clFA==
=B/1w
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--

--===============8701142540930498348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8701142540930498348==--
