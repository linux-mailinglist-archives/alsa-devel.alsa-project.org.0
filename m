Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C764D65A5
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 17:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05FF61FC;
	Fri, 11 Mar 2022 17:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05FF61FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647014484;
	bh=G2lviAvcQmxDnRrrlA4DobPug2p3rYJgPnUrP4kaK6U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F99jSrui2SoQak3JBcAGwWO1uwmSNb7M5rYw2Pm2pQ5AUKzMO752Aw37SQAgfoNdt
	 PyBQNVSvRyDYzx8d8h9RJVxTOIb2AdIFyQT9z5yg1wwz2MB8OlUgP7XRjCoj9jeX+1
	 DSawWLMN2X8Z/TzGnkaAk1CCOx8/uTlR/dUhdz64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F43EF80085;
	Fri, 11 Mar 2022 17:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6741EF801D8; Fri, 11 Mar 2022 17:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DA91F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 17:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA91F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fY2HGiti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647014413; x=1678550413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G2lviAvcQmxDnRrrlA4DobPug2p3rYJgPnUrP4kaK6U=;
 b=fY2HGiti+QivqvjSbSdwXWLVA+0JdmFBhj3dJ30Wc1ZCwjoohkoHUKIS
 ekHqa6E0IM8H78uksOFPx8SFiwnUe5x56mXPR0hdLTi3RYGjc1pS6M07Z
 FYaJnXKj2AVpRAPPRG2Dy0zxe6PXAKGsM1pyrVVSx8n/zMCuOKfBNGx83
 gjDqxP5D526pvdVuXODg7tBPZko8lcjpbq3+qE0IB/XQaxB1+EcCTFAFe
 uY4pDNFWLOMBSPgPkSEH2QzBZIonwmUuZMxEi27q2uqHf3zPDsqv6Ma+7
 HTJDP2QM5zHNtwCy080MjiJ2Fkmyu5YCvkXp3VTL2oxSJiqlDHQ8iL9qP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253160416"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="253160416"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 08:00:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="548493386"
Received: from nmahendr-mobl1.amr.corp.intel.com (HELO [10.209.12.104])
 ([10.209.12.104])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:59:58 -0800
Message-ID: <7deed9cd-0123-1903-00dd-4b7ce9232f14@linux.intel.com>
Date: Fri, 11 Mar 2022 09:59:20 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <05f38bf1-4400-354e-bfc6-636e602201f7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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



On 3/11/22 09:46, Cezary Rojewski wrote:
> On 2022-03-09 11:36 PM, Pierre-Louis Bossart wrote:
>>
>>>   /*
>>>    * struct avs_dev - Intel HD-Audio driver data
>>>    *
>>>    * @dev: PCI device
>>>    * @dsp_ba: DSP bar address
>>>    * @spec: platform-specific descriptor
>>> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG message
>>> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG message
>>> + * @mods_info: Available module-types, obtained through MODULES_INFO 
>>> message
>>
>> is this just for the base firmware? If this includes the extensions, 
>> how are the module types defined?
> 
> 
> Only base firmware is able to process MODULE_INFO getter. So, every time 
> driver loads a library, this info gets updated internally on the 
> firmware side. We make use of said getter to retrieve up-to-date 
> information and cache in ->mods_info for later use. ->mods_info is a 
> member of type struct avs_mods_info with each enter represented by 
> struct avs_module_info. These are introduced with all the basefw runtime 
> parameters.

you clarified the mechanism but not the definition of 'module-type'?

the definition doesn't really help.

struct avs_module_type {
	u32 load_type:4;
	u32 auto_start:1;
	u32 domain_ll:1;
	u32 domain_dp:1;
	u32 lib_code:1;
	u32 rsvd:24;
} __packed;

I see nothing that would e.g. identify a mixer from a gain. The 
definition of 'type' seems to refer to low-level properties, not what 
the module actually does?
