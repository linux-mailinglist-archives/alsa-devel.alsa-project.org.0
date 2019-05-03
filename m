Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF0126E1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 06:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAF61865;
	Fri,  3 May 2019 06:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAF61865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556857781;
	bh=p6jlWBiybd/Au26FcfG63aKph758yyG8llqnyEAI5/A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uj0WcaVyDvalaG2I9Jq3twQS/+PyWac7FggMAyZRRM8xbkW8llk5XtGpf2Fpoc67n
	 vIxksol9OeHeN29aK4VbTbA9bSv3T9etkx/pgHw0H4SZAy/0HQvXEuVTg0344UTgcF
	 /kOUBOslhUxdXkyxBArR87cC9mgQWJGbw54w0Cds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1AE8F896CB;
	Fri,  3 May 2019 06:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A11F896B7; Fri,  3 May 2019 06:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D1B6F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 06:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1B6F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kSYuTYG+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hirmFxMWxTe8SvSlfv6UKmH6ZLra2U80Aw6D8pbteKA=; b=kSYuTYG+34olIoQ8l3LjWqqda
 lIOJLqMIwpq9+7seT5ZdLRiKdRc390u5YcQ8Fwsam3XEW9MjXMB8STya8NdLgoXH3phgTaihHhUCF
 TeSrl2rB5jaPvdVgZhB++HmmmC9EkXwOlNiOCjXTpb79MogT+it7fnJc6/pslmHpxEQGM=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMPnU-0000Lu-Kk; Fri, 03 May 2019 04:27:45 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 9D2FF441D3C; Fri,  3 May 2019 05:27:31 +0100 (BST)
Date: Fri, 3 May 2019 13:27:31 +0900
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190503042731.GX14916@sirena.org.uk>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
 <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm
	runtime function
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
Content-Type: multipart/mixed; boundary="===============2301398119992410257=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2301398119992410257==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7fXEoLLey27Fs/d6"
Content-Disposition: inline


--7fXEoLLey27Fs/d6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 09:13:58AM +0000, S.j. Wang wrote:

> I am checking, but I don't know why this patch failed in your side. I=20
> Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, =
all are
> Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/bro=
onie/sound.git.

> I can't reproduce your problem. Is there any my operation wrong?

The error message I got was:

Applying: ASoC: fsl_esai: Add pm runtime function
error: patch failed: sound/soc/fsl/fsl_esai.c:9
error: sound/soc/fsl/fsl_esai.c: patch does not apply
Patch failed at 0001 ASoC: fsl_esai: Add pm runtime function

which is the header addition.  I can't spot any obvious issues visually
looking at the patch, only thing I can think is some kind of whitespace
damage somewhere.

--7fXEoLLey27Fs/d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzLwzAACgkQJNaLcl1U
h9AAiQf9HER7t18a/h1Xns+qrJ2Gt/oRnh2FQEPHz/ajt0N1I2kyvwnDMxXjU34Q
FKJHEqKuZ0uke450rOvpVifBPhnbxhdkqVCKjT4sW0fyznHNxy9PQ0/3L25J0v1J
pPEBlTC98wytk8rkdrJqwY3gBV6lzaO/2s+dntb+7w9jqadwDz/QvpGBY3rFGCtd
D2vBoMjd3MhCZRZv2VuVfPuV/xtmdS+/wwhiE9Wo8Q8+55wfgN+7mNaYAkyofhUS
3l0RLeg4aXFJvltKO0oHlToG+emSt5i06hp0QQfTFuUKYe/d9xVKb7z8Icas0mMf
LhcnV09lhAjvRs4boOmGzenukdsmxw==
=jyVv
-----END PGP SIGNATURE-----

--7fXEoLLey27Fs/d6--

--===============2301398119992410257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2301398119992410257==--
