Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2991706AB1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE14D206;
	Wed, 17 May 2023 16:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE14D206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332793;
	bh=M8HgIw9VAVYTdiooZ92+QUJuNuT32dgIhD+Z/vDMl4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ic9sQAP87v8iw52+omo/hf4Ch99UTu6uYsB/ETGja/vB0kWbyIETdNiuU7ZxQcwUl
	 J8t/hQ2RMQomK36Aho/EQR9stJpdOwhcBBGVH3P6mQU00V0Di+r1FIXlZRIEmGml7x
	 RQR9H3kV3JkvEoWuZCaFz0oeuXO9oh09f2oBHelM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61BE7F80563; Wed, 17 May 2023 16:11:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26784F80553;
	Wed, 17 May 2023 16:11:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC95EF8055B; Wed, 17 May 2023 16:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7782DF80551
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7782DF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=faZJtyf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684332706; x=1715868706;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M8HgIw9VAVYTdiooZ92+QUJuNuT32dgIhD+Z/vDMl4s=;
  b=faZJtyf97Qb1Pwq+982QcwtuGPFNXMDedyFr44sbaI4R73DCaHt22Kor
   X5963M4QeJe92IP4LNHeIM3HyT83VmxQOb4QLvF4P249Hls9RUfBjYO0U
   Efv8GLVoI8FFYscUaIudyh1Ro9Z/TubPte+kSI7M3S/mmgyPLXerN1LvO
   x03HbNFTho1OT5NNbc6mxpqE9YF57CVfdN79lxwD7zV67akNmlFgfvP2R
   o+NEGLWVUD5YxfbMEvrNCiztgNt2KyHu8++1ZwVEvfmKh+EZi7p7L289D
   xQRISYOZi9Ww7g5o0UjC6r19B0ZaMpOfIiTdk/zAmi3ZxA0i2EF/0lkgY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349273438"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="349273438"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734709685"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734709685"
Received: from rdealba-mobl.amr.corp.intel.com (HELO [10.209.16.101])
 ([10.209.16.101])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:43 -0700
Message-ID: <a36ec243-feaa-d886-0fe8-bfb07472a89f@linux.intel.com>
Date: Wed, 17 May 2023 08:40:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] ASoC: amd: ps: create platform devices based on acp
 config
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
 <20230516103543.2515097-2-Vijendar.Mukunda@amd.com>
 <a94650e0-f7b4-b431-5a3c-042ce724cf50@linux.intel.com>
 <c9afc5b7-b07d-1ef5-7c76-f592577f833a@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c9afc5b7-b07d-1ef5-7c76-f592577f833a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3DTCTFA6TSGH4UXVEF6P3FXA6HORZ64A
X-Message-ID-Hash: 3DTCTFA6TSGH4UXVEF6P3FXA6HORZ64A
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DTCTFA6TSGH4UXVEF6P3FXA6HORZ64A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/17/23 03:38, Mukunda,Vijendar wrote:
> On 16/05/23 20:02, Pierre-Louis Bossart wrote:
>>
>> On 5/16/23 05:35, Vijendar Mukunda wrote:
>>> Create platform devices for Soundwire Manager instances and
>>> PDM controller based on ACP pin config selection
>>> and ACPI fw handle for pink sardine platform.
>>>
>>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>> ---
>>>  sound/soc/amd/ps/acp63.h  |  43 ++++++-
>>>  sound/soc/amd/ps/pci-ps.c | 250 ++++++++++++++++++++++++++++++++++++--
>>>  2 files changed, 280 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
>>> index 2f94448102d0..f27f71116598 100644
>>> --- a/sound/soc/amd/ps/acp63.h
>>> +++ b/sound/soc/amd/ps/acp63.h
>>> @@ -10,7 +10,7 @@
>>>  #define ACP_DEVICE_ID 0x15E2
>>>  #define ACP63_REG_START		0x1240000
>>>  #define ACP63_REG_END		0x1250200
>>> -#define ACP63_DEVS		3
>>> +#define ACP63_DEVS		5
>>>  
>>>  #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
>>>  #define ACP_PGFSM_CNTL_POWER_ON_MASK	1
>>> @@ -55,8 +55,14 @@
>>>  
>>>  #define ACP63_DMIC_ADDR		2
>>>  #define ACP63_PDM_MODE_DEVS		3
>>> -#define ACP63_PDM_DEV_MASK		1
>>>  #define ACP_DMIC_DEV	2
>>> +#define ACP63_SDW0_MODE_DEVS		2
>>> +#define ACP63_SDW0_SDW1_MODE_DEVS	3
>>> +#define ACP63_SDW0_PDM_MODE_DEVS	4
>>> +#define ACP63_SDW0_SDW1_PDM_MODE_DEVS   5
>>> +#define ACP63_DMIC_ADDR			2
>>> +#define ACP63_SDW_ADDR			5
>>> +#define AMD_SDW_MAX_MANAGERS		2
>>>  
>>>  /* time in ms for acp timeout */
>>>  #define ACP_TIMEOUT		500
>>> @@ -80,6 +86,12 @@ enum acp_config {
>>>  	ACP_CONFIG_15,
>>>  };
>>>  
>>> +enum acp_pdev_mask {
>>> +	ACP63_PDM_DEV_MASK = 1,
>>> +	ACP63_SDW_DEV_MASK,
>>> +	ACP63_SDW_PDM_DEV_MASK,
>>> +};
>> a comment or kernel-doc wouldn't hurt to explain the difference between
>> ACP63_PDM_DEV_MASK and ACP63_SDW_PDM_DEV_MASK, the meaning of the 'SDW"
>> prefix is far from obvious.
> Above enum's are listed to know the platform device masks.
> For example - if ACP63_PDM_DEV_MASK is set, then ACP PCI driver
> will create platform device for PDM controller.
> 
> If ACP63_SDW_DEV_MASK is set, ACP PCI driver will create platform device
> nodes for soundwire manager instances based on instance count retrieved
> by scanning the SoundWire Controller.
> 
> If ACP63_SDW_PDM_DEV_MASK is set, ACP PCI driver will create platform device
> nodes for PDM controller and SoundWire manager instances.
> 
> We will add comment for the same.

Ah ok, I completely missed that you could have PDM, SoundWire or
PDM+SoundWire configurations. I was reading this with SoundWire blinders
and thought you wanted to have PDM over SoundWire or something.

>>> -		dev_dbg(&pci->dev, "No PDM devices found\n");
>>> +		dev_dbg(&pci->dev, "No PDM or Soundwire manager devices found\n");
>> what does this mean? I find this debug adds more confusion.
> Currently, we are trying to create platform devices for PDM controller and SoundWire
> Manager instances based on ACP pin config and ACPI _ADDR fields scan under ACP PCI device
> scope.
> Earlier We have added support for ACP PDM controller.
> ACP PIN config supports different audio configurations other than PDM and SoundWire
> based audio endpoints.
> 
> If there is no pdev_mask set, it refers to default switch case.
> This dev_dbg statement to notify that no PDM and Soundwire manager devices found
> from ACPI scan.
> 
> This patch adds support for platform device creation logic for Soundwire manager instances &
> PDM controller combinations based on ACP PIN Config and ACPI _ADDR field scan.
> 
> Possible combination of platform device nodes:
> 
> 1) ACP PDM Controller, dmic-codec, machine driver platform device node
> 2) ACP PDM Controller , dmic-codec, SW0 manager instance, platform device for SoundWire DMA driver
> 3) SW0, SW1 SoundWire manager instances, platform device for SoundWire DMA driver
> 3) ACP PDM Controller, dmic-codec, SDW0, SDW1 manager instances, platform device for SoundWire DMA driver

right, you really want this in the commit message so that reviewers
understand the various configurations upfront. Trying to
reverse-engineer the code induces migraines ;-)

