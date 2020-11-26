Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCC2C5408
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 13:36:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8642817D7;
	Thu, 26 Nov 2020 13:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8642817D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606394210;
	bh=9iMUEZvL/FocxQADLepDv1tbbenfqfDFVx1x66x9tvk=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SdSO33s3WmQk5YakQQF6Zwclt5GBGuevNt8Xd8AP1HTRE83KGV4uK84XtXl9iE5xI
	 Tg0q2+TI3qV7Du8WgPT3eBFWJ7EIQEfaw6Th7Q38HqSs42/7FumNvXXw+ooaQOe3sG
	 /RNEBqtgxFjYpcbUZVPD7M75EOhrFn5tSbcv+j0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CD7F80165;
	Thu, 26 Nov 2020 13:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED2EF8026F; Thu, 26 Nov 2020 13:35:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACF1FF80165
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 13:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF1FF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Vnz0WXZv"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201126123456epoutp030a95eea2ba644e6b0b8bf8dd75f9129e~LDut_gps-1804618046epoutp039
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 12:34:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201126123456epoutp030a95eea2ba644e6b0b8bf8dd75f9129e~LDut_gps-1804618046epoutp039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606394096;
 bh=lS1JywEarQwygT8uYbpAFbDu2wq+HheBzEPHD7qeGeU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Vnz0WXZv8FPxFouKOpSx9As2np0aVo2IfC3UylPQO0YTTVvGB6aGQIK2S1Vl0KGR8
 4noCl2nn7qPNXwFBZILBEc9XQcfcKZYbMuxz5/AECm2L/SopTcQb8TRzdjLLhftOvX
 v5aKQbbDYsGo7tYvxQF9ssM+CsIaLcV0pK3jsJhs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20201126123455epcas2p4821f75fad7c94ffc9c6645fa0ce57e72~LDutCFbWe2290322903epcas2p4-;
 Thu, 26 Nov 2020 12:34:55 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.184]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Chcf53yqyzMqYkY; Thu, 26 Nov
 2020 12:34:53 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.18.52511.DE0AFBF5; Thu, 26 Nov 2020 21:34:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201126123452epcas2p2638c08262ef400cc0ad99fc2d1bd7b2a~LDuqISAVz2668026680epcas2p2c;
 Thu, 26 Nov 2020 12:34:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201126123452epsmtrp2cee6279ee462b728a0468637a53f24a2~LDuqHg-LM0679306793epsmtrp26;
 Thu, 26 Nov 2020 12:34:52 +0000 (GMT)
X-AuditID: b6c32a48-50fff7000000cd1f-89-5fbfa0ed2df6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.ED.13470.CE0AFBF5; Thu, 26 Nov 2020 21:34:52 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201126123452epsmtip2018a73f2183e2ec04989ae1e857f4be1~LDup5M11p0532805328epsmtip2A;
 Thu, 26 Nov 2020 12:34:52 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Subject: [PATCH v3 1/1] ALSA: compress: allow pause and resume during draining
Date: Thu, 26 Nov 2020 21:34:52 +0900
Message-ID: <000101d6c3f0$89b312b0$9d193810$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbD7iBmuJf7aCd0QsuFbI+hWc4+8A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwTZxzee3f2iq7bDTr2jixZOWf8yMC22nIsoCY4PN3icIRt2R/rDrgU
 sn6l1xLBxfCRVVoYYgZua4E1cSEbfoDYUCWCrNBU7JjAkKgBolkZ6KxMYGidrGt7XcZ/z/v7
 Pc/v43nfV4gm9gtShKU6E2vUMRpSsB7rGdyqTAs6r6ikg7Mp1MSYB6Gmn2RQ3/TUYVTVTKOA
 On3DhVArE7UI9TT8O0J5x04hVOV0DU51PT4LqHsXHiDUUFUTQl2auoruEdFdS9UC+pJ9Gqe7
 O6wCum34EN3g6gB0p+sGRl/wH8nDP9ZklbBMMWuUsLoifXGpTp1NvpOvylEplFJZmiyTyiAl
 OkbLZpN7381Lyy3VRIYlJWWMxhwJ5TEcR27flWXUm02spETPmbJJ1lCsMchkhnSO0XJmnTq9
 SK99SyaVyhUR5qeaEscVJ254tuXwrQcrWCWoIW0gQQiJnXDu5z6BDawXJhIXAfx1cRnjD4sA
 /jZ5PJ5ZAXBo4BFiA8KYZLk3lY/3AbjotQH+cA/A6xNX8WhdAZEGl2em0CgWE5ugK3AnVgkl
 ZhBYNR9EookkIg8+GgjESFiE1OkPxsQiIhNe/+t7hMcvweFvA1gUo8Tr0B1sQfnBJTA0276O
 b5AO71svC3iOGDqsFjTaDBIuITzWdBvjBXuhzTMu4HESvO9z4TxOgUsPeQcgUQPgw5Fn8UQT
 gNa6RB7vgK7Wa7H9UWIr7OzdzluxEQ7djs/2AqwdXMX5sAjWWuJCEp6/9k/cOAjbuuK1afhL
 ezXSCFLta5a0r1nSvmYZ+/9tnQDrAMmsgdOqWU5u2Ln2srtB7CFvoy8CR/DPdA9AhMADoBAl
 xaJ9SX2qRFExU17BGvUqo1nDch6giNh+Ak15uUgf+Qk6k0qmkCuV0kwFpVDKKfIVUcGPDapE
 Qs2Y2M9Y1sAa/9MhwoSUSgTtYsN1yepkn1w6X+A4cBo/+hHdWr/lwJGB54YLfXZb9qay2YXP
 +8rFOgR81fGJY2EPnrNZLPog90vSvWwcORkMjW6e+qHsjE804u/fXT0kf/L3UcurjPvQeG5C
 42WLuTZo8E+/F7qZUV6vah5tu6Wl1722agj+FPYfz/GVJjx/rqd1cv/NjV7vXcGJDXcPjz9W
 EeMV8zTVcscZPh84V9K/oXe3O91qLDyY1fxig7dQNNo6d/Dr4R1T6rHGnLP5Wvbp+/XuUx92
 O/DQMY/4Te/gyTNVodQ/vui1zImrvQtNS84WX37Baj4unt5fH2JIT8V3Rizwtrs9PPlGs1O5
 i8S4Eka2DTVyzL/8xVLEUQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXvfNgv3xBltbpS2uXDzEZHH3h7nF
 jG3dLBaN9yawWay+uoXJ4tuVDiaLX/+fMVkcvbiYyaLhbjO7xYbvaxktXm5+w2RxpHEKk8XO
 OyeYHXg9NnxuYvPYOesuu8emVZ1sHvNOBnr0bVnF6LF+y1UWj82nqwPYo7hsUlJzMstSi/Tt
 ErgyZu9fwF7wR6Pi5ptvLA2MzUpdjBwcEgImEl92KXYxcnEICexmlGhtncLWxcgJFJeQ+DD/
 DDuELSxxv+UIK0TRc0aJQ0sughWxCehKfLl3hxnEFhFQldjy5AFYnFngDZPEl3OFILawgJ/E
 3lXXGUFsFqCa9affgg3lFbCUOP91CROELShxcuYTFpCDmAX0JNo2MkKMkZfY/nYOM8QNChI/
 ny5jhVilJ/Gqcw/UKhGJ2Z1tzBMYBWchmTQLYdIsJJNmIelYwMiyilEytaA4Nz232LDAMC+1
 XK84Mbe4NC9dLzk/dxMjOMq0NHcwbl/1Qe8QIxMH4yFGCQ5mJRFed+G98UK8KYmVValF+fFF
 pTmpxYcYpTlYlMR5bxQujBMSSE8sSc1OTS1ILYLJMnFwSjUwBX1bvXvapKzqbW0yfyYcT5bL
 fLQ+OMlM9k7tpq0Hw5i+3TFeKezIZDxzr3OHZr62jZLQkgm2Tvc4KjMYgnh2WvnK3XzVwnxq
 ZdjdRytff1natvbO7ed9WrdqHh0uDuLw+/DeMPLS0eyV2Y7GxafP2azItTta8Dj1xPTACDmt
 7BOZx2bvbnD+1+jxbcdO4aTqNIl8PYVMyWVpab1Hfn465Lt5VcZdVffcl3dus9yTkZz0/f3u
 Y3tXS0jKhxs6HQ9svl4733CfzRypXUt3qd89weoy4cb5iknrN1bnXN5rUXo0adZjI4Z7T1Z9
 ddZJFWkpFn3C2FgXwCQ8562joNe27Z8v5V4p9O39U/2k1cW1S4mlOCPRUIu5qDgRADjzyN0h
 AwAA
X-CMS-MailID: 20201126123452epcas2p2638c08262ef400cc0ad99fc2d1bd7b2a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201126123452epcas2p2638c08262ef400cc0ad99fc2d1bd7b2a
References: <CGME20201126123452epcas2p2638c08262ef400cc0ad99fc2d1bd7b2a@epcas2p2.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 'Takashi Iwai' <tiwai@suse.de>,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 kimty@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 s47.kang@samsung.com, pilsun.jang@samsung.com, tkjung@samsung.com
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
 include/sound/compress_driver.h | 16 ++++++++++++++
 sound/core/compress_offload.c   | 39 ++++++++++++++++++++++++++-------
 2 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 70cbc5095e72..277087f635f3 100644
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
@@ -166,6 +170,18 @@ int snd_compress_deregister(struct snd_compr *device);
 int snd_compress_new(struct snd_card *card, int device,
 			int type, const char *id, struct snd_compr *compr);
 
+/**
+ * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
+ * @substream: compress substream to set
+ *
+ * Allow pause and resume in draining state.
+ * Only HW driver supports this transition can call this API.
+ */
+static inline void snd_compr_use_pause_in_draining(struct snd_compr_stream *substream)
+{
+	substream->device->use_pause_in_draining = true;
+}
+
 /* dsp driver callback apis
  * For playback: driver should call snd_compress_fragment_elapsed() to let the
  * framework know that a fragment has been consumed from the ring buffer
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index c1fec932c49d..debc30fcf5b3 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -709,11 +709,22 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_RUNNING:
+		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
+		if (!retval)
+			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+		break;
+	case SNDRV_PCM_STATE_DRAINING:
+		if (!stream->device->use_pause_in_draining)
+			return -EPERM;
+		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
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
 
@@ -721,11 +732,22 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_PAUSED:
+		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+		if (!retval)
+			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+		break;
+	case SNDRV_PCM_STATE_DRAINING:
+		if (!stream->pause_in_draining)
+			return -EPERM;
+		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
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
 
@@ -768,6 +790,7 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
 		/* clear flags and stop any drain wait */
 		stream->partial_drain = false;
 		stream->metadata_set = false;
+		stream->pause_in_draining = false;
 		snd_compr_drain_notify(stream);
 		stream->runtime->total_bytes_available = 0;
 		stream->runtime->total_bytes_transferred = 0;
-- 
2.21.0


