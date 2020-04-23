Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100641B6093
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED32169A;
	Thu, 23 Apr 2020 18:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED32169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587658784;
	bh=b0lDH9Mfc1vYyUclWZeFPw/yRYBNO2AbnWd5/GTal1k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZa0PuST+ey96u3fb3xNmKgTNbjTepy1sQULtkpy389+C+zunvqIc+CWDVqPXKGRH
	 q7V72AvbCmmbfu2uuRKZD6Z7i5e9SaxxBWu4YrDq5p6LwG2s4GyMKfw7g2HMSNhGTk
	 sjvGZjZ2b6Ra1yKh9DQqS/f1eMN88alfs6WW5yQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD95EF800F2;
	Thu, 23 Apr 2020 18:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E69F5F801EC; Thu, 23 Apr 2020 18:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34AF1F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34AF1F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m/q/JGZO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 185A920704;
 Thu, 23 Apr 2020 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587658676;
 bh=b0lDH9Mfc1vYyUclWZeFPw/yRYBNO2AbnWd5/GTal1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m/q/JGZOiOuULK8FBCg6+kzEZzijCRb/kOIagFAGm+mmT1SJCEpMKP71Ir2VhCyN9
 KMdfp/h2o0MTQ4fRkdM6BUbYO2A6fhjALWrkRE5JSCtc89Qscx2Ls6iu3dJ0AKQze/
 E3BDDPxuaHaj6GzsRck6xzs8FI/Z0QwbtnKcnA08=
Date: Thu, 23 Apr 2020 17:17:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Add missing dependency on IMX_SCU
Message-ID: <20200423161753.GQ4808@sirena.org.uk>
References: <20200423142805.52757-1-broonie@kernel.org>
 <CAEnQRZDqNRfUu1Yak=8AM98sAicxnv+Cpm0y2UcCMeABcRQPWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+r+clu82y77Ss1pj"
Content-Disposition: inline
In-Reply-To: <CAEnQRZDqNRfUu1Yak=8AM98sAicxnv+Cpm0y2UcCMeABcRQPWQ@mail.gmail.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Shawn Guo <shawnguo@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--+r+clu82y77Ss1pj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 06:21:40PM +0300, Daniel Baluta wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> This should no longer be a problem after the following patch is merged:
>=20
> https://patchwork.kernel.org/patch/11395247/

That's "firmware: imx: add dummy functions".  That'll fix the issue but
we'll still see stuff in -next unless the firmware tree gets merged
before ASoC.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> Anyone,

> What is the exact difference between 'depends on' and 'selects'. This
> is a question I try
> to clarify for myself for a while. And most important when to use one
> or another?

depends on says "this configuration can't be enabled without X already
being enabled".  select says "force X on" but ignores any dependencies
that X itself has so the thing doing the selecting has to figure those
out.  select is mainly for enabling library type things that users
shouldn't have to deal with directly either because they are libraries
or because they're just not independently useful somehow.

--+r+clu82y77Ss1pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hv7EACgkQJNaLcl1U
h9A3nQf+I2bTW/3PPXkZyv7VzVCJ+XuQryQSyRp5MPeQYsFnyDaIFjANu2BSQO38
1LE5Y6fHXOwkgp7p0Vp9KvAynueUuv3U6pgbfgIdYIiWT/VaPCqHQ0+rKqKtUxSV
W/7A8ib61CopaBbAa1ttdSj9VtXbUidJs++m+dQ74UzoZsyy1DNCeDEQ5KP/oYVe
7LfPHCv+UJPlJmSSTzh+gWtTGwflM7v+uvBaqC9o8x8x/qGRaTi2C9J9KBDADNZ4
D+ZPRSR3+v4v8d4POtAQzaaVAFoNtfRz+Q3KBvv8OiS1GetOIKhwwneVSQLnrfZz
eeXN7w9nRs5PBi9G7X3noZPzaygvIg==
=9vPM
-----END PGP SIGNATURE-----

--+r+clu82y77Ss1pj--
