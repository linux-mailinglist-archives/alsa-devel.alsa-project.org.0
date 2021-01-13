Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F22F4C6C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 14:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B534F16CE;
	Wed, 13 Jan 2021 14:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B534F16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610545620;
	bh=lFiSGuGkp+O25KePcr4PoRbTz26R2ZkZhnevWQ9mQAs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R8DuxHmg6gonCkSLdgXil0Rek0WXpLOOd4J4do3a2hO32XeaNKxeIl+0udaJ1A6Lr
	 qfxI28ZXEnrzafdiRK7+ekOyPF1rESEKt01O++3uwZiw8oez5/7dQHNsJ5Bc05sBoS
	 LgywaOE6yTCARUj/N07Wl1GQhIzjWUUCqr3WDOz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB55F8014D;
	Wed, 13 Jan 2021 14:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B040DF801ED; Wed, 13 Jan 2021 14:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E993F80113;
 Wed, 13 Jan 2021 14:45:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E993F80113
IronPort-SDR: 3oAywNYaCBhuUgnlu2jKADfI8gUJVMZo4KPACflm3ZdjT1n9oCzyBiBRxJ3sRhsylfoyXzbbmD
 OHF5ixnVN/LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="157978339"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="157978339"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 05:45:07 -0800
IronPort-SDR: 1qWKctZF2aMVZS18S29sCKBJhbYed39QQoY8oDZZb/S2UNHZ21yAf22DNCaRRScgB2Lqksa3ek
 TscPkm4LX/vw==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="464905380"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.140.37])
 ([10.249.140.37])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 05:45:06 -0800
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
 <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
 <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
 <CAAd53p7=kHLsZcNNy3AH8Y08=50Y4sVs_PMTDimRCY9ZOC3gsQ@mail.gmail.com>
 <CAAd53p7Fn-kO67RVd8K4WoLqkOhc_qWhKO5BdATDJMcJkBNRGg@mail.gmail.com>
 <5de3f7a5-273f-9d0a-2479-6b80b8da1b6a@linux.intel.com>
 <CAAd53p7OHhqXDJDuEamXwfseXiUdGfDsJhNJbdUYo_4uoBdzdQ@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <dc226baf-5e78-fe64-2816-83782529ad2e@linux.intel.com>
Date: Wed, 13 Jan 2021 14:44:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAd53p7OHhqXDJDuEamXwfseXiUdGfDsJhNJbdUYo_4uoBdzdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: SOUND <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

On 1/13/2021 5:48 AM, Kai-Heng Feng wrote:
> On Tue, Jan 12, 2021 at 9:25 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 12/17/2020 9:25 AM, Kai-Heng Feng wrote:
>> (...)
>>>>>
>>>>> Can you try this instead, the dependencies are indeed wrong in the Makefile:
>>>>
>>>> Ok, compiling a kernel for user to test...
>>>
>>> Well, this happens:
>>> ERROR: modpost: "skl_dsp_set_dma_control"
>>> [sound/soc/intel/skylake/snd-soc-skl-ssp-clk.ko] undefined!
>>> make[1]: *** [scripts/Makefile.modpost:111: sound/Module.symvers] Error 1
>>> make[1]: *** Deleting file 'sound/Module.symvers'
>>> make: *** [Makefile:1709: modules] Error 2
>>>
>>> Kai-Heng
>>>
>>>>
>>>> Kai-Heng
>>>>
>>>>>
>>>>> diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
>>>>> index 4e0248d2accc..7c5038803be7 100644
>>>>> --- a/sound/soc/intel/Makefile
>>>>> +++ b/sound/soc/intel/Makefile
>>>>> @@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
>>>>>     # Platform Support
>>>>>     obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
>>>>>     obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
>>>>> -obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
>>>>> +obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
>>>>>     obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
>>>>>
>>>>>     # Machine support
>>>>>
>>>>>
>>
>> Hi,
>>
>> what is the status of this issue?
> 
> Still the same, unresolved.
> 
>> Does it now work with usptream kernel?
> 
> No it doesn't.
> 

Can you try with following patch:

diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 4e0248d2accc..7c5038803be7 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
  # Platform Support
  obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
  obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
-obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
+obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
  obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/

  # Machine support
diff --git a/sound/soc/intel/skylake/Makefile 
b/sound/soc/intel/skylake/Makefile
index dd39149b89b1..1c4649bccec5 100644
--- a/sound/soc/intel/skylake/Makefile
+++ b/sound/soc/intel/skylake/Makefile
@@ -7,7 +7,7 @@ ifdef CONFIG_DEBUG_FS
    snd-soc-skl-objs += skl-debug.o
  endif

-obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += snd-soc-skl.o
+obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += snd-soc-skl.o

  #Skylake Clock device support
  snd-soc-skl-ssp-clk-objs := skl-ssp-clk.o
