Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941215761
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 03:42:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EB716BA;
	Tue,  7 May 2019 03:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EB716BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557193368;
	bh=/5Px4Nwm/s5gMknl1bTcCW21FSYXk6ckyX6G3OYlG5w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2MtAxbDabGeQrWY+ECpiQb8fj4yeHHc3XZqfxnyqDhL8XEaZxA8XGP2SDHsyhcDZ
	 a0BGvbCknuJBHm1oIgcM/WFpO4o8fqKFvNGwFq0CI97B4efjyQxvYwkNzpGjVUT/RY
	 5oQlNrw8KvWGoRacmLd1A43Mm91Gdz/P9HqROpD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D96F89682;
	Tue,  7 May 2019 03:41:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F722F89674; Tue,  7 May 2019 03:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6448DF80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 03:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6448DF80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 18:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,440,1549958400"; d="scan'208";a="149034370"
Received: from speesari-mobl.amr.corp.intel.com (HELO [10.251.22.59])
 ([10.251.22.59])
 by orsmga003.jf.intel.com with ESMTP; 06 May 2019 18:40:53 -0700
To: Evan Green <evgreen@chromium.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190506225321.74100-1-evgreen@chromium.org>
 <20190506225321.74100-2-evgreen@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
Date: Mon, 6 May 2019 20:40:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506225321.74100-2-evgreen@chromium.org>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Ben Zhang <benzh@chromium.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
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



On 5/6/19 5:53 PM, Evan Green wrote:
> Add support for Intel Comet Lake platforms by adding a new Kconfig
> for CometLake and the appropriate PCI ID.

This is odd. I checked internally a few weeks back and the CML PCI ID 
was 9dc8, same as WHL and CNL, so we did not add a PCI ID on purpose. To 
the best of my knowledge SOF probes fine on CML and the known issues can 
be found on the SOF github [1].

Care to send the log of sudo lspci -s 0:1f.3 -vn ?

[1] 
https://github.com/thesofproject/sof/issues?q=is%3Aopen+is%3Aissue+label%3ACML
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
>   sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
>   sound/soc/sof/sof-pci-dev.c |  4 ++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 32ee0fabab92..0b616d025f05 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -24,6 +24,7 @@ config SND_SOC_SOF_INTEL_PCI
>   	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
>   	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
>   	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
> +	select SND_SOC_SOF_COMETLAKE   if SND_SOC_SOF_COMETLAKE_SUPPORT
>   	help
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level
> @@ -179,6 +180,21 @@ config SND_SOC_SOF_ICELAKE
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level
>   
> +config SND_SOC_SOF_COMETLAKE
> +	tristate
> +	select SND_SOC_SOF_CANNONLAKE
> +	help
> +	  This option is not user-selectable but automagically handled by
> +	  'select' statements at a higher level
> +
> +config SND_SOC_SOF_COMETLAKE_SUPPORT
> +	bool "SOF support for CometLake"
> +	help
> +	  This adds support for Sound Open Firmware for Intel(R) platforms
> +	  using the Cometlake processors.
> +	  Say Y if you have such a device.
> +	  If unsure select "N".
> +
>   config SND_SOC_SOF_HDA_COMMON
>   	tristate
>   	select SND_SOC_SOF_INTEL_COMMON
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index b778dffb2d25..5f0128337e40 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -353,6 +353,10 @@ static const struct pci_device_id sof_pci_ids[] = {
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
>   	{ PCI_DEVICE(0x8086, 0x34C8),
>   		.driver_data = (unsigned long)&icl_desc},
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
> +	{ PCI_DEVICE(0x8086, 0x02c8),
> +		.driver_data = (unsigned long)&cnl_desc},
>   #endif
>   	{ 0, }
>   };
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
