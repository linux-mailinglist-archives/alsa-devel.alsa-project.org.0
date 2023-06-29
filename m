Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F59B742B9C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 19:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F03D7F1;
	Thu, 29 Jun 2023 19:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F03D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688061427;
	bh=tAe8b3Y2N2c/CF0N5VJ0ZeJJ8Xk+NpiLktx+rX7DAW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eZGNf+7NhOeoAeGikZcXP8hNAD7z32rky9sBFh+wgWY+/Uz+38yKZvxfEjNfsHJvh
	 kowu8voQ6RsFoHqThTsjcOMkhcIyV9ctxspN6wdyIwtjCLf0t6KCRV3syA3KvvnUQ0
	 2Yx42KcJsc4VMRDd8JtfNoH1rgLToD2n7lEX8iB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B7EBF80535; Thu, 29 Jun 2023 19:56:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D882F80212;
	Thu, 29 Jun 2023 19:56:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B6CF80246; Thu, 29 Jun 2023 19:56:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C4B9F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 19:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4B9F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KL2eyi0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688061368; x=1719597368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tAe8b3Y2N2c/CF0N5VJ0ZeJJ8Xk+NpiLktx+rX7DAW0=;
  b=KL2eyi0srgnvkqNcfHKYEmHC5M+vgd6Jt6/0rZA2veB9FXKHvqQlnM8D
   4gUy76T9CMs6fivFwCSibBVSRQ5vjjLcmlXiZzUfvuZgpORiedN6lCgr6
   a9tjyO7Sgsl85LnXMtGqulAOt4TQIGb8hv1mctm2CLO3456sHSKLgA/Of
   tJ/DLyose3PJ60aVlMYUd5DNwv9jkeB4MIOix0fze/xv/5PeNY3VCsehE
   FQlJjnLlC4XkntmdfyVJ+QPj5SPdU9xB9j/3tBM6wipcHlQ1fL+AHteaE
   +7naaGE/oRMRpNbS6VXG/ckiXBdSCRAKgDz6rL7JdqxHqO3NT11yySX1G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392906217"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="392906217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 10:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="862013530"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200";
   d="scan'208";a="862013530"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 10:55:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEvri-000EJ9-1y;
	Thu, 29 Jun 2023 17:55:34 +0000
Date: Fri, 30 Jun 2023 01:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/3] ASoC: rt5677: Use agnostic
 irq_domain_create_linear()
Message-ID: <202306300102.yMAJ3kZt-lkp@intel.com>
References: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
Message-ID-Hash: BVR5GKFJW6Q5AVP77X7TMDRDP3POKA7J
X-Message-ID-Hash: BVR5GKFJW6Q5AVP77X7TMDRDP3POKA7J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVR5GKFJW6Q5AVP77X7TMDRDP3POKA7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-rt5677-Use-agnostic-irq_domain_create_linear/20230629-184911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230629104603.88612-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/3] ASoC: rt5677: Use agnostic irq_domain_create_linear()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230630/202306300102.yMAJ3kZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300102.yMAJ3kZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300102.yMAJ3kZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/acpi.h:16,
                    from sound/soc/codecs/rt5677.c:9:
   sound/soc/codecs/rt5677.c: In function 'rt5677_init_irq':
>> include/linux/property.h:38:18: error: '_Generic' selector of type 'struct device' is not compatible with any association
      38 |         _Generic((dev),                                                 \
         |                  ^
   sound/soc/codecs/rt5677.c:5542:51: note: in expansion of macro 'dev_fwnode'
    5542 |         rt5677->domain = irq_domain_create_linear(dev_fwnode(i2c->dev),
         |                                                   ^~~~~~~~~~


vim +38 include/linux/property.h

1b9863c6aa56d9 Suthikulpanit, Suravee 2015-10-28  34  
b295d484b97081 Andy Shevchenko        2022-10-04  35  const struct fwnode_handle *__dev_fwnode_const(const struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  36  struct fwnode_handle *__dev_fwnode(struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  37  #define dev_fwnode(dev)							\
b295d484b97081 Andy Shevchenko        2022-10-04 @38  	_Generic((dev),							\
b295d484b97081 Andy Shevchenko        2022-10-04  39  		 const struct device *: __dev_fwnode_const,	\
b295d484b97081 Andy Shevchenko        2022-10-04  40  		 struct device *: __dev_fwnode)(dev)
e44bb0cbdc8868 Sakari Ailus           2017-03-28  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
