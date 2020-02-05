Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C081A1530D1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 13:32:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4851684;
	Wed,  5 Feb 2020 13:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4851684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580905961;
	bh=9qRyKStyzfH1GuKO/NDvCbYQKF7xVjZiWX5lIRF9No0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XF0+J9nCY6oJ0r9VNlRW8LL6eY0lifVQfMlB8Vn/hFCY7fc4Cd/OX9SHXP7IdiU4N
	 lW+ocbXwPb25X4vj8jHCivINgEqmAvlN2OxzcrnoZ0JE2QWkcYIIUh7/LSVDfzYIv8
	 4SdMzVkopdKFhi4P+Ffod/DC96pQOYlFeJBQuU/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A375BF80051;
	Wed,  5 Feb 2020 13:30:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF853F80148; Wed,  5 Feb 2020 13:30:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B2C6F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 13:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B2C6F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dk1zBpnu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDnThXKdbh/MHjoQI/NRI08VsIEkveWhix5qkb3X+J4=; b=dk1zBpnu77KlmO8ZMOVzkZWJL
 NpilnOp0x9xrk/clWsFk2t+fR8ROnyAxQ79kMf5+6hiHHWMNVtGXSexudUJPRTq0PzbNDtcBl2uHz
 Cv2sCFBbE7bE/RdvWlDEZb5xkQVAnyX8ZCXqzOtCFTt7HbdJV/JkiTQ+CZsmadqoFghW8=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izJpU-0004Hs-D0; Wed, 05 Feb 2020 12:30:52 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id DAC6BD01D7F; Wed,  5 Feb 2020 12:30:51 +0000 (GMT)
Date: Wed, 5 Feb 2020 12:30:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200205123051.GH3897@sirena.org.uk>
References: <20200205094707.GD3897@sirena.org.uk>
 <20200205102025.GA31084@sirena.org.uk>
 <s5h36bpb6i7.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h36bpb6i7.wl-tiwai@suse.de>
X-Cookie: Programming is an unnatural act.
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
Content-Type: multipart/mixed; boundary="===============6326541163164176088=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6326541163164176088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Dt/lkN5I0m8i0o7"
Content-Disposition: inline


--8Dt/lkN5I0m8i0o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 12:47:28PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > There'll be another patch on top of that which fixes some
> > additional cases.

> Is the additional PR planned in this week, or later?

Later today or tomorrow, depending on when CI finishes and stuff
I've got on today.

--8Dt/lkN5I0m8i0o7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl46tXgACgkQJNaLcl1U
h9B/uQf+OjDCt6mEROx7X6cFz2Owd17/CUCPCxMrH0d+xkPoBPuXs9lg4BFCPVM4
in0z3JpIM/z/NbFPFwldmC5QP9/77nLZMmroUxG0sKNd7t7JcDZoafJ2giFS6Ji7
DccU0RGQ/gqpUGuk8cLT6UK6aj2NAejlNFBeHoVykRYsZdXVM8owYy1bB3K4SUez
HP3AgTZDILdyNcbYjgxENNouXoQKY2WRhav4IGyaag0rskRcM/XpIdI8wCWalau7
n5WPjYS1iBO7qec1YlPSLM/ZFap6J2fq6yXOq6V+5bgiUB3FpU4qVdjwNaAkoqAQ
EcpaV7oagJ4au9B198wGrQs6A16XLg==
=aX1B
-----END PGP SIGNATURE-----

--8Dt/lkN5I0m8i0o7--

--===============6326541163164176088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6326541163164176088==--
