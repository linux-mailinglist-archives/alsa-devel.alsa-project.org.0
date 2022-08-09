Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BDA58D558
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08DA100;
	Tue,  9 Aug 2022 10:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08DA100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660033676;
	bh=ITEsOba8k7DFgGz1qirua169vBalTSUHIog7mLDnQ3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OikCl3+R3DAaYYL/FVUle17A0cYb1PefksypthUoxPQN0J10U1c1Bnn7X/wuV8E3A
	 IO3XVT2aJZnEtDaEdDfbotMUfeCHaacUQ8ycH6459cb3zIohQt86xvW3Gm5huiF7Fy
	 oX3mBNBcZuSiN4aDbzeIaXo7AL30RMfl81CVyLzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 670D4F801F7;
	Tue,  9 Aug 2022 10:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F0E1F8016C; Tue,  9 Aug 2022 10:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D84DF8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D84DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ns0jlraI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660033609; x=1691569609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ITEsOba8k7DFgGz1qirua169vBalTSUHIog7mLDnQ3I=;
 b=Ns0jlraIASbvdKpXI4LYqnsaqNAftY1TjQI5udsT6QRhj33/iXfnCyAI
 RjOs5sSudi5omI4Xg1iwN76xvzMDAVf9+9x8QRSqEK8Ttn0nx7irjBoMW
 Zrr6LkEte/bLwGe/Yr2ScfO1rgYJJ271XwPeyMu/LhAVVffJ/PrlwiqZo
 BQBhAteQ8wZahfM0F38oc+hL1rZoOsDcYhY5l3eK/lgBR76xQpuVUEu+M
 k8D/gDWqwvwzedK/aP1SF5NDLC4rewd2g/TFXDMYqiElhTvWRMeIs7Gi1
 0kJhMJml2Y2PZNX0VIvwPQShBJFgLMRVORwDkcPgYFDkK1/9B/bd1GcMH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="277719270"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="277719270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="637633147"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 01:26:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oLKZY-000Mr7-09;
 Tue, 09 Aug 2022 08:26:44 +0000
Date: Tue, 9 Aug 2022 16:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Flax <flatmax@flatmax.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <202208091637.XWbySJt5-lkp@intel.com>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808214028.2502801-1-flatmax@flatmax.com>
Cc: broonie@kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Matt Flax <flatmax@flatmax.com>
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

Hi Matt,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next linus/master v5.19 next-20220809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091637.XWbySJt5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7a9219a8431d7740c0958e53078820cbfef4f3f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
        git checkout 7a9219a8431d7740c0958e53078820cbfef4f3f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: src4xxx_remove
   >>> referenced by src4xxx-i2c.c:25 (sound/soc/codecs/src4xxx-i2c.c:25)
   >>>               soc/codecs/src4xxx-i2c.o:(src4xxx_i2c_remove) in archive sound/built-in.a
   >>> referenced by src4xxx-i2c.c:25 (sound/soc/codecs/src4xxx-i2c.c:25)
   >>>               soc/codecs/src4xxx-i2c.o:(src4xxx_i2c_remove) in archive sound/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
