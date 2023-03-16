Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F066BC744
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 08:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792601149;
	Thu, 16 Mar 2023 08:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792601149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678951967;
	bh=bRuPOGfZnu4JByDAsSat1lIPi/d4YuYFnKKqk6RPkbs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ievtJlLkBytM75mzLQjySSKNLGquPtfibhaC6/EYMin5T4+IYZQaczQrjwF+WzSxJ
	 1lF8BCoKeH9wqbDNsW8VbLaPDnqUWcerN262yfJbsW2EZEQ95qHQU7XQs+nhSWRIZP
	 PU3h93GPMgrOuMdKKA6JgiAatuk7O3jQ/o0ElE6A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F03ACF8032D;
	Thu, 16 Mar 2023 08:31:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35957F80423; Thu, 16 Mar 2023 08:31:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D887F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 08:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D887F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bj1vbAi3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678951904; x=1710487904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bRuPOGfZnu4JByDAsSat1lIPi/d4YuYFnKKqk6RPkbs=;
  b=bj1vbAi3U8YClQokQzgdN9imO7BLq/nM75w1TMal4SXRKmKniwo+5qyz
   fRzv42LtCcMX5WD3Mr8jIGb9vgBNoAewX83ZK7IYslhOYrmB81yIITDVp
   We6cHTVFnWH4AP7lO2CerdRwOwQ2Vq0IoGd7CdNQiDbh/mm1mgCE+ghYc
   hVJj/MzSief/tirrPTKZqY7VsztKco/UHhRcscXdwspmPEzFMhXoSGZsJ
   rCa4PdWBJPlrSWNoBDfgnm8v5dRSQt+mUuPVMAU1qV6A7jdDKuHHGcEzo
   OJe4AcRQAJCCioX6yE4+CrDYXgSaZhx3MGkpUc1NBBc8gLsF4pMUWaGmQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336606560"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="336606560"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 00:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="679794068"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="679794068"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 00:31:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pci56-0008PO-2a;
	Thu, 16 Mar 2023 07:31:24 +0000
Date: Thu, 16 Mar 2023 15:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256
 sysfs entry
Message-ID: <202303161547.ZzSQWnIQ-lkp@intel.com>
References: 
 <167888779364.26.9200222608363841485@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167888779364.26.9200222608363841485@mailman-core.alsa-project.org>
Message-ID-Hash: 3PM4EEAVENSR5LPV5J375U5PUXV2GHWK
X-Message-ID-Hash: 3PM4EEAVENSR5LPV5J375U5PUXV2GHWK
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PM4EEAVENSR5LPV5J375U5PUXV2GHWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/167888779364.26.9200222608363841485%40mailman-core.alsa-project.org
patch subject: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256 sysfs entry
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/0140596e508d18933cd319314838bc802214b345
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
        git checkout 0140596e508d18933cd319314838bc802214b345
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161547.ZzSQWnIQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256:2: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256:2: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +2 Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256

   > 2	KernelVersion:	6.4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
