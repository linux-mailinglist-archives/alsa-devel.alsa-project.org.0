Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49F585789
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jul 2022 02:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C77E15E0;
	Sat, 30 Jul 2022 02:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C77E15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659140505;
	bh=WXjO7o7rBgFi5ZrQro+PfC6phuM1TO7iPk05avOV+/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoXJ64otk25wb9nl78Mq9CIM12omiIwtPej3rVfmkDJiP9hiP/3fBSgGfCLEiXZJQ
	 10SicVUXFj880HVlyLctK7PqK9lhP0gvfH8kxESSyVBJJj8/i/wmmkfxNAUbPtY/EG
	 zpYw5HTpXUL1V33n8A+6lahWeKmNy1Chh78E2a9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B7F5F804B1;
	Sat, 30 Jul 2022 02:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F0C0F8049C; Sat, 30 Jul 2022 02:20:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36834F800BD
 for <alsa-devel@alsa-project.org>; Sat, 30 Jul 2022 02:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36834F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jhQFTQMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659140438; x=1690676438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WXjO7o7rBgFi5ZrQro+PfC6phuM1TO7iPk05avOV+/I=;
 b=jhQFTQMrlcM3nvWg2X8JFciADXMiDnn4DmHqi+gYgTAuAd+44kZGVLoW
 8KkmV21KCIFpYVm3CAY8Gu6TXzSGhUK7DeOq0SdUOJb6oEcKsVasbsJOf
 Ql+xgMbSmLiUOYSHfoduSI5k/WPjNW9rYKCuUt9C9mYr+l8X70u16xOxn
 cKyLeIxo5tk45f6DBsy4Pt7Lvuc5k/ggn26kI0mJCL2r3o0AXrkGkLjZL
 gmBB9BEjX/6M2ingx2TuZDb1nQbonfFv1f6T8MO9CYrUwhcipVu0qkrtD
 JVNPRb/DrXpwQsD7eJ0IXhCNhoY11lh9wbb+nAtRJaIndI9oR2PrN9sz2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="269258143"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="269258143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 17:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="551913500"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 29 Jul 2022 17:20:29 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHaDU-000CD3-2W;
 Sat, 30 Jul 2022 00:20:28 +0000
Date: Sat, 30 Jul 2022 08:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8326
Message-ID: <202207300809.yYpFMTmt-lkp@intel.com>
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
config: parisc-randconfig-s042-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300809.yYpFMTmt-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/fa066f18e36d4d134a5e94a872c911335b148576
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220729-171050
        git checkout fa066f18e36d4d134a5e94a872c911335b148576
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/clk.h:13,
                    from sound/soc/codecs/es8326.c:9:
   sound/soc/codecs/es8326.c: In function 'es8326_jack_button_handler':
>> include/linux/container_of.h:19:54: error: 'struct es8326_priv' has no member named 'button_press_work'
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
   include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
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
                    from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/err.h:5,
                    from include/linux/clk.h:12:
>> include/linux/stddef.h:16:33: error: 'struct es8326_priv' has no member named 'button_press_work'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   sound/soc/codecs/es8326.c:533:17: note: in expansion of macro 'container_of'
     533 |                 container_of(work, struct es8326_priv, button_press_work.work);
         |                 ^~~~~~~~~~~~
>> sound/soc/codecs/es8326.c:543:46: error: 'ES8326_HP_DECTECT_FB' undeclared (first use in this function); did you mean 'ES8326_HP_DETECT_FB'?
     543 |         iface = snd_soc_component_read(comp, ES8326_HP_DECTECT_FB);
         |                                              ^~~~~~~~~~~~~~~~~~~~
         |                                              ES8326_HP_DETECT_FB
   sound/soc/codecs/es8326.c:543:46: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/codecs/es8326.c:574:54: error: 'struct es8326_priv' has no member named 'button_press_work'
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
>> sound/soc/codecs/es8326.c:681:14: error: 'reg' undeclared (first use in this function)
     681 |         if ((reg & ES8326_VERSION_B) == 1) {
         |              ^~~
   sound/soc/codecs/es8326.c: In function 'es8326_probe':
>> sound/soc/codecs/es8326.c:740:41: error: 'ES8326_INT_SRC_PIN9' undeclared (first use in this function); did you mean 'ES8326_HP_DET_SRC_PIN9'?
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


vim +19 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  15   *
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  16   */
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  17  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  18  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08 @19  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08  20  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  21  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  22  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  23  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
