Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E456EBAE7
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 20:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3FFEEF;
	Sat, 22 Apr 2023 20:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3FFEEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682189642;
	bh=yblBYpAyBWT2Fl/Quo0ypMH6DzJG4HDwQCixGJtBSfw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RJULKikN/MQEGMCT42hUXDbWskRloefFib2Z+9knxCH3Tlkv3hqolNwxeEXPD52h4
	 v0T5jDcX8tyw1/0lFrIUI38WyW57CMRxPJyo2nMAa7rTBl0qgdqlQRLXzSKfQr9U1d
	 2VMtE8JW8ihw29YiCI8CPNxRVUz25f7RMwRibpz8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C28F80149;
	Sat, 22 Apr 2023 20:53:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1909EF80155; Sat, 22 Apr 2023 20:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2296F800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 20:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2296F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YKZv1YTp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682189578; x=1713725578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yblBYpAyBWT2Fl/Quo0ypMH6DzJG4HDwQCixGJtBSfw=;
  b=YKZv1YTp+0tWOAaXEwGVhvQjkpYlz+Hue2j+cxJ4WCoDAQ3uKZA4DWfR
   /QrFdcXMFQJL6sqj+9X/T6K33oSf9z+cYFMYEEp3Ro4D5UTuztut1zaPB
   +Ck9UBrXBtfGSBe7xdArIVjfmmhoo4014i09LYI1J4Iwvukz+eUW3fDxm
   KL2RSm6/ALahQH0RNrTKMC+rTAf32SxUuZ0xOCnNN7TXE117fo8GSrK7Y
   QkfjQBy2yfnJ2fGE066+a72A/Jxbz3eENTJ8BGnlH/VKVd5gDGVrNWNzZ
   EGkJGLqLUuQWtpsQxEtXvObHVonkhQQ6xnz76jdZ81h0HABlB+sbh8hHz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432462608"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200";
   d="scan'208";a="432462608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 11:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="816769029"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200";
   d="scan'208";a="816769029"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2023 11:52:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqILq-000hRI-1S;
	Sat, 22 Apr 2023 18:52:50 +0000
Date: Sun, 23 Apr 2023 02:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of
 open-coded numbers
Message-ID: <202304230230.Hzwubvl5-lkp@intel.com>
References: <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>
Message-ID-Hash: UD3NX7JSCVYWD4NLYOPVUW5VY2OYFSIP
X-Message-ID-Hash: UD3NX7JSCVYWD4NLYOPVUW5VY2OYFSIP
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UD3NX7JSCVYWD4NLYOPVUW5VY2OYFSIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[cannot apply to tiwai-sound/for-linus linus/master v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-comment-updates/20230423-002113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230422161021.1143903-8-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of open-coded numbers
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230423/202304230230.Hzwubvl5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e9c8b11aa4d8ccd105aba0217ff72e87bad545bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-comment-updates/20230423-002113
        git checkout e9c8b11aa4d8ccd105aba0217ff72e87bad545bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230230.Hzwubvl5-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/emu10k1/p16v.c: In function 'snd_p16v_pcm_prepare_capture':
>> sound/pci/emu10k1/p16v.c:313:38: error: 'A_I2S_CAPTURE_RATE' undeclared (first use in this function); did you mean 'A_I2S_CAPTURE_RATE_MASK'?
     313 |           snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_44100);
         |                                      ^~~~~~~~~~~~~~~~~~
         |                                      A_I2S_CAPTURE_RATE_MASK
   sound/pci/emu10k1/p16v.c:313:38: note: each undeclared identifier is reported only once for each function it appears in


vim +313 sound/pci/emu10k1/p16v.c

   295	
   296	/* prepare capture callback */
   297	static int snd_p16v_pcm_prepare_capture(struct snd_pcm_substream *substream)
   298	{
   299		struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
   300		struct snd_pcm_runtime *runtime = substream->runtime;
   301		int channel = substream->pcm->device - emu->p16v_device_offset;
   302	
   303		/*
   304		dev_dbg(emu->card->dev, "prepare capture:channel_number=%d, rate=%d, "
   305		       "format=0x%x, channels=%d, buffer_size=%ld, period_size=%ld, "
   306		       "frames_to_bytes=%d\n",
   307		       channel, runtime->rate, runtime->format, runtime->channels,
   308		       runtime->buffer_size, runtime->period_size,
   309		       frames_to_bytes(runtime, 1));
   310		*/
   311	        switch (runtime->rate) {
   312		case 44100:
 > 313		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_44100);
   314		  break;
   315		case 96000:
   316		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_96000);
   317		  break;
   318		case 192000:
   319		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_192000);
   320		  break;
   321		case 48000:
   322		default:
   323		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_48000);
   324		  break;
   325		}
   326		/* FIXME: Check emu->buffer.size before actually writing to it. */
   327		snd_emu10k1_ptr20_write(emu, CAPTURE_FIFO_POINTER, channel, 0);
   328		snd_emu10k1_ptr20_write(emu, CAPTURE_DMA_ADDR, channel, runtime->dma_addr);
   329		snd_emu10k1_ptr20_write(emu, CAPTURE_BUFFER_SIZE, channel, frames_to_bytes(runtime, runtime->buffer_size) << 16); // buffer size in bytes
   330		snd_emu10k1_ptr20_write(emu, CAPTURE_POINTER, channel, 0);
   331		//snd_emu10k1_ptr20_write(emu, CAPTURE_SOURCE, 0x0, 0x333300e4); /* Select MIC or Line in */
   332		//snd_emu10k1_ptr20_write(emu, EXTENDED_INT_MASK, 0, snd_emu10k1_ptr20_read(emu, EXTENDED_INT_MASK, 0) | (0x110000<<channel));
   333	
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
