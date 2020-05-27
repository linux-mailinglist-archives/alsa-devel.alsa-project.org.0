Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2021E40D0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 13:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B2F17B2;
	Wed, 27 May 2020 13:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B2F17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590580553;
	bh=2FN6V2Bc8sz3AaUvRY4owSeT4u5WXLzsQVmPSMXVha8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWG/wK3LjhUo65g95gnmIX/VOdM5UskdHojYrzBeSVJCFgjQweEBaC/LosZejq+e/
	 H6uRIHiVLYMHjZ0c0dcm97KYk8je5asurp6Ku8uw9UPZ1xh7dHBTYrPmhY8v/R7ihM
	 FJqHAZa1JbAhkQFJZ4fobPLwKuNCd24zHtO1znAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 205A0F8016F;
	Wed, 27 May 2020 13:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE71BF8014E; Wed, 27 May 2020 13:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26CD3F800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 13:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26CD3F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qvmKG45X"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6162D207CB;
 Wed, 27 May 2020 11:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590580443;
 bh=2FN6V2Bc8sz3AaUvRY4owSeT4u5WXLzsQVmPSMXVha8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qvmKG45Xosnox8Te7B624Cte7KiuLnU5FrbBGqe/V75wDC4vUmilvxjmPDH+K2A6t
 DQQQSpD+pPrYtqcp0bgyMnRuM4LRojGgmM5l76kr1C7y51VaL9WzXYW7bpAcL0VMGC
 rc/Zw+pvY2AfiATzLngm4gtvf/z/mBB+rPSOHqE4=
Date: Wed, 27 May 2020 12:54:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Message-ID: <20200527115401.GF5308@sirena.org.uk>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200527112548.GD5308@sirena.org.uk>
 <CA+V-a8v0i71MCTNTPVD3XHuyGZiVjzuCkCUnvoUczeMr416ouQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v0i71MCTNTPVD3XHuyGZiVjzuCkCUnvoUczeMr416ouQ@mail.gmail.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 LKML <linux-kernel@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 12:32:28PM +0100, Lad, Prabhakar wrote:
> On Wed, May 27, 2020 at 12:25 PM Mark Brown <broonie@kernel.org> wrote:

> > > +                                 - "renesas,rcar_sound-r8a7742" (RZ/G1H)

> > I'd expect a matching patch adding this compatible to the driver.

> The Renesas R-Car sound for RZ/G1H is identical to the R-Car Gen2
> family. So no driver change is needed and  the fallback compatible
> value "renesas,rcar_sound-gen2" will be used in the SOC DT.

Then the patch to add the compatible string will be trivial.

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OVNgACgkQJNaLcl1U
h9DQggf8DKvCvZ6r8V/Ss6bD4pHqL2Yyq/wR1ZpZO7bN5fhE1FxwBVjx2RufOMzj
osUhS28vEnDIrIBvKEvV6qdF5dEVBkh7VrYYCR4BqxINs5ByRsSuNuISAlK4v7pV
w36TNJlM0wH4uArDhqBNCKyEYB0Vkd49Q2VzPTG/pkgPj76r5vzOQRIvcp26rdQD
LY9MWMMc+8HYG6oQv53vlrbsdwTkPoG0rCvYJ76hcfBLXZmAYx+LkUHSswv/N2cK
lFY4ar8/CYY+/b5OowXlkY9w1VxlTY/BGwLeIo5igjjAsohWhacQ4G5deI4h/558
YKwwAXc16S+O6EIixNq4ljOwNBD5DA==
=PorF
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
