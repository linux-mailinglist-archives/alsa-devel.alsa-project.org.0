Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2A30EDEB
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 09:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E9616F8;
	Thu,  4 Feb 2021 09:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E9616F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612425814;
	bh=mD9ZtCBjK1egn18CAU/5HgK1JBNyDih37Qs+LDo0vOA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PM/MOf0QPqPjfXLUP24M+mKOJhl4FDywX9qVM9fDnoCXoHrB6vzmznllvAdUwXdWO
	 D4i1f9sJctbkFD3qm+uhcCDoWoBFv8W+0o2u4BoCychP+6tbCUp8F+Ubr14uGK/z++
	 Jh1XutvEelSd+eoDiJ6Nbb+Yfwc4pU8i8HZKbu1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19396F801F7;
	Thu,  4 Feb 2021 09:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5823F80171; Thu,  4 Feb 2021 09:01:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97085F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 09:01:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97085F80154
IronPort-SDR: 6E29vD5W+i30QHfI8Zn0esp5eGj62rjPbf2TCpCeF57jB08bomo/NJG5sqdw8lcyQPzP1jxLQp
 7O2irIxTBjTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="180418405"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="180418405"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:01:45 -0800
IronPort-SDR: WNUEGNjfAzUStkn+vEt4Q1wTe81hRLvFlg7+MMQtI5Whl/J/qtC7OIVb+Pug5zAySamvl2GllP
 BISN7e39d7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372300345"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2021 00:01:44 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC PATCH] ALSA: hda: call ext hda codec link up/down if available
Date: Thu,  4 Feb 2021 09:58:21 +0200
Message-Id: <20210204075821.1503539-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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

The extended HDA bus (hdac_ext) provides interfaces for more
fine-grained control of individual links than what plain HDA provides
for. Links can be powered off when they are not used and if all
links are released, controller can shut down the command DMA.

These interfaces are currently not used by common HDA codec drivers.
When a HDA codec is runtime suspended, it calls snd_hdac_codec_link_down(),
but there is no link to the HDA extended bus, and links are shut down
only when all codecs are suspended.

To support more fine-grained control of link power, this patch
implements new helper functions for codec drivers to turn codec links
up and down. The HDA common suspend/resume code is modified to use
the new functions. This allows to fully reuse the driver code both
for plain and extended HDA controllers.

For compatibility, code reverts to plain HDA implementation if HDA
extended bus is disabled in the kernel build, or if the controller is
a plain HDA one.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio_ext.h         | 15 +++++++++++++++
 sound/hda/ext/hdac_ext_controller.c | 28 ++++++++++++++++++++++++++++
 sound/pci/hda/hda_codec.c           |  5 +++--
 3 files changed, 46 insertions(+), 2 deletions(-)

NOTES:
 - RFC status due to new usage of hdaudio_ext.h
 - Not fully tested! Validation still ongoing...

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 7abf74c1c474..151922fa3c1e 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -131,6 +131,21 @@ void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *link,
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus, struct hdac_ext_link *link);
 int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *link);
 
+#if IS_ENABLED(CONFIG_SND_HDA_EXT_CORE)
+void snd_hdac_ext_codec_link_up(struct hdac_device *codec);
+void snd_hdac_ext_codec_link_down(struct hdac_device *codec);
+#else
+static inline void snd_hdac_ext_codec_link_up(struct hdac_device *codec)
+{
+	snd_hdac_codec_link_up(codec);
+}
+
+static inline void snd_hdac_ext_codec_link_down(struct hdac_device *codec)
+{
+	snd_hdac_codec_link_down(codec);
+}
+#endif
+
 /* update register macro */
 #define snd_hdac_updatel(addr, reg, mask, val)		\
 	writel(((readl(addr + reg) & ~(mask)) | (val)), \
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index b0c0ef824d7d..fd03b5d3a10e 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -332,3 +332,31 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_put);
+
+void snd_hdac_ext_codec_link_up(struct hdac_device *codec)
+{
+	snd_hdac_codec_link_up(codec);
+
+	if (codec->type == HDA_DEV_ASOC) {
+		const char *devname = dev_name(&codec->dev);
+		struct hdac_ext_link *hlink =
+			snd_hdac_ext_bus_get_link(codec->bus, devname);
+		if (hlink)
+			snd_hdac_ext_bus_link_get(codec->bus, hlink);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_codec_link_up);
+
+void snd_hdac_ext_codec_link_down(struct hdac_device *codec)
+{
+	snd_hdac_codec_link_down(codec);
+
+	if (codec->type == HDA_DEV_ASOC) {
+		const char *devname = dev_name(&codec->dev);
+		struct hdac_ext_link *hlink =
+			snd_hdac_ext_bus_get_link(codec->bus, devname);
+		if (hlink)
+			snd_hdac_ext_bus_link_put(codec->bus, hlink);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_codec_link_down);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9b755062d841..6113f787b494 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/hda_codec.h>
+#include <sound/hdaudio_ext.h>
 #include <sound/asoundef.h>
 #include <sound/tlv.h>
 #include <sound/initval.h>
@@ -2948,7 +2949,7 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	if (codec->link_down_at_suspend ||
 	    (codec_has_clkstop(codec) && codec_has_epss(codec) &&
 	     (state & AC_PWRST_CLK_STOP_OK)))
-		snd_hdac_codec_link_down(&codec->core);
+		snd_hdac_ext_codec_link_down(&codec->core);
 	codec_display_power(codec, false);
 	return 0;
 }
@@ -2962,7 +2963,7 @@ static int hda_codec_runtime_resume(struct device *dev)
 		return 0;
 
 	codec_display_power(codec, true);
-	snd_hdac_codec_link_up(&codec->core);
+	snd_hdac_ext_codec_link_up(&codec->core);
 	hda_call_codec_resume(codec);
 	pm_runtime_mark_last_busy(dev);
 	return 0;

base-commit: 307cfa506ef4e6d7fe9430e513db2353925fb440
-- 
2.29.2

