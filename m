Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28683C7F6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 17:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813EF741;
	Thu, 25 Jan 2024 17:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813EF741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706200152;
	bh=CKkmBUyrGKT7WEXHgCcuZ9+Ns5iuzV63djC+5Ja6ZoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iPhco456zyHFP69Lu7ADqPqfsHyn6NmIKxk0x68AzigOKm/+ttxUXdkPHP9Y4kLyb
	 rVOKi95wjBOVGE+iT25ZbWEcyV0+cU8vHdmeqmSsZRJg4SbHKDnWR+er7fYBDbU3cA
	 IaWw0ldzlQxLCRgOsRbJ82tUfou40UOz0iOb/ez4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FFEFF8055C; Thu, 25 Jan 2024 17:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26432F8057E;
	Thu, 25 Jan 2024 17:28:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19041F8028D; Thu, 25 Jan 2024 17:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87CEFF800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 17:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87CEFF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b4qZMesT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706200098; x=1737736098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CKkmBUyrGKT7WEXHgCcuZ9+Ns5iuzV63djC+5Ja6ZoU=;
  b=b4qZMesTvMlrYBT1ewRBoSCEQ6reT/JYgRZUrOl0+mSbw79EhJkHGz8b
   Y/EBp1zip30UgDniUtHDzmCqOJuULEX1TqaPkV1dVYTaWarJJ9ynINb6+
   BuZmRXzRJF/6E3iVm7vx6F6mVG1irPmBzPlGtbtvLpiC7ALvbeFFX+BYI
   xQcmGnDx5/c0x3D82EATXu0XKXl+AiGfmnI0NWdm3vBlCB4loWh4WhhAe
   VdfaiUhc8dpuMkYmzeFqvVN4Xs8zXtzemtcW8TuxKYqlLzr4yKFvFg74T
   adklldhUjMEeonzsJNfgZTAQ33FQwVwZPXQzGqIwuXNPxmgSBIN/f0C4p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15575273"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="15575273"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="2309411"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2024 08:28:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT2a9-0000C0-0i;
	Thu, 25 Jan 2024 16:28:01 +0000
Date: Fri, 26 Jan 2024 00:27:32 +0800
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
Subject: Re: [PATCH 03/13] of: property: add of_graph_get_next_endpoint_raw()
Message-ID: <202401260024.txulvo50-lkp@intel.com>
References: <87fryoud8t.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fryoud8t.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: MMLQLXXAKVERIQALXE4UQORBIDPDWFOI
X-Message-ID-Hash: MMLQLXXAKVERIQALXE4UQORBIDPDWFOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMLQLXXAKVERIQALXE4UQORBIDPDWFOI/>
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
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.8-rc1 next-20240125]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-property-add-port-base-loop/20240123-081427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87fryoud8t.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 03/13] of: property: add of_graph_get_next_endpoint_raw()
config: i386-buildonly-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260024.txulvo50-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260024.txulvo50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260024.txulvo50-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:681: warning: Function parameter or struct member 'port' not described in 'of_graph_get_next_endpoint_raw'
>> drivers/of/property.c:681: warning: Excess function parameter 'parent' description in 'of_graph_get_next_endpoint_raw'


vim +681 drivers/of/property.c

   670	
   671	/**
   672	 * of_graph_get_next_endpoint_raw() - get next endpoint node
   673	 * @parent: pointer to the target port node
   674	 * @endpoint: current endpoint node, or NULL to get first
   675	 *
   676	 * Return: An 'endpoint' node pointer with refcount incremented. Refcount
   677	 * of the passed @prev node is decremented.
   678	 */
   679	struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
   680							   struct device_node *endpoint)
 > 681	{
   682		if (!port)
   683			return NULL;
   684	
   685		do {
   686			endpoint = of_get_next_child(port, endpoint);
   687			if (!endpoint)
   688				break;
   689		} while (!of_node_name_eq(endpoint, "endpoint"));
   690	
   691		return endpoint;
   692	}
   693	EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
