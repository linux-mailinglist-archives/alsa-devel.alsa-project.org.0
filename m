Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD919E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 15:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2D71A96;
	Fri, 10 May 2019 15:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2D71A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557495378;
	bh=R117pOVt5X2RD8Uhnq/h1m7KGv3ziAulKy982LLWbrE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crnYwGB9ZIfTyAM3Fad83ZeE4vstuLAkFyXb2Obi60wMy2enCPSIxaKOL9uhGl9ni
	 K7vhp88Ajj7u7hYRKZL8g7j8Xj8ZpAeZB81/cOGhnFlgBiLm0h4Cb/0FiMPum9ARIO
	 AQvMpE+uC756Vz1gXfJRVP2joC7NfHPp7ViFjwrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFA1F896FD;
	Fri, 10 May 2019 15:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 934D4F896FD; Fri, 10 May 2019 15:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 727A6F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 727A6F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 06:34:24 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2019 06:34:24 -0700
Received: from khbyers-mobl2.amr.corp.intel.com (unknown [10.251.29.37])
 by linux.intel.com (Postfix) with ESMTP id CAB16580482;
 Fri, 10 May 2019 06:34:23 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <s5h7eayn5or.wl-tiwai@suse.de>
 <73c6dd27-895a-adba-a4ef-2992266fcc48@linux.intel.com>
 <s5hlfzempf0.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1e7e1908-a813-6c9b-5b88-122864d3a372@linux.intel.com>
Date: Fri, 10 May 2019 08:34:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hlfzempf0.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Fix build error with
 CONFIG_SND_SOC_SOF_NOCODEC=m
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/10/19 8:04 AM, Takashi Iwai wrote:
> On Fri, 10 May 2019 14:56:29 +0200,
> Pierre-Louis Bossart wrote:
>>
>> On 5/10/19 2:12 AM, Takashi Iwai wrote:
>>> On Fri, 10 May 2019 04:36:57 +0200,
>>> YueHaibing wrote:
>>>>
>>>> Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m
>>>>
>>>> sound/soc/sof/core.o: In function `snd_sof_device_probe':
>>>> core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'
>>>>
>>>> Change SND_SOC_SOF_NOCODEC to bool to fix this.
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>
>>> This change would break things severely.  This won't allow to build it
>>> as a module any longer.
>>
>> Isn't this fixed already?
>> See the patch  'ASoC: SOF: core: fix undefined nocodec reference' and
>> Takashi's follow-up to fix the unused variable warning.
> 
> Possibly the problem still persists although I haven't seen through my
> local build tests with randconfig.  You can set SND_SOC_SOF=y and
> SND_SOC_NOCODEC=m, i.e. built-in sof-core while nocodec is a module.

YueHiabing, can you share the config and SHA1 so that we can double check?

If the problem persists, we can do something like

config SND_SOF_NOCODEC_SUPPORT
	bool "SOF nocodec mode support"

config SND_SOF_NOCODEC
	tristate

confir SND_SOC_SOF
	tristate
	select SND_SOF_NOCODEC if SND_SOF_NOCODEC_SUPPORT

that way you propagate the required dependencies

> 
> Takashi
> 
>>>
>>> A better fix would be to somehow restrict the SND_SOC_SOF_NOCODEC to
>>> align with SND_SOC_SOF, i.e. disallow SND_SOC_SOF=y &&
>>> SND_SOC_SOF_NOCODEC=m.  Because of the complex mix of select and
>>> depends-on in SOF, I'm afraid that it's not that trivial, though.
>>> There might be something I overlooked, hopefully...
>>>
>>> An easier alternative would be to replace
>>> IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC) with
>>> IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC).  This assures the condition
>>> at the build time, although the error at probe might be a surprising
>>> to some users that don't know this hidden dependency.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>
>>>> ---
>>>>    sound/soc/sof/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
>>>> index b204c65..9c280c9 100644
>>>> --- a/sound/soc/sof/Kconfig
>>>> +++ b/sound/soc/sof/Kconfig
>>>> @@ -44,7 +44,7 @@ config SND_SOC_SOF_OPTIONS
>>>>    if SND_SOC_SOF_OPTIONS
>>>>      config SND_SOC_SOF_NOCODEC
>>>> -	tristate "SOF nocodec mode Support"
>>>> +	bool "SOF nocodec mode Support"
>>>>    	help
>>>>    	  This adds support for a dummy/nocodec machine driver fallback
>>>>    	  option if no known codec is detected. This is typically only
>>>> -- 
>>>> 2.7.4
>>>>
>>>>
>>>>
>>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
