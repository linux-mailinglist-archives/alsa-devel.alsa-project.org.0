Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7388B3DC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0912123D0;
	Mon, 25 Mar 2024 23:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0912123D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405229;
	bh=JM91qWLrzz5r6vN2DJex8F2XuWORUzWJO1ZJmGsLDOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kkAw5txG3Tn37D1h9R4eQhg73yvHuc882mh7AytgV1FKWawxcX9KjKzzcJYRP49cb
	 R5Jg4HLGwEy69178yxQgGkD3QB66VX0lZefx8ZEdOcgSPX/qB31Rp7+TQrBC3umt/F
	 AifRlTWecqzQgq9sSp2AjqZHBQL2OLoKNVjGcOsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7899DF8068E; Mon, 25 Mar 2024 23:19:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B20F7F80671;
	Mon, 25 Mar 2024 23:19:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34034F80564; Mon, 25 Mar 2024 23:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33BB0F80589
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33BB0F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fh6MH4MP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405118; x=1742941118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JM91qWLrzz5r6vN2DJex8F2XuWORUzWJO1ZJmGsLDOU=;
  b=Fh6MH4MPGF5oDnIt1oxlvMiEgubsXtDaJiox6+ThaeQdYANd3lKIRcKN
   knORPM7OqEJBui7FxtVEinlL+wIcDvKCeAsfjYQ4qnR2mQpKXTwjvTWeh
   SOqDLpho2dh0CKbMVw47OPfQF9rJv0f1sqz9SEQ5a31dpu839gfgnXrAp
   jTM8ZYUK2N374hGq/VfehdpCu545DaACMlenDcLXzmY6rZSsPen9w0Pbb
   aRGSuXtFBhGEDmPzqL/Bp3vpj04MXe5YZDoC5Mg/P1o592/oaJ9LMafk2
   DYtMCrY1HymemOWLffiPOSFTFLdQVzGn/fnm5IA/O6xCHnoSLdmueWd0I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300379"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6300379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="20309647"
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
Subject: [PATCH 4/6] ASoC: rt712-sdca-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:15 -0500
Message-Id: <20240325221817.206465-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UYGAK3WQB57JJBH54BAGM7V367LP3F37
X-Message-ID-Hash: UYGAK3WQB57JJBH54BAGM7V367LP3F37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYGAK3WQB57JJBH54BAGM7V367LP3F37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: 7a8735c1551e ("ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 01ac555cd79b..36d0dd532b8d 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -438,13 +438,14 @@ static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt712->disable_irq_lock);
 		if (rt712->disable_irq == true) {
-			mutex_lock(&rt712->disable_irq_lock);
+
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
 			rt712->disable_irq = false;
-			mutex_unlock(&rt712->disable_irq_lock);
 		}
+		mutex_unlock(&rt712->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

