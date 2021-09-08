Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DA4038C0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 13:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0EE916F1;
	Wed,  8 Sep 2021 13:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0EE916F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631100581;
	bh=jF77IiwaMrm7b+hVYWJhbH6WE8NCcm6o+ahh3EOxGgM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fO8ikC+24CF0rFj2E2hLjNWDyAiq/tW+aUIxmterRR0p63Fv0/nA/Ci1MksrVEv7j
	 Zp2hubQfnCd+InnWw9pa8lHZmPZXWNQZq+2BZJGivGq1HaBbmXyMhldzt4lqfGcn4s
	 X5dkTFImLMpL5RAAG3++btuShz4xAgtUtQYPxZ6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5858BF8049C;
	Wed,  8 Sep 2021 13:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EABBF802E7; Wed,  8 Sep 2021 13:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCA54F80166
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 13:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCA54F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MmkKbYwn"
Received: by mail-wr1-x42c.google.com with SMTP id d6so2713596wrc.11
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pg66Yxo91om1NZRwVnciKYYajdbMErsJleQijC0sD+Y=;
 b=MmkKbYwnEtT3WSJ4kZXt7pb3++P//jjvY13u+WW1OU84iUU6rd9qBT9epKmwyn48mC
 Iz0IauHNVOMSZJuO/oaQ9B0cVPqEupA5t1r23/cxBenLoxW+V5BGgvUeN/cW/PF4nFUt
 KefnkXeZoNLvVWLZnFArfHEnBHQ8Cy0qQD3AuPUGAWx2a+E9MpYvl6rNEevqfgFnywAl
 Ke4OvXoKrkVAK0fjZHkIQvM5C39KNr9uF7eb4RHX86zy7Uy3DuxqSRYPUm8VCZmmvrRi
 82DWdiSDYhCsi+DzQaqaMBtuK9VstZMkcATxGhoa1xDcpur2xwM+3EgRtGAEUBns1H02
 bmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pg66Yxo91om1NZRwVnciKYYajdbMErsJleQijC0sD+Y=;
 b=WJIOvzyUV7+0otLyi3B26h8KXxaULztqZdXU8p1nE+Sry5a4dHLsN87qh+lz9NVVQ4
 URSkQkig74V7zzWWJ5Dxa/w2M8rEpepVmhBxXyJ4yCwOgrQ9suHesnyBFJN8nwjr05xF
 i5fIJ2ZG7KPynpigg+u2XADTyvKZPeasWFZcrWB5urDHb9FyW5lJrOe0Wxs8mRDsE6d0
 E5onl+I3biBmvagGVv7KTF4z9CaZp5R4VSxZb04cV5strZd6T8gMe0xwm4mqutF+qzto
 pO2FAERUVStsk1cL71DMxkfrC37XvtnQGPwqu9/Mppl01g1XgJmobKhLKJp3lSh9qzdh
 8uDg==
X-Gm-Message-State: AOAM533ZBNnBsW22D9risMWbLBKWpgXJ2tyQcniOV7nY+aq1dJ23BB/5
 WwF/kMPoiOw1RzbLmzKuoH8pjg==
X-Google-Smtp-Source: ABdhPJzEkUTMbkWr1fV/ebaPj1K2OSgR3K0T2YrBI9bOIige02dw6GuELm44qoBD/F9EniXibH/WAA==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr3636173wrv.87.1631100487640;
 Wed, 08 Sep 2021 04:28:07 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n13sm1586753wmq.3.2021.09.08.04.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 04:28:06 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] ASoC: qdsp6: audioreach: add q6apm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-16-srinivas.kandagatla@linaro.org>
 <081e6734-a258-6d21-cf66-f00bfeb38b04@linux.intel.com>
 <b1cfacb4-70b9-7146-00d5-9d680297d900@linaro.org>
 <f8bd8b94-528d-bf6f-9e84-0e41e4c56382@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0840d2e3-c261-8d85-35ff-8388448ab7fc@linaro.org>
Date: Wed, 8 Sep 2021 12:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f8bd8b94-528d-bf6f-9e84-0e41e4c56382@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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



On 07/09/2021 16:04, Pierre-Louis Bossart wrote:
> 
>>>> +    graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list,
>>>> graph_id);
>>>> +    if (IS_ERR(graph->graph)) {
>>>> +        kfree(graph);
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +    }
>>>> +
>>>> +    spin_lock(&apm->lock);
>>>> +    idr_alloc(&apm->graph_idr, graph, graph_id,
>>>> +          graph_id + 1, GFP_ATOMIC);
>>>
>>> does this need to be ATOMIC?
>>
>> We are inside spinlock.
> 
> but this is not used in an interrupt handler or anything that isn't in a
> process context, is it?
> 
No, it is in process context only.

--srini
