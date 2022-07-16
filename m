Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5557708A
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Jul 2022 19:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CC118C1;
	Sat, 16 Jul 2022 19:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CC118C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657994085;
	bh=IUHHIx0fQJs/Cdu9JIBdViTJ9P/27B8e3gxL35x3/so=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlh4w3IxUOL4wLDh+Zh/oVeRjCMfOzsj4Y/DSWgoYkvBzJGZwasOSEEWqg4bicbBe
	 EePAMg6t7a5L0EdSAWXen2N42/4igwyllBMrT4SI/yXllemBdDc7lq+zJ+XKEe1TvC
	 jk+8yOT9nUGuIJFVMnlouNSd1DhInaiyJbAE/GAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B9DF800AA;
	Sat, 16 Jul 2022 19:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A395F8023A; Sat, 16 Jul 2022 19:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10011F800F8
 for <alsa-devel@alsa-project.org>; Sat, 16 Jul 2022 19:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10011F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jGCwCRws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657994017; x=1689530017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IUHHIx0fQJs/Cdu9JIBdViTJ9P/27B8e3gxL35x3/so=;
 b=jGCwCRwsS4lqoUNg47gUgSEsmxmWdCFd4nMKI/niCQ//i1nEix9+axUW
 8T82s19lC8Gmi/eKvUQ0gJ4sTR2RQI7HrCOLiRTO6Pr6C6u5ISMYbZCTh
 j/FbZsud0eI3MW+K9zXfQbLcS7VTRbO2U5f4MxzTeCYT1JEwnRSwA/IIr
 TlI3pbpbjwyGs53nEdvL7oF55J6RkgSyl/Nc6LKiWbD7cfgWxvlb6L5yq
 DsVJEzH2Wpf6ZB+B6eWHas5CRztCYRcfC83p5/+8ZvVXOvU4kXJQ1p5Rl
 J1fUwaYo5sIeTEkoVcpub/D6jZj/wyctBfgYJY1o7pbidya5lXZXxE7s4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="265781969"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="265781969"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 10:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="596808733"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 16 Jul 2022 10:53:29 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oClyr-0001v8-4n;
 Sat, 16 Jul 2022 17:53:29 +0000
Date: Sun, 17 Jul 2022 01:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/5] ALSA: pcm: Drop async signal support
Message-ID: <202207170141.kyNwoI54-lkp@intel.com>
References: <20220715102935.4695-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715102935.4695-3-tiwai@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
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

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-Drop-async-signal-support/20220716-211853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220717/202207170141.kyNwoI54-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6705167eb6bf093c8a099fa16c0aeb5f3da0dfba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-Drop-async-signal-support/20220716-211853
        git checkout 6705167eb6bf093c8a099fa16c0aeb5f3da0dfba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/core/pcm_lib.c:1810:26: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
           struct snd_pcm_runtime *runtime;
                                   ^
   1 warning generated.


vim +/runtime +1810 sound/core/pcm_lib.c

e88e8ae639a490 Takashi Iwai     2006-04-28  1780  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1781  /**
47271b1b98c980 Takashi Sakamoto 2021-06-10  1782   * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
47271b1b98c980 Takashi Sakamoto 2021-06-10  1783   *						under acquired lock of PCM substream.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1784   * @substream: the instance of pcm substream.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1785   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1786   * This function is called when the batch of audio data frames as the same size as the period of
47271b1b98c980 Takashi Sakamoto 2021-06-10  1787   * buffer is already processed in audio data transmission.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1788   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1789   * The call of function updates the status of runtime with the latest position of audio data
47271b1b98c980 Takashi Sakamoto 2021-06-10  1790   * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
47271b1b98c980 Takashi Sakamoto 2021-06-10  1791   * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
47271b1b98c980 Takashi Sakamoto 2021-06-10  1792   * substream according to configured threshold.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1793   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1794   * The function is intended to use for the case that PCM driver operates audio data frames under
47271b1b98c980 Takashi Sakamoto 2021-06-10  1795   * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
47271b1b98c980 Takashi Sakamoto 2021-06-10  1796   * context. In any interrupt context, it's preferrable to use ``snd_pcm_period_elapsed()`` instead
47271b1b98c980 Takashi Sakamoto 2021-06-10  1797   * since lock of PCM substream should be acquired in advance.
^1da177e4c3f41 Linus Torvalds   2005-04-16  1798   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1799   * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
47271b1b98c980 Takashi Sakamoto 2021-06-10  1800   * function:
^1da177e4c3f41 Linus Torvalds   2005-04-16  1801   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1802   * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1803   * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1804   * - .get_time_info - to retrieve audio time stamp if needed.
47271b1b98c980 Takashi Sakamoto 2021-06-10  1805   *
47271b1b98c980 Takashi Sakamoto 2021-06-10  1806   * Even if more than one periods have elapsed since the last call, you have to call this only once.
^1da177e4c3f41 Linus Torvalds   2005-04-16  1807   */
47271b1b98c980 Takashi Sakamoto 2021-06-10  1808  void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1809  {
877211f5e1b119 Takashi Iwai     2005-11-17 @1810  	struct snd_pcm_runtime *runtime;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1811  
f5cdc9d4003a2f paulhsia         2019-11-13  1812  	if (PCM_RUNTIME_CHECK(substream))
47271b1b98c980 Takashi Sakamoto 2021-06-10  1813  		return;
f5cdc9d4003a2f paulhsia         2019-11-13  1814  	runtime = substream->runtime;
f5cdc9d4003a2f paulhsia         2019-11-13  1815  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1816  	if (!snd_pcm_running(substream) ||
f240406babfe15 Jaroslav Kysela  2010-01-05  1817  	    snd_pcm_update_hw_ptr0(substream, 1) < 0)
6705167eb6bf09 Takashi Iwai     2022-07-15  1818  		return;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1819  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
