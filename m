Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926171AAF80
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 19:27:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255981663;
	Wed, 15 Apr 2020 19:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255981663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586971624;
	bh=d5NO5R4+pTKbDw2nvRV6sx8ho+9qx0ruTp6h06l5jmc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQokuymjoBMtrnHEhTGin2MWD8uARqL7z5Yq2OXh0NmhBaB5HOX1RnfHb1Iw193Lz
	 4+2Yfy9t+UVNM/GD4VJu+pisml3s54HyVVz/cDxtliurLI92jzF5l9lqhBRdfZlJ6O
	 H/Ter/qDEpsWf/xAp4B/H0YpTTsHxlwIGOKZHb2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55AAFF800ED;
	Wed, 15 Apr 2020 19:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 711B5F80245; Wed, 15 Apr 2020 19:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 136D8F800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 19:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 136D8F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ioddeK1M"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01D0120787;
 Wed, 15 Apr 2020 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586971516;
 bh=d5NO5R4+pTKbDw2nvRV6sx8ho+9qx0ruTp6h06l5jmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ioddeK1M+p6lje6jScgkqvCSrCWXP1KSMZwizXm/+iuUUzVfWMuCnRNwtLOhLaki/
 VplfbzR73dFZSdZeq7NSSR4ttdYgF0t3TWjaBw9ZzYlMtVNGSNvy9AGsAETIFbhTk4
 YYIHm+BAEDwtcm1FMSgwY6lIQGpXtQToZHx5m1fE=
Date: Wed, 15 Apr 2020 18:25:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: codecs: hdac_hdmi: Fix incorrect use of
 list_for_each_entry
Message-ID: <20200415172513.GI5265@sirena.org.uk>
References: <20200415162849.308-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline
In-Reply-To: <20200415162849.308-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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


--svExV93C05KqedWb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 12:28:49PM -0400, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> If we don't find any pcm, pcm will point at address at an offset from
> the the list head and not a meaningful structure. Fix this by returning
> correct pcm if found and NULL if not. Found with coccinelle.

I only have patch 1/3 here and no cover letter - what's going on with
dependencies?

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XQ3kACgkQJNaLcl1U
h9Bkpgf+KFnt8Eyn9xQ+cSLW3ZAE8A6T+x6V3Ac9sG5wdKjZK6ERln4EsKPzddiD
njZCj6TovVbltlRk8zIEYsFoLUZxSWQSuTJ1i1V2aJzoR/RXOPWNYmsicuXnW8Dj
CY3wcRVeBR9a74ZY6i/XERMYwgT67vrh64wYQtccUZlYLVqiIfzwh8mxkbBcvdUg
r3eCG/B/ZBTTpdZRawO/iocRK0oPccG5CIVfjYE+Wjd0RIrK3wr0Fqdosh10/OGD
KPeJhXvBQQO+u8CNG6nBjHokvF9fbc+YYrgApOlf4JmnmrgZWf2RoLrVHpQeK8Cz
PPB1ppwMs5i6uDHLsOM+ixtYeNhrRQ==
=+mCF
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--
