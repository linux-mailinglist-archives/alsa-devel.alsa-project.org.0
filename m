Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B77767BD0
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 05:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB33206;
	Sat, 29 Jul 2023 05:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB33206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690599969;
	bh=ZjQOS3XFGaDh1fpc6G40y8BuVdNhHmr5hs8f9YDCtpE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AE8pza0oE31wIDt+9P/fybMNX3rdU7rDgPZkIHeflsYd2UuXZlhtIGi/5iLLHVLmQ
	 lXcr3V9MH5q6TaC2SyTEZZR3tFOfVltj/tPrHZjY1LXMj/RV7ErNaGVN62QtbrK5Ri
	 h6e5EHmfLVjkXtEnnufAGHY+PaAfL+0BC4sBBDlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33397F80163; Sat, 29 Jul 2023 05:05:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0DE0F80163;
	Sat, 29 Jul 2023 05:05:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53A05F8019B; Sat, 29 Jul 2023 05:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EE4BF800D2
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 05:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EE4BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QWu5zNhO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690599833; x=1722135833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjQOS3XFGaDh1fpc6G40y8BuVdNhHmr5hs8f9YDCtpE=;
  b=QWu5zNhOzLzRn0b84hiJXV7bqoElKTQR2o3FSTuawxAKLSoGpsmXZZTV
   zSoJiH0g2qKBu6LiP/xvvBdIDzC119LacZDOwt2+cEsGSLMmc8JYL5jdC
   bWi018RaV1nqkYho+F0yQZ2GxWxihf9ci340F5tuGbYhPY9iei7DK5aSe
   c8Yu/iVFQzXWNr/EDeT65LNj39qbcTZQjV4z0zqKSiNWIgGNZFrcgmqei
   tcecirXK4kn9PdX/VTmUI3BAdKijvUuhA3MJwcSsqJb29zc7eX+1H//37
   a938K6V6TNhtO8X7AadZbMpzyJ9GbiJMLmUcA3tFanigoZuvRm5NNPoQJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353629906"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200";
   d="scan'208";a="353629906"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 20:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="730965537"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200";
   d="scan'208";a="730965537"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 20:03:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPaF7-0003md-0g;
	Sat, 29 Jul 2023 03:03:45 +0000
Date: Sat, 29 Jul 2023 11:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-sockptr 18/26]
 drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: warning:
 'snd_solo_pcm_copy' defined but not used
Message-ID: <202307291119.03yget13-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: JKGUYBATI72IDBWZJWWK43H2AMF66PKX
X-Message-ID-Hash: JKGUYBATI72IDBWZJWWK43H2AMF66PKX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKGUYBATI72IDBWZJWWK43H2AMF66PKX/>
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
config: i386-buildonly-randconfig-r004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291119.03yget13-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291119.03yget13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291119.03yget13-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/solo6x10/solo6x10-g723.c:242:10: error: 'const struct snd_pcm_ops' has no member named 'copye'; did you mean 'copy'?
     242 |         .copye = snd_solo_pcm_copy_user,
         |          ^~~~~
         |          copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: error: 'snd_solo_pcm_copy_user' undeclared here (not in a function); did you mean 'snd_solo_pcm_copy'?
     242 |         .copye = snd_solo_pcm_copy_user,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
         |                  snd_solo_pcm_copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: note: (near initialization for 'snd_solo_pcm_ops')
>> drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: warning: 'snd_solo_pcm_copy' defined but not used [-Wunused-function]
     207 | static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
         |            ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/snd_solo_pcm_copy +207 drivers/media/pci/solo6x10/solo6x10-g723.c

   206	
 > 207	static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
   208				     unsigned long pos, sockptr_t dst,
   209				     unsigned long count)
   210	{
   211		struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
   212		struct solo_dev *solo_dev = solo_pcm->solo_dev;
   213		unsigned int off = 0;
   214		int err, i;
   215	
   216		for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
   217			int page = (pos / G723_FRAMES_PER_PAGE) + i;
   218	
   219			err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
   220					     SOLO_G723_EXT_ADDR(solo_dev) +
   221					     (page * G723_PERIOD_BLOCK) +
   222					     (ss->number * G723_PERIOD_BYTES),
   223					     G723_PERIOD_BYTES, 0, 0);
   224			if (err)
   225				return err;
   226	
   227			if (copy_to_sockptr_offset(dst, off,
   228						   solo_pcm->g723_buf, G723_PERIOD_BYTES))
   229				return -EFAULT;
   230			off += G723_PERIOD_BYTES;
   231		}
   232	
   233		return 0;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
