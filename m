Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A693742EAC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 20:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3450C17C0;
	Wed, 12 Jun 2019 20:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3450C17C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560364040;
	bh=ypEy7ERtGvZchFqrxP/KTDyk5uD1G8mRzj1M192HOp4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3Bm7fAZ2T7QU7YLisLgmfQN3U1N3RbySgDPWTfjCIyJPBpVGwxzUsz5joS7Dontf
	 Tqs60sZG7wqIGkY1mFCWERfpi6nW9Vxaq7S79hUUfL7y2RkiHhZSnUWJIb9iF0P3en
	 fRkjYjMGVPaeOYF79UY53sGPlqzgz/PvGYIwYxIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B60F896EA;
	Wed, 12 Jun 2019 20:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A01F896E0; Wed, 12 Jun 2019 20:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27477F80794
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 20:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27477F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="diZSDCcM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/JejZXuw4c82OjHDF4+j/TFP9PqUXciwPyDMKWbltA=; b=diZSDCcMuyJrjruXy1ZwgBgM6
 U5GLj33sBcQ4EZclDj66fANPwauHu7YcuPai2oGPt2BlizI8WSBbIRMDhgGdE2zavpqxCVIWykapM
 byA1dRAOskAfbv/m648KeoOg5tyt8xc0FNJ8lQuw0ijdPLebMkIY31IxyCPww9X0RoOg4=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hb7w7-0003Ol-Hn; Wed, 12 Jun 2019 18:25:27 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D22F9440046; Wed, 12 Jun 2019 19:25:26 +0100 (BST)
Date: Wed, 12 Jun 2019 19:25:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190612182526.GG5316@sirena.org.uk>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <30e605cd5a295c42c39523d88b4c57298c5a6f1d.1560361364.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <30e605cd5a295c42c39523d88b4c57298c5a6f1d.1560361364.git.mchehab+samsung@kernel.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Joe Perches <joe@perches.com>,
 Antti Palosaari <crope@iki.fi>, Takashi Iwai <tiwai@suse.com>,
 Andy Whitcroft <apw@canonical.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v4 24/28] docs: timers: convert docs to
 ReST and rename to *.rst
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
Content-Type: multipart/mixed; boundary="===============2193487388625868144=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2193487388625868144==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Content-Disposition: inline


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 02:53:00PM -0300, Mauro Carvalho Chehab wrote:
> The conversion here is really trivial: just a bunch of title
> markups and very few puntual changes is enough to make it to
> be parsed by Sphinx and generate a nice html.

Acked-by: Mark Brown <broonie@kernel.org>

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0BQ5UACgkQJNaLcl1U
h9CfQwf/T+GuS4qxkPnnrGt5BupQpYiRUjRWLkbqyLs9yZLDqKhwJZcErxl4gHHx
Z5Vb42b0CWQLguzl90HFaG5XtXjcUalh/JZX6OI+4o/wvkAKyEDLs83MFPvm/tCw
Theem/1VwhHFUCD+yEPPIqCpBnAySRhPm75JjAJqN0BvIYxskUyXZ2T907Q6/I6C
2sOs4xk62gUU50gKtb8O6++rTjpNux3HBPMX2//qoLOXgcapDinpcoChu4yA4w7g
/C2tRwrHi/o+Wp+AvLZLAzHWgsGvzbtrgaKVD18h4qlNfxN7eZbpsFGiZ7uCI5Xf
nYLJXuUu1+AcRHTr+oU1OnO8pq7ApA==
=+02E
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--

--===============2193487388625868144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2193487388625868144==--
