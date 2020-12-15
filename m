Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379582DB32A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 19:00:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCBF41821;
	Tue, 15 Dec 2020 18:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCBF41821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608055241;
	bh=Xwdt0VINEGxFG9oAtEoAou9PphoemQF2IxELFjVn/PI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFJdWJP+hk1nufiVjH5frBmnYHnX2z5x7QrPbPhpNYOzKGJxzFv6vy22IuFQhLKrh
	 Jm2PCjUSrxN70wxnDBbS5RJNyMP8iz9FTVQCJKPnzhvNSdeSeAlRxmaZXa4UG1Kqao
	 AFEpZsLj58BeSZh2zWRjexTiJup+oE/nkbkrxvgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F852F804AE;
	Tue, 15 Dec 2020 18:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43F60F80278; Tue, 15 Dec 2020 18:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7112F80121;
 Tue, 15 Dec 2020 18:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7112F80121
IronPort-SDR: fgO7BoVXr77gVDFUJ+yMMtdCHBlYHivoYthTtRN67VNQfYfnnfTEH/iaw0bcAz/gBWkDgqmLY3
 O5ueEBFvnE9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175033083"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="175033083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:59:15 -0800
IronPort-SDR: OO0RRPn0biJd1FJlarvtdtKZASRnomJFirBudByA66NicTJVprIPyKnnFiAahQR0aM/Q7l9qtV
 fmJ+JrNIg4nA==
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="412065532"
Received: from zhujulie-mobl.amr.corp.intel.com (HELO [10.212.76.114])
 ([10.212.76.114])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:59:15 -0800
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
 <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
Date: Tue, 15 Dec 2020 11:59:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: SOUND <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
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



>>> Something's not adding up here.
>>
>> Seems like you can enable CONFIG_SND_SOC_INTEL_KBL (and all other
>> platforms), without enabling CONFIG_SND_SOC_INTEL_SKYLAKE, which enables
>> building of snd_soc_skl module... I would say that there is something
>> wrong with module dependencies in Kconfig :/

rather the Makefile is wrong, see below.

> 
> Yes that's exactly what happened here.
> So I wonder why we need to separate CONFIG_SND_SOC_INTEL_SKYLAKE from
> other configs...
> 
>> Will look at it tomorrow. In the meantime any chance we can get the
>> config which was used, to confirm my suspicion?
> 
> Ubuntu 5.8 kernel has this:
> # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> CONFIG_SND_SOC_INTEL_SKL=m
> CONFIG_SND_SOC_INTEL_APL=m
> CONFIG_SND_SOC_INTEL_KBL=m
> CONFIG_SND_SOC_INTEL_GLK=m
> # CONFIG_SND_SOC_INTEL_CNL is not set
> # CONFIG_SND_SOC_INTEL_CFL is not set
> # CONFIG_SND_SOC_INTEL_CML_H is not set
> # CONFIG_SND_SOC_INTEL_CML_LP is not set
> CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
> CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
> # CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set

that would be needed to support DMIC+HDaudio platforms (with the 
Connexant restriction).

> CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
> 
> So I guess we can do something like this?
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 1c5114dedda9..c8142520532e 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -417,7 +417,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>                          return SND_INTEL_DSP_DRIVER_SOF;
>          }
> 
> -
> +#if IS_REACHABLE(CONFIG_SND_SOC_INTEL_SKYLAKE)
>          if (cfg->flags & FLAG_SST) {
>                  if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
>                          if (snd_intel_dsp_check_dmic(pci)) {
> @@ -428,6 +428,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>                          return SND_INTEL_DSP_DRIVER_SST;
>                  }
>          }
> +#endif
> 
>          return SND_INTEL_DSP_DRIVER_LEGACY;
>   }
> 
> Kai-Heng

Can you try this instead, the dependencies are indeed wrong in the Makefile:

diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 4e0248d2accc..7c5038803be7 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
  # Platform Support
  obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
  obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
-obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
+obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
  obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/

  # Machine support


