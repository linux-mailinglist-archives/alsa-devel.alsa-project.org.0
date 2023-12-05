Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5F805AEE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 18:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E029A11C;
	Tue,  5 Dec 2023 18:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E029A11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701796433;
	bh=BmifUTMaKj9dY4/DK95TnLsaZxvxHwv5Do/Twvz99vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R3KLH1CC/YwB38R+TU2X3gAJoAuufgBJZgVEi7Gr7eqWcm1FPfL513A4nVfGWHLns
	 NR0oQHm1w6B1btHfDMjWb4QPdSs7YIk82pDEOEEpyZKjQnJ4ReqSmF3UEaa/X+3ekp
	 RkiWgR++imL10p0NDwpZjHHam4dKTFG5zTyy0buE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 375FEF80589; Tue,  5 Dec 2023 18:13:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85FABF80578;
	Tue,  5 Dec 2023 18:13:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7835F8024E; Tue,  5 Dec 2023 18:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 116B6F800E4
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 18:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 116B6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aayoMzll
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796395; x=1733332395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BmifUTMaKj9dY4/DK95TnLsaZxvxHwv5Do/Twvz99vk=;
  b=aayoMzllAeBBZFxdl8c47Wi7b+lLNgWklXSqZk3q1H5UVXd+LrwDkKn2
   YU9u3/REmvLPpdfvBNDMMejJ5qYiEnC13uqTr0GNhsI/T99sQYzoHCNbL
   h0Ki15XH2xegUAe7CXT51IwEuWPdA2wkLAWvQ1hfbwg2Cben49KDKFpi4
   uUtBjjLuxk9rosLH+HcTCMj8Ud/8yWtzDXI0oaRKq39JGCnKtwu6FFFOS
   wjeiVbFTvIg6OHvo69Ju/hVpMgGMhOTC4fMYuVWc0aqagmAqmq8+Y0P5T
   ILJklDUUmUiJBnCZLybFFqzfTfndxDRKRLywMrB6hefrSfdVDc3YeyCO1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="984047"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="984047"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861813064"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="861813064"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 09:13:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYyl-0009Qk-27;
	Tue, 05 Dec 2023 17:13:03 +0000
Date: Wed, 6 Dec 2023 01:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <202312060158.z29IZpw9-lkp@intel.com>
References: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
Message-ID-Hash: XMKXCRBJ3R2XI7SP5KZXGZEFLACR4N5Y
X-Message-ID-Hash: XMKXCRBJ3R2XI7SP5KZXGZEFLACR4N5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMKXCRBJ3R2XI7SP5KZXGZEFLACR4N5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Neil,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
config: arm64-randconfig-r123-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060158.z29IZpw9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060158.z29IZpw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060158.z29IZpw9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_set
   >>> referenced by wcd939x.c
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_swap_gnd_mic) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
