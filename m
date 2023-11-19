Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A87F04CC
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Nov 2023 09:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D090A4A;
	Sun, 19 Nov 2023 09:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D090A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700382325;
	bh=0NkMhkkV+cUo97yEBokAzfARPMt+tQWy8S0Z8qalPik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pG0IPxK056M99jGFKVPDOWcOJuxAnAYPEZDnSKCH9eKQPgB6P2MttewunTMzyxPmd
	 Sl+vQh2I2bEVuA2Y/hnOSh0heW+vJxc0U69/WC2m9i1tm+dc48YjJ/FTfSu53vbtLs
	 kN2oaGc9mUaLCcWnS+FlvgxheuEUdtqcAvoBRY6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F86AF80558; Sun, 19 Nov 2023 09:24:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D05F80249;
	Sun, 19 Nov 2023 09:24:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63F72F80254; Sun, 19 Nov 2023 09:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C82D1F80166
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 09:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82D1F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SSj0hc8n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700381818; x=1731917818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0NkMhkkV+cUo97yEBokAzfARPMt+tQWy8S0Z8qalPik=;
  b=SSj0hc8nyIHsAuNrKeA1sXtx0bk8Ah5nyTo/A9DrCeMtECD+hnE14W42
   zGitROOxvOkZTMZ+EW97hZU2ewhYbVlbM9o4KFKGMSpkx1eZ5GIBvka9U
   A9Infh+6HOjtV5IKKWLkAUuso/JJTeLJsyrTBK0wyRiKzcNKzXH5zXvJB
   W5VYHz2AD0vgnY7BVqCw/AF7o22PUF8Ic/NgfGh5jvdZWhsXf8Hz875D4
   NHbhXidGDgPbGcVkUsLsVuLp2bNiPFYwvV359mNVOaYVy7MXdwruOPf3Z
   pibVmiT8eX9Y8hdw17t5s0bg0WycZyy9/IYy+/7O/YEzhp4W96UJoZAws
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="381866517"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600";
   d="scan'208";a="381866517"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 00:16:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="759536758"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600";
   d="scan'208";a="759536758"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Nov 2023 00:16:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4cyv-0004pL-1K;
	Sun, 19 Nov 2023 08:16:41 +0000
Date: Sun, 19 Nov 2023 16:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v9 23/27] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <202311191651.ayfggTMD-lkp@intel.com>
References: <20231115144007.478111-24-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115144007.478111-24-herve.codina@bootlin.com>
Message-ID-Hash: 2CGJVEQUJC34467WQZ3U2ZG4KV6ZD3OJ
X-Message-ID-Hash: 2CGJVEQUJC34467WQZ3U2ZG4KV6ZD3OJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CGJVEQUJC34467WQZ3U2ZG4KV6ZD3OJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-tsa-Fix-__iomem-addresses-declaration/20231115-224517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231115144007.478111-24-herve.codina%40bootlin.com
patch subject: [PATCH v9 23/27] net: wan: framer: Add support for the Lantiq PEF2256 framer
config: s390-kismet-CONFIG_MFD_CORE-CONFIG_FRAMER_PEF2256-0-0 (https://download.01.org/0day-ci/archive/20231119/202311191651.ayfggTMD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191651.ayfggTMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191651.ayfggTMD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_CORE when selected by FRAMER_PEF2256
   
   WARNING: unmet direct dependencies detected for MFD_CORE
     Depends on [n]: HAS_IOMEM [=n]
     Selected by [y]:
     - FRAMER_PEF2256 [=y] && NETDEVICES [=y] && WAN [=y] && FRAMER [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
