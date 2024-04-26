Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A968B3B48
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1C893A;
	Fri, 26 Apr 2024 17:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1C893A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145100;
	bh=UJY7grWSVVzmt71CoQKUJ8Ty1qxgNvohbcE1hvLC7tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=srtJQNVWWXFQ1AHt7dIpcj2IN7LqxjvOT/3jWizIo/Ns+iPKIvJpBUJ+aIZqlaoaO
	 P4SMunUdv54Ch+YJy63WtHlprtey29RMwUQr/aL+GgsjPK/KJYtkivLq9wcKgSyQt1
	 +TkK2excAR0ySy5oFmTb1vRQdQhbtHZx2mYbMiIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33DC1F806DF; Fri, 26 Apr 2024 17:22:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A77F806CC;
	Fri, 26 Apr 2024 17:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D0EF805FE; Fri, 26 Apr 2024 17:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BC4CF8056F
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC4CF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cpKWxmhd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144912; x=1745680912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJY7grWSVVzmt71CoQKUJ8Ty1qxgNvohbcE1hvLC7tk=;
  b=cpKWxmhdf0SP+/xxtlcFWQjNB4nwcZacELQ8RQT/fSOF73eteBx/Te3u
   9zhCaLYtt2szo78UtoI00XKakR9i14/WQCAYtzFMeq5CqKoSizXJbcxW1
   p5aLyAMmWk/e7PGP8FHsTb2EhQ3NDvrho3EhphVKJAj6ZXwcEaXWWgF9m
   L485omQfH6MzxjE50kWy11wdwkEEReNvdVlZVuF2aerh9xFL3/zb6KviV
   DdTtbh1GG3E2ist5knn+CbYiCPmH3Q35CblgGhy0fcTusRm06l3AVrx0U
   TUQ2s93a3PIRUKRz1HJWCIsqB27LeqJ+Kw2iyhmlXyJs7ZKBSEAgXV530
   g==;
X-CSE-ConnectionGUID: hZ2c756oTVO5YflpCz+/WQ==
X-CSE-MsgGUID: LOK0V5msRmOUdhmRhQFibg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290636"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290636"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:44 -0700
X-CSE-ConnectionGUID: gt9LVAm6QmiwgOr3gOQCRw==
X-CSE-MsgGUID: RwChO4oNRTmnwcKIe8RYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259034"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 09/12] ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk
Date: Fri, 26 Apr 2024 10:21:20 -0500
Message-Id: <20240426152123.36284-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CF4MCYXZAUIUJI3DMNMKNZG7Y6VKED5B
X-Message-ID-Hash: CF4MCYXZAUIUJI3DMNMKNZG7Y6VKED5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CF4MCYXZAUIUJI3DMNMKNZG7Y6VKED5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two independent GitHub PRs let to the addition of one quirk after it
was removed..

Fixes: b10cb955c6c0 ("ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f0622aa1b748..86bbf1c66ce8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -421,8 +421,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

