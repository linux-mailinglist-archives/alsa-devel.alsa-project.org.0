Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D76A3AD04
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 01:19:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34F360461;
	Wed, 19 Feb 2025 01:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34F360461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739924382;
	bh=PSlz7lGacbQde34+6kes0gYGdq4cNIvXDqX3rGM6ow8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMcvqHmYY4JK3BylZroK30sL3r757USXIjBLgDU0Mft/EzJz/rn/0JFT0XrGsadzS
	 prkc6NMJY779afI5OgnGCj4h50g8Wkl6rsAexHjpBk2AyZiF5tIK4mWJ/CDdNrbvd/
	 O2FUqfJPsFNqnZcCgZ3vUs3Lu6RJX+o+JeX+h0jM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 597CDF805C2; Wed, 19 Feb 2025 01:19:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5005DF805B6;
	Wed, 19 Feb 2025 01:19:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2816FF800ED; Wed, 19 Feb 2025 01:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 983A3F800EE
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 01:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983A3F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b1Hg4lUl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739924328; x=1771460328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PSlz7lGacbQde34+6kes0gYGdq4cNIvXDqX3rGM6ow8=;
  b=b1Hg4lUlCszDrUkXv8Qf9aJ//ebh1LKWjqkQBRpyld29TFo1XXXY2NYe
   cgsdvrznQOmxsT2qV/Znt5yat9WWO90k5Y+GUWvUBFzPAYukxgdnWTCOe
   e1+U7mFkHqWjGrdApCmjVPi5oQ0FievWZw1klBTHwyI2FokCXm8fLkgbH
   AV88kKw88vFG8Sgrq9FeGZKz3VZJbSHUalK0mqRRQfSKj2ihdNw9Xt0yW
   e8dci6pkXlcMDw+4pRedatEFMqGqEHeRgaYq5fBDjdA8iA9Y2y2QwAaHG
   U3UTroayokHM2cPJPyiG4CPiAxcnFsNNfxPdzDYsC8LyPq8GtAgKJg1gH
   Q==;
X-CSE-ConnectionGUID: D4uF2Ij1Shm2rW/62ENv9g==
X-CSE-MsgGUID: TrZn1Wp4QAycCse7WA55PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="66001206"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000";
   d="scan'208";a="66001206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 16:18:43 -0800
X-CSE-ConnectionGUID: /+X+8UdERG2lIWSYbJQ3TA==
X-CSE-MsgGUID: oYRb/WQ2Qvy4seYq8QYlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000";
   d="scan'208";a="119663213"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2025 16:18:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkXnO-00010d-2h;
	Wed, 19 Feb 2025 00:18:34 +0000
Date: Wed, 19 Feb 2025 08:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <ftreven@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jeff LaBundy <jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
	Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 7/7] Input: cs40l26 - Add support for CS40L26
 haptic driver
Message-ID: <202502190805.6XI1dg3G-lkp@intel.com>
References: <20250204231835.2000457-8-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204231835.2000457-8-ftreven@opensource.cirrus.com>
Message-ID-Hash: STP3OJY3ECZ7BYEV3VHLPHGYDR2FGJM2
X-Message-ID-Hash: STP3OJY3ECZ7BYEV3VHLPHGYDR2FGJM2
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STP3OJY3ECZ7BYEV3VHLPHGYDR2FGJM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Fred,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on broonie-sound/for-next linus/master v6.14-rc3 next-20250218]
[cannot apply to dtor-input/next dtor-input/for-linus lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Treven/firmware-cs_dsp-Fix-error-checking-in-wseq_write/20250217-181206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250204231835.2000457-8-ftreven%40opensource.cirrus.com
patch subject: [PATCH RESEND 7/7] Input: cs40l26 - Add support for CS40L26 haptic driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250219/202502190805.6XI1dg3G-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190805.6XI1dg3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190805.6XI1dg3G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/misc/cs40l26-vibra.c:12:
   In file included from include/linux/input.h:19:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/cs40l26-vibra.c:400:3: error: cannot jump from this goto statement to its label
     400 |                 goto out_free;
         |                 ^
   drivers/input/misc/cs40l26-vibra.c:402:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     402 |         guard(mutex)(&cs40l26->dsp.pwr_lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:141:1: note: expanded from here
     141 | __UNIQUE_ID_guard557
         | ^
   drivers/input/misc/cs40l26-vibra.c:548:3: error: cannot jump from this goto statement to its label
     548 |                 goto out_free;
         |                 ^
   drivers/input/misc/cs40l26-vibra.c:551:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     551 |         guard(mutex)(&vib->cs40l26->dsp.pwr_lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:169:1: note: expanded from here
     169 | __UNIQUE_ID_guard558
         | ^
   3 warnings and 2 errors generated.


vim +400 drivers/input/misc/cs40l26-vibra.c

   386	
   387	static void cs40l26_start_playback_worker(struct work_struct *work)
   388	{
   389		struct cs40l26_work *work_data = container_of(work, struct cs40l26_work, work);
   390		struct cs40l26 *cs40l26 = work_data->vib->cs40l26;
   391		struct cs40l26_effect *effect;
   392		u16 duration;
   393		int id;
   394	
   395		id = work_data->ff_effect->id;
   396	
   397		duration = work_data->ff_effect->replay.length;
   398	
   399		if (pm_runtime_resume_and_get(cs40l26->dev))
 > 400			goto out_free;
   401	
   402		guard(mutex)(&cs40l26->dsp.pwr_lock);
   403	
   404		if (cs40l26_fw_write(&cs40l26->dsp, "TIMEOUT_MS", cs40l26->variant->info->vibegen_algo_id,
   405				     duration))
   406			goto out_pm;
   407	
   408		effect = cs40l26_find_effect(work_data->vib, id);
   409		if (effect) {
   410			while (--work_data->count >= 0) {
   411				if (cs40l26_dsp_write(cs40l26, effect->index))
   412					goto out_pm;
   413	
   414				usleep_range(duration, duration + 100);
   415			}
   416		} else {
   417			dev_err(cs40l26->dev, "No effect found with ID %d\n", id);
   418		}
   419	
   420	out_pm:
   421		cs40l26_pm_exit(cs40l26->dev);
   422	
   423	out_free:
   424		kfree(work_data);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
