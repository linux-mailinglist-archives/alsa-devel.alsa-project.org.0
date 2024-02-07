Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EC84CA77
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 13:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69927820;
	Wed,  7 Feb 2024 13:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69927820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707307849;
	bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+jiSqc1b5owjY44bqlEK/SWS6kAm+MfFTuySfBuQO3ycQqEbw50tTE+MSJh9XZ9V
	 9ulbFZ6Fy0xBn/ZzFHkuugDWdjJBf0aBLDej/k7m43gKIq6xOVndm8Vpc1tEZZqq5+
	 JEKF5kizvX3eXtc86XqV9fGzypsFkZCYJR1T1eX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A661F8060B; Wed,  7 Feb 2024 13:09:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 042B2F8060F;
	Wed,  7 Feb 2024 13:09:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E90F8057B; Wed,  7 Feb 2024 13:09:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A83A3F804E7
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 13:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83A3F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NeJk2utY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307768; x=1738843768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko10ZkzkLNKDt3XPWSA4Pl4GxMkRRlKq5pWgyGeCp8g=;
  b=NeJk2utYf1weVlUKdveppWd5l7x+9GU680pbWDb40eqYaecnfFGiK/Rh
   djf0xDaaFFNvaeZNC6J7w9eOGHJCNWcIf3XuWiLz4v8x8Sy8fsXnOOCTh
   wNyFfcPvkUaUpTDYBq1IFrFKUK4Ya//L+6wVK2NtHrcmktjnaLnPQs1Qh
   V7aDPYvPrFROrwKSdG3ox9cByblwMX4jOHlg3vjJOxCPd5GUeqaUtHSUE
   BkedADPPGJRbm4ihqJ2SJjOS7pQ1elDm570hdP+mI8GponnEkuEOhOJQU
   xvJ8Foi6wUh3ntZI3Wq9avnU0CXct8T9PWkG1wSnMZ8Vjvfxu5UeJonHA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4757856"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="4757856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 04:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="1631810"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 04:09:22 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/3] ASoC: Intel: avs: Send initial config to module if
 present
Date: Wed,  7 Feb 2024 13:09:46 +0100
Message-Id: <20240207120946.2140480-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TL7R7D5QX7PLKZ4ZHQPHMAV4KJFT4NGW
X-Message-ID-Hash: TL7R7D5QX7PLKZ4ZHQPHMAV4KJFT4NGW
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TL7R7D5QX7PLKZ4ZHQPHMAV4KJFT4NGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there are initial configs to send to module on init do send them.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3aa16ee8d34c1..e785fc2a7008f 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -547,6 +547,33 @@ static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_mod
 	return avs_modext_create(adev, mod);
 }
 
+static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_soc_component *acomp;
+
+	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
+
+	u32 num_ids = mod->template->num_config_ids;
+	u32 *ids = mod->template->config_ids;
+
+	for (int i = 0; i < num_ids; i++) {
+		struct avs_tplg_init_config *config = &acomp->tplg->init_configs[ids[i]];
+		size_t len = config->length;
+		void *data = config->data;
+		u32 param = config->param;
+		int ret;
+
+		ret = avs_ipc_set_large_config(adev, mod->module_id, mod->instance_id,
+					       param, data, len);
+		if (ret) {
+			dev_err(adev->dev, "send initial module config failed: %d\n", ret);
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	return 0;
+}
+
 static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	kfree(mod);
@@ -580,6 +607,12 @@ avs_path_module_create(struct avs_dev *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = avs_path_module_send_init_configs(adev, mod);
+	if (ret) {
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
 	return mod;
 }
 
-- 
2.34.1

