Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18253DF55
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 03:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A50D61A00;
	Mon,  6 Jun 2022 03:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A50D61A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654479078;
	bh=zMSYBdPZzAuuO28IZ9nlREWxNGltAvphQeWdtZeR5zI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NYfc/Vclvvo6b3j8uftV6t44MBydIxCy3olhWeyDr3XFSXrMZkSpSMGfaq/aVwHgb
	 rc6CE0DfGeZOtPzoxt6dU2py3cVJagG3zrysIQp73dn2m/LE7cIE/A836sHUAmZ+iu
	 9GOnW8h/vSQhGczgRJo2HX8NSPd49sTEWf+3zuzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED37F80089;
	Mon,  6 Jun 2022 03:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9400F801D8; Mon,  6 Jun 2022 03:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1660F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 03:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1660F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ah4+blbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654479014; x=1686015014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zMSYBdPZzAuuO28IZ9nlREWxNGltAvphQeWdtZeR5zI=;
 b=Ah4+blbluinPgd2DMt2uAXbWbD5T+9DP+PlbLvzveuQIqMXKDax+Hq1S
 lODVsGGLj01wKz0c6eONkAZhdgxhkryg9GzJuD68pt48RpkRVOyttOJ7N
 ynRy89XOw7CkiG8QJgOs8uyztZrYiSNs3+1debZz3ZQb+i3mPQ+M03hsb
 ddM5BNih1ZXuoUZe0e8GTdiLvRu2SqmZbVzBcr8HpWfad37gvpMVbzkpu
 VWmMbxVmwhy7j5wM28JaRX9swLoWxmf4uCbUlGPKUE6eCiNJjliYdg5NR
 lqeRg4C7mnSIpPCqz7xE1GHt/rR4IJXj5QD/btvMLI+U+rVSCyel3p7qG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="264360103"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="264360103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2022 18:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="635332707"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2022 18:30:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ny1ZC-000COJ-JT;
 Mon, 06 Jun 2022 01:30:02 +0000
Date: Mon, 6 Jun 2022 09:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: wcd938x: Fix event generation for some controls
Message-ID: <202206060948.KAZcrRC8-lkp@intel.com>
References: <20220603122526.3914942-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603122526.3914942-1-broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@lists.01.org
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

Hi Mark,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/ASoC-wcd938x-Fix-event-generation-for-some-controls/20220605-162848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220606/202206060948.KAZcrRC8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/77b0604d37f40ad0f56da53a9a38ad0de298fa52
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-wcd938x-Fix-event-generation-for-some-controls/20220605-162848
        git checkout 77b0604d37f40ad0f56da53a9a38ad0de298fa52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wcd938x.c: In function 'wcd938x_rx_hph_mode_put':
>> sound/soc/codecs/wcd938x.c:2546:13: warning: unused variable 'change' [-Wunused-variable]
    2546 |         int change;
         |             ^~~~~~


vim +/change +2546 sound/soc/codecs/wcd938x.c

  2540	
  2541	static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
  2542					   struct snd_ctl_elem_value *ucontrol)
  2543	{
  2544		struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
  2545		struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> 2546		int change;
  2547	
  2548		if (wcd938x->hph_mode == ucontrol->value.enumerated.item[0])
  2549			return 0;
  2550	
  2551		wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
  2552	
  2553		return 1;
  2554	}
  2555	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
