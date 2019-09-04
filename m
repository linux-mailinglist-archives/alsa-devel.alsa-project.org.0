Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72FA8712
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 19:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC4D1686;
	Wed,  4 Sep 2019 19:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC4D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567619380;
	bh=uI0ubglw6D6i5wCYNBQ8tB8K4sEd64QnzYLS/wvJCyw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jSGe15BCgrbrahIknnbUOnb1ON2uMakjDyL8/cZY4jL+4PRZcxMX/zBZtN54evnOB
	 bOfsm0VnLA+2MXbs+25aQqrFvz/wIDaWbSP8JnIR3/cdQXeXoFvEpUuT4B5yQ9Wjja
	 bQ6+A+esq+NPx70mADKxXap5QNcmh9sE+xh1Hbco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF581F803D0;
	Wed,  4 Sep 2019 19:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2BEF80171; Wed,  4 Sep 2019 19:47:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A217F80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 19:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A217F80171
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 10:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="194814201"
Received: from enagase-mobl1.amr.corp.intel.com (HELO [10.251.133.230])
 ([10.251.133.230])
 by orsmga002.jf.intel.com with ESMTP; 04 Sep 2019 10:47:44 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-4-pierre-louis.bossart@linux.intel.com>
 <20190904072131.GK2672@vkoul-mobl>
 <1897e21f-b086-8233-e96e-6024e75a2153@linux.intel.com>
 <20190904165129.GB2672@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <785cce2e-febe-3bbd-7590-32943fe7ac99@linux.intel.com>
Date: Wed, 4 Sep 2019 12:47:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904165129.GB2672@vkoul-mobl>
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Pan Xiuli <xiuli.pan@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 3/5] ASoC: SOF: Intel: hda: add
 SoundWire IP support
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



On 9/4/19 11:51 AM, Vinod Koul wrote:
> On 04-09-19, 08:25, Pierre-Louis Bossart wrote:
>> On 9/4/19 2:21 AM, Vinod Koul wrote:
>>> On 21-08-19, 15:17, Pierre-Louis Bossart wrote:
>>>> The Core0 needs to be powered before the SoundWire IP is initialized.
>>>>
>>>> Call sdw_intel_init/exit and store the context. We only have one
>>>> context, but depending on the hardware capabilities and BIOS settings
>>>> may enable multiple SoundWire links.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>    sound/soc/sof/intel/hda.c | 40 +++++++++++++++++++++++++++++++++------
>>>>    sound/soc/sof/intel/hda.h |  5 +++++
>>>>    2 files changed, 39 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>>>> index a968890d0754..e754058e3679 100644
>>>> --- a/sound/soc/sof/intel/hda.c
>>>> +++ b/sound/soc/sof/intel/hda.c
>>>> @@ -57,6 +57,8 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
>>>>    {
>>>>    	acpi_handle handle;
>>>>    	struct sdw_intel_res res;
>>>> +	struct sof_intel_hda_dev *hdev;
>>>> +	void *sdw;
>>>>    	handle = ACPI_HANDLE(sdev->dev);
>>>> @@ -66,23 +68,32 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
>>>>    	res.irq = sdev->ipc_irq;
>>>>    	res.parent = sdev->dev;
>>>> -	hda_sdw_int_enable(sdev, true);
>>>> -
>>>> -	sdev->sdw = sdw_intel_init(handle, &res);
>>>> -	if (!sdev->sdw) {
>>>> +	sdw = sdw_intel_init(handle, &res);
>>>
>>> should this be called for platforms without sdw, I was hoping that some
>>> checks would be performed.. For example how would skl deal with this?
>>
>> Good point. For now we rely on CONFIG_SOUNDWIRE_INTEL to use a fallback, but
>> if the kernel defines this config and we run on an older platform the only
>> safety would be the hardware capabilities and BIOS dependencies, I need to
>> test if it works.
> 
> Yes I am not sure given the experience with BIOS relying on that is a
> great idea ! But if that works, that would be better.

I don't think it's going to be that bad, first we need to find the ACPI 
description for the controller, then see which links are active, and 
even with all links disabled nothing bad will happen.

What I am more worried about are inconsistencies where e.g we have both 
I2C/I2S and SoundWire devices exposed at the same time. The BIOS deals 
with this with dynamic changes depending on user changes, and we are 
likely to see reports of problems due to BIOS configuration selection, 
not the BIOS itself.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
