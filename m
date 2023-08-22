Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B1784552
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 17:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1CD20C;
	Tue, 22 Aug 2023 17:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1CD20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692717712;
	bh=126PYpTFgNWNrGZ7TD478cuYrkTzyARzZTyWre4ExCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tV9WKviEag6wqd72X3Pd2doXI7CFp0bWxDRaR7kpKFr85y7XEZfGxYYnWLiMOUkrR
	 g5K1bbBEm8rwpefNwisE1YploADS7zWEkZqALo+d1eZbq4htTD///nFaxvov53uFcB
	 net5JI1OgX091LyFXQWALZ1A8roAH1ZN460g1EvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB39F800D1; Tue, 22 Aug 2023 17:21:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 295E4F800F5;
	Tue, 22 Aug 2023 17:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18BBBF80158; Tue, 22 Aug 2023 17:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AA23F800D1
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 17:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA23F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hqV1Zgga
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692717654; x=1724253654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=126PYpTFgNWNrGZ7TD478cuYrkTzyARzZTyWre4ExCI=;
  b=hqV1ZggaLQRm2ibKdQcxu7hqb0ltL18oCmCcnFk65XINODBmfmQQQSO8
   1yARdT6MHv3yKV69nypNC31/aYTHnsdpy8zesHB2b3yOuFDvHSEmlUnkg
   v8Hal8bsjT3f8dioD7ekvZYugwO/5YV+FIyvJg0AQbb0C/3iSraKGAQZq
   Z6KMcd8MIkhYn1u1U2e4tNSJszpAGoKSZC8BLwUBm8cd6VRnKl1jYLupd
   AaFMmPcZ2Jvm3N574ATp60pjfj3toqwbR3e2Z4CiuMpJHOco/Fd5GEEfR
   mOASm4Y9F86gBsTpj1+w5jSQShWDWMYLvZrfbUzjFd8NaaYvfvAbmAyn3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377670294"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200";
   d="scan'208";a="377670294"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806328281"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200";
   d="scan'208";a="806328281"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 08:20:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYTBB-0000HQ-0p;
	Tue, 22 Aug 2023 15:20:25 +0000
Date: Tue, 22 Aug 2023 23:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ASoC: Delete UDA134x/L3 audio codec
Message-ID: <202308222331.ZaXmBhDK-lkp@intel.com>
References: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
Message-ID-Hash: HHTCJIDPAZK5F52B4Y67DXGCLOYYULI4
X-Message-ID-Hash: HHTCJIDPAZK5F52B4Y67DXGCLOYYULI4
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHTCJIDPAZK5F52B4Y67DXGCLOYYULI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 17b9f4387ebabb19b871bbe2d06562e48e4e7130]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/ASoC-Delete-UDA134x-L3-audio-codec/20230821-222139
base:   17b9f4387ebabb19b871bbe2d06562e48e4e7130
patch link:    https://lore.kernel.org/r/20230821-delete-l3-v1-1-26d9cd32e7a2%40linaro.org
patch subject: [PATCH] ASoC: Delete UDA134x/L3 audio codec
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308222331.ZaXmBhDK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222331.ZaXmBhDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222331.ZaXmBhDK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'sound/soc/codecs/l3.o', needed by 'sound/soc/codecs/snd-soc-l3.o'.
   scripts/Makefile.build:243: sound/soc/codecs/Makefile: wcd-clsh-v2.o is added to multiple modules: snd-soc-wcd9335 snd-soc-wcd934x snd-soc-wcd938x
   make[6]: Target 'sound/soc/codecs/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
