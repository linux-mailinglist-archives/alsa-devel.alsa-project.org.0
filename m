Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC599C407
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 10:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA7720C;
	Mon, 14 Oct 2024 10:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA7720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728895905;
	bh=hZIvC5VaMoMBi4KsXTmdsWXCnU4FnqfqbQ9kVukmG2o=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H5YpgxgCVqn8ocqolWwfmh8/cb3oOz91VchLBNOcjSxodKDG+ZSjaZJWdx5eSc9eW
	 Ok5zsCZRO6TtiVQVne9qjbn3GNj0Zmbj/VDnGQlTkucsX8IsmNaXz/OKTMkOKlAnAG
	 L+t6JCnMs8BJvk2mp7q991Tks8j+klkEJ0Oy0aqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A73FF805A1; Mon, 14 Oct 2024 10:51:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F239F805B1;
	Mon, 14 Oct 2024 10:51:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F792F80448; Mon, 14 Oct 2024 10:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34183F80149
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 10:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34183F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TSHYzqzv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895862; x=1760431862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZIvC5VaMoMBi4KsXTmdsWXCnU4FnqfqbQ9kVukmG2o=;
  b=TSHYzqzv4kh2+QK9PBwDsqLTUP0izAcWS0e+r4TMVwetdw0FG1YurWqa
   vgw4DJJx8SPscEGcglejEUihUe1tDoYIC5J2IsJIxzh7CAVs2bUS6vbsC
   5STN0hKv5iIOPMOGQqWkSag4dAbbZy+MCcTWJ7T8XIZA3egdIc6LpXcWR
   orUL3NJ1PS2yotw5VhnK/kPgxzM7OSlaDuELr6SLhXhXGB15OmCwxOe4m
   LCdSELlWO6AN2qkySKiBxWEJ+QTgXrcNYe+UqtoIkqD8zPKk8EtnRqf7t
   m0EfWHwJq0VfOeY/lI06vIBPvJKtWU2l0Sve25x2OtEzJMglxRpYeO+cY
   Q==;
X-CSE-ConnectionGUID: j5CBcJxDRT6AWn4jypUmUg==
X-CSE-MsgGUID: zIPz855vTE24aQCSmAH2iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39630493"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800";
   d="scan'208";a="39630493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:50:56 -0700
X-CSE-ConnectionGUID: mS50L6kgSnupiuSMyx5sxA==
X-CSE-MsgGUID: hBdxFI4IQ72sxk6KHv/RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800";
   d="scan'208";a="100844864"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 01:50:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Gmz-000F6S-1S;
	Mon, 14 Oct 2024 08:50:53 +0000
Date: Mon, 14 Oct 2024 16:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/14] sound/pci/hda/patch_conexant.c:1081:2:
 error: field designator 'name' does not refer to any field in type 'const
 struct hda_quirk'
Message-ID: <202410141648.JOPFB2du-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: CM4PYJEZWVNGED2DUERRRRXHA6OAVQHF
X-Message-ID-Hash: CM4PYJEZWVNGED2DUERRRRXHA6OAVQHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CM4PYJEZWVNGED2DUERRRRXHA6OAVQHF/>
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
config: i386-buildonly-randconfig-003-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141648.JOPFB2du-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141648.JOPFB2du-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141648.JOPFB2du-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 0ddf2784d6c29e59409a62b8f32dc5abe56135a4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/pci/hda/patch_conexant.c:1081:2: error: field designator 'name' does not refer to any field in type 'const struct hda_quirk'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:51: note: expanded from macro 'HDA_CODEC_QUIRK'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                         ~^~~~~~~~~~~~~~
   sound/pci/hda/patch_conexant.c:1082:2: error: field designator 'name' does not refer to any field in type 'const struct hda_quirk'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:51: note: expanded from macro 'HDA_CODEC_QUIRK'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                         ~^~~~~~~~~~~~~~
   2 errors generated.


vim +1081 sound/pci/hda/patch_conexant.c

  1029	
  1030	static const struct hda_quirk cxt5066_fixups[] = {
  1031		SND_PCI_QUIRK(0x1025, 0x0543, "Acer Aspire One 522", CXT_FIXUP_STEREO_DMIC),
  1032		SND_PCI_QUIRK(0x1025, 0x054c, "Acer Aspire 3830TG", CXT_FIXUP_ASPIRE_DMIC),
  1033		SND_PCI_QUIRK(0x1025, 0x054f, "Acer Aspire 4830T", CXT_FIXUP_ASPIRE_DMIC),
  1034		SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
  1035		SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
  1036		SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
  1037		SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
  1038		SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
  1039		SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
  1040		SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
  1041		SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
  1042		SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1043		SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1044		SND_PCI_QUIRK(0x103c, 0x82b4, "HP ProDesk 600 G3", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1045		SND_PCI_QUIRK(0x103c, 0x836e, "HP ProBook 455 G5", CXT_FIXUP_MUTE_LED_GPIO),
  1046		SND_PCI_QUIRK(0x103c, 0x837f, "HP ProBook 470 G5", CXT_FIXUP_MUTE_LED_GPIO),
  1047		SND_PCI_QUIRK(0x103c, 0x83b2, "HP EliteBook 840 G5", CXT_FIXUP_HP_DOCK),
  1048		SND_PCI_QUIRK(0x103c, 0x83b3, "HP EliteBook 830 G5", CXT_FIXUP_HP_DOCK),
  1049		SND_PCI_QUIRK(0x103c, 0x83d3, "HP ProBook 640 G4", CXT_FIXUP_HP_DOCK),
  1050		SND_PCI_QUIRK(0x103c, 0x8402, "HP ProBook 645 G4", CXT_FIXUP_MUTE_LED_GPIO),
  1051		SND_PCI_QUIRK(0x103c, 0x8427, "HP ZBook Studio G5", CXT_FIXUP_HP_ZBOOK_MUTE_LED),
  1052		SND_PCI_QUIRK(0x103c, 0x844f, "HP ZBook Studio G5", CXT_FIXUP_HP_ZBOOK_MUTE_LED),
  1053		SND_PCI_QUIRK(0x103c, 0x8455, "HP Z2 G4", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1054		SND_PCI_QUIRK(0x103c, 0x8456, "HP Z2 G4 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1055		SND_PCI_QUIRK(0x103c, 0x8457, "HP Z2 G4 mini", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1056		SND_PCI_QUIRK(0x103c, 0x8458, "HP Z2 G4 mini premium", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1057		SND_PCI_QUIRK(0x1043, 0x138d, "Asus", CXT_FIXUP_HEADPHONE_MIC_PIN),
  1058		SND_PCI_QUIRK(0x14f1, 0x0265, "SWS JS201D", CXT_PINCFG_SWS_JS201D),
  1059		SND_PCI_QUIRK(0x152d, 0x0833, "OLPC XO-1.5", CXT_FIXUP_OLPC_XO),
  1060		SND_PCI_QUIRK(0x17aa, 0x20f2, "Lenovo T400", CXT_PINCFG_LENOVO_TP410),
  1061		SND_PCI_QUIRK(0x17aa, 0x215e, "Lenovo T410", CXT_PINCFG_LENOVO_TP410),
  1062		SND_PCI_QUIRK(0x17aa, 0x215f, "Lenovo T510", CXT_PINCFG_LENOVO_TP410),
  1063		SND_PCI_QUIRK(0x17aa, 0x21ce, "Lenovo T420", CXT_PINCFG_LENOVO_TP410),
  1064		SND_PCI_QUIRK(0x17aa, 0x21cf, "Lenovo T520", CXT_PINCFG_LENOVO_TP410),
  1065		SND_PCI_QUIRK(0x17aa, 0x21d2, "Lenovo T420s", CXT_PINCFG_LENOVO_TP410),
  1066		SND_PCI_QUIRK(0x17aa, 0x21da, "Lenovo X220", CXT_PINCFG_LENOVO_TP410),
  1067		SND_PCI_QUIRK(0x17aa, 0x21db, "Lenovo X220-tablet", CXT_PINCFG_LENOVO_TP410),
  1068		SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo IdeaPad Z560", CXT_FIXUP_MUTE_LED_EAPD),
  1069		SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
  1070		SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
  1071		SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
  1072		/* NOTE: we'd need to extend the quirk for 17aa:3977 as the same
  1073		 * PCI SSID is used on multiple Lenovo models
  1074		 */
  1075		SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_FIXUP_STEREO_DMIC),
  1076		SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
  1077		SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
  1078		SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
  1079		SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
  1080		SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
> 1081		HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
  1082		HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
  1083		{}
  1084	};
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
