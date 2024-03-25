Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782588B3D9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E12240A;
	Mon, 25 Mar 2024 23:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E12240A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405170;
	bh=LsfXWzcl5OsXzgaN9liYKZEHKQDP9vHjurMHe5iJAkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MqRXMBFXcHnKyo2VuwB86jtX7iF15Ccx/wS/0XF098Hxv++oe+/r9StiKH7FeE3+J
	 I3PsXuSUUn2d84KLGXZSbcsfhrkHIYnd7OCModyGEPOITRWEmh44SibyLa5w0BE9+R
	 cPIhSilLPIJ1ftbVY6SOWVCtcmZZ1p4AY5vQGDmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AA29F80093; Mon, 25 Mar 2024 23:18:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0EA1F805E5;
	Mon, 25 Mar 2024 23:18:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E27BEF805A0; Mon, 25 Mar 2024 23:18:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40C03F8057F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C03F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a04q8xQ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405116; x=1742941116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsfXWzcl5OsXzgaN9liYKZEHKQDP9vHjurMHe5iJAkY=;
  b=a04q8xQ4zmYs8A82FILDkToTcCMtsXTooSXpv71jxTU0n6GcMGiTirHX
   OV+5cxm/bQtbQgHds35mzTgWVedB0U08fZ5I79CsxP1XsV+/nXW9kqZdd
   vUro0nwiA/Ir5NtwVwYnuukc4Oj6NOcvh8p+ZaC1Tmmcir1v1egal5ztN
   pzpHVObLFj78nN0OpUWghxui6cJY8jGN+P4LR0MptpQL+KcF3mKcoyikl
   GnzDN1wDGiUwQ42RXyTwCesFsfmJNjXaAfooiEqa5A3bVCJWPtkmVHL+O
   b7nnTLBodndZb0w3DfjsMCd/0VXHDCgcFIzbrlLI95yRFI5RYoBXI5bX/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300367"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6300367"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="20309642"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 1/6] ASoC: rt5682-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:12 -0500
Message-Id: <20240325221817.206465-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KAP3AFHDYJ7HGLUVJWEMLEXPER4CF53T
X-Message-ID-Hash: KAP3AFHDYJ7HGLUVJWEMLEXPER4CF53T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAP3AFHDYJ7HGLUVJWEMLEXPER4CF53T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: 02fb23d72720 ("ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index e67c2e19cb1a..1fdbef5fd6cb 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -763,12 +763,12 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt5682->disable_irq_lock);
 		if (rt5682->disable_irq == true) {
-			mutex_lock(&rt5682->disable_irq_lock);
 			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
 			rt5682->disable_irq = false;
-			mutex_unlock(&rt5682->disable_irq_lock);
 		}
+		mutex_unlock(&rt5682->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

