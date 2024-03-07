Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4D8748DE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 08:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2D83E8;
	Thu,  7 Mar 2024 08:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2D83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709797076;
	bh=O6r2yIkqMTx2clPrK+gabO6lpARf5VJGxJDcdwImDKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJ4VxmOO7bRJRL3adGC7Zcxj7oAA+Am8CSIY4XbhPkip0qw67ui4a34ifZ+eMc1sk
	 nnSI3joYlrlnKplxvHytdY4RE+DTHf0txuud6jDbRTFTs5+sb+SEe/p1CMzHCnUJx8
	 Qjmp+yhDrLUgm0UEJ8KDRZ3BwxJNk+LPppwKw+nc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 100B3F80088; Thu,  7 Mar 2024 08:37:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F970F80088;
	Thu,  7 Mar 2024 08:37:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC066F8024E; Thu,  7 Mar 2024 08:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EEFCF8014B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 08:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEFCF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BBkC9jfG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709796959; x=1741332959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6r2yIkqMTx2clPrK+gabO6lpARf5VJGxJDcdwImDKY=;
  b=BBkC9jfGjY9aUzyDX2xpjO7Z8EiXiJvC+cKCQ42DMtoxdbqbE4QDgZ+M
   /zJ7izvlWAH1fOHr3xrMQDDT43oxAXYZLwxCBGnuO4az5YQtla8XgyN5E
   xXOW+mvY1FoZJyQg+gD0JhEYHFSW4+NaxMiQ27QSyiPX2JilgaHLwMnId
   2Xo1cEwsIAi7XOM2kocuTF9HWnL71gux1BkmQIdJlylMQwvkXYc9Kr9a5
   XHZkg5FrvJKDdazkbxJOG4+zLPDEnKXn3f4rm0NsWi2CxiepXDMjpxD43
   S4W/5/wYRl1ozQAgB464QwF/TEdK9n26Qxu1AdKqQjdSxZb/i3Iq9/xoZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4334679"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000";
   d="scan'208";a="4334679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 23:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000";
   d="scan'208";a="10189893"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2024 23:35:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri8I6-0004x5-0u;
	Thu, 07 Mar 2024 07:35:46 +0000
Date: Thu, 7 Mar 2024 15:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-imx@nxp.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 3/4] ASoC: fsl: Let imx-audio-rpmsg register platform
 device for card
Message-ID: <202403071501.Bo3vcFpu-lkp@intel.com>
References: <20240306075510.535963-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306075510.535963-4-chancel.liu@nxp.com>
Message-ID-Hash: YWB5VJUODEY2WYX373D5S6H3JJZECD4V
X-Message-ID-Hash: YWB5VJUODEY2WYX373D5S6H3JJZECD4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWB5VJUODEY2WYX373D5S6H3JJZECD4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Chancel,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on broonie-sound/for-next linus/master v6.8-rc7 next-20240306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chancel-Liu/ASoC-fsl-imx_pcm_rpmsg-Register-component-with-rpmsg-channel-name/20240306-155945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240306075510.535963-4-chancel.liu%40nxp.com
patch subject: [PATCH 3/4] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403071501.Bo3vcFpu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071501.Bo3vcFpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071501.Bo3vcFpu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/fsl/imx-audio-rpmsg.c: In function 'imx_audio_rpmsg_probe':
>> sound/soc/fsl/imx-audio-rpmsg.c:107:17: error: label 'fail' used but not defined
     107 |                 goto fail;
         |                 ^~~~


vim +/fail +107 sound/soc/fsl/imx-audio-rpmsg.c

    74	
    75	static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
    76	{
    77		struct imx_audio_rpmsg *data;
    78		int ret = 0;
    79	
    80		dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
    81			 rpdev->src, rpdev->dst);
    82	
    83		data = devm_kzalloc(&rpdev->dev, sizeof(*data), GFP_KERNEL);
    84		if (!data)
    85			return -ENOMEM;
    86	
    87		dev_set_drvdata(&rpdev->dev, data);
    88	
    89		/* Register platform driver for rpmsg routine */
    90		data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
    91								 rpdev->id.name,
    92								 PLATFORM_DEVID_NONE,
    93								 NULL, 0);
    94		if (IS_ERR(data->rpmsg_pdev)) {
    95			dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
    96			ret = PTR_ERR(data->rpmsg_pdev);
    97		}
    98	
    99		data->card_pdev = platform_device_register_data(&rpdev->dev,
   100								"imx-audio-rpmsg",
   101								PLATFORM_DEVID_AUTO,
   102								rpdev->id.name,
   103								strlen(rpdev->id.name));
   104		if (IS_ERR(data->card_pdev)) {
   105			dev_err(&rpdev->dev, "failed to register rpmsg card.\n");
   106			ret = PTR_ERR(data->card_pdev);
 > 107			goto fail;
   108		}
   109	
   110		return ret;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
