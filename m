Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3DD842640
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 14:37:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33166E76;
	Tue, 30 Jan 2024 14:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33166E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706621824;
	bh=8oAMdxYBFetttydjmWPCSo5s+7Jc7Mw7JFAbAL32jwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vec0Om/pg13V8Sg65EA63E0xzN3iQNPl1fRMtekT5BfUEuySOOl/DGxNKsSUmVhRs
	 QcxH2XvkDbRBX0oEsdftH4d3VpkmMGNgUFpKlYnHIj5JwAWsEXc9ho9aVoqQ5kNBj0
	 uvMemsbGa02nUm9pK2xJoRmkUmpGsJeI3e9T4pWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B690F8059F; Tue, 30 Jan 2024 14:36:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B971F80580;
	Tue, 30 Jan 2024 14:36:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71E3CF8055C; Tue, 30 Jan 2024 14:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59736F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 14:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59736F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gyRomaTx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706621772; x=1738157772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8oAMdxYBFetttydjmWPCSo5s+7Jc7Mw7JFAbAL32jwk=;
  b=gyRomaTxPUyTC90uNI0B5TNJTBqRozc6LV9w0z6EHtd7j3UGzHI2GZ5a
   +qMuzMUriQ6m7Kxti0cLqYuSqIut7/NSUKCHzAGAY4JQcW+EJAxUGOXQU
   +QGPB15FYw2OgR7B0YB95V1i2vLOENIp7OfYibB/QSFlbXQonz2xFNVT8
   KRyIDCnbg+w6gJs+R3sBDm6VpkGkQWfoXYK+pfFgBxTrrdZRPkBhpDp1z
   EzvZA9DvR/qCBOINcZvRlbhp96+232///JedqOdz1Py7BsKGhoNpyKpll
   EZwEW1Xej3fJ2ak/Y2Orv7aj8l0RcWGd2XZURmGyXOcLB+9ayMrnwGzaK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402907068"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="402907068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 05:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="3705399"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2024 05:36:03 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUoHN-0000L2-2t;
	Tue, 30 Jan 2024 13:35:58 +0000
Date: Tue, 30 Jan 2024 21:35:46 +0800
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
Subject: Re: [PATCH v2 05/13] media: xilinx-tpg: use
 of_graph_get_next_endpoint_raw()
Message-ID: <202401302148.K0ZR110q-lkp@intel.com>
References: <878r49klg1.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r49klg1.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 6DOXKMBW27BSHLPBBCMJCNVMH2RGOFVY
X-Message-ID-Hash: 6DOXKMBW27BSHLPBBCMJCNVMH2RGOFVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DOXKMBW27BSHLPBBCMJCNVMH2RGOFVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Kuninori,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on drm-misc/drm-misc-next linus/master v6.8-rc2 next-20240130]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-property-add-port-base-loop/20240129-085726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/878r49klg1.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v2 05/13] media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
config: mips-randconfig-r113-20240130 (https://download.01.org/0day-ci/archive/20240130/202401302148.K0ZR110q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240130/202401302148.K0ZR110q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302148.K0ZR110q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-tpg.c:747:15: error: implicit declaration of function 'of_graph_get_next_endpoint_raw' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           endpoint = of_graph_get_next_endpoint_raw(port, NULL);
                                      ^
   drivers/media/platform/xilinx/xilinx-tpg.c:747:15: note: did you mean 'acpi_graph_get_next_endpoint'?
   include/linux/acpi.h:1409:1: note: 'acpi_graph_get_next_endpoint' declared here
   acpi_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
   ^
>> drivers/media/platform/xilinx/xilinx-tpg.c:747:13: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
                           endpoint = of_graph_get_next_endpoint_raw(port, NULL);
                                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/of_graph_get_next_endpoint_raw +747 drivers/media/platform/xilinx/xilinx-tpg.c

   705	
   706	/* -----------------------------------------------------------------------------
   707	 * Platform Device Driver
   708	 */
   709	
   710	static int xtpg_parse_of(struct xtpg_device *xtpg)
   711	{
   712		struct device *dev = xtpg->xvip.dev;
   713		struct device_node *node = xtpg->xvip.dev->of_node;
   714		struct device_node *ports;
   715		struct device_node *port;
   716		unsigned int nports = 0;
   717		bool has_endpoint = false;
   718	
   719		ports = of_get_child_by_name(node, "ports");
   720		if (ports == NULL)
   721			ports = node;
   722	
   723		for_each_child_of_node(ports, port) {
   724			const struct xvip_video_format *format;
   725			struct device_node *endpoint;
   726	
   727			if (!of_node_name_eq(port, "port"))
   728				continue;
   729	
   730			format = xvip_of_get_format(port);
   731			if (IS_ERR(format)) {
   732				dev_err(dev, "invalid format in DT");
   733				of_node_put(port);
   734				return PTR_ERR(format);
   735			}
   736	
   737			/* Get and check the format description */
   738			if (!xtpg->vip_format) {
   739				xtpg->vip_format = format;
   740			} else if (xtpg->vip_format != format) {
   741				dev_err(dev, "in/out format mismatch in DT");
   742				of_node_put(port);
   743				return -EINVAL;
   744			}
   745	
   746			if (nports == 0) {
 > 747				endpoint = of_graph_get_next_endpoint_raw(port, NULL);
   748				if (endpoint)
   749					has_endpoint = true;
   750				of_node_put(endpoint);
   751			}
   752	
   753			/* Count the number of ports. */
   754			nports++;
   755		}
   756	
   757		if (nports != 1 && nports != 2) {
   758			dev_err(dev, "invalid number of ports %u\n", nports);
   759			return -EINVAL;
   760		}
   761	
   762		xtpg->npads = nports;
   763		if (nports == 2 && has_endpoint)
   764			xtpg->has_input = true;
   765	
   766		return 0;
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
