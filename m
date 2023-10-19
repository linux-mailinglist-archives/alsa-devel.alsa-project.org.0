Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F967CF1FB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 10:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B572857;
	Thu, 19 Oct 2023 10:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B572857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697702787;
	bh=el3R2q8bJhLS09Xe5Rkf62rAafB0MmVgXTxS+XNrHKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XZlrp6bfGv/hnFIUzeN0wSMcKgApe0gEJ/oRVl91QsxtAhchA6qvI1bddm9UQWibH
	 nEYH4fV42mxTaQ2LBvq8snwX5qeMwlLaVOgs73qnwWHchYv7Sfpa8twspBUE8o4DB0
	 3/kYX6Hu8O+/KmxYfqGGn6bh0ZTTO0+zBxDB8dYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B672AF800C9; Thu, 19 Oct 2023 10:05:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27283F8019B;
	Thu, 19 Oct 2023 10:05:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C237BF8024E; Thu, 19 Oct 2023 10:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E472F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 10:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E472F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e2b7c9hR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697702589; x=1729238589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=el3R2q8bJhLS09Xe5Rkf62rAafB0MmVgXTxS+XNrHKM=;
  b=e2b7c9hRvIsGBnUJKOpX13W0HijrQr9KwysXTd/DDx7Qx6T+m8fsdYAP
   aPH4R+k/hCaGCxpmfwd4+SHbJaLLAQouEKRXw2QQiE+O+57xKLZwvVnbk
   u7v8xmgpDiGiYDl2ky4PTv3cBERkpTkSWT2b5++adaBx2UqoWBr0V00+5
   6a3QYkwpuVSBT8rm429NRVioj8xSH07B6G/sFBu5LXinpNBKg9xW5VS/l
   UOIpYSeId3s902dNBaRoylo8ppV643Y9UcGi59GrqDNJzQHttje/FWkPa
   d/+nTEB/N3Uuert/WmdWQXAb/pcftit+9dR3nsqayUwDrEI8mrjnLkaX2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452665939"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200";
   d="scan'208";a="452665939"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 01:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="750427438"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200";
   d="scan'208";a="750427438"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 01:03:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtNzd-0001qW-1u;
	Thu, 19 Oct 2023 08:02:57 +0000
Date: Thu, 19 Oct 2023 16:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Julien Massot <julien.massot@iot.bzh>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Glass <sjg@chromium.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory
 bindings
Message-ID: <202310191537.20z1Aolb-lkp@intel.com>
References: <20231013200851.347042-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
Message-ID-Hash: SQDES3A2FOFSRZWOEEUDQU3DCKGGRVG3
X-Message-ID-Hash: SQDES3A2FOFSRZWOEEUDQU3DCKGGRVG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQDES3A2FOFSRZWOEEUDQU3DCKGGRVG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk-dt/for-next remoteproc/rproc-next broonie-sound/for-next linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/dt-bindings-Drop-kernel-copy-of-common-reserved-memory-bindings/20231017-125913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231013200851.347042-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory bindings
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310191537.20z1Aolb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191537.20z1Aolb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191537.20z1Aolb-lkp@intel.com/

All errors (new ones prefixed by >>):

   sort: -:2: disorder: 2023.8.dev2+gd5e5147
>> ERROR: dtschema minimum version is v2023.9

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
