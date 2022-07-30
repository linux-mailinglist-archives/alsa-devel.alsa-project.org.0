Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752A35858AF
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jul 2022 07:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030A0162F;
	Sat, 30 Jul 2022 07:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030A0162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659157675;
	bh=vBSp1cFUv3O8Is2Z6A/HQa9G1Q+IaT9f7NN2FPv+PmA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7x3gPenyFUUPGxcnIIggYlLPiTN77OU67WHVTFYn4DPdmmt9qY6SCncO26vm16dU
	 brZSly0m21ew/W59cYAf6lmqrDuxAB/ouqx14Y/Cy2mOfBFp0AGVNQF74s36M+DJu/
	 aVavEtlq/jXRUECbL+R9rBDCaeo89QDEZfLdaI70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C303F8014C;
	Sat, 30 Jul 2022 07:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6EBCF801EC; Sat, 30 Jul 2022 07:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17D4EF80089
 for <alsa-devel@alsa-project.org>; Sat, 30 Jul 2022 07:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D4EF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YieDrFmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659157608; x=1690693608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vBSp1cFUv3O8Is2Z6A/HQa9G1Q+IaT9f7NN2FPv+PmA=;
 b=YieDrFmE9KIKToUvFAH68ZmayRAjStGagQqiZdEVMGjIYOcqW75/ftSk
 6HuYDIjfNb/oHgLkMziUAvXfM+ajDB9rVdMQeg0SSR3UpcwFr139U+rfl
 dQjTtC6C//KvdBXMPeDGYueCXPdTTxCYZQDjIwm30VTH2p08zkci6baoq
 /jSzkKsA3fyk06V3JTjE8ejHLer/EakxicJ1b8bntmnMcvqyRyPXN7ua6
 PWbWT85uj8o9jFpUPLRM3Xx386bFGGewQrOtGSV7FI8CBeh4G9xNw08MN
 S59jyQZZ/uotL3jPY6aGIRz8aWP+POnBvluLT2f5L79/kqRqNzeMQTnz6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="289661141"
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="289661141"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 22:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="634337147"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 29 Jul 2022 22:06:40 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHegR-000CQZ-15;
 Sat, 30 Jul 2022 05:06:39 +0000
Date: Sat, 30 Jul 2022 13:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8326
Message-ID: <202207301213.IB52frif-lkp@intel.com>
References: <20220729090857.579785-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729090857.579785-1-zhuning0077@gmail.com>
Cc: robh@kernel.org, kbuild-all@lists.01.org, Zhu Ning <zhuning0077@gmail.com>,
 devicetree@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, David Yang <yangxiaohua@everest-semi.com>
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

Hi Zhu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220729-171050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: ia64-randconfig-r031-20220729 (https://download.01.org/0day-ci/archive/20220730/202207301213.IB52frif-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fa066f18e36d4d134a5e94a872c911335b148576
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220729-171050
        git checkout fa066f18e36d4d134a5e94a872c911335b148576
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:153,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from sound/soc/codecs/es8326.c:10:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/clk.h:13,
                    from sound/soc/codecs/es8326.c:9:
   sound/soc/codecs/es8326.c: In function 'es8326_jack_button_handler':
   include/linux/container_of.h:19:54: error: 'struct es8326_priv' has no member named 'button_press_work'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/codecs/es8326.c:533:17: note: in expansion of macro 'container_of'
     533 |                 container_of(work, struct es8326_priv, button_press_work.work);
         |                 ^~~~~~~~~~~~
>> include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
     293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/codecs/es8326.c:533:17: note: in expansion of macro 'container_of'
     533 |                 container_of(work, struct es8326_priv, button_press_work.work);
         |                 ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/ia64/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/err.h:5,
                    from include/linux/clk.h:12:
   include/linux/stddef.h:16:33: error: 'struct es8326_priv' has no member named 'button_press_work'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   sound/soc/codecs/es8326.c:533:17: note: in expansion of macro 'container_of'
     533 |                 container_of(work, struct es8326_priv, button_press_work.work);
         |                 ^~~~~~~~~~~~
   sound/soc/codecs/es8326.c:543:46: error: 'ES8326_HP_DECTECT_FB' undeclared (first use in this function); did you mean 'ES8326_HP_DETECT_FB'?
     543 |         iface = snd_soc_component_read(comp, ES8326_HP_DECTECT_FB);
         |                                              ^~~~~~~~~~~~~~~~~~~~
         |                                              ES8326_HP_DETECT_FB
   sound/soc/codecs/es8326.c:543:46: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/codecs/es8326.c:574:54: error: 'struct es8326_priv' has no member named 'button_press_work'
     574 |                 queue_delayed_work(system_wq, &es8326->button_press_work,
         |                                                      ^~
   sound/soc/codecs/es8326.c:579:54: error: 'struct es8326_priv' has no member named 'button_press_work'
     579 |                 queue_delayed_work(system_wq, &es8326->button_press_work,
         |                                                      ^~
   sound/soc/codecs/es8326.c: In function 'es8326_jack_detect_handler':
   sound/soc/codecs/es8326.c:602:46: error: 'ES8326_HP_DECTECT_FB' undeclared (first use in this function); did you mean 'ES8326_HP_DETECT_FB'?
     602 |         iface = snd_soc_component_read(comp, ES8326_HP_DECTECT_FB);
         |                                              ^~~~~~~~~~~~~~~~~~~~
         |                                              ES8326_HP_DETECT_FB
   sound/soc/codecs/es8326.c:615:62: error: 'struct es8326_priv' has no member named 'button_press_work'
     615 |                         queue_delayed_work(system_wq, &es8326->button_press_work, 10);
         |                                                              ^~
   sound/soc/codecs/es8326.c: In function 'es8326_resume':
   sound/soc/codecs/es8326.c:681:14: error: 'reg' undeclared (first use in this function)
     681 |         if ((reg & ES8326_VERSION_B) == 1) {
         |              ^~~
   sound/soc/codecs/es8326.c: In function 'es8326_probe':
   sound/soc/codecs/es8326.c:740:41: error: 'ES8326_INT_SRC_PIN9' undeclared (first use in this function); did you mean 'ES8326_HP_DET_SRC_PIN9'?
     740 |                 es8326->interrupt_src = ES8326_INT_SRC_PIN9;
         |                                         ^~~~~~~~~~~~~~~~~~~
         |                                         ES8326_HP_DET_SRC_PIN9
   sound/soc/codecs/es8326.c: At top level:
   sound/soc/codecs/es8326.c:530:13: warning: 'es8326_jack_button_handler' defined but not used [-Wunused-function]
     530 | static void es8326_jack_button_handler(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/es8326.c:315:42: warning: 'es8326_constraints' defined but not used [-Wunused-variable]
     315 | static struct snd_pcm_hw_constraint_list es8326_constraints = {
         |                                          ^~~~~~~~~~~~~~~~~~


vim +293 include/linux/compiler_types.h

eb111869301e15b Rasmus Villemoes 2019-09-13  291  
d15155824c50148 Will Deacon      2017-10-24  292  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c50148 Will Deacon      2017-10-24 @293  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c50148 Will Deacon      2017-10-24  294  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
