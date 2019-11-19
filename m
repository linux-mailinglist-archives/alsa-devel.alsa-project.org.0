Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8C102B45
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 18:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAD81697;
	Tue, 19 Nov 2019 18:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAD81697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574186238;
	bh=/xP8LeErviO+8R8diEJjDtG4wduozcKVbFHIbEDqdbY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7sg331OGTR7PIhCRQhJ23LhBcmD+IORu+GmPRnfKAZq80M1L33ry29JBMCXvLjEC
	 lyHAqDPMZ8PdSPCQZLMYajTfbBm81/AQ/XInPoUJ/RcmBLDRP4Vvc5Vq2BJ7WZWgth
	 kdYdsrPgBsDPvZ6IT+L41v9fL5/rdqlk9H4B2pac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D31F80139;
	Tue, 19 Nov 2019 18:55:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72191F80138; Tue, 19 Nov 2019 18:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 108A4F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 18:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108A4F800F4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B41AFEC;
 Tue, 19 Nov 2019 09:55:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FD833F703;
 Tue, 19 Nov 2019 09:55:27 -0800 (PST)
Date: Tue, 19 Nov 2019 17:55:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20191119175525.GC3634@sirena.org.uk>
References: <1574165476-24987-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191119123531.GA30789@kadam>
 <3321478e-de8f-2eb6-6e6f-6eb621b8434b@amd.com>
 <20191119133416.GB30789@kadam>
MIME-Version: 1.0
In-Reply-To: <20191119133416.GB30789@kadam>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Alexander.Deucher@amd.com, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 vishnu <vravulap@amd.com>
Subject: Re: [alsa-devel] [RESEND PATCH v9 6/6] ASoC: amd: Added ACP3x
 system resume and runtime pm
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
Content-Type: multipart/mixed; boundary="===============1178798416624278016=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1178798416624278016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2019 at 04:34:16PM +0300, Dan Carpenter wrote:

> There is only one real bug in my review but there is just a lot of clean
> up left.  Can you have a co-worker review your patch before resending?
> The patch 1/6 looks pretty good now but I haven't seen patches 2-5 so
> I'm worried there is a lot of cleanup left to do.

Please, yes - there's a *lot* of fairly minor problems that are coming
up in review each time before I've even had a chance to glance at it.
You might also want to consider looking to make smaller, more
incremental changes towards the goal (eg, refactoring the drivers in
ways that will allow multiple instances more easily) which will be
easier for both you and reviewers to check thoroughly.

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ULI0ACgkQJNaLcl1U
h9Ag7gf/U42vZmCsRiImxDyr6Xnk82fk8zre1u5yI8CR3chacv0eLrQrkkkO234e
zHI36xZrvJA4M94bSt5XcDni7/TTra84LizttZLTMdOqUpJdnG3L9OPEOREJvsw7
xwsKRDpvkmnQ6pLJrlIMMEDzPzw/IRbqLMKXJ3hXh/3Ze/aPFtOg72SnhdbM7vRq
XNkbwLwP5C3WZ3vvdtKk/7c+n3vK1yM3MwnsXFLUffuraa087YSEsWXUJ/VF4wsf
BAdlxj8K8mxsfabL0PsK1WV5OLdma2vcEE5mUaQGFqloxegWt87yacqTYCzr9XA1
yr4D+He8PBmAyyOSjynCbUsUD4CLmw==
=7Kmu
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============1178798416624278016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1178798416624278016==--
