Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE4753B44
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC24AEA;
	Fri, 14 Jul 2023 14:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC24AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689338711;
	bh=WF/K2HzY3n3CH1+aoKkuQP7RvM/fmg1fj65u6T6pEec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PREd1cE4qeL3B6AXOHXtssUR65GRoGaIKxiZ59FF5JSGW3hckR4PbfmxwxCwPbnW+
	 nOSidPUdJRGEg7PNhSKLEqrLy7ikXRGyY3Penm2w8nkC6t9rleK9XP/J+0z8Fxltg6
	 OrOHWMmhujgCD4oDMjcDRJ+pVAS0BEU+I95534fI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65BADF8047D; Fri, 14 Jul 2023 14:44:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 282EBF80153;
	Fri, 14 Jul 2023 14:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D45FFF80236; Fri, 14 Jul 2023 14:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5B00F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B00F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F0l0GY5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338655; x=1720874655;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WF/K2HzY3n3CH1+aoKkuQP7RvM/fmg1fj65u6T6pEec=;
  b=F0l0GY5dT4jvVkURAeSo0M4IvIbEG4NPkkhIoaO5DvpzO9W6AqijfrVS
   sEph4oDk+9MgVuboQQVgxHSir8nJsS02CBMZnFfBE3NRwYgoON82Z4NC8
   lHRXcCkpg3XoGEXE1IvfDglnB7tx0EYBHBtwtNltprcB+KUwwOwrrFn0g
   sH5LqAaMSt4RGdulrsZVnfFzsbk3NmRETFSTRkSLtXO5IDewjQNoaPpFA
   ZIpzeifw8ciRvddZVeMbaiQU+1UOtTGuS3bGxl4yXLvNL3sFjiCKoWVz4
   w41nkgRNE55YR+xrgbWK0z5p+XYuSLj30RFZqbEjfpJqt8vLGFDiFrmda
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368104466"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="368104466"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812423824"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="812423824"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:44:08 -0700
Message-ID: <a23f2c59-34a7-f5d0-f2a2-44364fc1e37c@linux.intel.com>
Date: Fri, 14 Jul 2023 14:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/15] ASoC: SOF: Remove unused Broxton PCI ID
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
 <20230714202457.423866-4-amadeuszx.slawinski@linux.intel.com>
 <ZLFBBzmJXgXeWZ0y@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZLFBBzmJXgXeWZ0y@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GW7POFK4MYPPG4AN7ISQ3VEGZJI2NS6M
X-Message-ID-Hash: GW7POFK4MYPPG4AN7ISQ3VEGZJI2NS6M
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GW7POFK4MYPPG4AN7ISQ3VEGZJI2NS6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/14/2023 2:35 PM, Andy Shevchenko wrote:
> On Fri, Jul 14, 2023 at 10:24:45PM +0200, Amadeusz Sławiński wrote:
>> Current code references 0x1a98 which is BXT-M (not -T as it is
>> commented) and it's an RVP, BXT-M B0 to be specific. From what we know
>> no BXT is available on market.
> 
> ...
> 
>>   sound/hda/intel-dsp-config.c  | 7 -------
>>   sound/soc/sof/intel/pci-apl.c | 2 --
> 
> I dunno how SOF and HDA are related to each other, but in the next patch you
> also do something about HDA, either group all of them, or split HDA, or split
> on per file basis. I'm not familiar with the relationship between them up to
> you which way you choose.
> 

Well SOF is a DSP driver, so that's why I split it from HDA - 
intel-dsp-config.c file is used to perform checks to know if it should 
load DSP driver (and which one), hence the "weird" split.
