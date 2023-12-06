Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7978074DD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 17:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A0386E;
	Wed,  6 Dec 2023 17:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A0386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701879800;
	bh=tWTy72mM6QmDiHuWH6XcVH51PFBJOPjfQIe5CWDdbsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmV7+TjYeaAQPoJasYBLkNXTLX7Q8gtsFPF1peeB02eMGhuDeAyAY8XUXV8ka12+R
	 JjnXlpZFXQWoYGRdskwvPJwMXTpFd2F1Z5s2+X2BI/Ps8e/8mSLrlbEjQ8iKOZkhjx
	 M3qULt5sxjMROQ3px4zu/TYLYmI+AlYXQgCavvYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE1AF80567; Wed,  6 Dec 2023 17:22:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FF5F80567;
	Wed,  6 Dec 2023 17:22:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A822F8024E; Wed,  6 Dec 2023 17:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B57F1F800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 17:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57F1F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NjOFrC5R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701879755; x=1733415755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWTy72mM6QmDiHuWH6XcVH51PFBJOPjfQIe5CWDdbsw=;
  b=NjOFrC5RvhdfL2HixBLxF/2vaJ/Hc6F8lilkSOP1IZHfDUNLp0lpqgux
   c6J3Vpk7rt/CAsAlEXhYOOZGJELf+deYltPYV/nPgFyCMgw+8NE82m/U/
   v9jlt3g8oNDu9RoQJmYzIsJbRm8VhIjsKcPyxOcz8ZLmkSEI9hcOQOge4
   cXa+pJfbsFOaJxiHxe1Jf1GWglTcZ0qARCQoEnVyNp6NWSjOBWeNpJfNh
   HCALMBmVg/hx42lny0yQO+In1rTjXlp3j3ei7dY1YP9Hdcz4xVNbvPOD6
   FdHcZ1VTZpRGZUHJSXTCXQZ9XhVE7Hy9BUtDmv23oHEpdHgzVVLAqVvhI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480281261"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="480281261"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="764783858"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="764783858"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2023 08:22:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAufB-000B7C-3D;
	Wed, 06 Dec 2023 16:22:18 +0000
Date: Thu, 7 Dec 2023 00:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski@linaro.org,
	broonie@kernel.org, agross@kernel.org, andersson@kernel.org,
	quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	quic_phaniu@quicinc.com, quic_avangala@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
Message-ID: <202312070038.2pjLNBhG-lkp@intel.com>
References: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Message-ID-Hash: 5A2T33HGEUUNIX4GGME7J6LLPF4B56QI
X-Message-ID-Hash: 5A2T33HGEUUNIX4GGME7J6LLPF4B56QI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A2T33HGEUUNIX4GGME7J6LLPF4B56QI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/ASoC-codecs-wcd937x-Add-wcd937x-codec-driver/20231205-203631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231205123400.6353-1-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
config: s390-randconfig-r111-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070038.2pjLNBhG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070038.2pjLNBhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070038.2pjLNBhG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/wcd937x.c:1410:12: sparse: sparse: symbol 'tx_master_ch_text' was not declared. Should it be static?
>> sound/soc/codecs/wcd937x.c:1417:23: sparse: sparse: symbol 'tx_master_ch_enum' was not declared. Should it be static?

vim +/tx_master_ch_text +1410 sound/soc/codecs/wcd937x.c

  1409	
> 1410	const char * const tx_master_ch_text[] = {
  1411		"ZERO", "SWRM_TX1_CH1", "SWRM_TX1_CH2", "SWRM_TX1_CH3", "SWRM_TX1_CH4",
  1412		"SWRM_TX2_CH1", "SWRM_TX2_CH2", "SWRM_TX2_CH3", "SWRM_TX2_CH4",
  1413		"SWRM_TX3_CH1", "SWRM_TX3_CH2", "SWRM_TX3_CH3", "SWRM_TX3_CH4",
  1414		"SWRM_PCM_IN",
  1415	};
  1416	
> 1417	const struct soc_enum tx_master_ch_enum =
  1418		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(tx_master_ch_text), tx_master_ch_text);
  1419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
