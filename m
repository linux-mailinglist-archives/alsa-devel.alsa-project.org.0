Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BE468526
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 14:51:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E3521DA;
	Sat,  4 Dec 2021 14:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E3521DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638625915;
	bh=hkAW9GveBAQdTQ5fGd7ij5hYWa/KqoW+DCBlFq7zN1Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lXs6pqrKySUzvEUSMZ8Uqt0qvTMoTbNAXYAo2LIBoL9EOIFCYqCE4ukvVpuM32XSA
	 U3oe3KYK/+/9wmQQs6AKoFlOsUEbJBFAj/3XsuwQbkzbhrNEzvLjfufE5UCKY5OAkm
	 m/6XeMaq7gGLZcVxvOdkWsMSXWKq31EtSe3LSMtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E410F80240;
	Sat,  4 Dec 2021 14:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03B82F8023B; Sat,  4 Dec 2021 14:50:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0507BF80134
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 14:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0507BF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cabSvCzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638625824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9JNfwvrqzqZBXE6iJOUQR5m9fqUmYDhlbUkU9f5D6E=;
 b=cabSvCzNuPvKxa5F1CKX0YYyya7sNiYE3v/RVNYosYDaosK8SkCiiIiotra3GJ/WP12GzH
 8+JMFrCrSGDTlT8ysTTcwyd3bBoj6YdO8X6dByHnNE8bZOkGIICVLHpSgKaVBc3IsKWfLM
 jYP7B6y9usqOjM/tL0Blj52PpqYF8zk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-4XPg56DFMF6lX_REkFml-Q-1; Sat, 04 Dec 2021 08:50:22 -0500
X-MC-Unique: 4XPg56DFMF6lX_REkFml-Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a05640234c500b003f1b9ab06d2so4838195edc.13
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 05:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n9JNfwvrqzqZBXE6iJOUQR5m9fqUmYDhlbUkU9f5D6E=;
 b=52KcofA+Y2+Svm931gNPNjWuslnBBetew+7BZj1mlBZWY9RCHNcwYEMYqJWF+1HguV
 Wl/G2Ai4sJ0FOS0wJKnUxc1Y1iUSmVkzcJ5NQFM4nsMaszvMcpXtOdqkARHFddtuPuPN
 gWcMsaRAl3uhzPM5ONBDaWXXaeFJ2PXyBvHi9fFlu33Wz9JwJq+OtTrH5cDcTF6/afTX
 GlsPLRvCVnHEGnrsKsEDZUrA2YQGyni0RsG0DuaI4uXq7PZbRmIMGZpKeJsTgOCeym5H
 VYeHyYyjnmUXgEFxI38rvb8x1GeWPym5GtyykCYUGuQl+B3IO8+oXn/8HOOf82c94m59
 sABw==
X-Gm-Message-State: AOAM5310kDr/bHISaUpOFCH2lYMDYxK9YHQGFUtm2kTkBxFTcmXUoeeZ
 tChas+ogmmgPqdn+nNDosm6lyD4uNIIRg30nlda0iEXRGRcNX2QwLl5e7wVAQ0dVh1Sy/2qeETL
 Nj/ZNbpwy039pE5xkWpRNmtM=
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr36615768edd.359.1638625820846; 
 Sat, 04 Dec 2021 05:50:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl1KM8bbQ7YrKD1YOQY1tMOCpJz/Vniat1jK4ytnXvQSBAnOoWLnclUg8H/rgWutJus+ID6A==
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr36615748edd.359.1638625820648; 
 Sat, 04 Dec 2021 05:50:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cs12sm3537954ejc.15.2021.12.04.05.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 05:50:20 -0800 (PST)
Message-ID: <45e6c26e-f804-1f2f-bbb1-07f71f915ff4@redhat.com>
Date: Sat, 4 Dec 2021 14:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, vkoul@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

Hi,

On 12/3/21 14:46, Pierre-Louis Bossart wrote:
> 
> 
> On 12/3/21 4:13 AM, Dan Carpenter wrote:
>> Hello Vinod Koul,
>>
>> The patch f533a035e4da: "ASoC: Intel: mrfld - create separate module
>> for pci part" from Nov 4, 2014, leads to the following Smatch static
>> checker warning:
>>
>> 	sound/soc/intel/atom/sst/sst_pci.c:102 sst_platform_get_resources()
>> 	warn: resource freed on success: 'ctx->pci'
>>
>> sound/soc/intel/atom/sst/sst_pci.c
>>     25 static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>>     26 {
>>     27         int ddr_base, ret = 0;
>>     28         struct pci_dev *pci = ctx->pci;
>>     29 
>>     30         ret = pci_request_regions(pci, SST_DRV_NAME);
>>     31         if (ret)
>>     32                 return ret;
>>     33 
>>     34         /* map registers */
>>     35         /* DDR base */
>>     36         if (ctx->dev_id == SST_MRFLD_PCI_ID) {
>>     37                 ctx->ddr_base = pci_resource_start(pci, 0);
>>     38                 /* check that the relocated IMR base matches with FW Binary */
>>     39                 ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
>>     40                 if (!ctx->pdata->lib_info) {
>>     41                         dev_err(ctx->dev, "lib_info pointer NULL\n");
>>     42                         ret = -EINVAL;
>>     43                         goto do_release_regions;
>>     44                 }
>>     45                 if (ddr_base != ctx->pdata->lib_info->mod_base) {
>>     46                         dev_err(ctx->dev,
>>     47                                         "FW LSP DDR BASE does not match with IFWI\n");
>>     48                         ret = -EINVAL;
>>     49                         goto do_release_regions;
>>     50                 }
>>     51                 ctx->ddr_end = pci_resource_end(pci, 0);
>>     52 
>>     53                 ctx->ddr = pcim_iomap(pci, 0,
>>     54                                         pci_resource_len(pci, 0));
>>     55                 if (!ctx->ddr) {
>>     56                         ret = -EINVAL;
>>     57                         goto do_release_regions;
>>     58                 }
>>     59                 dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
>>     60         } else {
>>     61                 ctx->ddr = NULL;
>>     62         }
>>     63         /* SHIM */
>>     64         ctx->shim_phy_add = pci_resource_start(pci, 1);
>>     65         ctx->shim = pcim_iomap(pci, 1, pci_resource_len(pci, 1));
>>     66         if (!ctx->shim) {
>>     67                 ret = -EINVAL;
>>     68                 goto do_release_regions;
>>     69         }
>>     70         dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
>>     71 
>>     72         /* Shared SRAM */
>>     73         ctx->mailbox_add = pci_resource_start(pci, 2);
>>     74         ctx->mailbox = pcim_iomap(pci, 2, pci_resource_len(pci, 2));
>>     75         if (!ctx->mailbox) {
>>     76                 ret = -EINVAL;
>>     77                 goto do_release_regions;
>>     78         }
>>     79         dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
>>     80 
>>     81         /* IRAM */
>>     82         ctx->iram_end = pci_resource_end(pci, 3);
>>     83         ctx->iram_base = pci_resource_start(pci, 3);
>>     84         ctx->iram = pcim_iomap(pci, 3, pci_resource_len(pci, 3));
>>     85         if (!ctx->iram) {
>>     86                 ret = -EINVAL;
>>     87                 goto do_release_regions;
>>     88         }
>>     89         dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
>>     90 
>>     91         /* DRAM */
>>     92         ctx->dram_end = pci_resource_end(pci, 4);
>>     93         ctx->dram_base = pci_resource_start(pci, 4);
>>     94         ctx->dram = pcim_iomap(pci, 4, pci_resource_len(pci, 4));
>>     95         if (!ctx->dram) {
>>     96                 ret = -EINVAL;
>>     97                 goto do_release_regions;
>>     98         }
>>     99         dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
>>     100 do_release_regions:
>>     101         pci_release_regions(pci);
>> --> 102         return ret;
>>     103 }
>>
>> Surely there should be a "return 0;" before the do_release_regions:
>> label?  How does this code work?
> 
> Thanks for reporting this Dan. Yes this doesn't look good at all.
> 
> This PCI part is only used on Merrifield/Tangier, and I am not sure if
> anyone ever managed to make audio work with the upstream version of this
> driver. It's my understanding that this platform is no longer maintained
> by Intel, and the Edison Yocto code uses the SOF driver.
> 
> The Kconfig updated in 2018 hints at those limitations:
> 
> config SND_SST_ATOM_HIFI2_PLATFORM_PCI
> 	tristate "PCI HiFi2 (Merrifield) Platforms"
> 	depends on X86 && PCI
> 	select SND_SST_ATOM_HIFI2_PLATFORM
> 	help
> 	  If you have a Intel Merrifield/Edison platform, then
> 	  enable this option by saying Y or m. Distros will typically not
> 	  enable this option: while Merrifield/Edison can run a mainline
> 	  kernel with limited functionality it will require a firmware file
> 	  which is not in the standard firmware tree
> 
> I would guess that indeed a return 0; is missing, but maybe it's time to
> remove this PCI code completely. I can't think of any user of the PCI
> parts of this driver.
> 
> Andy, Hans, Mark, Takashi, what do you think?

Merrifield/Edison is something Andy focuses on. I'm more focused on
Bay Trail and Cherry Trail, so this is best answered by Andy (which
he has already done).

Regards,

Hans

