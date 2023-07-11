Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D974F239
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3163150E;
	Tue, 11 Jul 2023 16:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3163150E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085685;
	bh=HnVEva2jdOLXu3EN/cKYarAoyETVmcXrgG0CY9KCvZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XXq4GdKToqaPMQjQVk60aICKnZxYHP1pRySFCbzyJr6+eUzy+Rr+C1gAEqBeOhywz
	 hIMrFnPtjC5q2+9kTa0cAS1gFleFfcjtMD5OmzqmYitFOpt2Y8pRacWAe5WJVUBo5h
	 RSJamUnHMHTW0g47lKn3KugTMRxdYVSf2KJBM37g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66173F80675; Tue, 11 Jul 2023 16:22:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B72F80567;
	Tue, 11 Jul 2023 16:22:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 484CFF80249; Tue, 11 Jul 2023 15:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 279DAF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 279DAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BO5Sf+xL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5788614A9;
	Tue, 11 Jul 2023 13:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23AC433C8;
	Tue, 11 Jul 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689080732;
	bh=HnVEva2jdOLXu3EN/cKYarAoyETVmcXrgG0CY9KCvZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO5Sf+xL4FaASSNsNdM5EGXByrv4WeTUxRBoPW2QNejIwlELvXTu5gKKqv4hkKhGg
	 oi3ZfR9Shzo5QwnSHTFndf8ZIVkqpTClpssosTOBH6/4HIjVrlXO3KdynsW5+Pg7kp
	 pbkKvKQx6ir3yg7CLJDoLHQzo0ewO66SzIeDifz9SCJzdBAZAn9RpEQzQEGNZHOmt+
	 6tOI/PPlmxZBFom+gGGjOjy+qrSc5cI26iueLs1Gv6DR2sYD26rubxcFZS48+8Dw/G
	 5SSyFU8wEM4MuZLWsQU4tXLcKI+0ehoZc3/OitBA10N/7/7vB38b2KMdMwG1AhcrlN
	 +CUurb7ZrrwoQ==
Date: Tue, 11 Jul 2023 14:05:18 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <e3688ce5-616a-4399-a4e3-c410a09f6a45@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="925w7TTgRoHZtFsT"
Content-Disposition: inline
In-Reply-To: <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
X-Cookie: marriage, n.:
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KL4R5HY6YKYOQ2P53DDOAC7NJMNPXQEI
X-Message-ID-Hash: KL4R5HY6YKYOQ2P53DDOAC7NJMNPXQEI
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:22:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KL4R5HY6YKYOQ2P53DDOAC7NJMNPXQEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--925w7TTgRoHZtFsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 10:28:13AM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/07/23 17:49, Andy Shevchenko ha scritto:

> > +		ms = spi_controller_xfer_timeout(ctlr, xfer);

> I agree on using helpers, but the logic is slightly changing here: yes it is
> unlikely (and also probably useless) to get ms == UINT_MAX, but the helper is
> limiting the maximum timeout value to 500mS, which may not work for some slow
> controllers/devices.

The helper is limiting the *minimum* timeout value to 500ms - it's using
max() not min().  The idea is the other way around, that for a very fast
transfer we don't want to end up with such a short timeout that it false
triggers due to scheduling issues.

--925w7TTgRoHZtFsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStU40ACgkQJNaLcl1U
h9B+yQf+KBYXJ7506wC0Am0zY2LnPrpwi7/uhVWQsN9GzhBVU0RGwam2xuqmpCeo
A3o92lqKSQPkQGllTlnuM3r4jp2qDy1/U/QJJxak+i/i8NjuVxIQQIKtnM/nRQxh
yRpIp6WbVt+HJsdFgPS6j6r/3m1qS4eTbso7/ciwLzdRc2Yxk9SLXFteOErlAEoq
hhR7VxhID4BE72a+1NbyuALEVGjSMYBdpddD//Qa1UsJVw1yK5HuM51CaQd9bTlo
EtrmXMgaG9FB+lQeu2zedT6HTQQH/hOB77luYq4zGm849tw2sfBPIhqVgQtkkutv
4hpXSMiuD+iL32PThXfathhu4xvFiQ==
=l6sR
-----END PGP SIGNATURE-----

--925w7TTgRoHZtFsT--
