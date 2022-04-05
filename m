Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3E4F369F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 16:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D65188A;
	Tue,  5 Apr 2022 16:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D65188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649167650;
	bh=N0NFTkpFQl/qecbw6wmL6YP13wN2X3pakdXix1QzrOI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDnEEUEQEWFgyU33J0q/l4m5CLcHYqvAfrqmfS5t2uZovfVdyOWe2OZL06p6C0t24
	 F9v7kRbqC9bU60BNZzhhl1iq5jVvpUCp+qgyvNQjh6T64q+ePStE16VAoV3/wsZ2np
	 GrZTO1tbkGHfJO0Dd9Zm31QwQhpr0dgG5zlbL0eA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 370F5F804AA;
	Tue,  5 Apr 2022 16:06:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32FDCF804AA; Tue,  5 Apr 2022 16:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E87F80482
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 16:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E87F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HmfGEBjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649167591; x=1680703591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N0NFTkpFQl/qecbw6wmL6YP13wN2X3pakdXix1QzrOI=;
 b=HmfGEBjCNb3lYVDQy1fZrUlXNX27zyD9xfs074oXfAFLzWENvwAiWkCA
 JWJLbjexOm2NzS8Fw5L9TVgG5f56yymkPQxSeEv2bNFlvAANeGFXKtRu0
 8M23mev1LZRijSCkveOpna0VzmsLpldkdn54doa7l0s1gIlY5geP56+c/
 b7wXFAOemnGhCcjU0lMN4mHCHlmXx//K7eoG1BC01Qa2env1QO0biwq68
 xya5cO7UPbk96RLjIzv29au7JX0Xz9JLFoAI53Jz+c/dAdK8tH6mTlFdT
 0aRVNcVYKYfE2a8ULvSMOOx5we5MBr10pDe6jsN66iHh30ckkfXd2IGpn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="248271335"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="248271335"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="549067236"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 05 Apr 2022 07:06:06 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbjos-0003Mh-45;
 Tue, 05 Apr 2022 14:06:06 +0000
Date: Tue, 5 Apr 2022 22:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 12/20] ASoC: fsl_micfil: add multi fifo support
Message-ID: <202204052143.2nZlY7hL-lkp@intel.com>
References: <20220405075959.2744803-13-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405075959.2744803-13-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

Hi Sascha,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next vkoul-dmaengine/next linus/master v5.18-rc1 next-20220405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220405-161030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: alpha-randconfig-r023-20220405 (https://download.01.org/0day-ci/archive/20220405/202204052143.2nZlY7hL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/05755df1cf507c46e44c4742bed6090e546b2905
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220405-161030
        git checkout 05755df1cf507c46e44c4742bed6090e546b2905
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash sound/soc/fsl/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_micfil.c:19:10: fatal error: linux/platform_data/dma-imx.h: No such file or directory
      19 | #include <linux/platform_data/dma-imx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +19 sound/soc/fsl/fsl_micfil.c

     3	
     4	#include <linux/bitfield.h>
     5	#include <linux/clk.h>
     6	#include <linux/device.h>
     7	#include <linux/interrupt.h>
     8	#include <linux/kobject.h>
     9	#include <linux/kernel.h>
    10	#include <linux/module.h>
    11	#include <linux/of.h>
    12	#include <linux/of_address.h>
    13	#include <linux/of_irq.h>
    14	#include <linux/of_platform.h>
    15	#include <linux/pm_runtime.h>
    16	#include <linux/regmap.h>
    17	#include <linux/sysfs.h>
    18	#include <linux/types.h>
  > 19	#include <linux/platform_data/dma-imx.h>
    20	#include <sound/dmaengine_pcm.h>
    21	#include <sound/pcm.h>
    22	#include <sound/soc.h>
    23	#include <sound/tlv.h>
    24	#include <sound/core.h>
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
