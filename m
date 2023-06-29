Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D334743067
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 00:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29ABD1F1;
	Fri, 30 Jun 2023 00:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29ABD1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688077645;
	bh=XDbEq6z0G5cJo1AA7vUnB0yASGsY1KqUcw6vztBNFik=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f6qB1qbiWCkt9z7iAmSqWP0bTQ0yPBPhA6WcpjlRqZQNNcMxcha2HfbO+mHtEUp3v
	 J56Ztzf9o90abCrSVTogTskGiaDK88UfpDOo9utoJGJHPHlGFHsUIxYMoNijOOLLpH
	 6LQS/ZYHtZIWCzsVM9699dMsCPEZrPG/qu/sbhws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE365F80212; Fri, 30 Jun 2023 00:26:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82EF7F80124;
	Fri, 30 Jun 2023 00:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F032F80246; Fri, 30 Jun 2023 00:26:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69C35F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 00:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C35F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BcYrm18w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688077567; x=1719613567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDbEq6z0G5cJo1AA7vUnB0yASGsY1KqUcw6vztBNFik=;
  b=BcYrm18wsgATy282TrHgGLmQ4C6BUPTLe+woE+Lcpkc3A5b4RLiDLnpm
   tU+cScKbDfoLZe2D2o0igbOcekQpWaSOJUCtjdzdkuEpGpxZOmJnFY3tA
   7WwarsN+lDvn7/P5Mozd7CZftM1BINJGoJqy9Q23PAst+SVEZgFj367nZ
   8CfBLaj7SoyhnhueNPqxzcRhIA9w3Gl6a6bsy9dTdyXNR6zhUuEUapxVg
   hriJhZy70sgO1KikFRL6TOIYx5f/YWBmiTROmj8MTkgnAaq6vbW/ZeF5N
   LL35ZcjpTkJAa0UBKHw9+Mz7AL/HaxXbX/hgbWn+2TinjOOubtpCOLviD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364823854"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="364823854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 15:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711610838"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="711610838"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 15:26:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF05Q-000ESD-1I;
	Thu, 29 Jun 2023 22:26:00 +0000
Date: Fri, 30 Jun 2023 06:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] f_midi2.c:undefined
 reference to `snd_ump_endpoint_new'
Message-ID: <202306300642.o48bLzoB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: JMVMO6LXOD7KHEVWN33MA54Y7URMNPQ7
X-Message-ID-Hash: JMVMO6LXOD7KHEVWN33MA54Y7URMNPQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMVMO6LXOD7KHEVWN33MA54Y7URMNPQ7/>
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
config: x86_64-buildonly-randconfig-r001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300642.o48bLzoB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300642.o48bLzoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300642.o48bLzoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_create.constprop.0':
>> f_midi2.c:(.text+0x27f2): undefined reference to `snd_ump_endpoint_new'
>> ld: f_midi2.c:(.text+0x29a5): undefined reference to `snd_ump_block_new'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `process_ump_transmit':
>> f_midi2.c:(.text+0x4a69): undefined reference to `snd_ump_transmit'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_ep_out_complete':
>> f_midi2.c:(.text+0x5af1): undefined reference to `snd_ump_receive_ump_val'
>> ld: f_midi2.c:(.text+0x5bef): undefined reference to `snd_ump_receive'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
