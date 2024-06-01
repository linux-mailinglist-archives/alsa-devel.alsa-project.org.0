Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434148D6DB1
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jun 2024 05:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85E70868;
	Sat,  1 Jun 2024 05:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85E70868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717212715;
	bh=c7E6ywWcouETEOz7X+m9V6ffY9O9cI6IapgRWonAuyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQZLof0dETPbewFHzkmtkFgByH12hxK2n1+McT+mhp4Vf/fFjTDZJUGI+6n8drehf
	 l+ZUXECMbeuXVhnorp5wMyejFs2Ik+n2TkHh5obzLD5bjCBoBRFcRlwAT6Yn1CM8ix
	 nW4ASMdL/rh1c+RIA9yd+EcyAhmRF9vHHPRm5Nkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E22AEF805B0; Sat,  1 Jun 2024 05:31:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95751F80588;
	Sat,  1 Jun 2024 05:31:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 599EAF8047C; Sat,  1 Jun 2024 05:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626CAF800AC
	for <alsa-devel@alsa-project.org>; Sat,  1 Jun 2024 05:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626CAF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ThmMhsIc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717211695; x=1748747695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c7E6ywWcouETEOz7X+m9V6ffY9O9cI6IapgRWonAuyw=;
  b=ThmMhsIcZ4kJwEFh6pztqPiK395xkjvq+qErlJ/49cz7Zbr3GxdOUEjN
   j2mWngC9Q89YygrYPiQol17cOyP19TaWCWOlo91q3HMYI866TAjWrUFST
   RhWBwex4Q66LIKCOeM073Zf1KKSp0eTe4qXxJY/PsEbc7OkZ6meN9QdqP
   VSsjILhGSsvfiSklCgbXS7wI1LgpOwrY9n4qVTFsRmo/+Z1t8an8NIlxX
   zWb5q7w7eppByI7+4tDSdbGGYuxkCWWY3VOyj1SEBNnY91SJAY3D8m3xj
   pkAuofiNKAI9JOhWi32XX7Hl5HfZLU0AuBigLKdRJgDvOHGC94dewlxel
   w==;
X-CSE-ConnectionGUID: kKIebR53Qvig5bK7ZubaGA==
X-CSE-MsgGUID: UwCOvHBFRFa6tpblM1jN9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24431274"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000";
   d="scan'208";a="24431274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 20:14:42 -0700
X-CSE-ConnectionGUID: l2xz+gaVQ1Sp7xFZjbApEA==
X-CSE-MsgGUID: n7Eg6RluRgSRmWmZVdk4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000";
   d="scan'208";a="73824285"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 20:14:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDFCV-000IGn-2o;
	Sat, 01 Jun 2024 03:14:35 +0000
Date: Sat, 1 Jun 2024 11:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>, tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, soyer@irl.hu, shenghao-ding@ti.com,
	kevin-lu@ti.com, baojun.xu@ti.com, kailang@realtek.com,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH 4/7] ALSA: hda: hda_component: Introduce component parent
 structure
Message-ID: <202406011025.mzDXJJjz-lkp@intel.com>
References: <20240531151409.80284-5-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531151409.80284-5-simont@opensource.cirrus.com>
Message-ID-Hash: PTW2WPKVLPFGEBDZCYOLDLJE47R7ZUWT
X-Message-ID-Hash: PTW2WPKVLPFGEBDZCYOLDLJE47R7ZUWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTW2WPKVLPFGEBDZCYOLDLJE47R7ZUWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Component-should-be-unbound-before-deconstruction/20240531-231828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240531151409.80284-5-simont%40opensource.cirrus.com
patch subject: [PATCH 4/7] ALSA: hda: hda_component: Introduce component parent structure
config: arm64-randconfig-001-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011025.mzDXJJjz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011025.mzDXJJjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011025.mzDXJJjz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/hda_component.c: In function 'hda_component_manager_bind':
>> sound/pci/hda/hda_component.c:140:33: warning: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     140 |         memset(parent, 0, sizeof(parent));
         |                                 ^


vim +140 sound/pci/hda/hda_component.c

   133	
   134	int hda_component_manager_bind(struct hda_codec *cdc,
   135				       struct hda_component_parent *parent)
   136	{
   137		int i;
   138	
   139		/* Init shared and component specific data */
 > 140		memset(parent, 0, sizeof(parent));
   141		for (i = 0; i < ARRAY_SIZE(parent->comps); i++)
   142			parent->comps[i].codec = cdc;
   143	
   144		return component_bind_all(hda_codec_dev(cdc), &parent->comps);
   145	}
   146	EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
