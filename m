Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E97AD9FC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EF2DEB;
	Mon, 25 Sep 2023 16:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EF2DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651798;
	bh=dFBkREyUEOoJo/7sr+HgtlYEdliPsXp958T+5A/8gS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aHqUBPyLswLy41WmwD6T4uEvoGhbkVRlBfC4lT/SVSTGeecQb7rOaa5uy1iPZCvah
	 /531U+11mnIGqWgdvqkmpXJcJac9JklkAduPVyaZLx2etBZgpkA57OU3LCooInO8Bf
	 w12nL54AFO92WegYcOStf+/Y/nFIMrYyc33GFJhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F54CF8047D; Mon, 25 Sep 2023 16:22:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C002DF80166;
	Mon, 25 Sep 2023 16:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A10EF8016A; Mon, 25 Sep 2023 16:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AA66F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA66F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TdvD0ZzH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651741; x=1727187741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFBkREyUEOoJo/7sr+HgtlYEdliPsXp958T+5A/8gS4=;
  b=TdvD0ZzHAjEO7rok7WInEGfSVCzBctmL3qPHotB4Hx7PFXAxB7+ceE9U
   VZq+oVVmxkGX+vwPijjWN5MmcvZyI6sCZrjfgTmAW9FepKqbFZtuogoQJ
   Wv0g2XPtf+EggwDixa1T2YOQbxQSOqBID5j5W4XZRCfsVw9U4vNS8gvWO
   W3Kyjb+8IjqvT6hfJjYU1YuUbmmXDyh3u9/VPOaO7EkAiEOP8OFiwVVrd
   j8PIsaQ5jW8FEI0sJPU/9uoEruAGt2IN5qkNd8hHHaHQ+WrvOTlNnnGda
   mKhwtE8DEw5S6CnRAMhUPh/fI1eBayckGHq5luX/ocSGlHIfgKn3V/rxW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371583815"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="371583815"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777664327"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="777664327"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2023 07:22:14 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkmTU-0001Zj-08;
	Mon, 25 Sep 2023 14:22:12 +0000
Date: Mon, 25 Sep 2023 22:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 2/4] ALSA: hda: Introduce HOST stream setup mechanism
Message-ID: <202309252200.gnjksNmD-lkp@intel.com>
References: <20230925115844.18795-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925115844.18795-3-cezary.rojewski@intel.com>
Message-ID-Hash: QSIB6QZWNYWHT5YE6QLPQONIRUUCTXHM
X-Message-ID-Hash: QSIB6QZWNYWHT5YE6QLPQONIRUUCTXHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSIB6QZWNYWHT5YE6QLPQONIRUUCTXHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-hda-Poll-SDxFIFOS-after-programming-SDxFMT/20230925-200351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230925115844.18795-3-cezary.rojewski%40intel.com
patch subject: [PATCH 2/4] ALSA: hda: Introduce HOST stream setup mechanism
config: x86_64-buildonly-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252200.gnjksNmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252200.gnjksNmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252200.gnjksNmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/ext/hdac_ext_stream.c:28: warning: Function parameter or member 'hext_stream' not described in 'snd_hdac_ext_host_stream_setup'
>> sound/hda/ext/hdac_ext_stream.c:41: warning: Function parameter or member 'hstream' not described in 'snd_hdac_apl_host_stream_setup'


vim +28 sound/hda/ext/hdac_ext_stream.c

    20	
    21	/**
    22	 * snd_hdac_ext_host_stream_setup - Setup a HOST stream.
    23	 * @hext_stream - HDAudio stream to set up.
    24	 *
    25	 * Return: Zero on success or negative error code.
    26	 */
    27	int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream)
  > 28	{
    29		return hext_stream->host_setup(hdac_stream(hext_stream));
    30	}
    31	EXPORT_SYMBOL_GPL(snd_hdac_ext_host_stream_setup);
    32	
    33	/**
    34	 * snd_hdac_apl_host_stream_setup - Setup a HOST stream following procedure
    35	 *                                  recommended for ApolloLake devices.
    36	 * @hstream - HDAudio stream to set up.
    37	 *
    38	 * Return: Zero on success or negative error code.
    39	 */
    40	static int snd_hdac_apl_host_stream_setup(struct hdac_stream *hstream)
  > 41	{
    42		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
    43		int ret;
    44	
    45		snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, false);
    46		ret = snd_hdac_stream_setup(hstream);
    47		snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, true);
    48	
    49		return ret;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
