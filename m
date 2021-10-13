Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDCA42BFC7
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 14:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B271684;
	Wed, 13 Oct 2021 14:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B271684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634127659;
	bh=gJWJiJ1405NHElqLsf26Yakc6lQl2IoKQEyFhE7ZArg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JudVR02v/Xa8MVNGf21nwa8b0gOME1NwKa7xNTuhGuZp8KMI31FgG9ryQ5X0b+WpI
	 ZdXDYOvlIRyjvVOuHn2sPGSpi9EXUys0RIwJLJFof3iZUxAR2az03B5Ke4XA36sz38
	 qqMwAww8lB7/avjYO+MJPFOe8sH5QOlESHpeKTj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67031F8025B;
	Wed, 13 Oct 2021 14:19:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D09BF80269; Wed, 13 Oct 2021 14:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5D5F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 14:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5D5F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ko7iYgX2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAE78610EA;
 Wed, 13 Oct 2021 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634127569;
 bh=gJWJiJ1405NHElqLsf26Yakc6lQl2IoKQEyFhE7ZArg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ko7iYgX2V1mIecp/ROVIwzisIs/D1g7mnIv/e9Ko/dPmO6zoxBSlB7LppKW0uBdvs
 OZHcQiI7x83bakzfPVbXSfKtNkZle2I+40td3enk0h0LcxBb5Pbkb4IsmAYIv0OmVQ
 n4uF9KkEauXCLmM+3SbPmlz4mWB1GDCDWFNEbgkHfHj2B2DGyq/aUlZga0+XMjobM1
 /mhY4jcKnePEget+6CdTRhHxKJbSvRQCVQmXzyLKfjCU8ZhukcTL+0kqR4oiM57U0G
 V4FRkwUfiTut465ytOtE73TmiU7L7Sa6F+GnPC8+/hgVEKYhFOFp/s85qnEVS6+T5t
 VPJfuuTwZkPxw==
Date: Wed, 13 Oct 2021 13:19:26 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: rt1011: Fix 'I2S Reference' enum control caused
 error
Message-ID: <YWbOztKvbvJZE+Ht@sirena.org.uk>
References: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
 <163403898174.2091644.13928014844510803055.b4-ty@kernel.org>
 <b4f96793-de6f-0b0e-346d-f6a53633575f@linux.intel.com>
 <YWbIbnRVHGP82N+A@sirena.org.uk>
 <b58ff7ef-0987-d133-5682-a30c4c023a78@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xc+tNZillfUL223Q"
Content-Disposition: inline
In-Reply-To: <b58ff7ef-0987-d133-5682-a30c4c023a78@linux.intel.com>
X-Cookie: Where do you think you're going today?
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


--xc+tNZillfUL223Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 03:13:14PM +0300, P=E9ter Ujfalusi wrote:
> On 13/10/2021 14:52, Mark Brown wrote:

> > You should also take care that when you're sending things you're doing
> > so in a standard fashion, occasionally I have seen people bury things in
> > the middle of threads or whatever which causes b4 to think an earlier
> > version is actually a later one.

> I don't send patches as reply but in this particular case I did changed
> the commit subject since the original commit adding the i2s reference
> selection was mostly broken.

Oh, if you change the commit subject and reset back to version 1 that's
not going to help anything.  I imagine that what's happened is that when
cleaning up the old version I'll have deleted the new patch and kept v3.

> I can send an updated patch on top of next, but the one we have applied
> only fixes the alsamixer crash, the code remains broken.

Yes, please send an incremental fix.

--xc+tNZillfUL223Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFmzs0ACgkQJNaLcl1U
h9DaTAf+IFc1MKUsNf2YSyEKQsPVbmntkm4CQ7d3uAsOIh4NC+ssUuINwAhfcOuS
noXSj5CatnKsxXYr6nR3/E7hPC9pWZi0KmOHXt2wqT2jlqooUWggIxoOyhCptx7F
y4E6mQc61OKeg76b/A1F1Y/RkKwFoUtYTmZcbAQBdWK9kiAFNixe4dsEy7STjeXF
Bu3VSm7XZtuc4tDB6PgclvIgHgsbr+Z+XFbnQ5Nbd6/Moe43HFefw/Rr+klDz1kI
Kqhv/4EtiMViWTpSWVHRkAplGDSKViVxX9BBtuel6LZapU8IUTVqQiewWBDUbK3W
RysHIQ4o5UOgF9h9nNmfgUQYolEIkg==
=eY9p
-----END PGP SIGNATURE-----

--xc+tNZillfUL223Q--
