Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209726F2EDF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771041757;
	Mon,  1 May 2023 08:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771041757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923627;
	bh=0D4Dgn5F3sEA7IvLDYjbVWuODH84oYDcvdArSlAxftc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XC4PUZ1PqFD+G9ALUvmMobsCh4HSqN7Mghm867gywXBppwaCS7uHlu3dI2KSXJpg7
	 sRrKHFjeULof8VpXP/vQ7v6YFm2RZ1PNd3M2rHf5wh1JbavMXBGJdgscslKwLGU1nj
	 OhOCcU/9iQwExC130SDlNXtC/7/9JmiPLWdMvwiU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE85F805D3;
	Mon,  1 May 2023 08:41:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A754F8025E; Fri, 28 Apr 2023 08:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.4 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9EE9F80137
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 08:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EE9F80137
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4840524E2C5;
	Fri, 28 Apr 2023 14:57:54 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Apr
 2023 14:57:54 +0800
Received: from [192.168.125.124] (183.27.98.45) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Apr
 2023 14:57:53 +0800
Message-ID: <fda68c53-0beb-59ac-18c1-4e3075b5ee9c@starfivetech.com>
Date: Fri, 28 Apr 2023 14:57:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] ASoC: starfive: Add JH7110 TDM driver
To: Mark Brown <broonie@kernel.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-4-walker.chen@starfivetech.com>
 <27e57746-d05b-4983-a631-29306851a478@sirena.org.uk>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <27e57746-d05b-4983-a631-29306851a478@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.45]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WD5WSA2SPAOMJXJZZQ6LRQ4KGUXAWT3D
X-Message-ID-Hash: WD5WSA2SPAOMJXJZZQ6LRQ4KGUXAWT3D
X-Mailman-Approved-At: Mon, 01 May 2023 06:41:14 +0000
CC: Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WD5WSA2SPAOMJXJZZQ6LRQ4KGUXAWT3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/4/20 22:30, Mark Brown wrote:
> On Thu, Apr 20, 2023 at 10:41:17AM +0800, Walker Chen wrote:
>> Add tdm driver support for the StarFive JH7110 SoC.
> 
> This is mostly fine, though the code all feels a bit messy somehow.
> A lot of this is just coding style, I've highlighted a bunch of things
> below.  There's also a couple of more substantial issues.

Hey Mark,
Firstly thanks for your patient review and detailed comments.

> 
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TDM driver for the StarFive JH7110 SoC
>> + *
>> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> 
> Please make the entire comment a C++ one so things look more
> intentional.

OK, can reference to other platform's format.

> 
>> +static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
>> +{
>> +	u32 sl, sscale, syncdiv;
>> +
>> +	sl = (tdm->rx.sl >= tdm->tx.sl) ? tdm->rx.sl : tdm->tx.sl;
>> +	sscale = (tdm->rx.sscale >= tdm->tx.sscale) ? tdm->rx.sscale : tdm->tx.sscale;
> 
> Please write normal conditional statements to improve legibility.

Will be modified.

> 
>> +static int jh7110_tdm_clk_enable(struct jh7110_tdm_dev *tdm)
>> +{
> 
>> +       ret = clk_set_parent(tdm->clk_tdm, tdm->clk_tdm_ext);
>> +       if (ret) {
>> +               dev_err(tdm->dev, "Can't set clock source for clk_tdm: %d\n",
>> +ret);
>> +               goto dis_tdm_clk;
>> +       }
> 
> It's a bit weird to enable clocks and then reparent afterwards, that
> seems more likely to run into issues with glitches doing something bad
> than reparenting with the clock disabled.

This TDM module ultimately uses an external clock. It firstly must uses internal clock 
before being enabled, and then is switched to external clock, otherwise failed to reset.
This limitation is determined by the chip.

> 
> This parenting looks like a system specific configuration (what if
> the SoC is driving the audio bus?), and might be better done by using
> the clock bindings.  It's also strange that the driver is reparenting
> every single time it enables the clocks rather than doing that once on
> init.

To save power consumption, need to disable clock in suspend() and enable clock in
resume(). As mentioned above, the internal clock must be selected before enabling 
clock every time, and then switch to external clock.

> 
>> +static int jh7110_tdm_suspend(struct snd_soc_component *component)
>> +{
>> +	return pm_runtime_force_suspend(component->dev);
>> +}
>> +
>> +static int jh7110_tdm_resume(struct snd_soc_component *component)
>> +{
>> +	struct jh7110_tdm_dev *tdm = snd_soc_component_get_drvdata(component);
>> +
>> +	/* restore context */
>> +	jh7110_tdm_writel(tdm, TDM_PCMGBCR, tdm->saved_pcmgbcr);
>> +	jh7110_tdm_writel(tdm, TDM_PCMDIV, tdm->saved_pcmdiv);
>> +
>> +	return pm_runtime_force_resume(component->dev);
>> +}
> 
> It is weird that we restore context that we don't save on suspend, the
> code *works* but it looks off.

Should be pairing operation in suspend() and resume().

> 
>> +static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
>> +				struct snd_pcm_hw_params *params,
>> +				struct snd_soc_dai *dai)
>> +{
>> +	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
>> +	int chan_wl, chan_sl, chan_nr;
>> +	unsigned int data_width;
>> +	unsigned int dma_bus_width;
>> +	struct snd_dmaengine_dai_dma_data *dma_data = NULL;
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>> +
>> +	dai_link->stop_dma_first = 1;
> 
> A driver shouldn't be forcing dai_link settings, and hw_params is
> claerly the wrong place to be configuring something like this which
> never varies at runtime - it should be done on init().  If the DAI
> really needs this you should extend the core so there's a flag in the
> dai_driver which gets checked.

Yes, should be done at startup of dai_driver, doing that once on initialize stage.

> 
>> +	switch (chan_nr) {
>> +	case ONE_CHANNEL_SUPPORT:
>> +	case TWO_CHANNEL_SUPPORT:
>> +	case FOUR_CHANNEL_SUPPORT:
>> +	case SIX_CHANNEL_SUPPORT:
>> +	case EIGHT_CHANNEL_SUPPORT:
> 
> I am having a *really* hard time finding these definitions (which aren't
> namespaced...) helpful.  Just write the numbers directly.

OK, will be changed.

> 
>> +static int jh7110_tdm_trigger(struct snd_pcm_substream *substream,
>> +			      int cmd, struct snd_soc_dai *dai)
>> +{
>> +	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
>> +	int ret = 0;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		/* restore context */
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +			jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr);
>> +		else
>> +			jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr);
>> +
>> +		jh7110_tdm_start(tdm, substream);
> 
> Why is the write to CR not part of start()?

OK, will be changed.

> 
>> +static void jh7110_tdm_init_params(struct jh7110_tdm_dev *tdm)
>> +{
>> +	tdm->clkpolity = TDM_TX_RASING_RX_FALLING;
>> +	if (tdm->frame_mode == SHORT_LATER) {
>> +		tdm->elm = TDM_ELM_LATE;
>> +		tdm->syncm = TDM_SYNCM_SHORT;
>> +	} else if (tdm->frame_mode == SHORT_EARLY) {
>> +		tdm->elm = TDM_ELM_EARLY;
>> +		tdm->syncm = TDM_SYNCM_SHORT;
>> +	} else {
>> +		tdm->elm = TDM_ELM_EARLY;
>> +		tdm->syncm = TDM_SYNCM_LONG;
>> +	}
> 
> This looks like it should be a switch statement, and the defintiions
> namespaced.  I can't see anyhwere where this ever gets configured to
> anything other than SHORT_LATER ever being used so might be better to
> just delete.

Will be modified according to your suggestion.

> 
>> +	tdm->ms_mode = TDM_AS_SLAVE;
> 
> Please use the modern provider/consumer terminology for clocking.
> 
>> +	tdm->clk_tdm_ahb = clks[0].clk;
>> +	tdm->clk_tdm_apb = clks[1].clk;
>> +	tdm->clk_tdm_internal = clks[2].clk;
>> +	tdm->clk_tdm = clks[3].clk;
>> +	tdm->clk_mclk_inner = clks[4].clk;
>> +	tdm->clk_tdm_ext = clks[5].clk;
> 
> Given that the driver only ever interacts with the clocks en masse is
> there any point in having all the specific named variables, that'd mean
> that the enable/disable could just use loops.

Will be changed.

> 
>> +/*  DMA registers */
>> +#define TDM_FIFO			0x170c0000
>> +#define TDM_FIFO_DEPTH			32
> 
> None of the defines in the header are namespaced and some of them (like
> the above) seem generic enough to be likely to result in conflicts.

Will add unified JH7110_TDM_ prefix.

Thank you very much for your suggestion.

Best regards,
Walker

