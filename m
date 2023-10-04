Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FEB7B86CA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 19:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36295A4E;
	Wed,  4 Oct 2023 19:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36295A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696441341;
	bh=K/tg8/w4CVZM+MMZbqiJI4I0lw8Qwa2sMwfhdev7ubQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pz6DQOYnvKY8cvSS5KLrpAT8D7EApDXz9jG7gWLLgtkkHiaxX297nnW2WUB/pMXjE
	 WVe3H74gmFSWKDXSCsMccFoZ3uKFVwhhHQ+LVnEJ2XZ9rdE2FdFk5seRZMfBeNZL0l
	 pBQKGP5aMLTpg5vTga+eqpHCPwWQ8HgPYH3ptcC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0C3F8047D; Wed,  4 Oct 2023 19:41:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E79B9F80166;
	Wed,  4 Oct 2023 19:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC8DF80130; Wed,  4 Oct 2023 19:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CDCCF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 19:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CDCCF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OeKoTfCe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1C3061635;
	Wed,  4 Oct 2023 17:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D07C433C7;
	Wed,  4 Oct 2023 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696441193;
	bh=K/tg8/w4CVZM+MMZbqiJI4I0lw8Qwa2sMwfhdev7ubQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeKoTfCewQffVeEdL4VkIXNCVSD9d9NunmbLsCQ4KZkE5fGE3EzF5s2CJMEFTkFUR
	 9+Rp0Lnw0r+oc+Gh5cs7EiGtRjCli4Pt6URVlEReTs6A8YRyKnMlwZuVSsvN5yl8ae
	 nXnm9skgJdM3YBXLd0m7/YSlo87hzvKhk8PwH4P4i+Th69UGbjXYVgi82wU+QW8gDS
	 TI0fbqAPstYUmGmbBYwsdfYqwZqe7LynkAtCAyxbEKu53rOqqPRSC9TsSL7q66drdJ
	 IeRPQWuLX595ZGXfia1I+HXaRR8rGBrwp321J0JJdtnGTVTOmuXonAq7ANk6wMljxf
	 w1+um5izaFBhA==
Date: Wed, 4 Oct 2023 18:39:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com, James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ban Tao <fengzheng923@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
Message-ID: <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K1Dh/zQH53UxpeTH"
Content-Disposition: inline
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
X-Cookie: I thought YOU silenced the guard!
Message-ID-Hash: GA55CU7HNYQYQZO2ELO3UPG6LAG55BRA
X-Message-ID-Hash: GA55CU7HNYQYQZO2ELO3UPG6LAG55BRA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GA55CU7HNYQYQZO2ELO3UPG6LAG55BRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--K1Dh/zQH53UxpeTH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 10:58:05AM -0500, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.

This is breaking various builds for me, for example arm64 defconfig:

/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c: In function =E2=
=80=98rockchip_i2s_tdm_probe=E2=80=99:
/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c:1557:17: error: im=
plicit declaration of function =E2=80=98of_match_device=E2=80=99; did you m=
ean =E2=80=98of_match_node=E2=80=99? [-Werror=3Dimplicit-function-declarati=
on]
 1557 |         of_id =3D of_match_device(rockchip_i2s_tdm_match, &pdev->de=
v);
      |                 ^~~~~~~~~~~~~~~
      |                 of_match_node
/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c:1557:15: warning: =
assignment to =E2=80=98const struct of_device_id *=E2=80=99 from =E2=80=98i=
nt=E2=80=99 makes pointer from integer without a cast [-Wint-conversion]
 1557 |         of_id =3D of_match_device(rockchip_i2s_tdm_match, &pdev->de=
v);
      |               ^
/build/stage/linux/sound/soc/tegra/tegra210_amx.c: In function =E2=80=98teg=
ra210_amx_platform_probe=E2=80=99:
/build/stage/linux/sound/soc/tegra/tegra210_amx.c:541:17: error: implicit d=
eclaration of function =E2=80=98of_match_device=E2=80=99; did you mean =E2=
=80=98of_match_node=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  541 |         match =3D of_match_device(tegra210_amx_of_match, dev);
      |                 ^~~~~~~~~~~~~~~
      |                 of_match_node
/build/stage/linux/sound/soc/tegra/tegra210_amx.c:541:15: warning: assignme=
nt to =E2=80=98const struct of_device_id *=E2=80=99 from =E2=80=98int=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
  541 |         match =3D of_match_device(tegra210_amx_of_match, dev);
      |               ^
cc1: some warnings being treated as errors

multi_v7_defconfig is also broken.

--K1Dh/zQH53UxpeTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUdo10ACgkQJNaLcl1U
h9Cx8gf/XCPMEtGS0YkOT48jnbRA+1YlgQJR8uZlu9+gze7VMTlA1QqBf04fiiA9
I6p4yAWbk8inm8rqWm9T75tCz/xi0cZrcoQHPEFGYgneMyXkkoapTGe/PQbR9ZIT
grUfha4+oIa2oZXQjYL1tV3U/hfjGjRG6dPR9n+92qlgwLfwdMUhOy7Nn752+xHF
f6Igs59sXl5kvZTQVUb7Hkt9jfkBRz3QfUWiYcp9bJCblkEv9tWhi1YgLua+fUQY
VjxE2e4zNB+Z2z3A9zlFKhTB/9yBIaRma+Qp3PElEYmsQQry9nRssA/aXS5Jccon
7fWLNWj6wDBzZjKCwf69j2cORg/HHw==
=RFjB
-----END PGP SIGNATURE-----

--K1Dh/zQH53UxpeTH--
