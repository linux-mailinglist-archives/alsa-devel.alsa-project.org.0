Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E0311059
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 19:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0F91685;
	Fri,  5 Feb 2021 19:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0F91685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612551112;
	bh=gCbA2wlpdl5MmpAC5FpHN6n9MyERepa8tUYMu6UDMJg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lrtUcR00zWHwjrHKWCFd9/96RPY5ABa4r1WQ83pza7g55fOXIZvgqDfcdAIgh3P7i
	 gnk5InxUTbDnqABwOBOqEGh31BFSI6zmS/RdTQBWdmNGDZoQSt/NyOcb6zZei3Q2QT
	 JwA4FwvqL3vjxlzw23xGQvmXZ8KiOGCsvdP854KM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4AFF8025C;
	Fri,  5 Feb 2021 19:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE85F8023B; Fri,  5 Feb 2021 19:50:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7947F80156
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 19:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7947F80156
IronPort-SDR: oGUbgQLPaDWxvIEGoTQARq/dkcE12eGWWNmDbNj+d7A9BIBRnp4aTeWrdYbP+5BsvpGMyJX+2+
 GY6vsP1T1Umw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="178914208"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="178914208"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:50:03 -0800
IronPort-SDR: XLaCsOqvAeDR1ES5M8dsmu3tY3b/5hNIwMYhBaEd0VVTJ7Utj238DZjTS1XXOyjXmxVdu2y6Lh
 jcsV3uY/CCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="508632682"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2021 10:50:01 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 1/3] ALSA: hda: add link_power op to hdac_bus_ops
Date: Fri,  5 Feb 2021 20:46:28 +0200
Message-Id: <20210205184630.1938761-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205184630.1938761-1-kai.vehmanen@linux.intel.com>
References: <20210205184630.1938761-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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
fine-grained control of individual links than what plain HDA
provides for. Links can be powered off when they are not used and if
all links are released, controller can shut down the command DMA.

These interfaces are currently not used by common HDA codec drivers.
When a HDA codec is runtime suspended, it calls snd_hdac_codec_link_down(),
but there is no link to the HDA extended bus, and on controller side
the links are shut down only when all codecs are suspended.

This patch adds link_power() to hdac_bus ops. Controllers using the HDA
extended core, can use this to plug in snd_hdac_ext_bus_link_power() to
implement more fine-grained control of link power.

No change is needed for plain HDA controllers nor to existing HDA
codec drivers.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h             | 14 ++++-------
 include/sound/hdaudio_ext.h         |  2 ++
 sound/hda/ext/hdac_ext_controller.c | 37 +++++++++++++++++++++++++++++
 sound/hda/hdac_bus.c                | 23 ++++++++++++++++++
 sound/hda/hdac_controller.c         | 14 +++++++++++
 5 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 6eed61e6cf8a..22af68b01426 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -241,6 +241,8 @@ struct hdac_bus_ops {
 	/* get a response from the last command */
 	int (*get_response)(struct hdac_bus *bus, unsigned int addr,
 			    unsigned int *res);
+	/* notify of codec link power-up/down */
+	void (*link_power)(struct hdac_device *hdev, bool enable);
 };
 
 /*
@@ -378,15 +380,8 @@ void snd_hdac_bus_exit(struct hdac_bus *bus);
 int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 				    unsigned int cmd, unsigned int *res);
 
-static inline void snd_hdac_codec_link_up(struct hdac_device *codec)
-{
-	set_bit(codec->addr, &codec->bus->codec_powered);
-}
-
-static inline void snd_hdac_codec_link_down(struct hdac_device *codec)
-{
-	clear_bit(codec->addr, &codec->bus->codec_powered);
-}
+void snd_hdac_codec_link_up(struct hdac_device *codec);
+void snd_hdac_codec_link_down(struct hdac_device *codec);
 
 int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val);
 int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
@@ -400,6 +395,7 @@ void snd_hdac_bus_stop_cmd_io(struct hdac_bus *bus);
 void snd_hdac_bus_enter_link_reset(struct hdac_bus *bus);
 void snd_hdac_bus_exit_link_reset(struct hdac_bus *bus);
 int snd_hdac_bus_reset_link(struct hdac_bus *bus, bool full_reset);
+void snd_hdac_bus_link_power(struct hdac_device *hdev, bool enable);
 
 void snd_hdac_bus_update_rirb(struct hdac_bus *bus);
 int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 7abf74c1c474..a125e3814b58 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -131,6 +131,8 @@ void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *link,
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus, struct hdac_ext_link *link);
 int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *link);
 
+void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
+
 /* update register macro */
 #define snd_hdac_updatel(addr, reg, mask, val)		\
 	writel(((readl(addr + reg) & ~(mask)) | (val)), \
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index b0c0ef824d7d..a9bd39b93697 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -332,3 +332,40 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_put);
+
+static void hdac_ext_codec_link_up(struct hdac_device *codec)
+{
+	const char *devname = dev_name(&codec->dev);
+	struct hdac_ext_link *hlink =
+		snd_hdac_ext_bus_get_link(codec->bus, devname);
+
+	if (hlink)
+		snd_hdac_ext_bus_link_get(codec->bus, hlink);
+}
+
+static void hdac_ext_codec_link_down(struct hdac_device *codec)
+{
+	const char *devname = dev_name(&codec->dev);
+	struct hdac_ext_link *hlink =
+		snd_hdac_ext_bus_get_link(codec->bus, devname);
+
+	if (hlink)
+		snd_hdac_ext_bus_link_put(codec->bus, hlink);
+}
+
+void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable)
+{
+	struct hdac_bus *bus = codec->bus;
+	bool oldstate = test_bit(codec->addr, &bus->codec_powered);
+
+	if (enable == oldstate)
+		return;
+
+	snd_hdac_bus_link_power(codec, enable);
+
+	if (enable)
+		hdac_ext_codec_link_up(codec);
+	else
+		hdac_ext_codec_link_down(codec);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power);
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 9766f6af8743..71db8592b33d 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -17,6 +17,7 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work);
 static const struct hdac_bus_ops default_ops = {
 	.command = snd_hdac_bus_send_cmd,
 	.get_response = snd_hdac_bus_get_response,
+	.link_power = snd_hdac_bus_link_power,
 };
 
 /**
@@ -264,3 +265,25 @@ void snd_hdac_aligned_write(unsigned int val, void __iomem *addr,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_aligned_write);
 #endif /* CONFIG_SND_HDA_ALIGNED_MMIO */
+
+void snd_hdac_codec_link_up(struct hdac_device *codec)
+{
+	struct hdac_bus *bus = codec->bus;
+
+	if (bus->ops->link_power)
+		bus->ops->link_power(codec, true);
+	else
+		snd_hdac_bus_link_power(codec, true);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_codec_link_up);
+
+void snd_hdac_codec_link_down(struct hdac_device *codec)
+{
+	struct hdac_bus *bus = codec->bus;
+
+	if (bus->ops->link_power)
+		bus->ops->link_power(codec, false);
+	else
+		snd_hdac_bus_link_power(codec, false);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_codec_link_down);
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index b98449fd92f3..062da7a7a586 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -648,3 +648,17 @@ void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus)
 		snd_dma_free_pages(&bus->posbuf);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_free_stream_pages);
+
+/**
+ * snd_hdac_bus_link_power - power up/down codec link
+ * @codec: HD-audio device
+ * @enable: whether to power-up the link
+ */
+void snd_hdac_bus_link_power(struct hdac_device *codec, bool enable)
+{
+	if (enable)
+		set_bit(codec->addr, &codec->bus->codec_powered);
+	else
+		clear_bit(codec->addr, &codec->bus->codec_powered);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_bus_link_power);
-- 
2.29.2

