Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E947A957E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 17:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDF19AE9;
	Thu, 21 Sep 2023 17:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDF19AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695309713;
	bh=D9xmndz/DF88UfQ9FdMjWtilEZpwHcrgLjrmh6eSaDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5DjZITAZSrOzKqDq/4/amvZ/Go55LaoFiAhKNkQuLJPz39TPPPdFwy8aATuj21oa
	 KGCs8Osv4F1OMvLLnWfC1lKWJeBD9AqgMDqZRqfDEv/3e/CvUjZplSGm5FQAR4O3Uk
	 iGBfXgEUMHwJ931AUucV56f1vLuGDAogd7yXRCYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E23AF8047D; Thu, 21 Sep 2023 17:21:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A82BBF801F5;
	Thu, 21 Sep 2023 17:21:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06734F8025A; Thu, 21 Sep 2023 17:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E524AF800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 17:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E524AF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LNfBj3r7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695309653; x=1726845653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9xmndz/DF88UfQ9FdMjWtilEZpwHcrgLjrmh6eSaDs=;
  b=LNfBj3r74TIPkcYwbFtigpGExBShC7CFP5hU8+o9bz8ZGXHFZEAOOZKu
   g+yRlDN211mD+Zj+c7AyRLOG5j8gody8Qwel24QUaMTfQCDJGl4q+HTjk
   cUzl55MESk/DH7Fq5JRDy2J6BTgJ35CGOrjP84BgMLfxeO6zL6MrLkY5p
   arkGB/hGXJr9NY0ra+MzWVZ8o21CoSosmPUSQPiq1obboo/NWFMBQIOUs
   QRfNQA1UR42WiTYM5tPFJnluHp6DufACu2hzp1Fl78sK7ye95Sfg5sB4Y
   2YSFJs1/f0bC/ixKQcoGF65TEHSdmONrGU1JKwx9I94/oKn1icnlSml3t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447039977"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200";
   d="scan'208";a="447039977"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782222369"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200";
   d="scan'208";a="782222369"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Sep 2023 08:20:46 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjLTf-00005R-1n;
	Thu, 21 Sep 2023 15:20:33 +0000
Date: Thu, 21 Sep 2023 23:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, perex@perex.cz, tiwai@suse.com,
	Liam.Howlett@oracle.com, rppt@kernel.org,
	mgorman@techsingularity.net, mhocko@suse.com, surenb@google.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER
Message-ID: <202309212328.2UOE4Raf-lkp@intel.com>
References: <20230921064258.3582115-1-make_ruc2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921064258.3582115-1-make_ruc2021@163.com>
Message-ID-Hash: 4JWZUP2FQW2PP5KPB5GPQXS7XRL6RS63
X-Message-ID-Hash: 4JWZUP2FQW2PP5KPB5GPQXS7XRL6RS63
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JWZUP2FQW2PP5KPB5GPQXS7XRL6RS63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/ALSA-pcm-oss-Fix-race-at-SNDCTL_DSP_SETTRIGGER/20230921-215828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230921064258.3582115-1-make_ruc2021%40163.com
patch subject: [PATCH v2] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309212328.2UOE4Raf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212328.2UOE4Raf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212328.2UOE4Raf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/oss/pcm_oss.c: In function 'snd_pcm_oss_set_trigger':
>> sound/core/oss/pcm_oss.c:2092:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2092 |                 if (err < 0)
         |                 ^~
   sound/core/oss/pcm_oss.c:2094:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2094 |                         return err;
         |                         ^~~~~~
   sound/core/oss/pcm_oss.c:2126:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2126 |                 if (err < 0)
         |                 ^~
   sound/core/oss/pcm_oss.c:2128:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2128 |                         return err;
         |                         ^~~~~~


vim +/if +2092 sound/core/oss/pcm_oss.c

  2072	
  2073	static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int trigger)
  2074	{
  2075		struct snd_pcm_runtime *runtime;
  2076		struct snd_pcm_substream *psubstream = NULL, *csubstream = NULL;
  2077		int err, cmd;
  2078	
  2079	#ifdef OSS_DEBUG
  2080		pr_debug("pcm_oss: trigger = 0x%x\n", trigger);
  2081	#endif
  2082		
  2083		psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
  2084		csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
  2085	
  2086	      	if (psubstream) {
  2087	      		runtime = psubstream->runtime;
  2088			cmd = 0;
  2089			if (mutex_lock_interruptible(&runtime->oss.params_lock))
  2090				return -ERESTARTSYS;
  2091			err = snd_pcm_oss_make_ready_locked(psubstream);
> 2092			if (err < 0)
  2093				mutex_unlock(&runtime->oss.params_lock);
  2094				return err;
  2095			if (trigger & PCM_ENABLE_OUTPUT) {
  2096				if (runtime->oss.trigger)
  2097					goto _skip1;
  2098				if (atomic_read(&psubstream->mmap_count))
  2099					snd_pcm_oss_simulate_fill(psubstream,
  2100							get_hw_ptr_period(runtime));
  2101				runtime->oss.trigger = 1;
  2102				runtime->start_threshold = 1;
  2103				cmd = SNDRV_PCM_IOCTL_START;
  2104			} else {
  2105				if (!runtime->oss.trigger)
  2106					goto _skip1;
  2107				runtime->oss.trigger = 0;
  2108				runtime->start_threshold = runtime->boundary;
  2109				cmd = SNDRV_PCM_IOCTL_DROP;
  2110				runtime->oss.prepare = 1;
  2111			}
  2112	 _skip1:
  2113			mutex_unlock(&runtime->oss.params_lock);
  2114			if (cmd) {
  2115				err = snd_pcm_kernel_ioctl(psubstream, cmd, NULL);
  2116				if (err < 0)
  2117					return err;
  2118			}
  2119		}
  2120		if (csubstream) {
  2121	      		runtime = csubstream->runtime;
  2122			cmd = 0;
  2123			if (mutex_lock_interruptible(&runtime->oss.params_lock))
  2124				return -ERESTARTSYS;
  2125			err = snd_pcm_oss_make_ready_locked(csubstream);
  2126			if (err < 0)
  2127				mutex_unlock(&runtime->oss.params_lock);
  2128				return err;
  2129			if (trigger & PCM_ENABLE_INPUT) {
  2130				if (runtime->oss.trigger)
  2131					goto _skip2;
  2132				runtime->oss.trigger = 1;
  2133				runtime->start_threshold = 1;
  2134				cmd = SNDRV_PCM_IOCTL_START;
  2135			} else {
  2136				if (!runtime->oss.trigger)
  2137					goto _skip2;
  2138				runtime->oss.trigger = 0;
  2139				runtime->start_threshold = runtime->boundary;
  2140				cmd = SNDRV_PCM_IOCTL_DROP;
  2141				runtime->oss.prepare = 1;
  2142			}
  2143	 _skip2:
  2144			mutex_unlock(&runtime->oss.params_lock);
  2145			if (cmd) {
  2146				err = snd_pcm_kernel_ioctl(csubstream, cmd, NULL);
  2147				if (err < 0)
  2148					return err;
  2149			}
  2150		}
  2151		return 0;
  2152	}
  2153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
