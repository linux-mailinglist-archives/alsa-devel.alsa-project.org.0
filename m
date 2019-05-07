Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A1158EC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A53169A;
	Tue,  7 May 2019 07:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A53169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206750;
	bh=1bhjgZMaHM+s6z3rfQExkjBICsLw3vK9nxac6ofxr9o=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nec4ManJBvivogDpYGISC+YCNcr16ge/0Z5QynwLcEpg+pg0R/21v6KvAmyp814P3
	 dfUe5qQJodVrMMxt9NCgdGmANn9vgcZmq7di1KT4Avl074FkGpQDIFKij4llnBNlhO
	 xikiCKppV1u6tl8cXhRIl7+2XsqJikizHorBCMMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D024F8973B;
	Tue,  7 May 2019 07:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F6DEF89673; Tue,  7 May 2019 05:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10BE6F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 05:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BE6F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 20:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,440,1549958400"; d="scan'208";a="344609157"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2019 20:34:06 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 20:34:06 -0700
Received: from BGSMSX108.gar.corp.intel.com (10.223.4.192) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 20:34:05 -0700
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.125]) by
 BGSMSX108.gar.corp.intel.com ([169.254.8.150]) with mapi id 14.03.0415.000;
 Tue, 7 May 2019 09:04:02 +0530
From: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Evan Green
 <evgreen@chromium.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>
Thread-Topic: [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
Thread-Index: AQHVBF66kVtld5KEb06yyEGKrvv3D6Zeht+AgAB5C1A=
Date: Tue, 7 May 2019 03:34:02 +0000
Message-ID: <64FD1F8348A3A14CA3CB4D4C9EB1D15F30A7C756@BGSMSX107.gar.corp.intel.com>
References: <20190506225321.74100-1-evgreen@chromium.org>
 <20190506225321.74100-2-evgreen@chromium.org>
 <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
In-Reply-To: <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Rajat Jain <rajatja@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Zhang <benzh@chromium.org>, "M, Naveen" <naveen.m@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



-----Original Message-----
From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com] 
Sent: Tuesday, May 7, 2019 7:11 AM
To: Evan Green <evgreen@chromium.org>; Liam Girdwood <liam.r.girdwood@linux.intel.com>; Mark Brown <broonie@kernel.org>
Cc: M, Naveen <naveen.m@intel.com>; M R, Sathya Prakash <sathya.prakash.m.r@intel.com>; Ben Zhang <benzh@chromium.org>; Rajat Jain <rajatja@chromium.org>; Jaroslav Kysela <perex@perex.cz>; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Takashi Iwai <tiwai@suse.com>; Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID



On 5/6/19 5:53 PM, Evan Green wrote:
>> Add support for Intel Comet Lake platforms by adding a new Kconfig for 
>> CometLake and the appropriate PCI ID.

>This is odd. I checked internally a few weeks back and the CML PCI ID was 9dc8, same as WHL and CNL, so we did not add a PCI ID on purpose. To the best of my knowledge SOF probes fine on CML and the known issues can be found on the SOF github [1].

The PCI ID change is seen on later production Si versions. The PCI ID is 02c8.

>Care to send the log of sudo lspci -s 0:1f.3 -vn ?

Here you go:
localhost ~ # sudo lspci -s 0:1f.3 -vn
00:1f.3 0401: 8086:02c8
        Subsystem: 8086:7270
        Flags: fast devsel, IRQ 11
        Memory at d1114000 (64-bit, non-prefetchable) [size=16K]
        Memory at d1000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [50] Power Management version 3
        Capabilities: [80] Vendor Specific Information: Len=14 <?>
        Capabilities: [60] MSI: Enable- Count=1/1 Maskable- 64bit+


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
>   	  'select' statements at a higher level @@ -179,6 +180,21 @@ config 
> SND_SOC_SOF_ICELAKE
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
