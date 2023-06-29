Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85120743022
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 00:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9AD17F8;
	Fri, 30 Jun 2023 00:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9AD17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688076435;
	bh=KroM8puHGKZ2GhPTHV5bkuvKmw/g83hXo9qNzMJhDzg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RTGSFIs4w2rxJyLeCs2ELEYBb7CbhF+HJ5Y1y9mpswehMxKiBCP06EtDvLV35llnv
	 zAp2hiZb/GD3ib7WiZwzdU9P9SvRX0SzdHUCF+ON4aetyJMqB6Cn2C00jjg/0Qq1YX
	 LOJJ7yqm8Q95ERcvpE4aVQSOeCCHzoU0HOUGtTyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D68F80535; Fri, 30 Jun 2023 00:06:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD278F80212;
	Fri, 30 Jun 2023 00:06:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7EFF80246; Fri, 30 Jun 2023 00:06:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 40818F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 00:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40818F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C7iwInYO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688076373; x=1719612373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KroM8puHGKZ2GhPTHV5bkuvKmw/g83hXo9qNzMJhDzg=;
  b=C7iwInYOKZcd34hfoXl0d5mm+QBUaoqF843Di/mI5UgvIQaKO9b3s6YR
   G10GIDMSdFbf/cuxu03E940e05LVdo/nFw0ZLcohymzIYvb8iZ58hmhzF
   g0a1ICBFVK84ZIz4GxJzM1hi8UgXUOYWh1xOhRjrcDfD9TTSHt0TJ56dg
   lP/G1nnYfoNcD0p9pNdw77iGLSGe0nZet4WSPa4IyD4UdeFy4lLXOuG/B
   ceQcZTi3gjmZ9qlT8ABP+m+GUlB5w2nGVJTjYY6lLubvj4Mp2N5JzQ5kp
   yLj+gEoJaGiPMsLMt0Ica1CGvarSdXyxZE9dQOMYTKsn5BEAGLFSlLdFV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364819238"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="364819238"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 15:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711605553"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="711605553"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 15:06:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEzm3-000ERR-3B;
	Thu, 29 Jun 2023 22:05:59 +0000
Date: Fri, 30 Jun 2023 06:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] ld.lld: error: undefined
 symbol: snd_ump_transmit
Message-ID: <202306300550.yyh6cWzj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 7RF6OZ6IWDJRDWUNWTMLJ2AMJZVQNRS7
X-Message-ID-Hash: 7RF6OZ6IWDJRDWUNWTMLJ2AMJZVQNRS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RF6OZ6IWDJRDWUNWTMLJ2AMJZVQNRS7/>
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
config: i386-randconfig-r023-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300550.yyh6cWzj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300550.yyh6cWzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300550.yyh6cWzj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snd_ump_transmit
   >>> referenced by f_midi2.c:644 (drivers/usb/gadget/function/f_midi2.c:644)
   >>>               drivers/usb/gadget/function/f_midi2.o:(process_ump_transmit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_endpoint_new
   >>> referenced by f_midi2.c:946 (drivers/usb/gadget/function/f_midi2.c:946)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_block_new
   >>> referenced by f_midi2.c:957 (drivers/usb/gadget/function/f_midi2.c:957)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_receive
   >>> referenced by f_midi2.c:623 (drivers/usb/gadget/function/f_midi2.c:623)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_ep_out_complete) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_receive_ump_val
   >>> referenced by f_midi2.c:599 (drivers/usb/gadget/function/f_midi2.c:599)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_ep_out_complete) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
