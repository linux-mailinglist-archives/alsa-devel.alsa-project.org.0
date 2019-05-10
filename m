Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF219DE5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 15:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D771948;
	Fri, 10 May 2019 15:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D771948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557493918;
	bh=mA7lF7KCqbx8C1ns1PWpCTbpE2AKKM14KchxubZ4+lc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5geGCs1XJjDK96ON3dQkffCWhq8EyAFcnhNLtyPjI8Bq723Nf+iougn8cXA/ho69
	 lkCHD5O8IfwaMHrMQruhUHk0Yzkmkl7ASFA1L+Q35F0sdSu1co6Cn7X+vxIS/7fz7U
	 D3HJHtWRP2MpJRMnvOCGZEOrwzdnQQxXvd7IwzQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AB3F896FD;
	Fri, 10 May 2019 15:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BEE9F896FD; Fri, 10 May 2019 15:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B13CF8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B13CF8073C
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5964817C1004EFD50784;
 Fri, 10 May 2019 21:10:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 10 May 2019
 21:10:00 +0800
To: Takashi Iwai <tiwai@suse.de>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <s5h7eayn5or.wl-tiwai@suse.de>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <07c6a947-aa4f-2195-d4bf-3a757528352e@huawei.com>
Date: Fri, 10 May 2019 21:09:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <s5h7eayn5or.wl-tiwai@suse.de>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org, lgirdwood@gmail.com,
 broonie@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019/5/10 15:12, Takashi Iwai wrote:
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

Yes, I prefer to use IS_REACHABLE, thanks!

> 
> thanks,
> 
> Takashi
> 
> 
>> ---
>>  sound/soc/sof/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
>> index b204c65..9c280c9 100644
>> --- a/sound/soc/sof/Kconfig
>> +++ b/sound/soc/sof/Kconfig
>> @@ -44,7 +44,7 @@ config SND_SOC_SOF_OPTIONS
>>  if SND_SOC_SOF_OPTIONS
>>  
>>  config SND_SOC_SOF_NOCODEC
>> -	tristate "SOF nocodec mode Support"
>> +	bool "SOF nocodec mode Support"
>>  	help
>>  	  This adds support for a dummy/nocodec machine driver fallback
>>  	  option if no known codec is detected. This is typically only
>> -- 
>> 2.7.4
>>
>>
>>
> 
> .
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
