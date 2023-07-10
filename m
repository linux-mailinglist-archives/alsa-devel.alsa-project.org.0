Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20874F0DE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE06BEDB;
	Tue, 11 Jul 2023 15:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE06BEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083889;
	bh=nKZycr1bbDIhX+7r/umilV/wuLHcsLLg8WWLjNqfVGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KuL0kF9Y2ZMffwFkzArK9M/fMbD4i2O98RbRSTi3xf6el+w8ygnnkXWo4WksvKrXV
	 QlBz5/yqBHLX2H/DVOpnYuHSC0KpfgOw0L6GskkVZjaVUlKNFE6c1VQ1jEGxi62nmE
	 0opuix2OCn9CU76ZOzqOQIM9dHsUX9I5ApCVTyxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0D8F80563; Tue, 11 Jul 2023 15:52:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E50F80677;
	Tue, 11 Jul 2023 15:52:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E300F80249; Mon, 10 Jul 2023 19:09:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 91BF1F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91BF1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ks7RL3h4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC4FC61133;
	Mon, 10 Jul 2023 17:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822D8C433C9;
	Mon, 10 Jul 2023 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689008956;
	bh=nKZycr1bbDIhX+7r/umilV/wuLHcsLLg8WWLjNqfVGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ks7RL3h40J9Gsg6+T5tGMhXUPebOkMtv2HYbINZYkE0HBcDFe3InO0uHvSLO6Ywfd
	 z9dbScYbXDyBfN0KKzvhwsevIOZI2Wa4nTPSPcqSdIk9dVy3t4CwrMIhESNVB8EcTq
	 DHcqHiLwexT4fjkOSD7WRFfWxwr4oLox+CN38zoYAqwcwq7DLt0YYhvaSCGjOeZdC6
	 /OMp7mPT/0W9iS9bRuPwjhjEgn3ZN4a3GPUVex+MO83a5hpzqpvTmLwha1tCaAJG7B
	 IOQDzu3lMvKgzC08AKXIF8wSz30WvJ3WDseHtgBrUd0ZFYjZe2rdpVVbiRnkMjF1jV
	 sbYhTW/HyF8mg==
Date: Mon, 10 Jul 2023 18:09:00 +0100
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
Subject: Re: [PATCH v2 02/15] spi: Drop duplicate IDR allocation code in
 spi_register_controller()
Message-ID: <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugTz/0iIbXaMesMQ"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: J6VI2IW6MH67Z3GDC5B6GM64EG5S56QE
X-Message-ID-Hash: J6VI2IW6MH67Z3GDC5B6GM64EG5S56QE
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6VI2IW6MH67Z3GDC5B6GM64EG5S56QE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ugTz/0iIbXaMesMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:19PM +0300, Andy Shevchenko wrote:

> Refactor spi_register_controller() to drop duplicate IDR allocation.
> Instead of if-else-if branching use two sequential if:s, which allows
> to re-use the logic of IDR allocation in all cases.

For legibility this should have been split into a separate factoring out
of the shared code and rewriting of the logic, that'd make it trivial to
review.

> -		mutex_lock(&board_lock);
> -		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
> -			       0, GFP_KERNEL);
> -		mutex_unlock(&board_lock);
> -		if (WARN(id < 0, "couldn't get idr"))
> -			return id;
> -		ctlr->bus_num = id;
> +		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
> +		if (status)
> +			return status;

The original does not do the remapping of return codes that the previous
two copies do...

--ugTz/0iIbXaMesMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsOysACgkQJNaLcl1U
h9Bj2wf/eujSGQes7B4PBTQ3n1oBhkcL7Y24XQnkT5q6FXhb+PNy2gOUL7X4u8/s
jewRdgc+ViUGaokkDON2TN26dLdi/+KEGq7rPGhgLMeyGSqKJx5uRaCQSSdKa2Y2
w1zSdEXhWd9SZsgsLa18k9bVMBbmyuylLjQYrLlHktiuD4/baW1HQ5SqKICkb1Bg
/ZdcRGqcKDfgJWnVfK4loF7rFNMRBY0rXsSdOVE3yOKeZE2uS46s2BPPN+xc7UaA
KTSUu8JjCacwP+V70yrm4VGRb5/c0NJ++iO44yiykKNRvcJWCDemwAYhj9zV1ja/
5l/fUqxd3+5Kv3hbc1rSnyAywM7/4g==
=1GBL
-----END PGP SIGNATURE-----

--ugTz/0iIbXaMesMQ--
