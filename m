Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B52672FEA9D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 13:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3622E18EE;
	Thu, 21 Jan 2021 13:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3622E18EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611233400;
	bh=ODyCx66BQOBtlne5bjvYQyPw3yBnd7+Be38gfBGtfWw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvHfZVbpp5qf9AKn36XOlWk29vMJ8hf+9kmYtGLyFdHWXwrh89QaVLXJE/5n9uWiX
	 vNxNgwa56CT70H4Ikkp6T1I3VSdfwxCO4ChPQCML/QDKOrZ6EEYvMdNXvP1iFfgkAB
	 7shkn62rlJTqF/k6n209W8+WusBY6NCx2OUZNmgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAEFAF80257;
	Thu, 21 Jan 2021 13:48:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FC4F80257; Thu, 21 Jan 2021 13:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0568F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 13:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0568F80162
Received: from [123.112.70.0] (helo=[192.168.0.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l2ZNj-0003BA-VY; Thu, 21 Jan 2021 12:48:22 +0000
Subject: Re: [RFC][PATCH v4 0/4] design a way to change audio Jack state by
 software
To: Takashi Iwai <tiwai@suse.de>
References: <20210111130557.90208-1-hui.wang@canonical.com>
 <e4f811c2-6845-529f-0e21-fc3bb1fb8a84@canonical.com>
 <s5h7do7ekco.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <c7bdaf3a-5e76-7587-5f8a-5946cb2f4029@canonical.com>
Date: Thu, 21 Jan 2021 20:48:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <s5h7do7ekco.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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


On 1/20/21 10:47 PM, Takashi Iwai wrote:
> On Wed, 20 Jan 2021 09:58:25 +0100,
> Hui Wang wrote:
>> Hi Takashi,
>>
>> Looks like no more comment from others, what is your opinion on the
>> patchset, is it ok to merge or need to do some change?
> I think the basic concept is OK.  Maybe we want to have a Kconfig to
> enable/disable this feature for users who want a slim kernel.
>
> And, it'd be better to reorganize the series.  It's not necessarily
> incremental form; e.g. patch 2 doesn't have to be an individual
> patch.
>
> I'll take a deeper look for each patch, too.
>
>
> thanks,
>
> Takashi
>
Got it, will address all comments, and will send a v5 to review soon.

Thanks,

Hui.

>
>
>
>> Thanks,
>>
>> Hui.
>>
>> On 1/11/21 9:05 PM, Hui Wang wrote:
>>> the changes in the v4:
>>>    - change the sound-core to sound and change the sound_core_debugfs_root
>>>      to sound_debugfs_root in the 0001-xxx.patch
>>>    - change kzalloc/kfree to kvzalloc/kvfree in the debugfs fops for
>>>      0001-xxx.patch and 0003-xxx.patch
>>>    - And if needed, I could squash 4 patches into 1 patch before merging.
>>>
>>> the changes in the v3 (for easy to review, divide change into 4 patches):
>>>    - address the comment about the snd_jack_report() and _snd_jack_report(),
>>>      the v2 design is hard to understand and is hard to review, in the v3,
>>>      separate the jack_report to snd_jack_report() and snd_jack_inject_report(),
>>>      hw jack events call snd_jack_report() as before, if a jack contains multi
>>>      jack_kctl and the jack_kctl's sw_inject is enabled, the status and the
>>>      related input-dev's events will not be reproted. The injection events call
>>>      snd_jack_inject_report(). This change is squashed to 0001-xxx.patch,  the
>>>      rest part of 0001-xxx.patch is same as v2.
>>>
>>>    - address the comment about folders'name in the 0002-xxx.patch, so far, drop
>>>      the '/', ',', '=' and ' ' from the folders' name.
>>>
>>>    - address the comment about adding more debugfs nodes in the 0003-xxx.patch,
>>>      it adds kctl_id, mask_bits, status and type.
>>>
>>>    - address the comment about save-n-restore jack's hw status in the
>>>      0004-xxx.patch, adding a hw_status_cache and save the last reported jack
>>>      hw event, once the sw_inject is disabled, will restore all jack_kctl's
>>>      state under the same snd_jack with hw_status_cache.
>>> [snip]
>>>
>>>
>>> the changes in the V2:
>>>    - using debugfs instead of sysfs
>>>    - using jack_ctrl to create a folder instead of snd_jack, since ASoC drivers
>>>      could create multi jack_ctrls within a snd_jack
>>>    - create a folder for each jack_ctrl instead for all jack_ctrls
>>> [ snip ]
>>>
>>>
>>> Hui Wang (4):
>>>     alsa: jack: implement software jack injection via debugfs
>>>     alsa: jack: adjust jack_kctl debugfs folder's name
>>>     alsa: jack: add more jack_kctl debugfs nodes
>>>     alsa: jack: implement save-and-restore for jack's hw status
>>>
>>>    include/sound/core.h |   2 +
>>>    include/sound/jack.h |   1 +
>>>    sound/core/init.c    |   7 +
>>>    sound/core/jack.c    | 352 ++++++++++++++++++++++++++++++++++++++++++-
>>>    sound/core/sound.c   |   8 +
>>>    5 files changed, 366 insertions(+), 4 deletions(-)
>>>
