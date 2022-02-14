Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B904B48F8
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A771738;
	Mon, 14 Feb 2022 11:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A771738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644833667;
	bh=uqQLq4r3XQeXrKyg/yfTfYsuiVgvhSCCqA+N/Lc1OMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+N77dGOAyI1oWtkZeyXYUGSf1DRb0yhAMlV2I85HiwnGjSpMer8ZdvQOQqn0k46x
	 m9ZMofgrJx8maQKrTSndojMCipvrCjqsMNe1Lgen1qTeIgdoPXL0L054HYPvqN2pOE
	 1WX0cAqFH5Y1UskQjtAScoqu0n2c8i7o9jPmUY3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 340B6F800C0;
	Mon, 14 Feb 2022 11:12:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85583F804DF; Mon, 14 Feb 2022 11:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31565F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31565F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Po+wRnLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833565; x=1676369565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqQLq4r3XQeXrKyg/yfTfYsuiVgvhSCCqA+N/Lc1OMg=;
 b=Po+wRnLo2RuXERBkkd0aW8TyAd0nlRvnLE5PLkZjdO2YJvanLkGKzRRX
 Ftn+VTMClNnFHnWUZHuzCgJONBasgw9tg9+jkFAKHRy/WAg051rDAgZho
 1iDNl2bO/AshUIWXaim8BjoI0YVq4GfphKa8Hk5gA1cNmlZ7l9D23TLU0
 7m/ZKsWHCJbEm1GJO//oLt6AYpPr5/OfdjssUHOpKgVwOdRoxMo7I7K5+
 YRiQe+8YIIuAXWOVGbMN2A1XBXbjA6cNWWyO+0s0Jk5jzqyr5NLP0+zx1
 QF/YG0wy19g/rH1sN+/CbZIRLCHFCoWBtSsNELmeJDpq9GadlqOD8vm0s w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313338758"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="313338758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:12:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="495382198"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 02:12:35 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
Date: Mon, 14 Feb 2022 11:14:01 +0100
Message-Id: <20220214101404.4074026-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214101404.4074026-1-cezary.rojewski@intel.com>
References: <20220214101404.4074026-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch exposes a new helper to directly retrieve the link from the
codec address, and makes use of this helper when retrieving the link
from the codec name.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h         |  1 +
 sound/hda/ext/hdac_ext_controller.c | 31 +++++++++++++++++++----------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 77123c3e4095..b0c8e4936168 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -28,6 +28,7 @@ void snd_hdac_ext_stream_spbcap_enable(struct hdac_bus *chip,
 				 bool enable, int index);
 
 int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus);
+struct hdac_ext_link *snd_hdac_ext_bus_link_at(struct hdac_bus *bus, int addr);
 struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 						const char *codec_name);
 
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index b2df7b4f9227..b072392725c7 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -132,6 +132,26 @@ void snd_hdac_link_free_all(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
 
+/**
+ * snd_hdac_ext_bus_link_at - get link at specified address
+ * @bus: link's parent bus device
+ * @addr: codec device address
+ *
+ * Returns link object or NULL if matching link is not found.
+ */
+struct hdac_ext_link *snd_hdac_ext_bus_link_at(struct hdac_bus *bus, int addr)
+{
+	struct hdac_ext_link *hlink;
+	int i;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		for (i = 0; i < HDA_MAX_CODECS; i++)
+			if (hlink->lsdiid & (0x1 << addr))
+				return hlink;
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_at);
+
 /**
  * snd_hdac_ext_bus_get_link - get link based on codec name
  * @bus: the pointer to HDAC bus object
@@ -140,8 +160,6 @@ EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
 struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 						 const char *codec_name)
 {
-	int i;
-	struct hdac_ext_link *hlink = NULL;
 	int bus_idx, addr;
 
 	if (sscanf(codec_name, "ehdaudio%dD%d", &bus_idx, &addr) != 2)
@@ -151,14 +169,7 @@ struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 	if (addr < 0 || addr > 31)
 		return NULL;
 
-	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		for (i = 0; i < HDA_MAX_CODECS; i++) {
-			if (hlink->lsdiid & (0x1 << addr))
-				return hlink;
-		}
-	}
-
-	return NULL;
+	return snd_hdac_ext_bus_link_at(bus, addr);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_link);
 
-- 
2.25.1

