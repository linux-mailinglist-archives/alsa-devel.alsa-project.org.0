Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D204760D232
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 19:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F234CFF;
	Tue, 25 Oct 2022 19:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F234CFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666717363;
	bh=ZuJKcAQMkujH9+0prLxGhTP9jvrCsGmBnKWefprVjGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bXZUTsHfhU+vl+WYnLm8v2V8ItYTY10TczPe8FC9KFoYh+fmR58pD1jRPzONudP0j
	 PEiusjeJYV70NxYlmIFDrWoc8d2F+VxBWwwqzrVqLasR5r7w/KAEiwQHNxuALdY4py
	 XtVWRmZpnowkLeqQWkKQajm6WxrkObo1aT+lFJF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9593F80100;
	Tue, 25 Oct 2022 19:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9604AF80431; Tue, 25 Oct 2022 19:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C2F1F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 19:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2F1F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NpA0LzHr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E7FFB81DA9;
 Tue, 25 Oct 2022 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8019BC433D6;
 Tue, 25 Oct 2022 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666717299;
 bh=ZuJKcAQMkujH9+0prLxGhTP9jvrCsGmBnKWefprVjGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NpA0LzHrgSz02sllow3ZDsWOk+g4yHqg+faYVEftNuUDM9MtAy8fPx9azP4XDlovm
 Rxx2fsTW9RUnmnrglNfbaAcpIeSEmeWX67yDyo5Mx7Wc8UtOQAiMzS79d7KEHN9QF6
 y3HkELMs2eZ5LaSNP/FR+1mp+ye5+EdXQ7zZjr96cVFIMQwd/xZnLWOIETUeHojeCy
 iyzOk+iv6xPCgPqITLTmLRd4bO4kHJ6hrMDy3aBP/HQdVLOFC2Vpzz69pqEZyW+n7P
 mc97cZ9+5/pR3WMEupCZfxgE5uqgCfoe7i4O24SvmSQLHrgsSSL4eC1XOvxC4NOwH+
 UwUnUBOhhJkRA==
Date: Tue, 25 Oct 2022 18:01:32 +0100
From: Mark Brown <broonie@kernel.org>
To: wangkailong@jari.cn
Subject: Re: [PATCH] ALSA/ASoC: replace ternary operator with min()
Message-ID: <Y1gWbN2/Tbf1jeL6@sirena.org.uk>
References: <3d74bcaf.5.1840fa4d439.Coremail.wangkailong@jari.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="52xkT7tmDJB4XLjc"
Content-Disposition: inline
In-Reply-To: <3d74bcaf.5.1840fa4d439.Coremail.wangkailong@jari.cn>
X-Cookie: Your step will soil many countries.
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 motolav@gmail.com, kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 cezary.rojewski@intel.com, lgirdwood@gmail.com, tiwai@suse.com,
 peter.ujfalusi@linux.intel.com, mkumard@nvidia.com
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


--52xkT7tmDJB4XLjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 10:56:11PM +0800, wangkailong@jari.cn wrote:
> Fix the following coccicheck warning:
>=20
> sound/soc/soc-ops.c:817: WARNING opportunity for min()

>  	kfree(uctl);
> -	return err < 0 ? err : 0;
> +	return min(err, 0);

I don't think this is a good warning, while I'm no big fan of the
ternery operator the new code is less clear about the intent than the
old code.

--52xkT7tmDJB4XLjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNYFmwACgkQJNaLcl1U
h9DnnQf46hTo5WrWkISGqW6jNIBXt5mGN0OPMV3MELnvzFgLtMs0v3kRYtPCzt8A
i2D6cV6vpswxDsakPONljDX8tHDl2BnjIU5iAlC0y6SKvkNKYTFY11+YwlmIpXzZ
G+rZO89kV4Lp2Kg9otPu7GIx0YRL5JwpatiDsObBoqUoBobAzrqnltXKAnZtYjaK
/GqYM4rOZzQaMMxVOT560lpvEBlu2H39qlYkCbt9jyobJamikptAC2i2QzncZP+0
go01VG5NcPB+1WrijzNxsNolfX0qy00KjpOsSnkbGX/AghEzwls9YGyZt5YcMmX6
b/8y5yIPxykoK3jnZ0L7/x8cY56X
=nvwK
-----END PGP SIGNATURE-----

--52xkT7tmDJB4XLjc--
