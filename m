Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8144546C9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599E91865;
	Wed, 17 Nov 2021 13:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599E91865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637154001;
	bh=BiqGHhRim3d8BHLcln1M/+lQP923kEXpdloVrzcTV+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2YA3TZatOyKSMBN6SItckzO5uEiwXVu5z040A0tBldnIy6jT0HBN1xu2P+pkHXma
	 qzcECQXWshIXcYltdH4JH0WvMItWb8V+RQ3WGc00XBrqLK+Gv89ytxiG8Lpf/2pcWg
	 clWN1xLoYNuau+QITHZmDrny4CMMhL5gUPvx0h8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C105FF8028B;
	Wed, 17 Nov 2021 13:58:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E867F8027D; Wed, 17 Nov 2021 13:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC9B8F80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 13:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC9B8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O4iDoCVi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1D0863240;
 Wed, 17 Nov 2021 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637153913;
 bh=BiqGHhRim3d8BHLcln1M/+lQP923kEXpdloVrzcTV+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O4iDoCViWqV4WupTN6YQIaCBKRFmNZGc6sauoe8wLpQM6KzFaq+zj/yz1Lq3acZ2A
 /XeBlKoWhHEmEUKg9LIxob69c+IbPX1seIKYvjnsNiIY1Ht5Sl62g2J2c7jrOgQBFR
 1u2mriO87cwIsl6FURhpgd2PQIU/YxQxqpC6Os8K6IB8myHhElTjiEPnbeqhgLaiR4
 hAo5GZ4o0CCa79d/Uudfxbq8nMbSxX9zOjrDLgvUZEj+kqWlANIlFhrIgsKDdVqtqP
 7SBhnDV0aXFdWcP6XKirnYT7dqdZLF/+3ca5Jt+J2G0imQasdUqX7WKp8cZNAqfWwN
 pDmK8Bp4Fs6WA==
Date: Wed, 17 Nov 2021 12:58:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 1/5] ASoC: SOF: imx: Add code to manage DSP related clocks
Message-ID: <YZT8c42cAczfKyMP@sirena.org.uk>
References: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
 <20211116154613.57122-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IqNxkZWaXy7zEpSv"
Content-Disposition: inline
In-Reply-To: <20211116154613.57122-2-daniel.baluta@oss.nxp.com>
X-Cookie: Tomorrow, you can be anywhere.
Cc: Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, guennadi.liakhovetski@linux.intel.com,
 linux-imx@nxp.com, Paul Olaru <paul.olaru@oss.nxp.com>,
 peter.ujfalusi@linux.intel.com
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


--IqNxkZWaXy7zEpSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 05:46:09PM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> We need at least 3 clocks in order to power up and access
> DSP core registers found on i.MX8QM, i.MX8QXP and i.MX8MP
> platforms.

This doesn't apply against current code, please check and resend.

--IqNxkZWaXy7zEpSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGU/HMACgkQJNaLcl1U
h9DbMwf/Y2ImIQs2ZcgXwqFemeuwjb1p4nR0JrACkq7Y3Yo7dOswptvX3ngJBPA4
42pcHMl6wI+nKjqCbsmFpNxsTASko7oXls8H9MApS07yKnG0qWMLB67ljugIDICO
cPphAPTU2x2fpTrHSf4pf3aW+Z2rM1MsnIeqsAbgw+0NsUtniyHC5TQwU2xnMNzX
fCS9CFsM9RnzU794HVx3+7u4LbziYQ6iZ/pI2UXgKzEiy1T8Yk6V6eC0L6SCkRSj
q94sWfWLkFRaarFXmqalp3IpqK8pDop9Oh4GLpDb4VJrzj2/9urZGsnH9nEgRl0K
+UBpEMrgqXkb+aHQmcpaMSb2gdU95A==
=msQb
-----END PGP SIGNATURE-----

--IqNxkZWaXy7zEpSv--
