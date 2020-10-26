Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D914D29895D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 10:20:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631AD16F4;
	Mon, 26 Oct 2020 10:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631AD16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603704028;
	bh=6mg201c6T1i3wpAtUrMuKZECFXqDNpS3it0GyPY1FS4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPOaXgW6CU1R3SuNNxA/sQHdBVZK/jgG/cBLRHDEpGPbyOLfvmuttFV4QT6BPtFAD
	 G63WC06pOB7e3ag4gf1fi9hck4ihtYWoOq8VzXkigRaESbYJ3BC+p1oBy8OI3qVhdn
	 bFGk1rCK+pEeSciNZ1FqzsgAILkStm95z05bRZ9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C55DDF80249;
	Mon, 26 Oct 2020 10:18:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E67F80212; Mon, 26 Oct 2020 10:18:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BAE0F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 10:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BAE0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="S6K0a5ja"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201026091842epoutp04f767aa40a4f412bc8e53ac2399f92646~BgDhxocuo2489424894epoutp04R
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 09:18:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201026091842epoutp04f767aa40a4f412bc8e53ac2399f92646~BgDhxocuo2489424894epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603703922;
 bh=stsJtmvhUlpkimjuIihwZJ4Xcr0PZaaaApjJl3P5Abk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=S6K0a5ja4A3h3bR29HPPXgSgiKR2A5Na/XkCso3G589EpJLoZgtZYSm9jbQdmpGO4
 gvMRlIbIbLMVqwHoYYqq+YN1K+mY1tdl+0t5CO3DKiDEzVqFuOQIpUS8VlI3F5htpV
 xxIPKdhKqUsAfeyHElOatQNEsudCJGpAscFgaVeM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20201026091841epcas2p2dc6bc514f01d31b559c894aaad0fce3e~BgDg7iNvl3116231162epcas2p2K;
 Mon, 26 Oct 2020 09:18:41 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CKTlz1VMwzMqYkc; Mon, 26 Oct
 2020 09:18:39 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 58.82.09588.F64969F5; Mon, 26 Oct 2020 18:18:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201026091838epcas2p2c9fc0848396c3dbce0cd35f813a3df0e~BgDeVVrgG1975619756epcas2p2Z;
 Mon, 26 Oct 2020 09:18:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201026091838epsmtrp2045431647c4cbaba00530625e2552c74~BgDeUgE-z0657306573epsmtrp2C;
 Mon, 26 Oct 2020 09:18:38 +0000 (GMT)
X-AuditID: b6c32a45-36bff70000002574-8f-5f96946fe397
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.69.08745.E64969F5; Mon, 26 Oct 2020 18:18:38 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201026091838epsmtip16e5fbbe99d5ade69f262fae60b04a8f2~BgDeD5kue2821128211epsmtip1I;
 Mon, 26 Oct 2020 09:18:38 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
In-Reply-To: 
Subject: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Mon, 26 Oct 2020 18:18:38 +0900
Message-ID: <001801d6ab78$fcfe0760$f6fa1620$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFYfkYlW14yIW5U9SNXNoYFWW92AgKTudZwAbYfV/gDH6isoAKHE7a9AdRQf28BYefddgKT6KNVAgBXeBkClq6mqAEeV+jFAljo6UsBqsh+KQIAfJ5tAba34gUBunORDwHIvLbUqZbTUQCACbBTwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRmVeSWpSXmKPExsWy7bCmuW7+lGnxBisa2CyuXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giMqxyUhN
 TEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6WUmhLDGnFCgU
 kFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYGhYoFecmFtcmpeul5yfa2VoYGBkClSZkJPxYrJu
 wUnNiocvH7A2MG5Q6mLk5JAQMJGYc7WZqYuRi0NIYAejxIF7/5ghnE+MEt/u9kI5nxklFu3d
 yArTMvfSIRaIxC5GifbOa1D9LxklLp16wQxSxSagK/Hl3h0gm4NDRMBLYv1bDZAaZoEjTBKr
 v/1iBIlzCvBKTPhnDVIuLOAucePBRkYQm0VAVeLd8c9sIDavgKXE438rmSFsQYmTM5+wgNjM
 AvIS29/OYYY4SEHi59NlrCDzRQSWMUpc7+5ghigSkZjd2QZV9IBDYt0SfwjbReLj9pNQcWGJ
 V8e3sEPYUhKf3+1lAxkkIdDMKPHu7B+oxBRGic5uIQjbWGLL3FNMIA8wC2hKrN+lD2JKCChL
 HLkFdRufRMfhv+wQYV6JjjaoRiWJjaf+MUGEJSTmbWCfwKg0C8ljs5A8NgvJ/bMQVi1gZFnF
 KJZaUJybnlpsVGCIHNWbGMGJWct1B+Pktx/0DjEycTAeYpTgYFYS4Z0jMzVeiDclsbIqtSg/
 vqg0J7X4EKMpMKgnMkuJJucDc0NeSbyhqZGZmYGlqYWpmZGFkjhv6Mq+eCGB9MSS1OzU1ILU
 Ipg+Jg5OqQYm6Qdby8xvHGrNDfez2inlaqm4INfXuO7zg9PeX4WCuR1fNty8+ztCbJ2jWdW2
 0FX3lzzTOpivx6vl9HXjjc4S8Q8yb5tvbJ5Wsyvy2V2NIysKDZytfzYEL5F68HdPSVb4ua+y
 3J+fJLsc3Cd8c81Ch+0XJ8Z7CBf+O3p77eEOlvg5HZ0uL8WbTmzbq8bS1D9XOkhwqduf+CVy
 /olZ099Lf12Z+VZtfdmBu3M94x658gv88vadaX/H1TtGy4DTRjevvrZ0n9fahti3gdKtj6ZJ
 nnmi19+cIfK5y39KlKJMvvGtW3J305f8PuHleKZ9WX7aphmfc+Pudwi8XLRpb31d8KKLavq/
 ror9mtP6q81JiaU4I9FQi7moOBEAktUOBVUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWy7bCSnG7elGnxBl/6xC2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giOKySUnN
 ySxLLdK3S+DKeDFZt+CkZsXDlw9YGxg3KHUxcnJICJhIzL10iAXEFhLYwSjRfsQTIi4h8WH+
 GXYIW1jifssRVoia54wSl9+Vg9hsAroSX+7dYQaxRQR8JI6cvA9Uw8XBLHCBSeLC+c/MII6Q
 wA1WiStXpjN1MXJwcArwSkz4Zw3SICzgLnHjwUZGEJtFQFXi3fHPbCA2r4ClxON/K5khbEGJ
 kzOfgB3HLKAt0fuwlRHClpfY/nYOM8RxChI/ny4DWywisIxR4np3BzNEkYjE7M425gmMwrOQ
 zJqFZNYsJLNmIWlZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOEq1tHYw7ln1
 Qe8QIxMH4yFGCQ5mJRHeOTJT44V4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7
 NbUgtQgmy8TBKdXAdNn12kvDr75b5gYpr61dPzP18AwlX+/+5fvkpyoU9Da5Lnzz4+375ypq
 fkH6H7wbmCa+TEzkfbDA5WnjS1bnzsZg1rXF9etcT1X+b7v6QejC/Bad//GFC2u2X/NMP8pS
 ab5w8+t/Vc5XdAte399+jMVF0CPhZdHhfp99kStf7G4WcLBx1l44f+ZuD1fHyKW9h9RnzPJ6
 d/xM/9p71qJ+b+cbvZ57iHmv967/XaIxWzhOyMdd3Pn5yJdZ+p8uXlNWbHVuU40+8+zis2WJ
 116k7krYP1t6WXm938rbfG1O9sxzi3WyVn9MOftPRUGo54BzNmu5C/uny083zHuXwbyD9bX2
 Efu6J9d5U4IsDov901NiKc5INNRiLipOBABFVODqQQMAAA==
X-CMS-MailID: 20201026091838epcas2p2c9fc0848396c3dbce0cd35f813a3df0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201012150106epcas2p23aa4b65b1b23cf8e15680554f9a0d7e4
References: <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com> <s5hr1q7sa9f.wl-tiwai@suse.de>
 <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
 <s5ha6wusb2l.wl-tiwai@suse.de> <20201012052525.GH2968@vkoul-mobl>
 <s5hk0vwq65o.wl-tiwai@suse.de> <20201012122423.GJ2968@vkoul-mobl>
 <5b26cdd5-8a15-fa26-86af-13bfbfad5341@perex.cz>
 <20201012135540.GK2968@vkoul-mobl>
 <777e0046-1e3a-e702-c070-cac4c0525ccd@perex.cz>
 <s5hh7qzplsb.wl-tiwai@suse.de>
 <0afa7a39-84d5-0b9b-5453-8e7848a30bb6@perex.cz>
 <CGME20201012150106epcas2p23aa4b65b1b23cf8e15680554f9a0d7e4@epcas2p2.samsung.com>
 <s5ha6wrpk1t.wl-tiwai@suse.de> <000001d6a2e0$8e6f4840$ab4dd8c0$@samsung.com>
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


