Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF574F0E7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D980EE3;
	Tue, 11 Jul 2023 15:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D980EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083962;
	bh=yBEMuGoWHM9zUe+iAIatKlGNoEB//1WfSxUw+0SuQ6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pNKZCRXCn7MqK0vkTt8eaErYjOvtUj2jBcbkjwtMQQx0f4bCjiu7VVoc/Rhlio4jn
	 2NAprpdD5RVvVugow6iT+PotLs8eR3MnR7FK0zPmpVxLEfIo/4p6axMAMx74z5dw+n
	 38XS+VdCdFHgN8vujtBfKPKaF+4jTSbhjLn282tY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9139F8027B; Tue, 11 Jul 2023 15:54:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC18F8027B;
	Tue, 11 Jul 2023 15:54:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 199B8F80249; Mon, 10 Jul 2023 19:31:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 99400F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99400F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VttBOl+e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88CE460FBB;
	Mon, 10 Jul 2023 17:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DD5C433C7;
	Mon, 10 Jul 2023 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689010285;
	bh=yBEMuGoWHM9zUe+iAIatKlGNoEB//1WfSxUw+0SuQ6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VttBOl+eNlj1/cgq3G8qxJc+Ah7b5ZQ04PTV+EG6CFR2pRgYe6JyXMHkH1/K5bemV
	 K7OqUHz9qrkCqPetZgj1nNcc9MMYdr/B9tGDE8jYkIXmiDAP6OS06Xl3q0kgh5hEpC
	 MvMnLChy3z1cQdkugx0ULecDib0F8BZscQJjcD6lCQGmAOZWkJumwmB1iP89ewG1mK
	 rAm6IHAnieSj0S2DZ5vLDOR0ISwF5BNq2Bv8GkENsnzbMGMTAKoGpz+DIGvt6qDstD
	 H+akvWxjFGPRQ19Fycx48iyLC1xdJ/ddnyN9qoFnjn+84u3R5jM1KfNYx9ZqQrj7XX
	 kUC1BkFYkCtCQ==
Date: Mon, 10 Jul 2023 18:31:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 00/15] spi: Header and core clean up and refactoring
Message-ID: <58c6f76a-8028-4ce8-a101-d5feb3b40897@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mtt0ZQ3K6jQ9xKnG"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LMIDA3AYOYFOLMK7KNSUQQZ2FRTE2EYI
X-Message-ID-Hash: LMIDA3AYOYFOLMK7KNSUQQZ2FRTE2EYI
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:54:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMIDA3AYOYFOLMK7KNSUQQZ2FRTE2EYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Mtt0ZQ3K6jQ9xKnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:17PM +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series. It also touches drivers under SPI subsystem
> folder on the pure renaming purposes of some constants.

I've queued 1-3, 6-8 and 11- for CI thanks.

--Mtt0ZQ3K6jQ9xKnG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsQF8ACgkQJNaLcl1U
h9CQ2gf+NebuHlkBa9zrhzmcGhSrtVx5yFCLP0dHaZVPMEHj6t0rIpQGodx2xOq0
MawEB/JvvnMHpCvUoGGUXGsTcLiBB3uxADywJKyPkitWM3W/9LMAGRwpdnyV/zbN
i4RuTGjLyFnoHuDdf82cL/5f3EFsLn1J3rl3cUDAv1c3U+WpZReA4OO9s9QhlqJU
GfQoV1As2DUX49504bC2EfuPpa4wYIWrR1fT8ApGCZXs3KUQpgTWQ7iH4X48fdbY
5gE1rQID66FMT2d78FRZkVmqej6wFqYr34G0zD2Lf/qC+ZsTSvvy4YExJhNnts1Q
Md56GS1p2fjwWtBGCvs3Gmlg6zcmtQ==
=CQab
-----END PGP SIGNATURE-----

--Mtt0ZQ3K6jQ9xKnG--
