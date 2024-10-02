Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D89E98CE4F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 10:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C887AE8;
	Wed,  2 Oct 2024 10:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C887AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727856112;
	bh=W1/RxTrXILcH4rl7tbA+EuN/c7SpVtjyGNtesYNKmas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pT/SxDKV1dTfuYZZ4Lp6aU8icRm+rSRKLv5nPHuAKbVe4bvmb/pMKD0aPcFSJTe8W
	 IGDqRYmrMEKd9RcTUCPYXmL6ZOUp/w3yqpQC8WP8GAarjnhdyzijNeU+A5ICN13aA1
	 s3KAYNV92JQYOdF9WA01rYC2QmAyiz4NM4Q8dcBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D9EF80508; Wed,  2 Oct 2024 10:01:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B66F805B0;
	Wed,  2 Oct 2024 10:01:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88D96F80517; Wed,  2 Oct 2024 10:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8586F8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 10:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8586F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I9GuXPsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727856073; x=1759392073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W1/RxTrXILcH4rl7tbA+EuN/c7SpVtjyGNtesYNKmas=;
  b=I9GuXPsrwNsvsBApL5Dtm3uUeMF5N7r9TlNIL6lTufi+MHbIkSTmhvjQ
   c9lf+OJAfmUV0Erm7CUrXGinlghM89DxwLNWqPMGXiVJ3BmJOYjKsxnH9
   56Oz4XFxpBnIB55VPDJ2Z0wm8u7dX0J1kdfMWX/9whkLhMmKJ28jH/GZr
   0A2VqxZYfH1+0tSKZQxUpL1Xwz8FFl6+L0TlFovrl5QZDemDtLCITb3XQ
   0nBn95vu+OuvcUAmHLXO9EWMXkhMdyIn6JWYddUjcBciytgKNg7JyymVr
   XUP8lCZKM+1UEoH86FBczVo8xLac0GzZ45OWzQsZgH8zNeJganxIiNLPj
   g==;
X-CSE-ConnectionGUID: L7Qyb9efTXuLDDExmwRYHA==
X-CSE-MsgGUID: lcxV55YrSwWljzmldOMC7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26519370"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800";
   d="scan'208";a="26519370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 01:01:07 -0700
X-CSE-ConnectionGUID: tMQWD4WwTiartgPgU+hnQA==
X-CSE-MsgGUID: ypbTPhgIS+Kla3iZ6sevBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800";
   d="scan'208";a="78673841"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2024 01:01:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svuIA-000RmT-0G;
	Wed, 02 Oct 2024 08:01:02 +0000
Date: Wed, 2 Oct 2024 16:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, baojun.xu@ti.com, 13564923607@139.com,
	13916275206@139.com, navada@ti.com, v-hampiholi@ti.com,
	m-shrivastava1@ti.com, sakshi@ti.com, sandeepk@ti.com,
	robinchen@ti.com, alsa-devel@alsa-project.org,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [RESEND PATCH v4] MAINTAINERS: update entries in TEXAS
 INSTRUMENTS LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) DRIVERS and add
 entries for haptic driver
Message-ID: <202410021557.FByBO9Dp-lkp@intel.com>
References: <20241002011147.1345-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002011147.1345-1-shenghao-ding@ti.com>
Message-ID-Hash: FMW7KSFPDYGZ26IMEDDT4KV3WEXGBYAT
X-Message-ID-Hash: FMW7KSFPDYGZ26IMEDDT4KV3WEXGBYAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMW7KSFPDYGZ26IMEDDT4KV3WEXGBYAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc1 next-20241002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/MAINTAINERS-update-entries-in-TEXAS-INSTRUMENTS-LOW-MIDDLE-POWER-AUDIO-AMPLIFIER-ASoC-HDA-DRIVERS-and-add-entries-for-ha/20241002-091259
base:   linus/master
patch link:    https://lore.kernel.org/r/20241002011147.1345-1-shenghao-ding%40ti.com
patch subject: [RESEND PATCH v4] MAINTAINERS: update entries in TEXAS INSTRUMENTS LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) DRIVERS and add entries for haptic driver
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410021557.FByBO9Dp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021557.FByBO9Dp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/tpa6130a2.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
