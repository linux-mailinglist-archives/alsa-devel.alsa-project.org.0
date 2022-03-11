Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0544D697A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A3C18E7;
	Fri, 11 Mar 2022 21:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A3C18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030682;
	bh=kfQ4MBKmAE+cVv6LDcBGqWoEPaKkteKWhLBT/qbGuk0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1Chmd0UOzV4JPi7Af0KTouVhVaLER80WDnZhqbdSlulSYutfeVScklCAGX3b90Qp
	 o/+VRqEkOSOLBDPf96RU1cOQydeiE0D9ordHjR+iJSjRfn2+exuv3nTv0uUA9uTHTp
	 m1bYZGD4oXFDly5cWyGg3WEdTbfPlvs9iLU9n7YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C95CF80238;
	Fri, 11 Mar 2022 21:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2BA7F80227; Fri, 11 Mar 2022 21:30:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3065AF8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3065AF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eAkd/lRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647030612; x=1678566612;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kfQ4MBKmAE+cVv6LDcBGqWoEPaKkteKWhLBT/qbGuk0=;
 b=eAkd/lRVimCqgGHJ5XIrmmvFNvjPznwSbb17i90A9PFkFBvJU28ZNM4T
 UJFXhVrBw7THXtWelW15qSwhYhIoomNq7jwTMbY5TjlRf/dkjMNwOC5D6
 L+58VqFdH2ed2L1tjPfixZDkNE7w0MFETAvSoo2X3mzivbOEqRLBc5L93
 v5ge2C/fHWHRb8ygj9HI93ekc6WZeAISzRI6I24M72Un7OES0ZqHdUUdl
 eAknOicuZA9obIGodHQuSRK64ifu2G5lUyMPJnOrg0gWvcJ4YYvdI3wO7
 ZpKO7muyzrEsfNj0D4XBJBx6kheviI7su0YhZerDzA9jma2TSKKUwG3Zl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="253210533"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="253210533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 12:30:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="579407571"
Received: from weilili-mobl2.amr.corp.intel.com (HELO [10.209.103.214])
 ([10.209.103.214])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 12:30:06 -0800
Message-ID: <936f37e6-e0de-b0da-a4ae-ff52ff8af136@linux.intel.com>
Date: Fri, 11 Mar 2022 14:30:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
 <05f38bf1-4400-354e-bfc6-636e602201f7@intel.com>
 <7deed9cd-0123-1903-00dd-4b7ce9232f14@linux.intel.com>
 <8560cb93-c2f8-a486-61d8-7955d888d97b@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8560cb93-c2f8-a486-61d8-7955d888d97b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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



On 3/11/22 11:20, Cezary Rojewski wrote:
> On 2022-03-11 4:59 PM, Pierre-Louis Bossart wrote:
>> On 3/11/22 09:46, Cezary Rojewski wrote:
>>> On 2022-03-09 11:36 PM, Pierre-Louis Bossart wrote:
>>>>
>>>>>   /*
>>>>>    * struct avs_dev - Intel HD-Audio driver data
>>>>>    *
>>>>>    * @dev: PCI device
>>>>>    * @dsp_ba: DSP bar address
>>>>>    * @spec: platform-specific descriptor
>>>>> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG 
>>>>> message
>>>>> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG 
>>>>> message
>>>>> + * @mods_info: Available module-types, obtained through 
>>>>> MODULES_INFO message
>>>>
>>>> is this just for the base firmware? If this includes the extensions, 
>>>> how are the module types defined?
>>>
>>>
>>> Only base firmware is able to process MODULE_INFO getter. So, every 
>>> time driver loads a library, this info gets updated internally on the 
>>> firmware side. We make use of said getter to retrieve up-to-date 
>>> information and cache in ->mods_info for later use. ->mods_info is a 
>>> member of type struct avs_mods_info with each enter represented by 
>>> struct avs_module_info. These are introduced with all the basefw 
> 
> Sorry for the typo: s/avs_module_info/avs_module_entry/.
> 
>>> runtime parameters.
>>
>> you clarified the mechanism but not the definition of 'module-type'?
>>
>> the definition doesn't really help.
>>
>> struct avs_module_type {
>>      u32 load_type:4;
>>      u32 auto_start:1;
>>      u32 domain_ll:1;
>>      u32 domain_dp:1;
>>      u32 lib_code:1;
>>      u32 rsvd:24;
>> } __packed;
>>
>> I see nothing that would e.g. identify a mixer from a gain. The 
>> definition of 'type' seems to refer to low-level properties, not what 
>> the module actually does?
> 
> 
> There is no "module-type" enum that software can rely on. We rely on 
> hardcoded GUIDs instead. "module-type" is represented by struct 
> avs_module_entry (per type) in context of MODULE_INFO IPC. All these 
> names are indented to match firmware equivalents to make it easier to 
> switch between the two worlds.

So the initial kernel-doc I commented on is still quite convoluted, you 
are referring to a 'module-type' that's not really well defined or 
useful for a driver.

Given the definition:

struct avs_mods_info {
	u32 count;
	struct avs_module_entry entries[];
} __packed;


wouldn't this be simpler/less confusing:

"
@mods_info: Available array of module entries, obtained through
MODULES_INFO message
"

?
