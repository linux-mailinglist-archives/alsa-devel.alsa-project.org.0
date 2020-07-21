Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A780228C32
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 00:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6B51667;
	Wed, 22 Jul 2020 00:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6B51667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595371659;
	bh=BhTiYP2+HVjNhqYdzdEhd2K0ObIeiI60QRglenqOYJ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqufDtiM8FFCF7zMdz6Q13wbcvuTQaGXcaauKenPWkAofXHj3UTD1PguXwFDrZEkv
	 9Yvfkm/ijgm4652vhiW09IK+OKFEfnYxKwwK4eKxEFqbYc+v4oQTzKjUgTipCk3BVq
	 stbjl00dRSvpBabPX2N2DIzsM3iAjRMWOsF2AU0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D30D1F80268;
	Wed, 22 Jul 2020 00:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0ECF8024A; Wed, 22 Jul 2020 00:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E84F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 00:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E84F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KHHMsIuE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8E6B2073A;
 Tue, 21 Jul 2020 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595371552;
 bh=BhTiYP2+HVjNhqYdzdEhd2K0ObIeiI60QRglenqOYJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHHMsIuE6f0wf/WkMtL1mY8Ce4IhsSUhhUMTl8fZJ3md6X8aQcDUZHPIzVJgY5uYU
 3BhYrLtmBImmpr/7KHjuTk/drTCuUNc+HTtAkSuP+NpAnyUnRBnx0B51xD7NTKePD5
 R4XDjnKABzriFnWTBxFRz+hCtlNIqrXfoIi7EYjE=
Date: Tue, 21 Jul 2020 23:45:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 19/29] ASoC: intel: use asoc_substream_to_rtd()
Message-ID: <20200721224539.GH4845@sirena.org.uk>
References: <87y2nf0yw2.wl-kuninori.morimoto.gx@renesas.com>
 <877duz0ysw.wl-kuninori.morimoto.gx@renesas.com>
 <d87417b1-5bc3-9ad0-a362-0e7e1bb03f67@linux.intel.com>
 <87blk9zmkf.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline
In-Reply-To: <87blk9zmkf.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I'm also against BODY-SURFING!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 10:26:22AM +0900, Kuninori Morimoto wrote:

> I'm happy to work for it.
> Can I resend [19/29 v2] patch only if no-one NACKed to this patch-set ?
> Of course I can post Full-patch-set.

Should be fine to just resend that - the series looks fine overall.

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8XcBIACgkQJNaLcl1U
h9AN7Qf+OIhWooPpWwFpizZG4tpxSmv+enmUA8S2EyhEKrr9C1OPbCrWSdjBl5i6
iAuEg7PRSfksmbsNEl7bPqzkFr4NazSqy6lDtxsrXRuTTbm2D7LT8aXGr7wUtbDv
U3qXM3h8I8SSpJYwer4dRCWDLFgt2SwDvUip1SvFzveWFA0HhTrp3F0kJZ1wg130
rtK7cgLQckPYA9LBAnHBrwCd61qMRthPbBEYnq5Yo/mzzaKei/Xfdx3hyug9169s
s+bMDJrlGDvWMP2u4aLdiHkJDeIT3T9hFmolts6hkCMIjecWdfVP8CF1huMIIezZ
CUgsEChziOHmPN7a8Fo9a+A6unx84w==
=GvWY
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
