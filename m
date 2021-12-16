Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0EC478057
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:13:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C121FCA;
	Fri, 17 Dec 2021 00:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C121FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696416;
	bh=kzDV2pzOhNW4Wywur90pUhr3RdIAEXcvc9Im7Cxb5aQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iW9GFk66fmrV2JtWryO3dgYXcFRF07LSWNoWYSUMiNKiYOpOMvfGmso8vOwVgsrF7
	 1tBsHovYxZB7BUuJZM30xS3U6dRuAb2yTUT2oL3yXfq8MnahHbOkRU9E4J4PdASm06
	 uvrSICPsjh8WZkE7jr3BGcIijpts9rs/G8nKqnWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03ED6F800F4;
	Fri, 17 Dec 2021 00:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3ED5F8030F; Fri, 17 Dec 2021 00:11:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BBDF800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BBDF800F4
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303002701"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="303002701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756278662"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: HDA: hdac_ext_stream: use consistent prefixes for
 variables
Date: Thu, 16 Dec 2021 17:11:28 -0600
Message-Id: <20211216231128.344321-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
References: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org
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

The existing code maximizes confusion by using 'stream' and 'hstream'
variables of different types. Examples:

struct hdac_stream *stream;
struct hdac_ext_stream *stream;
struct hdac_stream *hstream;
struct hdac_ext_stream *hstream;

with some additional copy/paste remains:
struct hdac_ext_stream *azx_dev;

This patch suggests a consistent naming across all 'hdac_ext_stream'
functions. The convention is:

struct hdac_stream *hstream;
struct hdac_ext_stream *hext_stream;

No functionality change - just renaming of variables and more
consistent indentation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 include/sound/hdaudio_ext.h     |  26 ++---
 sound/hda/ext/hdac_ext_stream.c | 199 ++++++++++++++++----------------
 2 files changed, 113 insertions(+), 112 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 56ea5cde5e63..77123c3e4095 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -78,35 +78,35 @@ struct hdac_ext_stream {
 	container_of(s, struct hdac_ext_stream, hstream)
 
 void snd_hdac_ext_stream_init(struct hdac_bus *bus,
-				struct hdac_ext_stream *stream, int idx,
-				int direction, int tag);
+			      struct hdac_ext_stream *hext_stream, int idx,
+			      int direction, int tag);
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
-		int num_stream, int dir);
+				 int num_stream, int dir);
 void snd_hdac_stream_free_all(struct hdac_bus *bus);
 void snd_hdac_link_free_all(struct hdac_bus *bus);
 struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
 					   int type);
-void snd_hdac_ext_stream_release(struct hdac_ext_stream *azx_dev, int type);
+void snd_hdac_ext_stream_release(struct hdac_ext_stream *hext_stream, int type);
 void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
-				  struct hdac_ext_stream *azx_dev, bool decouple);
+					 struct hdac_ext_stream *hext_stream, bool decouple);
 void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 				struct hdac_ext_stream *azx_dev, bool decouple);
 
 int snd_hdac_ext_stream_set_spib(struct hdac_bus *bus,
-				 struct hdac_ext_stream *stream, u32 value);
+				 struct hdac_ext_stream *hext_stream, u32 value);
 int snd_hdac_ext_stream_get_spbmaxfifo(struct hdac_bus *bus,
-				 struct hdac_ext_stream *stream);
+				       struct hdac_ext_stream *hext_stream);
 void snd_hdac_ext_stream_drsm_enable(struct hdac_bus *bus,
 				bool enable, int index);
 int snd_hdac_ext_stream_set_dpibr(struct hdac_bus *bus,
-				struct hdac_ext_stream *stream, u32 value);
-int snd_hdac_ext_stream_set_lpib(struct hdac_ext_stream *stream, u32 value);
+				struct hdac_ext_stream *hext_stream, u32 value);
+int snd_hdac_ext_stream_set_lpib(struct hdac_ext_stream *hext_stream, u32 value);
 
-void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *hstream);
-void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *hstream);
-void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hstream);
-int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *stream, int fmt);
+void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *hext_stream);
+void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *hext_stream);
+void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hext_stream);
+int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *hext_stream, int fmt);
 
 struct hdac_ext_link {
 	struct hdac_bus *bus;
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index c09652da43ff..d2b5724b463f 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -18,7 +18,7 @@
 /**
  * snd_hdac_ext_stream_init - initialize each stream (aka device)
  * @bus: HD-audio core bus
- * @stream: HD-audio ext core stream object to initialize
+ * @hext_stream: HD-audio ext core stream object to initialize
  * @idx: stream index number
  * @direction: stream direction (SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE)
  * @tag: the tag id to assign
@@ -27,34 +27,34 @@
  * invoke hdac stream initialization routine
  */
 void snd_hdac_ext_stream_init(struct hdac_bus *bus,
-				struct hdac_ext_stream *stream,
-				int idx, int direction, int tag)
+			      struct hdac_ext_stream *hext_stream,
+			      int idx, int direction, int tag)
 {
 	if (bus->ppcap) {
-		stream->pphc_addr = bus->ppcap + AZX_PPHC_BASE +
+		hext_stream->pphc_addr = bus->ppcap + AZX_PPHC_BASE +
 				AZX_PPHC_INTERVAL * idx;
 
-		stream->pplc_addr = bus->ppcap + AZX_PPLC_BASE +
+		hext_stream->pplc_addr = bus->ppcap + AZX_PPLC_BASE +
 				AZX_PPLC_MULTI * bus->num_streams +
 				AZX_PPLC_INTERVAL * idx;
 	}
 
 	if (bus->spbcap) {
-		stream->spib_addr = bus->spbcap + AZX_SPB_BASE +
+		hext_stream->spib_addr = bus->spbcap + AZX_SPB_BASE +
 					AZX_SPB_INTERVAL * idx +
 					AZX_SPB_SPIB;
 
-		stream->fifo_addr = bus->spbcap + AZX_SPB_BASE +
+		hext_stream->fifo_addr = bus->spbcap + AZX_SPB_BASE +
 					AZX_SPB_INTERVAL * idx +
 					AZX_SPB_MAXFIFO;
 	}
 
 	if (bus->drsmcap)
-		stream->dpibr_addr = bus->drsmcap + AZX_DRSM_BASE +
+		hext_stream->dpibr_addr = bus->drsmcap + AZX_DRSM_BASE +
 					AZX_DRSM_INTERVAL * idx;
 
-	stream->decoupled = false;
-	snd_hdac_stream_init(bus, &stream->hstream, idx, direction, tag);
+	hext_stream->decoupled = false;
+	snd_hdac_stream_init(bus, &hext_stream->hstream, idx, direction, tag);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init);
 
@@ -67,18 +67,18 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init);
  * @dir: direction of streams
  */
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
-		int num_stream, int dir)
+				 int num_stream, int dir)
 {
 	int stream_tag = 0;
 	int i, tag, idx = start_idx;
 
 	for (i = 0; i < num_stream; i++) {
-		struct hdac_ext_stream *stream =
-				kzalloc(sizeof(*stream), GFP_KERNEL);
-		if (!stream)
+		struct hdac_ext_stream *hext_stream =
+				kzalloc(sizeof(*hext_stream), GFP_KERNEL);
+		if (!hext_stream)
 			return -ENOMEM;
 		tag = ++stream_tag;
-		snd_hdac_ext_stream_init(bus, stream, idx, dir, tag);
+		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
 		idx++;
 	}
 
@@ -95,22 +95,22 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init_all);
 void snd_hdac_stream_free_all(struct hdac_bus *bus)
 {
 	struct hdac_stream *s, *_s;
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 
 	list_for_each_entry_safe(s, _s, &bus->stream_list, list) {
-		stream = stream_to_hdac_ext_stream(s);
-		snd_hdac_ext_stream_decouple(bus, stream, false);
+		hext_stream = stream_to_hdac_ext_stream(s);
+		snd_hdac_ext_stream_decouple(bus, hext_stream, false);
 		list_del(&s->list);
-		kfree(stream);
+		kfree(hext_stream);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_free_all);
 
 void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
-					 struct hdac_ext_stream *stream,
+					 struct hdac_ext_stream *hext_stream,
 					 bool decouple)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	u32 val;
 	int mask = AZX_PPCTL_PROCEN(hstream->index);
 
@@ -121,76 +121,76 @@ void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
 	else if (!decouple && val)
 		snd_hdac_updatel(bus->ppcap, AZX_REG_PP_PPCTL, mask, 0);
 
-	stream->decoupled = decouple;
+	hext_stream->decoupled = decouple;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple_locked);
 
 /**
  * snd_hdac_ext_stream_decouple - decouple the hdac stream
  * @bus: HD-audio core bus
- * @stream: HD-audio ext core stream object to initialize
+ * @hext_stream: HD-audio ext core stream object to initialize
  * @decouple: flag to decouple
  */
 void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
-				  struct hdac_ext_stream *stream, bool decouple)
+				  struct hdac_ext_stream *hext_stream, bool decouple)
 {
 	spin_lock_irq(&bus->reg_lock);
-	snd_hdac_ext_stream_decouple_locked(bus, stream, decouple);
+	snd_hdac_ext_stream_decouple_locked(bus, hext_stream, decouple);
 	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple);
 
 /**
  * snd_hdac_ext_link_stream_start - start a stream
- * @stream: HD-audio ext core stream to start
+ * @hext_stream: HD-audio ext core stream to start
  */
-void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *stream)
+void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *hext_stream)
 {
-	snd_hdac_updatel(stream->pplc_addr, AZX_REG_PPLCCTL,
+	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL,
 			 AZX_PPLCCTL_RUN, AZX_PPLCCTL_RUN);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_start);
 
 /**
  * snd_hdac_ext_link_stream_clear - stop a stream DMA
- * @stream: HD-audio ext core stream to stop
+ * @hext_stream: HD-audio ext core stream to stop
  */
-void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *stream)
+void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *hext_stream)
 {
-	snd_hdac_updatel(stream->pplc_addr, AZX_REG_PPLCCTL, AZX_PPLCCTL_RUN, 0);
+	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL, AZX_PPLCCTL_RUN, 0);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_clear);
 
 /**
  * snd_hdac_ext_link_stream_reset - reset a stream
- * @stream: HD-audio ext core stream to reset
+ * @hext_stream: HD-audio ext core stream to reset
  */
-void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *stream)
+void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hext_stream)
 {
 	unsigned char val;
 	int timeout;
 
-	snd_hdac_ext_link_stream_clear(stream);
+	snd_hdac_ext_link_stream_clear(hext_stream);
 
-	snd_hdac_updatel(stream->pplc_addr, AZX_REG_PPLCCTL,
+	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL,
 			 AZX_PPLCCTL_STRST, AZX_PPLCCTL_STRST);
 	udelay(3);
 	timeout = 50;
 	do {
-		val = readl(stream->pplc_addr + AZX_REG_PPLCCTL) &
+		val = readl(hext_stream->pplc_addr + AZX_REG_PPLCCTL) &
 				AZX_PPLCCTL_STRST;
 		if (val)
 			break;
 		udelay(3);
 	} while (--timeout);
 	val &= ~AZX_PPLCCTL_STRST;
-	writel(val, stream->pplc_addr + AZX_REG_PPLCCTL);
+	writel(val, hext_stream->pplc_addr + AZX_REG_PPLCCTL);
 	udelay(3);
 
 	timeout = 50;
 	/* waiting for hardware to report that the stream is out of reset */
 	do {
-		val = readl(stream->pplc_addr + AZX_REG_PPLCCTL) & AZX_PPLCCTL_STRST;
+		val = readl(hext_stream->pplc_addr + AZX_REG_PPLCCTL) & AZX_PPLCCTL_STRST;
 		if (!val)
 			break;
 		udelay(3);
@@ -201,24 +201,24 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_reset);
 
 /**
  * snd_hdac_ext_link_stream_setup -  set up the SD for streaming
- * @stream: HD-audio ext core stream to set up
+ * @hext_stream: HD-audio ext core stream to set up
  * @fmt: stream format
  */
-int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *stream, int fmt)
+int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	unsigned int val;
 
 	/* make sure the run bit is zero for SD */
-	snd_hdac_ext_link_stream_clear(stream);
+	snd_hdac_ext_link_stream_clear(hext_stream);
 	/* program the stream_tag */
-	val = readl(stream->pplc_addr + AZX_REG_PPLCCTL);
+	val = readl(hext_stream->pplc_addr + AZX_REG_PPLCCTL);
 	val = (val & ~AZX_PPLCCTL_STRM_MASK) |
 		(hstream->stream_tag << AZX_PPLCCTL_STRM_SHIFT);
-	writel(val, stream->pplc_addr + AZX_REG_PPLCCTL);
+	writel(val, hext_stream->pplc_addr + AZX_REG_PPLCCTL);
 
 	/* program the stream format */
-	writew(fmt, stream->pplc_addr + AZX_REG_PPLCFMT);
+	writew(fmt, hext_stream->pplc_addr + AZX_REG_PPLCFMT);
 
 	return 0;
 }
@@ -230,7 +230,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_setup);
  * @stream: stream id
  */
 void snd_hdac_ext_link_set_stream_id(struct hdac_ext_link *link,
-				 int stream)
+				     int stream)
 {
 	snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV, (1 << stream), 1 << stream);
 }
@@ -250,10 +250,10 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_link_clear_stream_id);
 
 static struct hdac_ext_stream *
 hdac_ext_link_stream_assign(struct hdac_bus *bus,
-				struct snd_pcm_substream *substream)
+			    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *res = NULL;
-	struct hdac_stream *stream = NULL;
+	struct hdac_stream *hstream = NULL;
 
 	if (!bus->ppcap) {
 		dev_err(bus->dev, "stream type not supported\n");
@@ -261,22 +261,22 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 	}
 
 	spin_lock_irq(&bus->reg_lock);
-	list_for_each_entry(stream, &bus->stream_list, list) {
-		struct hdac_ext_stream *hstream = container_of(stream,
-						struct hdac_ext_stream,
-						hstream);
-		if (stream->direction != substream->stream)
+	list_for_each_entry(hstream, &bus->stream_list, list) {
+		struct hdac_ext_stream *hext_stream = container_of(hstream,
+								 struct hdac_ext_stream,
+								 hstream);
+		if (hstream->direction != substream->stream)
 			continue;
 
 		/* check if decoupled stream and not in use is available */
-		if (hstream->decoupled && !hstream->link_locked) {
-			res = hstream;
+		if (hext_stream->decoupled && !hext_stream->link_locked) {
+			res = hext_stream;
 			break;
 		}
 
-		if (!hstream->link_locked) {
-			snd_hdac_ext_stream_decouple_locked(bus, hstream, true);
-			res = hstream;
+		if (!hext_stream->link_locked) {
+			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, true);
+			res = hext_stream;
 			break;
 		}
 	}
@@ -290,10 +290,10 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 
 static struct hdac_ext_stream *
 hdac_ext_host_stream_assign(struct hdac_bus *bus,
-				struct snd_pcm_substream *substream)
+			    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *res = NULL;
-	struct hdac_stream *stream = NULL;
+	struct hdac_stream *hstream = NULL;
 
 	if (!bus->ppcap) {
 		dev_err(bus->dev, "stream type not supported\n");
@@ -301,17 +301,17 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 	}
 
 	spin_lock_irq(&bus->reg_lock);
-	list_for_each_entry(stream, &bus->stream_list, list) {
-		struct hdac_ext_stream *hstream = container_of(stream,
-						struct hdac_ext_stream,
-						hstream);
-		if (stream->direction != substream->stream)
+	list_for_each_entry(hstream, &bus->stream_list, list) {
+		struct hdac_ext_stream *hext_stream = container_of(hstream,
+								 struct hdac_ext_stream,
+								 hstream);
+		if (hstream->direction != substream->stream)
 			continue;
 
-		if (!stream->opened) {
-			if (!hstream->decoupled)
-				snd_hdac_ext_stream_decouple_locked(bus, hstream, true);
-			res = hstream;
+		if (!hstream->opened) {
+			if (!hext_stream->decoupled)
+				snd_hdac_ext_stream_decouple_locked(bus, hext_stream, true);
+			res = hext_stream;
 			break;
 		}
 	}
@@ -346,16 +346,17 @@ struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
 					   int type)
 {
-	struct hdac_ext_stream *hstream = NULL;
-	struct hdac_stream *stream = NULL;
+	struct hdac_ext_stream *hext_stream = NULL;
+	struct hdac_stream *hstream = NULL;
 
 	switch (type) {
 	case HDAC_EXT_STREAM_TYPE_COUPLED:
-		stream = snd_hdac_stream_assign(bus, substream);
-		if (stream)
-			hstream = container_of(stream,
-					struct hdac_ext_stream, hstream);
-		return hstream;
+		hstream = snd_hdac_stream_assign(bus, substream);
+		if (hstream)
+			hext_stream = container_of(hstream,
+						   struct hdac_ext_stream,
+						   hstream);
+		return hext_stream;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
 		return hdac_ext_host_stream_assign(bus, substream);
@@ -371,34 +372,34 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_assign);
 
 /**
  * snd_hdac_ext_stream_release - release the assigned stream
- * @stream: HD-audio ext core stream to release
+ * @hext_stream: HD-audio ext core stream to release
  * @type: type of stream (coupled, host or link stream)
  *
  * Release the stream that has been assigned by snd_hdac_ext_stream_assign().
  */
-void snd_hdac_ext_stream_release(struct hdac_ext_stream *stream, int type)
+void snd_hdac_ext_stream_release(struct hdac_ext_stream *hext_stream, int type)
 {
-	struct hdac_bus *bus = stream->hstream.bus;
+	struct hdac_bus *bus = hext_stream->hstream.bus;
 
 	switch (type) {
 	case HDAC_EXT_STREAM_TYPE_COUPLED:
-		snd_hdac_stream_release(&stream->hstream);
+		snd_hdac_stream_release(&hext_stream->hstream);
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
 		spin_lock_irq(&bus->reg_lock);
-		if (stream->decoupled && !stream->link_locked)
-			snd_hdac_ext_stream_decouple_locked(bus, stream, false);
+		if (hext_stream->decoupled && !hext_stream->link_locked)
+			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
 		spin_unlock_irq(&bus->reg_lock);
-		snd_hdac_stream_release(&stream->hstream);
+		snd_hdac_stream_release(&hext_stream->hstream);
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
 		spin_lock_irq(&bus->reg_lock);
-		if (stream->decoupled && !stream->hstream.opened)
-			snd_hdac_ext_stream_decouple_locked(bus, stream, false);
-		stream->link_locked = 0;
-		stream->link_substream = NULL;
+		if (hext_stream->decoupled && !hext_stream->hstream.opened)
+			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
+		hext_stream->link_locked = 0;
+		hext_stream->link_substream = NULL;
 		spin_unlock_irq(&bus->reg_lock);
 		break;
 
@@ -437,11 +438,11 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_spbcap_enable);
 /**
  * snd_hdac_ext_stream_set_spib - sets the spib value of a stream
  * @bus: HD-audio core bus
- * @stream: hdac_ext_stream
+ * @hext_stream: hdac_ext_stream
  * @value: spib value to set
  */
 int snd_hdac_ext_stream_set_spib(struct hdac_bus *bus,
-				 struct hdac_ext_stream *stream, u32 value)
+				 struct hdac_ext_stream *hext_stream, u32 value)
 {
 
 	if (!bus->spbcap) {
@@ -449,7 +450,7 @@ int snd_hdac_ext_stream_set_spib(struct hdac_bus *bus,
 		return -EINVAL;
 	}
 
-	writel(value, stream->spib_addr);
+	writel(value, hext_stream->spib_addr);
 
 	return 0;
 }
@@ -458,12 +459,12 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_set_spib);
 /**
  * snd_hdac_ext_stream_get_spbmaxfifo - gets the spib value of a stream
  * @bus: HD-audio core bus
- * @stream: hdac_ext_stream
+ * @hext_stream: hdac_ext_stream
  *
  * Return maxfifo for the stream
  */
 int snd_hdac_ext_stream_get_spbmaxfifo(struct hdac_bus *bus,
-				 struct hdac_ext_stream *stream)
+				 struct hdac_ext_stream *hext_stream)
 {
 
 	if (!bus->spbcap) {
@@ -471,7 +472,7 @@ int snd_hdac_ext_stream_get_spbmaxfifo(struct hdac_bus *bus,
 		return -EINVAL;
 	}
 
-	return readl(stream->fifo_addr);
+	return readl(hext_stream->fifo_addr);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_get_spbmaxfifo);
 
@@ -503,11 +504,11 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_drsm_enable);
 /**
  * snd_hdac_ext_stream_set_dpibr - sets the dpibr value of a stream
  * @bus: HD-audio core bus
- * @stream: hdac_ext_stream
+ * @hext_stream: hdac_ext_stream
  * @value: dpib value to set
  */
 int snd_hdac_ext_stream_set_dpibr(struct hdac_bus *bus,
-				 struct hdac_ext_stream *stream, u32 value)
+				  struct hdac_ext_stream *hext_stream, u32 value)
 {
 
 	if (!bus->drsmcap) {
@@ -515,7 +516,7 @@ int snd_hdac_ext_stream_set_dpibr(struct hdac_bus *bus,
 		return -EINVAL;
 	}
 
-	writel(value, stream->dpibr_addr);
+	writel(value, hext_stream->dpibr_addr);
 
 	return 0;
 }
@@ -523,12 +524,12 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_set_dpibr);
 
 /**
  * snd_hdac_ext_stream_set_lpib - sets the lpib value of a stream
- * @stream: hdac_ext_stream
+ * @hext_stream: hdac_ext_stream
  * @value: lpib value to set
  */
-int snd_hdac_ext_stream_set_lpib(struct hdac_ext_stream *stream, u32 value)
+int snd_hdac_ext_stream_set_lpib(struct hdac_ext_stream *hext_stream, u32 value)
 {
-	snd_hdac_stream_writel(&stream->hstream, SD_LPIB, value);
+	snd_hdac_stream_writel(&hext_stream->hstream, SD_LPIB, value);
 
 	return 0;
 }
-- 
2.25.1

