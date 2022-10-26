Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0060DDE7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 11:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016601FC5;
	Wed, 26 Oct 2022 11:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016601FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666776047;
	bh=9Ae4L/WwlykF22KreQk3Mq9ViPbKVnw52osNbV6IaL0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZ5HbtMGYHQsH0cVVs4BaSTcr6llAsDpjANcFIwAAHQlhrgOCCaaa7/Hm7RjG89/4
	 PdI+fqFv5powUTGW6IOVL0wb5BPx/j9z4XYwbs8ojOst2pZHoToAcwSE6PbN/HLPaT
	 LawGDd4PbAQAzWnroyYTHv6QvKWqErLOKt5h4W/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6008BF8027C;
	Wed, 26 Oct 2022 11:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF3E5F80271; Wed, 26 Oct 2022 11:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444D4F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 11:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444D4F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Os3CANdZ"
Received: by mail-wr1-x434.google.com with SMTP id bs21so9392043wrb.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+vvLMd9vnkZI8EzpD9XjigLCKktXXyr3j+Ca9tW6zSc=;
 b=Os3CANdZlXG2loOTmbB8GVV0kux7vtMLUrM6BXvveJ1XmAGULocAcl04MTbfQtgKHZ
 ZogXwPfXcyuUoE8fhJosJMlabM5JN1sDQftzcdN06ukbYROVYK+DVBU47D+YyGx5ocK5
 wuhRtq0iSQQxLpllqZAJP0F3NBycKOZe7yhJxhyHBPgzUjzRv6n1wmf7iyoVnJQ1mEOw
 QP6JjocO5+YT1ZcUzHp2thVVWx7q/4ul2IFZHMoN5zRrDi6UuutfO9AtMMyzbmDGiNRH
 py2swijRZbkDaqrS28X33rCiTGpEj6KHQpgD8WfnnZ7sVEvR1xQbwtiPpf+XNfliKqF8
 D1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vvLMd9vnkZI8EzpD9XjigLCKktXXyr3j+Ca9tW6zSc=;
 b=fIJ96p9NRuqysRN4x/BwXSBPAqQA73E9zd82PVSeWotwVLkBAG8nwMZK2aXMPwQRNA
 7kLQxn4cWN4jOv3DobXymp2ghAV+GHWSqOWMk2zgW7ca0cpaCjveWqlMCLOa4/WDkGAC
 RoPDtmrzaDjPhT8QhfxNVHgCDgQYIlt/DIsi1q+H8Wf1rN4MB9poO5yEg5Uy1nb/D0fO
 NF3qGtSmS9aivAVX0oIfB0CR01mmOk7NaW04Yz6J7X2mZenk2nT0xx/wCWXYapaWtkav
 FmhFOQ1CCrfT6KnYBwI31jcRy7v2+xm//Ujn5X+c4N73gNZfBZwRkI7jXztibKJTn8IK
 rHIg==
X-Gm-Message-State: ACrzQf373ilRxFqOS2m6HLds3sdYKbdpl0s75pYdnGoOVN/d62Z2JUp9
 8/1a9KIb3jirqnHOiQjsN5PGQQ==
X-Google-Smtp-Source: AMsMyM4ERMKN8mXF1n7JYQJq8K3dGg1HUzsKsTY9L1ZoG3ILEkjuCGg4X927odxJLccu51fROJeatw==
X-Received: by 2002:a5d:6d0d:0:b0:230:1b65:a378 with SMTP id
 e13-20020a5d6d0d000000b002301b65a378mr28987089wrq.406.1666775986311; 
 Wed, 26 Oct 2022 02:19:46 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003c701c12a17sm1378685wms.12.2022.10.26.02.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 02:19:45 -0700 (PDT)
Message-ID: <4d2fcabe-291a-9f8d-ca48-eaf52e00695e@linaro.org>
Date: Wed, 26 Oct 2022 10:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
 <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
 <35f55696-c4c5-1f00-dc7e-b5c7dcf0a091@linux.intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <35f55696-c4c5-1f00-dc7e-b5c7dcf0a091@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 bgoswami@quicinc.com
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

Thanks Pierre,

On 21/10/2022 18:09, Pierre-Louis Bossart wrote:
> 
> 
> On 10/21/22 11:51, Srinivas Kandagatla wrote:
>> SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
>> instead of idr_alloc to able to accomdate valid ranges.
> 
> typo: accommodate.
>
will fix it in next version

> Also worth checking https://www.kernel.org/doc/html/latest/core-api/idr.html
> "The IDR interface is deprecated; please use the XArray instead."
Thanks for this hit, this looks really good and specially lookups 
without Locking, this could cleanup the code a bit.

Having said that I would still like this patch go as it is with idr for 
now, and I can plan to rework on converting idr to xa later, as there 
are few more Qcom Audio drivers that have usage of idr.

thanks,
srini

> 
> 
