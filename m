Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E136AC19
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 08:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8F71686;
	Mon, 26 Apr 2021 08:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8F71686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619418007;
	bh=djBHA1+VprcCIG3wpvbWG1xDnttLt6YE/mJ1u8Ahcmk=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=If+64ch9KxLDWVRqTGggeXKjPh1PZq/+hPdTd+IGfNZDtLMZxjWLGv6K0txG8dlD4
	 g6xmXDqRiWEg29Wq2R+KVjfp7LTBQSIvNI/PVuoroMMyqRS9JWEegRjaUjgjWWYvgh
	 Mbv5fKLYEyKPVeimH2ZPjDEdzI5cW2aDbtcrmqVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE31F80171;
	Mon, 26 Apr 2021 08:18:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341B4F8016C; Mon, 26 Apr 2021 08:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E6B2F800E3
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 08:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E6B2F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UH+91n2G"
Received: by mail-lf1-x136.google.com with SMTP id 4so26647736lfp.11
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 23:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3/FI0KZmj3/CnqR1rFz6WI/MezYTXitzSUOb5NDvbRs=;
 b=UH+91n2GgKGYLhNJGgbWrMmFMSQp7+hB3JdqzI4Z5Jpt48DTVc0Uc2QgUpeJ1cntOz
 dv4+aLPU7I5FYp0feRXoQ4SXU+n0H55FzFX55kylUeOSDN29GvtzaRrydnWqJz/jBVNq
 zxHjCv/F/bKptm6xJzyhUW4k2Zk8m0GgWo+GT1rWCODNSraG9D+NvQhLqyg/cqVnjNxx
 CZG0H1Eni+ylpIxmj0iS+qRGM6sNz1rxuAcfoG2DjhzUHanGO29Lwga8fdgvpYTez5Rt
 kfi2gWd1KKSgj5iRej3rY5aeZ/JPX+mb2BXKfV5Bh3p7OGbGbu9YIWTIhbLFECRgVZeQ
 cxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3/FI0KZmj3/CnqR1rFz6WI/MezYTXitzSUOb5NDvbRs=;
 b=SEcB8BBEUqWFrF7j9mpgFQVueIE+r1jUXJ3RWgghugs0xj4cCAiqgiC8JJZFwbSMpr
 mcZYNP6aA9tRmr7Ox3VqgZoQyuK2UCFvPzYCf7FPMxQOfVYuAnUC3hWfh0D4g6yd/Dkn
 E6fnm+VmHONH7/warbdaIItgoGS5pyiQFPvLzBYsNcwMOhYhHCWHaHPrkEe6aC9cuLuu
 Mc4Yk9YgEGsN9JfBXI62F3w/epCc0ggM9FGhdn1m8PFt2RmVJ8l/HgLoclA7O1SNfJ82
 tHfEWW3AGrSDupwk04jE7MRu5MVCfyaxK59SSrAHQKPTwLSpSfPOMU0z1NghWgew/6Cd
 TVDw==
X-Gm-Message-State: AOAM531/CLzWlqSaXVx7ZJ0A8AJ0bsWSCvDhvFcrhBxa+jyNdPFYKWAd
 tTvByyKgbCLAFgKZ3f+34Zw=
X-Google-Smtp-Source: ABdhPJxdnk6vol2grAYYXH63/e4b+6M+0f15V1fJOR5NpMu07HNj6554KPRrwkxAZObzYkxVzgLIIQ==
X-Received: by 2002:ac2:5dc9:: with SMTP id x9mr11800050lfq.215.1619417910333; 
 Sun, 25 Apr 2021 23:18:30 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id v8sm1413972ljn.17.2021.04.25.23.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Apr 2021 23:18:29 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
Date: Mon, 26 Apr 2021 09:19:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423164617.GG5507@sirena.org.uk>
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



On 4/23/21 7:46 PM, Mark Brown wrote:
> On Fri, Apr 23, 2021 at 09:54:38PM +0530, Vijendar Mukunda wrote:
> 
>> For CZ/StoneyRidge platforms, ACP DMA between ACP SRAM and
>> I2S FIFO should be stopped before stopping I2S Controller DMA.
> 
>> When DMA is progressing and stop request received, while DMA transfer
>> ongoing between ACP SRAM and I2S FIFO, Stopping I2S DMA prior to ACP DMA
>> stop resulting DMA Channel stop failure.
> 
> This again...  copying in Peter for the sequencing discussion.  If we
> need to do this I'm not convinced that bodging it in the driver is a
> good idea, and especially not deferring it outside of the trigger
> operation - for example on a suspend or pause we won't actually do a
> shutdown() so the trigger will end up not happening which seems like it
> may cause problems.

It will certainly leave the i2s running and can lead to hard to explain
issues

> We'd probably be better off with the core knowing
> what's going on and being able to reorder the callbacks although
> designing an interface for that seems a bit annoying.

I agree, it would be better to have some sort of flag which tells the
core that there is an integration issue between the DMA and peripheral.
I believe this is only affecting playback?

>> This issue can't be fixed in ACP DMA driver due to design constraint.
> 
> What is the design constraint here - can't we fix the design?  Or is it
> a hardware design constraint (presumably broken signalling between the
> I2S and DMA blocks)?

From the description my guess is that stop on the DMA want to flush it's
FIFO (complete the in progress packet, segment). Since the peripheral is
stopped it will not pull in more data -> the DMA will time out internally.

The question: how the ACP DMA driver's terminate_all is implemented? It
can not really wait for the DMA to stop, we can not use
terminate_all_sync() in trigger, it must just set a stop bit and make
sure at synchronize() time that it has stopped, right?

What happens if the time between the DMA stop and the DAI stop is less
then it would take to flush the DMA FIFO? You would have the same issue,
but in a rather hard to reproducible way?

As sidenote: TI's k3-udma initially had similar issue at the design
phase on the playback side which got solved by a flush bit on the
channel to detach it from the peripheral and set it to free run to drain
w/o peripheral.
On capture however I need to push a dummy 'drain' packet to flush out
the data from the DMA (if the stop happens when we did not have active
descriptor on the channel).

With a flag to reorder the DMA/DAI stop sequence it might work most of
the time, but imho it is going to introduce a nasty time-bomb of failure.
Also your DAI will underflow instead of the DMA error.

-- 
Péter
