Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DAE183D2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 04:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2341853;
	Thu,  9 May 2019 04:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2341853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557369286;
	bh=2rBP9NGPAyJl73QLplm7mKPjc5AESPFsI+AFnWCsrBM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5cuuKUk5gR5UzZBSVBx74CYu3ocmm9Z01wPa8lcop07cZNubjz1KCQrTXqJH2ucb
	 A/pNOggacGIcfxBSjRFVILFDVvItkJ5GpvTzcwIl/FlXk0EvHNFariudu4nmZz9YdN
	 wvLm6o+2litdsnZY0WgD8BrhkN+8KFp6S65Pu3uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFC1F89682;
	Thu,  9 May 2019 04:33:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F31B9F89674; Thu,  9 May 2019 04:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC6AF807B5
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 04:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC6AF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T88tg49M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A5G/1lWkrleN9QL1gRcbrpqWq59CDY9vHWndd24sW9I=; b=T88tg49MHvWq6cI1ntmfSSKGU
 PiatX9xQ/RVBZZd7JsltR5BYTdxzV6Bfczl4KEPeOrSrTLVJYFDT1StKYHkbbvQp+PRF1hFgD/69l
 3zhHUVy2ck01ZEEbCHuk7H2VwpEA3HRdM10GTpoxKpoG3z9B21TkSFySPEC9JPRkpkz0E=;
Received: from kd111239184245.au-net.ne.jp ([111.239.184.245]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOYrc-0001RR-RR; Thu, 09 May 2019 02:32:53 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9304E44000C; Thu,  9 May 2019 03:32:47 +0100 (BST)
Date: Thu, 9 May 2019 11:32:47 +0900
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190509023247.GT14916@sirena.org.uk>
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190507220115.90395-2-fletcherw@chromium.org>
 <20190508073623.GT14916@sirena.org.uk>
 <CAOReqxgYV3SdXot84Xa4X7=MCZdzWmb2N+jaWzjxgmdoMRx5Mw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxgYV3SdXot84Xa4X7=MCZdzWmb2N+jaWzjxgmdoMRx5Mw@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Zhang <benzh@chromium.org>, Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v5 1/3] ASoC: rt5677: allow multiple
	interrupt sources
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
Content-Type: multipart/mixed; boundary="===============3461819060443869090=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3461819060443869090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sOuRR0jXHR3ukxKL"
Content-Disposition: inline


--sOuRR0jXHR3ukxKL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 02:39:32PM -0700, Curtis Malainey wrote:

> Pixelbooks (Samus Chromebook) are the only devices that use this part.
> Realtek has confirmed this. Therefore we only have to worry about
> breaking ourselves. That being said I agree there is likely a better

And there are no other parts that are software compatible enough to
share the same driver?

> way to handle general abstraction here. We will need the explicit irq
> handling since I will be following these patches up with patches that
> enable hotwording on the codec (we will be sending the firmware to
> linux-firmware as well that is needed for the process.)

OK.  Like I said it might also be clearer split into multiple patches,
it was just really difficult to tell what was going on with the diff
there.

--sOuRR0jXHR3ukxKL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzTkU4ACgkQJNaLcl1U
h9DsMgf8DlzUF2AXtzerym+DDHSpdLJct9B0sDS+4a3l7aJ0l4BGoN8UBK9D9bks
KJq5h9X/JaOojry4WTfrdZtm2rFTa0ztIvtIsNBahAHzYGplUafHmr3lOdsWviUa
IyQk8XARXYWfm0mB0Pdfe58BDY+Y74naM1H6WypF5S1nfCmg2vo4++C1DmV7L56J
7ZdDnceJqVUpW6hyCsp1dRP6Ot8ICzKbUWZABTYVWj/a/CcowwUl+P5/eX5zhM1A
Iy2LN3nZcQE/C7OcG1HB8rZhz+enKCURNLGHHWKmfOuDa8yZR7MS0Q8fFTTwbwow
kPYJXq28b3JoVxlrpjiAFcNg5JUiZQ==
=izHs
-----END PGP SIGNATURE-----

--sOuRR0jXHR3ukxKL--

--===============3461819060443869090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3461819060443869090==--
