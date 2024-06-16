Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417F909F78
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 21:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808D4843;
	Sun, 16 Jun 2024 21:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808D4843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718564948;
	bh=jAUV2fkaJUOuqukFImg27JopNhskZOQjkb5WpZ7dnXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RWiFmkwoZKNzmtcp7A5yHESeSHS6yXduD/mn2D3jw+ADTclnmyQ6LKebcr6wF00tP
	 3N666HriLWl2FMIkLP1Uya38LM7fuA9+XRvfltPD7aUAjya7WR+t3s1c0rqTqYOAAI
	 tb4mlV9K0omZdXkDD7UiHS8EX2sueIlKlgddPDlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E198F805A8; Sun, 16 Jun 2024 21:08:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD870F80588;
	Sun, 16 Jun 2024 21:08:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8582F8023A; Sun, 16 Jun 2024 21:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 655A4F80154
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 21:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655A4F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PLMpEBmW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718564921; x=1750100921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jAUV2fkaJUOuqukFImg27JopNhskZOQjkb5WpZ7dnXI=;
  b=PLMpEBmWljqef38ESEi8zkp8UKN5Y41WVOdbwczQiDEU3vtXwgk+KE0H
   3aQ8reXrP+HmzxzzUN8rMfYSIQQ5aCkfsz1B+ClODxyIndYc9RYFG8Gjm
   s2gMFiE4XCKTN4feDrf6jKwPcoImVOYuOHCL7Wt344kjuP1RdqBmaO6oX
   OEwWQxtUt6WndW1t92Pw9p+xy/dxsIjdceTWEntL/vIKRQw+lwcQjQsyr
   YDRh3V6PxyRDDLXKOZWG0J9JQzQo86OB2gVbgh2sBtex10CiAjGweBPoy
   biKIKzmreI2NCXweCvnsc0IwA8bc0nrp/WI3djJGG6Q5ozckWkJxE7ywQ
   g==;
X-CSE-ConnectionGUID: PwyYVtKJQuq2ioFejzOD9g==
X-CSE-MsgGUID: C8YpOvu7Q7OtrHdiK9WMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32866478"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000";
   d="scan'208";a="32866478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 12:08:35 -0700
X-CSE-ConnectionGUID: s69HtPn/S02F75KT9lBZwA==
X-CSE-MsgGUID: 3wULYVdJRtiEZ2VnXSxS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000";
   d="scan'208";a="40937455"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 12:08:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIvEs-0003Ay-1n;
	Sun, 16 Jun 2024 19:08:30 +0000
Date: Mon, 17 Jun 2024 03:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Vadhavana <av2082000@gmail.com>, srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com, skhan@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org, av2082000@gmail.com
Subject: Re: [PATCH] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <202406170201.Zh53W56G-lkp@intel.com>
References: <20240616154531.38232-1-av2082000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616154531.38232-1-av2082000@gmail.com>
Message-ID-Hash: RHR226NCASIXKKFG2MJKJT3TNI2AQCOS
X-Message-ID-Hash: RHR226NCASIXKKFG2MJKJT3TNI2AQCOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHR226NCASIXKKFG2MJKJT3TNI2AQCOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Vadhavana/slimbus-Fix-struct-and-documentation-alignment-in-stream-c/20240616-234811
base:   linus/master
patch link:    https://lore.kernel.org/r/20240616154531.38232-1-av2082000%40gmail.com
patch subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
config: arm-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170201.Zh53W56G-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170201.Zh53W56G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170201.Zh53W56G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/slimbus/stream.c:22:1: warning: 'static' ignored on this declaration [-Wmissing-declarations]
      22 | static const struct segdist_code {
         | ^
>> drivers/slimbus/stream.c:22:8: warning: 'const' ignored on this declaration [-Wmissing-declarations]
      22 | static const struct segdist_code {
         |        ^
   2 warnings generated.


vim +/static +22 drivers/slimbus/stream.c

abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  11  
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  12  /**
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  13   * struct segdist_code - Segment Distributions code from
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  14   *	Table 20 of SLIMbus Specs Version 2.0
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  15   *
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  16   * @ratem: Channel Rate Multipler(Segments per Superframe)
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  17   * @seg_interval: Number of slots between the first Slot of Segment
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  18   *		and the first slot of the next  consecutive Segment.
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  19   * @segdist_code: Segment Distribution Code SD[11:0]
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  20   * @seg_offset_mask: Segment offset mask in SD[11:0]
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  21   */
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05 @22  static const struct segdist_code {
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  23  	int ratem;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  24  	int seg_interval;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  25  	int segdist_code;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  26  	u32 seg_offset_mask;
abb9c9b8b51ba5 Srinivas Kandagatla 2018-07-05  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
