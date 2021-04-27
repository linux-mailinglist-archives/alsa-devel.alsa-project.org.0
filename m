Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EC36BF61
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 08:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5236F16F6;
	Tue, 27 Apr 2021 08:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5236F16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619505645;
	bh=2s8y4bCfjeSiKZ6D8YDox30nVmr4T5FAYDDxpUAEtm8=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAYmxDB76svo2X1AUoirh1Vfqp6hCctep1h9QETQf1XSk1vrSjUuyo2Q6t57Li9T+
	 597sYpgZd3fM/10n67C4fOaYZDj6+sWvQyiXn5GRmWFTvX1Jr6iJ/ykH+e2WkdF0Xq
	 WQi8rcDKrIIdJoyigOGANtIy7rlrrGhdssVhDpuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD979F8012A;
	Tue, 27 Apr 2021 08:39:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B331F801EC; Tue, 27 Apr 2021 08:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FFF1F800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 08:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FFF1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UzGdvQoQ"
Received: by mail-lf1-x136.google.com with SMTP id x20so61732950lfu.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0nfqSqzuzoOBPv7mcSdmp3bMcP96BtuMMzceqfKSHY=;
 b=UzGdvQoQPnzaqSYnWcX+X0MPOC6GeNU8dTbot/n97HOMCsdPm0TvNoL8/hxZ6bhBYO
 mMOHy10IgtT5Oo75J275fTxnQ0rO4vF6UjmHuEWcz7cN+A8SIXItnLYaOM/eCrOq0PBS
 Hk8oL/+YUpb5Dgy1JXkOyQcq6NZLP7lPz6NimY04Ad0kSWvcZ1nvCGUQvdxjniX92BT4
 HdnyKEvpgss1Xats7Byg2sgL6j3LduTuEA8DbR0yPVjl+a5HZBZvFAfBcnOUysiXQMLd
 SP3rrCjD2FPBy8NLSzwCW3Z2W3PH7tIR1l0l7tJtihR3LHq0pR/BgxeaL+VM75+EkQwn
 Z1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0nfqSqzuzoOBPv7mcSdmp3bMcP96BtuMMzceqfKSHY=;
 b=WoVDcrxsUwk0UCIe5d4JRV8smYr5Ev4EGWcPtMd3T576cXdb2fUc696ubCk1YgHftR
 aRpbvwKsf83eBt2TuPFtG3qPsWj5lI8ICCVkPxryqfU7u9UJvFy10f9WmlejMxOfHRRx
 7ZqNafwmPZbSunBEeeyTbu8Q+Ol2F5RgDws5fH2Vw4R728vHY2Xj9gqiHA713f7Y2GHu
 fX+oz70U2GA4pH/EQPIHubL05KQH0dwnn6rxanYUoHKNplR8O2kpRGnQczVnSYLuFUh3
 GDqykJ0G6saDq2Vf/h6+VvvIpBRhGKntSsauQTSQ2HhNrFsp2r/Yi8hpoCJiMh64LIty
 QX9g==
X-Gm-Message-State: AOAM531LKXrEjkI2BakYze5Yok0HA5J3OFl8mQ1VgJOEwQwWWMdK0ThO
 d/rBb9IzBLTEFF+PiKo65eU=
X-Google-Smtp-Source: ABdhPJx+KO56jhsdLthXdxaC8oop0qjrOY5t1e/D5vODde0kO5v9CUu/8o/jO+hLXZWTIQjXbKaQTA==
X-Received: by 2002:a05:6512:410:: with SMTP id
 u16mr15664838lfk.641.1619505538497; 
 Mon, 26 Apr 2021 23:38:58 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id w23sm1621933lfu.132.2021.04.26.23.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 23:38:57 -0700 (PDT)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
Date: Tue, 27 Apr 2021 09:40:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
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



On 4/26/21 3:21 PM, Mukunda,Vijendar wrote:

>>> What is the design constraint here - can't we fix the design?  Or is it
>>> a hardware design constraint (presumably broken signalling between the
>>> I2S and DMA blocks)?
> 
> Its a hardware design constraint.
> 
> 
> I2S driver is not directly exposing DMA interface to host.
> ACP 2.x has unique design where ACP driver controls data flow between
> host and I2S as mentioned above.
> ACP IP has different IP blocks within it which includes I2S controller
> and DMA controller.
> 
> ACP DMA Driver is responsible for DMA transactions between system memory
> and I2S controller.It uses two step DMA mechanism to copy data between
> system memory <-> ACP SRAM and ACP SRAM <-> I2S FIFO for
> playback/capture use cases.
> ACP driver program two DMA channels for DMA transfers between System
> memory & I2S FIFO.
> 
> ACP DMA driver isn't general purpose DMA controller driver where we can
> implement terminate_all() API.
> 
> I2S controller DMA transactions are tightly coupled with ACP DMA
> controller.
> while DMA transfer ongoing between ACP SRAM and I2S FIFO, Stopping I2S
> DMA prior to ACP DMA stop resulting DMA Channel stop failure.
> Its not related to I2S FIFO flushing related handling.
> Once the DMA channel failure observed during the closure of the stream,
> when again new stream opened, DMA won't progress at all.

Thanks for the explanation.
This is not upstream, right?

What is still not clear to me is which channel fails?
A) the DMA between ACP FIFO and the I2S
B) the DMA between ACP FIFO and system memory

in acp-pcm-dma.c on stop you have a busy loop (10000 iterations) to
check if the channel is in fact stopped in response to the cleared run,
IOCEn bits and the set Rst bit.

Channel closer to the destination is stopped first which sounds
reasonable, but on playback you ignore timeout from A, on capture you
ignore the timeout from B.

Still the issue sounds like exactly what I have described. One of the
DMA is failing to drain because the IP is stopped?

> Need find a right place to implement a work around only for AMD
> stoneyridge platform.

Is this really only affecting stoneyridge platform? Are there other
platforms using drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c ?

-- 
Péter
