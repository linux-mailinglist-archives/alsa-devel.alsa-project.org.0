Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F332CFA80
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0841914;
	Sat,  5 Dec 2020 09:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0841914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155825;
	bh=WGPvh/m1la/6pEZ0tQ/GOgG68+E+LycRUiq+bD3Iwkk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xow+QiCd7o+V3ioyLYc/O3SX9WudW6jb2tFYJnwPI1vOppL8IjIqZoKu3ELJMbNsT
	 JMbGUKymY3UPJZmrjquiDtyH8P4KWnqgT2LQWpS4tZBg70kvWKGY8KTMVXlddVItGV
	 e3zm2JfJbOw8r2IjjpMaxE6kgkv6N6JHRWseID40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1489F80529;
	Sat,  5 Dec 2020 09:03:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EDDF80278; Fri,  4 Dec 2020 18:41:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9520EF800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 18:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9520EF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g/TkCIMm"
Date: Fri, 4 Dec 2020 17:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607103698;
 bh=WGPvh/m1la/6pEZ0tQ/GOgG68+E+LycRUiq+bD3Iwkk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/TkCIMmBnQxPWxPF2qMZYVzCmn31CDUYt6k0CzRPEhcaQop/372ntwpVszp4hjIE
 vIVuuPebp/OC1i7cGxGjhjvFCBH+ZOpJXrqSfBUsLkg92qAaqtHe1oRjW2/LiLKRoP
 uV66KhSBbnh6OLWt+7k76XvCzSFsllU2Y5flxry9vND+O+lxolnf60O50XwwBPh+yq
 SoPzZkAnY4VxswfQ2GzN2EHfELa7v8aeYr2tU6kH0grOPrleQ/frQmRoOuiQC9upQJ
 YrsyZgnwacEkiNSykQCi1T9S/rE+RUrXs3/y3O5y2YsUSe/DVXEgxaJHuUZ1ya5ze9
 iTXQfDZc1wffA==
From: Mark Brown <broonie@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Message-ID: <20201204174135.GC4558@sirena.org.uk>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline
In-Reply-To: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-Cookie: Not a flying toy.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:14 +0100
Cc: Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>
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


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
> All warnings are related only to "wrong indentation", except one:
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
> [error] missing document start "---" (document-start)

It would make life easier (and be more normal practice) to split this up
by driver/subsystem and send a bunch of separate patches to the relevant
maintainers, this makes it much easier to review and handle things.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/KdM4ACgkQJNaLcl1U
h9BGjQf/UZkJEtI4D/7Y6K4QlL3HTskWfvSDmZF26Ea+sD/TdJ91T1YJulT15TOK
sKNLzMI5ERHHR+su1GGx0czMqpipoPYLvlULn6wLpL6fMbOx94cA+dc8Akr/JcjX
EfMthdqAlA+5P1Lz5FivyeWRk/B2YgNQ4+Pa9bbLW4iZogcNL2jZmN55GvBHYlSa
oyLVbN2YlJwy/t9b+c8mvlCGa5NyPDe5JmpplcFkCbn5DVZ9aFTHrGaQ0Ml1rv5W
DyyLnw1kpVUck0Phs49+unaEOb88Mh7FY4Jtsqz6SuqZDkHYZuWCwod5VHJG7q53
cpaFjB5+6e3/mAA/aRnxyzuOxLmoMA==
=82J7
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
