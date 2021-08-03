Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E353DF0A8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 16:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7EDA18C1;
	Tue,  3 Aug 2021 16:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7EDA18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628002182;
	bh=vne1ZaG83a9P/jfv1gbD9TEqOu2e2DXgTTy63D38qo8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p5zhdE/x+OTDgTRE/H4087J+mreLt0DjYQ6YuNFmlKmb725Z+3SCq5pydJf2Gwwfp
	 2k8qB+Du8Ro3UdQt2fh3p5+rKC0KxjaJ4w0wtGfzV8KNVF4UoAIf4dcSVzIuYeqWS5
	 aU1cxw8P0AnYp3tVP5YAmnLG5599xTc12olfEnNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34963F804AB;
	Tue,  3 Aug 2021 16:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D5A0F8049E; Tue,  3 Aug 2021 16:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2321CF80095
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 16:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2321CF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dahT4bqf"
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so2294307wmg.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VzEPllnJibLq3zcdzHAkqTLkXaVEqNj1xd8dTfaBHUw=;
 b=dahT4bqfaFsRU6p8agqQoaLw5OhT+j8m0V/FuMDWSny/S1HS5LUVFYF+QAv1NHoTQY
 idWyjLIdv+K2T6jUlpI6MBIlqvLQzoEG3pXk77gmlfb42MqPa8Kj21pVHt5CQLM8ppwp
 beBZ1f9L7z8CXZ9AWFDOf7B9dgJsnYgDJsji40GDvwLLSguPqXkI58EHIltrVMUpOwHq
 j1y+dLCrsliHPyAUfS/moEF5ULRk+ck6EfTszolG2tNDB3v/rlx+0+LifkcrbkX6nMSv
 8t7H/Uccvwu0ZXvcQFKRtpXrlBBtdDrhnufBH6LH1owJylgtFgcaM0D57Tsm0p0+OuAi
 4y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzEPllnJibLq3zcdzHAkqTLkXaVEqNj1xd8dTfaBHUw=;
 b=CxLmt+LwhBV+DCa7FWMT5W+GVZAFTve08zDTzF3D77L3VVJnZBISjv9ROr4i2H/P8Q
 auTg/dhDK5OGANAgsdG45uR5kE/hsRTHArptwd0jLW6CwDUWDl1ZphKKDHmfijTEc+4B
 iE/1aMKDPk/LWUtGvdgWHYu/vX/idcgUE0PnTBJJhnzZc8yrcUsHU13CkHSvtFzHx9xJ
 6Ce4wUnXArL0NGgcfBbnU3Zh8yXxjcBaZTvKtzjP25kak3PP3+SRHphoAfZ0DcVE/8pa
 JGTTRdwfuG54Cuv0EvFfINs6D+r8EvIaW50laEhQ41a/taJh+r+fvnk6ZLBH4FUHHWaX
 9Pzw==
X-Gm-Message-State: AOAM531VJo8eZXVuJZdOc8uYCWuitEAPzqfrdI8v9rnz3RGUPpo6Axm5
 6OEyQ1x+YR1msa/xLN3FW18LkQ==
X-Google-Smtp-Source: ABdhPJy1AUqHvbe8ohorldpBn23AvFXXQiXP9EbNZTiN40o0TOJssr+qXeXmC7vukYki0/V3rxUvjw==
X-Received: by 2002:a05:600c:ad6:: with SMTP id
 c22mr22852904wmr.114.1628002101389; 
 Tue, 03 Aug 2021 07:48:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g12sm7866397wri.49.2021.08.03.07.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:48:20 -0700 (PDT)
Subject: Re: [PATCH v3 14/20] ASoC: qdsp6: audioreach: add q6apm support
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, bjorn.andersson@linaro.org,
 broonie@kernel.org, robh@kernel.org
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-15-srinivas.kandagatla@linaro.org>
 <111d4d4f-06f0-b7ca-579a-316e87f24f86@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <85611b3d-1a6d-4fb8-0ac0-6035049884e2@linaro.org>
Date: Tue, 3 Aug 2021 15:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <111d4d4f-06f0-b7ca-579a-316e87f24f86@linux.intel.com>
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



On 03/08/2021 15:20, Amadeusz Sławiński wrote:
>> +    /* Assuming Linear Graphs only for now! */
>> +    graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, 
>> graph_id);
>> +    if (IS_ERR(graph->graph))
>> +        return ERR_PTR(-ENOMEM);
> Shouldn't graph be freed before returning here?
yes, it should be Its now fixed.

--srini
