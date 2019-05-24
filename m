Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B0297A3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 13:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8AB016DC;
	Fri, 24 May 2019 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8AB016DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558698951;
	bh=XJejhfUdkM2JFTwWstWdBVTCIyMr/Eup4dDqRcCMfhI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4AkQfYtYgQubbS/XRCU4NcN0oww5xT3rQxI8epSZIbEbP+1RQnRwjZP9ZngDY+Wk
	 F3Y5SEC2t2svgX+zCLcB2HHA/MhMRCWTZbkC2QfS4sgY08jv6yvfp1qQureFKUbOOp
	 ylXw4hIuKZZolbCNRYzINlwG1vFpuHNdjVV4INhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC31F8962F;
	Fri, 24 May 2019 13:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5BEAF89630; Fri, 24 May 2019 13:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D274AF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D274AF806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bkLSWMfs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oPkYfkJB6mpn6YUeEKWKRPYZz+SXsCRl+9QnAZj9RaY=; b=bkLSWMfsd9dFjvHxkGfMTKflv
 Yd0uu3ILxfaddHapH5pzwjz34ZSLyZKEpFC4Kp8mf8dAdTat46M+mIwANfCqLPrnpsvLaRpB01bUH
 FXS5RrRHRQ89HU9BvgAtj/mQNshAm7tuzATZ0J3BrZSD5wibXglCQo3aEVc28vmaGFI2E=;
Received: from [176.12.107.140] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hU8lq-0003B8-Qz; Fri, 24 May 2019 11:53:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E2A54440046; Fri, 24 May 2019 12:29:31 +0100 (BST)
Date: Fri, 24 May 2019 12:29:31 +0100
From: Mark Brown <broonie@kernel.org>
To: bgoswami@codeaurora.org
Message-ID: <20190524112931.GB2456@sirena.org.uk>
References: <1558684467-11333-1-git-send-email-bgoswami@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1558684467-11333-1-git-send-email-bgoswami@codeaurora.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add a debug log to track DAPM widget
	power up/down
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
Content-Type: multipart/mixed; boundary="===============2102980459712228591=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2102980459712228591==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2019 at 12:54:27AM -0700, bgoswami@codeaurora.org wrote:
> From: Banajit Goswami <bgoswami@codeaurora.org>
>=20
> Add a debug log to help track widgets being powered-up and powered-down
> by DAPM.

We already have huge amounts of trace available via tracepoints and
having something on by default in the debug logs seems like it's going
to get very verbose for people who aren't specifically working on audio.
What's the advantage of adding dev_dbg() logs as well?

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzn1ZsACgkQJNaLcl1U
h9CL6Qf+P1bE2wDz1Z+mFlBUSWst8Df7vmXu/fK/uO0xkPH0B9Jw9fRe48G5RHeK
EW37C6ORAGvJrqtTHJDJLw3Uarqu8o0S9pS8Y4/xye+B9RYtZDj5Poj4czl/O5ZL
6gW1NzFlt64Cn0rLuvw92Pu3pete6jtrIf3p2Uzpr4/YWwo20x2879MOaZy/27hA
7VDo1X1TZ/wYGdsBMj7y0VvkCaYsqFkPe0N3FocMA1Xpk7C/8zFRJym+zpfSMkAR
fqwyz1xOxWmfxhduLL4rrZqcuK+9LmT44MzZgc9eu3BJz8BknXMmBWcqhtChWgzs
GdeMtNjhcqZhkFXH92+IWuz708Sklg==
=O7zi
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

--===============2102980459712228591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2102980459712228591==--
