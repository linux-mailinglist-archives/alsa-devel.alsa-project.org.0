Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD99952E53
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 14:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2563C2BE0;
	Thu, 15 Aug 2024 14:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2563C2BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723725295;
	bh=+fvBVhqwVxnnLELp45LxE5B3Ly84i4Yh9U1qnszQeKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OWeXgmQxwo2PSaG/MR0Ekp1LWoG8SLtXsQVAbbp/FM9CjiSwFcl/uulwGTVcIgGMY
	 OTKkkRUPHgHbsaYmh3O68WTYLbtC3Vi2ZEsSaiJkNZKe2PTqcBXvEDCeb9LRKWrqUo
	 lnfYpgPNNP/1zQGPPp1EQgXyqRcHOCgCXgcjq+zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4305F805A1; Thu, 15 Aug 2024 14:34:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E506AF805AE;
	Thu, 15 Aug 2024 14:34:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB67F80517; Thu, 15 Aug 2024 14:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 140D3F800B0
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 14:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 140D3F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OEDZBK3U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723723226; x=1755259226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+fvBVhqwVxnnLELp45LxE5B3Ly84i4Yh9U1qnszQeKk=;
  b=OEDZBK3UfpsJrtOTYbSsMxkk7vVIE0lWhGKmi29JrSpkTG62jzKl6wvV
   hxKvYXTc7Xceg0c5IlXhFkTKpKNEGrvSSC0HMAjNPjIZqtc8FE7ywDi4H
   NyFBFhcLc+mlpZkMrINGh7v/9zZ6bTxbuzHetHxTbZbXkAYJhK6x89uL3
   DQbeBhvNIj2VdnDQdrtCv6vSX9u/x2UV9rpX7m7ta8bbmb7LMBYJad2WF
   msp/7VakdePW+NCPfIxn+ifOA72eKc1qQ4LDeYONfHOc+V47Xnca+HA4o
   Mtc/8BmtcjHF0310wK6YzqmsSWxHS4avA7QKFSEYocq3lE9YKj1P93HDF
   w==;
X-CSE-ConnectionGUID: ZI5nNIcbSGG3CIMAMdBFwg==
X-CSE-MsgGUID: +vb8YWLDTAepDiRj1xdFMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22135679"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="22135679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:00:18 -0700
X-CSE-ConnectionGUID: 9pGFL3JARHqhgTEDSbWx6Q==
X-CSE-MsgGUID: FzBAoAyVSieqIx8P4Ogn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="58960860"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2024 05:00:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seZ9J-0003Xg-15;
	Thu, 15 Aug 2024 12:00:13 +0000
Date: Thu, 15 Aug 2024 20:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sebastian Reichel <sre@kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS"
 <alsa-devel@alsa-project.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to yaml
Message-ID: <202408151906.gY9zpl8b-lkp@intel.com>
References: <20240814175129.4027097-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814175129.4027097-1-Frank.Li@nxp.com>
Message-ID-Hash: A2ZGHSO7LAAS7UV5X2GEQLFIKJAMHVLT
X-Message-ID-Hash: A2ZGHSO7LAAS7UV5X2GEQLFIKJAMHVLT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2ZGHSO7LAAS7UV5X2GEQLFIKJAMHVLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc3 next-20240815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/ASoC-dt-bindings-Convert-tpa6130a2-txt-to-yaml/20240815-021426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240814175129.4027097-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to yaml
reproduce: (https://download.01.org/0day-ci/archive/20240815/202408151906.gY9zpl8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151906.gY9zpl8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/tpa6130a2.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
