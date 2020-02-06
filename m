Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E2154275
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 11:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6F316A5;
	Thu,  6 Feb 2020 11:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6F316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580986667;
	bh=aAy3gri5303HhD059PuMxQwpGVcLLyajRbuj4Y8ubgE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JMBiEngHS/cSs/I+Z5VCj8Y0Lhjx9U71sCTkxl19MkbjWRARlx1v5rm1Imlha8KG7
	 Eks7NxI+5z/KLy4b/7yFckkn8D3ukwIS8NE8i8rVey9rcIgA/BIl5JuPH7Ron87dCI
	 4g+eUd2N/mR3aQqNm0t60lWIANJRGFAP2P2ZjTv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB8EF801DB;
	Thu,  6 Feb 2020 11:56:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8A4AF80162; Thu,  6 Feb 2020 11:56:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148D0F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 11:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148D0F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X30RJVCQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9xllZKt1IhPl7glWcbq8oAXrBVtvpBdfKmUoLWj0m8=; b=X30RJVCQM9REJklAmprM0JsUJ
 f7pzhBM5znbU+v3MrRtsb2t+vde4iy8SyEb847/rvARAyq6IsVtEZp3BHTc0yIbcdTl9Wusjj0QBE
 /192QEViy+ceFhlMoZmQ/Ay0h+l09WbYDHWNrSEZGrEAadjLkgxXzhPzlTYJh84Omb7ug=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izep9-0001LA-W6; Thu, 06 Feb 2020 10:55:56 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2C4EAD01D7F; Thu,  6 Feb 2020 10:55:55 +0000 (GMT)
Date: Thu, 6 Feb 2020 10:55:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200206105555.GI3897@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fix for v5.6
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
Content-Type: multipart/mixed; boundary="===============8809419979317701634=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8809419979317701634==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9w8F9fpXfXEoJS4"
Content-Disposition: inline


--N9w8F9fpXfXEoJS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 42b716359beca10684195fd6e93a74ecd8ca8003:

  ASoC: wcd934x: Add missing COMMON_CLK dependency (2020-02-04 11:22:30 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.6-3

for you to fetch changes up to 13426feaf46c48fcddb591e89d35120fcc90527f:

  ASoC: wcd934x: Add missing COMMON_CLK dependency to SND_SOC_ALL_CODECS (2020-02-05 10:05:19 +0000)

----------------------------------------------------------------
ASoC: Fix for v5.6

An incremental fix for the Qualcomm COMMON_CLK issue.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ASoC: wcd934x: Add missing COMMON_CLK dependency to SND_SOC_ALL_CODECS

 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--N9w8F9fpXfXEoJS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl478LoACgkQJNaLcl1U
h9D3rQf/fcBhUOJByO8apVbexigYF3DCBq8K4AYbV1S5hDxkzzFyjXvSHfw1A7X2
V72zNU4sJtWEe+QQVrTtX+K3cnNVnPNgRYY29joaCeHvYKHgbC9D1EqbgncpA/ra
HXPSYdBhisFWUv6uEnIY5vdUVC/UllzenK57vQpG13WzSrQ5SJJ1ZGQc6QgeYvh9
2ymssmj7666B4MCswMR09QggKCxcHMKiBBymisyNhSUqrzDqDdS3LpmKzwRl/mH6
s/Yu8t/zQydS4omGqB4WVLhAGLF5WHeott1rvDRTn4j938NrNtda4MF04SdMIH4d
PdJ4ATfDiRAc35aOe4ZEtpvLkIVdSw==
=r3+f
-----END PGP SIGNATURE-----

--N9w8F9fpXfXEoJS4--

--===============8809419979317701634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8809419979317701634==--
