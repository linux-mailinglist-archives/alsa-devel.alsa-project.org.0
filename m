Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5753708D
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 12:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F931664;
	Sun, 29 May 2022 12:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F931664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653820958;
	bh=RhzFy5pg/tIuJp3q1yzkgGHs/t6BR0DQa5KiWBHW3Do=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hh3IZUjaYoTtclzB2CgGt4MQVO2QNKWg43r04uYSexFzRb3i65PdTBMhuQp6QGCuz
	 1RQS+bp56GMz8LUdLqGQBHqdgZ9iwvB04J41RBAnYG1WKHyL+FAhkAS1xHPUxRlDu8
	 Eo2xf8GqTijWWCna2lD9O7IbIiLu6n1zPuSrI4L0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94780F8026A;
	Sun, 29 May 2022 12:41:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B66F8024C; Sun, 29 May 2022 12:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E24AF800DE
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 12:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E24AF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mGdT7VOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653820892; x=1685356892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RhzFy5pg/tIuJp3q1yzkgGHs/t6BR0DQa5KiWBHW3Do=;
 b=mGdT7VOnk3JWMh1xy5fq8FoZQzytc427oTWj9yVbzBWmzWhqJ3tXdWoY
 3QFfxYVFkwb2zHJlhyrYo2xNll6vn/YwXg6eE3X3CmpvYEFNfL2H87m+a
 EecwxTd+NdT+w8IT5XkYU1TBu1gCwSl8viR4+6lTI43IMZLa2adIUkOAe
 HuEcSStI+5kAsuLTu/Y56runfvtMhINyqfCbN8buGGqTWmF4udHxXH7nP
 /hJRPH9Z/9UaRT1yFO2w13XBWIUjT4kdvWzu97V+o/vIltXSziJ30aTSo
 thju5RolLHkdZCuNPdrOX0c+vLPBIMIwxrLKjuUutOVsv/Y02sUhXzEhO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="273595002"
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="273595002"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 03:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="903164420"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 29 May 2022 03:41:23 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nvGMM-0000xP-Nk;
 Sun, 29 May 2022 10:41:22 +0000
Date: Sun, 29 May 2022 18:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Message-ID: <202205291859.r117Eo4k-lkp@intel.com>
References: <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on broonie-sound/for-next v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghu-Bankapur/asoc-msm-use-hashtable-to-check-kcontrol/20220529-165246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220529/202205291859.r117Eo4k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/244d3a3d274761ea83000880d73cc9b0a01b2a4a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raghu-Bankapur/asoc-msm-use-hashtable-to-check-kcontrol/20220529-165246
        git checkout 244d3a3d274761ea83000880d73cc9b0a01b2a4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/core/control.c:375:14: warning: no previous prototype for 'snd_ctl_strtoint' [-Wmissing-prototypes]
     375 | unsigned int snd_ctl_strtoint(const char *s)
         |              ^~~~~~~~~~~~~~~~


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
