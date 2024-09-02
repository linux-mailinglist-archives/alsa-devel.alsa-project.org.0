Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7213967CE3
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 02:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92A4825;
	Mon,  2 Sep 2024 02:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92A4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725235330;
	bh=hkU0QnkrHN8XnN5ikBgPv0IBCmQ5g53WU/xnLLTb+Mk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OZFaKGzDzQglg4FWSahY4SDHPaaCLWo3G4jwC+mP4KEm69FjDp07Lnu3H5v2cPvcx
	 Qub0m6xR7XgxpDKAli02hA2ljvhkZley1V3UCq0BcqFjQEqNxGmoPYOXay9Y8gH0wQ
	 GjL7IDZMUJMKGZEP1V5S8u/q+LeFnaJiWyZYd4jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0829EF805AE; Mon,  2 Sep 2024 02:01:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D91CF80217;
	Mon,  2 Sep 2024 02:01:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8664DF80217; Mon,  2 Sep 2024 02:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E59EFF800F0
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 02:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E59EFF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Saj662am
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725235291; x=1756771291;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hkU0QnkrHN8XnN5ikBgPv0IBCmQ5g53WU/xnLLTb+Mk=;
  b=Saj662amQvO+zLaS3pkhO0Yp6OMcoEi+ti0twwAi/KEPPAC/pi36znnb
   eICKEKuv3QyQ8GyRATyPSpUy4OhYMjTHXdsa3vNJy7uLMZuyTCbnN2JZk
   yCwjfa86q+qON3wzq0AaqjrfLyVYPMHrNYviLaIgHzqMs3vwsn+Am2vT7
   f3L9UGEprTqDzNQEfRN1krMFa6HL8XNQiXSySupLm1JFZhfVSRWgbVwfK
   /i3++rYJ+1Ps+3IqAdolOkLAQJ9nG9tQcfHs1bymzhbtanLIwsMHEXzzg
   /nTyEVmBmOSG9tS70Dd78FArCuPrh7t2jwB6P+U5IR22qVbEYnhRUYSCM
   w==;
X-CSE-ConnectionGUID: 90/vVBPBR6qvpgerAh16Sg==
X-CSE-MsgGUID: y+gFEnqlQEuhSTzuD3pMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27566842"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600";
   d="scan'208";a="27566842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 17:01:24 -0700
X-CSE-ConnectionGUID: 14sbK2nBTIKXrow3iqONAA==
X-CSE-MsgGUID: Yr0h0m8AQUOWLnHcGZpvVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600";
   d="scan'208";a="64128607"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2024 17:01:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skuVU-0004zK-0W;
	Mon, 02 Sep 2024 00:01:20 +0000
Date: Mon, 2 Sep 2024 08:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 12/12] sound/core/pcm_memory.c:218:29:
 warning: format specifies type 'size_t' (aka 'unsigned int') but the
 argument has type 'unsigned long'
Message-ID: <202409020722.T2ymGxmq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OOODA2DNZQGMP3YGCS3MVWEVYADIJRMB
X-Message-ID-Hash: OOODA2DNZQGMP3YGCS3MVWEVYADIJRMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOODA2DNZQGMP3YGCS3MVWEVYADIJRMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   43b42ed438bfff6bb5a51cc27a1658c03cd223fd
commit: 43b42ed438bfff6bb5a51cc27a1658c03cd223fd [12/12] ALSA: pcm: Fix the previous conversion to kstrtoul()
config: i386-buildonly-randconfig-002-20240902 (https://download.01.org/0day-ci/archive/20240902/202409020722.T2ymGxmq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020722.T2ymGxmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020722.T2ymGxmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/pcm_memory.c:218:29: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     215 |                                 pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
         |                                                                                               ~~~
         |                                                                                               %lu
     216 |                                          substream->pcm->card->number, substream->pcm->device,
     217 |                                          substream->stream ? 'c' : 'p', substream->number,
     218 |                                          substream->pcm->name, size);
         |                                                                ^~~~
   include/linux/printk.h:595:38: note: expanded from macro 'pr_debug'
     595 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:133:18: note: expanded from macro 'no_printk'
     133 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +218 sound/core/pcm_memory.c

c7132aeb72ad11 Jaroslav Kysela    2006-10-06  174  
^1da177e4c3f41 Linus Torvalds     2005-04-16  175  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  176   * write callback for prealloc proc file
^1da177e4c3f41 Linus Torvalds     2005-04-16  177   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * accepts the preallocation size in kB.
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
877211f5e1b119 Takashi Iwai       2005-11-17  180  static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
877211f5e1b119 Takashi Iwai       2005-11-17  181  					       struct snd_info_buffer *buffer)
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  {
877211f5e1b119 Takashi Iwai       2005-11-17  183  	struct snd_pcm_substream *substream = entry->private_data;
d4cfb30fce0309 Takashi Iwai       2020-01-20  184  	struct snd_card *card = substream->pcm->card;
^1da177e4c3f41 Linus Torvalds     2005-04-16  185  	char line[64], str[64];
43b42ed438bfff Takashi Iwai       2024-09-01  186  	unsigned long size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  187  	struct snd_dma_buffer new_dmab;
^1da177e4c3f41 Linus Torvalds     2005-04-16  188  
dd0da75b9a2768 Takashi Iwai       2024-02-27  189  	guard(mutex)(&substream->pcm->open_mutex);
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  	if (substream->runtime) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  191  		buffer->error = -EBUSY;
dd0da75b9a2768 Takashi Iwai       2024-02-27  192  		return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  193  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  194  	if (!snd_info_get_line(buffer, line, sizeof(line))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  195  		snd_info_get_str(str, line, sizeof(str));
61bc4deff03318 Hongbo Li          2024-08-31  196  		buffer->error = kstrtoul(str, 10, &size);
61bc4deff03318 Hongbo Li          2024-08-31  197  		if (buffer->error != 0)
61bc4deff03318 Hongbo Li          2024-08-31  198  			return;
61bc4deff03318 Hongbo Li          2024-08-31  199  		size *= 1024;
^1da177e4c3f41 Linus Torvalds     2005-04-16  200  		if ((size != 0 && size < 8192) || size > substream->dma_max) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  			buffer->error = -EINVAL;
dd0da75b9a2768 Takashi Iwai       2024-02-27  202  			return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  		if (substream->dma_buffer.bytes == size)
dd0da75b9a2768 Takashi Iwai       2024-02-27  205  			return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  206  		memset(&new_dmab, 0, sizeof(new_dmab));
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  		new_dmab.dev = substream->dma_buffer.dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  		if (size > 0) {
d4cfb30fce0309 Takashi Iwai       2020-01-20  209  			if (do_alloc_pages(card,
d4cfb30fce0309 Takashi Iwai       2020-01-20  210  					   substream->dma_buffer.dev.type,
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  					   substream->dma_buffer.dev.dev,
a25684a956468e Takashi Iwai       2021-10-17  212  					   substream->stream,
^1da177e4c3f41 Linus Torvalds     2005-04-16  213  					   size, &new_dmab) < 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  214  				buffer->error = -ENOMEM;
dc85fc9d05d235 Amadeusz Sławiński 2021-03-18  215  				pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
dc85fc9d05d235 Amadeusz Sławiński 2021-03-18  216  					 substream->pcm->card->number, substream->pcm->device,
dc85fc9d05d235 Amadeusz Sławiński 2021-03-18  217  					 substream->stream ? 'c' : 'p', substream->number,
dc85fc9d05d235 Amadeusz Sławiński 2021-03-18 @218  					 substream->pcm->name, size);
dd0da75b9a2768 Takashi Iwai       2024-02-27  219  				return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  			substream->buffer_bytes_max = size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  223  			substream->buffer_bytes_max = UINT_MAX;
^1da177e4c3f41 Linus Torvalds     2005-04-16  224  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  225  		if (substream->dma_buffer.area)
d4cfb30fce0309 Takashi Iwai       2020-01-20  226  			do_free_pages(card, &substream->dma_buffer);
^1da177e4c3f41 Linus Torvalds     2005-04-16  227  		substream->dma_buffer = new_dmab;
^1da177e4c3f41 Linus Torvalds     2005-04-16  228  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  229  		buffer->error = -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  230  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  231  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  232  

:::::: The code at line 218 was first introduced by commit
:::::: dc85fc9d05d23591ddfde400c817413765611ec7 ALSA: pcm: Add debug print on memory allocation failure

:::::: TO: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
