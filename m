Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542274F20E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A741E95;
	Tue, 11 Jul 2023 16:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A741E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085446;
	bh=2+yn6FDwMd8voKMx1WPt05JiOyMTQxbLsZaEtvbtNN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TtGSwjmlRzwYdJHReHUYkbBPLwsK6QW5sIbDuRd2/UXb2K7lV2k44IGK/4j7SyQJO
	 OAsR7RMB2jh+lzKYQqM3heIK6DCmd/k2PiYk/obUHKYIl7I51cIhifnkTApJVz0mQ0
	 mINrV4ACC/kAxLi1cTcCdd1UeSNYjSRvw50SHgmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00AF5F805B0; Tue, 11 Jul 2023 16:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76289F805B0;
	Tue, 11 Jul 2023 16:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 132F2F80249; Tue, 11 Jul 2023 10:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF09BF80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 10:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF09BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Fx8WIExU
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6971C660700A;
	Tue, 11 Jul 2023 09:12:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689063180;
	bh=2+yn6FDwMd8voKMx1WPt05JiOyMTQxbLsZaEtvbtNN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fx8WIExUEuJPaY5MFu8knfLP/k0C26AMfNb/AvH/Fmm0WSmwyzjbdouviC0vRIt5c
	 MKvJLE8w0cLrlZEwxmbFWfOjjLGUQZgFi0o1pLWqgdMYxBGlFBGIjiNaupLZ6FnB33
	 j1HPiXlommzYaYv6ce4cvKcTdjN1ewdnVTlkRjRRehst4X7XEwQxnR9ySh21JtPk6b
	 7KLhT/OtiV9F5v6WVi5j7pxhtZflk0tkK/vKZu9Q314nRK+CtbZPcevQ7M0A64UCcq
	 2GUJjcluoW7Hk+VgSk0dx0uk8kgwhRiKCYyXOMoe3dlhEE5DcTiXTswvygvLYV31mr
	 rt/T478FT4VDw==
Message-ID: <f0b9e2e4-b2c0-4336-0ec4-5afd9f1b6c72@collabora.com>
Date: Tue, 11 Jul 2023 10:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/15] spi: Remove unneeded OF node NULL checks
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-2-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710154932.68377-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: QQUYP23YO7463YDRBHJHPO2STAEISI2O
X-Message-ID-Hash: QQUYP23YO7463YDRBHJHPO2STAEISI2O
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQUYP23YO7463YDRBHJHPO2STAEISI2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 10/07/23 17:49, Andy Shevchenko ha scritto:
> In the couple of places the NULL check of OF node is implied by the call
> that takes it as a parameter. Drop the respective duplicate checks.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Validated against spi-mt65xx, spi-mt7621, spi-mtk-nor, spi-mtk-snfi;

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # 
MediaTek

> ---
>   drivers/spi/spi.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 9291b2a0e887..8f3282a71c63 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2399,9 +2399,6 @@ static void of_register_spi_devices(struct spi_controller *ctlr)
>   	struct spi_device *spi;
>   	struct device_node *nc;
>   
> -	if (!ctlr->dev.of_node)
> -		return;
> -
>   	for_each_available_child_of_node(ctlr->dev.of_node, nc) {
>   		if (of_node_test_and_set_flag(nc, OF_POPULATED))
>   			continue;
> @@ -3134,7 +3131,7 @@ int spi_register_controller(struct spi_controller *ctlr)
>   		if (WARN(id < 0, "couldn't get idr"))
>   			return id == -ENOSPC ? -EBUSY : id;
>   		ctlr->bus_num = id;
> -	} else if (ctlr->dev.of_node) {
> +	} else {
>   		/* Allocate dynamic bus number using Linux idr */
>   		id = of_alias_get_id(ctlr->dev.of_node, "spi");
>   		if (id >= 0) {



