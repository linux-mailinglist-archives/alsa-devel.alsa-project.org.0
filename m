Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26F1F6ADD
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 17:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0D4169C;
	Thu, 11 Jun 2020 17:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0D4169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591888929;
	bh=fU4053E/gEMjOvm/1ax+QwbZU9nEqKq0J4A2Bf6dWHQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKr/EEh/U0uuUbLV+bVwLX3S7hTnmePzyTNl1o3n5/GL93H8C0beFcnkIQH7fWyNj
	 ML2zqFf+VaVFvPHWux5rACkVsrC+huvVaAc1rid3LbsMaIkbc2cgBWKpQZFJipHBg8
	 NlOxA3r975iKnt6NRoPDSCtNaRu1LPxV1rp+4Zxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C26F8028C;
	Thu, 11 Jun 2020 17:21:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D9BAF80299; Thu, 11 Jun 2020 17:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BD1F80291
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 17:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BD1F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N5Tn1Zgb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DDE22067B;
 Thu, 11 Jun 2020 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591888865;
 bh=fU4053E/gEMjOvm/1ax+QwbZU9nEqKq0J4A2Bf6dWHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5Tn1ZgbQacjixDiubcV1IE5JEiq9iPEMWmGtJ2uM8xzzrHlI2gqPF2Q5iGG1JqLI
 A52kNMFN/6DvyS/5oAyXPU5yFTgGxFM4wQGGa3Q8/cyJWLM0NjP0KLKhMCXgaEEl3/
 wxbew7LG7ar+YC4EVflLnlWgU9cUn3sgLjAXk7+8=
Date: Thu, 11 Jun 2020 16:21:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix more incorrect 'reg' property sizes in
 examples
Message-ID: <20200611152103.GJ4671@sirena.org.uk>
References: <20200611151923.1102796-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline
In-Reply-To: <20200611151923.1102796-1-robh@kernel.org>
X-Cookie: I like your SNOOPY POSTER!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Kishon Vijay Abraham I <kishon@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-rockchip@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
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


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 09:19:23AM -0600, Rob Herring wrote:
> The examples template is a 'simple-bus' with a size of 1 cell for
> had between 2 and 4 cells which really only errors on I2C or SPI type
> devices with a single cell.

Acked-by: Mark Brown <broonie@kernel.org>

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7iS94ACgkQJNaLcl1U
h9ALwgf9FJflzTQOP828gD9dhJPBLf9uqdG6GFRFf/iGqCG+0EHh1MxRNIBXMNFU
pFc2qOrOXnTCvFmSwYib4Ic2S+mc1j9JMhrEjEp6ybbJzWwTmqImDlCydJ81it+0
mJ2ohVbaOo8OsZprM11pEL6wflKweqzJgzQWsg7IgWJUebFsrzEXOKt0nElgxHwM
DxIkj39TRFocuWU1NqkIBefPYWejxr1I8DppfhMBZnAI74UaODz+zAo+EYGPsj+a
OFde9BISP8NNn/skIz7L+4sPP/vkKIw4NoG376dcODKCA88n9Z1clhYE5CkYLhlx
c/Of3H7INUOo4nh6sqkC+DMhtfn58g==
=GWWY
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
