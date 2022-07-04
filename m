Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E765659FC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 304231721;
	Mon,  4 Jul 2022 17:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 304231721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656949016;
	bh=xvKuG9NnPSr3QqLCYuINjvdhaWm9es1akuixSQ2TA/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfiH+OUw1MUSpNs4CkVOsn2yevY3KmfqDgELWt1Pf7M2YL/WKuF8GM0gSZchYA5bZ
	 6biBfp6Hvjd5Z78WbhE3ayT236EuLmcfr0+kofxd4ZmV1MbvAVCPO3dnnKYSPegvLO
	 Lj4jrwDXVXZ8Mgx1YS1B6kJm+No0Gwi/c4i6nhfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F733F80165;
	Mon,  4 Jul 2022 17:35:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306B7F8014E; Mon,  4 Jul 2022 17:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3727F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3727F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tc6qToJL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89257B80E00;
 Mon,  4 Jul 2022 15:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B10CC341C7;
 Mon,  4 Jul 2022 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656948949;
 bh=xvKuG9NnPSr3QqLCYuINjvdhaWm9es1akuixSQ2TA/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tc6qToJLUE3OcWTZdyvzzNRaVUwRTsH54pdLaOiR5gCXly4ruxBEpe/fflrtvkbU/
 AlUhUpyQCebYStNIDjdTXNbyNiOxwwan19EOdHUfxPc9POt2XNR4O2aBsKAIEB0now
 WQ902D/1Pxi9ja1DQwchP/G4GPbbyrzzxQ17t4P6w++SXO6eS7USCO409U8Tuu5qfF
 yutihF0/CZTOrg/Ne43lAHfsFFpjAmgRd8ZmhpYFue8eMb3Z+1TBbji6B3C7XF1SVb
 ngFnxoXIXcxTxHd6FG2DIqV1nK8mIvsWBtDxc2EXbeNwXyBtZrC5mYxbuF2OZBUXvB
 LTvXON7qZjmdA==
Date: Mon, 4 Jul 2022 16:35:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <YsMIzz6JkTLw7heY@sirena.org.uk>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
 <YsG3kKwmoqF2MxU2@smile.fi.intel.com>
 <YsLCwQM0gbhFhSke@sirena.org.uk>
 <CAHp75VeCTEE4-O1LLYNunf_ZU164i8rnqeRf9dvp=R=_eEC=ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45MOapQtPozrAD4p"
Content-Disposition: inline
In-Reply-To: <CAHp75VeCTEE4-O1LLYNunf_ZU164i8rnqeRf9dvp=R=_eEC=ig@mail.gmail.com>
X-Cookie: MERYL STREEP is my obstetrician!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--45MOapQtPozrAD4p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 04, 2022 at 05:30:41PM +0200, Andy Shevchenko wrote:
> On Mon, Jul 4, 2022 at 12:45 PM Mark Brown <broonie@kernel.org> wrote:

> > > +Cc: Liam, Mark

> > If you needed to add me to the CC I've not seen the patch...
> > for review.  People get busy, go on holiday, attend conferences and so

> The question here is about MAINTAINERS. That's why you are in Cc list.
> Do we have an issue in MAINTAINERS that causes you being not see the
> patch?

I have no idea, all that's showing up in my inbox is these content free
pings.  You'd have to ask whoever didn't send the patch to me.

--45MOapQtPozrAD4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLDCM8ACgkQJNaLcl1U
h9CdmAf/bckH9oNhcWHT2zx8i6ZCpIMCbbSkVPDnh7G1w0gmEZWDdmn24VhC/hX2
ngMwMZaCDTaguM6tyTRucSZ+2D7YHQ6kMXa5JP50SOJO7POPDNp1wik21YsQZigE
L3sZ0wbl5g3EbYjRIFNjlJlKTR6bsZjnZ83J3Q4CUdtQ0blwDpRuV/Qk+KIF6KeH
xz75VyVUJVPuNLBUhmPqaEXquXM7PyFLXnPBsrxP37FDaYZROhv2rj2k/iyl/Xq9
UMyBfJleqsXdxKy+QkdgOB4zDJ9B4FQvL+VU+qONO71ymfXP57QiGtFsHJ1Buune
HO6rqKOVdyXjjjlG8C0skIdZ0JpprQ==
=UhJ2
-----END PGP SIGNATURE-----

--45MOapQtPozrAD4p--
