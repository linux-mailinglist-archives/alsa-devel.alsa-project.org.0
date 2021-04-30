Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6236F572
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 07:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB9D1698;
	Fri, 30 Apr 2021 07:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB9D1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619761424;
	bh=Hs8jzpr9VO2G8j/zmlHz7eBPfTq5w6iwH01XjQ+/20E=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUxsDZWRagfSSmSKAc2iv7CnPNg4AGM7AzALOCuKIFzV0zU4gYVqCfZRt3VpmJo1x
	 +hsSMofP6fQL9gxuasX0eAXYevmDNSeRBq9P5ouhjtZjU+CJGtAnsqsOk+bOLwKUMe
	 ymHbiZRqT6a8jh9ad66OmohDCTHRxMRXpHFDCdfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81290F8012B;
	Fri, 30 Apr 2021 07:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F9EF8016C; Fri, 30 Apr 2021 07:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_65,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6883F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 07:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6883F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gCVkfB9+"
Received: by mail-lj1-x232.google.com with SMTP id u20so79326131lja.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L7GGiwWh49MO363Lhb3HdQ7RrxGIwg/d5+e48kUjCe4=;
 b=gCVkfB9+8ir2h3bJ1VXaEAIEzArtMEvrpspjTYICjkCYcqhRnMUf80BnnkevOJw45s
 sAtqDNYucTHuQbQZLB8iaHp6yXf1sjQXDuXzMDX/6XH5Y304YrDnAv63nHWYnT3Trwuz
 YKvGMZHdh82Bh4KPtc5gURiRoeWjXsa56eJ7Svbs5ozsf5BFlyAXAFlj55goD2y0kz8j
 Bnbi5lNmGeUessWqWHGrJE+dLkIWIE9dkMbne60wefwSyKr2zx5rKSPxq3Du2PNnXpda
 xvMt5u01TgAELAwMWDTO+D+wR2mVzlmC185OSIekeyj2XxH34t1aAVXPoXr8/ZUovN/l
 lvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L7GGiwWh49MO363Lhb3HdQ7RrxGIwg/d5+e48kUjCe4=;
 b=bAdjXCnuQLKvnn4pwKf8zqdNroC50y/QaBJx14xZZWnaWCNe6f4ARDigkAflXxW/Dp
 Pqzna4kZRWyeCBbsZvbcxk33KTMiQxoMUWahZjYFe2LOST6OdpJV6t1+FTuF13Y3lzX0
 Y0+FieVy88Q7JySrbdB67k4qT6fs+Eu8Z8ezFEyjAtVdxRD+ckpxb1jmKeLgAlFixVOb
 QVUhkZiS6VizCsHWNtbHxnug6AISoRWCpHKF7pQ9lF72uoTcEH30+Qlz0tH5faHaOoIU
 H00Aw2+nRovsr7iUJukS/kVND6Q8M4nhBML/oVdm9PxnzIjZ9I5kjKObkRw3KI7772f7
 pxIg==
X-Gm-Message-State: AOAM530DrQ0ruREBG3E0Ym1mLF+widkf1B6usdNjYGmLz3wB5wU1MeKc
 yRIWKUJ5PYT8h/i82BMIy+k=
X-Google-Smtp-Source: ABdhPJxZdVs7siFgYf2c0en9sIjaulZGpthV94cGpcUX6lVmwKWzDps5zwfGb+qmR8HHldw5bXjJsA==
X-Received: by 2002:a2e:9e56:: with SMTP id g22mr2408884ljk.113.1619761323714; 
 Thu, 29 Apr 2021 22:42:03 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id y26sm110045lja.112.2021.04.29.22.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 22:42:03 -0700 (PDT)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
 <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
Date: Fri, 30 Apr 2021 08:42:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Alexander.Deucher@amd.com, nartemiev@google.com
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



On 28.4.2021 18.35, Mukunda,Vijendar wrote:
>> Thanks for the explanation.
>> This is not upstream, right?
> 
> Driver is already upstreamed.
> Stoneyridge platform based products already into market and working fine
> with 4.14 kernel version.
> Currently Kernel migration from v4.14 to v5.10 is in progress for
> Stoneyridge platform and release got blocked due to Audio use cases
> failures.
> In v5.10 kernel base, re-ordering of stop trigger sequence is causing
> DMA channel stop failure for both playback & capture use cases.

The dai - pcm start/stop ordering has changed in v5.5, more than a year
ago. If the support is upstream it should have been noticed by users.

>> What is still not clear to me is which channel fails?
>> A) the DMA between ACP FIFO and the I2S
>> B) the DMA between ACP FIFO and system memory
> 
> There is difference for playback and Capture use cases.
> 
> Playback:
> 
> channel 1 : DMA transfer from System memory -> ACP memory
> channel 2 : DMA transfer from ACP memory -> I2S memory
> 
> Capture:
> 
> channel 1: DMA transfer from I2S memory to ACP memory
> channel 2: DMA transfer from ACP memory to System memory

Yes, this is why I used A and B to refer to the DMA channels.

> In case of playback, Channel 2 is failing where as in case of
> capture channel 1 is failing.

So channel A is failing.

>> in acp-pcm-dma.c on stop you have a busy loop (10000 iterations) to
>> check if the channel is in fact stopped in response to the cleared run,
>> IOCEn bits and the set Rst bit.
> 
> DMA channel run bit is cleared and Ioc bit also cleared for channel 2 in
> case of playback .
> After that as part of DMA stop sequence, DMA channel reset is applied.
> When DMA channel status is polled for stop, its failed to stop.
>>
>> Channel closer to the destination is stopped first which sounds
>> reasonable, but on playback you ignore timeout from A, on capture you
>> ignore the timeout from B.
> 
> Please refer above explanation.
> 
>> Still the issue sounds like exactly what I have described. One of the
>> DMA is failing to drain because the IP is stopped?
> 
> As per our understanding, failing to stop the DMA by hardware is causing
> the issue.
>
>>
>>> Need find a right place to implement a work around only for AMD
>>> stoneyridge platform.
>>
>> Is this really only affecting stoneyridge platform? Are there other
>> platforms using drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c ?
>>
> This design is being used only in stoneyridge and Carrizo platforms.
> But only stoneyridge platform is productized.
> New design is implemented for later generations of APU series.

Right.

This version of ACP is only used with the designware I2S IP?

I would try to find a way to force stop the DMA in case the DAI has been
already stopped.

If this is not possible than the only solution is to do this in core, imho.

For that you would need a flag to say that the platform (DMA) needs the
DAI to be active when stopping it.

If the same ACP have problems with different DAIs, then it is a property
of the platform driver.
If the ACP only have problem against the designware I2S then it is a
link property.
If this ACP only used with the designware I2S then it is again, most
likely the property of the platform driver.

It is surely not a designware IP issue, trying to solve it there is wrong.

-- 
Péter
