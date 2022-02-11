Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18F4B2869
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 15:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273161785;
	Fri, 11 Feb 2022 15:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273161785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644591352;
	bh=bxAUhKGpof08/VSFAF/LODZ1CrGcjJunAUPVk+bKa1Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CaCLpugRQrQLe70B1uSY4pB3qjZ3erYPFzrHjv08Td3Em8cG71rUR79HNd5kolJ75
	 rTwnVGQW4izsqLYQllFYVyAb3JOIdwBL9WEZWNMhKqVI0YKQu57Tvvv3rP5FGS1jxQ
	 jGVVBBrs+mtSwU6KhE0qt2qdgxb7glEfN95VNAJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B06F8013D;
	Fri, 11 Feb 2022 15:54:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B936EF80139; Fri, 11 Feb 2022 15:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E170F80054
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 15:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E170F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C2yhIiXO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E973B82A77;
 Fri, 11 Feb 2022 14:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9778FC340E9;
 Fri, 11 Feb 2022 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644591280;
 bh=bxAUhKGpof08/VSFAF/LODZ1CrGcjJunAUPVk+bKa1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2yhIiXOQJRaIajP29LJOZGHUZ49NqmL5XSbf84yvJD0Cw2RNDpIGCzeh6pq/cxqX
 uMjolHWJhWpBzvViLbTxleRtgSRANAN1ctsOwk806VP+3Sx/GqaykpD6jf5dDFbQGD
 HJWdgA3AanLR6avnq77f2sQ8yMIizJCJW4CsjxGC+pF/oVUJ8aUS835nn5eyix7gsf
 FIRqJFZtb/mfdN1fgHqd9D6ovpuzZbhGfFejkRBvi0WBh7FkoqCRHRoLGDtw+hhfgR
 Hpa9+82grgIKShn00SCZvCnsCpRVfHQ2hBBiwrKffa++rXwr7RuAv4SakvArbBEnR2
 thCnb2uM5iDFQ==
Date: Fri, 11 Feb 2022 14:54:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 01/15] ASoC: mediatek: mt6366: add codec driver
Message-ID: <YgZ4qdYWeAutC2Jo@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QlW9pqOvflC+sGV2"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-2-jiaxin.yu@mediatek.com>
X-Cookie: do {
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>,
 linux-arm-kernel@lists.infradead.org
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


--QlW9pqOvflC+sGV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:04PM +0800, Jiaxin Yu wrote:

> Mt6366 is a new version of mt6358, and they are same about audio part.
> So we can reuse the driver of mt6358.

>  snd-soc-mt6359-accdet-objs := mt6359-accdet.o
> +snd-soc-mt6366-objs := mt6358.o
>  snd-soc-mt6660-objs := mt6660.o
>  snd-soc-nau8315-objs := nau8315.o
>  snd-soc-nau8540-objs := nau8540.o
> @@ -465,6 +466,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
>  obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>  obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>  obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6366.o

Why build a separate module here?  That'll just make the binary larger
but not otherwise do anything.  Usually we'd just add a new ID to the
existing driver.

--QlW9pqOvflC+sGV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGeKgACgkQJNaLcl1U
h9DIMwf+Pw2HnVc26RpFgDOHvR1H5BYRLyHgSJCd6JQpE2TKhMORPogTaAy1fbkv
Z5OLAx1KFg8nMeSJuCXzny8VmMmY+MLyp4c8kuIdowe+ClR9PrF0XkA+IOLy/eLJ
GF6OxinUeozGJ2rjC58quKQ0cW187ZimFRHTnD7oMDvFI8o9utLHA1Uu7/qQEHDC
J7jBMlvxGdd+rXgKTC7qcL2tFsoUT4VXcTugl3snvv6NqoKw+oAbDKzDKCCfBJRh
nWFWTgMaFIF2GLUoWUP2Z/s42wATKLOBpA0HrwxK8dAx3Q7rvLNLROLlr7efJ9Ou
DXPbM6WV2+luGql1tBWKti715JibHQ==
=+wGZ
-----END PGP SIGNATURE-----

--QlW9pqOvflC+sGV2--
