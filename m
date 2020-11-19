Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A510F2B9A04
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42038171C;
	Thu, 19 Nov 2020 18:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42038171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605808444;
	bh=cb79K5G+wsKX3rr++KkK8Dhixo2GsEJ2h63FjOwROe8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YF2up7t4CTYgMOhRx35ur5Onc2OFTkCNqVBsJBOFkJIpB75pKJOjrihF3/9QYpGaz
	 P/MjPky/4Y01mZU9ZXedfkhO/VcqdBdOdE1mKtuFLC2PVfJZaRHykjUUbgfahF6iCy
	 m3XZqf8C3ZLgmw3d8fEIazfgBOhwYC5FGucygGpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD1BF800C5;
	Thu, 19 Nov 2020 18:52:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B37EF801ED; Thu, 19 Nov 2020 18:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E86F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E86F8015A
IronPort-SDR: p1HIEVPfTQahRZzr04k7bntLuNUEFP04tC1rIbdDMkbGMDckemGt5MZQT/2IOzYKcmfXvH9+L8
 tKkUN3P5f8tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="189422251"
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="189422251"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 09:52:24 -0800
IronPort-SDR: hZSx/Hl4REuxHSSLwQjh6uw7UXUbairmZCD+8UgMEEtZ1C3wRESogCx0yxJjQUko2lwFEH+YL6
 fEp7my5q42gg==
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="311710418"
Received: from kjhancox-mobl.amr.corp.intel.com (HELO [10.213.167.234])
 ([10.213.167.234])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 09:52:23 -0800
Subject: Re: [PATCH 13/14] ASoC: SOF: Intel: allow for coexistence between SOF
 and catpt drivers
To: Mark Brown <broonie@kernel.org>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <20201112223825.39765-14-pierre-louis.bossart@linux.intel.com>
 <20201119140650.GA37066@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <569716f0-a52f-e9af-dd83-5c622b8073d4@linux.intel.com>
Date: Thu, 19 Nov 2020 11:52:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119140650.GA37066@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rander Wang <rander.wang@linux.intel.com>
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



On 11/19/20 8:06 AM, Mark Brown wrote:
> On Thu, Nov 12, 2020 at 04:38:24PM -0600, Pierre-Louis Bossart wrote:
>> Now that we have all the support needed for coexistence between ACPI
>> drivers for Broadwell, remove mutual exclusion in the Kconfig
>> file. The selection is done by playing with the snd_intel_dspcfg
>> module 'dsp_driver' parameter.
> 
> This breaks x86 allmodconfig builds for me:
> 
> /mnt/kernel/sound/soc/intel/atom/sst/sst_acpi.c: In function 'sst_acpi_probe':
> /mnt/kernel/sound/soc/intel/atom/sst/sst_acpi.c:251:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
>    ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          snd_intel_dsp_driver_probe
> /mnt/kernel/sound/soc/intel/catpt/device.c: In function 'catpt_acpi_probe':
> /mnt/kernel/sound/soc/intel/catpt/device.c:251:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
>    ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          snd_intel_dsp_driver_probe
> /mnt/kernel/sound/soc/sof/sof-acpi-dev.c: In function 'sof_acpi_probe':
> /mnt/kernel/sound/soc/sof/sof-acpi-dev.c:134:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
>    ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          snd_intel_dsp_driver_probe
> 

Humm, I just tried and it works fine for me on top of your for-5.11 
branch. That error across the board seems weird, there's even a 
fall-back with a static inline if the Kconfig is not selected.

Could it be that Patch3 was not applied somehow? That's where the 
prototype was added.


