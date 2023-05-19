Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E670972D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0496983A;
	Fri, 19 May 2023 14:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0496983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498722;
	bh=u5Nahq9CX7GjjYoRTCKrr/zt3xwGYj72/z0XAbEL9xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1EFyUm7iQCdhvyyGaxrNtiv1LvUmBJi+jD2mmkjEDul/ceXzCo1XLc9crQSmohr2
	 av8eR/fHN/gEATqaSsJs1GujX47ZSnC2++h2rPacsXePvw8RGLcn66IB1eSBNeifQF
	 5cfLZ/4ab3hutMgSXJC8LpYVcDg5CCjzECGADOoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D626BF805B1; Fri, 19 May 2023 14:16:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B821F805AD;
	Fri, 19 May 2023 14:16:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE97F8055B; Fri, 19 May 2023 14:16:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82D9BF80548
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D9BF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KwBo0vO8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498565; x=1716034565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5Nahq9CX7GjjYoRTCKrr/zt3xwGYj72/z0XAbEL9xg=;
  b=KwBo0vO8KNX6V/6CUodGiKR0J7pIFzS1u4TIwdrK5sbVH+ksxJoTZQ4n
   seNjkmSecwKRV99LAf0E3EGXB0Db/PXh1XSHnebzYZzQMizUYHYTgGSw2
   xjvlZAQ40tTd1+38ziCFUTmsGP/LNnmHqavZS/rknw+NNBGWKKXFRwQJ1
   MS9CjUHrx6HuAZSC/kI+3F9FYcAD9KziH3TY7GIdtQv+ek6V45m33M92s
   RadZgKMWjr2FCV5vu9ObmQXmN9qZ8/N0CGuTguNHkqQuyl6NgIKrwza7j
   S8tNvf4Elu7SDoXX5dNDYNpPe/PnTPuMP1ama2+wjiCFvUCHwi37Q/Ekg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584459"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283702"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283702"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:16:02 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 6/7] ASoC: Intel: avs: Fix avs_path_module::instance_id size
Date: Fri, 19 May 2023 22:17:10 +0200
Message-Id: <20230519201711.4073845-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JSX74UE6X33ONN4I35VHHTBZP4G7VVRT
X-Message-ID-Hash: JSX74UE6X33ONN4I35VHHTBZP4G7VVRT
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSX74UE6X33ONN4I35VHHTBZP4G7VVRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All IPCs using instance_id use 8 bit value. Original commit used 16 bit
value because FW reports possible max value in 16 bit field, but in
practice FW limits the value to 8 bits.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h    | 4 ++--
 sound/soc/intel/avs/dsp.c    | 4 ++--
 sound/soc/intel/avs/path.h   | 2 +-
 sound/soc/intel/avs/probes.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index d7fccdcb9c16..0cf38c9e768e 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -283,8 +283,8 @@ void avs_release_firmwares(struct avs_dev *adev);
 
 int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u8 core_id, u8 domain, void *param, u32 param_size,
-			u16 *instance_id);
-void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+			u8 *instance_id);
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			   u8 ppl_instance_id, u8 core_id);
 int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 			    bool lp, u16 attributes, u8 *instance_id);
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index b881100d3e02..aa03af4473e9 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -225,7 +225,7 @@ static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
 
 int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u8 core_id, u8 domain, void *param, u32 param_size,
-			u16 *instance_id)
+			u8 *instance_id)
 {
 	struct avs_module_entry mentry;
 	bool was_loaded = false;
@@ -272,7 +272,7 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 	return ret;
 }
 
-void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			   u8 ppl_instance_id, u8 core_id)
 {
 	struct avs_module_entry mentry;
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 197222c5e008..657f7b093e80 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -37,7 +37,7 @@ struct avs_path_pipeline {
 
 struct avs_path_module {
 	u16 module_id;
-	u16 instance_id;
+	u8 instance_id;
 	union avs_gtw_attributes gtw_attrs;
 
 	struct avs_tplg_module *template;
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 70a94201d6a5..275928281c6c 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -18,7 +18,7 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 {
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
-	u16 dummy;
+	u8 dummy;
 
 	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
 
-- 
2.34.1

