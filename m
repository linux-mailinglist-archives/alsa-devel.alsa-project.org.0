Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2122557869
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A82B1F13;
	Thu, 23 Jun 2022 13:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A82B1F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982458;
	bh=QWxmpYJIQevrOn+jIA9BiDlZ1Jm6cS7KRCVZB/rj9MU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKdhDHjwacKeyHnHLOTJyUGjAs4rzKQvIDdcrpZ0q1AjoQ2sOEUjMpdsex5lfZD5o
	 R7NfhRSK7ujyfrjSx05IxWxWqPSPhTTvZma//8UvmtNByxx0UyHuqMPZwoxPvghjHO
	 mTVU9XMon+noZl5sQ+LV4IgtwhjD+S/1QOHX9EdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE0FF80567;
	Thu, 23 Jun 2022 13:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D790F800CB; Thu, 23 Jun 2022 13:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCE41F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 13:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE41F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uQk8I+Jc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D195061ED8;
 Thu, 23 Jun 2022 11:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C860C3411B;
 Thu, 23 Jun 2022 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655982171;
 bh=QWxmpYJIQevrOn+jIA9BiDlZ1Jm6cS7KRCVZB/rj9MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQk8I+JcFVSOI+L8cXE8qm9iQ8k8bUT7pZ8ijL0cSccXLN/EnEJluw10gdhEyLr88
 s6xeP9hTwyT3i50PQskxDM7s5sJ2nLymilcYIEePm8cIm44TRyGaEB2yaLeixVYMrg
 0mAYkNT2SfaDKlQsjc/t8JthcQT6mrQJK6lEVobXtbCMLERvjkwCLxxYNMtYejSyuS
 HSovhcM4827L2LVHZT2VNMWzjxl7vsjEsFQKWsfL1FBmkr3e3R9PDrzQmE8758RzF+
 yE7Esv/81d3SjOJ4ZNdwrzouWuT87mR+AC21FSj5henoKNvlHs7tJDzCKhtuX9qPOn
 ITMDCSQZB//dg==
Date: Thu, 23 Jun 2022 12:02:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <YrRIUef2WAs15/Mg@sirena.org.uk>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
 <20220623093951.GG38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aRjk/oNkrDuhHxkv"
Content-Disposition: inline
In-Reply-To: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
X-Cookie: I had pancake makeup for brunch!
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:32 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 kernel test robot <lkp@intel.com>, pierre-louis.bossart@linux.intel.com,
 krzk@kernel.org, linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
 daniel@zonque.org
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


--aRjk/oNkrDuhHxkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 23, 2022 at 09:39:51AM +0000, Charles Keepax wrote:

> Mark do you want me to send a v2 for the whole series? Or given
> the size would it be better to just resend this patch?

Series please.

--aRjk/oNkrDuhHxkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0SFEACgkQJNaLcl1U
h9At5wf6Ax7J+7EqACjWVB1NBLm4Fqt/fn2hmYjsWEp5xg2nu64uAExOpqhd88Ub
8EiQ8JJ5Yh+LqGAd+ebgMayuxNfGx/YW+EBYI86mKPNt5JUiC9pf7v5IDM8Tdowt
ItjroWnrAvyu755n93nXekhH53LbekNQZ3r38IqmgYxXfRwuBwo+6LDpWwG+yuZM
qsKAlnQyapzbY/t5/1ziDvbV9Tu1jRGLpytGhBD3ishspCgdES0U6CAXTAiQbGpc
MjSi61J4JAE+Xhu37HN97vid7MjwfolyUldVhZBQk80qRTtR78Iu5cv5Mg1kJ1v7
BEu+WlV4O3xD0frAhInPwl3skpKkHQ==
=ECPa
-----END PGP SIGNATURE-----

--aRjk/oNkrDuhHxkv--
