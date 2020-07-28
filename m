Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48232310FC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 19:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A70172B;
	Tue, 28 Jul 2020 19:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A70172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595957563;
	bh=GGq5kA6hExGcqNx51boScxEY7LHPPbRFCXWjTJFXMII=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajFk6DlhpNmcMn+ggVq0iYmrtUXZfC0fVQLbpn2IC8CintB4KFGr4Mg1kglufgjOZ
	 ArSvIM24pDHPUvQpM+6H5Qcncd65syx/cukbYMNuqJe4vvtH/VV71TDhiRZBnVh6RP
	 YfblufnoMBAPfF/waDgd7DmcsWOH4yo1MNl0MG3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8011DF80227;
	Tue, 28 Jul 2020 19:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B9AF8021E; Tue, 28 Jul 2020 19:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64342F800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 19:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64342F800AD
IronPort-SDR: R5Es711rys8u7A+igkKIDj5Yy7g2oBj5CPE+TDic0XkBWouGevGcGYcKyWIa6+I4FuQaWlsXZd
 K4RyfWJ/1vXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="169388601"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="169388601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 10:30:44 -0700
IronPort-SDR: DwxaHGXDLk42xrkK1saXPf7wGs4U/NCt5iDKo6m7GLtJjdB9RNEc15K7nKAZRrVJDCxtyzYJ2s
 pqqOuNDOlNKA==
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="312709438"
Received: from bsabi-sp.amr.corp.intel.com (HELO [10.212.23.21])
 ([10.212.23.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 10:30:43 -0700
Subject: Re: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
 <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
 <DM6PR11MB3642BE84A5C91504D6AF4ECB97730@DM6PR11MB3642.namprd11.prod.outlook.com>
 <14fde5e9-a11a-077d-b533-1e6db4b7a262@linux.intel.com>
 <DM6PR11MB3642AF0905E0CF57B094906297730@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <216b86eb-aec6-dab9-7901-9e0f2cc5af7f@linux.intel.com>
Date: Tue, 28 Jul 2020 12:30:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB3642AF0905E0CF57B094906297730@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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



On 7/28/20 12:02 PM, Lu, Brent wrote:
>>
>> So if there are already quirks in atom machine drivers to change the period
>> size, why is this patch necessary?
>>
> 
> The story is: google implemented the constraint but doesn't know why it works
> so asked us to explain. After checking the two counters I realized the increase of
> ring buffer pointer follows the period size setting in hw_param (256) but the
> period of interrupt is always 5ms instead of 5.33 so it's running little bit too fast.
> It seems the LPE keeps tracking the difference of two counters. When the
> difference exceeds 2160 samples, the next interrupt will be canceled so the
> hardware counter could catch up a little.
> 
> [   43.208299] intel_sst_acpi 808622A8:00: mrfld ring_buffer_counter 107520 hardware_counter 98880 pcm delay 8640 (in bytes)
> [   43.208306] intel_sst_acpi 808622A8:00: buffer ptr 26880 pcm_delay rep: 2160
> [   43.208321] sound pcmC1D0p: [Q] pos 26880 hw_ptr 26880 appl_ptr 40000 avail 191680
> => one interrupt is skipped.
> [   43.218299] intel_sst_acpi 808622A8:00: mrfld ring_buffer_counter 108544 hardware_counter 100800 pcm delay 7744 (in bytes)
> [   43.218307] intel_sst_acpi 808622A8:00: buffer ptr 27136 pcm_delay rep: 1936
> [   43.218336] sound pcmC1D0p: [Q] pos 27136 hw_ptr 27136 appl_ptr 40000 avail 191936
> 
> So I think why not using the hardware counter? It increases 240 samples every 5ms
> perfectly match the 48000 sample rate. The test result is good but I know there must
> be a reason for the original designer to use ring buffer counter instead of hardware
> counter. I uploaded this patch to see if anyone still remember the reason and share
> some insight with me.
> 
> I totally agree that we shouldn't touch this part of design. Do you think it make sense
> to add a constraint to enforce the period size in machine driver? If yes then I would
> upload patches for Chrome atom machines for google.

I think it'd make sense to add this constraint, either in the machine 
driver or in the platform driver, so that we don't change the position 
updates and introduce more issues by accident by doing so. As you 
rightly said, I don't think anyone tested periods multiple of 256 
samples so it's not a regression, more aligning with the internal design.
