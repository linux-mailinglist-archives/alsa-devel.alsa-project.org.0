Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF686F2EDD
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C501816;
	Mon,  1 May 2023 08:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C501816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923595;
	bh=4MuGyWTQQD8YDc9ZDP5EuTvCXfhs1RGXEGefTe8GbFs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UOG0k5/jH34aq7ccogm/wS744bkTJnenbkkd51K1mpSK+hVUcWJ8bF1zqgDR14qyv
	 Tu1mKWQvFLHnpMd18hqyaghQHUj2A9gywITBCnq/ufnRd5u5ao/EQXWtgaX3HL5okC
	 6t5Wwa6tN1+VIutCzVuWJknvRBeefGX4JtccG1bE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27DBEF80114;
	Mon,  1 May 2023 08:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79175F8025E; Thu, 27 Apr 2023 21:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B0DF80104
	for <alsa-devel@alsa-project.org>; Thu, 27 Apr 2023 21:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B0DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OEyoAdAg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65910637E8;
	Thu, 27 Apr 2023 19:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAF8C433EF;
	Thu, 27 Apr 2023 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682622594;
	bh=4MuGyWTQQD8YDc9ZDP5EuTvCXfhs1RGXEGefTe8GbFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEyoAdAg2oHj1kpUaFAUQnORGNgUcMTwXna94WirWc4/7OFURAmKcVKLlVxGAFkME
	 toxsg2t0o0U7Q+9nKKAWfOe1B/t1z3g1kRabot2L3KU7VvngL293h0JsGHTQ534ZJP
	 wb/t5pQP0ryuyOaWJAQ0Akswuclq647TVGmt1KHHbj8adW21pY6mXqBy4ogxoG3XiT
	 nl8v4DuX6FhDVh3IAmmeTltphT6HmwSaAdaxUAAee3iYvoH2HR36H28EF1sUk2sy35
	 kac9ZjDMYlfFNHS8ZZYJ4TPcDUlbU3BEvZYy9X6SsaJklf3YKOr0nvFwrR0eNy/XBZ
	 ccVK16xunjKbA==
Message-ID: <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
Date: Thu, 27 Apr 2023 14:09:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 29/65] clk: socfpga: gate: Add a determine_rate hook
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-29-9a1358472d52@cerno.tech>
 <679921ee-98d4-d6ef-5934-e009fd4b31fc@kernel.org>
 <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: dinguyen@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2LLU2JS3YLP3QU7CORJEXDTOQFEYXOHS
X-Message-ID-Hash: 2LLU2JS3YLP3QU7CORJEXDTOQFEYXOHS
X-Mailman-Approved-At: Mon, 01 May 2023 06:41:14 +0000
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LLU2JS3YLP3QU7CORJEXDTOQFEYXOHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Maxime,

On 4/25/23 09:48, Maxime Ripard wrote:
> Hi Dinh,
> 
> On Mon, Apr 24, 2023 at 01:32:28PM -0500, Dinh Nguyen wrote:
>> On 4/4/23 05:11, Maxime Ripard wrote:
>>> The SoCFGPA gate clock implements a mux with a set_parent hook, but
>>> doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>> The other trigger would be a call to clk_set_parent(), but it's far less
>>> used, and it doesn't look like there's any obvious user for that clock.
>>>
>>> So, the set_parent hook is effectively unused, possibly because of an
>>> oversight. However, it could also be an explicit decision by the
>>> original author to avoid any reparenting but through an explicit call to
>>> clk_set_parent().
>>>
>>> The latter case would be equivalent to setting the flag
>>> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
>>> to __clk_mux_determine_rate(). Indeed, if no determine_rate
>>> implementation is provided, clk_round_rate() (through
>>> clk_core_round_rate_nolock()) will call itself on the parent if
>>> CLK_SET_RATE_PARENT is set, and will not change the clock rate
>>> otherwise. __clk_mux_determine_rate() has the exact same behavior when
>>> CLK_SET_RATE_NO_REPARENT is set.
>>>
>>> And if it was an oversight, then we are at least explicit about our
>>> behavior now and it can be further refined down the line.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>    drivers/clk/socfpga/clk-gate.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
>>> index 32ccda960f28..cbba8462a09e 100644
>>> --- a/drivers/clk/socfpga/clk-gate.c
>>> +++ b/drivers/clk/socfpga/clk-gate.c
>>> @@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
>>>    static struct clk_ops gateclk_ops = {
>>>    	.recalc_rate = socfpga_clk_recalc_rate,
>>> +	.determine_rate = __clk_mux_determine_rate,
>>>    	.get_parent = socfpga_clk_get_parent,
>>>    	.set_parent = socfpga_clk_set_parent,
>>>    };
>>> @@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device_node *node)
>>>    	init.name = clk_name;
>>>    	init.ops = ops;
>>> -	init.flags = 0;
>>> +	init.flags = CLK_SET_RATE_NO_REPARENT;
>>>    	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
>>>    	if (init.num_parents < 2) {
>>>
>>
>> This patch broke SoCFPGA boot serial port. The characters are mangled.
> 
> Do you have any other access to that board? If so, could you dump
> clk_summary in debugfs with and without that patch?
> 

That dump from the clk_summary are identical for both cases.
