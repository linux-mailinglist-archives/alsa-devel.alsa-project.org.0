Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A1742E2F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 22:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D48677F8;
	Thu, 29 Jun 2023 22:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D48677F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688069564;
	bh=0hZo3Q2OkzAKeqy4/gM1dYm6yJZ5yZ3Nd1MfuJclxao=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PieAjxMuWWbDjGxMGpXoiVHE/P/nW8Py0XiQU5GHoZCZXFVkpbO+b1jI8u2oJPnvb
	 JzPTRceJEwuURaFVRobl2K12Y2CZY6obpoKkOiHpT5msnf4cvhkQfLKCpZ9VCh0q5q
	 wgAQ6MB+xTSbf6fu4eHHwRGb4auElecRv2aJmPHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F41F80212; Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C7B9F80212;
	Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 236E1F8027B; Thu, 29 Jun 2023 22:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0597F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 22:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0597F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k2d4d6zR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688069504; x=1719605504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hZo3Q2OkzAKeqy4/gM1dYm6yJZ5yZ3Nd1MfuJclxao=;
  b=k2d4d6zRQqg7nm9/T3aPI8/1WMlVZobdkYRDLAsPcdbyTBXN9MUH+6bL
   ZRaMJy4X0CLBfY+7/OVDir1JOM4Ur2G4mlfwfRQII4hRT24AbwhbNL73G
   ZcaQjueWwPh1v8r6jqiFLYbntlT6n/hiMV7rRBIALJEoJFOVS182sxJ1/
   10bLKo/0syuDr641HtvwlXJYfOq/J1ZRdgFNovurLaY1yeJuDRhRkBJCJ
   rmvFIBfAJd00il9HrwoPFAbvChqybmhjmkH5aJiLDdc3uV9WeBZ1pLqFQ
   55Or36t1OMU2P4GFT7Ov1rFJvdZH7YLkEBJDNJ6boI+HAR0qy02+THoEt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364795157"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="364795157"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891509622"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="891509622"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jun 2023 13:11:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qExzO-000ENA-1T;
	Thu, 29 Jun 2023 20:11:38 +0000
Date: Fri, 30 Jun 2023 04:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56]
 drivers/usb/gadget/function/f_midi2.c:483:6: warning: no previous prototype
 for 'reply_ump_stream_fb_info'
Message-ID: <202306300411.zojb9GzL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 6MCPPVQIWJVT2DLVXLXJJ3UHEAAVD4DE
X-Message-ID-Hash: 6MCPPVQIWJVT2DLVXLXJJ3UHEAAVD4DE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MCPPVQIWJVT2DLVXLXJJ3UHEAAVD4DE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd
commit: ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd [56/56] usb: gadget: add support for USB MIDI 2.0 function driver (WIP)
config: arc-randconfig-r005-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300411.zojb9GzL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300411.zojb9GzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300411.zojb9GzL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_midi2.c:483:6: warning: no previous prototype for 'reply_ump_stream_fb_info' [-Wmissing-prototypes]
     483 | void reply_ump_stream_fb_info(struct f_midi2 *midi2, int blk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/reply_ump_stream_fb_info +483 drivers/usb/gadget/function/f_midi2.c

   481	
   482	/* exported for shell */
 > 483	void reply_ump_stream_fb_info(struct f_midi2 *midi2, int blk)
   484	{
   485		u32 buf[4];
   486	
   487		memset(buf, 0, sizeof(buf));
   488		buf[0] = ump_stream_compose(UMP_STREAM_MSG_STATUS_FB_INFO, 0);
   489		buf[0] |= (midi2->blks[blk].active << 15) | (blk << 8);
   490		buf[0] |= midi2->blks[blk].dir << 4; // UI-hint
   491		buf[1] |= 0 << 2; // MIDI 1.0 port? No
   492		buf[0] |= midi2->blks[blk].dir; // direction
   493		buf[1] |= (midi2->blks[blk].start_group << 24) | // start group
   494			(midi2->blks[blk].num_groups << 16); // # groups spanned
   495		buf[1] |= 0x01 << 8; // MIDI-CI support version
   496		buf[1] |= 0; // Sysex8 streams; not supported
   497	
   498		reply_ep_in(midi2, buf, sizeof(buf));
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
