Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84B938B3F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 10:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00CDE68;
	Mon, 22 Jul 2024 10:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00CDE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721637178;
	bh=sNxor0rL/zyQgFc1ihPqOWgxV/sr0J968WghxDq+t1Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FiIRsZYpmaBEwvmrz597T5YhmpfeG6dzhgdA6HyDsH+CFHuOQzxuro4Z8il3NAJU3
	 0+BW62LNJvh3bqobm9JdSexRK7htpOq+NjcUGfibdhdMGbXDvRba6Q3w2C9kwc3jZy
	 czJ8EQ1/cCwUujoBTwchWRDz2IeiYuBPmwQo6KJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D266F805B3; Mon, 22 Jul 2024 10:32:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E740F805AF;
	Mon, 22 Jul 2024 10:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA7DF801F5; Mon, 22 Jul 2024 10:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EC22F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 10:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC22F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jm3RKDkZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721637023; x=1753173023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sNxor0rL/zyQgFc1ihPqOWgxV/sr0J968WghxDq+t1Q=;
  b=Jm3RKDkZPDCwKCqwl5WPTTx6LYKxwFJLb8leUhpQXmtmM3GZTEHhrcN8
   NrlUMIMjK4eyuoUk7Ti7dQ+Fe7url101Ks7NJ1gdEmoTS+MJKPftPV/Lr
   P/ZnFEATR/b1jTw6HutS4cSDSMV5qdLn40Rfc7jekvMG0x3lzJvrxUWNt
   lQesG+zyK6B0a3JxUEVIcjRUwr8n5+Q4wqeVUqkn/yU75JWaLgrVDaljy
   lYjTaPakLDpumkpOVoHfwpih16Tm9Fgp1BUYPH4Kc5s+F7htXP13xc5hW
   1aEGB7dPjzWOzVx5J418Dn70bJLdf/Fkn9rHDz/6pygf/R1vxqsh27GXh
   Q==;
X-CSE-ConnectionGUID: rEu35WycQOqxN/tNL7gKcQ==
X-CSE-MsgGUID: pFsoBUlgSZSRfFEKGUSH9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19320849"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="19320849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:30:17 -0700
X-CSE-ConnectionGUID: 4iWpr9BbT6+aRBLbPY9l5Q==
X-CSE-MsgGUID: PoaYMgEbSUacfhmV5SKc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="82453834"
Received: from ettammin-desk.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.242])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:30:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is
 reachable
Date: Mon, 22 Jul 2024 10:30:02 +0200
Message-ID: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7NRN3QBSUGYHWW6NXSJN2VSQ63MEHHYX
X-Message-ID-Hash: 7NRN3QBSUGYHWW6NXSJN2VSQ63MEHHYX
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NRN3QBSUGYHWW6NXSJN2VSQ63MEHHYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

the Intel kbuild bot reports a link failure when IOSF_MBI is built-in
but the Merrifield driver is configured as a module. The
soc-intel-quirks.h is included for Merrifield platforms, but IOSF_MBI
is not selected for that platform.

ld.lld: error: undefined symbol: iosf_mbi_read
>>> referenced by atom.c
>>>               sound/soc/sof/intel/atom.o:(atom_machine_select) in archive vmlinux.a

This patch forces the use of the fallback static inline when IOSF_MBI is not reachable.

Fixes: 536cfd2f375d ("ASoC: Intel: use common helpers to detect CPUs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407160704.zpdhJ8da-lkp@intel.com/
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-intel-quirks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index de4e550c5b34..42bd51456b94 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -11,7 +11,7 @@
 
 #include <linux/platform_data/x86/soc.h>
 
-#if IS_ENABLED(CONFIG_X86)
+#if IS_REACHABLE(CONFIG_IOSF_MBI)
 
 #include <linux/dmi.h>
 #include <asm/iosf_mbi.h>
-- 
2.43.0

