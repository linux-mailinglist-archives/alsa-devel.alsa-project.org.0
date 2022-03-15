Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A64D9CBB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA271863;
	Tue, 15 Mar 2022 14:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA271863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647352698;
	bh=I8Gt8y0vsmRDtxHhIYuOjDGSdsVYVup+8tVe/S4t024=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pH45oHLwbgym8yQ2F1NB0+H2YXM7TQXDdolLDiQBYHPKOdAUV7T9N6r620xxfmoU3
	 29rtimvYnAoGdVpHHCq5eYYshA/eWjEzmjx2RKGJvc1h5DbBzE68VIbrew5yLJFAba
	 4ngTph2SOcuFi2i0D7ti8E1Cw9CW3vNCjqKP4crU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0C8F801F7;
	Tue, 15 Mar 2022 14:57:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519BDF80095; Tue, 15 Mar 2022 14:57:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09ABCF80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09ABCF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cQ5CTiHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647352625; x=1678888625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I8Gt8y0vsmRDtxHhIYuOjDGSdsVYVup+8tVe/S4t024=;
 b=cQ5CTiHywyvAKwOKv+Jz1P/Ua9nLm4jp0TNQVDik6mqRm86rayUjImcY
 s/TqVQ0zC0GWs3CWnSBheA0yw32POA1zr8AjmiB/nWNfwRCG4icrshycI
 aeCOFZHEKOjNS2Vc98GL5pEiggg+TWJKJuPBVHnfzuU7F1ZrUJevRZQHk
 1Zts//UA5J1Ej0dMdMrTNii506CfymjUXWJrZ+BYtzefVtnlC3gvoqGnr
 BdzswhuBgf0n5HEHr3JLbvRQkE6H6m8P6rG2f453PtNTNiXncYoa6Oulm
 hVnfWiXw2ylO36mRSHiJI0f0dO5j7sTaPSFhvdNofZ/twjHWR2IWdNITM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256258203"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="256258203"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="498021669"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 06:56:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nU7fT-000B4B-Eq; Tue, 15 Mar 2022 13:56:55 +0000
Date: Tue, 15 Mar 2022 21:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>, broonie@kernel.org, tiwai@suse.com,
 arnaud.pouliquen@st.com
Subject: Re: [PATCH] ASoC: sti: sti_uniperif: Remove driver
Message-ID: <202203152111.fltopk2x-lkp@intel.com>
References: <20220315091319.3351522-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315091319.3351522-1-daniel@0x0f.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Daniel Palmer <daniel@0x0f.com>,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
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

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc8 next-20220310]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Palmer/ASoC-sti-sti_uniperif-Remove-driver/20220315-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
config: x86_64-rhel-8.3-kselftests
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/7970e4bb3de4ff810c1dafb8ac38d222d90ca071
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Palmer/ASoC-sti-sti_uniperif-Remove-driver/20220315-171525
        git checkout 7970e4bb3de4ff810c1dafb8ac38d222d90ca071
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 distclean

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:15: sound/soc/sti/Makefile: No such file or directory
>> make[4]: *** No rule to make target 'sound/soc/sti/Makefile'.
   make[4]: Failed to remake makefile 'sound/soc/sti/Makefile'.
   make[3]: *** [scripts/Makefile.clean:68: sound/soc/sti] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [scripts/Makefile.clean:68: sound/soc] Error 2
   make[2]: Target '__clean' not remade because of errors.
   make[1]: *** [Makefile:1838: _clean_sound] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.
--
>> sound/soc/Kconfig:86: can't open file "sound/soc/sti/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:619: oldconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> sound/soc/Kconfig:86: can't open file "sound/soc/sti/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:619: olddefconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +15 scripts/Makefile.clean

2315c6e42278152 Sam Ravnborg   2005-07-25  12  
2a691470345a002 Sam Ravnborg   2005-07-25  13  # The filename Kbuild has precedence over Makefile
db8c1a7b2ca25f3 Sam Ravnborg   2005-07-27  14  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
db8c1a7b2ca25f3 Sam Ravnborg   2005-07-27 @15  include $(if $(wildcard $(kbuild-dir)/Kbuild), $(kbuild-dir)/Kbuild, $(kbuild-dir)/Makefile)
^1da177e4c3f415 Linus Torvalds 2005-04-16  16  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
