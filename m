Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCF29EC37
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 13:48:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DA215DC;
	Thu, 29 Oct 2020 13:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DA215DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603975709;
	bh=JtH14Ds6dFOIrQ5Kc03YPGt60DN6a1eJ+jTkF1uTGJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkwPavc1iX8WS81jqegpTKrwOyWHDXA0wqrR8g/2rh2uIcIIlHfxxXB4NUnovf5Ot
	 wkt9hBGSuH6IfQWMFKLQA0u5EHCiAYGFHCLJVSrozCzQUf91fYEQo64noNIWj0F1ML
	 Ev+i+v2gwGC5IyW+0DYZjWA5oUJDi/d3wCfjU2+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67D4F800D8;
	Thu, 29 Oct 2020 13:46:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EFE6F8020D; Thu, 29 Oct 2020 13:46:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409DDF800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 13:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409DDF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TtUynp5J"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB36620825;
 Thu, 29 Oct 2020 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603975609;
 bh=JtH14Ds6dFOIrQ5Kc03YPGt60DN6a1eJ+jTkF1uTGJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtUynp5JGg/FSnj7WR+yElFEuDhUJ74owt7YJrWXylnCnwYpjgewSgr0iGypQKLnE
 33oe8FPuds0tl/aQL1OxE351X0uBmOVZySh97bdj0FdN66pEWLpztHojJ/x+5Wkb7s
 cytdfBZsfOgrNpSgR4zIfTfG8yixZww6qV/jK3k0=
Date: Thu, 29 Oct 2020 12:46:42 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
Message-ID: <20201029124642.GA56515@sirena.org.uk>
References: <20201029113311.495413-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20201029113311.495413-1-CTLIN0@nuvoton.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: WTLI@nuvoton.com, YHCHuang@nuvoton.com, alsa-devel@alsa-project.org,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com
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


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 29, 2020 at 07:33:12PM +0800, David Lin wrote:
> Add codec driver for Nuvoton NAU8315.

This doesn't apply against current code, please check and resend:

Applying: ASoC: nau8315: add codec driver
Using index info to reconstruct a base tree...
error: patch failed: sound/soc/codecs/Kconfig:130
error: sound/soc/codecs/Kconfig: patch does not apply
error: patch failed: sound/soc/codecs/Makefile:438
error: sound/soc/codecs/Makefile: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0002 ASoC: nau8315: add codec driver

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+aubIACgkQJNaLcl1U
h9AEgQf9GTP3wZ1rtPqApeH4oCytUBRuztKOlhpDS07uCM+cqcwRZgy9VGV+kSXm
P95Q54rGSkC3+DCzp6xZ9tZY9M7qBQH0wEs+LvK4VouPWW50emPcEQTQcj89phXg
PCKolD+gZz5ePzNkdgChPiW3b0rmNV9xN+wUlDEZhOzhh68AgA714NitoBqIdctq
TRRCNvGsb5Rmhx+1ruS1iNpy6JpUpuSPEjLSD1U+y/dROZodB7HDpMoFvWp+weNH
SRjnDj81/uXn1JDTPjofXXPyk8QoeWyVqpX10uzqbl4XN4moZCCNsuFsVZliCf+5
LpGfpcykzLGfl+33xgHeD6s1tJYkQw==
=IlFw
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
