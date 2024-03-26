Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBEA88C2D0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 13:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3DB238B;
	Tue, 26 Mar 2024 13:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3DB238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711457976;
	bh=MtfhUEPPdvxqzOoAPyYQzVuPsUOh0otfavoqH+DBvNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jt4lvDXdH7+MayYjn3FcmUXQRW249ZNjp1draATdUr823rgBzBOxHmViH/iFhJQZq
	 nZROaRLjUxjBcDeq4UB8IgAsvRvt0F1J36A3qCGIETuYS/h7yozhr6P1BRVky+R7ao
	 H7lDUuAG9yl4Bykhf+aLSq4QjGxLjwJmcidSoFQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6761F805A9; Tue, 26 Mar 2024 13:59:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEAC7F8057C;
	Tue, 26 Mar 2024 13:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A1BF8025F; Tue, 26 Mar 2024 13:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3F29F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 13:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F29F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CLvF/uFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711457934; x=1742993934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MtfhUEPPdvxqzOoAPyYQzVuPsUOh0otfavoqH+DBvNY=;
  b=CLvF/uFEdhHnVoIBC2VAhpmx2+YNY0pz8p0zreqVXOaeMNdnvJE5PfXt
   JF06AHKxMedNVycuMhe914SdxPsmxDK73X+hPNmutLxU7MLg0v3v1WeYK
   V2hvzFdO6VD5vJFRzwE9VhX9mbhU7uNcBCqZOa9rEm97FaR0QzwqtW72X
   RFUtiDA4TCxdT4ZT/g8WXwJKdt59hQ27KcWmWQJ/lFH4V9M78bllFUCEU
   LMbElfrmM9CuFqw8Gh7xuZ/mwP3p/1RTZsKpG04KAb/OC1/hajRtYOxil
   1DYDjGFdPcwcZRKAgdC99vPWEPVdsmt04pV1z0ZZOggKhIX7nEExXuE5J
   Q==;
X-CSE-ConnectionGUID: 5WgT4mSmSKeJu3pMOTWB1w==
X-CSE-MsgGUID: 8rs3Zbh7RFexDi080mMttw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6717080"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="6717080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="46972395"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 05:58:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp6O4-00003Q-2A;
	Tue, 26 Mar 2024 12:58:44 +0000
Date: Tue, 26 Mar 2024 20:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: hda/tas2781: remove digital gain kcontrol
Message-ID: <202403262031.SxBP17EM-lkp@intel.com>
References: 
 <313e00499eb2caadd23a92284fdec418b650b7f4.1711401621.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <313e00499eb2caadd23a92284fdec418b650b7f4.1711401621.git.soyer@irl.hu>
Message-ID-Hash: EKD6OWKUZZZGQQIMFDQAMOIIWT55QTMY
X-Message-ID-Hash: EKD6OWKUZZZGQQIMFDQAMOIIWT55QTMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKD6OWKUZZZGQQIMFDQAMOIIWT55QTMY/>
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
config: i386-buildonly-randconfig-004-20240326 (https://download.01.org/0day-ci/archive/20240326/202403262031.SxBP17EM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403262031.SxBP17EM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403262031.SxBP17EM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2781-i2c.c:29:
>> sound/soc/codecs/tas2781-i2c.c:148:41: error: 'dvc_tlv' undeclared here (not in a function)
     148 |                 tas2781_digital_putvol, dvc_tlv),
         |                                         ^~~~~~~
   include/sound/soc.h:271:19: note: in definition of macro 'SOC_SINGLE_RANGE_EXT_TLV'
     271 |         .tlv.p = (tlv_array), \
         |                   ^~~~~~~~~


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
