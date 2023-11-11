Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F172D7E8A64
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Nov 2023 11:54:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F4A3E;
	Sat, 11 Nov 2023 11:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F4A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699700090;
	bh=sri7pyPfJ1jGdWG8uOtu4Dd/45elvMuxlAnl70MkOjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ozZ1FaLAyhdO7AsSH8PB1nDkGknlZW1pKxPCSDRof4DY+Ax56EdKfEYU8cXSudIhv
	 F6ztfnpDNm296f9h3lfCLqUeaiXySWqNu0HOcV0+3ZrLSo9YM/78LxPb/ROI47gy4m
	 /Y4+6uKyBReGsHTf6PLzolwKwMTl7ryRDsnE3UtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D36FCF80169; Sat, 11 Nov 2023 11:53:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 291D1F80166;
	Sat, 11 Nov 2023 11:53:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96380F80169; Sat, 11 Nov 2023 11:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22276F800ED
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 11:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22276F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C+VhEC7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699700025; x=1731236025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sri7pyPfJ1jGdWG8uOtu4Dd/45elvMuxlAnl70MkOjI=;
  b=C+VhEC7faTNbMAet6cokVtrSPCTeYjhlZafvRB/i/DaG0cKq/ZiZrjWd
   rfn1q4oTssGEl7TGLYI+Qz9CIclYt79mQIykEcrKg9cKt9oC4+aFd0X2S
   qcIVwon6gjh09EIzfB6k5wGeGwPMrbTFpSbWTkpgstWSj5NS6WO5e1M2T
   IhuxQrWcbD8Yr/MbatEx/Nmzal/jzELs1FSsIawANtnPCNMdjT3X7aUVB
   fI7DM0xlGADXwNMTJj9W9Y980I/UtkIpaAt1ErtwEKHYeRPqZVFTtINCC
   ljrFTARtGL+2h85x1fyyXvQwc/bxMmxMzJaGh27bH2Qpxs8/42yncGtni
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394172441"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200";
   d="scan'208";a="394172441"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 02:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767505053"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200";
   d="scan'208";a="767505053"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 02:53:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1lcK-000AO6-1a;
	Sat, 11 Nov 2023 10:53:32 +0000
Date: Sat, 11 Nov 2023 18:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 13/15] media: uapi: Add an entity type for audio
 resampler
Message-ID: <202311111844.o3EWWxvk-lkp@intel.com>
References: <1699595289-25773-14-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699595289-25773-14-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: NSZSR2Y5WVK2OBEUQP7X77BSULSPJPQV
X-Message-ID-Hash: NSZSR2Y5WVK2OBEUQP7X77BSULSPJPQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSZSR2Y5WVK2OBEUQP7X77BSULSPJPQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20231110-143635
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1699595289-25773-14-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v9 13/15] media: uapi: Add an entity type for audio resampler
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111844.o3EWWxvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111844.o3EWWxvk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/media.h.rst:6: WARNING: undefined label: media-ent-f-proc-audio-resampler (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/media.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
