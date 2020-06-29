Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40E20CE44
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 13:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651731658;
	Mon, 29 Jun 2020 13:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651731658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593430806;
	bh=QzfAborYCJUbuQbilhwh6UvjIbH/wMLPAczW1yjFyh4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knoE9GFemKK7CRthPPkR+y+fcvnYhYBfAmyD/Ww0qUSLBOt4oD1kna/fRKL904ChE
	 aCbSG66OmeWFD/ZeWA+OprVXHsh53oXQCjvgZg6J4nk8MLbVL9lvP8LTpRJ+fBWXfR
	 xQoZ7vebw7KMGib/Wy0VChpZLSmrmytz51yw4r2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FFAAF8021D;
	Mon, 29 Jun 2020 13:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BADF80217; Mon, 29 Jun 2020 13:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83038F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83038F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v5Jg0pnh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC06B23AA9;
 Mon, 29 Jun 2020 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593430699;
 bh=QzfAborYCJUbuQbilhwh6UvjIbH/wMLPAczW1yjFyh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v5Jg0pnhArgYZz7LwLBjPlxtd6vRTYj0IOIMgp4rLOtYhBhAuafiiFr1vhpfOXwEN
 wrLxjpA8RS4p9ETJ3bn26UcUa5xsSPDqXpo985VwwYsS29nEj5h/tDrEszjRw2fBLs
 A/Ouu84R0teTabEMp0IKBsB6oAkMRUIAPBfYxfeY=
Date: Mon, 29 Jun 2020 12:38:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 0/3] ASoC: rt1015: fix compilation errors and warnings
Message-ID: <20200629113817.GA5499@sirena.org.uk>
References: <20200625153543.85039-1-tzungbi@google.com>
 <159311231750.10637.12370136760007816881.b4-ty@kernel.org>
 <CA+Px+wWX58pbK6958AK89aS13h0pxJ4Tqi3DSbmiOJPQcn7gUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <CA+Px+wWX58pbK6958AK89aS13h0pxJ4Tqi3DSbmiOJPQcn7gUw@mail.gmail.com>
X-Cookie: Real programs don't eat cache.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>
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


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2020 at 01:48:41PM +0800, Tzung-Bi Shih wrote:
> On Fri, Jun 26, 2020 at 3:12 AM Mark Brown <broonie@kernel.org> wrote:

> > > The original patch:
> > > (1) adds acpi.h for fixing implicit declaration of function 'ACPI_PTR'
> > > (2) sorts header inclusions in alphabetical

> I am wondering if it is a better practice (next time) to separate the
> original patch into 2 patches.

Yes.

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl750qgACgkQJNaLcl1U
h9Dg/Qf+OaAkpz/aIixrhzre+qPOfsUVRsz3H/h/6pErGWfbWeyTbiDzWHs+J01f
fKrZ8l5W2McTNghRKu/zI4btcfgR9KYQIDtd4HwSyuE956B5qP41nAFZaNpNbyBQ
Xw/L2aw4wjRDaeRMeVZm32pvYyC3j2nvQRaZpqt91i9kA/7SBjuws5TfY8dbPPEw
LeidLoz7dNPHIbddRbK2KB43owoMHdVvPP8gYHNQZm9ZPaU1Lzph6erywCXRmYFp
o6fxMw0047gXsVoVRrkjjVZNoyPAovf3VgrZanWu/cIxXyGk3DpQytJIrifGU6Ta
nTLkAc8YQH0LGqb6QyZb8s+tZVtE+w==
=WwzM
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
