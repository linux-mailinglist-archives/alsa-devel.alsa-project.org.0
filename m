Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20EAD7EB8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jun 2025 01:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CBC601F4;
	Fri, 13 Jun 2025 01:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CBC601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749769622;
	bh=42DxeMH18pStU8d+i4uYd8J1GvuEtr28iSqW77gs9R0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rUEUwsl6aX+ATDdIxNHFDTHYtNlmq30iYl9G8TtpPIogDfZwsrmZXfrLUqFNTFECo
	 q/wFcQX8gNG9yuCuXuKTh4i6TRUMItVahbYuUJWZYbr6jc6D95ZNEKhWL3HtGe5gYX
	 Yi0iZv+Rv3pC6KlIqcSo/d3wdBvMhgQ2PL+LVUGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E056CF805B3; Fri, 13 Jun 2025 01:06:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC084F805C3;
	Fri, 13 Jun 2025 01:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAFFFF80424; Fri, 13 Jun 2025 01:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CAA7F8013D
	for <alsa-devel@alsa-project.org>; Fri, 13 Jun 2025 01:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CAA7F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gNKouDz2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749769577; x=1781305577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42DxeMH18pStU8d+i4uYd8J1GvuEtr28iSqW77gs9R0=;
  b=gNKouDz2T3KFkG/Dd/D3scYKaxpLADQ/GWsSqNBkIwpvzGmargFmVrJU
   oK31H2WAFonco0rbYL0C7lKBPfOpb51VVuK1QHxn9o4T2gCjnIzt6jCge
   GFn+Ubb3bTPKfNB7jc42xxU2LnNvPobBYGB4y/mAF1lGpQW5KFSO8MWsu
   5zdfYkCis2iX9Kqsp/7qq6rIvlUUb7PV+Bxqs1JXCqd6eXyPwQIx/fWud
   m2UvLW/MRU6CVkNyOCKz24Q5Jl4lqi9epaNv3hNx0CszxANeU6tO2W5Uh
   aCsU+JrjBE4fRJVHFNj3bl9YHEkpzTRAYeedKHZ5EaTBZkMP7ANWSDVXd
   Q==;
X-CSE-ConnectionGUID: c8DAhecIQrOY+kk9X2P4Hw==
X-CSE-MsgGUID: 2xIV1vs9QYehMCYBNBrX3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69543023"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600";
   d="scan'208";a="69543023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 16:06:11 -0700
X-CSE-ConnectionGUID: qKQJ8m/FTP+l3e1RF3Re7A==
X-CSE-MsgGUID: fvmexS/ERFSOi2NMLBK/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600";
   d="scan'208";a="152946596"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2025 16:06:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPqzm-000C16-2G;
	Thu, 12 Jun 2025 23:06:06 +0000
Date: Fri, 13 Jun 2025 07:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 10/18] mixer_quirks.c:undefined reference to
 `input_close_device'
Message-ID: <202506130733.gnPKw2l3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: UKT74TXMQD4TYM33L2VIZGK5GKJLMNUS
X-Message-ID-Hash: UKT74TXMQD4TYM33L2VIZGK5GKJLMNUS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKT74TXMQD4TYM33L2VIZGK5GKJLMNUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   30f85eddbdebba7665f9b7b772821e588547ca9e
commit: 79d561c4ec0497669f19a9550cfb74812f60938b [10/18] ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
config: nios2-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130733.gnPKw2l3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130733.gnPKw2l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130733.gnPKw2l3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_ih_disconnect':
>> mixer_quirks.c:(.text+0x25d8): undefined reference to `input_close_device'
>> mixer_quirks.c:(.text+0x25d8): relocation truncated to fit: R_NIOS2_CALL26 against `input_close_device'
>> nios2-linux-ld: mixer_quirks.c:(.text+0x25e0): undefined reference to `input_unregister_handle'
>> mixer_quirks.c:(.text+0x25e0): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handle'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_mixer_elem_free':
>> mixer_quirks.c:(.text+0x26f0): undefined reference to `input_unregister_handler'
>> mixer_quirks.c:(.text+0x26f0): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handler'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_ih_connect':
>> mixer_quirks.c:(.text+0x2d8c): undefined reference to `input_register_handle'
>> mixer_quirks.c:(.text+0x2d8c): relocation truncated to fit: R_NIOS2_CALL26 against `input_register_handle'
>> nios2-linux-ld: mixer_quirks.c:(.text+0x2d9c): undefined reference to `input_open_device'
>> mixer_quirks.c:(.text+0x2d9c): relocation truncated to fit: R_NIOS2_CALL26 against `input_open_device'
   nios2-linux-ld: mixer_quirks.c:(.text+0x2dac): undefined reference to `input_unregister_handle'
   mixer_quirks.c:(.text+0x2dac): relocation truncated to fit: R_NIOS2_CALL26 against `input_unregister_handle'
   nios2-linux-ld: sound/usb/mixer_quirks.o: in function `snd_dualsense_jack_create':
>> mixer_quirks.c:(.text+0x2f30): undefined reference to `input_register_handler'
>> mixer_quirks.c:(.text+0x2f30): relocation truncated to fit: R_NIOS2_CALL26 against `input_register_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
