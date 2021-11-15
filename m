Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4B4560B3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:39:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8649118A4;
	Thu, 18 Nov 2021 17:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8649118A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253540;
	bh=d7tYqUsWDtoH/nl2BZKWt1Fg723w2autMfgUYEMNJag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vs9ENCNK8CAyWIaZhrLNMe7eDGfa7c8PH3rBAzc9nJ0BOPHOcHEV3NIGx3rnKZ+Vx
	 QJ4PabjmoMRBo1PLMbJj8ifvSTP9VG2tR7MPW+cJF7qrSFWipu+bbEpaZEDDsC4cTv
	 +q214SNlm/83yEShlxoP6SnIlyWG8vuQj1fz1kg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2BCF8053D;
	Thu, 18 Nov 2021 17:33:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB627F8027D; Mon, 15 Nov 2021 14:29:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84AECF80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 14:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AECF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NxAtFPBb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01B2961C4F;
 Mon, 15 Nov 2021 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982957;
 bh=d7tYqUsWDtoH/nl2BZKWt1Fg723w2autMfgUYEMNJag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NxAtFPBbvP/6AMCR/771dj85JLwT9nMjXuRQW/p/vGkRcrzxY2dfXvwIZFnFfefwu
 kvsKyiub8ajs3EgHPbs6+p59+0bA/wbHJl2rz7tgW3TeuyJq/UzZVAAAGhAdFi+CZW
 Uw+2qQawe1sg1MzO5qZDCDpwqeQYNaR5EdOhc2COOEUfXCP0x7GGBQFYXF9J63TxGW
 AwoXnh5gr7ftDkRGa/KmDw/s4JgpvjP7FcwtMuv6k/iKRgLccKlkjLmXo33ME7VFfJ
 JbTTzrKQ/VAOfK2BvkUlHyAruho4/iLVVQdqlwG9oXsUX0VqxqKDDGf3cxU4kWKLOe
 vGM3FZPU3/xnQ==
Date: Mon, 15 Nov 2021 13:29:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 02/11] spi: pic32: stop setting dma_config->slave_id
Message-ID: <YZJgoxE15OYKYP2K@sirena.org.uk>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IMTM3OEYqWoLprto"
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-3-arnd@kernel.org>
X-Cookie: Custer committed Siouxicide.
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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


--IMTM3OEYqWoLprto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 09:53:54AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Setting slave_id makes no sense with DT based probing, and
> should eventually get removed entirely. Address this driver
> by no longer setting the field here.

Acked-by: Mark Brown <broonie@kernel.org>

--IMTM3OEYqWoLprto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSYKMACgkQJNaLcl1U
h9BFJgf/fpBvGqcjOVPEzPWsUxd950Aql84mdfpVf7Q34yAtuAJMlorUf+ARZFeV
RvrFCJ6tyeWZsZCKm+HMgfJFIp4GSOcn2asZ7p06z3lpAzDdX9Yn8aFW1bcIUOee
EjiSLquSQyBmUy+upf3bbaVPV1YyDaj5IajH5PQCVwj1mfRcilnqGpBPEJgpEo99
MNhpTEA3rcd6ESQQ0QyMAliW+T4BwAkXCtnWnSt4bVq1NfViOEbTGn/Nh7OaGwrI
dNe0cE4t3/9Vo3mtQY6IgF2d7gcIiTePrXRq74w940zsn4Rh6RpX5mGPiwM+OYh3
l7AvLSoqMeL1h9M5Yek/O6k8yVVJuQ==
=RhAB
-----END PGP SIGNATURE-----

--IMTM3OEYqWoLprto--
