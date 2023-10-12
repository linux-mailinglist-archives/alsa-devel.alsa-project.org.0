Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010D7C621D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559C0E11;
	Thu, 12 Oct 2023 03:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559C0E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697073489;
	bh=/D7M6qigE7BuW+ny2OBMZfCWgUKqA2z5eUzLIuV2sXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iJeTJTgR6A103RiCCxxU0OlpfQxxlx7dFo3xft5oQDOs0B3jczDBvSDiS26P5lyI+
	 0NfrdG7hhfMUXBzCrZsn1CNGMb3PMU1RmylNgNOn4b8rLg/s4cWMrzXIaNCM2DrFCa
	 8QVWRZDcmPtDmX2CihVqKsiiw1bpwAEqni6z0tHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5458F80310; Thu, 12 Oct 2023 03:17:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D43F8027B;
	Thu, 12 Oct 2023 03:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3F6AF802BE; Thu, 12 Oct 2023 03:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81B3DF8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B3DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OXkOCsLb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697073424; x=1728609424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/D7M6qigE7BuW+ny2OBMZfCWgUKqA2z5eUzLIuV2sXc=;
  b=OXkOCsLb2HceM5Kpa1CIxD0vjyA01fot+9c5s4HLHX7QWp7+sWHJ0jVg
   gYdgoDHs/UHh1srEJaYjk2FWj1/i7rLBU5pURIu5bRzwgyEaTkHJ7VB3G
   /SafZyOjZiRjWC9SO8SAVHrGwB8Lt8GcuutBokTfc8fn2ZdPDEgXMICjX
   BRzq1LSxeeMEaUVWTCl2ckpEud0WfMJXK3qJqdV+dAgA8Q9InkO3vT05u
   ZdIHjQrGnT+e6DoW5Y6oCvCSxnF2mtNSxFKR6RmLTUz1bywtjuMFTxUsa
   6TS4citGAIdP3YYUGUUMOlWeGUGKLs/LnZzAdd1+65u8F5ErMAJhiFbiQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382051276"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200";
   d="scan'208";a="382051276"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 18:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001348401"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200";
   d="scan'208";a="1001348401"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2023 18:16:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqkJp-0002wz-2F;
	Thu, 12 Oct 2023 01:16:53 +0000
Date: Thu, 12 Oct 2023 09:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board
 configuration
Message-ID: <202310120938.yY6jJXJE-lkp@intel.com>
References: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: MCVKM6G5U3W2TRKDTXYQZ4BQB7GK2QFT
X-Message-ID-Hash: MCVKM6G5U3W2TRKDTXYQZ4BQB7GK2QFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCVKM6G5U3W2TRKDTXYQZ4BQB7GK2QFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20231011]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-Only-create-SSP-d-snd_soc_dai_driver-when-requested/20231011-202503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231011121703.363652-5-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board configuration
config: x86_64-randconfig-002-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120938.yY6jJXJE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120938.yY6jJXJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120938.yY6jJXJE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_ssp':
>> sound/soc/intel/avs/boards/../utils.h:16: multiple definition of `avs_mach_singular_ssp'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:16: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_port':
>> sound/soc/intel/avs/boards/../utils.h:21: multiple definition of `avs_mach_ssp_port'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:21: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_tdm':
>> sound/soc/intel/avs/boards/../utils.h:26: multiple definition of `avs_mach_singular_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:26: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_tdm':
>> sound/soc/intel/avs/boards/../utils.h:33: multiple definition of `avs_mach_ssp_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:33: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_get_ssp_tdm':
>> sound/soc/intel/avs/boards/../utils.h:40: multiple definition of `avs_mach_get_ssp_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:40: first defined here


vim +16 sound/soc/intel/avs/boards/../utils.h

4251ca5fe7340a Amadeusz Sławiński 2023-10-11  13  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  14  inline bool avs_mach_singular_ssp(struct snd_soc_acpi_mach *mach)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  15  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @16  	return hweight_long(mach->mach_params.i2s_link_mask) == 1;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  17  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  18  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  19  inline u32 avs_mach_ssp_port(struct snd_soc_acpi_mach *mach)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  20  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @21  	return __ffs(mach->mach_params.i2s_link_mask);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  22  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  23  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  24  inline bool avs_mach_singular_tdm(struct snd_soc_acpi_mach *mach, u32 port)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  25  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @26  	unsigned long *tdms = mach->pdata;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  27  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  28  	return !tdms || (hweight_long(tdms[port]) == 1);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  29  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  30  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  31  inline u32 avs_mach_ssp_tdm(struct snd_soc_acpi_mach *mach, u32 port)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  32  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @33  	unsigned long *tdms = mach->pdata;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  34  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  35  	return tdms ? __ffs(tdms[port]) : 0;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  36  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  37  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  38  inline int avs_mach_get_ssp_tdm(struct device *dev, struct snd_soc_acpi_mach *mach,
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  39  				int *ssp_port, int *tdm_slot)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @40  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  41  	int port;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  42  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  43  	if (!avs_mach_singular_ssp(mach)) {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  44  		dev_err(dev, "Invalid SSP configuration\n");
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  45  		return -EINVAL;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  46  	}
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  47  	port = avs_mach_ssp_port(mach);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  48  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  49  	if (!avs_mach_singular_tdm(mach, port)) {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  50  		dev_err(dev, "Invalid TDM configuration\n");
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  51  		return -EINVAL;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  52  	}
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  53  	*ssp_port = port;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  54  	*tdm_slot = avs_mach_ssp_tdm(mach, *ssp_port);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  55  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  56  	return 0;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  57  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
