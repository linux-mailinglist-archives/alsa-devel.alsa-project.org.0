Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46304E54AE
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 15:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7372E1666;
	Wed, 23 Mar 2022 15:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7372E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648047507;
	bh=jzJJB4ceuOD3wfw/nSCP0X8/PdP6WW3A58taq3XnVuE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Erj/rpW8zdzLj4pTMjMqicgK1l5Yv4eKInI5QIXpmDPrPDDvhVmyadElgKZhmncil
	 Ty2JFV4/+0bJUtLVd1RL+6Ggvd9UMYOZ9v9563UNbwMYP9WCrzNK3agT/xbagLyL18
	 NB1iFLKLEzRPcfaP3O3qwLTCAIJYgM35LQM+HREI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C18F80310;
	Wed, 23 Mar 2022 15:57:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7772AF800C1; Wed, 23 Mar 2022 15:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC57F800F5;
 Wed, 23 Mar 2022 15:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC57F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="foPVe31z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648047435; x=1679583435;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jzJJB4ceuOD3wfw/nSCP0X8/PdP6WW3A58taq3XnVuE=;
 b=foPVe31zhYNZft+5Uq/o4FebvgN/rwVMgbLM/ZTfX8baiETvL67iKg+o
 ZwfmNyIBSw8nNlTS45dD2u1U35XD0TMimQOPjsWDLqlO0nMIyCnY12PRT
 sgdR2HHETztKljvloytxmnWUzdcJ+kuN75fdR5bWD12RUerTmAkhmkiwK
 u63oDscKzKmxNvDYVLWqThrxmqJQpyq1SJwA9eZ1LacJAoBNeAkFpgoL9
 d3yIZOwYCLB0asSjlarTJj3gKYTtZHq76LlZ3VIcXLxxtw6RtMUMuihNZ
 OpxmgGiKz60ZVtN4JYEihzuXbw1Iz9XhO3sTWl/bXqj3oSPMB4Mgve7CI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238731555"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238731555"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 07:57:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="519386771"
Received: from thientha-mobl1.amr.corp.intel.com (HELO [10.251.10.76])
 ([10.251.10.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 07:57:07 -0700
Message-ID: <9f44016c-4774-64b3-4485-630401710568@linux.intel.com>
Date: Wed, 23 Mar 2022 09:57:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH -next] ASoC: SOF: Intel: Fix build error without
 SND_SOC_SOF_PCI_DEV
Content-Language: en-US
To: Zheng Bin <zhengbin13@huawei.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220323092501.145879-1-zhengbin13@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220323092501.145879-1-zhengbin13@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tangyizhou@huawei.com, limingming.li@huawei.com
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



On 3/23/22 04:25, Zheng Bin wrote:
> If SND_SOC_SOF_PCI_DEV is n, bulding fails:
> 
> sound/soc/sof/intel/pci-tng.o:(.data+0x1c0): undefined reference to `sof_pci_probe'
> sound/soc/sof/intel/pci-tng.o:(.data+0x1c8): undefined reference to `sof_pci_remove'
> sound/soc/sof/intel/pci-tng.o:(.data+0x1e0): undefined reference to `sof_pci_shutdown'
> sound/soc/sof/intel/pci-tng.o:(.data+0x290): undefined reference to `sof_pci_pm'
> 
> Make SND_SOC_SOF_MERRIFIELD select SND_SOC_SOF_PCI_DEV to fix this.
> 
> Fixes: 8d4ba1be3d22 ("ASoC: SOF: pci: split PCI into different drivers")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>

Indeed that's a miss, thanks for the patch. We select 
SND_SOC_SOF_PCI_DEV for all HDaudio-based PCI devices but forgot 
Merrifield which is PCI-based but not HDaudio-based.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/intel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index b53f216d4ecc..172419392b33 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -84,6 +84,7 @@ if SND_SOC_SOF_PCI
>   config SND_SOC_SOF_MERRIFIELD
>   	tristate "SOF support for Tangier/Merrifield"
>   	default SND_SOC_SOF_PCI
> +	select SND_SOC_SOF_PCI_DEV
>   	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
>   	help
>   	  This adds support for Sound Open Firmware for Intel(R) platforms
> --
> 2.31.1
> 
