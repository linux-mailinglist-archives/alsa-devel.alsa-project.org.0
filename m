Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7988D575
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 05:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFB92BE4;
	Wed, 27 Mar 2024 05:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFB92BE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711513508;
	bh=HTItWPms0pqAtokhHLP7v+ctnR3icIkNDyzsM1SRPxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k4eC6WdNOYra1u0wsFGmIsT+ZZkSt90IYHsa9dkUctXDEG0fXxShPGPIKH5Y3Uit/
	 qG8Lx2xK4BXMvfdXXYInwSALRmQ+Xtlkw20ps686Avz9GghdMSghhdIELrSXfBm4Wx
	 yD+2hBiOwjBYKDJuOvMRs5TD3esxAlFvubqr4kXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12C1F805A1; Wed, 27 Mar 2024 05:24:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE5FF8059F;
	Wed, 27 Mar 2024 05:24:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F10F8025F; Wed, 27 Mar 2024 05:22:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02209F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 05:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02209F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X2b+BcVe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711513342; x=1743049342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HTItWPms0pqAtokhHLP7v+ctnR3icIkNDyzsM1SRPxI=;
  b=X2b+BcVeUdMD6WPBHdCKspG0jnCTFk14gsuV8kb3mIuaAHtU921Fy2k3
   TsB4klUozYeTfuFEunLSlyAjhWjBCN6lmicRPSmp4IlymJNXaiE9WMYnf
   0qsXsJ6u7Fewh/9FhRzvBQ8x79ovdTW378sBTQgDlr49XlO0WXHQOXy+X
   ehAqjne7X2y2oBU6gBKYFBY1lnrMV1/TUBdR4UwBOudaJmvgOpOGlxJLb
   eceaim5ym30zV+7v5zUBXNh45EFpiTkN4AUt+cCG7U807jYi+F+gvmz/v
   AI7NJNfe0c4ps4mAPymfIEEea81zX/kWZZJRBgG93OYWuwygwB0n9o3K9
   A==;
X-CSE-ConnectionGUID: hdhl0MrfT3C6uDmmgiOa9A==
X-CSE-MsgGUID: 2+6lSimWTWeRD3Fj8oedow==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6458265"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000";
   d="scan'208";a="6458265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000";
   d="scan'208";a="20892618"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 21:22:14 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpKnj-0000kS-0U;
	Wed, 27 Mar 2024 04:22:11 +0000
Date: Wed, 27 Mar 2024 12:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: hda/tas2781: remove digital gain kcontrol
Message-ID: <202403271212.5Lxo4b20-lkp@intel.com>
References: 
 <313e00499eb2caadd23a92284fdec418b650b7f4.1711401621.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <313e00499eb2caadd23a92284fdec418b650b7f4.1711401621.git.soyer@irl.hu>
Message-ID-Hash: XQG5RUF6MV7N6AIXNX2Q5SLNFJ42GBUY
X-Message-ID-Hash: XQG5RUF6MV7N6AIXNX2Q5SLNFJ42GBUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQG5RUF6MV7N6AIXNX2Q5SLNFJ42GBUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Gergo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Gergo-Koteles/ALSA-hda-tas2781-remove-digital-gain-kcontrol/20240326-052937
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/313e00499eb2caadd23a92284fdec418b650b7f4.1711401621.git.soyer%40irl.hu
patch subject: [PATCH 1/3] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-randconfig-011-20240326 (https://download.01.org/0day-ci/archive/20240327/202403271212.5Lxo4b20-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271212.5Lxo4b20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271212.5Lxo4b20-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-i2c.c:148:27: error: use of undeclared identifier 'dvc_tlv'
     148 |                 tas2781_digital_putvol, dvc_tlv),
         |                                         ^
>> sound/soc/codecs/tas2781-i2c.c:595:19: error: invalid application of 'sizeof' to an incomplete type 'const struct snd_kcontrol_new[]'
     595 |         .num_controls           = ARRAY_SIZE(tas2781_snd_controls),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   2 errors generated.


vim +/dvc_tlv +148 sound/soc/codecs/tas2781-i2c.c

ef3bcde75d06d6 Shenghao Ding 2023-06-18  141  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  142  static const struct snd_kcontrol_new tas2781_snd_controls[] = {
ef3bcde75d06d6 Shenghao Ding 2023-06-18  143  	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  144  		1, 0, 20, 0, tas2781_amp_getvol,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  145  		tas2781_amp_putvol, amp_vol_tlv),
ef3bcde75d06d6 Shenghao Ding 2023-06-18  146  	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  147  		0, 0, 200, 1, tas2781_digital_getvol,
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @148  		tas2781_digital_putvol, dvc_tlv),
ef3bcde75d06d6 Shenghao Ding 2023-06-18  149  	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  150  		tas2781_force_fwload_get, tas2781_force_fwload_put),
ef3bcde75d06d6 Shenghao Ding 2023-06-18  151  };
ef3bcde75d06d6 Shenghao Ding 2023-06-18  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
