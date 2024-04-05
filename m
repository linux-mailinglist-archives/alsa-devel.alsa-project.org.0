Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232189990C
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E412CEA;
	Fri,  5 Apr 2024 11:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E412CEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308295;
	bh=ANzCgsUumNqSlnkBuuI/derpqfxzEvU8fc97dO+tuUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hjsl9rj0L9ff+Wp6CuXjzZlsNfTqSP6l/Js2D/zB31Nr5dvYB9Rt59Ws2Bb4xKhfG
	 UdYOz4fzAkVQHzK8+xbOg2NG5wbBb7jc+/RT+kadxgkFPCI30E5TAnCjx8dIJbJYAi
	 y8x0+/zDgY9bFnG1uKX7NXI2PRvYadUds3mQXOe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D68CF8060A; Fri,  5 Apr 2024 11:10:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDBAF805F2;
	Fri,  5 Apr 2024 11:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E531AF80579; Fri,  5 Apr 2024 11:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85F40F80236
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85F40F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=luyHG5dp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308094; x=1743844094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ANzCgsUumNqSlnkBuuI/derpqfxzEvU8fc97dO+tuUg=;
  b=luyHG5dpachni/j9AWbiKbcjM8Mvc3mheHOdHnEBuYkD+5Jukta9/sRy
   vOCPDm56wHT9LHpOG4u/1Tdq3uerlfGFz75MYBXwp1Ppv+34h2forQAjg
   TxTcP2k0xq0rd2LbjYxr3AjuurkI/2GXVTls6R+o7l/Muu766syl/jAsL
   WUcdaqIgwYw6kfk5eVvAxpSNf+/tb7HUZ3GuHS9vlJsWpiWOEeBIgD5Eq
   F0fpwOTyEdEnB9a8kGGM85+hQVXg4uWF716zhPRcz2bMt4VT0UNXWqAyI
   fT9+4xlA51mJN/ggjpmf7hsA51rq/GF5H9faFEr9283FOQUgLnXSYwb/9
   A==;
X-CSE-ConnectionGUID: VBn5Kk3LStS0PdU+5wAzXg==
X-CSE-MsgGUID: U4Ve5jjSTnOCa+uOlMJV6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787421"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:12 -0700
X-CSE-ConnectionGUID: hKJQVxYSTlCYR2ZSlDf7gg==
X-CSE-MsgGUID: 9bXG8zgCTZyHsmKCPdogHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042420"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/13] ASoC: Intel: avs: Silence false-positive memcpy()
 warnings
Date: Fri,  5 Apr 2024 11:09:19 +0200
Message-Id: <20240405090929.1184068-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X3VLI5ZA2NH6ULR2ACO3DFSHTBUKH2C3
X-Message-ID-Hash: X3VLI5ZA2NH6ULR2ACO3DFSHTBUKH2C3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3VLI5ZA2NH6ULR2ACO3DFSHTBUKH2C3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") enforced
strict flex array declarations. This generates false-positive in form of:
"memcpy: detected field-spanning write". Avoid it by utilizing the
DECLARE_FLEX_ARRAY() macro.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 4 ++--
 sound/soc/intel/avs/path.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 4e609a08863c..007bc4fb6d99 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -752,9 +752,9 @@ struct avs_copier_gtw_cfg {
 	union avs_connector_node_id node_id;
 	u32 dma_buffer_size;
 	u32 config_length;
-	struct {
+	union {
 		union avs_gtw_attributes attrs;
-		u32 blob[];
+		DECLARE_FLEX_ARRAY(u32, blob);
 	} config;
 } __packed;
 
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index e785fc2a7008..5944865a1193 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -254,7 +254,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	/* config_length in DWORDs */
 	cfg->gtw_cfg.config_length = DIV_ROUND_UP(data_size, 4);
 	if (data)
-		memcpy(&cfg->gtw_cfg.config, data, data_size);
+		memcpy(&cfg->gtw_cfg.config.blob, data, data_size);
 
 	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
 
-- 
2.25.1

