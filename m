Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37010E77C1
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 18:42:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38F220AC;
	Mon, 28 Oct 2019 18:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38F220AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572284533;
	bh=P+Qx6bcyeDxqf83szVv+PVAsbaIq0Oe+5bDVlDjfoPQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vMl4uT6DMY35duCCf5m+vAcctov3bUKtepBEzLt/3vSM4M192VZmibM0ZjhfdEs2h
	 5Xy/CsymT2Re3DiMGJD+9PzHjbXA53sFfuQM7UWvJYoBUKltSjERLX+T1tEmRWfUB8
	 oCHhn5HIqiVwsV8ukFUhedbfLz+XfGW1LkwRne8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEDA1F802BD;
	Mon, 28 Oct 2019 18:40:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BF4F80361; Mon, 28 Oct 2019 18:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB2AF800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 18:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB2AF800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="229767256"
Received: from jshaw2-mobl2.amr.corp.intel.com (HELO [10.252.142.88])
 ([10.252.142.88])
 by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2019 10:40:20 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191028173329.29538-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <41808a43-7977-1222-108f-194f28f3ba9b@linux.intel.com>
Date: Mon, 28 Oct 2019 12:40:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191028173329.29538-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF - remove the dead code
	(skylake/kabylake)
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



On 10/28/19 12:33 PM, Jaroslav Kysela wrote:
> Appearently the CONFIG_SND_SOC_SOF_KABYLAKE and CONFIG_SND_SOC_SOF_SKYLAKE
> options are not present in Kconfig and 'struct snd_sof_dsp_ops sof_skl_ops'
> is not declared in the code, too.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>

Right, but there is still a plan to "at some point" support those 
platforms.
I don't mind if we remove this code, just be aware that it'll come back.

> ---
>   sound/soc/sof/intel/hda.h   |  1 -
>   sound/soc/sof/sof-pci-dev.c | 44 -------------------------------------
>   2 files changed, 45 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 23e430d3e056..f521c48ec2eb 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -596,7 +596,6 @@ extern struct snd_soc_dai_driver skl_dai[];
>    */
>   extern const struct snd_sof_dsp_ops sof_apl_ops;
>   extern const struct snd_sof_dsp_ops sof_cnl_ops;
> -extern const struct snd_sof_dsp_ops sof_skl_ops;
>   
>   extern const struct sof_intel_dsp_desc apl_chip_info;
>   extern const struct sof_intel_dsp_desc cnl_chip_info;
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 3a9e0e2a150d..bca3fb791a6b 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -168,42 +168,6 @@ static const struct sof_dev_desc icl_desc = {
>   };
>   #endif
>   
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
> -static const struct sof_dev_desc skl_desc = {
> -	.machines		= snd_soc_acpi_intel_skl_machines,
> -	.resindex_lpe_base	= 0,
> -	.resindex_pcicfg_base	= -1,
> -	.resindex_imr_base	= -1,
> -	.irqindex_host_ipc	= -1,
> -	.resindex_dma_base	= -1,
> -	.chip_info = &skl_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.nocodec_fw_filename = "sof-skl.ri",
> -	.nocodec_tplg_filename = "sof-skl-nocodec.tplg",
> -	.ops = &sof_skl_ops,
> -	.arch_ops = &sof_xtensa_arch_ops
> -};
> -#endif
> -
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
> -static const struct sof_dev_desc kbl_desc = {
> -	.machines		= snd_soc_acpi_intel_kbl_machines,
> -	.resindex_lpe_base	= 0,
> -	.resindex_pcicfg_base	= -1,
> -	.resindex_imr_base	= -1,
> -	.irqindex_host_ipc	= -1,
> -	.resindex_dma_base	= -1,
> -	.chip_info = &skl_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.nocodec_fw_filename = "sof-kbl.ri",
> -	.nocodec_tplg_filename = "sof-kbl-nocodec.tplg",
> -	.ops = &sof_skl_ops,
> -	.arch_ops = &sof_xtensa_arch_ops
> -};
> -#endif
> -
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
>   static const struct sof_dev_desc tgl_desc = {
>   	.machines               = snd_soc_acpi_intel_tgl_machines,
> @@ -407,14 +371,6 @@ static const struct pci_device_id sof_pci_ids[] = {
>   	{ PCI_DEVICE(0x8086, 0xa348),
>   		.driver_data = (unsigned long)&cfl_desc},
>   #endif
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
> -	{ PCI_DEVICE(0x8086, 0x9d71),
> -		.driver_data = (unsigned long)&kbl_desc},
> -#endif
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
> -	{ PCI_DEVICE(0x8086, 0x9d70),
> -		.driver_data = (unsigned long)&skl_desc},
> -#endif
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
>   	{ PCI_DEVICE(0x8086, 0x34C8),
>   		.driver_data = (unsigned long)&icl_desc},
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
