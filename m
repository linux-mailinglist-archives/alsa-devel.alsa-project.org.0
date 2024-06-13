Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838EF9074EC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 16:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F551F5;
	Thu, 13 Jun 2024 16:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F551F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718288238;
	bh=uBGfPGLSDyS35xi21zQqLpJGf1TpgfpdYOVUVFNA1uA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fkCegx+HCxwIMYeyB+6x34qVWjVmmQDuyfEVCiOVEdqJTeVQAGwotvU+bb790BUEz
	 kGqVqHM04qz96j4AVaujYFCsOKly4oNJ27dHbk/hzoKchtHqNup55jsAgluBz1nmoX
	 ehhD1LV2RyicTqo/l50cRokSm0Z4KN0z7f7bUY+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A558DF80587; Thu, 13 Jun 2024 16:16:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85AC8F805B1;
	Thu, 13 Jun 2024 16:16:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D59F80448; Thu, 13 Jun 2024 16:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78B7CF800FA
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 16:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B7CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FOvGqvhN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718288202; x=1749824202;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uBGfPGLSDyS35xi21zQqLpJGf1TpgfpdYOVUVFNA1uA=;
  b=FOvGqvhNhLeejguNqsMVtOu4zh25lHdIiVnD1ixZxt3jsyqByWMF1Og7
   DblL75F4Nm0tTrBYm4n4b3nlts7taP/OvRHVw2Xf17bpwI1g4K8ejbIjJ
   dpp3AsqNTRINC1M8sgayPa6P1+uBbECCuas3XvIZHQaP+LgJKQ5QvRqcW
   pIBIatNGz/OLr2Mu8UIy8MihLhxEwpDfrtPVdmqKvYnonl9+Y9hVQLAmG
   gL8VC6CSBooYP4YAsPnWcoOcfwzj/0qlQaUiWbcpvbr8M4oQeM3ZljpvH
   GziWattMN8Gi3AMCdUSxiy3tER93sJMb06rhxNqSdJAvGlBWo8daWSdpt
   w==;
X-CSE-ConnectionGUID: CuFbd4B0Ti2ZpHjAPYclZw==
X-CSE-MsgGUID: bWuAAn/JRM6E4MN6aUrWRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32653734"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000";
   d="scan'208";a="32653734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 07:16:38 -0700
X-CSE-ConnectionGUID: 7+CzAEukS3mJZljMZ8g8Ow==
X-CSE-MsgGUID: AntsQNkkTfCJ6ZJxEr5JHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000";
   d="scan'208";a="40795601"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 07:16:35 -0700
Message-ID: <d7d06d90-d714-4fe6-a191-57c641cff01c@linux.intel.com>
Date: Thu, 13 Jun 2024 16:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ALSA/PCI: add PantherLake audio support
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
 <878qz9nih2.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <878qz9nih2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UDYTEHUUPDFTUIDRIYXXKISVWUPQCZDT
X-Message-ID-Hash: UDYTEHUUPDFTUIDRIYXXKISVWUPQCZDT
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDYTEHUUPDFTUIDRIYXXKISVWUPQCZDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/13/24 14:19, Takashi Iwai wrote:
> On Wed, 12 Jun 2024 08:47:06 +0200,
> Pierre-Louis Bossart wrote:
>>
>> Add the PCI ID for PantherLake.
>>
>> Since there's a follow-up patchset for ASoC, these 3 patches could be
>> applied to the ASoC tree. Otherwise an immutable branch would be
>> needed.
>>
>> Pierre-Louis Bossart (3):
>>   PCI: pci_ids: add INTEL_HDA_PTL
>>   ALSA: hda: hda-intel: add PantherLake support
>>   ALSA: hda: intel-dsp-config: Add PTL support
> 
> Applied now to for-next branch.
> 
> There were duplicated Reviewed-by tags by Peter as checkpatch
> complained, so I removed the one. 

Thanks Takashi, how do we proceed to get those changes into AsoC?

the first patch is a dependency for the patchset "[PATCH v2 0/5]
ASoC/SOF/PCI/Intel: add PantherLake support"
