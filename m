Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EBF478056
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DB051FB2;
	Fri, 17 Dec 2021 00:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DB051FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696413;
	bh=m9UyD1XgcjQk0klaL+G9FQWRitmIsc7Y+n+REXBpzBg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/cbxyvN7vnOr+jiafa+w7a8h1j6p4BsT1aRFxcHdCEJPReriL7jvSQSLnOwEh8dW
	 PRIS5a4XBm3Rfc1i5KGCdFRqLHQU4MI250bcgoDxI1oGu4cl8juKmDTt67CKJWJUm3
	 VMn9REKk8X0aPXdsIUadNeV40QyG5XSX0HcH8MxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC63F8015B;
	Fri, 17 Dec 2021 00:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50492F80165; Fri, 17 Dec 2021 00:11:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1144F800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1144F800F4
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303002699"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="303002699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756278656"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams to
 hdac_stream.c
Date: Thu, 16 Dec 2021 17:11:27 -0600
Message-Id: <20211216231128.344321-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
References: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

snd_hdac_ext_stop_streams() has really nothing to do with the
extension, it just loops over the bus streams.

Move it to the hdac_stream layer and rename to remove the 'ext'
prefix and add the precision that the chip will also be stopped.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/hdaudio.h         |  1 +
 include/sound/hdaudio_ext.h     |  1 -
 sound/hda/ext/hdac_ext_stream.c | 17 -----------------
 sound/hda/hdac_stream.c         | 16 ++++++++++++++++
 sound/soc/intel/skylake/skl.c   |  4 ++--
 5 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 22af68b01426..6a90ce405e60 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -558,6 +558,7 @@ int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start);
 void snd_hdac_stream_clear(struct hdac_stream *azx_dev);
 void snd_hdac_stream_stop(struct hdac_stream *azx_dev);
+void snd_hdac_stop_streams_and_chip(struct hdac_bus *bus);
 void snd_hdac_stream_reset(struct hdac_stream *azx_dev);
 void snd_hdac_stream_sync_trigger(struct hdac_stream *azx_dev, bool set,
 				  unsigned int streams, unsigned int reg);
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index d4e31ea16aba..56ea5cde5e63 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -92,7 +92,6 @@ void snd_hdac_ext_stream_decouple_locked(struct hdac_bus *bus,
 				  struct hdac_ext_stream *azx_dev, bool decouple);
 void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 				struct hdac_ext_stream *azx_dev, bool decouple);
-void snd_hdac_ext_stop_streams(struct hdac_bus *bus);
 
 int snd_hdac_ext_stream_set_spib(struct hdac_bus *bus,
 				 struct hdac_ext_stream *stream, u32 value);
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 37154ed43bd5..c09652da43ff 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -475,23 +475,6 @@ int snd_hdac_ext_stream_get_spbmaxfifo(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_get_spbmaxfifo);
 
-
-/**
- * snd_hdac_ext_stop_streams - stop all stream if running
- * @bus: HD-audio core bus
- */
-void snd_hdac_ext_stop_streams(struct hdac_bus *bus)
-{
-	struct hdac_stream *stream;
-
-	if (bus->chip_init) {
-		list_for_each_entry(stream, &bus->stream_list, list)
-			snd_hdac_stream_stop(stream);
-		snd_hdac_bus_stop_chip(bus);
-	}
-}
-EXPORT_SYMBOL_GPL(snd_hdac_ext_stop_streams);
-
 /**
  * snd_hdac_ext_stream_drsm_enable - enable DMA resume for a stream
  * @bus: HD-audio core bus
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 9867555883c3..75986b89dcd9 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -142,6 +142,22 @@ void snd_hdac_stream_stop(struct hdac_stream *azx_dev)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_stop);
 
+/**
+ * snd_hdac_stop_streams_and_chip - stop all streams and chip if running
+ * @bus: HD-audio core bus
+ */
+void snd_hdac_stop_streams_and_chip(struct hdac_bus *bus)
+{
+	struct hdac_stream *stream;
+
+	if (bus->chip_init) {
+		list_for_each_entry(stream, &bus->stream_list, list)
+			snd_hdac_stream_stop(stream);
+		snd_hdac_bus_stop_chip(bus);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stop_streams_and_chip);
+
 /**
  * snd_hdac_stream_reset - reset a stream
  * @azx_dev: HD-audio core stream to reset
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 5b1a15e39912..148ddf4cace0 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -439,7 +439,7 @@ static int skl_free(struct hdac_bus *bus)
 
 	skl->init_done = 0; /* to be sure */
 
-	snd_hdac_ext_stop_streams(bus);
+	snd_hdac_stop_streams_and_chip(bus);
 
 	if (bus->irq >= 0)
 		free_irq(bus->irq, (void *)bus);
@@ -1096,7 +1096,7 @@ static void skl_shutdown(struct pci_dev *pci)
 	if (!skl->init_done)
 		return;
 
-	snd_hdac_ext_stop_streams(bus);
+	snd_hdac_stop_streams_and_chip(bus);
 	list_for_each_entry(s, &bus->stream_list, list) {
 		stream = stream_to_hdac_ext_stream(s);
 		snd_hdac_ext_stream_decouple(bus, stream, false);
-- 
2.25.1

