Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93874F0DD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BF9E12;
	Tue, 11 Jul 2023 15:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BF9E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083878;
	bh=IIro+PYudoCpsNeH2Llkq/gmEiqeLq8TswCPO5UnD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MFU8Tn5y4r3e9N0JByNMF8+BPDUhrla3+89MPJf3Pk3OcyKsSi7rtUFvdHyxrPmQS
	 6kzZjyg3pvtElMuHFUtBT22mmgyFPQ6kFQiDuK+WBP/5cwAO98hm3tKxBUZHzXotpt
	 RYoRSlwTF1E2hSbFX0cMtIJkq89on5wvASARED+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADC5BF8065C; Tue, 11 Jul 2023 15:52:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A8DF8065D;
	Tue, 11 Jul 2023 15:52:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 123FDF80249; Mon, 10 Jul 2023 18:57:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A785F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 18:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A785F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p7yUWoNb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4835D6102A;
	Mon, 10 Jul 2023 16:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013E7C433C8;
	Mon, 10 Jul 2023 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689008234;
	bh=IIro+PYudoCpsNeH2Llkq/gmEiqeLq8TswCPO5UnD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7yUWoNb8JNe5qIMp13em9m8Rzsc1ghhta/kWFSe5/qi4pD5l1Kdd3nTIbhSAnB41
	 W8C1J2axQqESm/vo5JFAn+FCzJ9O92y9klVgFoPPFBocvgHANqPMFGPKWSy1cah2AJ
	 6B66a+6OSbM4vJnoAPeTpJQU1ZveA0PYXoTV6fut7sflD58+Jtel0GfBpq6p2nXiCt
	 M0xsvZQxCC0EolQkXizKejaZaayP6VSNsobrYWwUH758W9Nr9zRBh1oYMDG5FsShL0
	 zQI22BV9Iz/Ww1LFbCTyWKHKLILGMYlknCcvjk0BqOW9V/aTLFc+59pabBeheGKNwr
	 5euI/OtpKjArA==
Date: Mon, 10 Jul 2023 17:56:59 +0100
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
Subject: Re: [PATCH v2 03/15] spi: Replace if-else-if by bitops and
 multiplications
Message-ID: <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fI+fdz2D5/EEE42m"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: S4345KADOQDUKT27A7IUFKLPVBETP2WS
X-Message-ID-Hash: S4345KADOQDUKT27A7IUFKLPVBETP2WS
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4345KADOQDUKT27A7IUFKLPVBETP2WS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fI+fdz2D5/EEE42m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:20PM +0300, Andy Shevchenko wrote:

> -		if (xfer->bits_per_word <= 8)
> -			maxsize = maxwords;
> -		else if (xfer->bits_per_word <= 16)
> -			maxsize = 2 * maxwords;
> -		else
> -			maxsize = 4 * maxwords;
> -
> +		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));

This will change the behaviour if bits_per_word is more than 32.  That
is validated out elsewhere but I shouldn't have had to go around
checking the code to confirm that this is the case.  This is the sort of
thing that should be highlighted when doing this sort of edge case
stylistic change.

--fI+fdz2D5/EEE42m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsOFsACgkQJNaLcl1U
h9A2Ywf+KXUPki4n4OHbYfUF8KSXIYSkZGLAugrUbcI1dW/wY8+0fLYP8+4w9V+j
f81LA7/NDs1aRdnIEAvy6JRWhsUGKyHHKw42xpXD6MqtamipzOaVSYaL2Hr3ZuqC
22p4KuNl0BAuHc+iyOWLpX7/btG8mweyZNWYjDbaB3duv4usx8Pis5kQu9HrTvfw
e1repiQ4pqd5PGfhReO1fGbR6QIhoswiEm/9yfkZTQs1HAIOpRAePL2XPZD3sBuj
pehvlOvP2yRq1fOxYVWGxXH8dhavS5t/mUlzyTYI7VxMD2HUZD1EiZ2uYcmntUEl
y8tiLDQIFQRb++F+IFf0SjU+vXe0UQ==
=tuUl
-----END PGP SIGNATURE-----

--fI+fdz2D5/EEE42m--
