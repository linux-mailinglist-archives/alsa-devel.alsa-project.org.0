Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18256A0AA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 13:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0BAAE8;
	Thu,  7 Jul 2022 12:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0BAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657191641;
	bh=DVB104lu1AOZagtnZglM2NCSIKP3Ak0rdgwvu8nMz8Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qms7A4GATfdTNchSrlrtHFFysckWwjpLax81jU5ByL2ZtDo2IV2pES5qX0cCgPn2+
	 um07P9Bv8JQPU66Gu/TxR1S//1K1LCNPir5oS4jimCo4MwHJT+x+G8RqRDAR5ISS8g
	 ARLS06x5eEt3MYwJLOagigwu5bQTvXv8R2oAcyv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42912F8028D;
	Thu,  7 Jul 2022 12:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFB5F8016A; Thu,  7 Jul 2022 12:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FC0F800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 12:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FC0F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jQO2kyyc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E76B622B1;
 Thu,  7 Jul 2022 10:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509D6C341C8;
 Thu,  7 Jul 2022 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657191568;
 bh=DVB104lu1AOZagtnZglM2NCSIKP3Ak0rdgwvu8nMz8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jQO2kyycdMix32swwLMY8yMfqU/Rv6H0UQVzafIkNvkephrAZDTjKl2N3RLHgPjYC
 PMvyoVRmMLykahbXYyO51Ypnyo2IauS3zWxQx5qNL8ZgPG1zK14tk19oK3opHf++Wy
 ytdByJzeU5B7Ods3LYIPrERlZLvmNQr8DVK4kGuaUT/UlyKEwRxTkliUnn4ukWQXvw
 1WEX7tAHxl1kEowNm5j+UmrfQvUG33e0HzWqC5xyKrUv/zOTsNn9Bx799VFDNGhzUh
 q848Gxl5pym5GZjs/cE4hOr1xDa4jE64nr/r4L92j+JXNjrEmQD8FbZn20h6GQn8H5
 kSFC8QGdHBnIA==
Date: Thu, 7 Jul 2022 11:59:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v3] add tas2780
Message-ID: <Ysa8jKJj5zd8oExQ@sirena.org.uk>
References: <20220707102631.2224-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9QcLua3CuVcFXkNY"
Content-Disposition: inline
In-Reply-To: <20220707102631.2224-1-13691752556@139.com>
X-Cookie: Tell me what to think!!!
Cc: navada@ti.com, asyrus@ti.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, raphael-xu@ti.com
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


--9QcLua3CuVcFXkNY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 06:26:31PM +0800, Raphael-Xu wrote:
> 1.update Kconfig and Makefile 2.add tas2780.c and tas2780.h
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  sound/soc/codecs/Kconfig   |   8 +
>  sound/soc/codecs/Makefile  |   2 +
>  sound/soc/codecs/tas2780.c | 663 +++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/tas2780.h | 101 ++++++
>  4 files changed, 774 insertions(+)
>  create mode 100644 sound/soc/codecs/tas2780.c
>  create mode 100644 sound/soc/codecs/tas2780.h

You need to send a DT binding document for any new bindings.  Normally
both driver and binding document are sent as part of a single patch
series.

--9QcLua3CuVcFXkNY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLGvIsACgkQJNaLcl1U
h9DBuAf9EdE+OisVg/W0EsRfXqNCrgZoCncw1GKKaC0IIz8MuGLAZQqvajVX1I5R
kyJTSVkBfD+9bNGepSuq2xB8UHIcjxdjvIr9fG/Cjxzv+jfgZc6khLoDJn+ej56f
HInFj1bwtjsp4SIvh5WPrBaWDIisPt6v4uXVMs0+ybxTBloE5u6giEHeAraYsWxx
SiIWdkyAq+gczA59vrP/GpZoGVArlFJF/Mca3+PkCbt2u57kBODPW5LrPf2w7jMn
vi+R551cBDs1nTOg8vCwXU3X5BqzFD2uFmvbBlu2HZZMw2MGpMCwNerhpXKPo1VR
Qh07kv4iGy2w3t7GlN5KCz0dty613Q==
=0Zml
-----END PGP SIGNATURE-----

--9QcLua3CuVcFXkNY--
