Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674573AC83
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3A5846;
	Fri, 23 Jun 2023 00:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3A5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473179;
	bh=SDXJENEeL/bpt6xMsVy0rg9NPjTbCICx2LYe2RbgEZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P2qjrsasBYHwt7Ok3r98oMWM2Y+1W2ZxOmQaQP5hanaQPAXaKyiBwRxPnhyyU846A
	 0l2vGWIQIMd5LyBYd6F6WSZ3nujnRpAulio5n+YeaGjLXJNcjDDiZrqWPmRRPq+Rrk
	 cIJxr4ewhxwwiDVq1OiIPZdy2k4kksvOTdKlleXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E14CF80548; Fri, 23 Jun 2023 00:32:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D0DFF80141;
	Fri, 23 Jun 2023 00:32:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC11F801D5; Fri, 23 Jun 2023 00:32:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E4E1F80141
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E4E1F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UUv9yUcn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687473119; x=1719009119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SDXJENEeL/bpt6xMsVy0rg9NPjTbCICx2LYe2RbgEZ0=;
  b=UUv9yUcn2t51krWkWR8sI13ldqowqYLjlfUbK8ZsT9CIcPxcuR9QtAk7
   ZqKLB1da8gv31Wf0sK9eaX8vZhIv0YO/Lzb/7ECXINrp9weF+1kbZmLP0
   RcgKbnjDZHIT1BXPKaqg91+w8V3eNcLcndUT+raSkTLcDk7udW6Po7+Uc
   YnunpQRt9C65g/xCat8fbLsxg2i4FjXfOzMBJVC5jmjxN/y3Ft9vXO961
   CdDPlqNz11TmV6divV7NSQNG9lyQ1fKIvcgQsq5LwyPhkyNKprsljPvl0
   1D7CqwKhnyfyKZCrcBiNGCU+GyIeJRpKlHAgqc7PGtgfZtk2IHLcCwUhJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390494732"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200";
   d="scan'208";a="390494732"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="961750214"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200";
   d="scan'208";a="961750214"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 15:31:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCSqB-0007nH-0c;
	Thu, 22 Jun 2023 22:31:47 +0000
Date: Fri, 23 Jun 2023 06:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] ASoC: amd: acp: add acp i2s master clock
 generation for rembrandt platform
Message-ID: <202306230648.6X3y3ujR-lkp@intel.com>
References: <20230622152406.3709231-7-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622152406.3709231-7-Syed.SabaKareem@amd.com>
Message-ID-Hash: 4RR2K7AUNJ4PPBUKKVX3ZN2TXIGXARXZ
X-Message-ID-Hash: 4RR2K7AUNJ4PPBUKKVX3ZN2TXIGXARXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RR2K7AUNJ4PPBUKKVX3ZN2TXIGXARXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Syed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-remove-acp-poweroff-function/20230622-233145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230622152406.3709231-7-Syed.SabaKareem%40amd.com
patch subject: [PATCH 04/12] ASoC: amd: acp: add acp i2s master clock generation for rembrandt platform
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230648.6X3y3ujR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230648.6X3y3ujR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230648.6X3y3ujR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-rembrandt.c:169:5: warning: no previous prototype for 'acp6x_master_clock_generate' [-Wmissing-prototypes]
     169 | int acp6x_master_clock_generate(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/acp6x_master_clock_generate +169 sound/soc/amd/acp/acp-rembrandt.c

   168	
 > 169	int acp6x_master_clock_generate(struct device *dev)
   170	{
   171		int data = 0;
   172		struct pci_dev *smn_dev;
   173	
   174		smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, HOST_BRIDGE_ID, NULL);
   175		if (!smn_dev) {
   176			dev_err(dev, "Failed to get host bridge device\n");
   177			return -ENODEV;
   178		}
   179	
   180		smn_write(smn_dev, MP1_C2PMSG_93, 0);
   181		smn_write(smn_dev, MP1_C2PMSG_85, 0xC4);
   182		smn_write(smn_dev, MP1_C2PMSG_69, 0x4);
   183		read_poll_timeout(smn_read, data, data, DELAY_US,
   184				  ACP_TIMEOUT, false, smn_dev, MP1_C2PMSG_93);
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
