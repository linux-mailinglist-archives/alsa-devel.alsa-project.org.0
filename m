Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BB1E3FFE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 13:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E8A17B4;
	Wed, 27 May 2020 13:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E8A17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590578861;
	bh=oU0Y/5u25huOd72JaBmNFl5U1KrJrZttts86TRQdAFc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6NZMVWafI6q9Zeezz7mLUUA3S3PVP3aLwFtq1hJyol7IVNRgjTR8QtrPWXKqY51P
	 SEPLdp97bo0ISgoC34dyYg16huJ/G8BFAxu0MEEdR6Hni9fwvZgxXcK9FMRtwQR59N
	 MJXgdIG/vs5C/tDfg4cQAZ1Rq+eilB9RrZBgujAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5077F80149;
	Wed, 27 May 2020 13:26:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6365AF8014E; Wed, 27 May 2020 13:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 816FAF80146
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 13:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 816FAF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NXm3eC/7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD7D6206DF;
 Wed, 27 May 2020 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590578751;
 bh=oU0Y/5u25huOd72JaBmNFl5U1KrJrZttts86TRQdAFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NXm3eC/74XUS9k/zL2j5RrjTjlWlgrAMk2dRRne6SHvHh6vaV0IhcqR+WOSBg6g1u
 IiI7B9chF7Hd/V77ZpvINKa+B1SfRn0AI/7Ihl+avmo5G1yjFPXHczozSdNUc6inBF
 ZZLsgYDSrWG5OgQeNVFaqM/GCZEQUbJ37YjQUa7w=
Date: Wed, 27 May 2020 12:25:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Message-ID: <20200527112548.GD5308@sirena.org.uk>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
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


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2020 at 10:01:43PM +0100, Lad Prabhakar wrote:

>  				  Examples with soctypes are:
> +				    - "renesas,rcar_sound-r8a7742" (RZ/G1H)
>  				    - "renesas,rcar_sound-r8a7743" (RZ/G1M)
>  				    - "renesas,rcar_sound-r8a7744" (RZ/G1N)
>  				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)

I'd expect a matching patch adding this compatible to the driver.

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OTjsACgkQJNaLcl1U
h9DwwQf/f7ybVQEernStDVG3TFsQK7/YunjNpnQ29AOR0oZ8z5Rx4bOF8GWRtBLh
NooWHgqGXUTPz33IDGptxlvTEwjH3GL+z8EW72NAnagxLCl1bs0IOjMvbDMLX0CG
qhvcgAr3oR+PVOZDB8BXvotNJ/hcF6M6kvdPd1LWTa2usE52u0dg1Zb/8uoYCWyq
calyH03qZW/1HxVgpjJRNmpeGrroXofyxLo5SSQQR1laFQgRxyxwiWAIWl5n1yO5
tcc80ocEq1fipR69xRCkQU0VrEFBHZIZwm1prHIxWD6PRfn/W9/0P50tLMfko5ut
fTPwT7eahVymkQkdtM++bNorrkfusg==
=BGUJ
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
