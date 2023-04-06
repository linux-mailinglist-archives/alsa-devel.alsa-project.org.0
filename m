Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABD6D9960
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBBCEE85;
	Thu,  6 Apr 2023 16:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBBCEE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680790563;
	bh=KNXFwfsNDeT4WqA11iXXgLWXJnFpxbYCsiWpVtQ/11s=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LmRBeX5Hck/TJNGMbK3SZ6bDK9FTeIDyVvaC9Ny6UmjVcTT1gstCsH94i2Loqycea
	 gZzHXXbzn0qAa6nYzAuYhMf04MewUAfQUN6gylO0zi0MXUq8lXNwbbaSiSmvaHpZaa
	 VMVMYoTrmDLzR0kH6DnEsOSx7FH6OepcLjHHfQ1o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0A8F80171;
	Thu,  6 Apr 2023 16:15:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B947F80246; Thu,  6 Apr 2023 16:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D100F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 16:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D100F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TU0/NRWc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680790500; x=1712326500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNXFwfsNDeT4WqA11iXXgLWXJnFpxbYCsiWpVtQ/11s=;
  b=TU0/NRWcCY201DxkQynv7isrj213d+K9EjUAgAUDvN8aqFYGCiCWodUX
   i3SF4Oq4biqroeuQQOAx/f/FcirfY2V534FWT5BHVWRX+67DxSMuDurbr
   SKi7qhkPRgy//Yjkhjd9KrNmMPBNAFxIEOjFIJC2JDgALTmWCZPjb4tmn
   ez6TKeBl0ITYtEb6Etv1SSlCUT9IJx/oHGW2XxZr4XvDYlBrk16J6RR3p
   f7o41EYioZOCEFRF8I+tEb596OGg/iEDqWLj7AYstzCC/q6yvaCfWZcyo
   EcEpYCkao6vgvxq2FBXn092HfwYdLPsDRdaDE7MHx0d3GbBeQFM0o3cg/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340232864"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="340232864"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1016893973"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="1016893973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2023 07:14:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkQO6-000RQU-20;
	Thu, 06 Apr 2023 14:14:54 +0000
Date: Thu, 6 Apr 2023 22:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 polishing
Message-ID: <202304062227.WvZq9Td4-lkp@intel.com>
References: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>
Message-ID-Hash: 43XR4XFC3YGIMGAWOSTHZSOTY2FVNFXF
X-Message-ID-Hash: 43XR4XFC3YGIMGAWOSTHZSOTY2FVNFXF
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43XR4XFC3YGIMGAWOSTHZSOTY2FVNFXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230406]
[cannot apply to tiwai-sound/for-linus linus/master v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/docs-sound-kernel-api-writing-an-alsa-driver-rst-polishing/20230406-042253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230405201220.2197863-1-oswald.buddenhagen%40gmx.de
patch subject: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst: polishing
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/7d621283190964e9edd72b8960fe9819339d62d8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/docs-sound-kernel-api-writing-an-alsa-driver-rst-polishing/20230406-042253
        git checkout 7d621283190964e9edd72b8960fe9819339d62d8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062227.WvZq9Td4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3992: WARNING: Literal block expected; none found.
>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4004: WARNING: Unexpected indentation.

vim +3992 Documentation/sound/kernel-api/writing-an-alsa-driver.rst

7ddedebb03b7ec Takashi Iwai       2016-09-29  3989  
7d621283190964 Oswald Buddenhagen 2023-04-05  3990     Suppose you have a file xyz.c. Add the following two lines::
7ddedebb03b7ec Takashi Iwai       2016-09-29  3991  
7ddedebb03b7ec Takashi Iwai       2016-09-29 @3992    snd-xyz-objs := xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3993    obj-$(CONFIG_SND_XYZ) += snd-xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3994  
7ddedebb03b7ec Takashi Iwai       2016-09-29  3995  2. Create the Kconfig entry
7ddedebb03b7ec Takashi Iwai       2016-09-29  3996  
7d621283190964 Oswald Buddenhagen 2023-04-05  3997     Add the new entry of Kconfig for your xyz driver::
7d621283190964 Oswald Buddenhagen 2023-04-05  3998  
7d621283190964 Oswald Buddenhagen 2023-04-05  3999    config SND_XYZ 
7d621283190964 Oswald Buddenhagen 2023-04-05  4000      tristate "Foobar XYZ"
7d621283190964 Oswald Buddenhagen 2023-04-05  4001      depends on SND
7d621283190964 Oswald Buddenhagen 2023-04-05  4002      select SND_PCM
7d621283190964 Oswald Buddenhagen 2023-04-05  4003      help
7d621283190964 Oswald Buddenhagen 2023-04-05 @4004        Say Y here to include support for Foobar XYZ soundcard.
7d621283190964 Oswald Buddenhagen 2023-04-05  4005        To compile this driver as a module, choose M here:
7d621283190964 Oswald Buddenhagen 2023-04-05  4006        the module will be called snd-xyz.
7d621283190964 Oswald Buddenhagen 2023-04-05  4007  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
