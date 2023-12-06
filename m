Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CDA80683A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:28:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D381CF;
	Wed,  6 Dec 2023 08:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D381CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701847724;
	bh=xffnH9F5/s2eglTFcbaIqO0o3VhqJC3mGV+1KbfvF1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apcRxE0092ZHdrCJcXCVehKHJXIYzuVG5yREalppifE+4IHpFsL5TzavYdxuojGni
	 4gKmFBn8XrHnJ0KpBnMil3jDtKxsJEzV5g8lotP3kChEon5Vy1T+UEzYOL+QhRvtUk
	 QKxVye/vIqY5QFHefiZem8D2cbrZ+Y78b+OmrkMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7103F80568; Wed,  6 Dec 2023 08:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 061F7F80570;
	Wed,  6 Dec 2023 08:28:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E61FDF8024E; Wed,  6 Dec 2023 08:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A200BF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 08:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A200BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N15KuOqs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701846688; x=1733382688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xffnH9F5/s2eglTFcbaIqO0o3VhqJC3mGV+1KbfvF1U=;
  b=N15KuOqskO/td5Lmn+K40uwMVcBTkg6lsKXDmZrzct66cV0JXRUZOKIG
   LgsOZn9Esv3moXq2WLfjoc0TrIsWHu2Q2Pyh9s4wHmHKuWuW7jmg43Y6A
   vKWgIbwlJ/nTjAZdJuKWnN7oz2nRNLjQ8aqH1XFKZoTVTdPTnVaHpr1uf
   MBpnwGm+BmhcK9dGuQ2sFVd2OWEVMbeajr7elRT+RJu32ltyW635uHHE1
   zcsLLGEU+M/J0wXm/DJ73XoDk/Gg2NPl8epuRBkP9Gvx0WOSgergVXa2w
   cPeGvQZWWQvlBcfrPyXd4HjUSg6avPn53ZHlKu1g0iIIRGDfmNIYQ67jM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480215910"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600";
   d="scan'208";a="480215910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 23:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="862019409"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600";
   d="scan'208";a="862019409"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 23:11:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAm3m-000ARm-1q;
	Wed, 06 Dec 2023 07:11:07 +0000
Date: Wed, 6 Dec 2023 15:10:44 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <202312061428.ck8TrWdU-lkp@intel.com>
References: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
Message-ID-Hash: 2QD7ONANJ64GDG2ZC2SEW2EJDSKVLICH
X-Message-ID-Hash: 2QD7ONANJ64GDG2ZC2SEW2EJDSKVLICH
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
Archived-At: <>
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
config: x86_64-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231206/202312061428.ck8TrWdU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061428.ck8TrWdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061428.ck8TrWdU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_unregister
   >>> referenced by wcd939x.c:3610 (sound/soc/codecs/wcd939x.c:3610)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fwnode_typec_switch_get
   >>> referenced by wcd939x.c:3369 (sound/soc/codecs/wcd939x.c:3369)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: typec_switch_put
   >>> referenced by wcd939x.c:3483 (sound/soc/codecs/wcd939x.c:3483)
   >>>               sound/soc/codecs/wcd939x.o:(wcd939x_bind) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
