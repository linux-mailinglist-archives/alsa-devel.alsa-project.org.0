Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA4241B2C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C4A1666;
	Tue, 11 Aug 2020 14:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C4A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597150287;
	bh=BRTjjNC6mZo8VLcqImeFXMwSfYsLGEeocZMsFkheT2E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zdefwdy6EMZV02/rvNG0cikcyaNkgd3UZsGjj6NUKTY1rrw+iovJBBMEsa3lXOWT7
	 2047dUNZDAkgrvkwWHXlBLuo9DVUTExx9Uzn/KNERrcM8SiWeZWvnU/rJg3CmSq++m
	 3SVRH2TxKwdOYCpwVBD7mtrhWcI8mTbxH1Nk54Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 519E6F80161;
	Tue, 11 Aug 2020 14:49:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F78EF8015B; Tue, 11 Aug 2020 14:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E29EF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E29EF800BC
IronPort-SDR: mV9b+rcFArKu696dUACkI4OF+csqz5E33rAMEupuQpDbxhu44pKDe+QgW5firUkLWw8Yrh0U0n
 BwRcmg2QREcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="151392449"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="151392449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:49:36 -0700
IronPort-SDR: wYp+yCHsIqQnRB0dldSpsAlVmjyNO3rfpKsuWU4k3GQ3Ss6J2cGmZOpZm5fmRUdF3vxwwcZXIZ
 IOm3aMP0Mq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="317714007"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.31.191])
 ([10.213.31.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 05:49:32 -0700
Subject: Re: [PATCH v2 02/13] ASoC: Intel: catpt: Define DSP operations
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-3-cezary.rojewski@intel.com>
 <1d44041c-1cc8-395b-a8cf-007661bc1b15@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9f7b0463-01aa-fb84-a789-b27a82ed0228@intel.com>
Date: Tue, 11 Aug 2020 14:49:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1d44041c-1cc8-395b-a8cf-007661bc1b15@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-11 2:17 PM, Amadeusz Sławiński wrote:
> 
> 
> On 8/11/2020 12:00 PM, Cezary Rojewski wrote:
>> Implement dsp lifecycle functions such as core RESET and STALL,
>> SRAM power control and LP clock selection. This also adds functions for
>> handling transport over DW DMA controller.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
> 
> ...
> 
>> +
>> +int lpt_dsp_power_down(struct catpt_dev *cdev)
>> +{
>> +    catpt_dsp_reset(cdev, true);
>> +
>> +    /* set 24Mhz clock for both SSPs */
>> +    catpt_updatel_shim(cdev, CS, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
>> +               CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
>> +    catpt_dsp_select_lpclock(cdev, true, false);
>> +
>> +    /* DRAM power gating all */
>> +    catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask,
>> +                  cdev->spec->dram_mask);
>> +    catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
>> +                  cdev->spec->iram_mask);
>> +
>> +    /* set D3 */
>> +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
>> +    udelay(50);
>> +
>> +    return 0;
>> +}
>> +
>> +int lpt_dsp_power_up(struct catpt_dev *cdev)
>> +{
>> +    /* SRAM power gating none */
>> +    catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
>> +    catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->dram_mask, 0);
> 
> Wrong mask for iram here? For example in above function 
> (lpt_dsp_power_down) cdev->spec->iram_mask is used?
> 

Yes, for this update I've run tests for all bdw (wpt) devices -only. 
Thanks for catching this up!

Czarek
