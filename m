Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0F1D8830
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 21:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBBBE1790;
	Mon, 18 May 2020 21:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBBBE1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589829935;
	bh=4D1+aNUe7QfnO2HpiOltYHSIRBtsaJf9NFsnpwZ3Am0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eaTmKdlvnnDUE4zsXV7zyfrNJbp9qPhm4/B/xwH1bYUOKDCDrb7fQXGaAd2pTj3Vx
	 tVCMOJ1O42mHBtXQY/qEaaKDpLZC/Uis0/Bf0UR9Hv1vnKA5V8wp2lJ6KM+8DehBbY
	 U03FU/NBkzrmPlW1WhyTfdVvxXtfuNCRSTjBiTjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C2FF80086;
	Mon, 18 May 2020 21:23:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8CAAF801DA; Mon, 18 May 2020 21:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74532F80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 21:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74532F80086
IronPort-SDR: Buu+w3LV3etE+PfpfeRj93LmiG1k//wHSqGC86YqGlnTSd/vsdvYvBHzGpFSkjRdBhG7HC/AbZ
 +qIsIj85n7NQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 12:23:41 -0700
IronPort-SDR: Kmm2rgOH556Z7cn8Z4zGzYBTW/0FayI+P7NCGQvfATSGxBtzbkbOi3ZPkjyfj0CtxYlWPffg1m
 ENVX1nKR7YQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="465696512"
Received: from iremsen-mobl1.amr.corp.intel.com (HELO [10.254.66.150])
 ([10.254.66.150])
 by fmsmga005.fm.intel.com with ESMTP; 18 May 2020 12:23:40 -0700
Subject: Re: [PATCH v3 00/14] Add Renoir ACP driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org, tiwai@suse.de
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1f9edc27-fe32-ee74-9882-66e9e553d4de@linux.intel.com>
Date: Mon, 18 May 2020 12:31:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com
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



On 5/18/20 12:16 PM, Vijendar Mukunda wrote:
> This adds an ASoC driver for the ACP (Audio CoProcessor)
> block on AMD Renoir APUs.

All my feedback was taken into account and I didn't see any new issues so:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I wouldn't hurt to have additional reviewers though.

> V3:
> - Changed PCI driver PM runtime sequence
> - Removed redundant code in Renoir machine driver
> 
> V2:
> - Removed empty declaration of dai_ops
> - Removed SNDRV_PCM_INFO_BATCH flag
> - Defined Macros for delay and counter and corrected dma stop sequence.
> - Changed PCI driver pm runtime sequence
> - Removed redundant code
> 
> 
> Vijendar Mukunda (14):
>    ASoC: amd: add Renoir ACP3x IP register header
>    ASoC: amd: add Renoir ACP PCI driver
>    ASoC: amd: add acp init/de-init functions
>    ASoC: amd: create acp3x pdm platform device
>    ASoC: amd: add ACP3x PDM platform driver
>    ASoC: amd: irq handler changes for ACP3x PDM dma driver
>    ASoC: amd: add acp3x pdm driver dma ops
>    ASoC: amd: add ACP PDM DMA driver dai ops
>    ASoC: amd: add Renoir ACP PCI driver PM ops
>    ASoC: amd: add ACP PDM DMA driver pm ops
>    ASoC: amd: enable Renoir acp3x drivers build
>    ASoC: amd: create platform devices for Renoir
>    ASoC: amd: RN machine driver using dmic
>    ASoC: amd: enable build for RN machine driver
> 
>   sound/soc/amd/Kconfig                      |  13 +
>   sound/soc/amd/Makefile                     |   1 +
>   sound/soc/amd/renoir/Makefile              |   7 +
>   sound/soc/amd/renoir/acp3x-pdm-dma.c       | 530 +++++++++++++++++++++
>   sound/soc/amd/renoir/acp3x-rn.c            |  77 +++
>   sound/soc/amd/renoir/rn-pci-acp3x.c        | 344 +++++++++++++
>   sound/soc/amd/renoir/rn_acp3x.h            |  88 ++++
>   sound/soc/amd/renoir/rn_chip_offset_byte.h | 349 ++++++++++++++
>   8 files changed, 1409 insertions(+)
>   create mode 100644 sound/soc/amd/renoir/Makefile
>   create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c
>   create mode 100644 sound/soc/amd/renoir/acp3x-rn.c
>   create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
>   create mode 100644 sound/soc/amd/renoir/rn_acp3x.h
>   create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h
> 
