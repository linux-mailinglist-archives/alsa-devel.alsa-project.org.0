Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85729A274
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 02:58:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D0A16AB;
	Tue, 27 Oct 2020 02:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D0A16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603763917;
	bh=6mg201c6T1i3wpAtUrMuKZECFXqDNpS3it0GyPY1FS4=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BIy6JQ6/tnr4Ekol6bqByDR40RRlSCKnyA0Q4uywlBtoAWIBzseoQHB1ebj0Drh7C
	 nmPh/lYaLV8sN8lNOpcbjZscH9Z+utFjZy3Jlx57YaOzx8N1ewLQKpxB2yYEkioLRy
	 2PAVGrctOe3gKb8JY6ZpBqJ/8jOhuXk2366B/6MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4865F8026D;
	Tue, 27 Oct 2020 02:57:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040A7F80212; Tue, 27 Oct 2020 02:57:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F23F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 02:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F23F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="oXlLySvE"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201027015731epoutp0447a102b552427e181510975c9d0daa5c~BtrnqWrMW2032920329epoutp04Y
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 01:57:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201027015731epoutp0447a102b552427e181510975c9d0daa5c~BtrnqWrMW2032920329epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603763851;
 bh=stsJtmvhUlpkimjuIihwZJ4Xcr0PZaaaApjJl3P5Abk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=oXlLySvE6YW8sCUBrovPBoWO2yHnqbXCIWECg0BrvyVMXhud8BAExqWiFOEpAsQJy
 gwlMlac2DOCPPz5GcMzAXDDFH6FwYJI/NkuX+aWl8xw8GOrky31m1OdRWphlMnmm0Q
 AEP6WROHRQoFaTqM3AcusjnjVmREsb15NEHBOEhY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20201027015731epcas2p3771065ecedf0b8efc4131c591c7b6956~Btrm_KLcp2148421484epcas2p3x;
 Tue, 27 Oct 2020 01:57:31 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.188]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4CKvwS6MdYzMqYkg; Tue, 27 Oct
 2020 01:57:28 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.6E.09908.78E779F5; Tue, 27 Oct 2020 10:57:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6~Btri3h9t32161221612epcas2p1c;
 Tue, 27 Oct 2020 01:57:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201027015726epsmtrp1105d7c4d9da286df58741de7e9992a1e~Btri2mxob0335903359epsmtrp13;
 Tue, 27 Oct 2020 01:57:26 +0000 (GMT)
X-AuditID: b6c32a48-139ff700000026b4-68-5f977e87fca0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C8.FB.08745.68E779F5; Tue, 27 Oct 2020 10:57:26 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201027015726epsmtip126cbc326bd4f67199e3d65dd901beda9~BtriKFbFR2548225482epsmtip1f;
 Tue, 27 Oct 2020 01:57:26 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
Subject: [PATCH v2] ALSA: compress: allow pause and resume during draining
Date: Tue, 27 Oct 2020 10:57:25 +0900
Message-ID: <000501d6ac04$85019b50$8f04d1f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdasBG+jlIrR9lKbQYeNZP3ZezNRGA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmmW573fR4g5lvOC2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giMqxyUhN
 TEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6WUmhLDGnFCgU
 kFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYGhYoFecmFtcmpeul5yfa2VoYGBkClSZkJPxYrJu
 wUnNiocvH7A2MG5Q6mLk5JAQMJG48KCXGcQWEtjBKLH6uHEXIxeQ/YlR4t/OLawQic+MEl/e
 mMI0/Dz+kBGiaBejxJKfh9khnJeMEn/f7mYHqWIT0JX4cu8O0FgODhEBL4n1bzVAapgFjjBJ
 rP72ixGkRhgo/uzOcyaQGhYBVYmd38xBwrwClhIPlh1mgbAFJU7OfAJmMwvIS2x/O4cZ4ggF
 iZ9Pl4EdJyKgJ7H/1H52iBoRidmdbVA1Bzgk1i6MhbBdJKa3nmCEsIUlXh3fwg5hS0m87G8D
 u19CoJlR4t3ZP1CJKYwSnd1CELaxxJa5p8DuZBbQlFi/Sx/ElBBQljhyC+o0PomOw3/ZIcK8
 Eh1tUI1KEhtP/WOCCEtIzNsANdtDYvXVTvYJjIqzkPw4C8mPs5D8Mgth7QJGllWMYqkFxbnp
 qcVGBSbI8byJEZyStTx2MM5++0HvECMTB+MhRgkOZiUR3jkyU+OFeFMSK6tSi/Lji0pzUosP
 MZoCA30is5Rocj4wK+SVxBuaGpmZGViaWpiaGVkoifOGruyLFxJITyxJzU5NLUgtgulj4uCU
 amDKjHK6nb2z5NiJp+vyp05eMD3oPFexq2pRzIbo3KMrOa94h+ffW2nH5BLZ7acScNpswouH
 gp3no3Nuxh9frtxYJr6wL+8651bJ5K93Hl7fssvmnPPnAiX2e7oZZ0te/fh5TF8yJeHz6e1i
 LLs6r6xaEnbwnXTEy5Sn+3fqKHw5oRef09eeU+6wYrb18h/Czz/4xUywjdfYnTY705z1utbj
 Xa8OOHJPm2RhsoBD03kbN6tfkVpmZa7PxO9vfgtfMrNJ6lhWI398QyV71utVT6av3/P0gtyf
 13mKz2w8jW6dl56y9KP2xpCJC08zmtx1YFKe/uMF99Xwg1PUF2i88XXnCK0XXHE941PbF8bX
 Gu9XKLEUZyQaajEXFScCAEgT2KxSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSnG5b3fR4g8tfVSyuXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giOKySUnN
 ySxLLdK3S+DKeDFZt+CkZsXDlw9YGxg3KHUxcnJICJhI/Dz+kLGLkYtDSGAHo8T6rffYIBIS
 Eh/mn2GHsIUl7rccYQWxhQSeM0o0TnIFsdkEdCW+3LvDDGKLCPhIHDl5nxVkELPABSaJC+c/
 gyWEBbwknt15ztTFyMHBIqAqsfObOUiYV8BS4sGywywQtqDEyZlPwGxmAW2J3oetjBC2vMT2
 t3OYIW5QkPj5dBkrxC49if2n9rND1IhIzO5sY57AKDgLyahZSEbNQjJqFpKWBYwsqxglUwuK
 c9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgmNOS2sH455VH/QOMTJxMB5ilOBgVhLhnSMzNV6I
 NyWxsiq1KD++qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotgskwcnFINTAqLfodNvfLp
 NpvPLcZPE+adcXOccDvC8ydvSKpJhGrY/vMMAjuqS8+dEqjQ/7jjm+jPHdV/Dii+chBIvXhi
 tfm62Er/F5OF+5qOXlG/vaev7cAtZdvQXfyRjMfYW/MnKPE/814rou/R8UTD++b3WvXlxzsO
 aK7Idi+Va3upIBu65VnniT8iHgFHT7pbp+4Uaf1tfpiRkflW7CShkmlbDZ4dCT6vfopx3/f9
 2tV7VuTNXsxavoXzsdlBsXz9J+t0Dz+RrKvuO9J1ckPLZOPisHMuRzpMTeYtZJ566MOr0Dwf
 Ts+QnL9GKxOa3Vt7rcouH6pn39o9O5Rjvc6bf6eZ8z6X/GXbnDZJR5ZJLl2eRYmlOCPRUIu5
 qDgRAK2jtaYoAwAA
X-CMS-MailID: 20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6
References: <CGME20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6@epcas2p1.samsung.com>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, 'Vinod Koul' <vkoul@kernel.org>,
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
index 0e53f6f31916..a071485383ed 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -708,11 +708,24 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
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
 
@@ -720,11 +733,25 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
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
 
@@ -767,6 +794,7 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
 		/* clear flags and stop any drain wait */
 		stream->partial_drain = false;
 		stream->metadata_set = false;
+		stream->pause_in_draining = false;
 		snd_compr_drain_notify(stream);
 		stream->runtime->total_bytes_available = 0;
 		stream->runtime->total_bytes_transferred = 0;
-- 
2.21.0


