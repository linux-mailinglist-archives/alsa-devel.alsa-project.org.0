Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E762523E03
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 21:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA321AA7;
	Wed, 11 May 2022 21:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA321AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652298781;
	bh=PWCSb4NhiQKxZ/rI2pj7f++Br5JH9wBBOHOhy4AXXKA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llx/IxzZKihDf4LhLlBY9b5pZaRc9pzC5qboCFWuQTO7PA862TjM2mzhtxYM7rOn8
	 wW7PF2LeNbLikZWWOhJZ7lvgQsFiYRaoZL3VbRDOg3KVMUPbEt19m2G5voHn83WEok
	 EdaHWAQz5QWgabAFU0Pe9z85srli7UiEjGE1+JsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB60F8011C;
	Wed, 11 May 2022 21:52:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97316F804CA; Wed, 11 May 2022 21:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6524F8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 21:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6524F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iJS2xVPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652298717; x=1683834717;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PWCSb4NhiQKxZ/rI2pj7f++Br5JH9wBBOHOhy4AXXKA=;
 b=iJS2xVPfrtYmR3OnDsVYBWDG6wdg1S6BouesOHgAu4YAS0Ml+Vbjc1TE
 +jteajyYAffspuBm5VqInK+kc0BKyoaBhmFs7jfhiph/Ac49A/9tcCUrO
 ERZjaSKjha5V2qeb5ELJltpkLPwWphzt1L0NH4a2e0b9PyECRLoXYCteu
 /9yfQBrUGBRqXcHGBWlr1NbnPmd+xQJ+rBuoCX5xVOQMEBWKm1TbVE8nE
 3N0Qg5fOug/Lo+vNYSrQW+jWit0GCW+8nGCqjEfm7WFOBWaH27EydAtLb
 /ERfcuBNr4rQbYnrlBbK77Xlm4Uxao+J7hqu7V2FgsZA4Sxfx+Icxqsi/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="332835868"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="332835868"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 12:51:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="711624389"
Received: from tssurap-mobl1.amr.corp.intel.com (HELO [10.255.229.68])
 ([10.255.229.68])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 12:51:47 -0700
Message-ID: <dfae72f1-0ee0-cf22-0fd7-5465209fb8b0@linux.intel.com>
Date: Wed, 11 May 2022 14:51:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_MAX98357A when selected by SND_SOC_INTEL_SOF_CS42L42_MACH
Content-Language: en-US
To: kernel test robot <yujie.liu@intel.com>, Brent Lu <brent.lu@intel.com>
References: <202205110550.80rLRw2L-lkp@intel.com>
 <cc9905dd-5b66-d01e-491c-64c18198d208@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cc9905dd-5b66-d01e-491c-64c18198d208@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, paul@pgazz.com, fazilyildiran@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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



On 5/10/22 22:36, kernel test robot wrote:
> tree:  
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
> commit: 5a7f27a624d9e33262767b328aa7a4baf7846c14 ASoC: Intel: add
> sof-cs42l42 machine driver
> date:   1 year ago
> config: (attached as .config)
> reproduce:
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a7f27a624d9e33262767b328aa7a4baf7846c14
> 
>         git remote add linus
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 5a7f27a624d9e33262767b328aa7a4baf7846c14
>         # 1. reproduce by kismet
>            # install kmax per https://github.com/paulgazz/kmax/README.md
>            kismet --linux-ksrc=linux --selectees
> CONFIG_SND_SOC_MAX98357A --selectors
> CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH -a=x86_64
>         # 2. reproduce by make
>            # save the config file to linux source tree
>            cd linux
>            make ARCH=x86_64 olddefconfig
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <yujie.liu@intel.com>
> 
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for
> SND_SOC_MAX98357A when selected by SND_SOC_INTEL_SOF_CS42L42_MACH
> 
>    WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
>      Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
> GPIOLIB [=n]
>      Selected by [y]:
>      - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML && SND
> [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_HDA_LINK
> [=y] || SND_SOC_SOF_BAYTRAIL [=n]) && I2C [=y] && ACPI [=y] &&
> SND_HDA_CODEC_HDMI [=y] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y] &&
> (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])

I can reproduce this, but I question the hard dependency on GPIOLIB in
the amplifier Kconfig:

	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
				"sdmode", GPIOD_OUT_LOW);

If the gpio is optional, max98357a.c should build and compile without
GPIOLIB, no?


>    WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>      Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
> GPIOLIB [=n]
>      Selected by [y]:
>      - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML && SND
> [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_HDA_LINK
> [=y] || SND_SOC_SOF_BAYTRAIL [=n]) && I2C [=y] && ACPI [=y] &&
> SND_HDA_CODEC_HDMI [=y] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y] &&
> (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])

I can't reproduce this one with Mark's for-next branch, this was fixed I
believe.
