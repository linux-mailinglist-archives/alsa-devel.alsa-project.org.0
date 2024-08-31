Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC996734F
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2024 23:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 031A682B;
	Sat, 31 Aug 2024 23:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 031A682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725138728;
	bh=FCx10hAy+RrOBUSfsfZxQmlx4w0NZ95xCOETcraH/5U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C5V2pdCXwWL2C9oB4FDqPS4t9SGx3OuoYa2aoO/XgoYnz6cfeq3Nq6ifZ6kHxPLcx
	 pbybFutkws9N6aW7PO5Sx72ImI8MY8/dJ5drzaRvU+O9u+mJXIgypldwRqnkPsKvcz
	 D/qlzxJw4oaLz2M+tI+CRYFabbg4f9ZcNUHu1rSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A166F805AF; Sat, 31 Aug 2024 23:11:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F154F80518;
	Sat, 31 Aug 2024 23:11:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A28FF80518; Sat, 31 Aug 2024 23:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75E58F8025E
	for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2024 23:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E58F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cFiUKiOL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725138688; x=1756674688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCx10hAy+RrOBUSfsfZxQmlx4w0NZ95xCOETcraH/5U=;
  b=cFiUKiOLgEg/gfOcPYNCeGi/xiRyrvQ0bCJubh3Na+oGZaQzfIiKmOPY
   +27gIYFKCfeIZZtcK/iBB7v71d7OBcLPC9j+gwXKzBXpXu2WKsZ2t2R+G
   +gWphyjNuZUQptVKeMeteUSVNPAOBCUgHAqkLO+bLC5y4gEOcOohETYo4
   lpXfMTkUVoi+xbicUJ1AQOXe2IRbSucI824AkAfFxFc7FqvTLHnGuxM5e
   GHI7vTmVWlaFv4JT743G5ghMBCFISWMQe8xSIaWLqrgjOqU3BT022YYUP
   IQxyhdq73LwlcH5UZpEKFtWGFfb8Z1WqXZQWYU78Zm5WNmn/S5ua1MpZF
   w==;
X-CSE-ConnectionGUID: aokIXsdtSf6/rOxWuJNjnw==
X-CSE-MsgGUID: ZwXsvBwSROaTvGG8cwrOrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34373887"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600";
   d="scan'208";a="34373887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 14:11:22 -0700
X-CSE-ConnectionGUID: Bxpca/3ASPOvlScRpLcn8Q==
X-CSE-MsgGUID: nZIN0TSrTvSjbO16vYPbMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600";
   d="scan'208";a="68877212"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2024 14:11:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skVNO-00038I-1n;
	Sat, 31 Aug 2024 21:11:18 +0000
Date: Sun, 1 Sep 2024 05:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 11/11] sound/core/pcm_memory.c:196:37: error:
 incompatible pointer types passing 'size_t *' (aka 'unsigned int *') to
 parameter of type 'unsigned long *'
Message-ID: <202409010509.nOL6xTD7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: HUNHC22MCHI26NYA2WSMLWKGBVZLKUOW
X-Message-ID-Hash: HUNHC22MCHI26NYA2WSMLWKGBVZLKUOW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUNHC22MCHI26NYA2WSMLWKGBVZLKUOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   61bc4deff033181992408f973b48fca08757d3ff
commit: 61bc4deff033181992408f973b48fca08757d3ff [11/11] ALSA: pcm: replace simple_strtoul to kstrtoul
config: hexagon-randconfig-002-20240901 (https://download.01.org/0day-ci/archive/20240901/202409010509.nOL6xTD7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010509.nOL6xTD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010509.nOL6xTD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/core/pcm_memory.c:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/core/pcm_memory.c:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/core/pcm_memory.c:7:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/core/pcm_memory.c:14:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/core/pcm_memory.c:196:37: error: incompatible pointer types passing 'size_t *' (aka 'unsigned int *') to parameter of type 'unsigned long *' [-Werror,-Wincompatible-pointer-types]
     196 |                 buffer->error = kstrtoul(str, 10, &size);
         |                                                   ^~~~~
   include/linux/kstrtox.h:30:90: note: passing argument to parameter 'res' here
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                                          ^
   7 warnings and 1 error generated.


vim +196 sound/core/pcm_memory.c

   174	
   175	/*
   176	 * write callback for prealloc proc file
   177	 *
   178	 * accepts the preallocation size in kB.
   179	 */
   180	static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
   181						       struct snd_info_buffer *buffer)
   182	{
   183		struct snd_pcm_substream *substream = entry->private_data;
   184		struct snd_card *card = substream->pcm->card;
   185		char line[64], str[64];
   186		size_t size;
   187		struct snd_dma_buffer new_dmab;
   188	
   189		guard(mutex)(&substream->pcm->open_mutex);
   190		if (substream->runtime) {
   191			buffer->error = -EBUSY;
   192			return;
   193		}
   194		if (!snd_info_get_line(buffer, line, sizeof(line))) {
   195			snd_info_get_str(str, line, sizeof(str));
 > 196			buffer->error = kstrtoul(str, 10, &size);
   197			if (buffer->error != 0)
   198				return;
   199			size *= 1024;
   200			if ((size != 0 && size < 8192) || size > substream->dma_max) {
   201				buffer->error = -EINVAL;
   202				return;
   203			}
   204			if (substream->dma_buffer.bytes == size)
   205				return;
   206			memset(&new_dmab, 0, sizeof(new_dmab));
   207			new_dmab.dev = substream->dma_buffer.dev;
   208			if (size > 0) {
   209				if (do_alloc_pages(card,
   210						   substream->dma_buffer.dev.type,
   211						   substream->dma_buffer.dev.dev,
   212						   substream->stream,
   213						   size, &new_dmab) < 0) {
   214					buffer->error = -ENOMEM;
   215					pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
   216						 substream->pcm->card->number, substream->pcm->device,
   217						 substream->stream ? 'c' : 'p', substream->number,
   218						 substream->pcm->name, size);
   219					return;
   220				}
   221				substream->buffer_bytes_max = size;
   222			} else {
   223				substream->buffer_bytes_max = UINT_MAX;
   224			}
   225			if (substream->dma_buffer.area)
   226				do_free_pages(card, &substream->dma_buffer);
   227			substream->dma_buffer = new_dmab;
   228		} else {
   229			buffer->error = -EINVAL;
   230		}
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
