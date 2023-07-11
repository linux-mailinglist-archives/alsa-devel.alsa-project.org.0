Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB974F23F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02AEE8F;
	Tue, 11 Jul 2023 16:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02AEE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085717;
	bh=ItxG0MufVqKsV6l67e6rahqYiXE+oNZWIixR/ZiAk7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YW5YJdJwtc3Chdt85pzQMk3VYCEv9PKtlH/tsD+D5V7Hm0LyGf9BwFn/6cZA2oDG6
	 cedmb9SfM2gmvfeFuE5Vgd/yIYXCai2A0Z5AiSkCU4CB212FVaZgql7e4EhIFu0fQ2
	 X2l/G2tTCSd7qEiIsbCidKUXbIv8zidpIb2pw3g4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6CADF8068E; Tue, 11 Jul 2023 16:22:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3173F8068A;
	Tue, 11 Jul 2023 16:22:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6CFBF8024E; Tue, 11 Jul 2023 15:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99F04F800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F04F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m4h5A9eu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9ED1C614F1;
	Tue, 11 Jul 2023 13:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C419BC433C7;
	Tue, 11 Jul 2023 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689082738;
	bh=ItxG0MufVqKsV6l67e6rahqYiXE+oNZWIixR/ZiAk7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4h5A9eucXGEK5wiqhxNlBc101UZTB1GTSu+bNPFIqQi8lSIpgckIDopdxZ8GCXDU
	 KaYIqfFehq9XBY9C78BmSRuGAnEkoiVqck1jWN3OSijvCTDKQiEiACW+JrNNDrogva
	 3EVk5wIoKUlrmASobQlDeI0AXZVsTEb3Co/GLkxVP16Cs59Esgav2MUFclqw4fiLZW
	 IphOe5HIOtsn51q81shBdkY7+ZB7u0D1/Dnzv8i5DLtWFLx045byoaUqXj3YMCZRgP
	 Ssnb20dZBFAw4KBSQvZFSG4aJSBBBsmLSdXDHDge2m5HFHwVmkPwFjrJUGV9EZW521
	 Yi9ajN7auQ10g==
Date: Tue, 11 Jul 2023 14:38:37 +0100
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
Message-ID: <af598782-6998-4d60-b7fc-3d9aaeb0fe8f@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <58c6f76a-8028-4ce8-a101-d5feb3b40897@sirena.org.uk>
 <ZK04/8UQEaNinLoK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fpte6ZPjzz/LFITf"
Content-Disposition: inline
In-Reply-To: <ZK04/8UQEaNinLoK@smile.fi.intel.com>
X-Cookie: marriage, n.:
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: OM5B2KOW4KJ6V3TQSQKT5WT6ENVXQXXF
X-Message-ID-Hash: OM5B2KOW4KJ6V3TQSQKT5WT6ENVXQXXF
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:22:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OM5B2KOW4KJ6V3TQSQKT5WT6ENVXQXXF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Fpte6ZPjzz/LFITf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 02:11:59PM +0300, Andy Shevchenko wrote:

> Do you think patch 9 deserves to be proceeded?

That one I need to think about, may as well resend it and I can think
about the resend.

--Fpte6ZPjzz/LFITf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStW1wACgkQJNaLcl1U
h9DwCgf6A57WeIs5A+kjDx2nQTR4R6O8VfCeSUxA5+sJLtnTgMShxvODRTArEDJp
mTB75kAcKQxMw/qNGyDzWRgUYTymPxp24jfu8cWXoEU6FoM1u7fdVIEs/3zF4VI8
tcXZks8p77A/Xye4dlq/LB2IhJ3CctS47Q6Y+Yr6aACWkOGboS87FDNBeE+4cxcS
nF4f4M2/d0j85zTf5tfGFaY52gS5Nf9G4MQ8/haFpUaUj2seOk+JpKeF+jqpWc+b
fjJfrUWG8bC5u8ZfCBniq+wFRLCP6qCskkygh44lrP9yQTKxdUIRoNkcMT2kdz1H
NguDaiHKGw9X8e6bahJyFd+NyGugwg==
=B9iG
-----END PGP SIGNATURE-----

--Fpte6ZPjzz/LFITf--
