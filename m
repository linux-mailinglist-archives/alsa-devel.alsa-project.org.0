Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D8152908
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476E21698;
	Wed,  5 Feb 2020 11:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476E21698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580898125;
	bh=NK4++3UeRWYRIXf21YhdFUyk1z1frtmam543eWZGWeA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3NcpLu+0cOlbAWHsu05S1N7bPMKDKmZJ7r5nsKpPdY773+VWHZluVg4blJCxPoWE
	 bMq8pf4rc6JNMbRwXpMmloiKBW86T9gFi8gVkQX2XuRWYT//5pKEeVQwgzKvWncrL5
	 gAkeIHs0OA9WwItdZ/nHpUqOU9lXmqnGCkY40B6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 581CCF8019B;
	Wed,  5 Feb 2020 11:20:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503C9F8019B; Wed,  5 Feb 2020 11:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89253F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89253F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="I7v2Lewy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z597ywsVBbAPiz3vyUNTvRRjoN/66mdaT0UgeKgc12w=; b=I7v2Lewyj0z8yBX/S/q97cptQ
 cAZ/RllEztMUd/oxy03x+j56oIXxqHI+krG8bpUK+VuhhCtBbpgAZ2CfCD6pPdm0GyWR+372njqtJ
 J+IDSvvG8SNim0dBFQjP5mzsZZ5Aml9KCUiS7Dv9fIl0cbjrwPh6xF3tio96WzWqXwGZY=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izHnF-0003wU-Ho; Wed, 05 Feb 2020 10:20:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3CE82D01D7F; Wed,  5 Feb 2020 10:20:25 +0000 (GMT)
Date: Wed, 5 Feb 2020 10:20:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200205102025.GA31084@sirena.org.uk>
References: <20200205094707.GD3897@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200205094707.GD3897@sirena.org.uk>
X-Cookie: Are you having fun yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC fixes for v5.6
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
Content-Type: multipart/mixed; boundary="===============1320692063463248993=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1320692063463248993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 09:47:07AM +0000, Mark Brown wrote:

> A collection of updates for bugs fixed since the initial pull
> request, the most important one being the addition of COMMON_CLK
> for wcd934x which is needed for MFD to be merged.

There'll be another patch on top of that which fixes some
additional cases.

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl46lugACgkQJNaLcl1U
h9CB2gf+KCdcUM64ufRyfAC5kHDCcraRZwBcFogVHClC58RY8C/DlrL+JPlrHBs/
oJXzYipVQV4yqh8EeS4D8Rg7O52Zr4TMbSzD0HxKhVvK9rwyVD63aaj188GZyQl1
EM/gIqOdLqbZDZOFZt7eeltv4X5QfVpuEutHA+ZEIcwYsRm90tC/To8jf3Jgoc2O
Z4CJQve09Qqqr90LH75emstq28mqII90d5N8XT0ZgQnjc+L8pC0djUHHh/4uzgyj
wPmEnOMDrFxgWO6yF+W7D+C6CAm39FJ8ChcFmVRe7z/BYcit+Sb1jN4O2Zpdc3O2
t2jipUaApjOZ1EFkVhslUvSKV3M8VQ==
=+Ss5
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--

--===============1320692063463248993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1320692063463248993==--
