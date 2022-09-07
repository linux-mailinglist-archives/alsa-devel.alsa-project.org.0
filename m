Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D516B5B08DC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 17:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438AD1681;
	Wed,  7 Sep 2022 17:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438AD1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662565387;
	bh=/S/dkwp5ZVEfvkT7cXSM0abXRYV90A8gHsHvynV/bE0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPoeX79HQPDHCcDP5OR2zgAjLvYXUc6uEvA6G8JBIt+2rbxt9qYUxhZGKOuab9TXE
	 NXNL7i8QQjtosm5ok9nK/T8ad/l6MfbxetEJaKaplA3z8fDN46QXaJZdMMV1k1LwSN
	 kTS7rn8MH8GahbstFfb781WO6qd8nsdR4kbf6diA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A57E7F80423;
	Wed,  7 Sep 2022 17:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33855F8028D; Wed,  7 Sep 2022 17:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8351CF8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 17:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8351CF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aPtjXj7L"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 04DF1CE1C42;
 Wed,  7 Sep 2022 15:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055C0C4347C;
 Wed,  7 Sep 2022 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662565311;
 bh=/S/dkwp5ZVEfvkT7cXSM0abXRYV90A8gHsHvynV/bE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPtjXj7LVbgPklwL0BtFQvBJBVKud+/mTLi/X4cto7mqTclBGsTV5WwwKD3WqEfDF
 e/DsY8llF4okC8r2/W0d0lQB6ZbA9lp+7glaGqUGmR+x+AQTRgeYuk08kjCZ1p1sh4
 07dzUdk/zH2pQQi4tpM+2Gq3YIpN+7KLYlHT5GZEiXivxlxzJx7W5GVihL44Jk4/UB
 F8wBZ3dkj3JzlzP++jXMeDpKXRwIP2D0f07e1K0rhORMmh2Afmf/Ern3ep24TrmItB
 WW4zBCxRmcXz9zok5DZGvfLZy5VZWr95emKxduMAtdBwt+Hckdd1u0jmklJAzQdmtA
 k+6k19kHtCyyw==
Date: Wed, 7 Sep 2022 16:41:44 +0100
From: Mark Brown <broonie@kernel.org>
To: luca.ceresoli@bootlin.com
Subject: Re: [PATCH 0/8] Add support for the internal RK3308 audio codec
Message-ID: <Yxi7uD6RKeR3uHcF@sirena.org.uk>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9EHz1xmrlXau4N0B"
Content-Disposition: inline
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
X-Cookie: You have a truly strong individuality.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
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


--9EHz1xmrlXau4N0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 07, 2022 at 04:21:16PM +0200, luca.ceresoli@bootlin.com wrote:

> Luca Ceresoli (8):
>   ASoC: rockchip: rk3308: add internal audio codec bindings
>   ASoC: rockchip: rk3308: add audio card bindings
>   arm64: dts: rockchip: add i2s_8ch_2 and i2s_8ch_3
>   arm64: dts: rockchip: add the internal audio codec
>   ASoC: rockchip: i2s-tdm: Fix clk_id usage in .set_sysclk()
>   ASoC: audio-graph: let dai_link->init be overridable
>   ASoC: codecs: Add RK3308 internal audio codec driver
>   ASoC: rockchip: add new RK3308 sound card

Please pay attention to the ordering of your serieses when posting:
generally any bug fixes should come first so that they can be easily
sent as fixes, and normally DTS updates are at the very end of the
series rather than mixed in the middle since they go via the platform
maintainer tree normally rather than with everything else.

--9EHz1xmrlXau4N0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMYu7cACgkQJNaLcl1U
h9CKzAf8DdI+J5miR4E6cIrTXKZoGqR7qZhfHqflFl1gH1Y4ikj9fbdxe4vhlxEz
nUlD7rd8x8u/c8l0lkObG4gKpZ3VMuT6Pvr5cxCHzlGyCgKb3NEMme5JhSuV8TCW
qchsRF+ZGTXUcPqBN5ey6fl2KAboGemFxyuDLWaVD9CVsKDpoMtyOsgE8PC7sTRO
Vdqkl33gsJZP8XRlRomBFUpC/ziINrHXBW+hBoyQBNBLJxdUT7OM7WXVsxJaJsJf
o+lK+dLy4RD8Pnbt28qgvhMDFxNKCSGX6B0iI8lgMls3j/ZJme3+MnrNA9DwDTjM
wKQ4TTmanyrMK0yzQd4uThtlEm/FfA==
=rYHs
-----END PGP SIGNATURE-----

--9EHz1xmrlXau4N0B--
