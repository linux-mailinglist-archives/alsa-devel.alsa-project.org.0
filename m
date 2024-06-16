Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A20909F52
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 20:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC33A4B;
	Sun, 16 Jun 2024 20:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC33A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718563648;
	bh=tLd7mS6bPJCicOINSMGFRmf6Hzbsirhin6FWdqKp3bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VZzsVzT4Dud6HyACi1lZqip/ND9Cd3r5K24q7zuDyO6mP85iRoilD6jy8sul5O9eb
	 eawhjg7Gb/+3gHH2XdcpVmzN1PYKu1pIOV7jjEPEZMlX5MN+sEmodrCCEIXH2uS9Lj
	 ErQ/HvoFUrganzYOS0p2x5G4pl7Y+dDSNfUBzQt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DD00F805B0; Sun, 16 Jun 2024 20:46:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2AA7F805AF;
	Sun, 16 Jun 2024 20:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF56F8023A; Sun, 16 Jun 2024 20:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 395D8F800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 20:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395D8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d2P8SNua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718563600; x=1750099600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLd7mS6bPJCicOINSMGFRmf6Hzbsirhin6FWdqKp3bk=;
  b=d2P8SNuakHZZhsSj/JhplZzaHvffhP38ud3H3ahvq5IFeTjSXXeD43El
   JGrk+0euJtMEEfojLYJ+BOaUmHoUjRI6v5C+amjdyTKnoZYP7uhaH13U2
   kZ5cOq0SGkIkFJIMZ9fNoLg7t2R3qDqvsm0brZjVLec0VHroEJXNkj4Pe
   JOYQe1bNGT7xaIUpqF/7RShnfCipGSXOIrsoC9YvJMjEnGhbF6EWNNraw
   SqyylP/vTyfAVb5f+/EXLN+I/ML3XvbJR3XBNx77XewFvtJkLB/7P3yQ8
   TiXI8Fiewc7QZHJLgNcT4YpQi6ahwS6U+VjpvkFojXpGUnpzlv01JAOeH
   w==;
X-CSE-ConnectionGUID: KHeV6OaJSRWxx+Mmt5NZiw==
X-CSE-MsgGUID: scwTiZHwSCOEl8b8Ngegpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37917623"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000";
   d="scan'208";a="37917623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 11:46:34 -0700
X-CSE-ConnectionGUID: 6sKTfiJsQBqIZ6eWJZm/CA==
X-CSE-MsgGUID: Mp/rJAFEQqSKXh14liab6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000";
   d="scan'208";a="72209287"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 11:46:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIuta-0003AI-0i;
	Sun, 16 Jun 2024 18:46:30 +0000
Date: Mon, 17 Jun 2024 02:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Vadhavana <av2082000@gmail.com>, srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org, av2082000@gmail.com
Subject: Re: [PATCH] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <202406170228.1TcJ2eGD-lkp@intel.com>
References: <20240616154531.38232-1-av2082000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616154531.38232-1-av2082000@gmail.com>
Message-ID-Hash: XNZDGDCBPBCE64UOPWRRMFGRHIDNO5XX
X-Message-ID-Hash: XNZDGDCBPBCE64UOPWRRMFGRHIDNO5XX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNZDGDCBPBCE64UOPWRRMFGRHIDNO5XX/>
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
[also build test WARNING on v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Vadhavana/slimbus-Fix-struct-and-documentation-alignment-in-stream-c/20240616-234811
base:   linus/master
patch link:    https://lore.kernel.org/r/20240616154531.38232-1-av2082000%40gmail.com
patch subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
config: arc-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170228.1TcJ2eGD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170228.1TcJ2eGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170228.1TcJ2eGD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/slimbus/stream.c:28:1: warning: useless storage class specifier in empty declaration
      28 | };
         | ^


vim +28 drivers/slimbus/stream.c

    11	
    12	/**
    13	 * struct segdist_code - Segment Distributions code from
    14	 *	Table 20 of SLIMbus Specs Version 2.0
    15	 *
    16	 * @ratem: Channel Rate Multipler(Segments per Superframe)
    17	 * @seg_interval: Number of slots between the first Slot of Segment
    18	 *		and the first slot of the next  consecutive Segment.
    19	 * @segdist_code: Segment Distribution Code SD[11:0]
    20	 * @seg_offset_mask: Segment offset mask in SD[11:0]
    21	 */
    22	static const struct segdist_code {
    23		int ratem;
    24		int seg_interval;
    25		int segdist_code;
    26		u32 seg_offset_mask;
    27	
  > 28	};
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
