Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DD45D3DE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 05:21:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248FF180D;
	Thu, 25 Nov 2021 05:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248FF180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637814099;
	bh=NRSE6VjEWgNC41RLdVKKEe+ug2L6LxXQPzbgg9pbubU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjvRmoB5kR515kslC5kDLHvGH2M+lhfu4pY3g9uCJOumU/bjHaipi7oaLStcOkWy6
	 6B2djp4lN+NeChbFwgpb7CBDUoQQ6g2FPloywASqG+LwIoEc/wbLZXR0OAvYMLRW3M
	 TvkLVyTGFbPUYjbvLHruFnKcfXlCG38gUtGnXYdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE8EF804AB;
	Thu, 25 Nov 2021 05:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BEEF8049E; Thu, 25 Nov 2021 05:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7525CF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 05:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7525CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o++SMOtW"
Received: by mail-lf1-x130.google.com with SMTP id t26so12872178lfk.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 20:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BE19aF5UvkexXFXpNDupHLeqTikRuVPoKcnXFT9OpTc=;
 b=o++SMOtWY5OxrJrk2defJIuKEwAPjWW5ACHeX6LzrD2Vy8igEeRLV3ODdIBe353VBs
 eYRFggmy1FJXJ+UwqTJ6vgdxWbPxHLFbr77UhZe/e+tQL31kSq9e7aEZ/e+I3gv6lJOc
 XTMp942TXxjbhSwZ7UXMYo2Kh0q5Da2dM08gnGRI4uMtZDYtBA7FE/ve7LhkGHAy5+oM
 1AjrnYHoxM8IVeiTSqTxZhQ97foDo2nkJ51JmTP1hkPSvJ0BrH4gYwlJXT6FXFahtBOc
 Fp/3IndpEa1t5iEpKBuxrhFnPPzNUAsyyPinxnutr5dlh9apIz9n+Dp4FDYNvyTZ0GFP
 8HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BE19aF5UvkexXFXpNDupHLeqTikRuVPoKcnXFT9OpTc=;
 b=5773d2YiwGluTLjrmRHm84xgTNdBVz4LlsgAt9r0oK7ys1V43H3/e6pDi4ioh0S6kA
 r6ikg0UMd+Q7JDVly/3gmbzireltv4yOdGO2VFjZrO0dIt96GY50Dbmy3lujmCwhV2/J
 Wf/A2hv6xrUCc2J0QFByNzL++ry4lx738pwmj1xhOf7G6NxQ9aVZcqTPZUCVRgN+GtIu
 1Ay/XFOqWamyp03/phfdyxnFujy837kP3eg/nL4/5cpThmSrMWpFBD+Fh0olxIq2i2E7
 LYpuKL3K0EqVD8J6uWxT7l0hC3NEnb6vJmxV6LzTcfRi1XjHiyKe61FXFZzChelAgK4H
 DAmQ==
X-Gm-Message-State: AOAM533+Q2voErPNNclyHlDof3pEiQznNYFn6IDT1LHNjDfAIZfilpat
 2VNtSx1iGrBLEv/Nz9+AhmQ=
X-Google-Smtp-Source: ABdhPJy0VrtiWGY5aK9Ntm6ZqTo5OoljLalg9RN9ABto5r2FcHYdh5wqlaU+y5c/FmJvhFIMbcdVdg==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id
 k12mr21946258lfv.365.1637813999593; 
 Wed, 24 Nov 2021 20:19:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id m8sm160775lfq.27.2021.11.24.20.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 20:19:59 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia, tegra-audio: Convert multiple
 txt bindings to yaml
To: Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ed2725b-3a78-d0fc-b09d-5725ca573215@gmail.com>
Date: Thu, 25 Nov 2021 07:19:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 ~okias/devicetree@lists.sr.ht
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

01.11.2021 23:42, Rob Herring пишет:
>> +  nvidia,audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |
>> +      A list of the connections between audio components.
>> +      Each entry is a pair of strings, the first being the connection's sink,
>> +      the second being the connection's source. Valid names for sources and
>> +      sinks are the pins (documented in the binding document),
>> +      and the jacks on the board:
>> +        ALC5632:
>> +          * Headset Stereophone
>> +          * Int Spk
>> +          * Headset Mic
>> +          * Digital Mic
>> +        MAXX98090:
>> +          * Headphones
>> +          * SPeakers

Speakers
 -

>> +          * Mic Jack
>> +          * Int Mic
>> +        RT5640:
>> +          * Headphones
>> +          * Speakers
>> +          * Mic Jack
>> +        RT5677:
>> +          * Headphone
>> +          * Speaker
>> +          * Headset Mic
>> +          * Internal Mic 1
>> +          * Internal Mic 2
>> +        SGTL5000:
>> +          * Headphone Jack
>> +          * Line In Jack
>> +          * Mic Jack
>> +        WM8753:
>> +          * Headphone Jack
>> +          * Mic Jack
>> +        WM8903:
>> +          * Headphone Jack
>> +          * Int Spk
>> +          * Mic Jack
>> +          * Int Mic
>> +        WM9712:
>> +          * Headphone
>> +          * LineIn
>> +          * Mic
> All these strings should be part of the schema.

Well, seems this can be done only using a separated bindings.
