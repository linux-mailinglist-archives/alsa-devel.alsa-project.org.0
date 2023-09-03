Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBF790F16
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 00:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10122201;
	Mon,  4 Sep 2023 00:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10122201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693780815;
	bh=+jr/PE8l8ZoDPqDl9jha6OK+TY21OI/UH5MwK4WtTKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qoGIe79xZNjPpknZkwCKZiX0fQ291+UIpKh+6lc2DmsImZzm6yUiFElh2FwEeulyW
	 gtCpFlm1El4UQE6upvCHXpfGpCtah1BeDLtnQK8sS5m0peY0M/+xnj8Ru1XqarKY8O
	 T56MRazWOGj9ShATTL1ommZhSjx3w6oEx5o01YVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B3ADF804F3; Mon,  4 Sep 2023 00:39:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA36CF80431;
	Mon,  4 Sep 2023 00:39:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEB94F8047D; Mon,  4 Sep 2023 00:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 561D8F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 00:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561D8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hBFF5XEK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693780742; x=1725316742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jr/PE8l8ZoDPqDl9jha6OK+TY21OI/UH5MwK4WtTKc=;
  b=hBFF5XEKiL/A2em2Fzb3L29yUPeEfGVh+mBLl/e5NAPzlM7TEslC5Hz9
   5DwaotNIrVl8tbCoxc36hgZ1MEnNOKmwn9eePfXCAY7vkmalgkG5ErkfQ
   ri2X0nNu+TACfpt4yxdkeXkNmX1UD2BM/RU50l0niMRnvNLeO0AZfxrTi
   BhlNhHAGkbWSMhjV+bCJE4u7kiuqES5P+v3H2KzQCIBXP/pjiiCd9Utrk
   kq7vbZj1hiJX+URK35NpGWl1Mp9FM/c0wXroARlo20MxsjN+zw3701FeG
   hbD1qQGiUSm0NqtB+sDzWv4SGv1/YQjnA97uEQP8Ci27mbYYzMebWYg8N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="375383341"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000";
   d="scan'208";a="375383341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 15:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690392333"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000";
   d="scan'208";a="690392333"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2023 15:38:48 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcvjy-0003Tl-1U;
	Sun, 03 Sep 2023 22:38:46 +0000
Date: Mon, 4 Sep 2023 06:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev,
	Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <treding@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2] ALSA: core: split control primitives out of snd_card
Message-ID: <202309040658.LwLeCNwY-lkp@intel.com>
References: <20230824210339.1126993-3-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824210339.1126993-3-cujomalainey@chromium.org>
Message-ID-Hash: 3KTK7A7QC7WM4BT5IL2UXB2WNAPOPNZ6
X-Message-ID-Hash: 3KTK7A7QC7WM4BT5IL2UXB2WNAPOPNZ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KTK7A7QC7WM4BT5IL2UXB2WNAPOPNZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master next-20230831]
[cannot apply to broonie-sound/for-next v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cujomalainey-chromium-org/ALSA-core-add-snd_device_init/20230825-050745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230824210339.1126993-3-cujomalainey%40chromium.org
patch subject: [PATCH 2/2] ALSA: core: split control primitives out of snd_card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230904/202309040658.LwLeCNwY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309040658.LwLeCNwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309040658.LwLeCNwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_get_volume1_vol':
>> sound/core/oss/mixer_oss.c:542:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     542 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:545:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     545 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:563:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     563 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_get_volume1_sw':
   sound/core/oss/mixer_oss.c:581:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     581 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:584:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     584 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:603:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     603 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_put_volume1_vol':
   sound/core/oss/mixer_oss.c:647:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     647 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:650:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     650 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:671:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     671 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_put_volume1_sw':
   sound/core/oss/mixer_oss.c:690:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     690 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:693:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     693 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:718:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     718 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_get_recsrc2':
   sound/core/oss/mixer_oss.c:835:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     835 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:863:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     863 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_put_recsrc2':
   sound/core/oss/mixer_oss.c:888:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     888 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:919:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     919 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_build_test':
   sound/core/oss/mixer_oss.c:939:24: error: 'struct snd_card' has no member named 'controls_rwsem'
     939 |         down_read(&card->controls_rwsem);
         |                        ^~
   sound/core/oss/mixer_oss.c:942:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     942 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:947:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     947 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:952:30: error: 'struct snd_card' has no member named 'controls_rwsem'
     952 |                 up_read(&card->controls_rwsem);
         |                              ^~
   sound/core/oss/mixer_oss.c:957:22: error: 'struct snd_card' has no member named 'controls_rwsem'
     957 |         up_read(&card->controls_rwsem);
         |                      ^~
   sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_build_input':
   sound/core/oss/mixer_oss.c:1071:31: error: 'struct snd_card' has no member named 'controls_rwsem'
    1071 |         down_read(&mixer->card->controls_rwsem);
         |                               ^~
   sound/core/oss/mixer_oss.c:1080:45: error: 'struct snd_card' has no member named 'controls_rwsem'
    1080 |                         up_read(&mixer->card->controls_rwsem);
         |                                             ^~
   sound/core/oss/mixer_oss.c:1085:45: error: 'struct snd_card' has no member named 'controls_rwsem'
    1085 |                         up_read(&mixer->card->controls_rwsem);
         |                                             ^~
   sound/core/oss/mixer_oss.c:1101:61: error: 'struct snd_card' has no member named 'controls_rwsem'
    1101 |                                         up_read(&mixer->card->controls_rwsem);
         |                                                             ^~
   sound/core/oss/mixer_oss.c:1113:29: error: 'struct snd_card' has no member named 'controls_rwsem'
    1113 |         up_read(&mixer->card->controls_rwsem);
         |                             ^~
--
   In file included from include/linux/kernel.h:21,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from sound/soc/intel/catpt/pcm.c:8:
   sound/soc/intel/catpt/pcm.c: In function 'catpt_dai_apply_usettings':
>> sound/soc/intel/catpt/pcm.c:357:60: error: 'struct snd_card' has no member named 'controls'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |                                                            ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/intel/catpt/pcm.c:357:9: note: in expansion of macro 'list_for_each_entry'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5:
>> sound/soc/intel/catpt/pcm.c:357:60: error: 'struct snd_card' has no member named 'controls'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |                                                            ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/intel/catpt/pcm.c:357:9: note: in expansion of macro 'list_for_each_entry'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> sound/soc/intel/catpt/pcm.c:357:60: error: 'struct snd_card' has no member named 'controls'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |                                                            ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/intel/catpt/pcm.c:357:9: note: in expansion of macro 'list_for_each_entry'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/intel/catpt/pcm.c:357:9: note: in expansion of macro 'list_for_each_entry'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14:
>> sound/soc/intel/catpt/pcm.c:357:60: error: 'struct snd_card' has no member named 'controls'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |                                                            ^~
   include/linux/list.h:680:27: note: in definition of macro 'list_entry_is_head'
     680 |         (&pos->member == (head))
         |                           ^~~~
   sound/soc/intel/catpt/pcm.c:357:9: note: in expansion of macro 'list_for_each_entry'
     357 |         list_for_each_entry(pos, &component->card->snd_card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/catpt/pcm.c:362:63: error: 'struct snd_card' has no member named 'controls'
     362 |         if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
         |                                                               ^~
   include/linux/list.h:680:27: note: in definition of macro 'list_entry_is_head'
     680 |         (&pos->member == (head))
         |                           ^~~~
--
   In file included from include/linux/kernel.h:21,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from sound/soc/sh/rcar/core.c:93:
   sound/soc/sh/rcar/core.c: In function 'rsnd_kctrl_new':
>> sound/soc/sh/rcar/core.c:1813:41: error: 'struct snd_card' has no member named 'controls'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |                                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/core.c:1813:9: note: in expansion of macro 'list_for_each_entry'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5:
>> sound/soc/sh/rcar/core.c:1813:41: error: 'struct snd_card' has no member named 'controls'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |                                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/core.c:1813:9: note: in expansion of macro 'list_for_each_entry'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/core.c:1813:41: error: 'struct snd_card' has no member named 'controls'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |                                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/core.c:1813:9: note: in expansion of macro 'list_for_each_entry'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
     689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/core.c:1813:9: note: in expansion of macro 'list_for_each_entry'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14:
>> sound/soc/sh/rcar/core.c:1813:41: error: 'struct snd_card' has no member named 'controls'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |                                         ^~
   include/linux/list.h:680:27: note: in definition of macro 'list_entry_is_head'
     680 |         (&pos->member == (head))
         |                           ^~~~
   sound/soc/sh/rcar/core.c:1813:9: note: in expansion of macro 'list_for_each_entry'
    1813 |         list_for_each_entry(kctrl, &card->controls, list) {
         |         ^~~~~~~~~~~~~~~~~~~


vim +542 sound/core/oss/mixer_oss.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  529  
f956b4a3ae790e Takashi Iwai   2005-11-17  530  static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
f956b4a3ae790e Takashi Iwai   2005-11-17  531  					  struct snd_mixer_oss_slot *pslot,
^1da177e4c3f41 Linus Torvalds 2005-04-16  532  					  unsigned int numid,
^1da177e4c3f41 Linus Torvalds 2005-04-16  533  					  int *left, int *right)
^1da177e4c3f41 Linus Torvalds 2005-04-16  534  {
f956b4a3ae790e Takashi Iwai   2005-11-17  535  	struct snd_ctl_elem_info *uinfo;
f956b4a3ae790e Takashi Iwai   2005-11-17  536  	struct snd_ctl_elem_value *uctl;
f956b4a3ae790e Takashi Iwai   2005-11-17  537  	struct snd_kcontrol *kctl;
f956b4a3ae790e Takashi Iwai   2005-11-17  538  	struct snd_card *card = fmixer->card;
^1da177e4c3f41 Linus Torvalds 2005-04-16  539  
^1da177e4c3f41 Linus Torvalds 2005-04-16  540  	if (numid == ID_UNKNOWN)
^1da177e4c3f41 Linus Torvalds 2005-04-16  541  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @542  	down_read(&card->controls_rwsem);
b1e055f67611da Takashi Iwai   2023-07-18  543  	kctl = snd_ctl_find_numid_locked(card, numid);
51c816fdd17c63 Takashi Iwai   2021-06-08  544  	if (!kctl) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  545  		up_read(&card->controls_rwsem);
^1da177e4c3f41 Linus Torvalds 2005-04-16  546  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  547  	}
ca2c0966562cfb Takashi Iwai   2005-09-09  548  	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
ca2c0966562cfb Takashi Iwai   2005-09-09  549  	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  550  	if (uinfo == NULL || uctl == NULL)
^1da177e4c3f41 Linus Torvalds 2005-04-16  551  		goto __unalloc;
7c22f1aaa23370 Takashi Iwai   2005-10-10  552  	if (kctl->info(kctl, uinfo))
7c22f1aaa23370 Takashi Iwai   2005-10-10  553  		goto __unalloc;
7c22f1aaa23370 Takashi Iwai   2005-10-10  554  	if (kctl->get(kctl, uctl))
7c22f1aaa23370 Takashi Iwai   2005-10-10  555  		goto __unalloc;
7c22f1aaa23370 Takashi Iwai   2005-10-10  556  	if (uinfo->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN &&
7c22f1aaa23370 Takashi Iwai   2005-10-10  557  	    uinfo->value.integer.min == 0 && uinfo->value.integer.max == 1)
7c22f1aaa23370 Takashi Iwai   2005-10-10  558  		goto __unalloc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  559  	*left = snd_mixer_oss_conv1(uctl->value.integer.value[0], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[0]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  560  	if (uinfo->count > 1)
^1da177e4c3f41 Linus Torvalds 2005-04-16  561  		*right = snd_mixer_oss_conv1(uctl->value.integer.value[1], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[1]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  562        __unalloc:
^1da177e4c3f41 Linus Torvalds 2005-04-16  563  	up_read(&card->controls_rwsem);
^1da177e4c3f41 Linus Torvalds 2005-04-16  564        	kfree(uctl);
^1da177e4c3f41 Linus Torvalds 2005-04-16  565        	kfree(uinfo);
^1da177e4c3f41 Linus Torvalds 2005-04-16  566  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  567  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
