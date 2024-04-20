Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30B8AB828
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Apr 2024 02:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF187E68;
	Sat, 20 Apr 2024 02:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF187E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713573430;
	bh=adroiXsVs79FpRa83a3I9kMT/edKYfdAupWkdkWbHbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eoRi0sc09aFh/ePWODnMVZ+6hBn/uKdZ/dSr2VlMrieonR/hH3xjDnsJWCAmnPEnu
	 lPDzSB4zAKCt3AYpswihohLnp2k/h6zUE+cHt35QervDGWripKr1dTAC0I/fE5XCYb
	 zclaZdT818rZmpJEO1vlEvnPmfHrhVDmfrG0PSRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D2C6F8057F; Sat, 20 Apr 2024 02:36:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECDBF80588;
	Sat, 20 Apr 2024 02:36:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E5EF80423; Sat, 20 Apr 2024 02:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E7A6F8013D
	for <alsa-devel@alsa-project.org>; Sat, 20 Apr 2024 02:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E7A6F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PXH4B9Jq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713573384; x=1745109384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adroiXsVs79FpRa83a3I9kMT/edKYfdAupWkdkWbHbI=;
  b=PXH4B9JqR/0Y6KVuHXqAZp61qN9uhgdmpG7MfjaIeSSlLqSKTjuuiIVL
   9csuSNUyhK7YgalXuX+yjMGHGpT6Kir/adRGE2ssr7qk7tGYQBo0Nz/AZ
   1TMPyiTWCR3DyErdTsJpBn1n1Gq9OVewWfbRpYCrHiMqcJ+b6TNY+/8fN
   btmkX7UuJ6j/QVFsuTUnnHaaq4AlZf9aodixUq2s204NZr+MbTk6mhjSq
   nwCdKhO3vunRumtdUFQW4/mpoWBvvXzC5rCZGNq4if6Rsu4lvw+ypEsV4
   TZmF4Vh2ocDC5r484eXLrJjrJVQ1ef6VYshQtyMx7yxvbnRVUaGxnUBGw
   w==;
X-CSE-ConnectionGUID: QZcOM6ZaR/ecwdCvFQ899Q==
X-CSE-MsgGUID: 43lRVqDYT8yuuG3i1EA5Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9114257"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000";
   d="scan'208";a="9114257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 17:36:18 -0700
X-CSE-ConnectionGUID: B9zqgS3SSeuvqwAywk9lag==
X-CSE-MsgGUID: H/C8eYBvQ3OPqPOd6QmliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000";
   d="scan'208";a="23546753"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 17:36:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxyiD-000AbM-0u;
	Sat, 20 Apr 2024 00:36:13 +0000
Date: Sat, 20 Apr 2024 08:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <202404200809.tfVSiQo5-lkp@intel.com>
References: <20240419150140.92527-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419150140.92527-3-srinivas.kandagatla@linaro.org>
Message-ID-Hash: I2UD7RCGTVYFJ6UF5PI66XSBSV23HWC6
X-Message-ID-Hash: I2UD7RCGTVYFJ6UF5PI66XSBSV23HWC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2UD7RCGTVYFJ6UF5PI66XSBSV23HWC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.9-rc4 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-qcom-q6dsp-parse-Display-port-tokens/20240419-230514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240419150140.92527-3-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 2/4] ASoC: qcom: common: add Display port Jack function
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240420/202404200809.tfVSiQo5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200809.tfVSiQo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200809.tfVSiQo5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/common.c:250:22: warning: unused variable 'cpu_dai' [-Wunused-variable]
           struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
                               ^
   1 warning generated.


vim +/cpu_dai +250 sound/soc/qcom/common.c

   246	
   247	int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
   248				   struct snd_soc_jack *hdmi_jack, int hdmi_pcm_id)
   249	{
 > 250		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
