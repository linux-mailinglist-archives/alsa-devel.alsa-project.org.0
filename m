Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34912283C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 11:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47A081655;
	Tue, 17 Dec 2019 11:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47A081655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576576961;
	bh=C65fAxRAERzklRFp50d7KIwfQiCtT5z/7+Bn1ue/Xsw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUHPDdwCl9JUpY6zJlTeCuyRaA12g7O+Narb7k4R9fuCYxknS7ApzaWOCJ0Cmy/yp
	 +FFtdjQdaYWIeU1za0yJfqSknNBX8DVwwEGm2Vk7hr7VZhlw4PVBBodxFu4cToqW3V
	 SiL3ZGWGam1tLIavS3vSE1HGEsEvfWgU7IVLFN7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DE1F80260;
	Tue, 17 Dec 2019 10:59:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41D1EF80269; Tue, 17 Dec 2019 10:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DDEAF80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 10:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DDEAF80088
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 01:59:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="221716998"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2019 01:59:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 10:58:45 +0100
Message-Id: <20191217095851.19629-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217095851.19629-1-cezary.rojewski@intel.com>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 1/7] ALSA: hda: Allow for compress stream to
	hdac_ext_stream assignment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently only PCM streams can enlist hdac_stream for their data
transfer. Add cstream field to hdac_ext_stream to expose possibility of
compress stream assignment in place of PCM one.
Limited to HOST-type only.

Rather than copying entire hdac_ext_host_stream_assign, declare separate
PCM and compress wrappers and reuse it for both cases.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h         |  1 +
 include/sound/hdaudio_ext.h     |  2 ++
 sound/hda/ext/hdac_ext_stream.c | 46 +++++++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index e05b95e83d5a..9a8bf1eb7d69 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -481,6 +481,7 @@ struct hdac_stream {
 	struct snd_pcm_substream *substream;	/* assigned substream,
 						 * set in PCM open
 						 */
+	struct snd_compr_stream *cstream;
 	unsigned int format_val;	/* format value to be set in the
 					 * controller and the codec
 					 */
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index ef88b20c7b0a..ec01f2024f0b 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -84,6 +84,8 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 		int num_stream, int dir);
 void snd_hdac_stream_free_all(struct hdac_bus *bus);
 void snd_hdac_link_free_all(struct hdac_bus *bus);
+struct hdac_ext_stream *snd_hdac_ext_cstream_assign(struct hdac_bus *bus,
+					   struct snd_compr_stream *cstream);
 struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream,
 					   int type);
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 6b1b4b834bae..b898b6c0b55d 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -14,6 +14,7 @@
 #include <sound/pcm.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/compress_driver.h>
 
 /**
  * snd_hdac_ext_stream_init - initialize each stream (aka device)
@@ -281,8 +282,7 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 }
 
 static struct hdac_ext_stream *
-hdac_ext_host_stream_assign(struct hdac_bus *bus,
-				struct snd_pcm_substream *substream)
+hdac_ext_host_stream_assign(struct hdac_bus *bus, int direction)
 {
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *stream = NULL;
@@ -296,7 +296,7 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 		struct hdac_ext_stream *hstream = container_of(stream,
 						struct hdac_ext_stream,
 						hstream);
-		if (stream->direction != substream->stream)
+		if (stream->direction != direction)
 			continue;
 
 		if (!stream->opened) {
@@ -310,13 +310,49 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 		spin_lock_irq(&bus->reg_lock);
 		res->hstream.opened = 1;
 		res->hstream.running = 0;
-		res->hstream.substream = substream;
+		res->hstream.substream = NULL;
+		res->hstream.cstream = NULL;
 		spin_unlock_irq(&bus->reg_lock);
 	}
 
 	return res;
 }
 
+static struct hdac_ext_stream *
+hdac_ext_host_stream_pcm_assign(struct hdac_bus *bus,
+				struct snd_pcm_substream *substream)
+{
+	struct hdac_ext_stream *res;
+
+	res = hdac_ext_host_stream_assign(bus, substream->stream);
+	if (res)
+		res->hstream.substream = substream;
+
+	return res;
+}
+
+/**
+ * snd_hdac_ext_cstream_assign - assign a host stream for compress
+ * @bus: HD-audio core bus
+ * @cstream: Compress stream to assign
+ *
+ * Assign an unused host stream for the given compress stream.
+ * If no stream is free, NULL is returned. Stream is decoupled
+ * before assignment.
+ */
+struct hdac_ext_stream *snd_hdac_ext_cstream_assign(struct hdac_bus *bus,
+					   struct snd_compr_stream *cstream)
+{
+	struct hdac_ext_stream *res;
+
+	res = hdac_ext_host_stream_assign(bus, cstream->direction);
+	if (res)
+		res->hstream.cstream = cstream;
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_cstream_assign);
+
 /**
  * snd_hdac_ext_stream_assign - assign a stream for the PCM
  * @bus: HD-audio core bus
@@ -350,7 +386,7 @@ struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 		return hstream;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
-		return hdac_ext_host_stream_assign(bus, substream);
+		return hdac_ext_host_stream_pcm_assign(bus, substream);
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
 		return hdac_ext_link_stream_assign(bus, substream);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
