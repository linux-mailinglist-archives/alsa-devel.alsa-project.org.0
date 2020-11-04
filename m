Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF072A5CEA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 04:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E95D169C;
	Wed,  4 Nov 2020 04:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E95D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604459391;
	bh=B/eoybxluxfKkCChyU16SWAY0sv6u45VlO0frmq64kw=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NAfZiVCmx9HDl9ob4PoM8ewkhcxV+fFJ6j0DP58jrDgJMg7ZmtlfmhpF/dGzybvIS
	 1xjdYVE0cNteZ3OROqy1X2FxLTfgqf0CZZm0StbPKZXvcjddKLhJEdHXkhm2xoFGEj
	 fZ2u4FFcsCHnFRAMq3iSVUPPh0yFn5OKbOrhyKug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88912F8023E;
	Wed,  4 Nov 2020 04:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE5BF8023E; Wed,  4 Nov 2020 04:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EAA0F800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 04:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EAA0F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="CzyPVTBz"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201104030805epoutp032cfed58f559b2245d5406cb37fdfe618~ELzg7--Jp2826428264epoutp03i
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 03:08:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201104030805epoutp032cfed58f559b2245d5406cb37fdfe618~ELzg7--Jp2826428264epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604459285;
 bh=rhFor7HOID1/BRCifiDxOTT5PjmjzvoIwTFygN5tSoo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=CzyPVTBzBlN7lK6QN6UXbISs3Nd/eX3QEcQ75SjXw1rJf0oNbNtk0Ok7I7Xjy9hOX
 qKDMygCyK5/Osjhey54NqvfAjcFxdIqepk+fWGjbhH1e0r5lKTPZ44YOjEMzlBzUiD
 209AiuETz4pObMRAKMWdzBtLVbKmZU+Ks/d04HFk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20201104030805epcas2p481be255b865bad7e3eaf356b6aebacda~ELzgizq7D0145201452epcas2p4i;
 Wed,  4 Nov 2020 03:08:05 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.181]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CQs6C15zzzMqYkV; Wed,  4 Nov
 2020 03:08:03 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.AE.52511.11B12AF5; Wed,  4 Nov 2020 12:08:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201104030801epcas2p23ba139ff40fca7f3988d72622c58a0f5~ELzc3bYA-1727017270epcas2p2p;
 Wed,  4 Nov 2020 03:08:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104030801epsmtrp1831dd3d2b5f19dae741b87ee7f17cbf3~ELzc2aDiP0498804988epsmtrp1i;
 Wed,  4 Nov 2020 03:08:01 +0000 (GMT)
X-AuditID: b6c32a48-a9948a800000cd1f-73-5fa21b11775f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.41.08745.11B12AF5; Wed,  4 Nov 2020 12:08:01 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201104030801epsmtip14433db5b185d61b4a5359ad4bdc9304f~ELzcqV2sv2905029050epsmtip1b;
 Wed,  4 Nov 2020 03:08:01 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
Subject: [PATCH v2 1/1] ALSA: compress: allow pause and resume during draining
Date: Wed, 4 Nov 2020 12:08:01 +0900
Message-ID: <000101d6b257$b46b0620$1d411260$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdayV1qJKikvGkxVQ+2Fdrz6iBk1dw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmqa6g9KJ4g0mfDS2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyeLX/2dMFkcvLmayaLjbzG6x4ftaRouXm98wWRxpnMJksfPOCWYH
 Ho8Nn5vYPHbOusvusWlVJ5vHvJOBHn1bVjF6rN9ylcVj8+nqAPaoHJuM1MSU1CKF1Lzk/JTM
 vHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoEOVFMoSc0qBQgGJxcVK+nY2Rfml
 JakKGfnFJbZKqQUpOQWGhgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5Gddb2lkKTmpWzN61mrGB
 cYNSFyMnh4SAicTrKf8Yuxi5OIQEdjBKLN16mRXC+cQo8XB9MwuE85lRYtXF2YwwLadPzGKH
 SOxilPh38QxUy0tGib7OKewgVWwCuhJf7t1hBrFFBFQknvauYwIpYhY4wiTx7cFrsCJhgQCJ
 F/eOMoHYLEBFfzY/AFvBK2ApMeHAbCYIW1Di5MwnLCA2s4C8xPa3c5ghzlCQ+Pl0GSvEAj2J
 nRvaWCFqRCRmd7YxgyyTEFjLIbHi9XcWiAYXibUzNkDZwhKvjm9hh7ClJF72t7FDNDQzSrw7
 +wcqMYVRorNbCMI2ltgy9xTQRRxAGzQl1u/SBzElBJQljtyCuo1PouPwX3aIMK9ERxtUo5LE
 xlP/mCDCEhLzNkDN9pA4Pf8N0wRGxVlInpyF5MlZSJ6ZhbB2ASPLKkax1ILi3PTUYqMCE+TY
 3sQITsVaHjsYZ7/9oHeIkYmD8RCjBAezkghvTeS8eCHelMTKqtSi/Pii0pzU4kOMpsBgn8gs
 JZqcD8wGeSXxhqZGZmYGlqYWpmZGFkrivKEr++KFBNITS1KzU1MLUotg+pg4OKUamDZeXRwY
 kWHZ/XdzreeZ2qmM9s+3BRWfjDx/b9bJuDgDv5OnderuGam361cJxFbuuh5WUDTRQddr1h7v
 X7YXgp8xRjWvmfykPPfif5OOP+s2vn473amtZ6dA158J9nmaMv+kzHJ2G7ssf/7P///TP6cS
 r/uEWGxp7L5uqtiVfGVl9y6B8sh1bw6eMFkh0Hjm2MF3XU1WpVb1ydpvfmpeTHg6b3/abI6S
 wECRmnr59p8H5BfJOdxoK/9xqPXHnvbrS00mTY916k00aNBm5nL+7NX+Q8/0mObTOSweopGZ
 Fxi5J/iKd3c0dvfer/iaYHX0yuakmbar0xZY1P0SYa28bn0//anCjDPBG5xexq56qcRSnJFo
 qMVcVJwIAJXtHnxOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJTldQelG8wc1johZXLh5ispixrZvF
 ovHeBDaL1Ve3MFl8u9LBZPHr/zMmi6MXFzNZNNxtZrfY8H0to8XLzW+YLI40TmGy2HnnBLMD
 j8eGz01sHjtn3WX32LSqk81j3slAj74tqxg91m+5yuKx+XR1AHsUl01Kak5mWWqRvl0CV8b1
 lnaWgpOaFbN3rWZsYNyg1MXIySEhYCJx+sQsdhBbSGAHo0Tf8UiIuITEh/ln2CFsYYn7LUdY
 uxi5gGqeM0qcOtjHBpJgE9CV+HLvDjOILSKgIvG0dx0TSBGzwAUmif1H3zOCJIQF/CRefVgP
 NokFqOjP5gdgcV4BS4kJB2YzQdiCEidnPmHpYuQAataTaNsIVsIsIC+x/e0cZogjFCR+Pl3G
 CrFLT2LnhjZWiBoRidmdbcwTGAVnIZk0C2HSLCSTZiHpWMDIsopRMrWgODc9t9iwwCgvtVyv
 ODG3uDQvXS85P3cTIzi+tLR2MO5Z9UHvECMTB+MhRgkOZiUR3prIefFCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeb/OWhgnJJCeWJKanZpakFoEk2Xi4JRqYDL1kEtq3fM660yNppr0A21NOZf2
 SBYW/iMTPZO3bG9qkTfevuyewJ/jwSyrZfbOnNkx67HY/19/YivtrT996G39HJvZtF/rV3XD
 DCPOWxtarybL3xJd4jRjW/WrGZ3a2T/Fd2z45eu3qOmhrt6XV6lJyW9Pbey5d+CZ0bSUkiad
 Q6639E5xC31wP2YqPVda8edWwfbTt9/zGW8PD7/551KQdkq43/8As+str3/uC5L7uFBbXeCl
 xYepYs6bjHOnfjHcHRm4RXP9q0u562qrjvNalZ1pehIlU5mUU+nRaWrg3y0/NaKYT6T6yL68
 2HrLQywvnsyskrif8+K8+M5MPRHlL3krNzj847p9W+o7jxJLcUaioRZzUXEiAJo1yiseAwAA
X-CMS-MailID: 20201104030801epcas2p23ba139ff40fca7f3988d72622c58a0f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104030801epcas2p23ba139ff40fca7f3988d72622c58a0f5
References: <CGME20201104030801epcas2p23ba139ff40fca7f3988d72622c58a0f5@epcas2p2.samsung.com>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, 'Vinod Koul' <vkoul@kernel.org>,
 hmseo@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

With a stream with low bitrate, user can't pause or resume the stream
near the end of the stream because current ALSA doesn't allow it.
If the stream has very low bitrate enough to store whole stream into
the buffer, user can't do anything except stop the stream and then
restart it from the first because most of applications call draining
after sending last frame to the kernel.
If pause, resume are allowed during draining, user experience can be
enhanced.
To prevent malfunction in HW drivers which don't support pause
during draining, pause during draining will only work if HW driver
enable this feature explicitly by calling
snd_compr_use_pause_in_draining().

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 include/sound/compress_driver.h | 17 +++++++++++++
 sound/core/compress_offload.c   | 44 +++++++++++++++++++++++++++------
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 70cbc5095e72..5a0d6737de5e 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -67,6 +67,7 @@ struct snd_compr_runtime {
  * @metadata_set: metadata set flag, true when set
  * @next_track: has userspace signal next track transition, true when set
  * @partial_drain: undergoing partial_drain for stream, true when set
+ * @pause_in_draining: paused during draining state, true when set
  * @private_data: pointer to DSP private data
  * @dma_buffer: allocated buffer if any
  */
@@ -80,6 +81,7 @@ struct snd_compr_stream {
 	bool metadata_set;
 	bool next_track;
 	bool partial_drain;
+	bool pause_in_draining;
 	void *private_data;
 	struct snd_dma_buffer dma_buffer;
 };
@@ -142,6 +144,7 @@ struct snd_compr_ops {
  * @direction: Playback or capture direction
  * @lock: device lock
  * @device: device id
+ * @use_pause_in_draining: allow pause in draining, true when set
  */
 struct snd_compr {
 	const char *name;
@@ -152,6 +155,7 @@ struct snd_compr {
 	unsigned int direction;
 	struct mutex lock;
 	int device;
+	bool use_pause_in_draining;
 #ifdef CONFIG_SND_VERBOSE_PROCFS
 	/* private: */
 	char id[64];
@@ -166,6 +170,19 @@ int snd_compress_deregister(struct snd_compr *device);
 int snd_compress_new(struct snd_card *card, int device,
 			int type, const char *id, struct snd_compr *compr);
 
+/**
+ * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
+ * @substream: compress substream to set
+ *
+ * Allow pause and resume in draining state.
+ * Only HW driver supports this transition can call this API.
+ */
+static inline void snd_compr_use_pause_in_draining(
+					struct snd_compr_stream *substream)
+{
+	substream->device->use_pause_in_draining = true;
+}
+
 /* dsp driver callback apis
  * For playback: driver should call snd_compress_fragment_elapsed() to let the
  * framework know that a fragment has been consumed from the ring buffer
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index c1fec932c49d..3f4e14cdd15a 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -709,11 +709,24 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_RUNNING:
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
+		if (!retval)
+			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+		break;
+	case SNDRV_PCM_STATE_DRAINING:
+		if (!stream->device->use_pause_in_draining)
+			return -EPERM;
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
+		if (!retval)
+			stream->pause_in_draining = true;
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+	}
 	return retval;
 }
 
@@ -721,11 +734,25 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_PAUSED:
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+		if (!retval)
+			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+		break;
+	case SNDRV_PCM_STATE_DRAINING:
+		if (!stream->device->use_pause_in_draining ||
+		    !stream->pause_in_draining)
+			return -EPERM;
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+		if (!retval)
+			stream->pause_in_draining = false;
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+	}
 	return retval;
 }
 
@@ -768,6 +795,7 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
 		/* clear flags and stop any drain wait */
 		stream->partial_drain = false;
 		stream->metadata_set = false;
+		stream->pause_in_draining = false;
 		snd_compr_drain_notify(stream);
 		stream->runtime->total_bytes_available = 0;
 		stream->runtime->total_bytes_transferred = 0;
-- 
2.21.0


