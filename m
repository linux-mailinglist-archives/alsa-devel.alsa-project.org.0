Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D44199575
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 13:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5285D1660;
	Tue, 31 Mar 2020 13:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5285D1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585654848;
	bh=bAQCZmoL4oMdfq56PDJ+0XswcQkpYW7AGFWBUmKzOpY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaHUNK+h4K24/2fOz/ccN5gOHWfWLhc4cN8Q9pF7nVbOTdFwEqTIUAKSGW9trBuL7
	 GhGCo8zu8+53IYsMxYYejBxPPrrCLc7wW5hYPLmiz59sh5Atkk/vlMc+Fe3cNYQ6g3
	 fo0Bs068OhhBAvKBePMQ+yMXGMcnTgCrQXdLhfcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F87F8010C;
	Tue, 31 Mar 2020 13:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65292F80146; Tue, 31 Mar 2020 13:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C44CF8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C44CF8010D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C6211FB;
 Tue, 31 Mar 2020 04:38:59 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10E73F52E;
 Tue, 31 Mar 2020 04:38:58 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:38:57 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?77+9zLDvv73vv73vv70=?= <gt82.lee@samsung.com>
Subject: Re: [PATCH 3/3] ASoC: fix regwmask
Message-ID: <20200331113857.GC4802@sirena.org.uk>
References: <CGME20200330073600epcas2p3712a5e92d86a524bedda790f2e273935@epcas2p3.samsung.com>
 <001001d60665$db7af3e0$9270dba0$@samsung.com>
 <012801d60728$bdab3a50$3901aef0$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <012801d60728$bdab3a50$3901aef0$@samsung.com>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2020 at 03:51:01PM +0900, =EF=BF=BD=CC=B0=EF=BF=BD=EF=BF=BD=
=EF=BF=BD wrote:
> If regwshift is 32 and the selected architecture compiles '<<' operator f=
or signed int literal into rotating shift, '1<<regwshift'
> became 1 and it makes regwmask to 0x0.
> The literal is set to unsigned long to get intended regwmask.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DK9AACgkQJNaLcl1U
h9AxBAf+IaDIuEkPmWo0iq+VkhxP+pw5o1aqZh0/Y/ZEelN2o5aqBzHYYEN5PCJD
kAX5negFLQExX3qaLYaq2knqCN/N5eMTFPXlXkfLC7k/j6Nu2v8HPOYSvgEtYQRB
rUwRfQQXvu4f6W1egvMV3HqL1wB2nYol2VGIKTp15dgubGRcLMChPhn4Nf9dgSRc
WtMU4tKapuQ3UHOazeHHaRbDemrOhT2FknyucyEVtgh9MHFoxkU+Lw3hLPsnkXBf
L0enRh3+9YV4m6pY+TLJXwRw92US272KxDPv+fIJ1bSovWtWSK7z4Ljuuus4D2UA
1a4vFG231iZb2pIC0mfn2PKZODXCAA==
=fUhL
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
