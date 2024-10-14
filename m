Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1591799C5C2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769ADE0F;
	Mon, 14 Oct 2024 11:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769ADE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728898368;
	bh=IlDfWywMkDy1/yps7ONr78oYawji6pl/sxY/6NJ20rg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NUpyHMB2HK+ivr9h5HTwyBLQKThsg5+Sp4UjhPuhyh7eRM3oG9wnuTANCx+n5nIwY
	 IEKm18EEc+yxpyL0kI/pQ+93nUWwJlM+evOwu9rgHs83YeXr9DvXq6rtvAqn4SI6sM
	 MaDvKuw+nAKsy8FVcbAOVXEQmDJGnmnxm0F3xy5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D97F805D6; Mon, 14 Oct 2024 11:32:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61ACFF805D6;
	Mon, 14 Oct 2024 11:32:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4683F805C0; Mon, 14 Oct 2024 11:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36F5AF805B0
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 11:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F5AF805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=en5S8Nkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728898330; x=1760434330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlDfWywMkDy1/yps7ONr78oYawji6pl/sxY/6NJ20rg=;
  b=en5S8NkqyHEY1SzpIpa2eR0w6cBzcVBDT4fq+ONetnSuJ8PVoXmbFXpO
   qICHpRi3V/k1gobhvbjR+spuMFBIqR6E/bGLg5dTlMpTvuhSJg+kFEKFh
   uO0TnY5kf3tUA0UIdKw6eVvJLex3D/W6aNUYqmpfmuOnc/8aSmJ+AUpP+
   8EYsF+Bq7erJOmkc1AR1SBOcyghYZZ1MUkfaFwfQtydTAbwzC1JYU6HLR
   y8cNku43jXwKc/EZPe4JrrQ323SL2CNvw2RvBAmL4BkP78XXs04gswEsS
   biMBIFAGOXJORYULue0mky9p8r1+sODbYsGHXBGT3PI2I5QmVf6/MZidD
   w==;
X-CSE-ConnectionGUID: 36IlHgMPS6aFhoFBCHRDew==
X-CSE-MsgGUID: 3sBRJPA7Rdik35zJ61NPrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27696089"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800";
   d="scan'208";a="27696089"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:31:58 -0700
X-CSE-ConnectionGUID: CwdgGs0gRrOD9okJXw9a0A==
X-CSE-MsgGUID: zgJJtuqtT+eHvjyWgOaWaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800";
   d="scan'208";a="81515024"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2024 02:31:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0HQh-000F8n-0E;
	Mon, 14 Oct 2024 09:31:55 +0000
Date: Mon, 14 Oct 2024 17:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/14] sound/pci/hda/hda_local.h:312:58: error:
 'const struct hda_quirk' has no member named 'name'
Message-ID: <202410141700.bF6I8r36-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: ABW3BYRKEUP5QNJZMMJM4KSEMVKCE2KL
X-Message-ID-Hash: ABW3BYRKEUP5QNJZMMJM4KSEMVKCE2KL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABW3BYRKEUP5QNJZMMJM4KSEMVKCE2KL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   0ddf2784d6c29e59409a62b8f32dc5abe56135a4
commit: 1f55e3699fc9ced72400cdca39fe248bf2b288a2 [9/14] ALSA: hda/conexant: Use the new codec SSID matching
config: i386-buildonly-randconfig-006-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141700.bF6I8r36-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141700.bF6I8r36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141700.bF6I8r36-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 0ddf2784d6c29e59409a62b8f32dc5abe56135a4 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_conexant.c:18:
>> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                          ^~~~
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'cxt5066_fixups[47]')
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                          ^~~~
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'cxt5066_fixups[48]')
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~


vim +312 sound/pci/hda/hda_local.h

5b1913a79c3e05 Takashi Iwai 2024-10-08  310  
5b1913a79c3e05 Takashi Iwai 2024-10-08  311  #define HDA_CODEC_QUIRK(vend, dev, xname, val) \
5b1913a79c3e05 Takashi Iwai 2024-10-08 @312  	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
5b1913a79c3e05 Takashi Iwai 2024-10-08  313  			.match_codec_ssid = true }
5b1913a79c3e05 Takashi Iwai 2024-10-08  314  

:::::: The code at line 312 was first introduced by commit
:::::: 5b1913a79c3e0518d9c5db343fa9fc4edcea041f ALSA: hda: Use own quirk lookup helper

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
