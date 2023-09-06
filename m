Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA52793D40
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 14:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A7F83A;
	Wed,  6 Sep 2023 14:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A7F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694005119;
	bh=Ji2vPvkSoEPWMtRj8ih7XUvtJS058HHiqnFXsSGfi8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q/DGuxRQ4qPtMxnsrAFHvq1Eokc2xmNlcvy1OIp6qtIQ07QbcWm/bZe41a2WgHvOH
	 LTfhBt2dWR1MDKhhtFXaDJZ04UMZbsWGdLpsE0qvQATQFKKtVnphhFnmzej+4lD8Ws
	 +7vxTpAA3zo4anklE1nY/AbP2d8kzq2qF6a8x6qY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92577F8047D; Wed,  6 Sep 2023 14:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6DDF80236;
	Wed,  6 Sep 2023 14:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CD73F80494; Wed,  6 Sep 2023 14:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C5F3F800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 14:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5F3F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hQdqjYuk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694005038; x=1725541038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ji2vPvkSoEPWMtRj8ih7XUvtJS058HHiqnFXsSGfi8U=;
  b=hQdqjYukKtyrJW6gS9nsoWwjRjNkXNvWqy5tHFRieN9A3YGFaNrXa5j7
   A0CgfC6u4OlC2S9cje7+/KVNZa4SodzDfh/1ABQFHo0fK1tuJ2L5e+2iP
   cCeSjvT2sgReM2uG27VtAeuIDnteKsuiRNp9m+5AL8oXPP4m9a5q/fO08
   gfOOgZVgLe4z4C8tZAOXagC8/L7qogNgd1wyMXMRsrBg0Foy9e9X2lsxA
   mu7lEufsV3EG3bWvYQDH+s6Lm1PhqYRUKZO9SwFbj1dj8Y1FGAH8USD+R
   wcmJBgE/6HjiU2uxwRgpZoss3hQUxpr3GfF2m9Be4iaPD5RxiWFouErx2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356543041"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000";
   d="scan'208";a="356543041"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 05:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="831650448"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000";
   d="scan'208";a="831650448"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Sep 2023 05:57:09 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qds5j-0000EL-1w;
	Wed, 06 Sep 2023 12:57:07 +0000
Date: Wed, 6 Sep 2023 20:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
Message-ID: <202309062027.esqlhxcg-lkp@intel.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
Message-ID-Hash: EG6MCYKLCGV2LJ25TUHDEIDUVFEJYPQ7
X-Message-ID-Hash: EG6MCYKLCGV2LJ25TUHDEIDUVFEJYPQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EG6MCYKLCGV2LJ25TUHDEIDUVFEJYPQ7/>
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
[also build test ERROR on tiwai-sound/for-linus linus/master next-20230906]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230825-200835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230825120525.1337417-1-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230906/202309062027.esqlhxcg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062027.esqlhxcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062027.esqlhxcg-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'comp_acpi_device_notify':
>> sound/pci/hda/patch_realtek.c:6717:52: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    acpi_fwnode_handle
   sound/pci/hda/patch_realtek.c:6717:52: warning: passing argument 1 of 'spec->comps[i].acpi_notify' makes pointer from integer without a cast [-Wint-conversion]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    int
   sound/pci/hda/patch_realtek.c:6717:52: note: expected 'acpi_handle' {aka 'void *'} but argument is of type 'int'
   sound/pci/hda/patch_realtek.c: In function 'comp_bind':
>> sound/pci/hda/patch_realtek.c:6737:47: error: invalid use of undefined type 'struct acpi_device'
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
  6722	static int comp_bind(struct device *dev)
  6723	{
  6724		struct hda_codec *cdc = dev_to_hda_codec(dev);
  6725		struct alc_spec *spec = cdc->spec;
  6726		struct acpi_device *adev;
  6727		int ret;
  6728	
  6729		ret = component_bind_all(dev, spec->comps);
  6730		if (ret)
  6731			return ret;
  6732	
  6733		adev = spec->comps[0].adev;
  6734		if (!acpi_device_handle(adev))
  6735			return 0;
  6736	
> 6737		ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
  6738						  comp_acpi_device_notify, cdc);
  6739		if (ret < 0) {
  6740			codec_warn(cdc, "Failed to install notify handler: %d\n", ret);
  6741			return 0;
  6742		}
  6743	
  6744		codec_dbg(cdc, "Notify handler installed\n");
  6745	
  6746		return 0;
  6747	}
  6748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
