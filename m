Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EE4ABC80
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 12:48:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01EF01651;
	Mon,  7 Feb 2022 12:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01EF01651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644234535;
	bh=uqQLq4r3XQeXrKyg/yfTfYsuiVgvhSCCqA+N/Lc1OMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlTloxnV30fZBbv7yqDQmJ/hAF12IufYF+yn51SjivVPUBl3lSmFpNjcHZf6dUiBK
	 /v6l2+Sly0QyIAcKA1Vvhe9hJDFBIynis5ZTZ/NPImewyCvi+VxNcnJKfiDTeCqg7B
	 o8hYun6dp3S58mq4KxzcgIwWUqBLm/hcZtM9z8Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CC8BF80511;
	Mon,  7 Feb 2022 12:47:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520B6F80249; Mon,  7 Feb 2022 12:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 543F0F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 12:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 543F0F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WdxCxhOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644234429; x=1675770429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqQLq4r3XQeXrKyg/yfTfYsuiVgvhSCCqA+N/Lc1OMg=;
 b=WdxCxhOz+Y9iUOMXteyl8+h8iwYLmKngISVHlVnQa3vXDLgOmGBTxF+q
 JjBq+zSaoFLjEJ+GjM8mJqcW4WQ4o8D+Dai4bNReXnM2oNAircMN4WBwQ
 F/BUtZCKOlMal6kEmVhBSXOEKCqbenutEBn33ITS3zzr24tialTJYNifX
 oryzTt+n5V1czHeySgR9ZKU0yfykjHzFuQnJx92lJ9g6VAU4+FiOzcyzx
 QyWqsIqNv1pA6AdE4wSxqbvDPl+NItaRNTdkwRSXiF7lqhXIs6lN9aJaC
 niweWdf04nfdCepy04ZEkcJ/r06XnjKhpTLpBxwpP8//zWqLKraQjy9AO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273217742"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273217742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484394900"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 03:46:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
Date: Mon,  7 Feb 2022 12:49:03 +0100
Message-Id: <20220207114906.3759800-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207114906.3759800-1-cezary.rojewski@intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, cujomalainey@chromium.org, lma@semihalf.com
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

