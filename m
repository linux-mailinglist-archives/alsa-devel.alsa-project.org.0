Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AE16785
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 18:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0DA17D2;
	Tue,  7 May 2019 18:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0DA17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557245676;
	bh=NwY57+/kvYggH6MMcHrMqwQr3KT/Apot1NYGkMjqmQg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGvFstbr5wyu6Vbncqko0ppevmmWa0DuQ529s2lESlnsyc6o8nfy4OfPsOH2gJnUm
	 esGQzDH6T65aLfETQbzPDnJKtiu8VLSSfX9iQ0qjUMfB/p9dYWsoDI6iq705/zssVY
	 CS9dOJm62aguwgWoA1expb+tRGlbLs1xakHf4DS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1ACF896EC;
	Tue,  7 May 2019 18:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E83DBF89671; Tue,  7 May 2019 18:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1DF1F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 18:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1DF1F89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 09:12:45 -0700
X-ExtLoop1: 1
Received: from jcsedaya-mobl1.amr.corp.intel.com (HELO [10.255.228.16])
 ([10.255.228.16])
 by orsmga005.jf.intel.com with ESMTP; 07 May 2019 09:12:45 -0700
To: kbuild test robot <lkp@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <201905071715.qMuQoKTo%lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <476de058-ef89-101b-850d-dbc6aa716d9c@linux.intel.com>
Date: Tue, 7 May 2019 10:22:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201905071715.qMuQoKTo%lkp@intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org
Subject: Re: [alsa-devel] [asoc:for-5.2 248/316] ld:
 sound/soc/sof/sof-acpi-dev.o:undefined reference to `sof_xtensa_arch_ops'
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



On 5/7/19 4:20 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2
> head:   f153bf49ddf6169544b24ef5ea26fa3eb4996b95
> commit: 7e978fa37df7f771a5d02934ff828a0ee36bcf11 [248/316] ASoC: SOF: Add Build support for SOF core and Intel drivers
> config: i386-randconfig-l0-05071509 (attached as .config)
> compiler: gcc-5 (Debian 5.5.0-3) 5.4.1 20171010
> reproduce:
>          git checkout 7e978fa37df7f771a5d02934ff828a0ee36bcf11
>          # save the attached .config to linux build tree
>          make ARCH=i386
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x120): undefined reference to `sof_xtensa_arch_ops'
>     ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x180): undefined reference to `sof_xtensa_arch_ops'
>     ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x1e0): undefined reference to `sof_xtensa_arch_ops'

Ack. this is due to a stupid typo in a Kconfig, will send a formal fix 
shortly.

  config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
         tristate
-       select SND_SOC_INTEL_COMMON
+       select SND_SOC_SOF_INTEL_COMMON


No idea why it wasn't found earlier, kbuild tracks the SOF tree but 
never complained about this one...

> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
