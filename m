Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E394B29D7
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 17:13:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3181A28;
	Fri, 11 Feb 2022 17:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3181A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644596019;
	bh=rgSRG/wI/UvP1JIcRcANguOObOhXqt/uGPw7rZYmMLc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CVf2DbUsdUSay6aAYPmd3Dn1gvCIC5GpblCyXYbtyHk1lLJjOEw/TsQa7SKR1C8Lh
	 UTlFg8YvNFkE271C1TpKTtQzFFs2BAG3mLJRCnaUiNyX40N/Eqgh8EZ9RfSCnclF5s
	 s9fsjWxaUU3Uurt/KnJ0MfagQ9qijIhLzxdngrhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6759BF80166;
	Fri, 11 Feb 2022 17:12:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37003F80125; Fri, 11 Feb 2022 17:12:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB28EF80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 17:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB28EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TH0MAjBS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 906D6B82A6C;
 Fri, 11 Feb 2022 16:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB90C340EB;
 Fri, 11 Feb 2022 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644595945;
 bh=rgSRG/wI/UvP1JIcRcANguOObOhXqt/uGPw7rZYmMLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH0MAjBSPqE4IvkEaG/RqqjT//6OxDhIaX4ubPKeBufLBVs+dhZOSFK76aUYUIrFu
 qm3Q+9OuINork29yHWxhWekK77boma+MX+IjD6R9YfY+PtYB1WtxsvcQq3H0qzE8kj
 fMEaAzT+nHQQNoA75Wd2N3/mqGMd4UAWe7pz/iO6v8MFKpcQFelNPDWbiXMKx2T8N2
 hyCknDNwaFNyJff8KDVIr5Ndy2b12grxjQXCyMli2hTx9y4czC4fWzJLiLhwgw3iNh
 c3RgLyGb5dSSXN9m5nZQ3qGxBkZsW6/C2qS0l8OzNN2wMfOS0SLqDusMgBWWe5+25A
 e310hORe+8+Xg==
Date: Fri, 11 Feb 2022 16:12:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 10/15] ASoC: mediatek: mt8186: add platform driver
Message-ID: <YgaK4hiRjEJi9wQ4@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-11-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gYCP5ior9YtfvDdG"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-11-jiaxin.yu@mediatek.com>
X-Cookie: do {
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
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


--gYCP5ior9YtfvDdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:13PM +0800, Jiaxin Yu wrote:

>  sound/soc/mediatek/Kconfig                    |   44 +
>  sound/soc/mediatek/Makefile                   |    1 +
>  sound/soc/mediatek/mt8186/Makefile            |   21 +
>  sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
>  sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
>  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
>  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  262 ++
>  sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  211 +
>  sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
>  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3030 +++++++++++++++
>  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
>  .../soc/mediatek/mt8186/mt8186-misc-control.c | 1729 +++++++++
>  sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433 +++++++++++++++++

I know it's already a long series but perhaps the clock and GPIO bits
could be split out into separate patches?  This one patch is over 300K
which is a bit much in one go, especially when it's not just all big
tables.

--gYCP5ior9YtfvDdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGiuEACgkQJNaLcl1U
h9CJtQf7BDZBnFCixO3E3MMHZvLzF2Pnw7+W3qm+6WvLPzVSD0iOyTc1J3ZrilB9
06VgI3G0b0T12wP+S0o0m4nWBfjBuFcSm0SlMQ8tNHm4VNZz13RJWL/HFKOWBmyL
j3orzapgV2Q46cYWkZpRu1ghoNt8yHbXOtj9fM847nykba62lkcTCCMQkGZCxPuU
wSQvZko3pHCRhRV24sQuIuLE2XhP+trDjSJzEG7EpcgPC2OLioAtCOZMaqbjLT1P
7K2gfHPXcBfiCOAn4p/Ns4votdDgBcoPwnyKmcn1V+wuRKdGQT5E15QOAyRi6s3Q
9pCv5S38o6lxca49gRWRCRt7T79E8g==
=dsn2
-----END PGP SIGNATURE-----

--gYCP5ior9YtfvDdG--
