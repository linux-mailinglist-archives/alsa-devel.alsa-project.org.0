Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C143EF895
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 05:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E335D1676;
	Wed, 18 Aug 2021 05:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E335D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629257544;
	bh=CK+8SF+Ph3EgS/cFmEfvlps326sW16BC8l5NRyz7woE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2CFVJT6gCDE0rqVig4vnzeLUdiKUGOg/r58yXT9TfSrnIBNOFOCklurxirVJe2OR
	 T2BX8YukW+X+nA1YB6jo7DRZyAT+mpoXkQL48iaYUqgG0VCm5ZI0y0579jEYRjrKl9
	 bdltDDxj9m4EGeXqKRJiKfPe+Pgw2m5Rx0+HprVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D64F80259;
	Wed, 18 Aug 2021 05:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 660B6F80249; Wed, 18 Aug 2021 05:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3CBDF800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 05:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3CBDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c8jL63VJ"
Received: by mail-pl1-x629.google.com with SMTP id d17so916244plr.12
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 20:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dQ+ZxWtYEFWKu1b/dlblqqaFKNbNjGRkKtcVD5suFzk=;
 b=c8jL63VJb2m0+uN1ToKTtFJoho/4eo/i9PwM/I+XECj/RFQ/jY+HjhtZPs7Hrsh4g1
 s44lfc14cfxPBKTTxU/bAOdDkkcQSq7cxp4/ClM8sALkhHvxdSqETfnSYR17J+VhP6wg
 pqJFYBY9HIBgEXCModBrVNKlEYJMEDQuz2LQvWEE9mMu5GblsCsz+KnL7VOEZM1L8SAm
 1TG5H7yp90E/IVSUxzmYNBhbydeRnHik57wZGFjdf0cPXGLhtzqmvpu/XmC1RUDpyXxO
 jZqdkK3VVAvrsoiKvRMbbqL+BcvC+n4LTi38MD2UWKvfeCbuLcqLM216R8+H98pNyVbh
 WWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dQ+ZxWtYEFWKu1b/dlblqqaFKNbNjGRkKtcVD5suFzk=;
 b=MJggv2da1sRzI49PCEPjOcKS5Dsz3TFV4IkBBq39lnlICOKWATH2K+Q37Egth+f/Me
 1yDjxMvpOjqUzvZkaI/iqw09ZMxVSifV3nZ8ALxR4HOKRH+kPQMPnbUnU/20Zi3UMxSm
 1wBQyn0sO5ceANG/F+x1XR4Uyzv0Y4fb+4hC2lPJYPMl63wvG+oHRxO6m+HHFOpYL6BH
 csK7exUTcMwC98HFDnknQK+t0nsup2VtdVyLSJyxMomYWe9lVHyd4ZT3Mz5CJM+Mzg92
 buZs4NmneEK9LmjkT4bgCPtXRGUEfXm6XwAzeL3QPdv1lQTP2uaUcGTtFdPfTg8xRRdX
 20tw==
X-Gm-Message-State: AOAM530+RMQJBrQugeIz39/9gnF9KZ0uxU/W38WSKXDkf03BsQlEMkP+
 cki2OB/oLlS7k+6jtp4kAwU=
X-Google-Smtp-Source: ABdhPJygauZD4runI7oirOO01m1zFvmGdyi1BwzX18w8sx1gpT8wqSHgptaM3zHKXiMgadlATGthzg==
X-Received: by 2002:a17:90a:458c:: with SMTP id
 v12mr7194970pjg.50.1629257448881; 
 Tue, 17 Aug 2021 20:30:48 -0700 (PDT)
Received: from ?IPv6:2001:b011:7003:dad9:d84f:ca17:38b1:3d6e?
 (2001-b011-7003-dad9-d84f-ca17-38b1-3d6e.dynamic-ip6.hinet.net.
 [2001:b011:7003:dad9:d84f:ca17:38b1:3d6e])
 by smtp.gmail.com with ESMTPSA id b6sm4432504pgs.94.2021.08.17.20.30.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Aug 2021 20:30:48 -0700 (PDT)
Subject: Re: [PATCH] ASoC: nau8821: new driver
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Seven Lee <wtli@nuvoton.com>,
 broonie@kernel.org
References: <20210809101000.3947156-1-wtli@nuvoton.com>
 <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
From: John Hsu <supercraig0719@gmail.com>
Message-ID: <fde36a45-849b-59f8-f2f4-282ddb161262@gmail.com>
Date: Wed, 18 Aug 2021 11:30:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com
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

Hi,

On 8/9/2021 6:44 PM, Amadeusz Sławiński wrote:
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
>

Yes, you are right. I will fix it.
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
>

The OSR of DAC and ADC can be different. And the ratio corresponding
to the bit is also different. They are two different tables for
osr_dac_sel and osr_adc_sel. Then it should be noted that the OSR and
Fs must be selected carefully so that the max frequency of CLK_ADC or
CLK_DAC are less than or equal to 6.144MHz.
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
