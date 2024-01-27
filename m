Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BF83EE24
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jan 2024 17:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08817F1;
	Sat, 27 Jan 2024 17:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08817F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706371214;
	bh=hBtf6FLBv/lirHB/qFxQDOfC3/JrgO9F5zuWntBY3Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ivil3jD948s378h3peJyMvW1mSP+ClEt5JkcBgX92hY5ZP0BO7aYW+/gNOv2aYMYC
	 a9fjjkECW14ak5FdjJ+qdnAXgB9eNZUrweIdybi+wuiv7kaBHiC48cOurKiCQ28WX+
	 adcSi0Huw1qoL/yBkpEbrhmVsIWHOFTESPOZ+Myg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE85DF8055B; Sat, 27 Jan 2024 16:59:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34579F8057D;
	Sat, 27 Jan 2024 16:59:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4298F8028D; Sat, 27 Jan 2024 16:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18A1BF800C1
	for <alsa-devel@alsa-project.org>; Sat, 27 Jan 2024 16:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A1BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Gq2NYRlV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706371121; x=1737907121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBtf6FLBv/lirHB/qFxQDOfC3/JrgO9F5zuWntBY3Bo=;
  b=Gq2NYRlVlA+iYC4XrgpS2WLw6V+1fLW53abrSux7kbo1vc4vKWuVCv6W
   cB/CkCeFBjXgLRMVXoGtQIS4fTaEMl+quhNj7JCxiRTCtI9EaSuEBGKpp
   HO8gTR+Yc1Lzw72QWAhjaASUdmSyMFqtIyW37AlJfFT1vdrtBC2GW5Aeh
   8RenNs6/YdWzidM/8IoDNFDUqsOAYAGoNR78cg8jZXmj/Kciuxi28642E
   J+ZbiB2LedYJBmdNvoQVb43J6Ri46fMaeSwJTb+YrxeAOEqFlJvETyufy
   xrs1ohiIRvPUlnddtSgjTCw3JimCY68+vMUiYWsr4z/VOAyq2fU2x0Wil
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="10074281"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="10074281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787406022"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="787406022"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 07:58:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTl4c-0002UU-1g;
	Sat, 27 Jan 2024 15:58:26 +0000
Date: Sat, 27 Jan 2024 23:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/13] fbdev: omapfb: use of_graph_get_next_port()
Message-ID: <202401272336.CCkvpjde-lkp@intel.com>
References: <874jf4ud77.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jf4ud77.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: C3EYNCA2LM46U4YRDYQSW4RU4NW5UDRX
X-Message-ID-Hash: C3EYNCA2LM46U4YRDYQSW4RU4NW5UDRX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3EYNCA2LM46U4YRDYQSW4RU4NW5UDRX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.8-rc1 next-20240125]
[cannot apply to robh/for-next drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-property-add-port-base-loop/20240123-081427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/874jf4ud77.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 11/13] fbdev: omapfb: use of_graph_get_next_port()
config: i386-buildonly-randconfig-003-20240127 (https://download.01.org/0day-ci/archive/20240127/202401272336.CCkvpjde-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272336.CCkvpjde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272336.CCkvpjde-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_init_ports':
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:925:9: error: implicit declaration of function 'of_graph_get_next_port'; did you mean 'of_get_next_parent'? [-Werror=implicit-function-declaration]
     port = of_graph_get_next_port(parent, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~
            of_get_next_parent
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:925:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     port = of_graph_get_next_port(parent, NULL);
          ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:956:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       (port = of_graph_get_next_port(parent, port)) != NULL);
             ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_uninit_ports':
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:972:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     port = of_graph_get_next_port(parent, NULL);
          ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:1003:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     } while ((port = of_graph_get_next_port(parent, port)) != NULL);
                    ^
   cc1: some warnings being treated as errors


vim +925 drivers/video/fbdev/omap2/omapfb/dss/dss.c

   915	
   916	static int dss_init_ports(struct platform_device *pdev)
   917	{
   918		struct device_node *parent = pdev->dev.of_node;
   919		struct device_node *port;
   920		int r, ret = 0;
   921	
   922		if (parent == NULL)
   923			return 0;
   924	
 > 925		port = of_graph_get_next_port(parent, NULL);
   926		if (!port)
   927			return 0;
   928	
   929		if (dss.feat->num_ports == 0)
   930			return 0;
   931	
   932		do {
   933			enum omap_display_type port_type;
   934			u32 reg;
   935	
   936			r = of_property_read_u32(port, "reg", &reg);
   937			if (r)
   938				reg = 0;
   939	
   940			if (reg >= dss.feat->num_ports)
   941				continue;
   942	
   943			port_type = dss.feat->ports[reg];
   944	
   945			switch (port_type) {
   946			case OMAP_DISPLAY_TYPE_DPI:
   947				ret = dpi_init_port(pdev, port);
   948				break;
   949			case OMAP_DISPLAY_TYPE_SDI:
   950				ret = sdi_init_port(pdev, port);
   951				break;
   952			default:
   953				break;
   954			}
   955		} while (!ret &&
   956			 (port = of_graph_get_next_port(parent, port)) != NULL);
   957	
   958		if (ret)
   959			dss_uninit_ports(pdev);
   960	
   961		return ret;
   962	}
   963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
