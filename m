Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAEE6A95
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 02:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25AC1924;
	Mon, 28 Oct 2019 02:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25AC1924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572227718;
	bh=xeBZNF2XXp1wtlJvwEZ0S3UiQ3huxd8kPkiI0PHlBmw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEOCjF0sQeYjWaqmE0KnNE3pkA4h+WxuHifKl4S0/dBP0px9pxk6UerHKfFo7DG13
	 neMCm2BL+WCzPLSLNCI+F2Aff1Z8+0TRsm2Y1OCZI8f6XzUW1pTvuuVMR/AhXI7lFX
	 Ucsk/h0rvLT94/vOWqzOewIfVcWm7n2kiLShRmtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29169F8036C;
	Mon, 28 Oct 2019 02:53:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87331F8036C; Mon, 28 Oct 2019 02:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7EDEF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 02:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7EDEF80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 18:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="224494974"
Received: from rmullina-mobl.amr.corp.intel.com (HELO [10.255.229.12])
 ([10.255.229.12])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2019 18:53:23 -0700
To: Mao Wenan <maowenan@huawei.com>, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.de, daniel.baluta@nxp.com, rdunlap@infradead.org,
 ranjani.sridharan@linux.intel.com, arnd@arndb.de
References: <20191028014511.73472-1-maowenan@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <68a432df-81d4-dc54-b836-f58981d78491@linux.intel.com>
Date: Sun, 27 Oct 2019 20:53:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191028014511.73472-1-maowenan@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: select
 SND_INTEL_DSP_CONFIG in SND_SOC_SOF_PCI
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



On 10/27/19 8:45 PM, Mao Wenan wrote:
> When SND_SOC_SOF_PCI=y, and SND_INTEL_DSP_CONFIG=m, below
> errors can be seen:
> sound/soc/sof/sof-pci-dev.o: In function `sof_pci_probe':
> sof-pci-dev.c:(.text+0xb9): undefined reference to
> `snd_intel_dsp_driver_probe'
> 
> After commit 82d9d54a6c0e ("ALSA: hda: add Intel DSP
> configuration / probe code"), sof_pci_probe() will call
> snd_intel_dsp_driver_probe(), so it should select
> SND_INTEL_DSP_CONFIG in Kconfig SND_SOC_SOF_PCI.
> 
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>   sound/soc/sof/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 56a3ab6..a9b2be2 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -16,6 +16,7 @@ config SND_SOC_SOF_PCI
>   	select SND_SOC_ACPI if ACPI
>   	select SND_SOC_SOF_OPTIONS
>   	select SND_SOC_SOF_INTEL_PCI if SND_SOC_SOF_INTEL_TOPLEVEL
> +	select SND_INTEL_DSP_CONFIG

The problem may be real but the fix should be in 
sound/sof/sof/intel/Kconfig, e.g. something like:

config SND_SOC_SOF_HDA_COMMON
	tristate
	select SND_SOC_SOF_INTEL_COMMON
+	select SND_INTEL_DSP_CONFIG
	select SND_SOC_SOF_HDA_LINK_BASELINE


I have another patch coming to replace the Intel stuff on the line above.

>   	help
>   	  This adds support for PCI enumeration. This option is
>   	  required to enable Intel Skylake+ devices
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
