Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A91607778
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 15:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E526196B6;
	Fri, 21 Oct 2022 15:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E526196B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666357361;
	bh=g6rQ5iIhgc2k1DKIy6bnWuLTvSA9zniFIZFyeYQwAEw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFkiKHt9xyJugTkxYMYkq9Fb6MTLcD52OKneG/SGIdFTuDhVQG9pYeytSaxWSTnMg
	 yxHeRKzQWSVcPfzJnh/7lSKnIeCLMBpym9N3gAVdeSgOQiYMCaJ6J6y6bVHQv6/+2H
	 2BQBHdqoaVm7FRVURup5K2bL+LZpMcnj4g2huxSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 801E3F8021D;
	Fri, 21 Oct 2022 15:01:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB2EEF8021D; Fri, 21 Oct 2022 15:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3519F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 15:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3519F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kmyxDPyd"
Received: by mail-qt1-x833.google.com with SMTP id cr19so1591096qtb.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ay0BwQVxXYd11MLMY4UmBn6pitnaH3n5lE3Hb7RD3Hc=;
 b=kmyxDPydcBx0CVsCnA7v6iqB+TCp+iMAk6qhEq1KREqtDNZ28OOWJQihXev3bxeW8Y
 2yotgIYRQuc+QP/0NaYCC8B15hcer8ZcP0J3NGbT6PYQzDkfnigMvvaipRmztVNKPozk
 Xb3UA+oXk/le5Z4fyOYG+8CJYXO4l8068PqoBxRX0MnD9F7IrV+LrRBjWa160abz/tC5
 78dkXrDrV8dtg7Dqhn+nXleHpmbReRjIR7OUR5grnSCGVv8HGnF63z42A5SBZqeSA00+
 wduP3hs/5ZbTk9bW1ex5JwRFaeqy9v6Nw7iabbM4ldpHdwFMxeyX1aKYYx0hs74aSxQK
 NcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ay0BwQVxXYd11MLMY4UmBn6pitnaH3n5lE3Hb7RD3Hc=;
 b=kFvivMk0/3GR80dTt7Iy1KBNUqqoZ748f7GlAN3t8N7JDKsHfWntOD7uRNquM2tLbm
 QMTxhWPFKHENPUyb2dvU2gEeJ4kUZa/zrUKnHjRXEIukxQT8cMIsrLv17wOlmuB9M3zD
 132g2OgEWPQcvS7upA10ecDJl5EFIE31VHX2ucyhg5E6MnhXI6w8CTdZwI350wI1gXFb
 xloIWqVHNyCJ7NeMkaJD7VDnX6SxU5hM6s5Sko5vl7qxnKYU45ZJbWloWcQiQ9XLGOaG
 dirHdWBic96auU+YmEU3iiY1UcsI8FQmNUXAUiDiuWWsPGak7F7z/bhYWFxcSWDMYzyv
 FzaQ==
X-Gm-Message-State: ACrzQf3aCBGhukFPMZELIaWKqUBriZ0pSrqYRP9WlNxN6hCLGTPdtZI1
 3vKkMMS2Ru7djCARLBudT37K3Q==
X-Google-Smtp-Source: AMsMyM57YKDsmpxT2R9I96Bphr46QmYThVVpP/MkJngBFFJ9P7c3jcxqhDYYorS13cmc31e9sdMoWQ==
X-Received: by 2002:ac8:59c2:0:b0:39c:e3b4:1265 with SMTP id
 f2-20020ac859c2000000b0039ce3b41265mr15515785qtf.55.1666357300726; 
 Fri, 21 Oct 2022 06:01:40 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b006ce1bfbd603sm9362091qkb.124.2022.10.21.06.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 06:01:39 -0700 (PDT)
Message-ID: <22272f56-ba55-5725-2dc9-8012e5903eeb@linaro.org>
Date: Fri, 21 Oct 2022 09:01:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 5/6] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104911epcas5p394100ff6ed53be32c4d64c7e23e48833@epcas5p3.samsung.com>
 <20221014102151.108539-6-p.rajanbabu@samsung.com>
 <c11f92be-1d86-17e4-e3bb-05e7b17d5fc8@linaro.org>
 <04ba01d8e52a$0d55bee0$28013ca0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04ba01d8e52a$0d55bee0$28013ca0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 21/10/2022 04:49, Padmanabhan Rajanbabu wrote:
>>>
>>>  	cpus {
>>> @@ -809,6 +811,42 @@
>>>  			status = "disabled";
>>>  		};
>>>
>>> +		tdm_0: tdm@140e0000 {
>>
>> Node names should be generic, so this looks like i2s.
>> https://protect2.fireeye.com/v1/url?k=2cfaa5af-4d874de8-2cfb2ee0-
>> 74fe485fff30-cb16acc0c0c574e9&q=1&e=fc8e3b54-a0ef-475e-a4f2-
>> 83626a86ac8a&u=https%3A%2F%2Fdevicetree-
>> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
>> basics.html%23generic-names-recommendation
> 
> Thank you for the link. I could only find audio-controller in the list and
> not i2s. so I believe I can use audio-controller node name. Please correct
> me otherwise.

All I2S controllers use node name "i2s", so if this is I2S, then use "i2s".


Best regards,
Krzysztof

