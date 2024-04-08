Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9F89BA08
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 10:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD4122A4;
	Mon,  8 Apr 2024 10:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD4122A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712564322;
	bh=hWpkCqxGQaDmaI3UrlCyIJvMhWnM4kJOUrQsdH+VEMk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RBs5avJgLVLyFotxQUVlu+FHy+LJ/vO6tHAlElIOzkDoaTYi3LwS7XJv/00QWK1wG
	 KaCecTVUsNGHKnoOxNsdl2sdgNYuDyxMSyMOZjGnatpIp54I4FXCBYV8Yavrt+m0/z
	 fY9At7r4MtzhCfxg8GV7aOe9wNSHpmc9AXxbQ5yU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D51F8057D; Mon,  8 Apr 2024 10:18:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B0FF80130;
	Mon,  8 Apr 2024 10:18:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EDE3F8026D; Mon,  8 Apr 2024 10:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE4AF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 10:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE4AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kZ/o7l8w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712564230; x=1744100230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hWpkCqxGQaDmaI3UrlCyIJvMhWnM4kJOUrQsdH+VEMk=;
  b=kZ/o7l8wekI3nYq5FojG+xi24m8MuIS9CeqEhpVEWgsVzu0p6tbEnLZQ
   C5n+TziZyRrgEEcUE5fvbK4X34Hd6364QlE0Z4NB+249zr1tcqsDEYeSy
   to2vZPuLK5RZ/gWliy/p40xFU3Qi1qzI/uxtBFCprOjvXZjy3zZvoCN98
   jolOXiyblTD7kFhaRJz28jAv6BKr+bThroTboRhBXY3KkGCl7h/AgPS0x
   Yb8VuZm0ev8Pj3m6YLZDA/3abyKtNaz8HzFRaJVt/7e9Y1cJJ7MLHfZgt
   +RXVUBUK60tf9ZAZJb88NZJzhw2xZTs+LzsQ8OkN/3t58OB/KfkoCQUmC
   w==;
X-CSE-ConnectionGUID: TBmgC6XiS1+zY0fVKGgqDg==
X-CSE-MsgGUID: Qm3QLONuQpKf5Ql9M8NbOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="8407051"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000";
   d="scan'208";a="8407051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:16:59 -0700
X-CSE-ConnectionGUID: ff6g1z8fRSCirK/jH6WeiQ==
X-CSE-MsgGUID: Nv3cBT3JR0uaBRu065JJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000";
   d="scan'208";a="20245004"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 01:16:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix debug window description
Date: Mon,  8 Apr 2024 10:18:40 +0200
Message-Id: <20240408081840.1319431-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VG2FEWZT2QYB2LGQ4TCAJQ56YVLUZC7O
X-Message-ID-Hash: VG2FEWZT2QYB2LGQ4TCAJQ56YVLUZC7O
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VG2FEWZT2QYB2LGQ4TCAJQ56YVLUZC7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recent changes addressed PAGE_SIZE ambiguity in 2/3 locations for struct
avs_icl_memwnd2. The unaddressed one causes build errors when
PAGE_SIZE != SZ_4K.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404070100.i3t3Jf7d-lkp@intel.com/
Fixes: 275b583d047a ("ASoC: Intel: avs: ICL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Follow up to the recent series for the avs-driver [1]. With
static_asserts() added [2], build problems occur when
PAGE_SIZE != SZ_4K. Patch fixing memory window description [3] fixed
only 2/3 offending spots.

[1]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-13-cezary.rojewski@intel.com/
[3]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-3-cezary.rojewski@intel.com/

 sound/soc/intel/avs/icl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index e8b4983e03e9..7a1ecf241856 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -66,7 +66,7 @@ static_assert(sizeof(struct avs_icl_memwnd2_desc) == 12);
 struct avs_icl_memwnd2 {
 	union {
 		struct avs_icl_memwnd2_desc slot_desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
-		u8 rsvd[PAGE_SIZE];
+		u8 rsvd[SZ_4K];
 	};
 	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][SZ_4K];
 } __packed;

base-commit: 1f58d8580e5da64669d923ced99cb3e29832273b
-- 
2.25.1

