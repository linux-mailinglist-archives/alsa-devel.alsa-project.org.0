Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8CA3AC6E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 00:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F956045C;
	Wed, 19 Feb 2025 00:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F956045C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739920641;
	bh=71NOAhlA1zRx6LOJehloexvb8Dr2yZK3ZKDG/fCQnK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TK2bhi5MI5iCF1rDb66EM5P1H32VtWJfsvEJPCz6IgGosU0Jiokp5o0+spacKQYLk
	 BsCRU39IZFD+El9Jju7oeKCDziG8BoeJlMUIQVECgtgDZYWvIFOPAJS3kfMOkxbniv
	 7gSdvHKMyTmFqqARigB1LUpr0QuLyTNSt6jICC8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18242F805C1; Wed, 19 Feb 2025 00:16:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF02F805B0;
	Wed, 19 Feb 2025 00:16:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 226B6F8013D; Wed, 19 Feb 2025 00:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E178F800E3
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 00:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E178F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jMlMeeHh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739920593; x=1771456593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71NOAhlA1zRx6LOJehloexvb8Dr2yZK3ZKDG/fCQnK8=;
  b=jMlMeeHhCnhcHHYSZSi/kUtEmTr8VealstZYOR3NsUrsbG2PjxjSyeo3
   SIvkkrIETIkJudSGyT0NRsW2omLBm2lpmmLlnHsBR3TOFTGlCc+Bm49tx
   SP8/rlHC3LdVSmoShY/DquunrMgG/QxWcsPhP4BQSM6I/qSI+W3jVFJfk
   T4fhfzoTH4K0icH5Nzve3L6H16AsOERYRVqmO48RydJa3hQykMGWjXL5j
   4L4Bi2v9gFJxpJd5myT55G4Vu+YjliOeEaqq52uRnaeaCMiYihOUc4yoR
   Af2lOi67GOMWCz5hdoDRh79UYbPUL5Tro4vmjVCwo0gElkzGTNQ955wP8
   g==;
X-CSE-ConnectionGUID: qZsHUgEXRYW0rurkYQLnFw==
X-CSE-MsgGUID: PTzOUgSbQoW32Mw+5xWRQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51624052"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000";
   d="scan'208";a="51624052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:16:28 -0800
X-CSE-ConnectionGUID: J2RfxhNgTjGOZ+AaJZpasA==
X-CSE-MsgGUID: KvOPBGGWT0q5JaJFQ+I7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600";
   d="scan'208";a="119193650"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 15:16:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkWp8-0000xP-1Z;
	Tue, 18 Feb 2025 23:16:18 +0000
Date: Wed, 19 Feb 2025 07:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <ftreven@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jeff LaBundy <jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
	Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
Message-ID: <202502190628.g4aG7l2q-lkp@intel.com>
References: <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
Message-ID-Hash: 5NO4LWUERWN7U4G6H5GAMXMAILP2R4GW
X-Message-ID-Hash: 5NO4LWUERWN7U4G6H5GAMXMAILP2R4GW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NO4LWUERWN7U4G6H5GAMXMAILP2R4GW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Fred,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on broonie-sound/for-next dtor-input/next dtor-input/for-linus linus/master v6.14-rc3 next-20250218]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Treven/firmware-cs_dsp-Fix-error-checking-in-wseq_write/20250217-181206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250204231835.2000457-6-ftreven%40opensource.cirrus.com
patch subject: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250219/202502190628.g4aG7l2q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190628.g4aG7l2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190628.g4aG7l2q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mfd/cs40l26-core.c:12:
   In file included from include/linux/mfd/core.h:13:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs40l26-core.c:1173:3: error: cannot jump from this goto statement to its label
    1173 |                 goto err_fw_rls;
         |                 ^
   drivers/mfd/cs40l26-core.c:1176:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1176 |         guard(mutex)(&cs40l26->lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:42:1: note: expanded from here
      42 | __UNIQUE_ID_guard697
         | ^
   3 warnings and 1 error generated.


vim +1173 drivers/mfd/cs40l26-core.c

  1165	
  1166	static void cs40l26_dsp_start(struct cs40l26 *cs40l26)
  1167	{
  1168		int i, ret;
  1169	
  1170		ret = cs40l26_dsp_pre_config(cs40l26);
  1171		if (ret) {
  1172			dev_err(cs40l26->dev, "DSP Pre Config. Failed: %d\n", ret);
> 1173			goto err_fw_rls;
  1174		}
  1175	
  1176		guard(mutex)(&cs40l26->lock);
  1177	
  1178		ret = cs_dsp_power_up_multiple(&cs40l26->dsp, cs40l26->wmfw, "cs40l26.wmfw", cs40l26_coeffs,
  1179					       CS40L26_NUM_COEFF_FILES, "cs40l26");
  1180		if (ret) {
  1181			dev_err(cs40l26->dev, "Failed to Power Up DSP\n");
  1182			goto err_fw_rls;
  1183		}
  1184	
  1185		if (cs40l26->dsp.fw_id != CS40L26_FW_ID) {
  1186			dev_err(cs40l26->dev, "Invalid firmware ID: 0x%X\n", cs40l26->dsp.fw_id);
  1187			goto err_fw_rls;
  1188		}
  1189	
  1190		if (cs40l26->dsp.fw_id_version < cs40l26->variant->info->fw_min_rev) {
  1191			dev_err(cs40l26->dev, "Invalid firmware revision: 0x%X\n",
  1192				cs40l26->dsp.fw_id_version);
  1193			goto err_fw_rls;
  1194		}
  1195	
  1196		ret = cs_dsp_run(&cs40l26->dsp);
  1197		if (ret)
  1198			dev_err(cs40l26->dev, "DSP Failed to run: %d\n", ret);
  1199	
  1200	err_fw_rls:
  1201		for (i = 0; i < CS40L26_NUM_COEFF_FILES; i++)
  1202			release_firmware(cs40l26_coeffs[i].coeff_firmware);
  1203	
  1204		release_firmware(cs40l26->wmfw);
  1205	}
  1206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
