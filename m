Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99317805B15
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 18:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C99382B;
	Tue,  5 Dec 2023 18:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C99382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701797042;
	bh=xSFoJNtBEh1slwXcU0gofzkPL1OMQMY6UhlC/9rL2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSXwJLP0pwbnrliRoCZ4bgkLTXS1OXTcX7uZsbz0U+jNuKQEsbHqNN624Wg76HJZg
	 jlXvMNYfxCITSiZyKsbtS0RPjXJJjhFPhft5hlYJkUgOYQwE96QIrf+df7xJaxu0q8
	 /SpX6ATb8tkI8E0rdLKe3+/6fKJn6YjglyZD8nWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44F5EF80587; Tue,  5 Dec 2023 18:23:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E864EF80571;
	Tue,  5 Dec 2023 18:23:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9B2F8025A; Tue,  5 Dec 2023 18:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB58BF800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 18:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB58BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aPoseBHM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796996; x=1733332996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSFoJNtBEh1slwXcU0gofzkPL1OMQMY6UhlC/9rL2Bs=;
  b=aPoseBHME1soVaRhMiUVCN1C8eO3w73BB/wNEJKNJwktgtDjwk1lzZY0
   PbXDVL0UJpH7/du7ft0ITpGEbcE/JBJuclGR7RvTxwCPuBWYoR9RIAKcb
   /jOZeD5YpH0lt5JE+ocYtrDr3Qt6UgQ0OSYDMKLOq5/mniHVGE+Ol/oRC
   YXNrTUodJ/LfYLoPxANpc7UPLswzPzbPu3rJfkYIlvPXuihQuU61LxmxA
   RxR4glQMeqzl6gNCP5W6jnk1kJozoIcpGDO/5toyoJHMjoTguSnha0Jaq
   d0lxe4IkTm1yJnjcRwyD4BzmzEQynIrkSgcrbQzk8bM1Zycz5w43C2Xqi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12645343"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="12645343"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720779258"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="720779258"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 09:23:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZ8S-0009RK-0h;
	Tue, 05 Dec 2023 17:23:04 +0000
Date: Wed, 6 Dec 2023 01:22:43 +0800
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
Message-ID: <202312060107.dTzr6BK9-lkp@intel.com>
References: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
Message-ID-Hash: FYMDFJQ3NTOG5TEFS4PAKRGTGQQVFFLD
X-Message-ID-Hash: FYMDFJQ3NTOG5TEFS4PAKRGTGQQVFFLD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYMDFJQ3NTOG5TEFS4PAKRGTGQQVFFLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Neil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
config: arc-randconfig-r123-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060107.dTzr6BK9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060107.dTzr6BK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060107.dTzr6BK9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/wcd939x.c:1563:12: sparse: sparse: symbol 'tx_master_ch_text' was not declared. Should it be static?
>> sound/soc/codecs/wcd939x.c:1570:23: sparse: sparse: symbol 'tx_master_ch_enum' was not declared. Should it be static?

vim +/tx_master_ch_text +1563 sound/soc/codecs/wcd939x.c

  1562	
> 1563	const char * const tx_master_ch_text[] = {
  1564		"ZERO", "SWRM_PCM_OUT", "SWRM_TX1_CH1", "SWRM_TX1_CH2", "SWRM_TX1_CH3",
  1565		"SWRM_TX1_CH4", "SWRM_TX2_CH1", "SWRM_TX2_CH2", "SWRM_TX2_CH3",
  1566		"SWRM_TX2_CH4", "SWRM_TX3_CH1", "SWRM_TX3_CH2", "SWRM_TX3_CH3",
  1567		"SWRM_TX3_CH4", "SWRM_PCM_IN",
  1568	};
  1569	
> 1570	const struct soc_enum tx_master_ch_enum =
  1571		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(tx_master_ch_text),
  1572				    tx_master_ch_text);
  1573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
