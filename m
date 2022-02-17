Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1B4BAA2E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 20:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB70618CA;
	Thu, 17 Feb 2022 20:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB70618CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645127400;
	bh=46Ao89wMcgm6jN7Eq+CdMeAAf93pn4JVEULNHnEFEMY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSVRG5MYQgefeRDfKPSO2Tjq3KiA7adenEOlTEmclcaPik5ztJbBRGJ3FxCXekyl5
	 BQrlbpn/pnM1T3PKUovcI85qMEN3rATmkzfF0rOLhn/WyBOKFoQK8V4Xro8EoTSI8W
	 sfHtzuUYywFDh0gAAQ3+3FTboW5lhOwXqUxlapz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 496A5F804CB;
	Thu, 17 Feb 2022 20:48:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 302FAF804A9; Thu, 17 Feb 2022 20:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFDC8F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 20:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFDC8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RNfvLN9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645127298; x=1676663298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=46Ao89wMcgm6jN7Eq+CdMeAAf93pn4JVEULNHnEFEMY=;
 b=RNfvLN9HHOmMFNJd8zoe75azhYolL5YDMrdv3HrlnIx4y5ue2/7AbOzg
 IZwLNMYemYZSQmZNn2NXQd+LzqRv2oWUNDDXdtkXmMAMi3X00i8NcC+mR
 sn0iB9owU7JB8soJ1OJm+aCmwmeAlfA/C+yfX5buHhaBD2sCHjJJ4/ee6
 ZAeIrY/VBe3ObWIw11WFwrNb10unlIUE7n/rFtCJecTkTCPj0oOSx2hIp
 jT0rlnksMFnTIJdSd2GSV0eGMpBBgJxKMMf9ml6DO3jPscPbpcbDAqPmr
 5wuJgw1NsMFWpe1oC+WME//8ko+rzYs3eoZkiMraZMqoNBxQ4ZEwBG8xx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250701290"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="250701290"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="774877289"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 11:48:07 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKmkz-0000Xa-E7; Thu, 17 Feb 2022 19:48:01 +0000
Date: Fri, 18 Feb 2022 03:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
Subject: Re: [PATCH] ASoC: codecs: Add power domains support in digital macro
 codecs
Message-ID: <202202180153.WSEbQejW-lkp@intel.com>
References: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Hi Srinivasa,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20220217]
[cannot apply to v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/ASoC-codecs-Add-power-domains-support-in-digital-macro-codecs/20220217-224032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r045-20220217 (https://download.01.org/0day-ci/archive/20220218/202202180153.WSEbQejW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/ASoC-codecs-Add-power-domains-support-in-digital-macro-codecs/20220217-224032
        git checkout a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: lpass_macro_pds_init
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
   >>> referenced by lpass-tx-macro.c
   >>> soc/codecs/lpass-tx-macro.o:(tx_macro_probe) in archive sound/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: lpass_macro_pds_exit
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_remove) in archive sound/built-in.a
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_remove) in archive sound/built-in.a
   >>> referenced by lpass-tx-macro.c
   >>> soc/codecs/lpass-tx-macro.o:(tx_macro_remove) in archive sound/built-in.a
   >>> referenced 1 more times

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
