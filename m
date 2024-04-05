Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6ED899915
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D2182CF3;
	Fri,  5 Apr 2024 11:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D2182CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308343;
	bh=7o8XbCGvId3xPxY/IVwzWfcwOdaHK6AoLQbT+r4Ziy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MAA+k/Lw4xEMRZ2x6B2Sr6v78IBOlJwEqkL6mvVhFfLMKqNjCGlXTHGuLmEkS6sR3
	 yxVlYnVXw+To08pm8B1MI6C6WYmz4pUrz5PCtaojgMuVjhd+b3qiSStQdOH8I3wYjH
	 n9Qu7I7Q5JWQjyrccA1VVsxZhtBRBN47v82mwCwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B1C9F8065B; Fri,  5 Apr 2024 11:10:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67277F8065B;
	Fri,  5 Apr 2024 11:10:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE771F80578; Fri,  5 Apr 2024 11:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8C47F8055C
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C47F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wm4XODVy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308100; x=1743844100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7o8XbCGvId3xPxY/IVwzWfcwOdaHK6AoLQbT+r4Ziy0=;
  b=Wm4XODVyQZ8bOO00bvUSuTdzZD5Qpfy8nY48mg28K2mgcL+UUMy4qS0r
   UQvv4kIeE8HRpi3h1VnVym5116Fq/mNPurrkntPQr50HbqYCQlaiUzg0+
   7lmxx+FHpc8vUTVMSGrCKdF5b75l639xpGzv+hPhzI5Cy/zKD1bajbiQI
   96aoZ6etOiciIhJIF2eb+y3AZI5r3806/z3OZRc8sH3sqL00tpaxQW+ry
   uLF41UvjTSU7gWedOC3g7i6R/S+MScgIfdhhiIYmOrVe+2x0HqC9LLeKt
   gQISO37XpD+kzo5Nx2B8vNy6e0PEuxj0tggV8wK/OzvJoTU6NaU+xem3V
   g==;
X-CSE-ConnectionGUID: Mv8SK7hQRCGjsbRuhwfVyg==
X-CSE-MsgGUID: yzAIMngoTCSeh7b+RA3SQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787443"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:18 -0700
X-CSE-ConnectionGUID: ae6VOqs8TWSObeFA2A55zA==
X-CSE-MsgGUID: GkZWwU/wTmC+y2HQTvtLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042430"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/13] ASoC: Intel: avs: Replace risky functions with safer
 variants
Date: Fri,  5 Apr 2024 11:09:22 +0200
Message-Id: <20240405090929.1184068-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2T3DI7RLL4U6JVTIK2CSFXIFNV4AKCY
X-Message-ID-Hash: L2T3DI7RLL4U6JVTIK2CSFXIFNV4AKCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2T3DI7RLL4U6JVTIK2CSFXIFNV4AKCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

strscpy() and snprintf() are the recommended equivalents of their
riskier friends.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 4 ++--
 sound/soc/intel/avs/pcm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 8e34d3536082..57370f0905dc 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -535,7 +535,7 @@ int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs,
 		if (ret)
 			return ret;
 
-		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
+		strscpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
 		id++;
 next_lib:
 		i++;
@@ -698,7 +698,7 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 	}
 
 	/* basefw always occupies slot 0 */
-	strcpy(&adev->lib_names[0][0], "BASEFW");
+	strscpy(adev->lib_names[0], "BASEFW", AVS_LIB_NAME_SIZE);
 
 	ida_init(&adev->ppl_ida);
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 72f1bc3b7b1f..405de1d58178 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1420,7 +1420,7 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 
 	mach = dev_get_platdata(component->card->dev);
 	codec = mach->pdata;
-	sprintf(name, "%s-cpu", dev_name(&codec->core.dev));
+	snprintf(name, sizeof(name), "%s-cpu", dev_name(&codec->core.dev));
 
 	for_each_component_dais_safe(component, dai, save) {
 		int stream;
-- 
2.25.1

