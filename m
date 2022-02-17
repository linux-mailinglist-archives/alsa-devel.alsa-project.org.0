Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C74BAABA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 21:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AFB18D3;
	Thu, 17 Feb 2022 21:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AFB18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645129225;
	bh=yh8fUoXh79fS9tMsEOb8wgZoSRTMtMmtTdQN/QJbHJA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nsOz6nWIbrYqz3zGMSPOfOl8m0MGc/0YdwCjKgRtTfDzjauhgbTiN21UGu5KkoiK9
	 l7yocjlo/QZc1ilmfTRKH4K12xUvd8iNDC6yDSlvETcm5SDjHBF1JNdo5D3KioORn5
	 suQ000I8xFMx4T40k9qH7BANpXpKqpByp1/tLmBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC77F800C0;
	Thu, 17 Feb 2022 21:19:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D44F80240; Thu, 17 Feb 2022 21:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A6FF800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 21:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A6FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AV/WO/D6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645129152; x=1676665152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yh8fUoXh79fS9tMsEOb8wgZoSRTMtMmtTdQN/QJbHJA=;
 b=AV/WO/D6Z2OmicTRJ06vnTepddDoyp092RxRwc4isCTO/Ki2oE6TCT4e
 C0/NmEIlo0aFTJP6Uwgw1IPpxkHCMWsDE+Ar4aYzvA5neII8/vl2ZDUxo
 oefxPwfJYqzICbBjn693ACZa10S5gSLiixKnM3LIyDAy4X7bTKp+3iZhh
 Rjs6CRZwz0cLKPrR7XGzZ+lJBkl92lkCjJxMGaXaQpTFej7L9AIMmvEuI
 Qj7qObsGZABDkMYqF86aSAbNaagbYNUiZVvM5kslAHV2q62hcRHkwDqnS
 vj37z8Jjrp8pveKSmMqGrytQ1lO3q6lr0San101KziSKR8/dhpQg+cRSp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231593785"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="231593785"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="589718320"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2022 12:19:03 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKnF0-0000bi-KF; Thu, 17 Feb 2022 20:19:02 +0000
Date: Fri, 18 Feb 2022 04:18:43 +0800
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
Message-ID: <202202180450.f9HRZqEk-lkp@intel.com>
References: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>, kbuild-all@lists.01.org,
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
config: nios2-randconfig-r014-20220217 (https://download.01.org/0day-ci/archive/20220218/202202180450.f9HRZqEk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/ASoC-codecs-Add-power-domains-support-in-digital-macro-codecs/20220217-224032
        git checkout a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/soc/codecs/lpass-va-macro.o: in function `va_macro_probe':
>> lpass-va-macro.c:(.text+0x918): undefined reference to `lpass_macro_pds_init'
   lpass-va-macro.c:(.text+0x918): relocation truncated to fit: R_NIOS2_CALL26 against `lpass_macro_pds_init'
   nios2-linux-ld: sound/soc/codecs/lpass-va-macro.o: in function `va_macro_remove':
>> lpass-va-macro.c:(.text+0xec0): undefined reference to `lpass_macro_pds_exit'
   lpass-va-macro.c:(.text+0xec0): relocation truncated to fit: R_NIOS2_CALL26 against `lpass_macro_pds_exit'
   nios2-linux-ld: sound/soc/codecs/lpass-rx-macro.o: in function `rx_macro_probe':
>> lpass-rx-macro.c:(.text+0x1cb8): undefined reference to `lpass_macro_pds_init'
   lpass-rx-macro.c:(.text+0x1cb8): relocation truncated to fit: R_NIOS2_CALL26 against `lpass_macro_pds_init'
   nios2-linux-ld: sound/soc/codecs/lpass-rx-macro.o: in function `rx_macro_remove':
>> lpass-rx-macro.c:(.text+0x2188): undefined reference to `lpass_macro_pds_exit'
   lpass-rx-macro.c:(.text+0x2188): relocation truncated to fit: R_NIOS2_CALL26 against `lpass_macro_pds_exit'
   nios2-linux-ld: net/core/sock.o: in function `sk_destruct':
   sock.c:(.text+0x23bc): undefined reference to `__sk_defer_free_flush'
   sock.c:(.text+0x23bc): relocation truncated to fit: R_NIOS2_CALL26 against `__sk_defer_free_flush'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
