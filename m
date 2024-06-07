Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C59003B6
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 14:35:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9882283B;
	Fri,  7 Jun 2024 14:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9882283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717763755;
	bh=/teq6pyQPk19FfBdsV/Et3PBF7/gto5X/WFNmpijboY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rvDgzIr4iUKO1MxLVnD3CCGDOt2W2RYTf5WNT7jrKMh01CgsFIzVSEYiVoRtEh/6M
	 qm0DbLyAX+1c1HE4mrx125gXI4uhtmuGsDfJPe4/EUu27eGBI41PtYipsBzA3QWeH2
	 roP6Kee8BkXMAqUs2gTch6IJsLADVYj1KRZydEQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92019F80171; Fri,  7 Jun 2024 14:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACD3F804D6;
	Fri,  7 Jun 2024 14:35:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09802F804B2; Fri,  7 Jun 2024 14:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF74EF800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 14:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF74EF800AC
Received: from [213.70.33.226] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFYo5-0002tz-Hd; Fri, 07 Jun 2024 14:34:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Rob Herring <robh@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 3/6] ASoC: rockchip: Remove unused of_gpio.h
Date: Fri, 07 Jun 2024 14:34:54 +0200
Message-ID: <4347516.tdWV9SEqCh@phil>
In-Reply-To: <20240605221446.2624964-4-andriy.shevchenko@linux.intel.com>
References: 
 <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
 <20240605221446.2624964-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: COR7J4BVGYGUFJQKDS7I26WNZTKQBSIH
X-Message-ID-Hash: COR7J4BVGYGUFJQKDS7I26WNZTKQBSIH
X-MailFrom: heiko@sntech.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COR7J4BVGYGUFJQKDS7I26WNZTKQBSIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Mittwoch, 5. Juni 2024, 23:27:26 CEST schrieb Andy Shevchenko:
> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>


