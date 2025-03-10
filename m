Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2709A592C4
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 12:31:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662D760771;
	Mon, 10 Mar 2025 12:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662D760771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741606294;
	bh=Dgj6SEX5lRYAJLTBu9cYyh2ofDqV7FDTJGHm9kmRnss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P1MfM6mzHNm5P/XIk++ge/ZCA2z3gNw711EsZSI34v3OJCYVT7PxmZC0+lUTkANqy
	 NdXjCu9hceySzGucWNGGaajvEACqVRhbwpoUTj3jbDEhaCJjoUMpcAsOLs8ny03I7l
	 vGvxu2i1T15y9WRuqpo8UQoFxflrrw4vcHjTbpGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868A2F804F3; Mon, 10 Mar 2025 12:31:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A90F804F3;
	Mon, 10 Mar 2025 12:31:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 417C9F800ED; Mon, 10 Mar 2025 12:30:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE028F800BD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 12:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE028F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WlEM3Qo7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741606257; x=1773142257;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Dgj6SEX5lRYAJLTBu9cYyh2ofDqV7FDTJGHm9kmRnss=;
  b=WlEM3Qo7oCvWUZnMWaGjSBeB3Ck6zQFyfmzBNlN/WcieR3iN42P/8DiY
   0hByyRXGuTztKAPpG5HEg78EcdkZB1ThOHYG1sNSj2Mtpi/oeYRostSI+
   rC6JJePiHZEFqZw8jXl4nBRiA6g3qTEG22oEJcOOiH4XhScZZFPGWOaBZ
   cvN85h2Doht2kweJmInhCf4nq7pgyGPQRCX43OeDex4o+wCRI9xnLKl1D
   6PSadFXCyT4YkKmHEbJ1gK/z473SLaCYxI969xuVwHXK9vWQQG6wvpfUi
   /yZVAFE5JBL77enac1cXZmhgEshxD5MfbdJ+HAFkrVqlS2f0RhzXCffHC
   g==;
X-CSE-ConnectionGUID: MnLEgIbvT0Or8sJmnSr+Xg==
X-CSE-MsgGUID: SsrtrE5pTxSvLv+9fi+cnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42448776"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600";
   d="scan'208";a="42448776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:30:53 -0700
X-CSE-ConnectionGUID: QJwWIv53Ra+hfKOJGzftNg==
X-CSE-MsgGUID: 8A/GBRLwQ6ejwJn7LM5oqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600";
   d="scan'208";a="124574190"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:30:47 -0700
Message-ID: <6e892094-ff90-41ef-ac56-b7fcf6abf2a8@linux.intel.com>
Date: Mon, 10 Mar 2025 12:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] ASoC: amd: acp: Refactor dmic-codec platform device
 creation
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
 <20250310104601.7325-4-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250310104601.7325-4-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 26HLE5U7RLJ7RXPMDTVCBGCTJNIXADM5
X-Message-ID-Hash: 26HLE5U7RLJ7RXPMDTVCBGCTJNIXADM5
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26HLE5U7RLJ7RXPMDTVCBGCTJNIXADM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/10/2025 11:45 AM, Venkata Prasad Potturu wrote:
> Refactor dmic-codec platform driver creation using helper function.
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
>   sound/soc/amd/acp/acp-pci.c | 49 +++++++++++++++++++++++++------------
>   sound/soc/amd/acp/amd.h     |  1 +
>   2 files changed, 35 insertions(+), 15 deletions(-)
> 

...

>   	addr = pci_resource_start(pci, 0);
>   	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
>   	if (!chip->base) {
>   		ret = -ENOMEM;
> -		goto unregister_dmic_dev;
> +		goto release_regions;
>   	}
>   
>   	chip->acp_hw_ops_init(chip);
>   	ret = acp_hw_init(chip);
>   	if (ret)
> -		goto unregister_dmic_dev;
> +		goto release_regions;
>   

...

> @@ -168,8 +187,8 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
>   	pm_runtime_allow(&pci->dev);
>   	return ret;
>   
> -unregister_dmic_dev:
> -	platform_device_unregister(dmic_dev);
> +de_init:
> +	chip->acp_hw_ops->acp_deinit(chip);

On init you call acp_hw_init(), but here you call ->acp_deinit() 
directly instead of acp_hw_deinit()?

>   release_regions:
>   	pci_release_regions(pci);
>   disable_pci:


