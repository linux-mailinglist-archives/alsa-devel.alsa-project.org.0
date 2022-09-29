Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432A5EEAA4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 02:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B20846;
	Thu, 29 Sep 2022 02:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B20846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664412845;
	bh=zyy0HSt5WPEgN6x81rMv1csR+fMD3+FirDrexwPwQf4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k39QwDrZGBGLkhHXt329jQ485/Ku1hBw7XOInhChD4SWrqskRtlWVLqhf0zekvBaN
	 mG1GDHGlOVtn5/kc1UJzaTXtw/8TMQs7BJWkKGZ6vDRjkqjqvhq8DwmDF3DK8OnOKY
	 VEFcvjIN73GBTh3b3j070Qm8oxlhRGt8qnU4cNH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CD61F804B3;
	Thu, 29 Sep 2022 02:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EFB3F80310; Thu, 29 Sep 2022 02:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com
 [115.236.118.79])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9CD0F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 02:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CD0F80109
Received: from [172.16.12.74] (unknown [58.22.7.114])
 by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 550C268025D;
 Thu, 29 Sep 2022 08:52:54 +0800 (CST)
Message-ID: <3125964e-5e19-cf2a-c655-c7478b8ecccf@rock-chips.com>
Date: Thu, 29 Sep 2022 08:52:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
To: Mark Brown <broonie@kernel.org>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
 <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
 <YzHGPuajS54y1SV6@sirena.org.uk>
 <678dcfcf-83f0-5969-9b55-79065c042116@rock-chips.com>
 <YzQ1hpJ753Zy5k+a@sirena.org.uk>
From: Jason Zhu <jason.zhu@rock-chips.com>
In-Reply-To: <YzQ1hpJ753Zy5k+a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH04YVk0YQh0ZSxpNSh8dT1UTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6Pgw*Lj0aPgwJHRxMASM1
 IQJPCRZVSlVKTU1PT0pJTExOS0xKVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9CT003Bg++
X-HM-Tid: 0a8386bb705b2eb5kusn550c268025d
Cc: sugar.zhang@rock-chips.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com
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


在 2022/9/28 19:52, Mark Brown 写道:
> On Tue, Sep 27, 2022 at 11:57:53AM +0800, Jason Zhu wrote:
>> 在 2022/9/26 23:33, Mark Brown 写道:
>>> On Mon, Sep 26, 2022 at 09:52:34AM +0200, Pierre-Louis Bossart wrote:
>>>> On 9/26/22 03:34, Jason Zhu wrote:
>>>>> 在 2022/9/23 20:55, Mark Brown 写道:
>>>>>>> The data can not be lost in this process. So we attach VAD & PDM
>>>>>>> in the same card, then close the card and wake up VAD & PDM again
>>>>>>> when the system is goto sleep. Like these code:
>>>>>> This sounds like a very normal thing with a standard audio stream -
>>>>>> other devices have similar VAD stuff without needing to open code access
>>>>>> to the PCM operations?
>>>>> At present, only VAD is handled in this way by Rockchip.
>>> The point here is that other non-Rockchip devices do similar sounding
>>> things?
>> No.  Usually, the vad is integrated in codec, like rt5677, and is linked
>> with DSP to
>> handle its data. If DSP detects useful sound, send an irq to system to
>> wakeup and
>> record sound.  Others detect and analysis sound by VAD itself, like
>> K32W041A.
> What I mean here is that you're missing my point.  The deferring of full
> wake word recognition to a secondary algorithm running somewhere else is
> a pretty common design.
>
>>> If this is something that's not uncommon that sounds like an even
>>> stronger reason for not just randomly exporting the symbols and open
>>> coding things in individual drivers outside of framework control.  What
>>> are these other use cases, or is it other instances of the same thing?
>> Maybe in this case: One PDM is used to record sound, and there is two way
>> to move data. Use the VAD to move data to sram when system is sleep and
>> use DMA to move data when sytem is alive. If we seperate this in two audio
>> streams, we close the "PDM + VAD" audio stream firstly when system is alive
>> and open "PDM + DMA" audio stream. This process maybe take long time
>> that PDM FIFO will be full and lost some data. But we hope that data will
>> not be lost in the whole proces. So these must be done in one audio
>> stream.
> I'd have exepected that any handover be done such that the low power
> wake word stream is running concurrently with the main audio stream for
> some period of time, possibly until the sync between the two has been
> worked out, and that data would be being read out of the wake word
> stream while the full stream is starting up.  As you say I'd expect that
> otherwise you'll run into trouble with dropouts.  I don't see how doing
> that handover would require that we export any symbols though, if there
> is any kernel support needed it should be handled in the framework.
Thank you very much. I will think about how to support it in the framework.
