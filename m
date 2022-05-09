Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2B520026
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E6A918F0;
	Mon,  9 May 2022 16:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E6A918F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652107449;
	bh=dwPPmUdvHEjbM52KQWy7j+NxN/3vjyco2EN6clFwnco=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqkuUVVd+13rZk5v6X425KTaTVNSLkFgcaouvj76MmxckFCG/1kJVt431xk/DMVkg
	 pb6OEFiSAo5kobzHkq7Svwa6GfG3BN1GDOhSLOPbcJ/Fr3CedL4Adv+63ohSClbpD8
	 aAiC9L8l5dE7VUlro0Dojg7KT1ZjS6pWg4UTUxog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF35F804A9;
	Mon,  9 May 2022 16:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8244F8047B; Mon,  9 May 2022 16:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB1D9F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB1D9F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vUy+W4dI"
Received: by mail-wm1-x32c.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so8403791wme.3
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QqShHkKgDFizDmpmSSdmDrX/sfeJAiBTI970sTvj+Bk=;
 b=vUy+W4dIB/CP4YqBPfl7YXr3TPoHkkXMM47VvBAqP/P1bbeTv4auv5JpEO6P39GtZm
 bsQxBjNyr4BTyuFajqyQj/5iiJXQHSSq1vLW78v2crhgsZw7Aa6oXTgSYFzYJlfQtayt
 WWoI7y3gP2Oe9lNHwYCzvDmVAx4DJ/J6rXmdLnAkugqYE5ogUCPFXFf10SHfx2Luq0J4
 JZHqC7UkLdH4Qvcr4DtfA9ICf47joRUk8ZEG0n0derS73v0seQdqQ8pPvN+4jtbxxT3i
 rBlHR+Joh2mFZEWpealWjPEjyD7SeQOJhzZ1gf80hJQyTybFOVr0abLFbYecgfkogYVG
 h69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QqShHkKgDFizDmpmSSdmDrX/sfeJAiBTI970sTvj+Bk=;
 b=KG3I2klMHDL5zh75Ry/MnnIDgxRqY4OeSQ8ZQ90fvTuebcNaxvNVCJu2kHXEpzbg0x
 gkoe/p61z/03nOMr5P7G4SBH4n5nD6u9GZIJJpVHJ+WgvqTmBuL0o0X4+q9FROZ+IfZs
 xjn2MkC/FtwW9t4HHu+EOAnADNKAzJLtT9w15+0d6lAxt0KQ7BlT64tRf7Gm07W3w7LO
 UwjqvilhWjzeErduJRXruy5gS3n+bwxpIqtq1qLhDlLOcs/4XDIUY6eYsY6O/QOaKCSp
 RGvLnR/aIHNq4ptBKVAQP5TomKaJviCQX5H/UATN0zCZSb/Q5zdOBE3ZrIiJOUkiJTaC
 kDqA==
X-Gm-Message-State: AOAM533YIiwbL1vfFEs4tDFi8fQarR6GjYy52aOPKW1C33gk20b8BAjD
 lhatOo04App4AfMQavWvZV136Q==
X-Google-Smtp-Source: ABdhPJxsUsgm5c1MnmnJGYS6LLodO6fR2/kEd6o3eu0aWtFgK9hd1itoxZfX0/O+ZDNhqZshbeCK2g==
X-Received: by 2002:a05:600c:3b99:b0:394:70a0:12e3 with SMTP id
 n25-20020a05600c3b9900b0039470a012e3mr16461461wms.120.1652107355673; 
 Mon, 09 May 2022 07:42:35 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 7-20020a05600c230700b003942a244edbsm14842645wmo.32.2022.05.09.07.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:42:35 -0700 (PDT)
Message-ID: <b127f25f-51ea-f5d1-baef-9a0f026a2e05@linaro.org>
Date: Mon, 9 May 2022 15:42:33 +0100
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
 <d17db27d-ad1b-f52c-50e9-4aab78ae0ff0@linaro.org>
 <0d645ee0-a54f-d9b4-9392-06ea1c37b29a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <0d645ee0-a54f-d9b4-9392-06ea1c37b29a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 09/05/2022 15:36, Pierre-Louis Bossart wrote:
> 
>>>> Even if enumeration timeout, we will not access the registers because
>>>> the ASoC codec is not registered yet from WCD938x component master.
>>>
>>> What happens when the codec is registered then? the autoenumeration
>> Codec is only registered after reset and when both TX and RX components
>> are probed.
>>
>>> still didn't complete, so what prevents the read/writes from failing
>>> then?
>> If codec is reset and registered and for some reason autoenum took more
>> than 100ms which will be hw bug then :-).
>> In this case register read/writes will fail.
> 
> Does this reset result in the 'bus reset' in the SoundWire sence and
> restart hence the autoenumeration?
The reset am referring here is codec reset gpio line. on reset device 
will show up on the bus which should trigger an autoenumeration.

> 
> It looks like you have a race between different components and starting
> the bus before it's needed, no?WCD938x is bit of a odd hw configuration, that is why we are using 
Component framework for this codec. This does ensure most part of it.

--srini
