Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F6742E70
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 22:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E977F1;
	Thu, 29 Jun 2023 22:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E977F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688070896;
	bh=rIkKyyWfBzwQwxt25WaqxDg7ezhw9SIp9UwaiUfNwuM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MN72VQPwlKQEJCPGCdJChPPqComTjcIFva2s6BoiL80rQNUrU0VUiZfnSqELkl+d5
	 lMdoXFy7CBdQhTWy87Uar7qhIcjl6w+/2LC15HmmZgfWzx6C8bLs9D9EM1y0WPOB1T
	 RHbqZzGDpsKS88rtJjeAAKp0ot69lPllyfy/5YAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9854F80169; Thu, 29 Jun 2023 22:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F91CF80212;
	Thu, 29 Jun 2023 22:34:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C7AF80246; Thu, 29 Jun 2023 22:34:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CDAF6F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 22:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDAF6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cz2Qyb7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688070835; x=1719606835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIkKyyWfBzwQwxt25WaqxDg7ezhw9SIp9UwaiUfNwuM=;
  b=cz2Qyb7cdkF03YGyvpUbKmHwDfyTSoRZwCrk5RlwTj5AlXHiNG3VzmiB
   NDMO211dy7Cx7ltWDlM6AiJiqsGIMO97Nx2H4WoKgzuuXAOWRgGz7gdQM
   174SxBuZQsO4n1HBW0idximNkuk5heB9/ZHReMYu+NQHA047ErOKdfdtk
   /OSTBA+eqQ2X5TYbZFdaxtiodacdw+jkKihHBAR0DpwPLlZtPcz/Br1Rw
   mgprYLQ3Nj0vMPXvBY2Ved8/VLzAkmyz/uqp92PylyeSYWb599gMCV3N2
   TCYUx4ijd5AdW3tA/wBIKsAauLfrwmDk21d08phJO7TOzJYrsBQ+autLa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364800454"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="364800454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667692845"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="667692845"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2023 13:33:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEyKp-000ENl-0E;
	Thu, 29 Jun 2023 20:33:47 +0000
Date: Fri, 30 Jun 2023 04:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] ERROR: modpost:
 "snd_ump_block_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
Message-ID: <202306300438.HICMJktb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: XE3YVMEHVBK4D22YQSHEYE3FJR3IIESW
X-Message-ID-Hash: XE3YVMEHVBK4D22YQSHEYE3FJR3IIESW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE3YVMEHVBK4D22YQSHEYE3FJR3IIESW/>
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
config: arm-randconfig-r046-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300438.HICMJktb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300438.HICMJktb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300438.HICMJktb-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/usb/gadget/function/f_midi2.c:483:6: warning: no previous prototype for 'reply_ump_stream_fb_info' [-Wmissing-prototypes]
     483 | void reply_ump_stream_fb_info(struct f_midi2 *midi2, int blk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> ERROR: modpost: "snd_ump_block_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_receive_ump_val" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_transmit" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_receive" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_endpoint_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
