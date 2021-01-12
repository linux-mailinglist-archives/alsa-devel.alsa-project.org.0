Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8962F31AB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:27:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E733D1693;
	Tue, 12 Jan 2021 14:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E733D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610458040;
	bh=jOiuYSpQtAfcETi3iBNgzUhxBWmqsZl2TCTRf4Oj/6w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXUuc7wPtCq6WueYispRZyFjRXq9dHK9o1KVoB/Q9GR6To0HcmXsyBbox+7LO6bmi
	 tUQZHBwcqQ5HBGW7iEaNaP1ooGWymiOpBRlEdCAvyhEGoZMbGgiVqBo+aIvWQYvuty
	 G9MRioCJ2uHniYjyUVchgk5vlGnued9AUOgELDOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E617F804AA;
	Tue, 12 Jan 2021 14:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13F7FF8025E; Tue, 12 Jan 2021 14:26:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80CA0F800B9;
 Tue, 12 Jan 2021 14:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80CA0F800B9
IronPort-SDR: iiZdUJQI69wEhshSiXdVOS76bDJNQNvEkBFPcwYtuKXap/w/u1iNoHyYKiHeYxOONyzGOJH93q
 1oj41jvBFIyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="165120872"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="165120872"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 05:25:54 -0800
IronPort-SDR: dS5XLJ2VWCCOTsDF6J+HgkZAaQ6ocxgS31hbG3yOZVe+O8e8sr5Bh4/IiP++citFFPveL5wjyM
 Y3Uq8EDClYYg==
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="464525028"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.154.164])
 ([10.249.154.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 05:25:52 -0800
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
 <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
 <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
 <CAAd53p7=kHLsZcNNy3AH8Y08=50Y4sVs_PMTDimRCY9ZOC3gsQ@mail.gmail.com>
 <CAAd53p7Fn-kO67RVd8K4WoLqkOhc_qWhKO5BdATDJMcJkBNRGg@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <5de3f7a5-273f-9d0a-2479-6b80b8da1b6a@linux.intel.com>
Date: Tue, 12 Jan 2021 14:25:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAd53p7Fn-kO67RVd8K4WoLqkOhc_qWhKO5BdATDJMcJkBNRGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: SOUND <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
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

On 12/17/2020 9:25 AM, Kai-Heng Feng wrote:
(...)
>>>
>>> Can you try this instead, the dependencies are indeed wrong in the Makefile:
>>
>> Ok, compiling a kernel for user to test...
> 
> Well, this happens:
> ERROR: modpost: "skl_dsp_set_dma_control"
> [sound/soc/intel/skylake/snd-soc-skl-ssp-clk.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:111: sound/Module.symvers] Error 1
> make[1]: *** Deleting file 'sound/Module.symvers'
> make: *** [Makefile:1709: modules] Error 2
> 
> Kai-Heng
> 
>>
>> Kai-Heng
>>
>>>
>>> diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
>>> index 4e0248d2accc..7c5038803be7 100644
>>> --- a/sound/soc/intel/Makefile
>>> +++ b/sound/soc/intel/Makefile
>>> @@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
>>>    # Platform Support
>>>    obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
>>>    obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
>>> -obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
>>> +obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
>>>    obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
>>>
>>>    # Machine support
>>>
>>>

Hi,

what is the status of this issue?
Does it now work with usptream kernel?
Can you provide full .config, so we can test on our side?

Amadeusz
