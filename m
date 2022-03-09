Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75254D3CC9
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6BD16C6;
	Wed,  9 Mar 2022 23:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6BD16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646864397;
	bh=zehQ3kdJ3E/dxPKf/DnEfn6NdkY1zXH6CPpFNHXdb6k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAtOlK5eOiDZY2wbjYQcZx6OHDEqBPLP79p2oAutNz0m12LJiwB+8EGw85tyk0ZfT
	 GwpPEJbys2bNekzGkID2WkVh0z4ePX8zAYMs6R781fITiv5Qzgq+tcaZrlQYTuCq8w
	 SorQJCc/6ROSnIu63k+NRfUgbbIqu87rphvTvACY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A18AF80236;
	Wed,  9 Mar 2022 23:18:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C673F80155; Wed,  9 Mar 2022 23:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A452F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A452F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CGPkBHVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646864324; x=1678400324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zehQ3kdJ3E/dxPKf/DnEfn6NdkY1zXH6CPpFNHXdb6k=;
 b=CGPkBHVkl9f1WM/tLfNh3Y/nb+w6NrMhkYT7MQguHVuqqCI2/4d5B/kU
 dD4OXDItN3FNrHCOh4Rt2W1qp4nQKJDWFjLuZmW5jKP28tXB3NocvhDM3
 XlISdNM2W63rSiasweSiAD35uQEgiRANqCLkxZkOz7XSUYodQh43fEvaQ
 /PWezirX0ng0BRPBdPkD2cDfwZqQutNd9L9GW3mPtWCB2cOPB9glBllAN
 Hq0T1S7qL57teyCyFx8V0d69Hl/EuiD35mOA10qn2KM1tmurBbHPIjMuR
 KQCkmCjY1e3SFbgz+kZPW9Og7JcSBPpSCjpl4XLfVb6IHV/cCD27cOmTJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318328651"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="318328651"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="712116256"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 14:18:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nS4df-0003tG-CU; Wed, 09 Mar 2022 22:18:35 +0000
Date: Thu, 10 Mar 2022 06:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V0 1/1] ASoC: msm: fix integer overflow for long duration
 offload playback
Message-ID: <202203100601.sczPjPL5-lkp@intel.com>
References: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, Krishna Jha <quic_kkishorj@quicinc.com>
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

Hi Raghu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next broonie-sound/for-next v5.17-rc7 next-20220309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Raghu-Bankapur/ASoC-msm-fix-integer-overflow-for-long-duration-compress-offload-playback/20220309-222520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220310/202203100601.sczPjPL5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/9020c5c2e38ba210a8d822d20e32bed85a4ffcab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Raghu-Bankapur/ASoC-msm-fix-integer-overflow-for-long-duration-compress-offload-playback/20220309-222520
        git checkout 9020c5c2e38ba210a8d822d20e32bed85a4ffcab
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/printk.h:555,
from include/linux/kernel.h:29,
from arch/x86/include/asm/percpu.h:27,
from arch/x86/include/asm/current.h:6,
from include/linux/sched.h:12,
from include/linux/delay.h:23,
from sound/soc/intel/atom/sst/sst_drv_interface.c:13:
sound/soc/intel/atom/sst/sst_drv_interface.c: In function 'sst_cdev_tstamp':
>> sound/soc/intel/atom/sst/sst_drv_interface.c:369:15: warning: format '%d' expects argument of type 'int', but argument 5 has type '__u64' {aka 'long long unsigned int'} [-Wformat=]
369 |  dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %dn",
|               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:134:15: note: in definition of macro '__dynamic_func_call'
134 |   func(&id, ##__VA_ARGS__);           |               ^~~~~~~~~~~
include/linux/dynamic_debug.h:166:2: note: in expansion of macro '_dynamic_func_call'
166 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,            |  ^~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:155:2: note: in expansion of macro 'dynamic_dev_dbg'
155 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
|  ^~~~~~~~~~~~~~~
include/linux/dev_printk.h:155:23: note: in expansion of macro 'dev_fmt'
155 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
|                       ^~~~~~~
sound/soc/intel/atom/sst/sst_drv_interface.c:369:2: note: in expansion of macro 'dev_dbg'
369 |  dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %dn",
|  ^~~~~~~
sound/soc/intel/atom/sst/sst_drv_interface.c:369:55: note: format string is defined here
369 |  dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %dn",
|                                                      ~^
|                                                       |
|                                                       int
|                                                      %lld
--
>> ERROR: modpost: "__umoddi3" [sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
