Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2550417BCF
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 21:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33EE166D;
	Fri, 24 Sep 2021 21:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33EE166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632511655;
	bh=F0zrMSjbExXLomQxU3Tj7Rz7WLaZuT3QEKEiYprk0C4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiGnIYOQxCQFH/Fm95Y7F9bQSmMa0N+aTccN0Wj5lBAe5H9JfjnLWxX9Kn3jfJksh
	 shFuXvfHhG2RrpRWhisKmttO5t6owgAvTYH12jKqFvUZ77AWWoWEdI+PkaoiMTF310
	 NCX8Rasbf0PDIX+BhnxseznlA5VOauHqpToDuMN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB430F804FB;
	Fri, 24 Sep 2021 21:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F05CF800BC; Fri, 24 Sep 2021 21:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61C0F800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 21:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61C0F800BC
X-IronPort-AV: E=McAfee;i="6200,9189,10117"; a="203643412"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="203643412"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551922500"
Received: from bordone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/4] ALSA: hda: hdac_ext_stream: fix potential locking
 issues
Date: Fri, 24 Sep 2021 14:24:16 -0500
Message-Id: <20210924192417.169243-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924192417.169243-1-pierre-louis.bossart@linux.intel.com>
References: <20210924192417.169243-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The code for hdac_ext_stream seems inherited from hdac_stream, and
similar locking issues are present: the use of the bus->reg_lock
spinlock is inconsistent, with only writes to specific fields being
protected.

Apply similar fix as in hdac_stream by protecting all accesses to
'link_locked' and 'decoupled' fields, with a new helper
snd_hdac_ext_stream_decouple_locked() added to simplify code
changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hdaudio_ext.h     |  2 ++
 sound/hda/ext/hdac_ext_stream.c | 46 ++++++++++++++++++++-------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 375581634143..d4e31ea16aba 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -88,6 +88,8 @@ struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
 					   int type);
 void snd_hdac_ext_stream_release(struct hdac_ext_stream *azx_dev, int type);
+void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
+				  struct hdac_ext_stream *azx_dev, bool decouple);
 void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 				struct hdac_ext_stream *azx_dev, bool decouple);
 void snd_hdac_ext_stop_streams(struct hdac_bus *bus);
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 0c005d67fa89..37154ed43bd5 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -106,20 +106,14 @@ void snd_hdac_stream_free_all(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_free_all);
 
-/**
- * snd_hdac_ext_stream_decouple - decouple the hdac stream
- * @bus: HD-audio core bus
- * @stream: HD-audio ext core stream object to initialize
- * @decouple: flag to decouple
- */
-void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
-				struct hdac_ext_stream *stream, bool decouple)
+void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
+					 struct hdac_ext_stream *stream,
+					 bool decouple)
 {
 	struct hdac_stream *hstream = &stream->hstream;
 	u32 val;
 	int mask = AZX_PPCTL_PROCEN(hstream->index);
 
-	spin_lock_irq(&bus->reg_lock);
 	val = readw(bus->ppcap + AZX_REG_PP_PPCTL) & mask;
 
 	if (decouple && !val)
@@ -128,6 +122,20 @@ void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 		snd_hdac_updatel(bus->ppcap, AZX_REG_PP_PPCTL, mask, 0);
 
 	stream->decoupled = decouple;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple_locked);
+
+/**
+ * snd_hdac_ext_stream_decouple - decouple the hdac stream
+ * @bus: HD-audio core bus
+ * @stream: HD-audio ext core stream object to initialize
+ * @decouple: flag to decouple
+ */
+void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
+				  struct hdac_ext_stream *stream, bool decouple)
+{
+	spin_lock_irq(&bus->reg_lock);
+	snd_hdac_ext_stream_decouple_locked(bus, stream, decouple);
 	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple);
@@ -252,6 +260,7 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 		return NULL;
 	}
 
+	spin_lock_irq(&bus->reg_lock);
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hstream = container_of(stream,
 						struct hdac_ext_stream,
@@ -266,17 +275,16 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 		}
 
 		if (!hstream->link_locked) {
-			snd_hdac_ext_stream_decouple(bus, hstream, true);
+			snd_hdac_ext_stream_decouple_locked(bus, hstream, true);
 			res = hstream;
 			break;
 		}
 	}
 	if (res) {
-		spin_lock_irq(&bus->reg_lock);
 		res->link_locked = 1;
 		res->link_substream = substream;
-		spin_unlock_irq(&bus->reg_lock);
 	}
+	spin_unlock_irq(&bus->reg_lock);
 	return res;
 }
 
@@ -292,6 +300,7 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 		return NULL;
 	}
 
+	spin_lock_irq(&bus->reg_lock);
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hstream = container_of(stream,
 						struct hdac_ext_stream,
@@ -301,18 +310,17 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 
 		if (!stream->opened) {
 			if (!hstream->decoupled)
-				snd_hdac_ext_stream_decouple(bus, hstream, true);
+				snd_hdac_ext_stream_decouple_locked(bus, hstream, true);
 			res = hstream;
 			break;
 		}
 	}
 	if (res) {
-		spin_lock_irq(&bus->reg_lock);
 		res->hstream.opened = 1;
 		res->hstream.running = 0;
 		res->hstream.substream = substream;
-		spin_unlock_irq(&bus->reg_lock);
 	}
+	spin_unlock_irq(&bus->reg_lock);
 
 	return res;
 }
@@ -378,15 +386,17 @@ void snd_hdac_ext_stream_release(struct hdac_ext_stream *stream, int type)
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
+		spin_lock_irq(&bus->reg_lock);
 		if (stream->decoupled && !stream->link_locked)
-			snd_hdac_ext_stream_decouple(bus, stream, false);
+			snd_hdac_ext_stream_decouple_locked(bus, stream, false);
+		spin_unlock_irq(&bus->reg_lock);
 		snd_hdac_stream_release(&stream->hstream);
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
-		if (stream->decoupled && !stream->hstream.opened)
-			snd_hdac_ext_stream_decouple(bus, stream, false);
 		spin_lock_irq(&bus->reg_lock);
+		if (stream->decoupled && !stream->hstream.opened)
+			snd_hdac_ext_stream_decouple_locked(bus, stream, false);
 		stream->link_locked = 0;
 		stream->link_substream = NULL;
 		spin_unlock_irq(&bus->reg_lock);
-- 
2.25.1

