Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA0314E4
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 20:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D608B15E5;
	Fri, 31 May 2019 20:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D608B15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559328393;
	bh=LVCatPoyE+wBbWSmii4vYIMGSvNeI4KkAhqBO0NGgVQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZvt8as3lSf3oEzOeS+KUEIHd2a/L/YqrEO4wFXePAaUhGIn5arIWwKmHctGH4mwF
	 xGxyrcnPAK+AyuALCDMXhsJHs82ZEIrG02xkBp+pVTU3dybVjm6m8coUC0kSWIwchQ
	 5+IeAC/z/LOGJrlZ109t2XZ4mlonBizQvcfCYajM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D8CF896E4;
	Fri, 31 May 2019 20:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A38ECF896E5; Fri, 31 May 2019 20:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D4CF8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 20:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D4CF8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 11:44:41 -0700
X-ExtLoop1: 1
Received: from gpanchal-mobl.amr.corp.intel.com (HELO [10.254.189.1])
 ([10.254.189.1])
 by fmsmga008.fm.intel.com with ESMTP; 31 May 2019 11:44:40 -0700
To: Takashi Iwai <tiwai@suse.de>, YueHaibing <yuehaibing@huawei.com>
References: <20190531142526.12712-1-yuehaibing@huawei.com>
 <s5hlfymsnfa.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e20ff9a0-0928-2864-c451-a24d86ccfc5c@linux.intel.com>
Date: Fri, 31 May 2019 13:44:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hlfymsnfa.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, yingjiang.zhu@linux.intel.com,
 lgirdwood@gmail.com
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



On 5/31/19 9:34 AM, Takashi Iwai wrote:
> On Fri, 31 May 2019 16:25:26 +0200,
> YueHaibing wrote:
>>
>> while building without PCI:
>>
>> sound/soc/sof/intel/hda.o: In function `hda_dsp_probe':
>> hda.c:(.text+0x79c): undefined reference to `pci_ioremap_bar'
>> hda.c:(.text+0x79c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'
>> hda.c:(.text+0x7c4): undefined reference to `pci_ioremap_bar'
>> hda.c:(.text+0x7c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `pci_ioremap_bar'
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: e13ef82a9ab8 ("ASoC: SOF: add COMPILE_TEST for PCI options")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>   sound/soc/sof/intel/hda.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>> index 68db2ac..c1703c4 100644
>> --- a/sound/soc/sof/intel/hda.c
>> +++ b/sound/soc/sof/intel/hda.c
>> @@ -231,7 +231,9 @@ static int hda_init(struct snd_sof_dev *sdev)
>>   
>>   	/* initialise hdac bus */
>>   	bus->addr = pci_resource_start(pci, 0);
>> +#if IS_ENABLED(CONFIG_PCI)
>>   	bus->remap_addr = pci_ioremap_bar(pci, 0);
>> +#endif
>>   	if (!bus->remap_addr) {
>>   		dev_err(bus->dev, "error: ioremap error\n");
>>   		return -ENXIO;
>> @@ -458,7 +460,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>>   		goto hdac_bus_unmap;
>>   
>>   	/* DSP base */
>> +#if IS_ENABLED(CONFIG_PCI)
>>   	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
>> +#endif
>>   	if (!sdev->bar[HDA_DSP_BAR]) {
>>   		dev_err(sdev->dev, "error: ioremap error\n");
>>   		ret = -ENXIO;
> 
> IMO, this should be better addressed by fixing in linux/pci.h
> instead, something like below (totally untested).

Indeed. I wanted to first enable COMPILE_TEST for SOF and do a PCI 
cleanup in a second stage. It might take a while to synchronize those 
changes and check if there are additional functions needed by others.

> 
> 
> thanks,
> 
> Takashi
> 
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2005,8 +2005,19 @@ static inline void pci_mmcfg_late_init(void) { }
>   
>   int pci_ext_cfg_avail(void);
>   
> +#ifdef CONFIG_PCI
>   void __iomem *pci_ioremap_bar(struct pci_dev *pdev, int bar);
>   void __iomem *pci_ioremap_wc_bar(struct pci_dev *pdev, int bar);
> +#else
> +static inline void __iomem *pci_ioremap_bar(struct pci_dev *pdev, int bar)
> +{
> +	return NULL;
> +}
> +static inline void __iomem *pci_ioremap_wc_bar(struct pci_dev *pdev, int bar)
> +{
> +	return NULL;
> +}
> +#endif
>   
>   #ifdef CONFIG_PCI_IOV
>   int pci_iov_virtfn_bus(struct pci_dev *dev, int id);
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
