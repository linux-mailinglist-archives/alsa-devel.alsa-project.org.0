Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D288B3DD
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3899C1945;
	Mon, 25 Mar 2024 23:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3899C1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405240;
	bh=aZ8MMlAsNmooCug9EY0e4T+B0db6AgX3G0/wpztkAFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vHFOHHm2jKkBxda4Kbvdln0WyALaN100DzV9d1ccvWCyuiqTqsh2XClhlb/nxSmiX
	 qcjnvsbsPgEuL+yKQ8FCzZXgABV98Uy9HRLGYoUBdtisHlHWc3Z79nwXcKek4Ok/IV
	 07xDCykoLi31dcu7ou4OV+dmZXSXsBaqBKFT6Tkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB61EF80682; Mon, 25 Mar 2024 23:19:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B99A0F8067A;
	Mon, 25 Mar 2024 23:19:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A8AAF8025F; Mon, 25 Mar 2024 23:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 598E6F80580
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 598E6F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BGXFu6hN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405118; x=1742941118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZ8MMlAsNmooCug9EY0e4T+B0db6AgX3G0/wpztkAFc=;
  b=BGXFu6hNfah9tHioFTdU6W0W/9+5c9Sh02RsGKg3kZptRLmNBPOqx393
   /PP28MOj8Hp4lwUw6GuylmFmDeS19UudjJqHDa2mDw+7UH3zRQ3f2AUdo
   pmaNA2/j5umUPruTh4b29+LkBCLOWyFBnUlgwopb2M/ggpdH24Bnh4ggs
   0AQyFvXJSsPfXDU0R5xetFNPyT2rZv84YAp3OXV7txQjxH8aivCC1lI44
   YJxfRsjir4cs8JrQekFKYSK9WRTVhH+QxXsAMXSvEYpnjpwKwfDIE5aBm
   IH4dx8ymZTBLGT2rLCtmskx9Hz2ZAkQnrs355/2W1uxUC+zb8XOXeLRk3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300376"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6300376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="20309646"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 3/6] ASoC: rt711-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:14 -0500
Message-Id: <20240325221817.206465-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HNIT2X6WGYYJDJHYLMQB2K4FGFDQEKVU
X-Message-ID-Hash: HNIT2X6WGYYJDJHYLMQB2K4FGFDQEKVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNIT2X6WGYYJDJHYLMQB2K4FGFDQEKVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: b69de265bd0e ("ASoC: rt711: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 3f5773310ae8..988451f24a75 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -536,12 +536,12 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt711->disable_irq_lock);
 		if (rt711->disable_irq == true) {
-			mutex_lock(&rt711->disable_irq_lock);
 			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
 			rt711->disable_irq = false;
-			mutex_unlock(&rt711->disable_irq_lock);
 		}
+		mutex_unlock(&rt711->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

