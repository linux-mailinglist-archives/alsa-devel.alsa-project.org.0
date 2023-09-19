Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790FB7A6A96
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 20:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A452823;
	Tue, 19 Sep 2023 20:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A452823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695147613;
	bh=3FR81ZkNHRdK+lOnUeVZcaHcl/uafUM0C3FgoIlRkag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hPskoSEROohOfj92GRzFM//AQECJumQM51znil2PsC6X8IrJBJb1EvyrWykk0qhrS
	 suDNJKfgkX1uS1ByiqRa4ItVUZ20hefsr7JaBKwMlCBtBfpDTovRZI7vf9bbSkGUr0
	 D/nWQd8UfuULUf5aX0ODrWGNHGOA+/N8Q35p7Ops=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CDBF80494; Tue, 19 Sep 2023 20:19:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E36F801F5;
	Tue, 19 Sep 2023 20:19:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7497F8025A; Tue, 19 Sep 2023 20:19:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 133D1F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 20:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133D1F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tvmw2F/J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695147552; x=1726683552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3FR81ZkNHRdK+lOnUeVZcaHcl/uafUM0C3FgoIlRkag=;
  b=Tvmw2F/JsgyJkCb2QSmC3jUUoJWgH0ziTh+x/ftFyiTAy76jAtVxgdJj
   x5GaKMBjeMK2ise0b5LqkAdHWCRN0oHPMvJHnSpKpRZc07V0yWBE4UdiS
   g09D4Bgz2p0ORGAL7LYM1/d+kifEHqrNncq77FfxuOCouMPQOUnfHScU4
   Tot9Bd8ZypSxea94Kc7gvmUEO9VI57URljNhp3AN0nFa1wdPlFkCIULpI
   aABsrkE7oPa+Xs/dCnaHVMBOHlN58FDDMoT0+HCeLP8+N8F/01ecpgxLF
   rS+GfFp8+5L7+fkWd9iXq9wUyu8Lo+hL67dPhH9Ik5lqe4pGe7v//dicW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378909636"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000";
   d="scan'208";a="378909636"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 11:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="722966010"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000";
   d="scan'208";a="722966010"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2023 11:19:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qifJN-0007n9-1e;
	Tue, 19 Sep 2023 18:19:01 +0000
Date: Wed, 20 Sep 2023 02:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications
 for CS35L41 HDA
Message-ID: <202309200216.1V4V854z-lkp@intel.com>
References: <20230919142240.467682-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919142240.467682-2-sbinding@opensource.cirrus.com>
Message-ID-Hash: MHT3O4ZIRHQ7MDUDA4JQBTJZONP7TEYG
X-Message-ID-Hash: MHT3O4ZIRHQ7MDUDA4JQBTJZONP7TEYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHT3O4ZIRHQ7MDUDA4JQBTJZONP7TEYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230919]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus v6.6-rc2 v6.6-rc1 v6.5 linus/master v6.6-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230920-005359
base:   next-20230919
patch link:    https://lore.kernel.org/r/20230919142240.467682-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200216.1V4V854z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200216.1V4V854z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200216.1V4V854z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'comp_acpi_device_notify':
   sound/pci/hda/patch_realtek.c:6718:52: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
    6718 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    acpi_fwnode_handle
   sound/pci/hda/patch_realtek.c:6718:52: warning: passing argument 1 of 'spec->comps[i].acpi_notify' makes pointer from integer without a cast [-Wint-conversion]
    6718 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    int
   sound/pci/hda/patch_realtek.c:6718:52: note: expected 'acpi_handle' {aka 'void *'} but argument is of type 'int'
   sound/pci/hda/patch_realtek.c: At top level:
>> sound/pci/hda/patch_realtek.c:6708:13: warning: 'comp_acpi_device_notify' defined but not used [-Wunused-function]
    6708 | static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/comp_acpi_device_notify +6708 sound/pci/hda/patch_realtek.c

  6707	
> 6708	static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
  6709	{
  6710		struct hda_codec *cdc = data;
  6711		struct alc_spec *spec = cdc->spec;
  6712		int i;
  6713	
  6714		codec_info(cdc, "ACPI Notification %d\n", event);
  6715	
  6716		for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
  6717			if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> 6718				spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
  6719							   spec->comps[i].dev);
  6720		}
  6721	}
  6722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
