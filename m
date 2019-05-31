Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C167313C9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 19:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F01950;
	Fri, 31 May 2019 19:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F01950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559323565;
	bh=zLh3iV8sRP9jtDxSnAaCDNfOxtUqDc3qKfc4y46XLKk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+GSY53UscaWWvc2Wl2avNc09oZoaemxWHEL9eNznd+2YCieT7bc07s60YO8XYUZb
	 EbG2aClFk3+XDG6VILBTnCjWPqUzsWTqqWZy3JYGuu47HJ9hzeUeaQJ35/guwXRdJd
	 uvMMLiI8eDGRoW/oWspfpdrBm1f2Ng7RV1c2+dxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E5DF896F2;
	Fri, 31 May 2019 19:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD76F896E5; Fri, 31 May 2019 19:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC050F80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 19:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC050F80C1B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 10:24:11 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 31 May 2019 10:24:11 -0700
Received: from mayurda-mobl.amr.corp.intel.com (unknown [10.252.130.8])
 by linux.intel.com (Postfix) with ESMTP id 8F7C35802C9;
 Fri, 31 May 2019 10:24:10 -0700 (PDT)
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yingjiang.zhu@linux.intel.com
References: <20190531142526.12712-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <63b3a080-60c4-64e2-6f72-8075bb3bb45a@linux.intel.com>
Date: Fri, 31 May 2019 12:24:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531142526.12712-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: Fix COMPILE_TEST
 build error
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

On 5/31/19 9:25 AM, YueHaibing wrote:
> while building without PCI:
> 
> sound/soc/sof/intel/hda.o: In function `hda_dsp_probe':
> hda.c:(.text+0x79c): undefined reference to `pci_ioremap_bar'
> hda.c:(.text+0x79c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'
> hda.c:(.text+0x7c4): undefined reference to `pci_ioremap_bar'
> hda.c:(.text+0x7c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: e13ef82a9ab8 ("ASoC: SOF: add COMPILE_TEST for PCI options")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Gah, my bad. My cross-compilation script assumed sound was enabled with 
defconfig but it's not in all cases, thanks for the fix.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>   sound/soc/sof/intel/hda.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 68db2ac..c1703c4 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -231,7 +231,9 @@ static int hda_init(struct snd_sof_dev *sdev)
>   
>   	/* initialise hdac bus */
>   	bus->addr = pci_resource_start(pci, 0);
> +#if IS_ENABLED(CONFIG_PCI)
>   	bus->remap_addr = pci_ioremap_bar(pci, 0);
> +#endif
>   	if (!bus->remap_addr) {
>   		dev_err(bus->dev, "error: ioremap error\n");
>   		return -ENXIO;
> @@ -458,7 +460,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>   		goto hdac_bus_unmap;
>   
>   	/* DSP base */
> +#if IS_ENABLED(CONFIG_PCI)
>   	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
> +#endif
>   	if (!sdev->bar[HDA_DSP_BAR]) {
>   		dev_err(sdev->dev, "error: ioremap error\n");
>   		ret = -ENXIO;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
