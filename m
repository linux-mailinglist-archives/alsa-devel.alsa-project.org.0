Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA06A656FFF
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:34:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F387ECC;
	Tue, 27 Dec 2022 22:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F387ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672176861;
	bh=gK9CM24fepTi34cyVEM8rtozl/oIiVvIfp037JONlHw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e1yYFjBckEWrVV/WLX/wIxBIQn/G1fG+YDSBrTYjzf82PUvbCxVzNpeq3W9dHrH8F
	 BXNg04yq+RgIg//A8QoNbSqOQZP2vXyhlZJyan1Fmsm9Y188ab9CE0eRjE5JXeNHrF
	 YYTf9NKxVjjju0HAGxdIZrK0Ly7DMt7XjRmUj4Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72929F8023B;
	Tue, 27 Dec 2022 22:33:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1109EF804B4; Tue, 27 Dec 2022 22:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A60EBF8023B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60EBF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TwQ0/781
Received: by mail-lf1-x136.google.com with SMTP id p36so21168689lfa.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 13:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=blLdzUMAkH6NNOpHUUK0r2VWc/AFPUHqvr7AifIWIZI=;
 b=TwQ0/7811fSSzMqrJssEzw6BoEyyvfG48ujo0eQ+zgnPM/yKo+OCopgEGg+EKtRWMY
 Qjz1Qd+h/pa7QIfjiFjtXEuuzalGr2V0xAUOmPIIrIpnacNZDIceeuFTlQ4tSbvmSEsv
 Rpsbm/XfJ+wTPN5x5I4uoJF5xuYOJgInoSgEOKn8owlQAsn3CaVmMkZaMayM19wLxfr7
 MiEReiWiQ/jT3i/siSclbwlZ99e+tyrR1hXoHr05Xur+WotgBs5evT2iu/fUdGLBxinv
 xTk8zpsTHIFDLNj2Tj2qaasRYvWJHLmLPEy0T96EoTjlvvQi2XSk6uegPdpiJ0dmRrD2
 7wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blLdzUMAkH6NNOpHUUK0r2VWc/AFPUHqvr7AifIWIZI=;
 b=wPI+nn8fFE8UTFUf7DZKnZrgGdlk5DPX5Hts01hflMbq2PLeT82i2z3WNfq+SIcQFy
 QzaqYYP9i+p/1pWbTbclDZqxjOEXyREg4dfULxp4EsFFufLu/z7diyBRy9QKghG7XtPf
 l6Lj3bvUaK8+p01DjRhUpOGcFFuBqq9rn5T2OJlnIlH+vKVS0S9ctWumCD0GoyDQC1zx
 lfftzI2ETOOG9uBrF/pfliIfhc++t08BITkNW1ty8gqpWMUzVgyZk0XPD6yJlWw3v2M3
 Pwl1DzZBBoZQLO3YGOTdzEaUGrJ3hPzwy9PBAjXeXo9TkN1qm5vV4jgBOyc1wFwwO60z
 aCkA==
X-Gm-Message-State: AFqh2ko6FCKy+SucWxAGaVHc9luRXI7w883nX0RWHL2/odQUCMgxMp/0
 9Rm9fXw2n+MtgxAq6KAAOLZjuA==
X-Google-Smtp-Source: AMrXdXuaAAOW9AP+69/mg0K8pYcjI6noxqGBDzQUMRrrItvqeB0VXR5G4dXsaLjX2lWQlF+DRJmCSg==
X-Received: by 2002:a19:7b18:0:b0:4b5:9cce:73a0 with SMTP id
 w24-20020a197b18000000b004b59cce73a0mr6987359lfc.39.1672176792470; 
 Tue, 27 Dec 2022 13:33:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a194319000000b004c57abccb8bsm2388708lfa.102.2022.12.27.13.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 13:33:11 -0800 (PST)
Message-ID: <f6e4e538-b4dd-a45a-0078-ea7ebb960672@linaro.org>
Date: Tue, 27 Dec 2022 23:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 04/14] sound: usb: card: Introduce USB SND vendor op
 callbacks
Content-Language: en-GB
To: Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-5-quic_wcheng@quicinc.com>
 <CAA8EJprFD53zmECHJ44FpjztRjwsMym2QP_Gk-JWya-SL_ryHA@mail.gmail.com>
 <730d8cbc-c391-6d77-2374-713f539d38b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <730d8cbc-c391-6d77-2374-713f539d38b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27/12/2022 23:07, Wesley Cheng wrote:
> Hi Dmitry,
> 
> On 12/24/2022 3:03 AM, Dmitry Baryshkov wrote:
>> Hi,
>>
>> On Sat, 24 Dec 2022 at 01:33, Wesley Cheng <quic_wcheng@quicinc.com> 
>> wrote:
>>>
>>> Allow for different vendors to be notified on USB SND connect/disconnect
>>> seqeunces.  This allows for vendor USB SND modules to properly 
>>> initialize
>>> and populate internal structures with references to the USB SND chip
>>> device.
>>
>> The commit message definitely needs some improvement. We do not notify
>> vendors on SND connect/disconnect events.
>>
>>
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>   sound/usb/card.c | 22 ++++++++++++++++++++++
>>>   sound/usb/card.h |  7 +++++++
>>>   2 files changed, 29 insertions(+)
>>>
>>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>>> index 26268ffb8274..212f55a7683c 100644
>>> --- a/sound/usb/card.c
>>> +++ b/sound/usb/card.c
>>> @@ -117,6 +117,21 @@ MODULE_PARM_DESC(skip_validation, "Skip unit 
>>> descriptor validation (default: no)
>>>   static DEFINE_MUTEX(register_mutex);
>>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>>   static struct usb_driver usb_audio_driver;
>>> +static struct snd_usb_vendor_ops *vendor_ops;
>>> +
>>> +int snd_usb_register_vendor_ops(struct snd_usb_vendor_ops *ops)
>>
>> platform ops?
>>
> 
> Will change it.
> 
>>> +{
>>> +       vendor_ops = ops;
>>> +       return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(snd_usb_register_vendor_ops);
>>
>> What happens if several platforms try to register different ops? I saw
>> from the patch 09/14 that you register these ops unconditionally. If
>> other devices follow your approach there is an obvious conflict.
>>
> 
> Thank you for the review.
> 
> That is true.  I don't think there is a proper need to have multiple 
> vendor ops being registered, so maybe just returning an error for if ops 
> are already registered is sufficient.

This would be a required step. And also you have to check the running 
platform before registering your ops unconditionally. Ideally this 
should be done as a part of the device's driver, so that we can control 
registration of the platform ops using the usual interface.

> 
> Thanks
> Wesley Cheng

-- 
With best wishes
Dmitry

