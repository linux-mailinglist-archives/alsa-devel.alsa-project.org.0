Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD9523E71
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 22:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02961AA2;
	Wed, 11 May 2022 22:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02961AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652299724;
	bh=p1YYXl+yTi1DWtmId54tKAQpdz8+AHZrDsEKCg5NNqI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gn0NMfH9ALZNugU9IK7di+YBZeE5tWiBL+5pTTxxIUX/taMSOhxmkBi9gkzNNa1NJ
	 ybbnmEEzSEYqsgPAzAsDIPddLX95P2qlx7+3/TpE/388etjsua2k9mYyHtCeVp9vco
	 6Gq7/udAYnyw0GlrA46dMV445Gp7Hqyst8LIEmro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0732EF800BB;
	Wed, 11 May 2022 22:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E97BF8015B; Wed, 11 May 2022 22:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34258F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 22:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34258F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hAfrj9f0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652299662; x=1683835662;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=p1YYXl+yTi1DWtmId54tKAQpdz8+AHZrDsEKCg5NNqI=;
 b=hAfrj9f0CkOX7keGALJZqJQnr2ZDjbEi8altAas3rUIW/kRASWVWX3IV
 nrXFh8fGi1OPHvJp9dTnSjOiXzsV4MlJX09AhoaYIXCl4akK5jLaoBmXj
 pfBQ4gO8uwFZzeh4vriOz099oKLe5Wif5ta6kovq0pOhDvNc6cIuho0NT
 PMdYQoK1C4f8ZaKdCN3aXPrjQsdH/8aGZRogmXpn2ko1hp5nE5Lbp/92m
 /+otHeucZm4Dou8I6FR26QsjGb2prz3X9dV0ikoB/bEF04Y6uB3cUK7JJ
 xHQwltRVyq+aYm5x4ObPmW63emXtwsdebdzJ0ClA0uT3gRYh5IOcf5Fe3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="332839239"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="332839239"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 13:07:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="711629310"
Received: from tssurap-mobl1.amr.corp.intel.com (HELO [10.255.229.68])
 ([10.255.229.68])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 13:07:35 -0700
Message-ID: <69a3eaf4-0ad6-ffbf-f5be-d6fdc880276f@linux.intel.com>
Date: Wed, 11 May 2022 15:07:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_MAX98357A when selected by SND_SOC_INTEL_SOF_CS42L42_MACH
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: kernel test robot <yujie.liu@intel.com>, Brent Lu <brent.lu@intel.com>
References: <202205110550.80rLRw2L-lkp@intel.com>
 <cc9905dd-5b66-d01e-491c-64c18198d208@intel.com>
 <dfae72f1-0ee0-cf22-0fd7-5465209fb8b0@linux.intel.com>
In-Reply-To: <dfae72f1-0ee0-cf22-0fd7-5465209fb8b0@linux.intel.com>
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


>>>> kismet: WARNING: unmet direct dependencies detected for
>> SND_SOC_MAX98357A when selected by SND_SOC_INTEL_SOF_CS42L42_MACH
>>
>>    WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
>>      Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
>> GPIOLIB [=n]
>>      Selected by [y]:
>>      - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML && SND
>> [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_HDA_LINK
>> [=y] || SND_SOC_SOF_BAYTRAIL [=n]) && I2C [=y] && ACPI [=y] &&
>> SND_HDA_CODEC_HDMI [=y] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y] &&
>> (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])
> 
> I can reproduce this, but I question the hard dependency on GPIOLIB in
> the amplifier Kconfig:
> 
> 	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
> 				"sdmode", GPIOD_OUT_LOW);
> 
> If the gpio is optional, max98357a.c should build and compile without
> GPIOLIB, no?

The warning goes away with the patch suggested in
https://github.com/thesofproject/linux/pull/3646

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig

index b106e55170904..8536773548090 100644

--- a/sound/soc/codecs/Kconfig

+++ b/sound/soc/codecs/Kconfig

@@ -986,7 +986,6 @@ config SND_SOC_MAX98095



 config SND_SOC_MAX98357A

        tristate "Maxim MAX98357A CODEC"

-       depends on GPIOLIB



 config SND_SOC_MAX98371

        tristate

