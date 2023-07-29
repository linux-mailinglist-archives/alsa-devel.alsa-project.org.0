Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8200767CE6
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 09:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE5F4E;
	Sat, 29 Jul 2023 09:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE5F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690616891;
	bh=EZOQbnRRshYDfaLoWy3RA+1Qs+jb7CO7OoqYwyF60Yc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qAnMi8VoE+4Ps4XhmV9XfFowPvbpufQ+SoebzFrgYTAe24QOGqFXr1aX9R7YqT9u/
	 BhJDTFSTzgTCxRw1JxqmUXrKxYxYUjtBNpLLJfRgqJsW5OBEAQBJo4kA98Oa6vH0pO
	 Jl/+ZLy3we+KU5nWlkO2BVe1qnnA4PElVvE3TLe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABFC4F80544; Sat, 29 Jul 2023 09:47:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FB67F80163;
	Sat, 29 Jul 2023 09:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672E6F8019B; Sat, 29 Jul 2023 09:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BFDBF80149
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 09:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFDBF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pgeaar0l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690616544; x=1722152544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZOQbnRRshYDfaLoWy3RA+1Qs+jb7CO7OoqYwyF60Yc=;
  b=Pgeaar0l5aH1e7Oe58ehrIKn8y5gQM9f+2NKoRlsM976kpOd7qYgW1Gx
   F0IsEO/A6+rEceACNE2PA8zMvFy35hR04uhxTnCYddwJeygOsv1t6Z6uM
   e8TLsOZFZZxFNA5IHFn8Y4eBWQ3F/gJK/XxCZGNLKYPSnofllTqWh6zFs
   TIyfRCgwFj6kcOJOH4K/VFCujS5mGFDpDBx3DTVFazaDHLSv9G8RbjU06
   lQjXk/FRkljMMFyX4bPQTiVRCBFviAdAxj3ULahCdrdUyRcqPHX7WomkK
   NET7Mocr8AliBgFU7LXaZGDAEAz9YJzOq747EzuNMJpVq6ybXSeu1h+4Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366211102"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200";
   d="scan'208";a="366211102"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2023 00:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="762811945"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200";
   d="scan'208";a="762811945"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 00:42:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPeaG-0003uN-1M;
	Sat, 29 Jul 2023 07:42:01 +0000
Date: Sat, 29 Jul 2023 15:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-sockptr 18/26]
 drivers/media/pci/solo6x10/solo6x10-g723.c:242:11: error: use of undeclared
 identifier 'snd_solo_pcm_copy_user'; did you mean 'snd_solo_pcm_copy'?
Message-ID: <202307291526.AOnKZKB1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: AMYBJVJYD5RCCDNUJ27MA5H2SHEJJH4E
X-Message-ID-Hash: AMYBJVJYD5RCCDNUJ27MA5H2SHEJJH4E
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/pcm-sockptr
head:   3fffa74b00add561981357c76375e1829059d4e5
commit: 79cf0bf97368998dd44c1863d6f54057846b68c9 [18/26] media: solo6x10: Convert to generic PCM copy ops
config: x86_64-randconfig-x004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291526.AOnKZKB1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291526.AOnKZKB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291526.AOnKZKB1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/solo6x10/solo6x10-g723.c:242:11: error: use of undeclared identifier 'snd_solo_pcm_copy_user'; did you mean 'snd_solo_pcm_copy'?
           .copye = snd_solo_pcm_copy_user,
                    ^~~~~~~~~~~~~~~~~~~~~~
                    snd_solo_pcm_copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: note: 'snd_solo_pcm_copy' declared here
   static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
              ^
>> drivers/media/pci/solo6x10/solo6x10-g723.c:242:3: error: field designator 'copye' does not refer to any field in type 'const struct snd_pcm_ops'; did you mean 'copy'?
           .copye = snd_solo_pcm_copy_user,
            ^~~~~
            copy
   include/sound/pcm.h:72:8: note: 'copy' declared here
           int (*copy)(struct snd_pcm_substream *substream, int channel,
                 ^
   2 errors generated.


vim +242 drivers/media/pci/solo6x10/solo6x10-g723.c

   235	
   236	static const struct snd_pcm_ops snd_solo_pcm_ops = {
   237		.open = snd_solo_pcm_open,
   238		.close = snd_solo_pcm_close,
   239		.prepare = snd_solo_pcm_prepare,
   240		.trigger = snd_solo_pcm_trigger,
   241		.pointer = snd_solo_pcm_pointer,
 > 242		.copye = snd_solo_pcm_copy_user,
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
