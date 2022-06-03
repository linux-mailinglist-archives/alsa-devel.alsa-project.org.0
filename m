Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A153CCC7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 17:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47BB817FD;
	Fri,  3 Jun 2022 17:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47BB817FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654271854;
	bh=do45Ry6X9w4Wqfs8CtgSTjGxfBd0qYD0PrlxAw2iZnk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFo3qAOjj5kAlCXEcDRSAOtMT8StZZptu6MHcwN7FLehm3VCQlw8ODE76n8X0R7J9
	 U9S3uAQzYg96lqq2nU9TByBLoXKIo1DHwWpc7NkdeeYDM59e8E0Ast1k5X929Ul2/7
	 DA7TobiWKi7fnJRtZOxm3ZOLGuSCGQw2hDertA5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DFB2F80089;
	Fri,  3 Jun 2022 17:56:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE65F804CC; Fri,  3 Jun 2022 17:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96DAEF80089;
 Fri,  3 Jun 2022 17:56:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D6E56A0046;
 Fri,  3 Jun 2022 17:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D6E56A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1654271785; bh=6e9Ct4bSSCSd91ZeU6ZWmWOgS1KC09/SBlahj7U2lTw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nBTklufZwp27WvKJu+3dQP86EFobdKdvbwJmMa7048gBsN59UbxaROwIecI2I8Q87
 YyeH1qK6NZ4v2lj6utle0dGuQDfcyI76KcXRVtrqE5zKu3ObSiiguyX1r3iwsZ5i1V
 ULcnB/+YOg2nL/Sh2YkSbqlsR13OCWKp+ccfhL+U=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  3 Jun 2022 17:56:19 +0200 (CEST)
Message-ID: <838d6161-5b17-1fd7-d864-9e0f13bf2ef5@perex.cz>
Date: Fri, 3 Jun 2022 17:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Sound-open-firmware] jack detection via input/event on linux
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hede <alsa426@der-he.de>
References: <d8b21eb11013b6dd1e90e425bd808951@der-he.de>
 <fe472e98-82b8-bba4-364a-930d8616b4e2@perex.cz>
 <31258284cefb38127e84b2d098f8e2aa@der-he.de>
 <cb35ce57-7696-3edb-459a-d2e8557a4748@perex.cz>
 <571618d8-fdd8-eaab-a8e8-c26857e97580@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <571618d8-fdd8-eaab-a8e8-c26857e97580@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org
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

On 03. 06. 22 17:48, Pierre-Louis Bossart wrote:
> [Adding alsa-devel, Mark and Takashi to this thread]
> 
> On 6/3/22 08:33, Jaroslav Kysela wrote:
>> On 03. 06. 22 13:17, hede wrote:
>>> Am 03.06.2022 11:34, schrieb Jaroslav Kysela:
>>>> PA/PW use only ALSA controls at the moment - thus you should define
>>>> JackControl as defined in use-case.h. But it seems that the driver
>>>> does not create or publish the ALSA jack control (I see only
>>>> "iface=CARD,name='HDMI/DP,pcm=2 Jack'" jack controls for HDMI).
>>>>
>>>>                      Jaroslav
>>>
>>> Ah, thank you Jaroslav. That's the hint I was searching for atm.
>>> JackDev vs. JackControl. I had a vague guess on this but now you made it
>>> certain.
>>>
>>> Maybe I should take a look into the driver directly.
>>
>> It seems that many ASoC drivers do not create kctls - the argument pins
>> is zero in the snd_soc_card_jack_new() call. The SND_JACK_HEADSET should
>> be remapped to kctl in sound/soc/intel/boards/sof_rt5682.c, too.
> 
> Did you mean something like the patch below Jaroslav? If yes, most of
> the Chromebook machine drivers are missing this remapping. That would
> also explain why the jack detection didn't work on my GLK test device,
> despite a UCM file that looked good...

Yes, it looks like a way to go. It seems that the drivers were tested only 
with the CRAS audio server. Note that pulseaudio can be run with the user 
permissions only - thus the input devices may not be reachable.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
