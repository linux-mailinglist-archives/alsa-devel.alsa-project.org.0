Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DD78889A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 15:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E68839;
	Fri, 25 Aug 2023 15:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E68839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692970284;
	bh=SE0GPPGuGVla4ffFlLmr2AKmEA+L7zTsjzfS23WMDOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mElO9pVGfO4Lp0/KM+31dj2c9i68KB/YiVskrcCniHXTDxx3tO3vbXEIKbG9b4hGf
	 iNngg/nmrI2BNcn+W4/6W0w4ZOzSf09j9aL5BP/Svr8uw2PNaKHbn+nPCLumtFJqr9
	 zyNaTJ9QCP/X4kPR4pGEqloDS/DE5KgGDl4knPvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31802F804DA; Fri, 25 Aug 2023 15:30:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A370F800D1;
	Fri, 25 Aug 2023 15:30:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21507F800F5; Fri, 25 Aug 2023 15:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 717A0F800BF
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 15:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 717A0F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=evzn5/nq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692970208; x=1724506208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SE0GPPGuGVla4ffFlLmr2AKmEA+L7zTsjzfS23WMDOI=;
  b=evzn5/nq7WvIloYZJpgVhPmTuWLTf6cpqPBheBC/aQjKhUOeIA5lJv+b
   NzyZKVEI4XGaL5hiXxZoQOMg72CaO/CLQBUYTCD232Jyw7oSnnTqUmsYW
   KBhKOT+iPcNyVRyUqEk6cPBpw0eo3tN66XqR8zh5xRsfQlJEMZFfF5Gjv
   KfSRKzfcM6T4MVi9WD6EOhzCMSWioDv3KS5X+iop5XWOLsN5W5/rI9Inb
   eOBN2lxXFUcTNSb0T5rUhEydc265AT+Rmcb3Y2GcP1yjn62CTab5G/CwB
   Cye6u9lGWMFsbT9BNrQIycl1u/ybwUkwgu38cSRnv4JuWGGXk7gkB4IcI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359711316"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="359711316"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766955947"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="766955947"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 06:29:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZWsq-0003cI-1g;
	Fri, 25 Aug 2023 13:29:52 +0000
Date: Fri, 25 Aug 2023 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
Message-ID: <202308252129.LN14FqG9-lkp@intel.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
Message-ID-Hash: 3MPUYLSTTTPMJTH7274SSJZD2YFQ5OLZ
X-Message-ID-Hash: 3MPUYLSTTTPMJTH7274SSJZD2YFQ5OLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MPUYLSTTTPMJTH7274SSJZD2YFQ5OLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230825]
[cannot apply to tiwai-sound/for-linus linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230825-200835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230825120525.1337417-1-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308252129.LN14FqG9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252129.LN14FqG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252129.LN14FqG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'comp_acpi_device_notify':
   sound/pci/hda/patch_realtek.c:6717:52: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    acpi_fwnode_handle
>> sound/pci/hda/patch_realtek.c:6717:52: warning: passing argument 1 of 'spec->comps[i].acpi_notify' makes pointer from integer without a cast [-Wint-conversion]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    int
   sound/pci/hda/patch_realtek.c:6717:52: note: expected 'acpi_handle' {aka 'void *'} but argument is of type 'int'
   sound/pci/hda/patch_realtek.c: In function 'comp_bind':
   sound/pci/hda/patch_realtek.c:6737:47: error: invalid use of undefined type 'struct acpi_device'
    6737 |         ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                               ^~
   sound/pci/hda/patch_realtek.c: In function 'comp_unbind':
   sound/pci/hda/patch_realtek.c:6760:46: error: invalid use of undefined type 'struct acpi_device'
    6760 |         ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                              ^~
   cc1: some warnings being treated as errors


vim +6717 sound/pci/hda/patch_realtek.c

  6706	
  6707	static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
  6708	{
  6709		struct hda_codec *cdc = data;
  6710		struct alc_spec *spec = cdc->spec;
  6711		int i;
  6712	
  6713		codec_info(cdc, "ACPI Notification %d\n", event);
  6714	
  6715		for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
  6716			if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> 6717				spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
  6718							   spec->comps[i].dev);
  6719		}
  6720	}
  6721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
