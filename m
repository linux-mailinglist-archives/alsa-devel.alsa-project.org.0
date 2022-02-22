Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C654BF47A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 10:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5B91721;
	Tue, 22 Feb 2022 10:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5B91721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645521415;
	bh=tO3B7b65zgGhD/1fZ3FxKuMaLdpsJqbQ9EdeiJMWm9w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5XXdT8etu6VQl346x1E/K68jtrayr31jlWnte7B/pGII2ys0E17O6RUb/aOIERTU
	 OxEnatpPNsjTXhjeAy5reaZdBLs202Pm5j8CWRG4oOkIEirls/3syoBC1UmcdKPP45
	 aLUj/KBVbiUxVDPFylsHStUppELC76TDH7UsAc+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B96F0F801F5;
	Tue, 22 Feb 2022 10:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7B4F800D1; Tue, 22 Feb 2022 10:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DFD4F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DFD4F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ntVJOSI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645521340; x=1677057340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tO3B7b65zgGhD/1fZ3FxKuMaLdpsJqbQ9EdeiJMWm9w=;
 b=ntVJOSI5SqJmBw3y+CA4NebYnuZLog1UzNcC24CgoqVVYsM4Ko+FgTl4
 65lImCESYjvuSvE/YeggzHHzQnieGu06wXomsxnpTFZYzTBVwiErSMgTo
 FrCxiwuOmXed6LvIYh6nEJox3GVWzzm1a5b+7fguNzB3eaR8tDx2nq02O
 xNJ2AhsAVO6ErPNw+ZJYLL4tbW9a9IJbgiD78M8SvFauuWCgOUyjs8u5p
 3C/RP013m6GpcNFLQSyeiZTQl2X5w7chYWFRAR+l4gIcwoE6b3czoaG9m
 6aKOpMmuwGz2QzJy0J63P9ZFWzXo07tik3oQ0hqt1CdTsiqKz5X6pT2Dg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250468032"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="250468032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="490724647"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 Feb 2022 01:15:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMRGd-00003p-Bl; Tue, 22 Feb 2022 09:15:31 +0000
Date: Tue, 22 Feb 2022 17:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: amd: acp-legacy: Add legacy card support for
 new machines
Message-ID: <202202221741.TUA7mZol-lkp@intel.com>
References: <20220222061128.719400-3-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222061128.719400-3-AjitKumar.Pandey@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Ajit,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ajit-Kumar-Pandey/ASoC-amd-acp-Add-new-machines-and-minor-tweaks/20220222-141552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-r003-20220221 (https://download.01.org/0day-ci/archive/20220222/202202221741.TUA7mZol-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/ca902de964769c2e605e5b2b7b91e95d1698f5bc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ajit-Kumar-Pandey/ASoC-amd-acp-Add-new-machines-and-minor-tweaks/20220222-141552
        git checkout ca902de964769c2e605e5b2b7b91e95d1698f5bc
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-legacy-mach.c:50:18: error: 'EN_SPKR_GPIO_DW' undeclared here (not in a function); did you mean 'EN_SPKR_GPIO_GB'?
      50 |  .gpio_spkr_en = EN_SPKR_GPIO_DW,
         |                  ^~~~~~~~~~~~~~~
         |                  EN_SPKR_GPIO_GB


vim +50 sound/soc/amd/acp/acp-legacy-mach.c

    42	
    43	static struct acp_card_drvdata rt5682s_rt1019_data = {
    44		.hs_cpu_id = I2S_SP,
    45		.amp_cpu_id = I2S_SP,
    46		.dmic_cpu_id = DMIC,
    47		.hs_codec_id = RT5682S,
    48		.amp_codec_id = RT1019,
    49		.dmic_codec_id = DMIC,
  > 50		.gpio_spkr_en = EN_SPKR_GPIO_DW,
    51	};
    52	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
