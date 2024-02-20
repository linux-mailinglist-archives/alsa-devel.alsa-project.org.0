Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCD85BCD1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D287FB70;
	Tue, 20 Feb 2024 14:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D287FB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434275;
	bh=ovZnYDdmAQI7rXlK0aS2n+UC6x/9BooKMiz/Jy6lbxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FIZa9rz/hW/FPMpQ+P2mUylOkZgtimqOnYlmH5S/ZNE52J3wWsetNTxlkkbpWZODA
	 pMsX56UiDC56GUleb4yQe73rxr3F23igerxJzcm2knUCeqvwrHqMYwrmVCKxxrkJvD
	 Bhvvk2tjAVkHYQjhwJrQIZa2wP3Nx8+3YR8gwE0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D98F805A0; Tue, 20 Feb 2024 14:04:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C87F805AB;
	Tue, 20 Feb 2024 14:03:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 417BEF8057A; Tue, 20 Feb 2024 14:03:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DD10F80104
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD10F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QwT7d8SI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434218; x=1739970218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ovZnYDdmAQI7rXlK0aS2n+UC6x/9BooKMiz/Jy6lbxk=;
  b=QwT7d8SIOQ3QoFoXYnRQht+w7t/MUdsjZFhM+DQULTMG5aiwB3S6HpPn
   X/jUGuyVzhZFvnmchkERSu/kerPa+pEm3HgEB3jJ3pAFPrRrbVDYgEnC0
   N6EhesPGfVYqNXFx0O4nLKjEwLj+LKqh/p6tAK10Y40d6JSpr9vRZdDsb
   csBNJPRNifQUT/L1Deuz+0BiHzaTdmz/W8Mu1MGgJx1kfYa0LHUf2kHD6
   CSKgP/j6Wqubt3BOICfpnGc/rpoOOZjqKgEhwM4WpMcXiFR1P+AhaanMf
   vN8aQREXObFfx0rr8It/y9r0AxtWLk2Wnf9RvOOBQZLXcEEunTpLmp+91
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988918"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4750941"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/10] ASoC: Intel: avs: L1SEN reference counted
Date: Tue, 20 Feb 2024 12:50:26 +0100
Message-Id: <20240220115035.770402-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZKOM5UFGC5KPN7WAWPQ5NQ7ASF5QUQQQ
X-Message-ID-Hash: ZKOM5UFGC5KPN7WAWPQ5NQ7ASF5QUQQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKOM5UFGC5KPN7WAWPQ5NQ7ASF5QUQQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Code loading is not the only procedure that manipulates L1SEN. Update
existing mechanism so the stream starting procedure can interfere with
L1SEN without causing any trouble to its other users.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h  |  1 +
 sound/soc/intel/avs/core.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 69c912feb8a7..1882b2e640f4 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -127,6 +127,7 @@ struct avs_dev {
 	int *core_refs;		/* reference count per core */
 	char **lib_names;
 	int num_lp_paths;
+	atomic_t l1sen_counter;	/* controls whether L1SEN should be disabled */
 
 	struct completion fw_ready;
 	struct work_struct probe_work;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 273a90216856..d46f76f8c274 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -69,9 +69,14 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
 
 void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
 {
-	u32 value = enable ? AZX_VS_EM2_L1SEN : 0;
-
-	snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, value);
+	if (enable) {
+		if (atomic_inc_and_test(&adev->l1sen_counter))
+			snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN,
+					      AZX_VS_EM2_L1SEN);
+	} else {
+		if (atomic_dec_return(&adev->l1sen_counter) == -1)
+			snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, 0);
+	}
 }
 
 static int avs_hdac_bus_init_streams(struct hdac_bus *bus)
-- 
2.25.1

