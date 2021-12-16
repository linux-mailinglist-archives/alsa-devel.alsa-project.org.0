Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293E477420
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA9BB1B3A;
	Thu, 16 Dec 2021 15:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA9BB1B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639664015;
	bh=BOfwAhF4enQ6+6xVVOsqt76Pq+YsQr/EuBeEQVymS8A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j47NPxu3TCDfLGsXaLVA97Qbpw1tOG312h2aQ7oxCGGVK0cd78VyOF8fCNTP7PDjF
	 CpsBjjOFMuwIVxyz2FvxY9iXhaH/JgRHkPuQZDAut3Cyk/aRjKFQpuH+frsBBYDnBW
	 8Bhu2JXLfnDeYSRAp5QgLdlxYz1uhwLfBluo2YEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 422B8F8015B;
	Thu, 16 Dec 2021 15:12:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71DC3F800DE; Thu, 16 Dec 2021 15:12:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F83F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 15:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F83F800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239449694"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239449694"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:12:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="755920604"
Received: from kloriaal-mobl2.amr.corp.intel.com (HELO [10.213.169.180])
 ([10.213.169.180])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:12:17 -0800
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
Date: Thu, 16 Dec 2021 08:11:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216115743.2130622-5-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com
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


> +struct snd_soc_acpi_mach lpt_machines[] = {
> +	{
> +		.id = "INT33CA",
> +		.drv_name = "haswell-audio",
> +	},
> +	{}
> +};
> +
> +struct snd_soc_acpi_mach wpt_machines[] = {
> +	{
> +		.id = "INT343A",
> +		.drv_name = "broadwell-audio",
> +	},
> +	{
> +		.id = "10EC5650",
> +		.drv_name = "bdw-rt5650",
> +	},
> +	{
> +		.id = "RT5677CE",
> +		.drv_name = "bdw-rt5677",
> +	},
> +	{
> +		.id = "INT33CA",
> +		.drv_name = "haswell-audio",
> +	},
> +	{}
> +};

The intent of soc-acpi files is to establish a match between ACPI _HID
and machine driver, this is now duplicated, and it makes limited sense
to add machine driver dependencies in a platform driver.

Nothing was broken with the existing code.

