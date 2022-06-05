Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D659A53DCA5
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 18:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EE81926;
	Sun,  5 Jun 2022 18:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EE81926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654444924;
	bh=p2rvYINhcy33Y4ywqrw+OJul21tsTbOIlv60AkIcyD8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRmQeIOmDzMHWeMbEL+YcxOEpvR55Bo2YrQgz1qxEWizPo8TFaaZyu2okW6MWQgr2
	 FBlzDEwWoUG9ILScJkZlqc/R1Gxy3yp/AJCSjpg4hjxaGTrNRyizQ4Tqp1vJuC0d7F
	 8zAs0XqNkI1epiJkSaqfeFZjf4p53yphFd7IwfBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4CEF8016C;
	Sun,  5 Jun 2022 18:01:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5A5BF80162; Sun,  5 Jun 2022 18:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BAA7F80089
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 18:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BAA7F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TOt5bWnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654444860; x=1685980860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p2rvYINhcy33Y4ywqrw+OJul21tsTbOIlv60AkIcyD8=;
 b=TOt5bWnG1sJEHKoJZOtMUD3BBQU7eqDOWSEK8RtzTjTwBXgzv3V6Nn0k
 McWTJXgkH9wl7PbfPf8ZDE+b+R0Cird5mNTDt7C4D764PBfixQ9lZ4ruW
 vHMPA8gFzr3+R/maf7wi8flRgprtnHcG/uWM/6bvbnK7mfbcfRZaReti0
 O14G3V4wPdB7sQ1mkoeGpDiP1TRGgGzqUKW1hqH4kbNMTNT0wrY1Wu/n2
 Yovpl0kmaxUQX5D22CBFEnj4oMCrqrKSN5DSUDb8Zs23WFT9eYdjS5kjt
 jbEtGq+2m+eCuk7NY4LuTjs0Pv3rb3TNVKMyZcL3bCwdTOYjURxcMBFKL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="337269580"
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; d="scan'208";a="337269580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2022 09:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; d="scan'208";a="554064493"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 05 Jun 2022 09:00:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nxsgJ-000C21-BT;
 Sun, 05 Jun 2022 16:00:47 +0000
Date: Mon, 6 Jun 2022 00:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: wcd938x: Fix event generation for some controls
Message-ID: <202206052345.ErWjOII2-lkp@intel.com>
References: <20220603122526.3914942-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603122526.3914942-1-broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Mark Brown <broonie@kernel.org>
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
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220605/202206052345.ErWjOII2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/77b0604d37f40ad0f56da53a9a38ad0de298fa52
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-wcd938x-Fix-event-generation-for-some-controls/20220605-162848
        git checkout 77b0604d37f40ad0f56da53a9a38ad0de298fa52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wcd938x.c:2546:6: warning: unused variable 'change' [-Wunused-variable]
           int change;
               ^
   1 warning generated.


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
