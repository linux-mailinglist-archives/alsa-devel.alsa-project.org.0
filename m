Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A07CFC3C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E76B0E9C;
	Thu, 19 Oct 2023 16:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E76B0E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724871;
	bh=SgyKtQrLkgS4addmbJXnuxPILcTy9f7NSRs4ptqNYWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lnuhJTOLdiwWZyn2NMZ2hcfEPFXQ7lu6OpoTkFdmOhv0EVqSXaY7b4qOA0jUOUJQV
	 CmBrIJqaDsI9BmqDGjEOUoY2dthoacpRviLclreBe+6hsqLJXBW8l8Y+cc2ZrpVxP7
	 mJJ0tTW7Qo2zqyrp/jgJbGlUPM3JRhobjLfxAxPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF730F80606; Thu, 19 Oct 2023 16:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1291DF80602;
	Thu, 19 Oct 2023 16:11:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03857F8025F; Thu, 19 Oct 2023 12:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19646F8019B;
	Thu, 19 Oct 2023 12:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19646F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fpKMEwUD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697709794; x=1729245794;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SgyKtQrLkgS4addmbJXnuxPILcTy9f7NSRs4ptqNYWI=;
  b=fpKMEwUDgCcZnDKkxkwZ7EJLLhNZo8JsiK/xOkuVEN3LZSCroGBPOpJt
   /+SnyjSf54sp2otgFylQV0TeE3rZX8dNvfyWSwOyrEcu/ey7djNfZ+fEu
   uiGxgdMLMsvr3cUqsC9DCfGSWLjCeBM+Ukn4A0yjmVOORvHTIIExF46fC
   sQps5xkYsoaVYOi9/GK3Di4hYHvk0dbtcF6/awIXHGhtEHXsjKjRNGBuu
   ur8AlIxJ9upGeijWBPx3AtvV5IBoxyFBoZSObWPN1AGhG0j7qdFlGZeoM
   bNHtfm4bXztvKhKlcG1bI54YcjuHKeA8KeW2SW8bclpdOEUNK9LSrYbGn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="383438224"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200";
   d="scan'208";a="383438224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 03:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760588908"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200";
   d="scan'208";a="760588908"
Received: from kinstrum-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 03:02:58 -0700
Message-ID: <a581dd50-b3c0-4774-ad3e-0db5e4c47338@linux.intel.com>
Date: Thu, 19 Oct 2023 12:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/13] ASoC: SOF: core: Ensure sof_ops_free() is still
 called when probe never ran.
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
 <20231009115437.99976-2-maarten.lankhorst@linux.intel.com>
 <87il7aopcy.wl-tiwai@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87il7aopcy.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A7KBQTILMQ6QAE4KTQZJOMRNXOWCG6SO
X-Message-ID-Hash: A7KBQTILMQ6QAE4KTQZJOMRNXOWCG6SO
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7KBQTILMQ6QAE4KTQZJOMRNXOWCG6SO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-10-13 kl. 11:15, skrev Takashi Iwai:
> On Mon, 09 Oct 2023 13:54:25 +0200,
> Maarten Lankhorst wrote:
>> In an effort to not call sof_ops_free twice, we stopped running it when
>> probe was aborted.
>>
>> Check the result of cancel_work_sync to see if this was the case.
>>
>> Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")
>> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
> Your Signed-off-by tag is missing.
>
> Could you resubmit?
>
>
> thanks,
>
> Takashi

I missed this email apparently.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Is this enough for the tooling, or do you need an actual resubmit?

Cheers,
~Maarten

>
>> ---
>>   sound/soc/sof/core.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
>> index 2d1616b81485c..0938b259f7034 100644
>> --- a/sound/soc/sof/core.c
>> +++ b/sound/soc/sof/core.c
>> @@ -459,9 +459,10 @@ int snd_sof_device_remove(struct device *dev)
>>   	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
>>   	struct snd_sof_pdata *pdata = sdev->pdata;
>>   	int ret;
>> +	bool aborted = false;
>>   
>>   	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>> -		cancel_work_sync(&sdev->probe_work);
>> +		aborted = cancel_work_sync(&sdev->probe_work);
>>   
>>   	/*
>>   	 * Unregister any registered client device first before IPC and debugfs
>> @@ -487,6 +488,9 @@ int snd_sof_device_remove(struct device *dev)
>>   		snd_sof_free_debug(sdev);
>>   		snd_sof_remove(sdev);
>>   		sof_ops_free(sdev);
>> +	} else if (aborted) {
>> +		/* probe_work never ran */
>> +		sof_ops_free(sdev);
>>   	}
>>   
>>   	/* release firmware */
>> -- 
>> 2.39.2
>>
