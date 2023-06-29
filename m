Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878D7421F6
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 10:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A02D850;
	Thu, 29 Jun 2023 10:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A02D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688026855;
	bh=iDqHrC+b5je00aAWpKWWDWwFkzD6FMRna9LaqlrNfh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JQdPo7a1oft3ZyMVj48ktzcC1HHktjf4A8gp2MS88iDme7iuB6pBFhqWEPWKe3HEL
	 9KpvIbcqfF5a7210rHLrt9TXmHsxSUCh37yilfi5zrWsdpKXywYdxPQNf+8OjgmBtv
	 rDjsrHlA+jPf8GJ+c2alhFR1OiF2h5eB80SDUqTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8A5F80578; Thu, 29 Jun 2023 10:19:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC3CF80568;
	Thu, 29 Jun 2023 10:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A42BCF80570; Thu, 29 Jun 2023 10:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64508F8053B
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 10:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64508F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PR/xQNn6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688026754; x=1719562754;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iDqHrC+b5je00aAWpKWWDWwFkzD6FMRna9LaqlrNfh8=;
  b=PR/xQNn6UVk4wRTewiemvcqRAyxsYSRaHMKmTTBJX9Xxdn7oENyss2wo
   ypQUG/gG9GKoRxGsKKz7vqG10rEnqA7wRNKhNi7hqjbkpqX7ANfWJq0uV
   Xi+h0Xf68A4aDUIRknyIdtxQtlHT3/vsWLk/NbKp9ZqzlxtKzVKXVROB0
   73VDMV4YXOeYlldVYJfSHiePSk0lar6YWreSkSfJKolAoo64NeueRwV45
   3IP6FBqdZBLvNLJryngx2rBCSRXfjkhZsbbxZDbhUxaiydZJneZ/VyI1o
   a3LeeyPhhpSH/QLZqjDff47UcAAWJ50O4FJjbecOFb8Srp9b05FruSxxJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351854340"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="351854340"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891331273"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="891331273"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:19:08 -0700
Message-ID: <ca1ede5f-0859-5eea-f59c-9377d5945b71@linux.intel.com>
Date: Thu, 29 Jun 2023 10:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 7/8] ASoC: Intel: Skylake: Update PCI ID list
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-8-amadeuszx.slawinski@linux.intel.com>
 <ZJxJMg0bldj/M7TY@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZJxJMg0bldj/M7TY@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R7XK5X4JNDFECVVWGZGP4WQTADLCAFTB
X-Message-ID-Hash: R7XK5X4JNDFECVVWGZGP4WQTADLCAFTB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7XK5X4JNDFECVVWGZGP4WQTADLCAFTB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/28/2023 4:52 PM, Andy Shevchenko wrote:
> On Wed, Jun 28, 2023 at 10:51:34PM +0200, Amadeusz Sławiński wrote:
>> Use PCI device IDs from pci_ids.h header and while at it change to using
>> PCI_DEVICE_DATA macro, to simplify declarations.
> 
> PCI_DEVICE_DATA()
> 
> ...
> 
>> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP,	&snd_soc_acpi_intel_skl_machines) },
> 
> Do you really need TAB(s) in the parameter list?
> 

I did this to align entries, I know it is not that visible in this 
patch, but they are defined close to each other and I feel that it looks 
better if they are aligned, but can drop alignment if you prefer. Should 
I also drop them in other patches, as I don't see comment for that?
