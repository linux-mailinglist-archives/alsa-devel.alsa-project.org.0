Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A203F272A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659B71679;
	Fri, 20 Aug 2021 09:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659B71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443013;
	bh=tDZmzWBNezGcM3fsAJ9Lxw4N/PNtQhG/IOChrGPrimA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EExfXlhgpsJsqokLmVzBu9PgBCPnMyXEaBJp2NvFzyWRTIyn8Fj3jfGGFrDmj4kdb
	 KFLe0tQNeRd3jr6ssMGtvc30fQbTXnBx+X+etFiG9hQ8iAEyxoLp9enxkfNKhw/7VN
	 Go1oW1iPU/B1YdbpLlOkaz8dpSCxPGxGZBSVyBoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E5AF80259;
	Fri, 20 Aug 2021 09:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B59DEF80111; Tue, 17 Aug 2021 07:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 420EAF80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 07:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420EAF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S+4YZ6S9"
Received: by mail-pl1-x629.google.com with SMTP id w6so16622952plg.9
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 22:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IxafAGsMTAwB8VQj4VftuWH0xnZbthsj3itwHDoB7/o=;
 b=S+4YZ6S9MuIMk2XbSfM1Uac7rFCC1w6XHTVMgjDOE5t6zEjjnbgAyW9120xhv5vRFs
 9kVE7Y09h0TqWISKKpigDwi6n15NTFYtp835p5eiZQGLu7wllgM97IF6fZHnxjxAeKV1
 hEg4hoLzFNOjH6sONx+cOOosGRqfBU9LzGikWBtMi6OTTyb7Hq0hzARr671NV4iNhnSV
 D1dhcTRGXOllqbGGAIwJxVOch1LfwX3Xrx/ROn1ObYC1mrf5Gk3uPUyecPhcQ5l3FUTq
 79M28k83DafAcfSGS9Pr+mAETIBLuEeEaUw1MjBuRQMSXQQNRzsWpmCNycsysYhN3Op2
 MTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IxafAGsMTAwB8VQj4VftuWH0xnZbthsj3itwHDoB7/o=;
 b=pCFIAX/FrZbRjBmH7tPgjxf9210K+qzuAr+vgJ0Tv9d/0NSBQNic36UX9PJH984jfX
 y992Zip/KwOAzononc9udJ5PkCbk6TDlfnhuA4gBzc/mpgsXgsTZsM3u1q/Vw+VVlLek
 TaG9UjI14GjmpZiv0RnqqQ21ubKzzSz36kkLQAbzokMuY5+RGixmfCLUiRsBxOb/2AA3
 GQV6GAxtQbCDMleNeKgIPJLsd8XYZPXvBrmLK5b+0W+0SgVk2Nh35gf1gCmvpZm9Zu8V
 5CLhk27d+lasfU+pOIWwuHZIbNVHoIFgEAXvrXKpjJ1D9fpP4PNkbpWzGBfCvVaKIvLs
 //+A==
X-Gm-Message-State: AOAM532jb9RvfSgSyFapEz1DYOTkHGnMuI83lC0X3Zi+7BZZWbYKHwht
 gld305OoeunvxlZEzKdjvfo=
X-Google-Smtp-Source: ABdhPJxIT9EkLVBK+gj5REka81141iSYHg81CGXL/NAfE+gcwObrJh6fa43WplDkq1Kr0jFoKpi6YA==
X-Received: by 2002:a17:90a:fd11:: with SMTP id
 cv17mr1809949pjb.45.1629179913968; 
 Mon, 16 Aug 2021 22:58:33 -0700 (PDT)
Received: from [172.20.10.3] (42-73-205-76.emome-ip.hinet.net. [42.73.205.76])
 by smtp.gmail.com with ESMTPSA id
 g2sm1082073pfi.211.2021.08.16.22.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 22:58:33 -0700 (PDT)
Subject: Re: [PATCH] ASoC: nau8821: new driver
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Seven Lee <wtli@nuvoton.com>,
 broonie@kernel.org
References: <20210809101000.3947156-1-wtli@nuvoton.com>
 <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
From: Seven Lee <scott6986@gmail.com>
Message-ID: <5035c750-f061-d3e5-45df-4eb2ae46a420@gmail.com>
Date: Tue, 17 Aug 2021 13:58:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:13 +0200
Cc: alsa-devel@alsa-project.org, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Amadeusz Sławiński 於 2021/8/9 下午 06:44 寫道:
> On 8/9/2021 12:10 PM, Seven Lee wrote:
>> Add driver for NAU88L21.
>>
>> Signed-off-by: Seven Lee <wtli@nuvoton.com>
>> ---
>
> ...
>
>> +
>> +static int dmic_clock_control(struct snd_soc_dapm_widget *w,
>> +        struct snd_kcontrol *k, int  event)
>> +{
>> +    struct snd_soc_component *component =
>> +        snd_soc_dapm_to_component(w->dapm);
>> +    struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +    int i, speed_selection, clk_adc_src, clk_adc;
>> +    unsigned int clk_divider_r03;
>> +
>> +    /* The DMIC clock is gotten from adc clock divided by
>> +     * CLK_DMIC_SRC (1, 2, 4, 8). The clock has to be equal or
>> +     * less than nau8821->dmic_clk_threshold.
>> +     */
>> +    regmap_read(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
>> +        &clk_divider_r03);
>> +    clk_adc_src = (clk_divider_r03 & NAU8821_CLK_ADC_SRC_MASK)
>> +        >> NAU8821_CLK_ADC_SRC_SFT;
>> +
>> +    switch (clk_adc_src) {
>> +    case 0:
>> +        clk_adc = nau8821->fs * 256;
>> +        break;
>> +    case 1:
>> +        clk_adc = (nau8821->fs * 256) >> 1;
>> +        break;
>> +    case 2:
>> +        clk_adc = (nau8821->fs * 256) >> 2;
>> +        break;
>> +    case 3:
>> +        clk_adc = (nau8821->fs * 256) >> 3;
>> +        break;
>> +    }
>
> Just do:
> clk_adc = (nau8821->fs * 256) >> clk_adc_src;
> instead of whole switch?


Yes, you are right. I will fix it.


>
>> +
>> +    for (i = 0 ; i < 4 ; i++) {
>> +        if ((clk_adc >> dmic_speed_sel[i].param) <=
>> +            nau8821->dmic_clk_threshold) {
>> +            speed_selection = dmic_speed_sel[i].val;
>> +            break;
>> +        }
>> +    }
>> +
>> +    dev_dbg(nau8821->dev,
>> +        "clk_adc=%d, dmic_clk_threshold = %d, param=%d, val = %d\n",
>> +        clk_adc, nau8821->dmic_clk_threshold,
>> +        dmic_speed_sel[i].param, dmic_speed_sel[i].val);
>> +    regmap_update_bits(nau8821->regmap, NAU8821_R13_DMIC_CTRL,
>> +        NAU8821_DMIC_SRC_MASK,
>> +        (speed_selection << NAU8821_DMIC_SRC_SFT));
>> +
>> +    return 0;
>> +}
>> +
>
> ...
>
>> +
>> +static int nau8821_clock_check(struct nau8821 *nau8821,
>> +    int stream, int rate, int osr)
>> +{
>> +    int osrate = 0;
>> +
>> +    if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +        if (osr >= ARRAY_SIZE(osr_dac_sel))
>> +            return -EINVAL;
>> +        osrate = osr_dac_sel[osr].osr;
>> +    } else {
>> +        if (osr >= ARRAY_SIZE(osr_adc_sel))
>> +            return -EINVAL;
>> +        osrate = osr_adc_sel[osr].osr;
>> +    }
> true and false cases seem to be the same here, you can remove the "if 
> else" and just leave one of them.


The OSR of DAC and ADC can be different. And the ratio corresponding
to the bit is also different. They are two different tables for
osr_dac_sel and osr_adc_sel. Then it should be noted that the OSR and
Fs must be selected carefully so that the max frequency of CLK_ADC or
CLK_DAC are less than or equal to 6.144MHz.


>
>> +
>> +    if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
>> +        dev_err(nau8821->dev,
>> +        "exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>
> ...
