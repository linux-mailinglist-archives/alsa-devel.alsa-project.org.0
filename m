Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805B19D84
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 14:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E5A1A96;
	Fri, 10 May 2019 14:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E5A1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557493127;
	bh=xHa99tRBv5IysNTQFKn4oIfPfWgFeMLbcSKWxsShuT4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhFaeTfNrtzUx2Z/vpVIpdRuY3aCMN2yJy0+hLJ08XOSXTyklq+lmZPCD47LR+6ZO
	 KjOSj2m9cOemZWR5+X2qfDE52n4zfDWTcDAyhFJbvTFw/UyArM6BeEGI1jfm2Te/IF
	 8xpdMUXoRv4mYD0dZ271pWFZu6fYDZvlu6FBIGV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEBEFF8970E;
	Fri, 10 May 2019 14:57:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7DE9F896FD; Fri, 10 May 2019 14:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,
 RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92AA6F80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 14:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AA6F80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 05:56:51 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 10 May 2019 05:56:50 -0700
Received: from khbyers-mobl2.amr.corp.intel.com (unknown [10.251.29.37])
 by linux.intel.com (Postfix) with ESMTP id 80080580482;
 Fri, 10 May 2019 05:56:49 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, YueHaibing <yuehaibing@huawei.com>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <s5h7eayn5or.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73c6dd27-895a-adba-a4ef-2992266fcc48@linux.intel.com>
Date: Fri, 10 May 2019 07:56:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h7eayn5or.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
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

On 5/10/19 2:12 AM, Takashi Iwai wrote:
> On Fri, 10 May 2019 04:36:57 +0200,
> YueHaibing wrote:
>>
>> Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m
>>
>> sound/soc/sof/core.o: In function `snd_sof_device_probe':
>> core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'
>>
>> Change SND_SOC_SOF_NOCODEC to bool to fix this.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> This change would break things severely.  This won't allow to build it
> as a module any longer.

Isn't this fixed already?
See the patch  'ASoC: SOF: core: fix undefined nocodec reference' and 
Takashi's follow-up to fix the unused variable warning.

> 
> A better fix would be to somehow restrict the SND_SOC_SOF_NOCODEC to
> align with SND_SOC_SOF, i.e. disallow SND_SOC_SOF=y &&
> SND_SOC_SOF_NOCODEC=m.  Because of the complex mix of select and
> depends-on in SOF, I'm afraid that it's not that trivial, though.
> There might be something I overlooked, hopefully...
> 
> An easier alternative would be to replace
> IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC) with
> IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC).  This assures the condition
> at the build time, although the error at probe might be a surprising
> to some users that don't know this hidden dependency.
> 
> 
> thanks,
> 
> Takashi
> 
> 
>> ---
>>   sound/soc/sof/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
>> index b204c65..9c280c9 100644
>> --- a/sound/soc/sof/Kconfig
>> +++ b/sound/soc/sof/Kconfig
>> @@ -44,7 +44,7 @@ config SND_SOC_SOF_OPTIONS
>>   if SND_SOC_SOF_OPTIONS
>>   
>>   config SND_SOC_SOF_NOCODEC
>> -	tristate "SOF nocodec mode Support"
>> +	bool "SOF nocodec mode Support"
>>   	help
>>   	  This adds support for a dummy/nocodec machine driver fallback
>>   	  option if no known codec is detected. This is typically only
>> -- 
>> 2.7.4
>>
>>
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
