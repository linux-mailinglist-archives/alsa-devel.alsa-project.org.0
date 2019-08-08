Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909586A97
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED651660;
	Thu,  8 Aug 2019 21:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED651660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565292617;
	bh=E5acELIllQ9yAAhlibVQUPWAulz7hAXjjGOJKHYdjsY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jic+d0P4odwNC7wQKfpCYp/M5UmpRt5FfZ3x2rRT+YKFWMlLzst3id18s/6zGSemc
	 KEMrgCtVtFf5CUkFrS5k4Yof9rPCE/rmfv8x735sSy0rdxRVnExXK2TkDVOosytrgM
	 5nL64QB9loNIgNDUJ/A3WY5eGju5TLbpk/FwiZMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ACCEF805A9;
	Thu,  8 Aug 2019 21:27:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33429F805A1; Thu,  8 Aug 2019 21:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13DA7F80535
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DA7F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LEu9JLll"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=loQXC1douT+pE3TmAqOFGF87K1GV3m/+5JMD18/HSF0=; b=LEu9JLllOYP8sy6yAvu08FPGc
 Go/ojWDAqu+DptOthMkNG7BVmL/SloDqUb8BJ4haeFBUx2PNGzh/xulrr3SIF8uiETb6VcQwIwyEe
 8OUGQcLy3oHIhwWseE1QRYt5Dl3u1NI63a9hjpt3Dm6TRYMj+6g/rQZd8r4FIixFbFb7c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvo4e-0003oc-1Q; Thu, 08 Aug 2019 19:27:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 404BD2742B42; Thu,  8 Aug 2019 20:27:43 +0100 (BST)
Date: Thu, 8 Aug 2019 20:27:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20190808192743.GL3795@sirena.co.uk>
References: <20190808123655.31520-1-stefan@agner.ch>
 <20190808124437.GD3795@sirena.co.uk> <s5hlfw3izhl.wl-tiwai@suse.de>
 <20190808130217.GE3795@sirena.co.uk> <s5hftmbiyuc.wl-tiwai@suse.de>
 <cd3fd8b9ce6e4f9820197c70dfc42b67@agner.ch>
MIME-Version: 1.0
In-Reply-To: <cd3fd8b9ce6e4f9820197c70dfc42b67@agner.ch>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stefan Agner <stefan.agner@toradex.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============6410327436406611702=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6410327436406611702==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 03:16:53PM +0200, Stefan Agner wrote:
> On 2019-08-08 15:14, Takashi Iwai wrote:
> > Mark Brown wrote:

> > I guess we can use dev_printk() with the conditional level choice.

> How about use dev_info always? We get a dev_err message from
> soc_init_dai_link in error cases...

> 		ret = soc_init_dai_link(card, dai_link);
> 		if (ret && ret != -EPROBE_DEFER) {
> 			dev_info(card->dev, "ASoC: failed to init link %s: %d\n",
> 				 dai_link->name, ret);
> 		}

Well, if there's adequate error reporting in init_dai_link() it's a bit
different - we can just remove the print entirely regardless of what the
return code is.  The point is to ensure that we don't just silently
fail.  Unfortunately there's no prints in the probe deferral case there
so they need adding, that'll actually improve things though since we can
make it print the name of the thing it's mising which will be useful to
people trying to figure out what's going on (we used to do that but it
got lost in reshufflings).

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Md64ACgkQJNaLcl1U
h9AMagf+L43HuMa/NUgOlEHZm98nUtKAaX8K47V2+fZA8apI3qs/jrwjcUoIfhMU
CZMT7n2i3X520n100poQubrce5JFTbXLd5Mm7H5E77Fs5zoZ5W53jL6ts5DoyQ5E
UYpoxkg4bMQXmSgAlihHpjLRubteVsS3+07FhrSdGlvwlpGYSBrh+IOMtZes3I7W
b7xTa6denXXkrx8sg6tznkI7q6xweTy+B3gc9GpIEA1CQek6a3WYq6DV+1C+t8dN
Ps0f2A39s+UVOaHpPgtwb9V3DwlBGnUis0vdrET8JpfK7whAEaw1D58ADRW77QiS
o6jc4CTInKtvwwipe0OcMO4Dn9jssQ==
=mPEe
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--

--===============6410327436406611702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6410327436406611702==--
