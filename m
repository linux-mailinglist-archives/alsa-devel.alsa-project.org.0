Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84F2052C4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A88BB17E3;
	Tue, 23 Jun 2020 14:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A88BB17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916303;
	bh=sVF7omBE+a7L6cLwVANCu5E39VRrl3RhQqbS1fzWVgs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NOR0pq6KCsNTu3AKa0W7xgreG7i0umhoQElZYjeEC8Qs48wM1WCLrusH0Swrq25eO
	 zQdcOLPQTauDfc+nMG9z3EtsIB7fkpL8AdFAszF8oGpk7qnJwSPXnJFmFg7rr/NRBE
	 dAHC+meqJrX0F5AKyIpRJHE/pWcVgwDOhhAzSUbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE5DF8023E;
	Tue, 23 Jun 2020 14:43:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41384F8023E; Tue, 23 Jun 2020 14:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 298B3F80218
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 298B3F80218
IronPort-SDR: qZoKD6IWmArwiQlekUlpuzdSi3TIr2uzf88aOq9ot0MDaQxJyTQMqFsFgEjprNZw9Lr+S7+kQ4
 M7CJ1IVZoGkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143118579"
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
 d="gz'50?scan'50,208,50";a="143118579"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 05:43:09 -0700
IronPort-SDR: 31JhMGGFcSEjcjRqZ+TeMQ48gLTgKHKH0Co3UJgL2FKD+aWTy/3l8EfsGzcaGADvSScc/bBWGL
 hIszUE3hD39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
 d="gz'50?scan'50,208,50";a="310448894"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 23 Jun 2020 05:43:06 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jniGX-0000LP-VN; Tue, 23 Jun 2020 12:43:05 +0000
Date: Tue, 23 Jun 2020 20:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, khilman@kernel.org,
 ulf.hansson@linaro.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net
Subject: Re: [RESEND PATCH v2 1/2] PM / domains: Introduce multi PM domains
 helpers
Message-ID: <202006232026.yo2sVQbc%lkp@intel.com>
References: <20200623113301.631-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200623113301.631-2-daniel.baluta@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on pm/linux-next]
[also build test ERROR on shawnguo/for-next linux/master linus/master v5.8-rc2 next-20200623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Baluta/Introduce-multi-PM-domains-helpers/20200623-193706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: mips-omega2p_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mipsel-linux-ld: drivers/base/power/clock_ops.o: in function `dev_multi_pm_attach':
>> clock_ops.c:(.text+0x16c): multiple definition of `dev_multi_pm_attach'; drivers/base/platform.o:platform.c:(.text+0x3ec): first defined here
   mipsel-linux-ld: drivers/base/power/clock_ops.o: in function `dev_multi_pm_detach':
>> clock_ops.c:(.text+0x174): multiple definition of `dev_multi_pm_detach'; drivers/base/platform.o:platform.c:(.text+0x3f4): first defined here
   mipsel-linux-ld: drivers/mmc/core/sdio_bus.o: in function `dev_multi_pm_attach':
   sdio_bus.c:(.text+0x388): multiple definition of `dev_multi_pm_attach'; drivers/base/platform.o:platform.c:(.text+0x3ec): first defined here
   mipsel-linux-ld: drivers/mmc/core/sdio_bus.o: in function `dev_multi_pm_detach':
   sdio_bus.c:(.text+0x390): multiple definition of `dev_multi_pm_detach'; drivers/base/platform.o:platform.c:(.text+0x3f4): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--jRHKVT23PllUwdXP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
q/Qs806qAAA=

--jRHKVT23PllUwdXP--
