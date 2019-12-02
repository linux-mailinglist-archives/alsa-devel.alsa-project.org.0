Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C210EEAE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B841667;
	Mon,  2 Dec 2019 18:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B841667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575308587;
	bh=W396vCcvyNEPISVnRIRVqqZJhLK263u1buGBisqYKCE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdBTrOu23thEjstMeuUmMDwnFghE8X7qUwUSREEaUi9O9Y8lO4ehnijsAdjSixyjQ
	 fmYyqS3SYUybRy8gEfayzAFi0PGIH7AVm1Ujvh8sYIewQG5Cj2bI6tI9PAmDUCx1cF
	 8iM1SEtNv9E/W2cOmURCPQng+NTshV8eleeouqZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F92CF800B4;
	Mon,  2 Dec 2019 18:40:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4593BF80090; Mon,  2 Dec 2019 18:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 116B3F801D9
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 116B3F801D9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 09:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="208164902"
Received: from svedurlx-mobl.amr.corp.intel.com (HELO [10.251.129.241])
 ([10.251.129.241])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2019 09:40:25 -0800
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.de, daniel.baluta@nxp.com,
 arnd@arndb.de, tglx@linutronix.de, rdunlap@infradead.org
References: <20191127141649.5524-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31733dff-0811-b2a4-6201-277d7c5ff619@linux.intel.com>
Date: Mon, 2 Dec 2019 11:27:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191127141649.5524-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: Fix build error
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



On 11/27/19 8:16 AM, YueHaibing wrote:
> If SND_INTEL_DSP_CONFIG is m and SND_SOC_SOF_PCI is y,
> building fails:
> 
> sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
> sof-pci-dev.c:(.text+0xb4): undefined reference to `snd_intel_dsp_driver_probe'
> 
> Select SND_INTEL_DSP_CONFIG to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   sound/soc/sof/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 71a0fc0..e0b04b5 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -14,6 +14,7 @@ config SND_SOC_SOF_PCI
>   	depends on PCI
>   	select SND_SOC_SOF
>   	select SND_SOC_ACPI if ACPI
> +	select SND_INTEL_DSP_CONFIG

Thanks for the report. This looks like a valid issue but I don't think 
the fix is in the right place, we moved all Intel-specific stuff to 
sound/soc/sof/Intel.

In addition I don't get how this can happen in the first place, we have
this statement

config SND_SOC_SOF_INTEL_PCI
	def_tristate SND_SOC_SOF_PCI

Can you share the config that's broken? Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
