Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A05E97BC
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 03:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865AE41;
	Mon, 26 Sep 2022 03:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865AE41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664156121;
	bh=6RPp4J7xqSzGlul+DzQ9epAqw7DClU621C6ECV9kE8I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQ1/jCebGtMwehSr82G/MTb90KV5Bwomek2KUp4oG/3V8ReN0jy4G3BGemdWjU87D
	 524XFn72plzHWZ8ueyLtoH+9ZPdSFlgy/36Cr9nfWfLmXE1C6h2EvB+Er9HV6FRgmX
	 epqdbc+9GndXJbhc6Q07Zs2QDjTmE/TgcXdHz9k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BFEF80115;
	Mon, 26 Sep 2022 03:34:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46FACF8027D; Mon, 26 Sep 2022 03:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com
 [115.236.118.79])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415E1F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 03:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415E1F8011C
Received: from [172.16.12.74] (unknown [58.22.7.114])
 by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 8A37D680486;
 Mon, 26 Sep 2022 09:34:05 +0800 (CST)
Message-ID: <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
Date: Mon, 26 Sep 2022 09:34:05 +0800
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
From: Jason Zhu <jason.zhu@rock-chips.com>
In-Reply-To: <Yy2s2PA/C1ngeb//@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUJPVkJLTRoZTEgYHxkZGVUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pj46Lzo4CD0oCAoeDCIhFQEC
 GlEwCkNVSlVKTU1PSk5NS09NSU9MVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhDSk43Bg++
X-HM-Tid: 0a83776e11a32eb5kusn8a37d680486
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


在 2022/9/23 20:55, Mark Brown 写道:
> On Wed, Sep 21, 2022 at 10:37:06AM +0800, Jason Zhu wrote:
>> 在 2022/9/20 20:47, Mark Brown 写道:
>>> On Tue, Sep 20, 2022 at 11:45:45AM +0800, Jason Zhu wrote:
>>>> Sometimes we need to make some dais alive when close the card, like
>>>> VAD, so these functions must be exported so that they can be called.
>>> I'm not sure I fully understand the use case here - why wouldn't
>>> the core know about the audio stream being kept active?  For
>>> something like VAD I'd expect this to be just working like a
>>> normal audio path, if there's a DSP consuming the audio stream
>>> then it'll keep everything open.  If there is a good use case I
>>> suspect it'll be clearer if you send the users along with this
>>> patch.
>> Thanks. For example, we use the VAD(Voice Activity Detect) & PDM(
>> Pulse Density Modulation) to record sound>. The PDM is used to
>> record and copy data to DDR memory by DMA when the system is alive.
>> The VAD is used to detect voice from PDM and copy data to sram
>> (The sram is small) when the system is sleep. If the VAD detect
>> specific sound, wake up the system and continue to record sound.
>> The data can not be lost in this process. So we attach VAD & PDM
>> in the same card, then close the card and wake up VAD & PDM again
>> when the system is goto sleep. Like these code:
> This sounds like a very normal thing with a standard audio stream -
> other devices have similar VAD stuff without needing to open code access
> to the PCM operations?


At present, only VAD is handled in this way by Rockchip.

>
>> When the system is waked up, open the sound card. The data in sram
>> is copied firstly and close the vad. Then use the DMA to move data
>> to DDR memory from PDM.
> Generally things just continue to stream the voice data through the same
> VAD stream IIRC - switching just adds complexity here, you don't have to
> deal with joining the VAD and regular streams up for one thing.


Yes, this looks complicated. But our chip's sram which is assigned to VAD

maybe used by other devices when the system is alive.  So we have to copy

sound data in sram firstly, then use the DDR(SDRAM) to record sound data.

