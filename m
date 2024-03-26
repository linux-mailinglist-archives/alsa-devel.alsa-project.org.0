Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7A88C8BA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11A7C2BB0;
	Tue, 26 Mar 2024 17:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11A7C2BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469629;
	bh=tREAwQrFehuM87JjX9YUMXsTXTVzigFunxTBdz/OtwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GEszXnmaVTOxAeKPxLxmZoY5/kDDndIG7yAbFFu+kC0E5KTZHVr/S6Fo7NUKWYZMT
	 GMUooydAasbuMXaknK474qyXF0ia6+6uLv2bgL8mKPpn3ZM5AyfQ3aWbGFag3RodJS
	 q113rwXnxjuE3tO91Sd5njnhO+zKc4oGn6kntKqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF40FF8979C; Tue, 26 Mar 2024 17:07:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18371F8057D;
	Tue, 26 Mar 2024 17:07:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F3D2F8085C; Tue, 26 Mar 2024 17:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC479F805F3
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC479F805F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZTGUPHG0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469156; x=1743005156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tREAwQrFehuM87JjX9YUMXsTXTVzigFunxTBdz/OtwY=;
  b=ZTGUPHG0Uk2nadxmFxFNLo+7FIVRcCdbB9tJT/bRvHQbQTteG1upqxXy
   hNHGzYqkW0MpborFIcPaBIPgbX4mLphGkHbiXxS4L5EsAJB8bwYc8ulmA
   yI+oC7eZ04db2eWsgYl0LFffdatLmiLXBkTYTL8fGo9s05H3m/7RqPSul
   gJKfJ5cTLqWbmeszHGC738ACxSnsCWfLIF0n5fQCj/CVMkCSwz1Q1srCE
   axp74wupFmjzMFt0xCPneA4cZzL+08rReWoh3MCiOjsey7XIjEtZA4ZP4
   eneNQ2NHDlXoZD+FOk95ZqV3lp4KZmFOxwzn7UWm2M4lY/cD5ZyG0XoLu
   Q==;
X-CSE-ConnectionGUID: 82o2jKAyQGSwVT88kb0xoA==
X-CSE-MsgGUID: wclN6yr/SlOgnMAzqpvs8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260507"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482392"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 25/34] ASoC: Intel: sof_sdw: remove unused rt dmic rtd_init
Date: Tue, 26 Mar 2024 11:04:20 -0500
Message-Id: <20240326160429.13560-26-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TXIFU3AU3BDHOGM2I777UQDWAIV6TRND
X-Message-ID-Hash: TXIFU3AU3BDHOGM2I777UQDWAIV6TRND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXIFU3AU3BDHOGM2I777UQDWAIV6TRND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some Realtek SDW DMIC codecs use the generic rt_dmic_rtd_init callback now.
Remove unused rtd_init callbacks.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile             |  3 +--
 sound/soc/intel/boards/sof_sdw_common.h     |  3 ---
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c | 24 -------------------
 sound/soc/intel/boards/sof_sdw_rt715.c      | 26 ---------------------
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c | 26 ---------------------
 5 files changed, 1 insertion(+), 81 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 08cfd4baecdd..8f711be46c43 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -40,8 +40,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
-			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
-			sof_sdw_rt715_sdca.o sof_sdw_rt722_sdca.o	\
+			sof_sdw_rt712_sdca.o sof_sdw_rt722_sdca.o	\
 			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index decaed97fa74..84715d9ca942 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -193,10 +193,7 @@ int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 9c898c7286af..0c4cd4cdbd45 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -66,27 +66,3 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static const char * const dmics[] = {
-	"rt712-sdca-dmic"
-};
-
-int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_component *component;
-
-	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:%s",
-					  card->components, component->name_prefix);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
deleted file mode 100644
index b5a886cd595d..000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
-
-/*
- *  sof_sdw_rt715 - Helpers to handle RT715 from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include "sof_sdw_common.h"
-
-int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:rt715",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
deleted file mode 100644
index 4b37a8a6dd2e..000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
-
-/*
- *  sof_sdw_rt715_sdca - Helpers to handle RT715-SDCA from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include "sof_sdw_common.h"
-
-int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:rt715-sdca",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-
-- 
2.40.1

