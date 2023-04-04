Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA916D5DCD
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE633E7;
	Tue,  4 Apr 2023 12:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE633E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605077;
	bh=zlj3S5OlskMjOo6iJY2mY3oWTC7JF3+VeOVIm8hysvc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8ZUl/f4AqecBs+7xHD3Bfi3B9l3MrTqK03+s2xWt9NyCPq9KVkhEgjkIF3z88OEE
	 531DKr847AIYqfE2kSMAVs9kTYDUxtg5nMQOdePWnhe9XOipuNXmPrkdHDdPIn5BeO
	 TS0wPBq8pa1mNmYIGcOTb8C0RoGpEB5bM4so8V+o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 100FAF8057C;
	Tue,  4 Apr 2023 12:41:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE34F8057C; Tue,  4 Apr 2023 12:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AF80F80544
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF80F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T9MwDVBs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604877; x=1712140877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zlj3S5OlskMjOo6iJY2mY3oWTC7JF3+VeOVIm8hysvc=;
  b=T9MwDVBsV8BXA6V2YQd73r046tIRth4qujXQ2dwwHTNfFAPCCxahmL2n
   kyAhXdoHJwfF82N5qUeKHfq7K6aiYr8v/2Ulgv8XlJToT4sjpaedTnTtj
   HlBJrl0WyTGwXa7Wqq9DvH92R5eSHZGko/Vp5B1/4DL6iuNET8dFGZ2zQ
   zOtO1qhJtPD7AZB5xrtFJ5tMlf4xhtbFi9n1ZQgqO7TEsLB5uYK2TVlCZ
   k6LEvmIpeBXd7LkJCpq0tFFLupAYKN1Qm+DRhXNhlabA+canLA1Ui3yP/
   crYo67Pet8UtZ8PYrZJqE9s1NstKq4RZhtFpdLSUHVith3xGCk7QVqhdO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878003"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930148"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930148"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 07/18] ASoC: SOF: Intel: hda-mlink: special-case HDaudio
 regular links
Date: Tue,  4 Apr 2023 13:41:16 +0300
Message-Id: <20230404104127.5629-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LW66F4XYP6LQ3BAV5EVVYSMLNUG74ECK
X-Message-ID-Hash: LW66F4XYP6LQ3BAV5EVVYSMLNUG74ECK
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LW66F4XYP6LQ3BAV5EVVYSMLNUG74ECK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For backwards compatibility, HDaudio/iDISP links are powered-on when
exiting reset, and the existing driver forces them to be powered-off
when entering S0ix. In addition, the get/put helpers are invoked
directly by the ASoC codec drivers, which a historical layering
violation.

Extended links are powered-on by software only, during the probe and
DAI startup phases. This calls for a different handling of the
'regular' and 'extended' audio links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index e6b20182f099..8a66c0a67589 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -255,8 +255,12 @@ void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
 
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		snd_hdac_ext_bus_link_put(bus, hlink);
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt)
+			snd_hdac_ext_bus_link_put(bus, hlink);
+	}
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_put_all, SND_SOC_SOF_HDA_MLINK);
 
@@ -277,7 +281,9 @@ int hda_bus_ml_resume(struct hdac_bus *bus)
 
 	/* power up links that were active before suspend */
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		if (hlink->ref_count) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt && hlink->ref_count) {
 			ret = snd_hdac_ext_bus_link_power_up(hlink);
 			if (ret < 0)
 				return ret;
@@ -289,7 +295,19 @@ EXPORT_SYMBOL_NS(hda_bus_ml_resume, SND_SOC_SOF_HDA_MLINK);
 
 int hda_bus_ml_suspend(struct hdac_bus *bus)
 {
-	return snd_hdac_ext_bus_link_power_down_all(bus);
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (!h2link->alt) {
+			ret = snd_hdac_ext_bus_link_power_down(hlink);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return 0;
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
-- 
2.40.0

