Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32618BE86
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 18:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059261790;
	Thu, 19 Mar 2020 18:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059261790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584639814;
	bh=hvRg5I4djoShZ6cp7BoAorkMTvRg158SUDHgJrA7hmw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTek5ngyXuCNeW9XnZLwY5nnux6ZT9RGOVXvKzsbjswp0eI0CYyyHq2lnXYJ5yYTN
	 nyi/TSDOX45k2K9/cjmy0zuDMw9Xx/F7Ct7bCd/+WneOkBE6v+Daqy3Y9DadoWRkUg
	 9uKnEf2wkPJkjwjPAgrd2jK3dUqRx7CxT+4VSORY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE0AF80232;
	Thu, 19 Mar 2020 18:41:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC6B8F8022B; Thu, 19 Mar 2020 18:41:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72454F800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 18:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72454F800C0
IronPort-SDR: Smedf8ZSW7xCdsZ9RmaOJbuiCOlCrGnW35NOQttJTPmtBrFHibH0F92pBjnOCpL6ZvVTxeq+lV
 WEU0TrtGRzHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 10:41:40 -0700
IronPort-SDR: M+4pdbi+zVZ2HdNL26EbrDS7Nh29gZE9Qh/vZepeJyokUYRJ09ibtOf5M5lQA8VK42SY5c5EAR
 0dDvtY7TShhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="245232025"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.128.140])
 ([10.249.128.140])
 by orsmga003.jf.intel.com with ESMTP; 19 Mar 2020 10:41:37 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
References: <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <eef45d20-3bce-184a-842c-216c15252014@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <45108a58-da11-3b6a-9e3b-072ac0c63ea1@intel.com>
Date: Thu, 19 Mar 2020 18:41:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <eef45d20-3bce-184a-842c-216c15252014@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, Keyon Jie <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On 2020-03-19 18:21, Pierre-Louis Bossart wrote:
> On 3/19/20 11:51 AM, Dominik Brodowski wrote:
>> On Thu, Mar 19, 2020 at 04:48:03PM +0100, Cezary Rojewski wrote:

>>>
>>> Requested for tests with following diff applied:
>>>
>>> diff --git a/sound/soc/intel/boards/broadwell.c
>>> b/sound/soc/intel/boards/broadwell.c
>>> index db7e1e87156d..6ed4c1b0a515 100644
>>> --- a/sound/soc/intel/boards/broadwell.c
>>> +++ b/sound/soc/intel/boards/broadwell.c
>>> @@ -212,7 +212,6 @@ static struct snd_soc_dai_link 
>>> broadwell_rt286_dais[] =
>>> {
>>>                  .init = broadwell_rt286_codec_init,
>>>                  .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>>>                          SND_SOC_DAIFMT_CBS_CFS,
>>> -               .ignore_suspend = 1,
>>>                  .ignore_pmdown_time = 1,
>>>                  .be_hw_params_fixup = broadwell_ssp0_fixup,
>>>                  .ops = &broadwell_rt286_ops,
>>
>> That patch fixes the issue(s). I didn't even need to revert 64df6afa0dab
>> ("ASoC: Intel: broadwell: change cpu_dai and platform components for 
>> SOF")
>> on top of that. But you can assess better whether that patch needs 
>> care for
>> other reasons; for me, this one-liner you have suggested is perfect.
> 
> .ignore_suspend is set for bdw-rt5677.c and bdw-rt5650.c as well. I 
> don't know if that was intentional.

haswell has it too.

My guess is that it's supposed to mimic offload behaviour on Windows: 
offload pin playback allows for non-interrupted playback during sleep 
while system pin follows standard path: breaks on sleep and resumes once 
sleep concludes. This of course also involves cooperation from 
application side.

However, one pin cannot serve two masters. Either it's offload or it's not.

This is just a guess of course, and my vision might be clouded becuase 
of Windows background.
Other SSP0 examples: rt286 (SKL/ KBL) rt298 (APL) and rt274 (CNL) do not 
have .ignore_suspend enabled for their links, except when DMIC is 
involved. So it might be just a bug that has been covered by another bug 
present in ASoC core, which Morimoto' San fixed during his cleanup series.

Czarek
