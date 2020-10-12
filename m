Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716428B1D5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 11:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3B6168B;
	Mon, 12 Oct 2020 11:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3B6168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602496480;
	bh=IVjBGDV8p0FKRz1Hz2MHeaxRyGhrQ08CTCCUujy+tW8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JL6G75BC2nXnFWnNklzL/dB/luWgy8cAhffCnD8BX+y5Civq911lDWK9WxxBiKkJF
	 HjtR9z0avN4sKb//VUyZ+sLoTFRk383PSnNDSkZsxjGZ2UuPu5Shd/ULsSQw2YaADp
	 pLR/LcogJ0EmaPb/Zl7p2xYRpN1rlhKzNWcm7poU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A62F800F6;
	Mon, 12 Oct 2020 11:53:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA409F8020D; Mon, 12 Oct 2020 11:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D09F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 11:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D09F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Z1Ak1sNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602496371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QN45d2XSdmKTTxDIuvsgiZGVz5byIqMl33B4HtxhAvs=;
 b=Z1Ak1sNElDVXq1o5oK+gtDmwVQyCa2z9eDmBQc64tBpdgQpOQf8h4MlK0OMiZCl/hYzWmd
 s08EK04vpplM7nw45++m7+SmEk/S5JG/YqT2Z8td9Omd7srAMTmyRBx/3BFySUyCh01lz4
 eVv0/6v41MKJ/wE4Unxph2oyTQl7OuI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-rwhDXd_AOB-X-7QsH44YAQ-1; Mon, 12 Oct 2020 05:52:49 -0400
X-MC-Unique: rwhDXd_AOB-X-7QsH44YAQ-1
Received: by mail-ej1-f71.google.com with SMTP id d12so3489630ejr.19
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 02:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QN45d2XSdmKTTxDIuvsgiZGVz5byIqMl33B4HtxhAvs=;
 b=PH4RDFA2R3Yg0OMjnOs9L+6Qs6CpUhSMD0PxJeO46A2T1k5GcXtVdD8jXSijbhNgnh
 BoWyyEc7OhU5wjetdLOMst3oo315quiEAeqaRzcKfe4NWr3zvOSypt/SYxcY2dgsr6pt
 eWw4YXDWTNDcXcxjtj8f9xXDz6aR+5xTTWHhjMAKgZQIp01M1SiW/zkAx892bsL7dYAc
 ko0vHXjh7AWK4n5NusvjAB4/PU6oHlx4SVLevTh/lxghzdNuING6l8HFeAouJvOncdMb
 lCDMuYHp+DuwA4GIhY21195bayzgZSs6pzIMUHnFKtGEnjrizWVE9+s2yhITFjUd7O6G
 hQ5Q==
X-Gm-Message-State: AOAM53007XhTb7xJQquUqZmeFsBAzD1d3EUzbZM4L09aQhkB0bK0KtuS
 j3SLuqjWCsgysi7+Teb2s9KbV+GBjgE7qfI2XUbmUknnojmN9u47/DtrycCJL85JdqCQILKi97s
 D4a3gvtiHgCgipjy2l/AlE74=
X-Received: by 2002:a17:906:1418:: with SMTP id
 p24mr10004056ejc.46.1602496367869; 
 Mon, 12 Oct 2020 02:52:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3xd8BSkRCJor/I9y2/S+zJCzRpXkwsJyxZZjPSZos25SPTtJSLTWdBCKXMsdC+QP4RPiKZw==
X-Received: by 2002:a17:906:1418:: with SMTP id
 p24mr10004044ejc.46.1602496367640; 
 Mon, 12 Oct 2020 02:52:47 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id k18sm10107574ejk.42.2020.10.12.02.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 02:52:47 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: atom: Remove duplicate kconfigs
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20201012095005.29859-1-cezary.rojewski@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ddda227-ce24-03cf-5c2f-be6f2bfbaa57@redhat.com>
Date: Mon, 12 Oct 2020 11:52:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012095005.29859-1-cezary.rojewski@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org
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

On 10/12/20 11:50 AM, Cezary Rojewski wrote:
> SND_SST_IPC and its _PCI and _ACPI variants all target
> sound/soc/intel/atom solution alone. SND_SST_IPC is the core component,
> required for PCI and ACPI based atom platforms both. _PCI and _ACPI
> target Merrifield/Edison and Baytrial/Cherrytrail platforms
> respectively.
> 
> On top of that, there is an equivalent set of configs targeting the same
> solution:
> - SND_SST_ATOM_HIFI2_PLATFORM (core)
> - SND_SST_ATOM_HIFI2_PLATFORM_PCI
> - SND_SST_ATOM_HIFI2_PLATFORM_ACPI
> 
> As both sets do the same job - allow for granular platform selection -
> remove the duplicate set and rely on SND_SST_ATOM_HIFI2_PLATOFRM_XXX
> configs alone.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Patch looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   sound/soc/intel/Kconfig           | 18 ------------------
>   sound/soc/intel/atom/Makefile     |  2 +-
>   sound/soc/intel/atom/sst/Makefile |  6 +++---
>   3 files changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index d5bae5d1ab6f..a5b446d5af19 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -15,22 +15,6 @@ config SND_SOC_INTEL_SST_TOPLEVEL
>   
>   if SND_SOC_INTEL_SST_TOPLEVEL
>   
> -config SND_SST_IPC
> -	tristate
> -	# This option controls the IPC core for HiFi2 platforms
> -
> -config SND_SST_IPC_PCI
> -	tristate
> -	select SND_SST_IPC
> -	# This option controls the PCI-based IPC for HiFi2 platforms
> -	#  (Medfield, Merrifield).
> -
> -config SND_SST_IPC_ACPI
> -	tristate
> -	select SND_SST_IPC
> -	# This option controls the ACPI-based IPC for HiFi2 platforms
> -	# (Baytrail, Cherrytrail)
> -
>   config SND_SOC_INTEL_SST
>   	tristate
>   
> @@ -57,7 +41,6 @@ config SND_SST_ATOM_HIFI2_PLATFORM
>   config SND_SST_ATOM_HIFI2_PLATFORM_PCI
>   	tristate "PCI HiFi2 (Merrifield) Platforms"
>   	depends on X86 && PCI
> -	select SND_SST_IPC_PCI
>   	select SND_SST_ATOM_HIFI2_PLATFORM
>   	help
>   	  If you have a Intel Merrifield/Edison platform, then
> @@ -70,7 +53,6 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
>   	tristate "ACPI HiFi2 (Baytrail, Cherrytrail) Platforms"
>   	default ACPI
>   	depends on X86 && ACPI && PCI
> -	select SND_SST_IPC_ACPI
>   	select SND_SST_ATOM_HIFI2_PLATFORM
>   	select SND_SOC_ACPI_INTEL_MATCH
>   	select IOSF_MBI
> diff --git a/sound/soc/intel/atom/Makefile b/sound/soc/intel/atom/Makefile
> index a9326d5ec44c..c66f03f5d8d6 100644
> --- a/sound/soc/intel/atom/Makefile
> +++ b/sound/soc/intel/atom/Makefile
> @@ -6,4 +6,4 @@ snd-soc-sst-atom-hifi2-platform-objs :=	sst-mfld-platform-pcm.o \
>   obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += snd-soc-sst-atom-hifi2-platform.o
>   
>   # DSP driver
> -obj-$(CONFIG_SND_SST_IPC) += sst/
> +obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += sst/
> diff --git a/sound/soc/intel/atom/sst/Makefile b/sound/soc/intel/atom/sst/Makefile
> index f17c905df3e2..5761d30a5f9d 100644
> --- a/sound/soc/intel/atom/sst/Makefile
> +++ b/sound/soc/intel/atom/sst/Makefile
> @@ -3,6 +3,6 @@ snd-intel-sst-core-objs := sst.o sst_ipc.o sst_stream.o sst_drv_interface.o sst_
>   snd-intel-sst-pci-objs += sst_pci.o
>   snd-intel-sst-acpi-objs += sst_acpi.o
>   
> -obj-$(CONFIG_SND_SST_IPC) += snd-intel-sst-core.o
> -obj-$(CONFIG_SND_SST_IPC_PCI) += snd-intel-sst-pci.o
> -obj-$(CONFIG_SND_SST_IPC_ACPI) += snd-intel-sst-acpi.o
> +obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += snd-intel-sst-core.o
> +obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI) += snd-intel-sst-pci.o
> +obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) += snd-intel-sst-acpi.o
> 

