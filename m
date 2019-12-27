Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98212BB9E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E881670;
	Fri, 27 Dec 2019 23:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E881670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486606;
	bh=Y0p3YMrYGIIkVH+kiPIcsySqagRjdK+f2SqVDfqh87Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkjADksVCiMg8LkfznRcGaAspxKbgLBwF6x3jzKxpkBmjeojAGyLUzWSCSs9H7Z9C
	 frcZBU3OQStxq20XCw9nBX2BQwgV7GKVumC53vF3+8qOmwRgQW+ftYakXNhAdGTH9R
	 a/wQTTci+CTTeIm/zoiscX4oQxFj62LIBUcRvdDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 255FCF80131;
	Fri, 27 Dec 2019 23:41:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD3BF80132; Fri, 27 Dec 2019 23:41:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A639DF800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 23:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A639DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JVYtFtoX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wSlIYlha4L+cqEPZ70dByZOLWC0etpORytOtK6GDzM=; b=JVYtFtoXGipHvnzQzUGF1Oux9
 CXAY9oDKzb7/DcMdbU1Q0SaTLUPLsg1EmsJlPkLTkHtQAo2s7dEWnhu4nXlOnWvgZNN1V/s8LQzd5
 0JSW6mLPhnsbwGQOwYFms8QHUtbuOtgTO444G1SGvgdiLq+mnU/4P9KUgO0BELrTnyx/Q=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikyIZ-0006Zq-BK; Fri, 27 Dec 2019 22:41:35 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 414BCD01A22; Fri, 27 Dec 2019 22:41:33 +0000 (GMT)
Date: Fri, 27 Dec 2019 22:41:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191227224133.GL27497@sirena.org.uk>
References: <20191204151454.21643-1-tiwai@suse.de>
 <s5h8smz79o8.wl-tiwai@suse.de>
 <20191227000818.GF27497@sirena.org.uk>
 <s5hlfqy5it6.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hlfqy5it6.wl-tiwai@suse.de>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Fix access to uninitialized
	list heads
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
Content-Type: multipart/mixed; boundary="===============5437970082751795068=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5437970082751795068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 08:28:05AM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so=
=20
> > on so unless there is some reason for urgency (like critical bug fixes)
> > please allow at least a couple of weeks for review.  If there have been
> > review comments then people may be waiting for those to be addressed.

> > Sending content free pings adds to the mail volume (if they are seen at
> > all) which is often the problem and since they can't be reviewed
> > directly if something has gone wrong you'll have to resend the patches
> > anyway, so sending again is generally a better approach though there are
> > some other maintainers who like them - if in doubt look at how patches
> > for the subsystem are normally handled.

> This warning doesn't seem fit at all.  The patch was submitted three
> weeks ago.

There's two bits there - one is that it's adding to the mail
volume when people chase up, the other is that if things have
been lost then almost always the answer is that I don't have the
patch any more (or it'll be error prone to find) and it'll need a
resend so it's better to chase up by resending the patch since
that can be acted on directly.

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4GiH4ACgkQJNaLcl1U
h9BTTwf/QogfOW+DF5B9oISz6ywL09+RA21I4fQ1Yxl7kduPx/JbOEMQpKJ5xETp
VtAPH5jLX+XI+oQNOrB1IaY+BsxliVrtzvMLuGQw+3k/rNkK1eF7PBDASrT1sDuQ
jlYwLptFIK+KHiwypl32rgDcLv04b5F9vnyLpttTM5mwWDE+SIP0sbnAsxhYZIWy
X8P2KL3/7YWU8AkHNkeGpOZ+ghB7n1mnWFP1NOX8NoCO60wgNlloErhQfpHw0P6t
GhQQp68poBWkdQWFI8E5KasOtlHQZnFjV4gmU8J4qbSOoucRPkGmGudpL6CHRQ9f
IP2XvtGitEHMH8HAuIAbep37jZqyoQ==
=FVD+
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--

--===============5437970082751795068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5437970082751795068==--
