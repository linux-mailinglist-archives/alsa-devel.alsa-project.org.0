Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C046B3741
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 08:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F4DB17C9;
	Fri, 10 Mar 2023 08:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F4DB17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678432949;
	bh=gd7EJ2YUdDzbAmlBQW691Ec3Ki/bRybmvgRE+MccHjk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FSrXo87YnP1oTajiU+RVQxZquPkvUNNfPw6OsE4PTtIpZ4YIhD3CYWzXI2fR6Qmrl
	 G7fxtnrQmKOE/NOkAIPaH8nLRALOTXeyNXlaR7tEUV7QdKuF7YwAOszMJIq6vriuSz
	 mtHg3Cs0UapatlM+ExrKuXQpZeV9qsc9SkZaaQFs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7230FF80236;
	Fri, 10 Mar 2023 08:21:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F13F8042F; Fri, 10 Mar 2023 08:21:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAD8FF8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 08:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD8FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T96ciuns
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so5290741wms.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Mar 2023 23:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678432883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1POc04jfkfBTQgAJUSsVDqeK4gvy0mo0kDtY0v/iXs=;
        b=T96ciuns1KQu/i4XNFef7v7GJvP+4ZOLuUwXzmcmX0KBSmBN/48Xe7PkxiifoYGP7b
         Nt02kp3/0wwwa2mcZtUov/HZtDx4MForsw4ZxmT68rEXaPGp7ZpNEvP4xesBGO0r0cgr
         BpTzP2RpOgEvjw8+9H6DJ8CesjclbX9PRy2h6hE+lqI9tzTolMEbyqNpebeqlPTJcMDy
         Tyau6aVD16MF0bhnbGDDc9Ep93XG1exFkG4QGVwQdhTX94wwfIgkuGQDgGlYpqmXsOdc
         b1G9HSzsfjxIW1MqljKwaQvLPkrlscFyNSOA/OcwN1FR7B3y59W/zaZ8mwSOsW0Q2jZL
         9K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678432883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1POc04jfkfBTQgAJUSsVDqeK4gvy0mo0kDtY0v/iXs=;
        b=Pe4KQeb7nz/Fj2vud/u5RBeiiWD8bAL5+liVuk9Qogwf1o4zrgoGSaYAxkJ/bl5cEy
         cU9arzAkwzzY0L701wJpGkf1QjlO8H+vYdFiACgMSObz64BgAHlZirqglsS0Od7/WkNy
         gsIA4bGqChQaENcroP9b3/fnrtRXuezr6CVw006dE0ilcaKU9IpYPhbLyoZE1TBFgMSv
         r1cXeHNlsZNgQvYez6gEuVYxfNOwbZc8myFkMKCbxr79p727BWS/boC4OfLdi3Uv9tcQ
         UCvoMG9I/hm557Ri3Dz1WPOt3CE6c6HzFcYIHiNfNPijz6wxVx8Fu89ykD3KlHwE8MvF
         ST1A==
X-Gm-Message-State: AO0yUKVd9kE+uG4m9r3Vw6XrvDwWylBaookzWs9NxfKEvj1q9OSgz3al
	f0ZDvSCcC4cpsD4HdcMO+WNrpg==
X-Google-Smtp-Source: 
 AK7set+Ox/4RE8/rAwJ252AX6d2ueTWn8ZTqfXuo6QHL832bzNmFSHqpYa/y56B04XnoYl6AHLk9ug==
X-Received: by 2002:a05:600c:198f:b0:3ea:f6c4:5f26 with SMTP id
 t15-20020a05600c198f00b003eaf6c45f26mr1691912wmq.17.1678432883201;
        Thu, 09 Mar 2023 23:21:23 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 h15-20020a05600c2caf00b003e8f0334db8sm2401999wmc.5.2023.03.09.23.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 23:21:22 -0800 (PST)
Message-ID: <3795f87d-ae1b-bc58-79b7-56c67329de02@linaro.org>
Date: Fri, 10 Mar 2023 07:21:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/28] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-9-quic_wcheng@quicinc.com>
 <ad7dd26d-0ee6-675f-72a5-a93bb0240121@linaro.org>
 <64fc529a-3250-e655-e06e-952f25b1ac2b@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <64fc529a-3250-e655-e06e-952f25b1ac2b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EMJHB6TFQV4MQJDDFCS7RTZ6HDJCH7VK
X-Message-ID-Hash: EMJHB6TFQV4MQJDDFCS7RTZ6HDJCH7VK
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMJHB6TFQV4MQJDDFCS7RTZ6HDJCH7VK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/03/2023 19:38, Wesley Cheng wrote:
> Hi Srinivas,
> 
> On 3/9/2023 1:01 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/03/2023 23:57, Wesley Cheng wrote:
>>> Create a USB BE component that will register a new USB port to the 
>>> ASoC USB
>>> framework.  This will handle determination on if the requested audio
>>> profile is supported by the USB device currently selected.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> Thanks Wesley for the patch, I have few minor comments.
>>
> 
> Thanks for the review!
> 
>>> ---
>>>   include/sound/q6usboffload.h  |  20 ++++
>>>   sound/soc/qcom/Kconfig        |   4 +
>>>   sound/soc/qcom/qdsp6/Makefile |   1 +
>>>   sound/soc/qcom/qdsp6/q6usb.c  | 208 ++++++++++++++++++++++++++++++++++
>>>   4 files changed, 233 insertions(+)
>>>   create mode 100644 include/sound/q6usboffload.h
>>>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>>
>>> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
>>> new file mode 100644
>>> index 000000000000..4fb1912d9f55
>>> --- /dev/null
>>> +++ b/include/sound/q6usboffload.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0
>>> + *
>>> + * linux/sound/q6usboffload.h -- QDSP6 USB offload
>>> + *
>>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + */
>>> +
>>> +/**
>>> + * struct q6usb_offload
>>> + * @dev - dev handle to usb be
>>> + * @sid - streamID for iommu
>>> + * @intr_num - usb interrupter number
>>> + * @domain - allocated iommu domain
>>> + **/
>>> +struct q6usb_offload {
>>> +    struct device *dev;
>>> +    long long sid;
>>> +    u32 intr_num;
>>> +    struct iommu_domain *domain;
>> Why do we need to store this domain, You can remove this along with 
>> the one line that gets domain in probe function.
>>
> 
> We'll need a reference to the iommu domain, because the QC USB offload 
> driver will be the one that is going to map the XHCI interrupter and 
> transfer ring regions for the audio DSP.  This happens when a USB QMI 

this is okay, AFAIU, as long as uaudio_qdev->dev pointer is used in dma 
alloc apis like dma_map*, dma_alloc_* you would not need to handle 
iommu_domain directly like this in drivers.


--srini

> enable stream request is received in the USB offload driver.  Please 
> refer to:
> 
> static int prepare_qmi_response(struct snd_usb_substream *subs,
>          struct qmi_uaudio_stream_req_msg_v01 *req_msg,
>          struct qmi_uaudio_stream_resp_msg_v01 *resp, int info_idx)
> {
> ...
>      xhci_pa = xhci_get_ir_resource(subs->dev, ir);
>      if (!xhci_pa) {
>          dev_err(uaudio_qdev->dev,
>              "failed to get sec event ring address\n");
>          ret = -ENODEV;
>          goto free_sec_ring;
>      }
> ...
>      va = uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, xhci_pa, 
> PAGE_SIZE,
>              NULL);
>      if (!va) {
>          ret = -ENOMEM;
>          goto free_sec_ring;
>      }
> 
> This is just an example for mapping the XHCI secondary interrupter.  We 
> will also do the same for the transfer ring.
> 
> Thanks
> Wesley Cheng
