Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D15EB907
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 05:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1DF826;
	Tue, 27 Sep 2022 05:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1DF826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664251145;
	bh=TGCYluSRz4/r9XWNJajgm1n0xeMhywoC9xzthlsoP+Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaePcIpFNvs4fEYZ1LM8grt4G4Dfryo53DYz4nfnJexy9rcVMJdM6Zr4pIR9iau31
	 p6ZL6IeIEyV/NpprJIF4C5s56ybQQkBkGTvU0XXL4oBa2eqUa/apKQO85TFyct93qR
	 vDEerPZXrxNZ36sqPaDT8CDhAmAsvII4y1PJf2tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E7E4F80496;
	Tue, 27 Sep 2022 05:58:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D1D2F8025E; Tue, 27 Sep 2022 05:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com
 [115.236.118.79])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 816FBF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 05:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 816FBF80166
Received: from [172.16.12.74] (unknown [58.22.7.114])
 by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 95CC468036D;
 Tue, 27 Sep 2022 11:57:53 +0800 (CST)
Message-ID: <678dcfcf-83f0-5969-9b55-79065c042116@rock-chips.com>
Date: Tue, 27 Sep 2022 11:57:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
 <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
 <YzHGPuajS54y1SV6@sirena.org.uk>
From: Jason Zhu <jason.zhu@rock-chips.com>
In-Reply-To: <YzHGPuajS54y1SV6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk8YVh1IHU1ISB1JSkxNSFUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRg6SQw4SD0fUQgDNQ88Pz8e
 OS0KCgFVSlVKTU1PSU5KS0xPSElOVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9CSkI3Bg++
X-HM-Tid: 0a837d1815522eb5kusn95cc468036d
Cc: sugar.zhang@rock-chips.com, alsa-devel@alsa-project.org, tiwai@suse.com,
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


在 2022/9/26 23:33, Mark Brown 写道:
> On Mon, Sep 26, 2022 at 09:52:34AM +0200, Pierre-Louis Bossart wrote:
>> On 9/26/22 03:34, Jason Zhu wrote:
>>> 在 2022/9/23 20:55, Mark Brown 写道:
>>>>> The data can not be lost in this process. So we attach VAD & PDM
>>>>> in the same card, then close the card and wake up VAD & PDM again
>>>>> when the system is goto sleep. Like these code:
>>>> This sounds like a very normal thing with a standard audio stream -
>>>> other devices have similar VAD stuff without needing to open code access
>>>> to the PCM operations?
>>> At present, only VAD is handled in this way by Rockchip.
> The point here is that other non-Rockchip devices do similar sounding
> things?

No.  Usually, the vad is integrated in codec, like rt5677, and is linked 
with DSP to

handle its data. If DSP detects useful sound, send an irq to system to 
wakeup and

record sound.  Others detect and analysis sound by VAD itself, like 
K32W041A.

>>>> Generally things just continue to stream the voice data through the same
>>>> VAD stream IIRC - switching just adds complexity here, you don't have to
>>>> deal with joining the VAD and regular streams up for one thing.
>>> Yes, this looks complicated. But our chip's sram which is assigned to VAD
>>>
>>> maybe used by other devices when the system is alive.  So we have to copy
>>>
>>> sound data in sram firstly, then use the DDR(SDRAM) to record sound data.
>> There are other devices that requires a copy of the history buffer from
>> one PCM device and a software stitching with the real-time data coming
>> from another PCM device. It's not ideal but not uncommon either, even
>> for upcoming SDCA devices, combining data from 2 PCM devices will be an
>> allowed option (with additional control information to help with the
>> stitching).
> If this is something that's not uncommon that sounds like an even
> stronger reason for not just randomly exporting the symbols and open
> coding things in individual drivers outside of framework control.  What
> are these other use cases, or is it other instances of the same thing?

Maybe in this case: One PDM is used to record sound, and there is two way

to move data. Use the VAD to move data to sram when system is sleep and

use DMA to move data when sytem is alive. If we seperate this in two audio

streams, we close the "PDM + VAD" audio stream firstly when system is alive

and open "PDM + DMA" audio stream. This process maybe take long time

that PDM FIFO will be full and lost some data. But we hope that data 
will not

be lost in the whole proces. So these must be done in one audio stream.

> TBH this sounds like at least partly a userspace problem rather than a
> kernel one, as with other things that tie multiple audio streams
> together.

Yes, userspace can tie multiple audio stream together to avoid doing

complicated things in kernel. This is good method!

