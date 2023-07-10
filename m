Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D4274F0E6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960FEEC8;
	Tue, 11 Jul 2023 15:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960FEEC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083940;
	bh=8daJmCsRggn9xziEjmtzfB/+TEmSHGqfTrQOxt4tg1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RuHAM+CwETMHVzPtvVu4FFwD7gVtjSFsDMcxMW1xhxj6wN0nvtZhMEaiNPU5nQ5k9
	 h0oveDRcqjepejiX/HxQLAo4qmwWByqmfFdQgXa49xwUui+btepp5hUzc9fV++Dppy
	 EDlsuJKW6EudBnAVii0xBYkvMtdKjozQMh0scgkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97709F8068F; Tue, 11 Jul 2023 15:52:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1263F8068F;
	Tue, 11 Jul 2023 15:52:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 858C6F80249; Mon, 10 Jul 2023 19:30:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D346F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D346F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t2qoXUnS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD59A61166;
	Mon, 10 Jul 2023 17:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B727C433C9;
	Mon, 10 Jul 2023 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689010245;
	bh=8daJmCsRggn9xziEjmtzfB/+TEmSHGqfTrQOxt4tg1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2qoXUnSHuV+TbWU69K3xBxeG6UAs5r8JvEuI+8qIwEdTjDJX9HPZn++uZHMNIQaD
	 86g42vDDjo+xgTS9/scrmuWADvN0R48PLgUPQA8lzB5uIE7gczU7YsGie2UjWiD40Y
	 soETF0P1p+D4lt8Jw6O9FNAf5+tzNnhQ6U1GTpxDacTetMTQd4tHQO7p92dxIvPKDo
	 vCacGl+XShxk3g8tnOVtoXP+PJNeX8VjY17MSNUMQyZxhOaFwy902auPvHxrZTYMla
	 iILw2xA2Gbqp0/Iihh6sd5pNaL6Cxsx8tHLlJ00pYbON+m3jOCfuniILkrN7AJJX38
	 Zx5bmFaJNvHKA==
Date: Mon, 10 Jul 2023 18:30:32 +0100
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
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbZ/DrTRficzGRpW"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KEXESAS2OYEG3FBANIKIQWUKHKIHX3CF
X-Message-ID-Hash: KEXESAS2OYEG3FBANIKIQWUKHKIHX3CF
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEXESAS2OYEG3FBANIKIQWUKHKIHX3CF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IbZ/DrTRficzGRpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:

> Since the new spi_controller_xfer_timeout() helper appeared,
> we may replace open coded variant in spi_transfer_wait().

> + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> + *

You didn't mention this bit in the changelog, and I'm not 100% convinced
it was the best idea in the first place.  It's going to result in some
very big timeouts if it goes off, and we really should be doing
validation much earlier in the process.

> +	u32 speed_hz = xfer->speed_hz ?: 100000;

Not only the ternery operator, but the version without the second
argument for extra clarity!

--IbZ/DrTRficzGRpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsQDcACgkQJNaLcl1U
h9DEzgf/dy9EpgGVS5JKG+2sOnEEWzJ1/z92vL5sQoHWJT0M7rzfGdRlGddYvj2k
yOJg6fvzzY2vbGoYuqkSlYi95WyUFmwqjd+BwayzJ5gH0xKRXo4MwCHKIET3z44z
8pD55r1ow40GOeztLTsLwgiADUQSMRLm/Y33rrf2I1J+/AgrEV6V+oZnbWsmoI+I
0QS2ZIQk8m1oDghyOmEOzW+jqJQbDR6HAP0L9dUbd/zcJK9LDXHE5hepkLjQbC6v
oGrJJVbs+IYFbaNJrDNtxtF3JwlAtVWWSten66FG3fmreSDQwcKATVKiHWtLlhJb
a/T8TlFW3ianwYVf2yMOEojOIbZvQw==
=d1Us
-----END PGP SIGNATURE-----

--IbZ/DrTRficzGRpW--
