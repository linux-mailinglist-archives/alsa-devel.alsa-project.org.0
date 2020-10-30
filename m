Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE642A075E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7761654;
	Fri, 30 Oct 2020 15:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7761654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604066622;
	bh=ezT1co7/A415vUI3OedmBQpnZuj4RUFOLmWC6Uq8e8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW2W3DhwXipANNqVyj7VQOoFeepIHq9loJJisktnL9XlYNgyHz5UWUJd0iHo7RWti
	 MYogGJ7gpPNIDhJcvuYLvLsSSrizy3pzLiNwRI79/BLMAuQMBnHfxB3ZMpcFLInsL6
	 uxTVjli/yKwA6WftzhgDgkaj6CNX5lOR/BX01/RI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EAC5F80249;
	Fri, 30 Oct 2020 15:02:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7F9F80212; Fri, 30 Oct 2020 15:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BA68F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA68F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zu8AvI+A"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BDEE2087E;
 Fri, 30 Oct 2020 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604066518;
 bh=ezT1co7/A415vUI3OedmBQpnZuj4RUFOLmWC6Uq8e8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zu8AvI+A6BWnUunYNvSmMXbCosZPmmnBkrCXWdU1znf8GxNmwsL1qefiPnhKQ6y3p
 zktgHtQx2XXZ3lj9hg6d4MAz4DNmYeoc+fzTdhth7rTSHjXPnAhS9UG+xBiPFCuMAa
 nhecO5LyX+/+5rjbVvZXYxIPhbICxHVb2fLYvdMA=
Date: Fri, 30 Oct 2020 14:01:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 2/2] ASoC: soc-compress: assume SNDRV_PCM_STREAM_xxx
 and SND_COMPRESS_xxx are same
Message-ID: <20201030140150.GE4405@sirena.org.uk>
References: <875z6smszj.wl-kuninori.morimoto.gx@renesas.com>
 <87361wmsyg.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Content-Disposition: inline
In-Reply-To: <87361wmsyg.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 10:01:22AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> soc-compress.c is using both SND_COMPRESS_xxx and SND_COMPRESS_xxx.

I think one of these is supposed to be SND_PCM_STREAM_xxx!  Otherwise
this looks OK.

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cHM0ACgkQJNaLcl1U
h9AooQf/dcURqJGXHBnbc+ncYcapjfWjxqzwFTjOpUYPg9Fej5DtbKsdxYJn/nrm
0SGsvY5pN+jI3MPxgTNnpsbjm8Mw3uQb/LcZ522AMEKSGDyTYsGzU+t0gfABppFi
pzx1JAysmBPb5GZrJUIZ2CwALP9qjuLPbaNIxRBqUHF4yJmh46eaewKeTHhkfnYE
PKuXjmv5CGIUPdYsvvRVW56r7fuLgF66UaKO26LKU5dMwfUJ3xGZgK+IJ48dLw5z
lJ/vg69hwxwnwjWOKxYN82VvlPkJW+cv2VLiAIY2uIczLvr2e+jOaSKpRCyA3FjX
wJjg4DhPRXMobd2ubyMgl2fSNXkakg==
=OIFw
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
