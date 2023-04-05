Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169B6D99A8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A314CEB9;
	Thu,  6 Apr 2023 16:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A314CEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791417;
	bh=VGCNd0RxfuApSxdfr8G6UmKCW7vb2ezwSiZmPSFP0Jc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IhW+w42YtT8c1QUH4pozGBnRBoGCA8Pmv9VKOlcCQ0Rp0+i+rlVxgwVMia/3A23i7
	 zH6rJIbjboBSKm8OTBES8y3Ty8x5kH00sqG2QTHl86lgA5gDNnwpXZVwqJd++t0/8d
	 j61dv5wMIn51A25bZ5tWFjGxTlegfz/2yDibebcY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A81FF805B2;
	Thu,  6 Apr 2023 16:26:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FB76F8024C; Wed,  5 Apr 2023 18:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBB6FF80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 18:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB6FF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=lechnology.com header.i=@lechnology.com
 header.a=rsa-sha256 header.s=default header.b=PlcvWllV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PEOSsUi8JIMvoW7QnnkpkkJijxo4IUuMnZ9vv3EjUhQ=; b=PlcvWllVCZZLIxn7TA0uYZOD2i
	8Timk2idYv+lLO3yZJhWhHPsl92ZREHTEkcZ2uj1e53hz36DkB/efojzcWFV0Na8cR9Qj+10qLhOH
	ta3+36sHegS1o46TQyP99X9cQQUBT/Z1QMqvJ9krER9Ob1/RWq++SuzdzpDHI3Xhy5MHfqna5eIZw
	+3KCwr3As0xZzcRdS0d74nyj+RIivO7MbcvRaGz8ll694eT/OgE8InMgGs8kJwhgkR/6hUQpNlGNz
	Za3hBrO3EltLq0JnttfLThWdO07VZ32OqVzWbWH2mgZNY1LmC2nLtlkLnHo1jx4ghOCQVGFpuJj4L
	hqCUbhxg==;
Received: from ip98-183-112-29.ok.ok.cox.net ([98.183.112.29]:48320
 helo=[192.168.0.134])
	by vern.gendns.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <david@lechnology.com>)
	id 1pk5gX-00020w-28;
	Wed, 05 Apr 2023 12:08:34 -0400
Message-ID: <9d163cc7-d7ee-55e8-c01d-a1d4b3b19877@lechnology.com>
Date: Wed, 5 Apr 2023 11:07:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 54/65] clk: da8xx: clk48: Switch to determine_rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
 <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
 <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
From: David Lechner <david@lechnology.com>
In-Reply-To: <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MailFrom: david@lechnology.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: JZ5S3ISPXQLDPFYE6DRGFPDMXL4WTXA7
X-Message-ID-Hash: JZ5S3ISPXQLDPFYE6DRGFPDMXL4WTXA7
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:27 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZ5S3ISPXQLDPFYE6DRGFPDMXL4WTXA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/5/23 10:22 AM, Maxime Ripard wrote:
> Hi David,
> 
> On Wed, Apr 05, 2023 at 10:03:24AM -0500, David Lechner wrote:
>> On 4/4/23 5:11 AM, Maxime Ripard wrote:
>>> The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
>>> hook, but doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>
>> As mentioned in my previous review, parent is selected by device
>> tree and should never be changed after init.
> 
> Great minds think alike then, because the driver implements exactly
> that, either before or after that patch.
> 
> That patch makes the current behaviour explicit but doesn't change it in
> any way.
> 
> So I guess that means that I can add your Acked-by on the three patches
> you reviewed with the same message?
> 
> Maxime

Yes, preferably with a simplified commit message.

Acked-by: David Lechner <david@lechnology.com>

