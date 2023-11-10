Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EE7E865E
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Nov 2023 00:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AAB2210;
	Sat, 11 Nov 2023 00:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AAB2210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699658231;
	bh=5dPcMFlaiWQAP/PNdkSWmTyVFd2Uq4xlZs9J5OOdZWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BvnQvZjylA0St412msmDerWveYch9NN8ptXs991IrIW6Xsn7l1hRq1JG7+XLmlgep
	 Q64qbeejG5Lc1Pj/sVSPTCHNXn6eqzWsF+6/jA7U6P0UdFU6JQfV591xITKPsvNace
	 j0wUpk+ECBH4aUc3CEJBrZCFigyxDc3WZi6p4hLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25391F80558; Sat, 11 Nov 2023 00:16:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77590F80125;
	Sat, 11 Nov 2023 00:16:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 019D9F80169; Sat, 11 Nov 2023 00:16:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5687FF80100
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 00:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5687FF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WVu72bAe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699658167; x=1731194167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dPcMFlaiWQAP/PNdkSWmTyVFd2Uq4xlZs9J5OOdZWs=;
  b=WVu72bAei/pBht5NXvPm/kOxZ4ihsOegbia+ub65rVEuwnJ0S1rJvag8
   csqWUz2M/rlvSmsY6UqBpr4qlR8xPy+MetA1qsSea5oGEnrlqEjvaW1b9
   rN4FuofLlPHCK2Spp6lJhQJg7Z6Skn8/oJUbKHdfdPWnfgdR16eksbdo7
   UlfNwCGIaithMnb3Z2Mzt3Gc9KbScivYSejFwKxa5U7LEii1aInESsT76
   aMrIGGXAVAAXGCKUz0vu4yJiG+esQDZT7fvXjnyy3xSg4++k6cyTZDv4D
   OkPFSuyAuudhhxQW6lLYG4VIcy3zw2Dgyv88svlLVK4XaztPc4YjWuknw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454543724"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200";
   d="scan'208";a="454543724"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 15:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011052062"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200";
   d="scan'208";a="1011052062"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 15:15:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ajC-000A0S-1g;
	Fri, 10 Nov 2023 23:15:54 +0000
Date: Sat, 11 Nov 2023 07:14:54 +0800
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
Subject: Re: [PATCH v9 12/15] media: uapi: Declare interface types for Audio
Message-ID: <202311110751.SQ7aHnyx-lkp@intel.com>
References: <1699595289-25773-13-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699595289-25773-13-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: FTWLFUMCYU4DQOTQ7EKU4MU6R6FMEL6R
X-Message-ID-Hash: FTWLFUMCYU4DQOTQ7EKU4MU6R6FMEL6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTWLFUMCYU4DQOTQ7EKU4MU6R6FMEL6R/>
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
patch link:    https://lore.kernel.org/r/1699595289-25773-13-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v9 12/15] media: uapi: Declare interface types for Audio
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110751.SQ7aHnyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110751.SQ7aHnyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/media.h.rst:6: WARNING: undefined label: media-intf-t-v4l-audio (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/media.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
