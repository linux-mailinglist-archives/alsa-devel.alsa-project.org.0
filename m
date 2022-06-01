Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF153A5A4
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 15:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3039A16CE;
	Wed,  1 Jun 2022 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3039A16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654088873;
	bh=V05R3T1je5ivUBfxtJbTp7FhgFEscYKLvc6/O4yfadI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3qGaTKKvDWW7O5tn1J4fd7X8MhFyc5dwDeCQI8lsXJWvMmtrT3WJe7Dkt38ev1rW
	 Jidi9MKJcfL2Krozo+z0EdS/Zx7DO8v5mr0rb2upxWuZIQ7jty+QXHGogg/AumFKIy
	 K5zgkDAzaugIAu4f4oHImnuECgnhl1LBhS3JLLlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D951F80238;
	Wed,  1 Jun 2022 15:06:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 346C3F8019B; Wed,  1 Jun 2022 15:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F51F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 15:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F51F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E637gfrR"
Received: by mail-wm1-x32f.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1071669wmp.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y7AFvgnHqwWsOFhTmk4i/DwYzcjtYaWfhp+4Z6qHobU=;
 b=E637gfrRTkd2Xn1qbN2xOc9CfyQozzgeVso68I9JFpeOLf+kFLouA3I8IQET/AsKlb
 Y1dDEG86g6pP4Wv54CJhzD2hSV7CirPJGhTV90LJS7FEzMjER6rlpwuWMrNPK05oY9ti
 g4uXFNvyQlg2NlSWpDajepojAfWFSDMaIvfd3Q/O87hLvFgbOUCzO2VMOX0U4N2i/7OW
 pu/JMTO8zx81A1CQp8ZfTD2kAMXiw3fId03fFm0Y4aOKue7WTXjAtPw/QR6+qrB7PS41
 wfmtWUQa7MimFRBVziVFU7sBmsYRlrglvK4rE5jYWEvme7mUhgZr+yoyAMGn3TwxXPju
 5OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y7AFvgnHqwWsOFhTmk4i/DwYzcjtYaWfhp+4Z6qHobU=;
 b=JKX3AVaftfyUXzViVyypg5yOLCLV4/cfEPxRINomXv+tIV6XBGWvFLSwBdaPkcElih
 ah1BaeBWhnUpQxT8MBYxu1yPYdkXWif9BInaWuszj+cQ0YLrR+KEJwwy2kQ6s3wsOsJe
 +yvjrwIsPY41wERBoTkCl/IYB3P69QEcX1tooxILknMncdB72hPZuGjRftIvKZl5co+j
 gzOXG9qWF/EmmZChhXTG09AHy8Y9S9RZzVF3uAApdgEdvvAaWlrveyF6e3MDqigBwaJO
 69cLpDumvPkZku5/Zktx6tD9rIEq6dcrQqEiype2LQD9qjSZo1/eFJuIGZVTIbdbKTLi
 u5UQ==
X-Gm-Message-State: AOAM532c/UpTZ5g9Lfe0s2dEPGOPKNSAgSGOiqcQBZjVeyY92qSXfTw3
 OZDSDbDB2HMG6ekPfgSowIKLig==
X-Google-Smtp-Source: ABdhPJz5o9FuHCcYjcaH5dprQ7ehfD3MI+SA5JumBHiFDerZaHO2MPeu/niUrkcqkUu4GjHxBsRY7A==
X-Received: by 2002:a05:600c:1f0e:b0:397:707f:5a60 with SMTP id
 bd14-20020a05600c1f0e00b00397707f5a60mr27623101wmb.3.1654088806145; 
 Wed, 01 Jun 2022 06:06:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 m11-20020a5d624b000000b0020ff3a2a925sm1892597wrv.63.2022.06.01.06.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:06:45 -0700 (PDT)
Message-ID: <1ec64a99-cfcf-c903-935b-d1bb0617c284@linaro.org>
Date: Wed, 1 Jun 2022 14:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
 <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
 <YpaXZ6KfApGebkBy@google.com>
 <7c74868d-624b-c18e-b377-026e70813fcc@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <7c74868d-624b-c18e-b377-026e70813fcc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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



On 01/06/2022 13:57, Srinivasa Rao Mandadapu wrote:
> 
> On 6/1/2022 4:02 AM, Matthias Kaehlcke wrote:
> Thanks for Your Time Matthias!!!
>> On Tue, May 24, 2022 at 04:19:47PM +0530, Srinivasa Rao Mandadapu wrote:
>>> On 5/21/2022 8:43 AM, Stephen Boyd wrote:
>>> Thanks for your time Stephen!!!
>>>> Quoting Srinivasa Rao Mandadapu (2022-05-18 05:42:35)
>>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>>>> index da1ad7e..445e481 100644
>>>>> --- a/drivers/soundwire/qcom.c
>>>>> +++ b/drivers/soundwire/qcom.c
>>>>> @@ -1333,6 +1337,10 @@ static int qcom_swrm_probe(struct 
>>>>> platform_device *pdev)
>>>>>           ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>>>>           ctrl->bus.clk_stop_timeout = 300;
>>>>>
>>>>> +       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, 
>>>>> "swr_audio_cgcr");
>>>>> +       if (IS_ERR(ctrl->audio_cgcr))
>>>>> +               dev_err(dev, "Failed to get audio_cgcr reset 
>>>>> required for soundwire-v1.6.0\n");
>>>> Why is there no return on error here? Is the reset optional?
>>> Yes it's optional. For older platforms this is not required.
>> If it's optional then either there should be no error message, or the
>> error message should only be logged when the version is >= 1.6.0. There
>> are few things worse than a kernel log riddled with misleading error
>> messages.
> 
> In that case, it can be done like below. Kindly let me know your opinion 
> on this.
> 
> if (ctrl->version >= 0x01060000) {

This is not true 1.7+ variants do not require anything as such.

Why not add a flag in struct qcom_swrm_data and pass it as part of 
of_match data specific to this version?

--srini
>      ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, 
> "swr_audio_cgcr");
>          if (IS_ERR(ctrl->audio_cgcr)) {
>              dev_err(dev, "Failed to get audio_cgcr reset required for 
> soundwire-v1.6.0\n");
>              ret = PTR_ERR(ctrl->audio_cgcr);
>              goto err_clk;
>          }
>      }
> 
