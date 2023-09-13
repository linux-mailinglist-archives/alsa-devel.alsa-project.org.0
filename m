Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD83179E57A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 12:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB82D9F6;
	Wed, 13 Sep 2023 12:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB82D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694602653;
	bh=7zKWllqNpufIGQKkp3M02DaPOPfaIyuVruYujMZGUaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M0vPTv/2Qj7W8kwHV4E6lFDi1BLSNzIn5SLbXC/JK0k9b9/GiWkWXtDEE+9K5nVi5
	 GaeYbCXVc0FGNTrVqS8ALf+BEd5ZC6u6dVLgKgrJSfbrb9DoQN8GvCdZOB0DEFojMq
	 yguf9HXbErbzvmxZgCHn2+ObLgMG/spFHYN8XhvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66596F80551; Wed, 13 Sep 2023 12:56:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F17BF80246;
	Wed, 13 Sep 2023 12:56:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F2AF80425; Wed, 13 Sep 2023 12:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84678F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 12:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84678F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BUNWMlZh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602574; x=1726138574;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7zKWllqNpufIGQKkp3M02DaPOPfaIyuVruYujMZGUaI=;
  b=BUNWMlZhLaaWyX+qApkGU2XNgyEJDlKM/quZMl/l0IwWyewyjZGDtV7/
   3kReXtMmhNh01AEzdEmB3XZ0/uqbhErrfd0VtJLW3nO8iwEOsn9otXSMn
   UavysjfIN0ChIqSPe/leArwWBR9ttZH9AMy20Bm6GnFulNuK5Pri5F2OH
   +DewNvDa90Zj2hggjY0WutujnsuOPfWhlSyc+rrQtKsjveSUambe7eJbZ
   SfurqH5EemiS+dwTSO2sOoUQOkTEC5KrjtfO+rV6ZAXdU27CRKZXLpERO
   JeQlZLn0I7iLNGKn0zFaLtEeeDR9ocYNo2zr6sQH9riKVxdnEtG9EFGFY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464996431"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000";
   d="scan'208";a="464996431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 03:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693810585"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000";
   d="scan'208";a="693810585"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 03:56:05 -0700
Message-ID: <92b2b69e-3175-651f-45bb-d9ae11eaec82@linux.intel.com>
Date: Wed, 13 Sep 2023 12:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/4] ASoC: soc-card: Add storage for PCI SSID
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
 <20230912163207.3498161-2-rf@opensource.cirrus.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230912163207.3498161-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GBNGR34DADSMYXNR752FIM5YCDRR6GQP
X-Message-ID-Hash: GBNGR34DADSMYXNR752FIM5YCDRR6GQP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBNGR34DADSMYXNR752FIM5YCDRR6GQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/12/2023 6:32 PM, Richard Fitzgerald wrote:
> Add members to struct snd_soc_card to store the PCI subsystem ID (SSID)
> of the soundcard.
> 
> The PCI specification provides two registers to store a vendor-specific
> SSID that can be read by drivers to uniquely identify a particular
> "soundcard". This is defined in the PCI specification to distinguish
> products that use the same silicon (and therefore have the same silicon
> ID) so that product-specific differences can be applied.
> 
> PCI only defines 0xFFFF as an invalid value. 0x0000 is not defined as
> invalid. So the usual pattern of zero-filling the struct and then
> assuming a zero value unset will not work. A flag is included to
> indicate when the SSID information has been filled in.
> 
> Unlike DMI information, which has a free-format entirely up to the vendor,
> the PCI SSID has a strictly defined format and a registry of vendor IDs.
> 
> It is usual in Windows drivers that the SSID is used as the sole identifier
> of the specific end-product and the Windows driver contains tables mapping
> that to information about the hardware setup, rather than using ACPI
> properties.
> 
> This SSID is important information for ASoC components that need to apply
> hardware-specific configuration on PCI-based systems.
> 
> As the SSID is a generic part of the PCI specification and is treated as
> identifying the "soundcard", it is reasonable to include this information
> in struct snd_soc_card, instead of components inventing their own custom
> ways to pass this information around.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   include/sound/soc-card.h | 37 +++++++++++++++++++++++++++++++++++++
>   include/sound/soc.h      | 11 +++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
> index fc94dfb0021f..e8ff2e089cd0 100644
> --- a/include/sound/soc-card.h
> +++ b/include/sound/soc-card.h

...

> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 509386ff5212..81ed08c5c67d 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -929,6 +929,17 @@ struct snd_soc_card {
>   #ifdef CONFIG_DMI
>   	char dmi_longname[80];
>   #endif /* CONFIG_DMI */
> +
> +#ifdef CONFIG_PCI
> +	/*
> +	 * PCI does not define 0 as invalid, so pci_subsystem_set indicates
> +	 * whether a value has been written to these fields.
> +	 */
> +	unsigned short pci_subsystem_vendor;
> +	unsigned short pci_subsystem_device;
> +	bool pci_subsystem_set;
> +#endif /* CONFIG_PCI */
> +
>   	char topology_shortname[32];
>   
>   	struct device *dev;

This looks bit weird to me, snd_soc_card is _generic_ struct which is 
not device specific in any way, and now you add fields for PCI, can't 
this somehow be done using drvdata or something?

