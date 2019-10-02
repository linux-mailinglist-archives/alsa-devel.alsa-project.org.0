Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21BC8769
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 13:35:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3F8A167C;
	Wed,  2 Oct 2019 13:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3F8A167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570016150;
	bh=KfzXmgtLbyUWr9NNoHNjQvYs04aNWjBrlurPYp8e/zs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghF2uwTvqPGR+4dNc9vQ9p5uSH1F2ln4Xw2HBKB++z5L6m32Hdan+gGh3MUyb4oKe
	 eg6HDzo7pq3T3MpGv6anOo7ANb2lgCDzjY/jHC6bJT8XmnkQGF9XzZfxm1OSzAoZNg
	 n1hyhz2tBIOpuNEb1s8vMtIaCtmfXfqeWRuW8ryo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B30FF803D5;
	Wed,  2 Oct 2019 13:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47217F80391; Wed,  2 Oct 2019 13:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77AEDF8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 13:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77AEDF8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v1HVyy/u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdwEezXVISsa9PHkwP5BMlyUlO6t4LLnWgMNEkTlL8E=; b=v1HVyy/usl4yaOLpSL4RXACwj
 xxwrXo5u9Bl33UJWQA9pvEzWDNA/MK2Kua6KDvwtt45nWVxPR9Z2LiVu7W4YViRrQpJrL3RmYIx9l
 wmlEHm3K1tzV2FAZR5+txYchrmO5EzTA94ULKeLXUj5msiqrlNUlkbRpW/Wv9KFmvMFg4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFctL-0000Xe-FZ; Wed, 02 Oct 2019 11:33:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 85F452742D0A; Wed,  2 Oct 2019 12:33:58 +0100 (BST)
Date: Wed, 2 Oct 2019 12:33:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191002113358.GA6538@sirena.co.uk>
References: <20191001142116.1172290-1-arnd@arndb.de>
 <20191001175501.GA14762@sirena.co.uk>
 <CAK8P3a2idD4as-9ns0NrLjYGYSEc0=6A67VaNXDacA3-tJEr0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2idD4as-9ns0NrLjYGYSEc0=6A67VaNXDacA3-tJEr0Q@mail.gmail.com>
X-Cookie: Pardon me while I laugh.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: atmel: fix atmel_ssc_set_audio link
	failure
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
Content-Type: multipart/mixed; boundary="===============6968642755152399372=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6968642755152399372==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 09:02:22PM +0200, Arnd Bergmann wrote:
> On Tue, Oct 1, 2019 at 7:55 PM Mark Brown <broonie@kernel.org> wrote:

> > This doesn't apply against current code, please check and resend.

> I looked at "git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> for-next"
> as well as the for-linus branch in the same place, but found no
> conflicting changes
> in there compared to v5.4-rc1. Am I looking at the right tree?

Yes.  I'm just going by what git said here...

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2UiyMACgkQJNaLcl1U
h9C5Qwf/RiC5F7iZ+aTgaYtUrV+CrzlbJV7Gnco8nXr+ykxzFWvEDLB/K5tZ0iKu
DLmW1tuSIklnqAWfXvnNeX+LDvwHExW1dnQoN81M4lJoP0eCeCLE1UJ/uSCwqFLJ
iY2RLbdkYZ5gXgyb8+eGsHPUtoKUPhP89LBHbdoYX9DyV9dzi95jdbpYeRw3Ux8p
3jB20K8VI44zWlmmyClAi+wUiDx1pPizL9JT9QC1oPwzTyLhIXIth6TuAqAVk9Tm
2pytsySr0MFLF1iDo0izxyxPusZnsglcj4eViS3B2mYBXcVoZmRNuO6IYOHa6+3o
9OGn/XEpbRb0Z6lpimUPNRhBY7vB4Q==
=GnRg
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============6968642755152399372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6968642755152399372==--
