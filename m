Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB891890AA0
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 21:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154E12CAA;
	Thu, 28 Mar 2024 21:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154E12CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711656447;
	bh=Wxy3FfO8nWGTOCNgNtvEM6jvzzVf2qp+0P+Xe146MYg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xhf6mEjju+sEEcZ6VuJ4bdPtzgruHknkyBq57bAHoJ5i7ZZT/3t7i02JAUaQgYOzd
	 MnWYwtRYD029VqSgCWhzai61NzCAuJWIHRteI8us9yC09iCNN/uQxrqUJvuyxkc9i0
	 UNd1B/Rs7IvEMSM4JJ5PnjTCe+LuCjVHt1y/EFA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29CEFF805AB; Thu, 28 Mar 2024 21:06:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46257F80563;
	Thu, 28 Mar 2024 21:06:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4821F8025F; Thu, 28 Mar 2024 21:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AD0CF801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 21:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD0CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ashl/C7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711656405; x=1743192405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wxy3FfO8nWGTOCNgNtvEM6jvzzVf2qp+0P+Xe146MYg=;
  b=ashl/C7fdHpN27DA/uhlLqRv4bwJoDrU1FeNcFeQCBdJJtPTjm5p24em
   0FnQWvzJ1Qg4OuEEeceM9qHAGGOMYn7VMQFDVjFkiC/hnJK/ROPckVlj/
   XV+joAb8jKgyMx1A2FD4M7cuhqC5/6fMTSA+fmJ5dFkU8pUKsuqOizT00
   lv7s051VC2TnwQFQ/GcBjscULAOnxXUpYWQZ1Z6WpxduXPCMnQecccpj2
   e5/3wQJeHSftz1AvqgTASA1364M8vvP5Kv7Qn4FNHn5shMgK0t87Iu1WK
   OOisvvtsBg+ts021rSyS7JDqvQBbs5/Ejw+xgZbpaZFSa8peYo3gLcBPS
   Q==;
X-CSE-ConnectionGUID: NLa5Q4HyQZGt6yaC0GHcfA==
X-CSE-MsgGUID: 8KqAOApYQOKkVVcuzJ4Quw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7030076"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000";
   d="scan'208";a="7030076"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 13:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000";
   d="scan'208";a="16786650"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2024 13:06:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpw0w-0002US-32;
	Thu, 28 Mar 2024 20:06:18 +0000
Date: Fri, 29 Mar 2024 04:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-linus 12/17] include/sound/tas2781-tlv.h:18:35:
 warning: 'dvc_tlv' defined but not used
Message-ID: <202403290354.v0StnRpc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: MWMZDYFBXU27WCGNDUABCCNM7LFEVSAQ
X-Message-ID-Hash: MWMZDYFBXU27WCGNDUABCCNM7LFEVSAQ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWMZDYFBXU27WCGNDUABCCNM7LFEVSAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   2d0401ee38d43ab0e4cdd02dfc9d402befb2b5c8
commit: ae065d0ce9e36ca4efdfb9b96ce3395bd1c19372 [12/17] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290354.v0StnRpc-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290354.v0StnRpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290354.v0StnRpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/sound/tlv.h:10,
                    from sound/pci/hda/tas2781_hda_i2c.c:22:
>> include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used [-Wunused-const-variable=]
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |                                   ^~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   include/sound/tas2781-tlv.h:18:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/dvc_tlv +18 include/sound/tas2781-tlv.h

678f38eba1f2fe Shenghao Ding 2023-06-18  17  
678f38eba1f2fe Shenghao Ding 2023-06-18 @18  static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  19  static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 678f38eba1f2fe33ff700e85390ac98393e609ef ASoC: tas2781: Add Header file for tas2781 driver

:::::: TO: Shenghao Ding <13916275206@139.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
