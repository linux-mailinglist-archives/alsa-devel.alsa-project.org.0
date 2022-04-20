Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4D508281
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 09:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E719170A;
	Wed, 20 Apr 2022 09:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E719170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650440667;
	bh=VLZ3Oiyauf4PXpEX5Cd3P8yK2szKUl8ted+JLr34T8s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSr50lwUGVbePYZGpAH/pUHSPbbfc08pYgyYAVv54rV93lKgI/wTQQJ38cOBO/0fg
	 1SR7hUU8yGyp5ZYtPqeYz+8sFXb2mFLyHkm4x0Cn2UM8k/UzEdzKoKVNDvFF9CdZH8
	 /rPPvSfqUls2qYleVoEudAmDxppkqN06o+klphCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C7EF800F8;
	Wed, 20 Apr 2022 09:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91172F8010B; Wed, 20 Apr 2022 09:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15C7DF8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 09:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C7DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jdnktUfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650440601; x=1681976601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VLZ3Oiyauf4PXpEX5Cd3P8yK2szKUl8ted+JLr34T8s=;
 b=jdnktUfPWySv8/yESF526NL1vxQm1KTBv0hVhwLB4eyuzGZApDEgzPT7
 8+0muduZ2mEX7LnE0/M3qANQ1BGBaIPbalqVWMCutJiRXUv6El6sqlqXm
 Kcd+fKrvmDp1FWbIdylpHl6FhpZRxkX5gy2pAmaXsS4jHKb27sSTNZ/f4
 rDILPlT05IySRHNhkvZamPIAltNitC4AsCqdAJ2KijIBaKK3H5btAPGY7
 dUKMiK1KvSMyjF0jI0iOaWbPVWezXathQ1gOna9JUsouLJ8n0AvIHJg7l
 ok7witracg++JOZQkZ/G5BWzA1+q1JRRz1TXFxiOEIhn40hU2TLI34etW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="262822625"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="262822625"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 00:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="510453668"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2022 00:43:11 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nh4zW-0006jC-Ps;
 Wed, 20 Apr 2022 07:43:10 +0000
Date: Wed, 20 Apr 2022 15:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] [v2] m68k: coldfire: drop ISA_DMA_API support
Message-ID: <202204201546.tAlqEoGg-lkp@intel.com>
References: <20220419132716.1392407-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419132716.1392407-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kbuild-all@lists.01.org,
 Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-m68k@lists.linux-m68k.org,
 alsa-devel@alsa-project.org
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

Hi Arnd,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on tiwai-sound/for-next gerg-m68knommu/for-next v5.18-rc3 next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/m68k-coldfire-drop-ISA_DMA_API-support/20220419-212846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: m68k-m5307c3_defconfig (https://download.01.org/0day-ci/archive/20220420/202204201546.tAlqEoGg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0adee00b1eb9676cd3c269f898b1fae518d8c9e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/m68k-coldfire-drop-ISA_DMA_API-support/20220419-212846
        git checkout 0adee00b1eb9676cd3c269f898b1fae518d8c9e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/m68k/coldfire/dma.o', needed by 'arch/m68k/coldfire/built-in.a'.
   make[3]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
