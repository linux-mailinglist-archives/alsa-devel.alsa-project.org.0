Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98247584D87
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 10:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3AA21663;
	Fri, 29 Jul 2022 10:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3AA21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659084064;
	bh=z+agHGRgwPJ0b8rL+1hfZhgoRtXxzbnzR8bNUtDsQ+M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXyQjdQY0SSHThBNWpLXurUkmOnNp9lBqi3ZdCVxnOEkz1mxalIjL6LYup/5nBYiA
	 FRMKgkvBzt4f6mAoFdMKTTh1bfs09hoZM0VF9wRpWaIhXFee4H2H3ydHaWy3bqkuw9
	 S6Axbq2+xWwF3wy/774aHjkpEtxXaECJ+xx+r//8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F144F804B1;
	Fri, 29 Jul 2022 10:40:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBB8F8049C; Fri, 29 Jul 2022 10:40:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,NO_DNS_FOR_FROM,PRX_BODY_30,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02599F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 10:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02599F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sGbkLN5+"
Received: by mail-wm1-x333.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso2160314wmq.3
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 01:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yXWIEmrCvPhMUD5deMCakmb6B16F9IWiC7sXOX1uSM8=;
 b=sGbkLN5+s6l3Qj93D53goWriKE+GOP/8Mh1PBv+98Sjbugr4jUOrSJvm/o7RPKnYC1
 DNJZ8/QaNC3Jl1Fq+R++CjrTLA4J9mb9KRMMbnlVYue+CEkxIHVvvOeJeXdyY9kKGZoa
 7SnhpN3XW+wqZHS1cIij4veMYgj0fePhXbN1Ba0t8mLgkHHTp2nK122u291EwxZ2uf/e
 xAcufWhebU0rGplUh3YoLCjxHCKY/CM5p3AS845x6x6xx6VUDKxiS3Kby+JQ/o22VP2Q
 tfysop5bbymKo7+BoHyTkcvNUZHWivdSgNgy4U7YBDSfMiHWcKvl6lkjB53dbJ822oSV
 N4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yXWIEmrCvPhMUD5deMCakmb6B16F9IWiC7sXOX1uSM8=;
 b=oKydkcxf1aZ8vGESo9iBErLwc2c3oDso1gWeLDh7UzXme486Z2FfxsMEzoiq15VmR9
 SzrqnFqoLOhpOepO+cwohEJbq3CmdwKtoH89jC4hJ1lGzZrbDdAS3E6dJyDat5RTS33f
 O6YDRoDH5dHSFtX92mQKgS4kvgG1UbbSsVeXDlq2O90qmriHqjC89Qmf/rslk7BZQB3v
 kt+FBUc5oS53roMD7pMGou4ZyVcqEG0pHhhlCF+YQNU49e9kCsK0YGm2ME1k1OH202vG
 r1K1YIs5KNrbPq6B1vKp86SqXSuMT3f+/uVAcAAq+bFizHQxnohjwm5NVlehHCliAQjd
 6OAg==
X-Gm-Message-State: AJIora9OT6VmOk+Db+bkUHFx42fY8Sdt8qiDQe2Q9StEvAdefKdttq/B
 GGep9fMbADchbYNOTBQJV/4riA==
X-Google-Smtp-Source: AGRyM1sWhvkqR1vqTMAwyf4DEQkAyj+iXMIL4uNEYHGCSVKh5Qka07s8vTELMcAQhcmjrecOGJGj/A==
X-Received: by 2002:a05:600c:19c9:b0:3a3:469f:c1e7 with SMTP id
 u9-20020a05600c19c900b003a3469fc1e7mr1956536wmq.141.1659083994542; 
 Fri, 29 Jul 2022 01:39:54 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 i3-20020a1c5403000000b003a02f957245sm7820574wmb.26.2022.07.29.01.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 01:39:53 -0700 (PDT)
Message-ID: <278edf67-834b-b673-8d71-88213130d4c8@linaro.org>
Date: Fri, 29 Jul 2022 09:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Mark Brown <broonie@kernel.org>
References: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
 <YuKbpXVOeGn2l2gd@sirena.org.uk>
 <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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



On 28/07/2022 17:09, Srinivasa Rao Mandadapu wrote:
> 
> On 7/28/2022 7:52 PM, Mark Brown wrote:
> Thanks for your time Mark!!!
>> On Thu, Jul 28, 2022 at 07:29:49PM +0530, Srinivasa Rao Mandadapu wrote:
>>> Update SC7280 machine driver for enabling external dmic bias supply,
>>> which is required for villager evt boards.
>>> +++ b/sound/soc/qcom/sc7280.c
>>> @@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops = {
>>>   static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>>>       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>>       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>>> +    SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
>>>   };
>>>   static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> Don't you want to connect this to something?  This won't do anything
>> as-is.  I can't see any references to DMICVDD which might be failing to
>> resolve in the current sound/soc/qcom.
> 
> The connection is being done to "VA DMIC"through audio routing in board 
> specific dts file.
> 
> Will post the changes once the main dts patches are landed.
> 
> Ex:-
> 
> &sound {
>      DMICVDD-supply = <&pp1800_l2c>;
> 
>      audio-routing =
>              "IN1_HPHL", "HPHL_OUT",
>              "IN2_HPHR", "HPHR_OUT",
>              "AMIC1", "MIC BIAS1",
>              "AMIC2", "MIC BIAS2",
>              "VA DMIC0", "DMICVDD",
>              "VA DMIC1", "DMICVDD",
>              "VA DMIC2", "DMICVDD",
>              "VA DMIC3", "DMICVDD",

You should just use "vdd-micb" instead of DMICVDD.
There is already a SUPPLY DAPM in lpass-va-macro codec.

--srini
>              .....
> 
>              .....
> 
> };
> 
> 
