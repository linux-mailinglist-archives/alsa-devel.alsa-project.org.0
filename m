Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E5520015
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1603E18E8;
	Mon,  9 May 2022 16:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1603E18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652107416;
	bh=2TpZ/XLdOFZz8gZ8nOpxXQnvZxiJntb5FNvyHWiFLOk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sc+FsHWVVGdPH7u7Hffi+WCCMH5B4RR3NWqZZL/0YX98WKQHv/VLDzPUwRGkF9tdm
	 vHYU63LIbj7jMHmnOV49reuDh8YNvYEwBFgaUX6mZgCrUBMganw9aGEZamu0Kmqf1t
	 /CQ7wLCMj/JCYfUQ5hbmJ8VrrX48IjkcM+/Obsu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A1FF80237;
	Mon,  9 May 2022 16:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BCECF8011C; Mon,  9 May 2022 16:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F47FF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F47FF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Okh6ZmhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652107350; x=1683643350;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2TpZ/XLdOFZz8gZ8nOpxXQnvZxiJntb5FNvyHWiFLOk=;
 b=Okh6ZmhLl9WiNE8fVRZEc6dDJHit/C6o54rwPyZ4wFV5fGDHnE/wz/dG
 0jvaheMd2xRNx/hGC3D2z/P5QmVgObGxyHY877g7t5YDA3Kh92UTUG17T
 d8xINGU9ppwwluv74i0HEyjZ4KpkmV3eZSCQVVvIYOPOobI7EHQRrKAjE
 pxIStag2RbzKpRXuShXQD+QFiHrbdo6Mc3nsQr26Y8MGScqvwm+ZazUtM
 EKxK1286WMZUf3aGUiUKwU7C5JuRGvHgDXRS8FAm8PV99aTu1Q+/gu5w3
 6b6QdE8C0mpzwtRRklh8CyZqFzyJvEH/wmj2n/YZgLBIi3/kOARowfnix Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332104445"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="332104445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="601994065"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 09 May 2022 07:42:22 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no4ab-000GaN-Bd;
 Mon, 09 May 2022 14:42:21 +0000
Date: Mon, 9 May 2022 22:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [PATCH v2 09/15] ASoC: Intel: avs: Event tracing
Message-ID: <202205092213.XXm7bdgE-lkp@intel.com>
References: <20220509085821.3852259-10-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509085821.3852259-10-cezary.rojewski@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, kbuild-all@lists.01.org,
 cujomalainey@chromium.org, lma@semihalf.com
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

Hi Cezary,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20220509]
[cannot apply to tiwai-sound/for-next v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220509/202205092213.XXm7bdgE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/22736f1a80f21a1729c0b0169ab6b7d724fab1d7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
        git checkout 22736f1a80f21a1729c0b0169ab6b7d724fab1d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/trace.c:19:6: error: redefinition of 'trace_avs_msg_payload'
      19 | void trace_avs_msg_payload(const void *data, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/avs/trace.c:12:
   sound/soc/intel/avs/trace.h:41:20: note: previous definition of 'trace_avs_msg_payload' with type 'void(const void *, size_t)' {aka 'void(const void *, long unsigned int)'}
      41 | static inline void trace_avs_msg_payload(const void *data, size_t size) {};
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/trace_avs_msg_payload +19 sound/soc/intel/avs/trace.c

    13	
    14	#define BYTES_PER_LINE 16
    15	#define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */	\
    16				/ (2 * BYTES_PER_LINE + 4) /* chars per line */	\
    17				* BYTES_PER_LINE)
    18	
  > 19	void trace_avs_msg_payload(const void *data, size_t size)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
