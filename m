Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8C33797E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:35:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65956186E;
	Thu, 11 Mar 2021 17:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65956186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615480503;
	bh=IvTfkRgYMfnVh17mF8r4X0I5S44pX1+US2EcsylpwWU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3OVVav+Ctp5BFOrMnq4Ka4SoV+RgfXvHhZcjIo/hS7w46CC3Kda8ay6HYhFeezV8
	 I1M/5R5DW3X0dhsXuSCa+xNgP9fvyKqClNpusXmyYuHnz0v1+JlKSPnVaZ7BpKiqDq
	 cZzr1sSViOC1+7jhERtdftERZlGdJe3XX3MtOys8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1646F8010D;
	Thu, 11 Mar 2021 17:33:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EDE6F80227; Thu, 11 Mar 2021 17:33:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2238F8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2238F8015B
IronPort-SDR: A6Cja2ArG+n4liY5UWW4dLiEqbn9Wq45cjm7HPmo0bruQ7m4znIwLZzM8H3RvrTjBJkTTglNGg
 LcUj6o1UZbXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="168612792"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
 d="gz'50?scan'50,208,50";a="168612792"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 08:33:12 -0800
IronPort-SDR: Uq4TiUSJ3+zQhfDLH+AhimQ7d7ZeMPF6qibWhMBGgH+2T45MdIDLQ9xFG/6LIF0MqcA8B2InV/
 6vWagWHafU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
 d="gz'50?scan'50,208,50";a="372377340"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2021 08:32:59 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lKOF6-0000r6-QZ; Thu, 11 Mar 2021 16:32:56 +0000
Date: Fri, 12 Mar 2021 00:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH v2 4/5] reset: Add reset_control_bulk API
Message-ID: <202103120011.594e28Pm-lkp@intel.com>
References: <20210311151554.23982-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20210311151554.23982-5-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on asoc/for-next linus/master v5.12-rc2 next-20210311]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
base:   https://git.pengutronix.de/git/pza/linux reset/next
config: m68k-defconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/082cad3274c4566ac97502fd137479791c318300
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
        git checkout 082cad3274c4566ac97502fd137479791c318300
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/mdio_bus.c:30:
   include/linux/reset.h: In function 'reset_control_bulk_get_exclusive':
>> include/linux/reset.h:215:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     215 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'reset_control_bulk_get_exclusive_released':
   include/linux/reset.h:257:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     257 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive_released':
   include/linux/reset.h:278:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     278 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'reset_control_bulk_get_shared':
   include/linux/reset.h:323:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     323 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive':
   include/linux/reset.h:360:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     360 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'reset_control_bulk_get_optional_shared':
   include/linux/reset.h:397:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     397 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive':
   include/linux/reset.h:522:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     522 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive_released':
   include/linux/reset.h:561:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     561 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive_released':
   include/linux/reset.h:600:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     600 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_shared':
   include/linux/reset.h:635:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     635 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive':
   include/linux/reset.h:673:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     673 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_shared':
   include/linux/reset.h:711:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     711 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +215 include/linux/reset.h

   200	
   201	/**
   202	 * reset_control_bulk_get_exclusive - Lookup and obtain exclusive references to
   203	 *                                    multiple reset controllers.
   204	 * @dev: device to be reset by the controller
   205	 * @num_rstcs: number of entries in rstcs array
   206	 * @rstcs: array of struct reset_control_bulk_data with reset line names set
   207	 *
   208	 * Fills the rstcs array with pointers to exclusive reset controls and
   209	 * returns 0, or an IS_ERR() condition containing errno.
   210	 */
   211	static inline int __must_check
   212	reset_control_bulk_get_exclusive(struct device *dev, int num_rstcs,
   213					 struct reset_control_bulk_data *rstcs)
   214	{
 > 215		return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
   216	}
   217	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--fdj2RfSjLxBAspz7
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--fdj2RfSjLxBAspz7--
