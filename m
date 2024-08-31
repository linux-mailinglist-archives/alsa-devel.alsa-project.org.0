Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CCD967336
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2024 22:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD6F3E7;
	Sat, 31 Aug 2024 22:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD6F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725135062;
	bh=ynoORa0Ti+9igh/YbY9OxjXelGyHqlqQMv2Yi5Vga+U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=th5uESM+4i/VSYiMrhgf+Sy0ZCedoKcx2QNndOtnM1GSWB/kKxp/Mj4gG00MBtN1S
	 2qBpMPer4Eyhico3gVnDN0b5PyhoDMMyH1rJMS4jI47ncGUdY08gn8W9nPHqLi0kxF
	 +jWAqjFrMqeH25iPmaB8beDXs/Gtw91XUy7OPx2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DB90F8059F; Sat, 31 Aug 2024 22:10:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB25F80518;
	Sat, 31 Aug 2024 22:10:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31312F80518; Sat, 31 Aug 2024 22:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2FE2F8025E
	for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2024 22:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2FE2F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lC+vb+A+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725135025; x=1756671025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynoORa0Ti+9igh/YbY9OxjXelGyHqlqQMv2Yi5Vga+U=;
  b=lC+vb+A+1Xq4i/LSt5cU8egd5iiZfQklfSCi/yFoExZhkcCSve7T45BC
   4n0mEEvlJlTWuD/cNTPSTBRgRb5jzO2H2lm5vbXPDTfddzI5XCEtXeDfc
   ATGnRZiS2YX6vWO1yg8YSCJ7rRmAonWZQumYkm11kykBRQNXilaxdVuqR
   h8is5bO73FPIxdL05/64w/47IukesYF+fcoFqBaREO+onXMk/smfAUCQg
   UqXHeb1pZEs0KYPXQHuvSOXmIvTvoZNy9N4z1FB+jYK9qd7PB7tJQFa5D
   236nS7BMXisfY7/HBQpRvLKVt7IFfuKrG3+dQrMsjtdI90M8SiUNI5QNs
   A==;
X-CSE-ConnectionGUID: g8QRERXiRn6nAsFBlS7GrQ==
X-CSE-MsgGUID: Gpx3ICU+SfKiKrhhV8DBbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="26662791"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600";
   d="scan'208";a="26662791"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 13:10:19 -0700
X-CSE-ConnectionGUID: 5hrsC27VTkWt+4VMqWnTSg==
X-CSE-MsgGUID: eNlU50j7QviipkLvBJh0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600";
   d="scan'208";a="101683819"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Aug 2024 13:10:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUQJ-000351-2f;
	Sat, 31 Aug 2024 20:10:15 +0000
Date: Sun, 1 Sep 2024 04:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 11/11] sound/core/pcm_memory.c:196:51: error:
 passing argument 3 of 'kstrtoul' from incompatible pointer type
Message-ID: <202409010425.YPS7cWeJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: L66PLZDI3JDUUDD4H4I6PTU6AFPDPYVT
X-Message-ID-Hash: L66PLZDI3JDUUDD4H4I6PTU6AFPDPYVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L66PLZDI3JDUUDD4H4I6PTU6AFPDPYVT/>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010425.YPS7cWeJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010425.YPS7cWeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010425.YPS7cWeJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/pcm_memory.c: In function 'snd_pcm_lib_preallocate_proc_write':
>> sound/core/pcm_memory.c:196:51: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Wincompatible-pointer-types]
     196 |                 buffer->error = kstrtoul(str, 10, &size);
         |                                                   ^~~~~
         |                                                   |
         |                                                   size_t * {aka unsigned int *}
   In file included from include/linux/kernel.h:25,
                    from arch/sh/include/asm/fixmap.h:13,
                    from arch/sh/include/asm/pgtable.h:22,
                    from include/linux/pgtable.h:6,
                    from arch/sh/include/asm/io.h:21,
                    from include/linux/io.h:14,
                    from sound/core/pcm_memory.c:7:
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~


vim +/kstrtoul +196 sound/core/pcm_memory.c

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
