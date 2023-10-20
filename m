Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F17D1931
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 00:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6040B836;
	Sat, 21 Oct 2023 00:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6040B836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697841170;
	bh=ktERwyBLEExIXBgzNyFt6G5y7R4k1hF6zHPNDQ9AZUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TAdiiNjZ4o/S5w8GuMxrVNPgYtFAQu68hF0H0irqSjPwt176AOUxrvV8OVgw9aO6i
	 2B1aK4tlzL9OtHijqwj5sMjYxuphQkNWytrmbb+ky486EIKwn8e9r7za1sjDKvCp3+
	 PNAXJjKBTH+sZHB+ZgqnFzb9ujhFYIU0iHMHDVQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97414F80166; Sat, 21 Oct 2023 00:31:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DB6F8024E;
	Sat, 21 Oct 2023 00:31:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E3E8F8025F; Sat, 21 Oct 2023 00:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF4DCF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 00:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4DCF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UdJdutxG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697841104; x=1729377104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ktERwyBLEExIXBgzNyFt6G5y7R4k1hF6zHPNDQ9AZUk=;
  b=UdJdutxGrz0VRVeWCI0FlIFCVp8x6cuy8uHamDermTDt6f6xFk0CdUAO
   NNmnMeUv9xF6uYU4VNoYBY0cneRbMCuN5oUONY5eOFr6COFVHyMfs7P86
   wjGU0FfAXrRk7DbWkE0Bbce816Ooh5I93rgtkr5DGDV9wVM+CjrDXL07I
   gf4Cg7bGdNieR+M9tjX3gfRL4WnjrwGWdvQ+GA08uaA1r1PwaZw2ryCKx
   gIRTUKOh5YxxFlbtBzq7iV46w/5PHwaA2gsMncmqU4gX7yacs1Z2na6hu
   roM3pSZoZShCBwCbBGbulY5z7ISE2G9rpNV1QB2qIl3SlHcXpyUkhydu6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450813633"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="450813633"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 15:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827864456"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="827864456"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2023 15:31:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qty1i-000438-1S;
	Fri, 20 Oct 2023 22:31:30 +0000
Date: Sat, 21 Oct 2023 06:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93: Add audio device nodes
Message-ID: <202310210636.dtEPMrF8-lkp@intel.com>
References: <20231010133838.799714-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010133838.799714-2-chancel.liu@nxp.com>
Message-ID-Hash: UH3QO4SZE7MI33LZ5BAC443CNHJYY44M
X-Message-ID-Hash: UH3QO4SZE7MI33LZ5BAC443CNHJYY44M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UH3QO4SZE7MI33LZ5BAC443CNHJYY44M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Chancel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on broonie-sound/for-next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chancel-Liu/arm64-dts-imx93-Add-audio-device-nodes/20231010-214443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231010133838.799714-2-chancel.liu%40nxp.com
patch subject: [PATCH v2 1/3] arm64: dts: imx93: Add audio device nodes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231021/202310210636.dtEPMrF8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210636.dtEPMrF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210636.dtEPMrF8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
