Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149A33167
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 15:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92EE165F;
	Mon,  3 Jun 2019 15:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92EE165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559569641;
	bh=m4JZ37G7JOFhWBAGzAsqS2qY/kbgLbQq6iNg7s83vzQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOt8YWIO7SLpsPQBDoJtAJ/TkgadSIMmvvjM+apzP0WT2xBEbbnNHOY+sngeNmAM/
	 IUOqpSI82WXpNsVn1UANvKxmvK6vxvWCCmq2iMv/bt/ZBlETk/xy492z80QYnEmtjw
	 e55X18DPDFKKygaZUdtfEgvhBWBZgsGfUpI7ohlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17905F896DB;
	Mon,  3 Jun 2019 15:45:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6731CF896DD; Mon,  3 Jun 2019 15:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1BCF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 15:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1BCF80774
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 06:45:28 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jun 2019 06:45:27 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 1705D5800BD;
 Mon,  3 Jun 2019 06:45:27 -0700 (PDT)
To: "Yang, Libin" <libin.yang@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
 <96A12704CE18D347B625EE2D4A099D195284169B@SHSMSX103.ccr.corp.intel.com>
 <s5hr28pfux1.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528416D3@SHSMSX103.ccr.corp.intel.com>
 <s5ho93tfuea.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D195285B18B@SHSMSX103.ccr.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <475384fa-718f-14f4-7f5f-8257240163f6@linux.intel.com>
Date: Mon, 3 Jun 2019 08:45:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <96A12704CE18D347B625EE2D4A099D195285B18B@SHSMSX103.ccr.corp.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
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

Hi Libin,

>>>>> Please let me describe the issue here.
>>>>>
>>>>> The test case is:
>>>>> 1) Unload module with script "sudo ./sof_remove.sh" ,
>>>>> 2) reload module with script "sudo ./sof_insert.sh"
>>>>>
>>>>> After several rounds of removing and inserting kernel modules,
>>>>> system will complain like below:
>>>>> "BUG: unable to handle kernel paging request at 000000292a282031"
>>>>
>>>> Did you try some kernel debug options?  It might show what went wrong.
>>>
>>> No, I haven't. I'm not sure which options I can use for this case.
>>> Could you please give me some suggestions?
>>
>> You can enable CONFIG_DEBUG_DEVRES and adjust the devres.log option for
>> showing each devres allocation and removal.  And I'd try
>> CONFIG_DEBUG_SLAB and CONFIG_DEBUG_KMEMLEAK or whatever
>> interesting in CONFIG_DEBUG section, too.
> 
> Thanks for your suggestion. After more than 1 week debug, I think maybe
> I have root caused this issue from the devres.log message.
> 
> Below is my finding.
> 1. When initialing the codecs, snd_hdac_ext_bus_device_init() will be called,
> and it will set hdev->dev.release = default_release.
> However, for analog codec (not hdac_hdmi codec), hdac_hda_codec_probe()
> will be called later. And it will call snd_hda_codec_device_new(), which will
> reset codec->code.dev.release = snd_hda_codec_dev_release;
> This means hdac_hdmi's hdev dev release is default_release() defined in
> hdac_ext_bus.c, and other hda codec's hdev dev release is
> snd_hda_codec_dev_release().
> 
> Both default_release() and snd_hda_codec_dev_release() will call kfree()
> to free the hdac_device (or its container) in the current code.
> 
> 2. When we run rmmod sof_pci_dev, it will free the sdev. If we use
> Struct hdac_device *hdev = devm_kzalloc(sdev->dev...). This means
> hdev will also be freed automatically.
> 
> In the removal, snd_hdac_ext_bus_device_remove() will be called
> to remove the hdev (in this function it is struct hdac_device *codec.
> The name is not aligned in different places).
> However for hdac_hdmi, the hdev->dev is used by other code.

what other code? Can you elaborate on why the release is delayed?

> So calling device.release() (the function default_release()) will
> be postponed. After after sdev is freed, the device.release() will
> be called. But for devm_xxx, hdev will also be freed when sdev is
> freed. This means hdev.dev after sdev is freed is invalid now as
> hdev has already freed. It will access invalid memory. This will cause the bug.

This is very hard to follow. 4 lines above you wrote the release is 
postponed but the way you describe is looks completely sequential.

> 
> So I think we should not use devm_xxx, and let's free the hdev manually.
> 
> At the end of this topic, I still found 2 suspicious code in the current code.
> 1. in sound/soc/intel/skylate/skl.c
> it calls hdev = devm_kazlloc() or hda_codec = devm_kzalloc().
> As we will call kfree() in the current code, should we replace it with
> kzalloc()? Maybe we need cavs drivers owner's help on it.

maybe you should send a diff suggestion to help everyone understand the 
changes you are referring to?

> 
> 2. in snd_hdac_ext_bus_device_remove()
> It will call snd_hdac_device_unregister() to unregister the hdac_devices
> and put_device(&codec->dev) to release the dev.
> For analog codec, snd_hdac_device_unregister()  will free the codec->dev's
> kobject. And snd_hda_codec_dev_release() will be called to free the
> hdac_device.
> So it is invalid to call put_device(&codec->dev). If you print
> refcound_read(&(codec->dev.kobj.kref.refcount)) for analog codec before
> put_device(), you will find the refcount has already been 0.

Isn't it a different problem though? Does this cause a freeze or is this 
just a bad refcount?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
