Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AF9B7B6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 560C61668;
	Fri, 23 Aug 2019 22:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 560C61668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592474;
	bh=5Ysznr3+ZV2cJofhWUinWAkL0/QOA0Pyesut+qjMbi4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSF5e0gwIE6ai303qYlV+ykGwf0s8d/eLMeLGESmbFToKKFE9EF0pLTit496KHDCC
	 FRtv+Nx+GEKWX/jSNq4n8TkQCYDLo8V3b7fCle9DpAwoxV/ICyN/2JW5WNZK2BR3Pu
	 iiJCoe5VkNM0y2YdJ8XnThiJnLP8GnfuXBLpKodo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B264F805E1;
	Fri, 23 Aug 2019 22:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CA5F80649; Fri, 23 Aug 2019 22:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8734FF805E0
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8734FF805E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718220"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:11 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-22-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <30929d7b-787d-3b6e-d806-02487b85ab8d@linux.intel.com>
Date: Fri, 23 Aug 2019 14:32:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-22-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 21/35] ASoC: Intel: Expose ACPI loading
 members
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


> diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
> index 63c29bb45cf1..a2ac7998fbdb 100644
> --- a/sound/soc/intel/common/sst-dsp.h
> +++ b/sound/soc/intel/common/sst-dsp.h
> @@ -166,6 +166,27 @@
>   #define SST_PMCS_PS_MASK	0x3
>   
>   struct sst_dsp;
> +struct platform_device;

that should be handled with an include, not redefining a type here.

> +
> +/* Descriptor for setting up SST platform data */
> +struct sst_acpi_desc {
> +	const char *drv_name;
> +	struct snd_soc_acpi_mach *machines;
> +	/* Platform resource indexes. Must set to -1 if not used */
> +	int resindex_lpe_base;
> +	int resindex_pcicfg_base;
> +	int resindex_fw_base;
> +	int irqindex_host_ipc;
> +	int resindex_dma_base;
> +	/* Unique number identifying the SST core on platform */
> +	int sst_id;
> +	/* DMA only valid when resindex_dma_base != -1*/
> +	int dma_engine;
> +	int dma_size;
> +};
> +
> +int sst_acpi_probe(struct platform_device *pdev);
> +int sst_acpi_remove(struct platform_device *pdev);
>   
>   /*
>    * SST Platform Data.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
