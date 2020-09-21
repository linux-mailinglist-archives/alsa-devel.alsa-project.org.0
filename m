Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D327298E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 17:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B7B16BF;
	Mon, 21 Sep 2020 17:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B7B16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600700988;
	bh=CrIwS1xYozSl7U4DdOij9bK6ssn3A331CEG0ka0admY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZRX5Vdcq2TpvupzP4TutltAZ3thTzJva44YlpUiO4I1TVG9/5BcmBrsRHjYaS8pP
	 TU+pBzM4agxn78SfjnPFVyDW+BXdl2vZAfxGDk15hcpFqGSi4Xq5NGNVhf7E7dgNPP
	 xGkvs/nTl/FwN5/F6EBsv+o2AmuQZMf7o3xOKmiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3C9F80162;
	Mon, 21 Sep 2020 17:08:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1481F80162; Mon, 21 Sep 2020 17:08:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734ABF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 17:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734ABF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gQ8sjHjB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E25DA2076E;
 Mon, 21 Sep 2020 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600700874;
 bh=CrIwS1xYozSl7U4DdOij9bK6ssn3A331CEG0ka0admY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQ8sjHjBXZo+vNEWDNum3/lDMUIxQ5EI5VLGzt5Pl5kby/naiCoM79B8dR9dOAjgM
 KcvEeJlAli4UXuLjhwveDzf8fr/gX6A+SVmjUBNN0gUUp9ZP4TFE6snymN1TOX5b41
 Cq72zKQhVaI0NUQVDcvbRBSZgfSF/3CPAc6sKfp4=
Date: Mon, 21 Sep 2020 16:07:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.8 03/20] ASoC: wm8994: Skip setting of the
 WM8994_MICBIAS register for WM1811
Message-ID: <20200921150701.GA12231@sirena.org.uk>
References: <20200921144027.2135390-1-sashal@kernel.org>
 <20200921144027.2135390-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20200921144027.2135390-3-sashal@kernel.org>
X-Cookie: Alimony is the high cost of leaving.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
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


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 10:40:10AM -0400, Sasha Levin wrote:

> The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
> initialization of that register for that device.
> This suppresses an error during boot:
> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"

This is pretty much a cosmetic change - previously we were silently not
reading the register, this just removes the attempt to read it since we
added an error message in the core.

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9owZQACgkQJNaLcl1U
h9DuEAf9E4btRI0NX2oe8V1deZw2buPvoKQPGvwseEr3w1FrbC1fM6nn3sirDyae
RdfP/1qR3WXfI5SZOztv8kG+g88mHWaT2Y1cDv6zZkBJs9+OicUPftZgBS7C30zU
m8avzwevF96pjt70HMjxEPUya2ogLChAFrYA0CMGV1pwEkzOIxl7yv3aEfu0wdv6
eIbwwwrlcs+HDAkwbptYy5sC2xMPRpn2rCBJG290M3x99Xbdy0ShUR+Ac3iuhERy
zVLQgPtt/tj6spPaEXN+mBLw/vshwSwMX5ueJG6TLL6iNlY74l7Wli9u2fbUIAKP
rDH9KHoSSnjFFGNpN31VNuUdi7x8BQ==
=7sIW
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
