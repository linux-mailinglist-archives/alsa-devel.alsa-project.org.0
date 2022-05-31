Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB60538AB5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 06:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC9C1FD0;
	Tue, 31 May 2022 06:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC9C1FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653972492;
	bh=Qn+cuAzxBVUymorN0NpF3cWBtZUAaq3foyRv2NhaqB8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWpIQHf54Lw70IudSAlSQh0rhDMlEQ4oBE2h4UjPoxz4JO+tEG5cqlsgOynf0Ibgx
	 T7v1/8+oABLNi7O87HJrZYMnZFkxXFITFrHJUFMO5xTyJ4cvBryUQurZHzNRbk6GZt
	 7hfPSHa7pxqHRi9eLp4M6sTkbawRXAD4Z+Hf6qrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53882F8019B;
	Tue, 31 May 2022 06:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D4BF80161; Tue, 31 May 2022 06:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F429F800DE
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 06:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F429F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EdW0jmp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653972425; x=1685508425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qn+cuAzxBVUymorN0NpF3cWBtZUAaq3foyRv2NhaqB8=;
 b=EdW0jmp3dyJndhSES5KIHAv7NUt3ztTqSUVI64JjeR5Z0qPrx9CKxA84
 PY/IzYW3Q1Ym1hV+Hk7db8AQJDQ5ZVOZGHJ4HYa+3Gi8Mi6nmoZsXk67Y
 G6IidHZ6MM12fyg2LR2CTcVtRO+8J8CTFE+O4cz+FANfcZwLkPJT6Kv4q
 H/52NHdtvXY2aNFcnBpGhl++LH+uc66od6xk4u1jcTJG+MjHkP9VIfmjn
 utWrLCgK6qRiHWoX5wZWC7BszjKgVvQOtPYN7udGOAvChKpHb8NyB1Tr/
 uL2j2SgShqdU4VCf/EeREgJMghgJ11T+b6sY/ucy9HJ67L1Q2/4SWYRwv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="338177441"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="338177441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 21:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="679399930"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 30 May 2022 21:46:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nvtmR-0002Kc-H9;
 Tue, 31 May 2022 04:46:55 +0000
Date: Tue, 31 May 2022 12:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Message-ID: <202205311233.abvVh5rg-lkp@intel.com>
References: <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Krishna Jha <quic_kkishorj@quicinc.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on broonie-sound/for-next v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghu-Bankapur/asoc-msm-use-hashtable-to-check-kcontrol/20220529-165246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arm64-randconfig-r036-20220531 (https://download.01.org/0day-ci/archive/20220531/202205311233.abvVh5rg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/244d3a3d274761ea83000880d73cc9b0a01b2a4a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raghu-Bankapur/asoc-msm-use-hashtable-to-check-kcontrol/20220529-165246
        git checkout 244d3a3d274761ea83000880d73cc9b0a01b2a4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/mediatek/ sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/core/control.c:375:14: warning: no previous prototype for function 'snd_ctl_strtoint' [-Wmissing-prototypes]
   unsigned int snd_ctl_strtoint(const char *s)
                ^
   sound/core/control.c:375:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int snd_ctl_strtoint(const char *s)
   ^
   static 
   1 warning generated.


vim +/snd_ctl_strtoint +375 sound/core/control.c

   373	
   374	/* Used to convert the string into int value -- BKDRHash */
 > 375	unsigned int snd_ctl_strtoint(const char *s)
   376	{
   377		unsigned int res = 0;
   378	
   379		while (*s)
   380			res = (res << 5) - res + (*s++);
   381	
   382		return (res & 0x7FFFFFFF);
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
