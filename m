Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E258197EB4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 16:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C89AE886;
	Mon, 30 Mar 2020 16:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C89AE886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585579498;
	bh=m5TYMgfUoEWicXyh+NeGO8SgyYzJ7L0RIf6fDUCiXtA=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyB1mCym4FcvodCtRL8M3Sc9kOuoy4nKT2cMDwwrbCO+9dqEcmKLniOxVSmHST8kl
	 leNE+fk7K+evY1fLuPgp+WJNJeS1xRFwMQP2oRt7GsmeYHBLwuZiSYMRmRCpUI5OOi
	 twJgVMyBXfG8XyjHmnIf+aCH8CTQhQlmKbVZPmMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA6A5F8014A;
	Mon, 30 Mar 2020 16:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FFD1F80148; Mon, 30 Mar 2020 16:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 837CFF800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 16:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 837CFF800AA
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 2DC72A1EE2D8E;
 Mon, 30 Mar 2020 16:43:11 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIwnxvfq4MXb; Mon, 30 Mar 2020 16:43:06 +0200 (CEST)
Received: from [192.168.105.191] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id BF5DAA1EC7FDD;
 Mon, 30 Mar 2020 16:43:05 +0200 (CEST)
Subject: Re: Functionality of pcm_notify in snd-aloop?
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
 <61d837f1-de1a-7aa6-ca8f-d0cfaa36ea69@perex.cz>
 <28a05a44-55bf-1831-aa3c-875e0499caea@ivitera.com>
Message-ID: <28063dd1-71ab-a313-04b8-f4d97312b1b5@ivitera.com>
Date: Mon, 30 Mar 2020 16:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <28a05a44-55bf-1831-aa3c-875e0499caea@ivitera.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


Dne 26. 03. 20 v 18:59 Pavel Hofman napsal(a):
> Dne 26. 03. 20 v 18:44 Jaroslav Kysela napsal(a):
>> Dne 26. 03. 20 v 18:19 Pavel Hofman napsal(a):
>>> Hi,
>>>
>>> Please how is the module params pcm_notify supposed to be used, to do
>>> what the documentation says: Break capture when PCM format/rate/channels
>>> changes?
>>>
>>> Breaking capture side operation when the playback side changes the
>>> params is very useful, but I cannot find a way to use this param
>>> properly. When the capture side is open, the playback side cannot use a
>>> different parameter than the one currently used by the capture side (the
>>> configuration space is limited)
>>
>> Really? Then it's a bug introduced by the last changes.
>>
>> If you look to sources:
>>
>>       if (get_notify(dpcm))
>>                 runtime->hw = loopback_pcm_hardware;
>>         else
>>                 runtime->hw = cable->hw;
>>
>> And:
>>
>>       if (!(cable->valid & ~(1 << substream->stream)) ||
>>             (get_setup(dpcm)->notify &&
>>              substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
>>                 params_change(substream);
>>
>> So the functionality should be there.
> 
> I am using older kernels (4.15 and 3.16), but this is an old functionality.
> 
> modprobe snd-aloop pcm_substreams=1 pcm_notify=1,1
> 

Please is there any way to solve this issue? Thanks a lot for your patience.

Best regards,

Pavel.
