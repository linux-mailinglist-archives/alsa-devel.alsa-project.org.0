Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648372A9EBD
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 21:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFA11689;
	Fri,  6 Nov 2020 21:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFA11689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604696123;
	bh=1yO/CVv9b0QAujvyIxVqVvhR2ndhoj53ZUJfuwtrlvs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHHDoQspUkfLx/Jc8RdLbUnWa1Zo5mYROI06mVg9aNWH/CFNC6Ex4Ud7ohK90VXpP
	 kEDgiSsidhqzMLNt/+7UAndqXDXoLt+5jr8ApHMxtWkjI9753harEgiiiGHwNDthFv
	 FWTaI1ZcESSy3Sdx6NZ6XN0xUi3BduENORSEmTec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 325F4F80234;
	Fri,  6 Nov 2020 21:53:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E55F80234; Fri,  6 Nov 2020 21:53:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF8D4F80150;
 Fri,  6 Nov 2020 21:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF8D4F80150
IronPort-SDR: OKCc6H2cp+892B2IsoY6h0lc/TVZaK9tGveHjPiz7BZp1K4MAPRkl7Z5kCjkXpZLhqcVIGTGAM
 R1QMdCjUXTNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="166090146"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="166090146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 12:53:40 -0800
IronPort-SDR: cTbL18lfulNcLJmvQWPDsKkw80vKqGvrKJ1War0IGT0MISwf2SezEohYDHuRWS1BQz2bSnTo+z
 ut12zaw/g3Jg==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="353483936"
Received: from sfkampme-mobl1.amr.corp.intel.com (HELO [10.212.181.142])
 ([10.212.181.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 12:53:39 -0800
Subject: Re: [Sound-open-firmware] linux-next: Tree for Nov 6
 (sound/soc/sof/sof-pci-dev.o)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201106171834.64e4d6d5@canb.auug.org.au>
 <0a66a2b1-85b6-3515-47f4-2e861b991386@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
Date: Fri, 6 Nov 2020 14:53:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a66a2b1-85b6-3515-47f4-2e861b991386@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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


> on x86_64:
> 
> ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> sof-pci-dev.c:(.text+0x5c): undefined reference to `snd_intel_dsp_driver_probe'
> 
> 
> Full randconfig file is attached.

Nice catch, thanks Randy! Looks like we put the select 
SND_INTEL_DSP_CONFIG in the wrong place, it's not dependent on the 
HDaudio link being selected. Clearly a bug we've had for a while.

The diff below makes the error go away but I have to run it past folks 
who are already enjoying their week-end. Will follow-up next week with a 
proper fix.

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index a066e08860cb..5bfc2f8b13b9 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -271,6 +271,7 @@ config SND_SOC_SOF_JASPERLAKE

  config SND_SOC_SOF_HDA_COMMON
         tristate
+       select SND_INTEL_DSP_CONFIG
         select SND_SOC_SOF_INTEL_COMMON
         select SND_SOC_SOF_HDA_LINK_BASELINE
         help
@@ -330,7 +331,6 @@ config SND_SOC_SOF_HDA
         tristate
         select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
         select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
-       select SND_INTEL_DSP_CONFIG
         help
           This option is not user-selectable but automagically handled by
           'select' statements at a higher level


