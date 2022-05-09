Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E698C51FFB3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7295C170F;
	Mon,  9 May 2022 16:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7295C170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652106823;
	bh=XNdWdKp8r1fGeGYOsFoB/RwdaaxZjKfOzGLUpoaRJbI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fP19AecqJ82MJxd2fI9yck8y+C5RqcpsQXfT7aWF/3JDSB0NvINZpea5Q4ORlDtl7
	 EMpRblyYm2723JVE+zeMoIdD2UgsB4wQfPy7xuzeGYHMFr3KE1t4o+p/1II/D+yR+U
	 PLiIp+Kh06EWUKNFgJ6HXCCEbBgwGEm3UWfscEGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6E5F80269;
	Mon,  9 May 2022 16:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E90B5F8025D; Mon,  9 May 2022 16:32:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CC24F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CC24F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FNdmmERO"
Received: by mail-wr1-x42c.google.com with SMTP id d5so19744399wrb.6
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mRwyb4MW3hxR4FGMBpg00Jp28b2UdVmOmfgG2b6xh9Q=;
 b=FNdmmEROS/T89naERBydkCCrmqwTlAfOxyX/LTQbTUtjMMn214WBBMGH4+J54QqkP6
 CLxaE+dPt467C9KgBRjlii3Rea+halFZ7i7VpuBOSzuCUUleOfGU9vxOWySEsSdFSYYl
 sxhlHHNxcFJUVTuAHqatIjQv9yny0812EH2GFreFRoXv4IbDl4fkdJ4XTaXvd6Yd8r0h
 VF92/hVnE+Ql3ZkqrW+4bnsbgR9vV9WfLHv/esYLYBM5DYcH8XB3liOQJDyX4HZneNrt
 aWxjimQannExdsWdjFJDlG3bfrNmzCNTsgS7oxsfiD+63FjJgnTAEH6hMQfAc60SAJA4
 9hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mRwyb4MW3hxR4FGMBpg00Jp28b2UdVmOmfgG2b6xh9Q=;
 b=ZzSzof0+xKHhu0kll3BMcYoK6xNpMY6RDW1FPTzkmlJJMist56m6KLhL4oR22y0JNS
 Hd6lCQg6GZPi1f/59PbPJ3ZwCxsV8X3aSkBo6mfKt31kXyKnrlWUhiYiXNiOvt1wju8l
 AaBcJndFo6vlO4XCEPcQ+0baN0BHCpa/agreALx5WnxriI1qJLDlYJYKYzeyEOdScheJ
 linr1efxSolWTWGkjnhLoDjTHXCPrfoYTCNwEhsSR98kvMt4M5ObLCbhVhTuyEfq428R
 daquiIVj1bMFTXEkeNNUOVEUZZ6vnFFSvOO6W3HlXUvq+0J0brxLH3mYvm6vw9JnyM7u
 Q1kQ==
X-Gm-Message-State: AOAM5339etvOyjqanWjufTz3UqYKNEKx5r4/LA3NZbkwRNB/o+Cbj0sV
 Y55qaIRfOJ0YunaexVoHIum6IQ==
X-Google-Smtp-Source: ABdhPJyu51FAckpWHGAQRL7O0BCkBJO6VzgOSkiCdQyWcis0I+DhoDCgHZDrniGNZMy0q3FClkBJLw==
X-Received: by 2002:adf:e60a:0:b0:20a:c402:6810 with SMTP id
 p10-20020adfe60a000000b0020ac4026810mr14919283wrm.45.1652106755568; 
 Mon, 09 May 2022 07:32:35 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 l1-20020a1ced01000000b003942a244f4fsm17478733wmh.40.2022.05.09.07.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:32:35 -0700 (PDT)
Message-ID: <d17db27d-ad1b-f52c-50e9-4aab78ae0ff0@linaro.org>
Date: Mon, 9 May 2022 15:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
 <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
 <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
 <fd355232-c5e3-ba1b-801d-526ee6f04946@linaro.org>
 <97cd6566-e686-e1f2-fe91-4b4ba9d95f12@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <97cd6566-e686-e1f2-fe91-4b4ba9d95f12@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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



On 09/05/2022 15:24, Pierre-Louis Bossart wrote:
> 
>>>> You could say why do we need wait itself in the first place.
>>>>
>>>> The reason we need wait in first place is because, there is a danger of
>>>> codec accessing registers even before enumeration is finished. Because
>>>> most of the ASoC codec registration happens as part of codec/component
>>>> driver probe function rather than status callback.
>>>>
>>>> I hope this answers your questions.
>>>
>>>
>>> Humm, not really.
>>>
>>> First, you're using this TIMEOUT_MS value in 3 unrelated places, and
>>> using 2 different struct completion, which means there are side effects
>>> beyond autoenumeration.
>>
>> 2 of these 3 are autoenum ones, one is in probe path and other in bus
>> reset path during pm.
>>
>> The final one is broadcast timeout, new timeout value should be okay for
>> that too, given that we need 10ms timeout.
> 
> probably better to make things explicit with a different timeout value
> for the broadcast case.
I agree, we should define a dedicated 10ms timeout for this to avoid 
confusion.

> 
> 100ms for a broadcast is really eons, it's supposed to be immediate really.
> 
>>> And then I don't get what you do on a timeout. in the enumeration part,
>>
>> We can't do much on the timeout.
>>
>>> the timeout value is not checked for, so I guess enumeration proceeds
>>> without the hardware being available? That seems to contradict the
>>> assertion that you don't want to access registers before the hardware is
>>> properly initialized.
>>
>> Even if enumeration timeout, we will not access the registers because
>> the ASoC codec is not registered yet from WCD938x component master.
> 
> What happens when the codec is registered then? the autoenumeration
Codec is only registered after reset and when both TX and RX components 
are probed.

> still didn't complete, so what prevents the read/writes from failing then?
If codec is reset and registered and for some reason autoenum took more 
than 100ms which will be hw bug then :-).
In this case register read/writes will fail.

--srini
> 
>>> And then on broadcast you have this error handling:
>>>
>>>          ret = wait_for_completion_timeout(&swrm->broadcast,
>>>                            msecs_to_jiffies(TIMEOUT_MS));
>>>          if (!ret)
>>>              ret = SDW_CMD_IGNORED;
>>>          else
>>>              ret = SDW_CMD_OK;
>>>
>>> Which is equally confusing since SDW_CMD_IGNORED is really an error, and
>>> the bus layer does not really handle it well - not to mention that I
>>> vaguely recall the qcom hardware having its own definition of IGNORED?
>> QCom hardware alteast the version based on which this driver was written
>> did not have any support to report errors type back on register
>> read/writes.
>>
>> In this case a broad cast read or write did not generate a complete
>> interrupt its assumed that its ignored, as there is no way to say if its
>> error or ignored.
> 
> ok, that should be fine.
> 
> The code in bus.c mostly ignores -ENODATA for the suspend cases. For the
> bank switch, I forgot that we also ignore it, Bard added a patch in
> 2021. The only case where we abort a transfer is on a real error.
> 
> 
> 
