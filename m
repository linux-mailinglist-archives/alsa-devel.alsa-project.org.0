Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B78628E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 15:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F761612;
	Thu,  8 Aug 2019 15:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F761612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565269450;
	bh=NSI5sxUnRDnPJetMLGl2ljjo0BcD4pi+ivkOSIQVLxg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ypf9wyl9EKVSRVzchT284BVi7MpEtHSB59xIU26waaagjPdA/3nBE756P1xcRt9GB
	 5+qHlTEXO7iuRgetcm33Rsu7agNHufFda3h2IufaQ4bRpjkyN6vLUWMcaGJU6pi6ld
	 xE3lnYylcsgC8TLJnDYgA1V8Fm4obDi9Sa0zX3Xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C39F80534;
	Thu,  8 Aug 2019 15:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D1A3F80534; Thu,  8 Aug 2019 15:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B438F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 15:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B438F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="L42YWZMs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDgvxRnFHe6Jg69YNcHWL2rm/cbYvx87AACFnx7oU90=; b=L42YWZMsMoio+igAjQUu96bo4
 geO1vCR8YwTzh36MPQXWszoitzZVHod+sphk15BbexSnbzDFLiWRaVo4MLOJuXruG98z9ZY+yYBeg
 IaawLxEIsoEXonMuATreeE+atAXQpVP7B0FNBPxqTJxmUeTzFiM7p/3AvHZIVSUyC8vGA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvi3f-0002wa-J7; Thu, 08 Aug 2019 13:02:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0D6A12742B42; Thu,  8 Aug 2019 14:02:17 +0100 (BST)
Date: Thu, 8 Aug 2019 14:02:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190808130217.GE3795@sirena.co.uk>
References: <20190808123655.31520-1-stefan@agner.ch>
 <20190808124437.GD3795@sirena.co.uk> <s5hlfw3izhl.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hlfw3izhl.wl-tiwai@suse.de>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stefan Agner <stefan.agner@toradex.com>,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: remove error due to probe
	deferral
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
Content-Type: multipart/mixed; boundary="===============1669027200562117324=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1669027200562117324==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 03:00:06PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > No, they absolutely should tell the user why they are deferring so the
> > user has some information to go on when they're trying to figure out why
> > their device isn't instantiating.

> But it's no real error that *must* be printed on the console, either.
> Maybe downgrading the printk level?

Yes, downgrading can be OK though it does bloat the code.

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MHVkACgkQJNaLcl1U
h9B5dgf+Ki7SUxxyvriFNENPkuylZV1sbMznsZZIogox9AW2hDHgCKXsLjFT5kM9
gQ644qx/g31SqeClGf5qFCdskrusee9JBrbD4KrcjJIUsCJxWo9o04+gzBE2cZSu
KdEgzsGLKWRLHw6KAcOCi8A0ivv+SvHkN0pFABLaT+j/rVwgIk+nqwvCEAw+9TC4
l6TyunmOBcu3V7Xf3zlwtyZvP0s3SppGl2meEHdct3tJvXc/qFuGB6Tajd/6Vlcm
hopnicRj76Ujscy8cubggj371VruYsMEhcv5tdANbC2bEIpOIO7xzcPRHkkV62HR
pcs1+xufhA2K5hluWd7IVYq2+m529w==
=AqHH
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--

--===============1669027200562117324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1669027200562117324==--
