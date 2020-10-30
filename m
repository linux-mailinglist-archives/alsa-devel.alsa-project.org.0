Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56C29F9AE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 01:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA9E15E5;
	Fri, 30 Oct 2020 01:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA9E15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604017754;
	bh=6mg201c6T1i3wpAtUrMuKZECFXqDNpS3it0GyPY1FS4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vp9PCOvGnqHlWVskmsGLlKARXyn3sexC/EJDoCVQGdhDi6IZTNqreFyaJYg/Icvo/
	 NAXO0Hq3kqaar1FL+N7VPIz/zpuzTj7rfxOWj0V1gqFHV527DKTgi2I/nKk6SKIEx8
	 UwRggQEyxFc5g+B/qI0Alk+hA2w7jlO3DubX4AWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFA8F8020D;
	Fri, 30 Oct 2020 01:27:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B989DF8020D; Fri, 30 Oct 2020 01:27:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F53F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 01:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F53F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="BfOM2069"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201030002727epoutp028135564903f483e73c4d622eaa135410~CnY071W100113101131epoutp02r
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 00:27:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201030002727epoutp028135564903f483e73c4d622eaa135410~CnY071W100113101131epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604017647;
 bh=stsJtmvhUlpkimjuIihwZJ4Xcr0PZaaaApjJl3P5Abk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=BfOM2069b7pLTWkzOebhefWvG+yf34sneLWgr2Qyz1BrVFs/KEDBowtERqLVaeyQv
 MS4ygO+qPSCLQPC5NJPM8I6ILQSb/Zt5iMIIfY7H0ultXLaJ0mrwYO7IEQn+ML/GKK
 I0F5UfN5t2QTcYeyopBZc71Hc39qKg7B+OgGHT2w=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20201030002726epcas2p1f71ce74029c497d493a3bbed262eecd7~CnY0Qx3lt0381403814epcas2p1T;
 Fri, 30 Oct 2020 00:27:26 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.184]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CMjn81d1MzMqYkV; Fri, 30 Oct
 2020 00:27:24 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C1.9A.53956.9ED5B9F5; Fri, 30 Oct 2020 09:27:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201030002721epcas2p1bffd10681a95aef2946482bf536240ae~CnYvOymDj0592605926epcas2p1p;
 Fri, 30 Oct 2020 00:27:21 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201030002721epsmtrp2111afaca0ef6f35a92bfeab20ee93c20~CnYvN-cIO2535325353epsmtrp2P;
 Fri, 30 Oct 2020 00:27:21 +0000 (GMT)
X-AuditID: b6c32a47-715ff7000000d2c4-af-5f9b5de92887
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.6A.08745.8ED5B9F5; Fri, 30 Oct 2020 09:27:20 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201030002720epsmtip2bd1702857010ce5d426999cfd8f6e650~CnYu_JTyj3147331473epsmtip2Q;
 Fri, 30 Oct 2020 00:27:20 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
In-Reply-To: 
Subject: [PATCH v2] ALSA: compress: allow pause and resume during draining
Date: Fri, 30 Oct 2020 09:27:20 +0900
Message-ID: <009601d6ae53$6e643d70$4b2cb850$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdasBG+jlIrR9lKbQYeNZP3ZezNRGACTuO5A
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxjOd87htLBVjrXFb3XJ6tklg1loC2WngxIzDVSnS6chbk5Sz+Ck
 RUvb9bLg9odLJBQZ1ssMFltFGQZ0AykDZMGECpmAZGEBsjRgWFZQjEUqDsbFupbWjH/P+7zP
 k/d9vgsb5fbiAnah3sKY9LSOxOOwjruJ6aLZvDq1uOz+dmp0xINQtR2nMKr0gR2nboy1I9Ti
 aCVC2bpPx1ArL2cQqn/kGkKVTJazqNalnwA1636CUH2l5xHq9sQ9dCdH2bpQhitvOyZZyrZm
 G650DXymvONvxJU17c1A2dI+hindQ9+p2Id1mVqGLmBMQkafbygo1GsU5CcH1bvUsnSxRCSR
 Ux+SQj1dxCjI3ftUouxCXWhlUvgNrbOGKBVtNpMpWZkmg9XCCLUGs0VBMsYCnVEiMSab6SKz
 Va9JzjcUfSQRi6WykPKoTvvonMg4kFj81+xUTAloJatALBsSafDpyu+sMOYSXQAGV4qrQFwI
 PwOw5+dzeKRYAND57yryytH2eDja6AbQPukGkWIWQNevN0FYhRMi+PzBBFoF2GwesRe2+N8P
 a1CiD4E3FldAmI8lONAezAjLt4QkMxMP1wdgxLvwyXMnFsYcQg5HSwJRvBkOXPStY5R4C3b6
 L6GRhYRweboxJsLzYJ2tYp3nEVLofepFwnMh8Scb1r6sxyKG3bCr5HI0zRb4+Ld2VgQL4MJc
 Dx4xlAM4N7wWbZwH0HaKG8GpsN05iIQDoEQibOlOCUNIvA37vNHdNsHKuy9YEZoDKyuiRhLe
 GgwiERpCVyvLDkjHhmCODcEcG8I4/h91BWDNIIExmos0jFlqTN14021g/S0n5XSBWv98sgcg
 bOABkI2SPM6jzRfVXE4BfeJbxmRQm6w6xuwBstBRn0EF/HxD6DPoLWqJTJqeLpbLKFm6lCK3
 cnKbatRcQkNbmOMMY2RMr3wIO1ZQgtjyzhykPElvVPTm5GHisylD22YHa6oOHSpv6Jw2rmZX
 vzZd2rDz0j7OQ+mzJl1u5cBVLGl5MXeIv38168jleFfv5Jv3Gnmf3+zY8+PwUnVXz4i8W3lh
 Wf7O2fiyk3vn+dKvBfWvv3dAsrCLm3xBeN8jUn1vi/PtEHlnTspdTTtgQmCtt5eZTFnD4Nbg
 leGlgfHrt+ZM0K2ixuu/ovuvb/qFp54/cbR2e4YxM2P1zovT/2yrOz427qz5lO+r+NJfrGF8
 9R8cuWbNkh/OSZE5GwR//zFFa2P4ad6pA4rOj8kEX7U9Nd6KLQy2KSxpeH/14p5AIBs/1k8E
 fzj2RcAdbCYxs5aWJKEmM/0fEUqQmFQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWy7bCSvO6L2NnxBrNmWFpcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk0Xnrn5Wi1//nzFZHL24mMmi4W4zu8WG72sZLV5ufsNkcaRxCpPF
 zjsnmB14PTZ8bmLz2DnrLrvHplWdbB7zTgZ67Hu7jM2jb8sqRo/1W66yeGw+XR3AEcVlk5Ka
 k1mWWqRvl8CV8WKybsFJzYqHLx+wNjBuUOpi5OSQEDCR2PTqLFsXIxeHkMAORon9fYuYIBIS
 Eh/mn2GHsIUl7rccYYUoes4o8WvPKWaQBJuArsSXe3fAbBEBH4kjJ++DFTELXGCSuHD+M1hC
 SIBH4tWG/YxdjBwcnAK8EhP+WYOEhQW8JJ7deQ62jEVAVeLNl7ksIDavgKXElYaPULagxMmZ
 T8BsZgFtid6HrYwQtrzE9rdzmCGOU5D4+XQZK0RcRGJ2ZxvUPUYSt97fYprAKDwLyahZSEbN
 QjJqFpL2BYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgqNUS2sH455VH/QOMTJx
 MB5ilOBgVhLhfSE4M16INyWxsiq1KD++qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotg
 skwcnFINTNZTmP597pFL2jtdl2f/E8OZ6x24L59Z538tf/2xt8+u2wv4rlyl8z9P46bwBNlW
 UakNH9/EX3j0jOnfNptL3P2xqpw75ty/bbQk/SJv+dTtTu8N64VSY/YVZ/2zPnlx5S3OSZOY
 9/2d7Wt68uWSqjSePF/uZ+Kt4gH6eu/fMBx7NDNDYdnxC0Vv9j5ZoDh72bq1F35JvZ30zWCh
 38Uv20sucnzc8tLh6vsTL/atEHS/92JGQvrRia2rMw1d2H4E6ziuaFDtuWhnavyOrZH3XNq3
 Gsnjyx5Fnlk4cfHN2vr3698tvRUbUPC4unr3wvWfi+5bn5B5O1VUmkl59en89nj2ZZ+03Kr/
 Jer5NHIo7q8xUWIpzkg01GIuKk4EAH/0jBpBAwAA
X-CMS-MailID: 20201030002721epcas2p1bffd10681a95aef2946482bf536240ae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030002721epcas2p1bffd10681a95aef2946482bf536240ae
References: <CGME20201030002721epcas2p1bffd10681a95aef2946482bf536240ae@epcas2p1.samsung.com>
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


