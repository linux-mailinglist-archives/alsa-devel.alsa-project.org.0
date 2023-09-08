Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5907991A7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 23:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C758583A;
	Fri,  8 Sep 2023 23:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C758583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694209843;
	bh=ugbmmZHWI8UpAx4ybKJuqBElMoFDfDGro8HHktoWgQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O5xxY3mqEXeUG9NZTUXdvPCguibEn3MsJ7qUMVGz0I359MrWfHJ/WSM/LhF3L16np
	 ihd2XdvS5GODmCEQspUcglPOf1uahiFL6GDgGXDAckx32NDWU0rTKPlqRioIX1LHKb
	 Ld8ZEBOUKQLFaKBe+lIolUSOFPe+5QSwSL0XmnvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23531F804F3; Fri,  8 Sep 2023 23:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA0BCF8047D;
	Fri,  8 Sep 2023 23:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80C15F80494; Fri,  8 Sep 2023 23:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CFDFF80431
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 23:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFDFF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OG8nsJJR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694209780; x=1725745780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ugbmmZHWI8UpAx4ybKJuqBElMoFDfDGro8HHktoWgQY=;
  b=OG8nsJJREVTi37WzvYzY48fMLBAjXK9mKZ5xbvp067ZeUOSTfJOvIzQ3
   LFuyI/leub9ffJXcLS+WkuJh6tR7IdnphTNszWY6+NrhF7jcyBT+dOxTi
   dEZZee0QrYk9C05zLKFpZs4vCekFtKr5lDCf9jUz8w67qZZ1KBCOuZTAs
   TduDDAr5sQJgiYbn2UZH/TNJvv2hc+NTi+Vhxk10mDT4jbGhs+HYc/iXB
   s7JeMKyN19/aafaBJhPtdbQ71iJJQHldBWqK0OQGGJYc+840YLByt5Qw1
   4V9a++jTghB1OzD/iIVGsTgQO20+Rrwp4+aaDNO3G2993yjP95QjYHMni
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357219726"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000";
   d="scan'208";a="357219726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 14:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885811725"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000";
   d="scan'208";a="885811725"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2023 14:49:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qejM1-0002di-1F;
	Fri, 08 Sep 2023 21:49:29 +0000
Date: Sat, 9 Sep 2023 05:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l41: Support mute notifications
 for CS35L41 HDA
Message-ID: <202309090555.tnWpQ7Gh-lkp@intel.com>
References: <20230908133421.2483508-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908133421.2483508-2-sbinding@opensource.cirrus.com>
Message-ID-Hash: K355MOEENBDJRVETDTJVGVGVYEVIFI7H
X-Message-ID-Hash: K355MOEENBDJRVETDTJVGVGVYEVIFI7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K355MOEENBDJRVETDTJVGVGVYEVIFI7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Stefan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master next-20230908]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230908-213735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230908133421.2483508-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v2 1/2] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: riscv-randconfig-001-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090555.tnWpQ7Gh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090555.tnWpQ7Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090555.tnWpQ7Gh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/hda/patch_realtek.c:6718:31: error: call to undeclared function 'acpi_device_handle'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
                                                      ^
   sound/pci/hda/patch_realtek.c:6718:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'acpi_handle' (aka 'void *') [-Wint-conversion]
                           spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_realtek.c:6737:7: error: call to undeclared function 'acpi_device_handle'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (!acpi_device_handle(adev))
                ^
   sound/pci/hda/patch_realtek.c:6745:41: error: incomplete definition of type 'struct acpi_device'
                   ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
                                                     ~~~~^
   include/linux/acpi.h:790:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
   sound/pci/hda/patch_realtek.c:6766:7: error: call to undeclared function 'acpi_device_handle'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (!acpi_device_handle(adev))
                ^
   sound/pci/hda/patch_realtek.c:6769:39: error: incomplete definition of type 'struct acpi_device'
           ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
                                            ~~~~^
   include/linux/acpi.h:790:8: note: forward declaration of 'struct acpi_device'
   struct acpi_device;
          ^
   6 errors generated.


vim +/acpi_device_handle +6718 sound/pci/hda/patch_realtek.c

  6707	
  6708	static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
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
