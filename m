Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B17646EB8C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 22:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B35A16E2;
	Fri, 19 Jul 2019 22:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B35A16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563567794;
	bh=oY7a3aXo3f0lGua6rH8yNad+qC63r3bSoROWbPlTYzg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZwWC75Pz4vQ8Ie8S5IZKHVb5yZslV+nOXFDaAnBAZHXGXuBQH2Max+JPDthyg0Nr
	 NCbmDG9AAOMyrPgRMxyzBM961poWr+KUs0qbAIK+Vq7baQquPn5KyVjOJH3jz8Bgv8
	 8ABKF3HctA64LLZHTLb/cC+rApQXvlb6asXNv+yA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF5CF80228;
	Fri, 19 Jul 2019 22:21:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7A52F80272; Fri, 19 Jul 2019 22:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F69CF800C4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 22:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F69CF800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 13:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="252250153"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 19 Jul 2019 13:21:21 -0700
Received: from radipont-mobl.amr.corp.intel.com (unknown [10.251.153.250])
 by linux.intel.com (Postfix) with ESMTP id CFD5F58047A;
 Fri, 19 Jul 2019 13:21:20 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
 <20190719170610.17610-7-pierre-louis.bossart@linux.intel.com>
 <s5hlfwtzyca.wl-tiwai@suse.de>
 <6bc24e2a-596b-83f4-d022-5f630657c3a1@linux.intel.com>
 <s5hh87hzwf1.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f9c6ea4f-8532-c1b5-8554-3e3df8d1a588@linux.intel.com>
Date: Fri, 19 Jul 2019 15:21:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hh87hzwf1.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH 6/6] ALSA: hda/intel: stop probe if DMICS
 are detected on Skylake+ platforms
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

On 7/19/19 1:55 PM, Takashi Iwai wrote:
> On Fri, 19 Jul 2019 20:29:10 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>> @@ -2055,6 +2078,17 @@ static int azx_probe(struct pci_dev *pci,
>>>>    	card->private_data = chip;
>>>>    	hda = container_of(chip, struct hda_intel, chip);
>>>>    +	/*
>>>> +	 * stop probe if digital microphones detected on Skylake+ platform
>>>> +	 * with the DSP enabled. This is an opt-in behavior defined at build
>>>> +	 * time or at run-time with a module parameter
>>>> +	 */
>>>> +	if (IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC) || dmic_detect >= 0) {
>>>
>>> Isn't it "dmic_detect != 0" ?  Otherwise passing dmic_detect=0 would
>>> be treated as positive here.
>>
>> Ah, good catch. I literally copied the enable_msi example here, which
>> relies on >= 0.
>>
>> 	if (enable_msi >= 0) {
>> 		chip->msi = !!enable_msi;
>> 		return;
>> 	}
>>
>> Not sure what the intention was here.
> 
> The MSI-enablement depends on the platform.  enable_msi >=0 means that
> user passed module option explicitly so we follow that.  Otherwise,
> let the system chooses whether to enable MSI or not.
> 
>> Using dmic_detect != 0 wouldn't work for the default -1 value,
>> maybe dmic_detect > 0 is probably a better solution?
> 
> In your case, the logic doesn't look like the dynamically platform
> dependent, so it should be simpler as below:
> 
> static bool dmic_detect = IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC);
> module_param(dmic_detect, bool, 0444);
> 
> and evaluate it
> 
> 	if (dmic_detect) {
> 		ret = azx_check_dmic();
> 		....
> 		
> That is, if Kconfig is set, it's per default enabled, but user can
> still turn it off via option.  Otherwise user needs to enable it via
> option.

Makes sense, thanks for the feedback. Will send a v2 shortly.
Have a nice week-end.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
