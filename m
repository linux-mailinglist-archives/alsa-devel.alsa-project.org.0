Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F52A1619C
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2025 13:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED0B603F5;
	Sun, 19 Jan 2025 13:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED0B603F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737289467;
	bh=G7qkiKdY7o4/+y78NwZfqHgg2iTIPpjRjpuZkvRUnB4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MiCWiQMv5TnqOhsZI69dU7aA1nxMhgdySIZ1VP0mw6nHR6f/FhLqmrmZYS1pIX8bx
	 6p59/HGporuOx0srZ/ecMBGXL5nClGxdzx8h2/flsciCyyND/ifK+27B/JG0xSe1lD
	 wiCH6qUMvQU15wuf8uDPpq7MBoEoGJzeMm34Ca3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7FBCF805C3; Sun, 19 Jan 2025 13:23:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA132F805AE;
	Sun, 19 Jan 2025 13:23:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10831F804F3; Sun, 19 Jan 2025 13:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90B7BF80071
	for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2025 13:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B7BF80071
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HJnFlpMK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737289423; x=1768825423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7qkiKdY7o4/+y78NwZfqHgg2iTIPpjRjpuZkvRUnB4=;
  b=HJnFlpMK+0Kd3P+dGi2poY1qAVpgtY6Y4GxrNPSAZp0vqjO5oqCTA2ci
   2X6SNAWpXofOlJ8/iHFz72St+H/2BgyMeyKvOlnjREPmkWGAHOxI3Fi6J
   qAifKhdvRnh6QskL+4rpwCMJwboX62v2xZABp7dQrXYTp7g3HwZRJvkQC
   +Oj1i4aDBV1oLm22gj8WZFv/HHk8x/7zyfn8I40VIjn+fay/hfncSkPBm
   xpjEmU0j4gnxt2QNVO7C8eg2RlBKK7xAtYk1X4r0VV+etvQs+sFglmHHL
   9INylAlnikl+G27JfDbJMJgmU/Kbah4lBPnnTNWKzHqkqP6fmygFSiYo7
   w==;
X-CSE-ConnectionGUID: FkW+vmeQS7eiXiEhduQhHw==
X-CSE-MsgGUID: l29rj7wRR/aM0HYYdqlxZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37815506"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000";
   d="scan'208";a="37815506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:23:38 -0800
X-CSE-ConnectionGUID: /9M6EfexQy+xQh6QxQgIpw==
X-CSE-MsgGUID: IR00JcY6Sz6HGYS1xFX+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600";
   d="scan'208";a="110847759"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 04:23:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZUL0-000VQs-1R;
	Sun, 19 Jan 2025 12:23:34 +0000
Date: Sun, 19 Jan 2025 20:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 49/52] sound/pci/hda/tas2781_hda_spi.c:110:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202501192006.Hm9GmKiV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 42SWFI4RJCZ5GIE2EH3ZVBE67F6CSOW4
X-Message-ID-Hash: 42SWFI4RJCZ5GIE2EH3ZVBE67F6CSOW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42SWFI4RJCZ5GIE2EH3ZVBE67F6CSOW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   dd85bbb7fc482b5cdb78f8b5e8f9ef7a3919d6ef
commit: bb5f86ea50ffb292f42eb1ebdb99991d5c5ac3ba [49/52] ALSA: hda/tas2781: Add tas2781 hda SPI driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501192006.Hm9GmKiV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192006.Hm9GmKiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192006.Hm9GmKiV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/tas2781_hda_spi.c:110:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     110 |         if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:119:9: note: uninitialized use occurs here
     119 |         return ret;
         |                ^~~
   sound/pci/hda/tas2781_hda_spi.c:110:2: note: remove the 'if' if its condition is always true
     110 |         if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:108:9: note: initialize the variable 'ret' to silence this warning
     108 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +110 sound/pci/hda/tas2781_hda_spi.c

   104	
   105	static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int reg)
   106	{
   107		struct regmap *map = tas_priv->regmap;
   108		int ret;
   109	
 > 110		if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
   111			ret = regmap_write(map, TASDEVICE_BOOKCTL_REG,
   112					   TASDEVICE_BOOK_ID(reg));
   113			if (ret < 0) {
   114				dev_err(tas_priv->dev, "Switch Book E=%d\n", ret);
   115				return ret;
   116			}
   117			tas_priv->cur_book = TASDEVICE_BOOK_ID(reg);
   118		}
   119		return ret;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
