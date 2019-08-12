Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5989F15
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4961667;
	Mon, 12 Aug 2019 15:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4961667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565614978;
	bh=Q/yOexqFkw5PiTVjegd0B4mGLjal4JRCVyH01PDUNsk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pp6j1bbFsud8duEkt4b/zr8ppHjpxnzKoaAGWIyMMfTX8YXHiSsyNGrt8MMPEF4xH
	 0S/uNdKLeZfiIcsWQNpIY9USUKjBbvXBrX9f4BIAA6FU5KDQmhPEBrYPaBdCsi6dNB
	 Xqn9/zZeE6Si/zK8MXNWQJCecuXwabuUuP5beBqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EC7F80213;
	Mon, 12 Aug 2019 15:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1834F80213; Mon, 12 Aug 2019 15:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2985EF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2985EF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="F7aSD+78"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RwMOm69GkYwEl+73tdCxBRp+YG/24zUAIFi7JQBwrP0=; b=F7aSD+78e2CwahSjpXXeH0uL4
 I6SvMJu2k5uAnWJ5g+1KQzogKsr0ekmhNftltHt92DQ2+fsE+Wpes28yBMulNAocqsjnWo5o+A6RU
 JPSEMEyqAz8f20gvPzsxvyuvJIkHOTPDlZlcGK+HesQu2B40ro6ldmwIPyr2mKE7e2qHo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hx9wh-0001Jz-T4; Mon, 12 Aug 2019 13:01:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3D69A2740CB7; Mon, 12 Aug 2019 14:01:07 +0100 (BST)
Date: Mon, 12 Aug 2019 14:01:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20190812130107.GJ4592@sirena.co.uk>
References: <20190812095304.19030-1-peter.ujfalusi@ti.com>
 <20190812111332.GH4592@sirena.co.uk>
 <20154773-1cf8-4e2e-a248-f3dfb29a5024@ti.com>
 <20190812115751.GI4592@sirena.co.uk>
 <4055fa34-c6b8-5b47-c728-54e65ef0f16c@ti.com>
MIME-Version: 1.0
In-Reply-To: <4055fa34-c6b8-5b47-c728-54e65ef0f16c@ti.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jsarha@ti.com,
 misael.lopez@ti.com
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Protect hw_params
 callback against race
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
Content-Type: multipart/mixed; boundary="===============3794624682202806812=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3794624682202806812==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xssso5lpTBgMxDfe"
Content-Disposition: inline


--Xssso5lpTBgMxDfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2019 at 03:56:11PM +0300, Peter Ujfalusi wrote:
> On 12/08/2019 14.57, Mark Brown wrote:
> > On Mon, Aug 12, 2019 at 02:46:33PM +0300, Peter Ujfalusi wrote:

> >> to card level could substitute (new mutex on the card for pcm operations
> >> probably) the need to handle this in drivers.

> >> We would need to change soc-core/pcm/compress for this.

> > Yeah, it'd be a reasonably substantial change.

> OK, works fine on several boards, I'll send a patch tomorrow after a bit
> more testing.

Ah, excellent, thanks for that!  That was more of a "we should do this"
thing than a "do this instead" thing but obviously fixing more systems
is even better so please don't let me stop you.  Only sending applied
mails when I push things out solves one set of problems but does make
for other races :/

--Xssso5lpTBgMxDfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RYxIACgkQJNaLcl1U
h9DcxggAgkCTz8igdchM7COXCZBPAt9/smtbOoA0ovffaDpRrZxbKRQHtfSnt5Nm
ABoGFH9ZTjXK7lLHh2oSIRs98vQ8/Z+J2WFSdrq37DF/VFZ96sEneBM3LdP62Ora
xOYhn+w6blFr++atHAMBQIVwbXvf+YYfw2LZFLNp2TITCyf2vNggnqv+ewAjDF24
uyfpnXcVa8uU1WN/mUMrD82mj7PXkGZLsXaArwUR+Fm5mPcQRbjfe/IG7+jn6do9
XIxzEUAc8LdU/4IL+8S9MrGY+neDMFejXWPBHBTZ+QT7B0RDYGRFjYE+TiHDOtG4
9rpBKu+nk6kJ6H/dub+FypV8YsIOXw==
=BT1C
-----END PGP SIGNATURE-----

--Xssso5lpTBgMxDfe--

--===============3794624682202806812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3794624682202806812==--
