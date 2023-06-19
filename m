Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1473577E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 15:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F338E847;
	Mon, 19 Jun 2023 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F338E847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687179623;
	bh=BE7zrrhwdV62S4wECk+9BF3qkdGG9aI+E9aST58zOC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kT3Yz6lzX1FFU2KI/g7J4G8tWgh3TmB6T6JTKv6ZZ1srpzAZkpnspdiI9RzTEOMq2
	 wg63cB0CmhI98yTkfVMU4wzle75JbnKDGzIszFtUCuoav5r6IgwbK+5iifs4MYADMF
	 d+qF+53byNU5X/LPBaMdfgY83sV8U10eyW412Cpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F43EF80533; Mon, 19 Jun 2023 14:59:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3199CF80130;
	Mon, 19 Jun 2023 14:59:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE5CF80217; Mon, 19 Jun 2023 14:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EA40F800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 14:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EA40F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JpXoBaZn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 978B460B4B;
	Mon, 19 Jun 2023 12:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98824C433C9;
	Mon, 19 Jun 2023 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687179564;
	bh=BE7zrrhwdV62S4wECk+9BF3qkdGG9aI+E9aST58zOC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpXoBaZnFzFtxSZc/k+5cSfcYJ0fnTgkaQ8WhJmBPz9ubmvZqg8Av3w4e5tL///Mn
	 Uz7zGL6HlJSbgDiDTYka7gv+wx92+KwKvtpwKLFfjjYOB6IgX9erpbfpyL6W+D/C2d
	 1MnoH9mUZKsrMplxxMCqmL9bIDMbMXZW4k1ffYHsJs+iDTBquKSpy7VALeNGxg2xuJ
	 1KzHIdiWGR9XDtc0W9aeMD7zJBjmOiNYBkKXAJNR98CRd435uMw9721xySmMblAEPl
	 biUkFtls75SzDNYTofnySasOFkyNqXNj6lJUW/XeaDgDd6vUrFpJaamAE0qElAoR3n
	 1ZaybCHhCvlPQ==
Date: Mon, 19 Jun 2023 13:59:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/8] ASoC: soc-core.c: add index on
 snd_soc_of_get_dai_name()
Message-ID: <ca1a7c35-2f31-4cd3-90c1-807114add488@sirena.org.uk>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
 <87jzw6hp5c.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1PRlEKCH4D+85jt"
Content-Disposition: inline
In-Reply-To: <87jzw6hp5c.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Yow!  I want my nose in lights!
Message-ID-Hash: 3M73Z6FR5IOXFWNOJNVZMAXGOXDIHSOH
X-Message-ID-Hash: 3M73Z6FR5IOXFWNOJNVZMAXGOXDIHSOH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3M73Z6FR5IOXFWNOJNVZMAXGOXDIHSOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--q1PRlEKCH4D+85jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 12:18:55AM +0000, Kuninori Morimoto wrote:
> Current snd_soc_of_get_dai_name() doesn't accept index
> for #sound-dai-cells. It is not useful for user.
> This patch adds it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h                       | 2 +-
>  sound/soc/fsl/imx-card.c                  | 2 +-
>  sound/soc/generic/simple-card.c           | 2 +-
>  sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
>  sound/soc/qcom/common.c                   | 2 +-
>  sound/soc/soc-core.c                      | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)

This series all looks good but unfortunately the recently added Longsoon
driver added a new user of snd_soc_of_get_dai_name() - could you rebase
against for-6.5 to take account of the new driver please?

--q1PRlEKCH4D+85jt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSQUSQACgkQJNaLcl1U
h9Bj9gf+OQq8fS9+JvWJ3Lfd7JUJ7YrjSpd8m+WBmJb3DlEjb93kF48PtF+AizJB
eM3FW+1kQlQyTJvM7L9K8VSzJbk10OhBZEqNYxaBEWXUptYzv4XVcDsXyJw3yD2j
F0m4sS4U3+08SMnKYWfB3lfsxpJkMx37Pa5rp1cTkrQv/ocK1OFXUGYP1AYTw/8r
hrUeT5BOYyH3acMlYlyw6MrqCOOvWdCi3kxjIPponRbb1abNW/TwaQ6uqjYmRo1c
/bjTfZCgQPJE+S0K23103OpzZi6qoKNJWIrUGVQup5ZCRu8Y4HitwyfxxsaFFgQP
48btAm+KILHe54y37t+4lJmnkV3dHg==
=hBWz
-----END PGP SIGNATURE-----

--q1PRlEKCH4D+85jt--
