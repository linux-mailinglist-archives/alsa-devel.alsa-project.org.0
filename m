Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03974F0E4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E1CE9F;
	Tue, 11 Jul 2023 15:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E1CE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083929;
	bh=CpTuLljbdaBkyoyitx9Zt2kT2mpNPwthrmEzA4FZh0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TXREaOFDR76NSUQXf+bZpHRbX2rLqBS78ZWlKO9OYpdSgQsi2fKJO6f/xL8i9V0Gm
	 BakAhj0eCOIBehigCajug/mNvrDxieinoyouoJ9rWLnAShIiuVCtmFyJEN0URMJ54j
	 n49TQKO3058Z20U48OMSAMshJqi3Ebifs0xQsTFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88077F80691; Tue, 11 Jul 2023 15:52:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D69F8067D;
	Tue, 11 Jul 2023 15:52:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E27F80249; Mon, 10 Jul 2023 19:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1628CF800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1628CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jH9O9AHy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE93460FE6;
	Mon, 10 Jul 2023 17:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7CBC433C7;
	Mon, 10 Jul 2023 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689009717;
	bh=CpTuLljbdaBkyoyitx9Zt2kT2mpNPwthrmEzA4FZh0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jH9O9AHymoIzZncRhS0boDcQENihuPJ9tiOMacCBW9S1HyXoS4fmk05l3yiGNAo2K
	 KI1hyt+ZX+7NEHBvWCqXjT4yNe/LtAsjRDwPWtbPDyinDXBlqwNxiz4igGDEvFujjT
	 HvuvVf7zfJpIqBT2DHBv4rYYp+mzBEGWoHelZgtBRzC5a9ODbB3jbYPRYOu+MpK8DF
	 3DKPCT3xy2bGoPblEhEFYavUFRlVpmVElN1x+riHF3GGBKfZ16h5m4CDQWCrPt/Kv/
	 vK54neWN9FR7qTjWY6hgaJiuvxPLSkqkKUC983rTnSx7XHJONotnyRARakAtXoacgn
	 BzkLNw5lEztpw==
Date: Mon, 10 Jul 2023 18:21:44 +0100
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
Subject: Re: [PATCH v2 08/15] spi: Clean up headers
Message-ID: <54bb9fe7-fb62-4c2e-ae36-d2c10648ee27@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5h1T0k99Bnkn5Gc"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: OP6B54AKWE4CBYQ5XVXHJ336D3LF5VAJ
X-Message-ID-Hash: OP6B54AKWE4CBYQ5XVXHJ336D3LF5VAJ
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OP6B54AKWE4CBYQ5XVXHJ336D3LF5VAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--w5h1T0k99Bnkn5Gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> There is a few things done:
> - include only the headers we are direct user of
> - when pointer is in use, provide a forward declaration
> - add missing headers
> - group generic headers and subsystem headers
> - sort each group alphabetically

The previous commit was supposed to be sorting things and AFAICT did
so...

> +struct spi_device_id;

Why are we adding this given that there's also an inclusion of
mod_devicetable that you didn't remove?

--w5h1T0k99Bnkn5Gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsPicACgkQJNaLcl1U
h9CPUAf/RRQIrb0PfZnRSA7kc94fTv5rQbNfPboY9/94tcd2SIZjbZezvGfMuSZp
6KHTd2Kkiwzya3J0dExwrNiIzmVrIGl+uWJWbvppEpglEeE0BNrEl1a9mRgzaQUk
Ys7HqCSSbbtJqGSlgQAODJPS7eaPIw1ChR5Wv5B+4AlUGavA+iCrwDK+TD0dFZpQ
ovdLIOvU+8RA2XrWSPmDSi4ywOFt9I70VxOWbR9rbfQcvXLRaJA1FOJa2ZArMhHy
CULubdIfA4BO7mOmyLX63DXgjZqu703oW4W5RFmjc+sa9xmoSdlCYflpgXX/xSqG
VmDSPECCeUQc9NZwlOM4i7+iPwCymQ==
=E/m2
-----END PGP SIGNATURE-----

--w5h1T0k99Bnkn5Gc--
