Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AFE27AC3F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 12:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FCE179A;
	Mon, 28 Sep 2020 12:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FCE179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601290328;
	bh=PYaI+C6KN3PSw6o8+CBOO6HEbeVO/RSruhuzv9DcDGQ=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PY6IUDhTG7I3+6FFki1+3pIS/h8LzJ+O17c7EMHJBe8yZSfI1eWKFt9xYNs7LWZ25
	 81jlKDVhCdRPXVuEXOvwt8gqMALDji+9oAJS1MA0q8zhoJ5rj3o9AneLmLryWFe0OO
	 sYKucN8C3o4c36GFwo4Ddnole6cyrU7BdS1tP1h4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D052BF80228;
	Mon, 28 Sep 2020 12:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C156F801F9; Mon, 28 Sep 2020 12:50:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92F9DF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 12:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F9DF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="SA9+/1SA"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200928105012epoutp034a274cef6d651d08fc24274b33fee3c6~47PbOSKze2273522735epoutp03j
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 10:50:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200928105012epoutp034a274cef6d651d08fc24274b33fee3c6~47PbOSKze2273522735epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601290212;
 bh=pL7y7hDPW0gWvqf8oFpOY3hPMaHya5HwD4PEMMMAYtE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SA9+/1SAY796h/XbAM41+e1J1JaAgXlNhJrCggBVzdAaHcwPeyS51dUgKOXiGDxhw
 bYMD41x3vsWkjvhuAPooo54o9TFpw8sjyPoRpktrmV9d/toTWw20fE3mS7y8vZnttk
 q2YoOIAcLi0ASnKgm0QgiF2+Ybx0e/NmQcMhq+rs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200928105011epcas2p4d5cf0dac5f98b0a62142f14038db5688~47Pah6MUm0963709637epcas2p4B;
 Mon, 28 Sep 2020 10:50:11 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.181]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4C0K6V3CBSzMqYkY; Mon, 28 Sep
 2020 10:50:10 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.71.09908.2EFB17F5; Mon, 28 Sep 2020 19:50:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3~47PY9R3WA3125831258epcas2p40;
 Mon, 28 Sep 2020 10:50:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200928105009epsmtrp2322e005eb22a53d723b269dd3a582aa0~47PY8lVKH0769907699epsmtrp2k;
 Mon, 28 Sep 2020 10:50:09 +0000 (GMT)
X-AuditID: b6c32a48-139ff700000026b4-01-5f71bfe29103
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 34.4D.08745.1EFB17F5; Mon, 28 Sep 2020 19:50:09 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200928105009epsmtip2f73bd41866a551274aacbb824b822602~47PYwXDbN2038020380epsmtip2k;
 Mon, 28 Sep 2020 10:50:09 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <vkoul@kernel.org>
Subject: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Mon, 28 Sep 2020 19:50:09 +0900
Message-ID: <000c01d69585$228db6b0$67a92410$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdaVhPcmYcCcKY7pQ7CSq2KfSvwpgQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmqe6j/YXxBr9vSVhcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk8XRi4uZLBruNrNbbPi+ltHiSOMUJoudd04wO3B5bPjcxOaxc9Zd
 do9NqzrZPPq2rGL0WL/lKksAa1SOTUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmS
 Ql5ibqqtkotPgK5bZg7QWUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAkPDAr3i
 xNzi0rx0veT8XCtDAwMjU6DKhJyMdetXsxS8EaxoffeKsYHxB18XIyeHhICJRE/7SsYuRi4O
 IYEdjBJPvk+Acj4xSuw+uo4JwvnMKLFu2Wl2mJb/c04wQyR2MUo8fLQOynnJKDH/YgsLSBWb
 gK7El3t3mEFsEQExiX/vHoLNZRa4xyjx6Nd9sISwgLvEjQcbGUFsFgFViTf/TjGB2LwClhLP
 zqxnhbAFJU7OfAI2lFlAXmL72znMEGcoSPx8uowVYoGexJljPewQNSISszvbwC6SEJjKIbFl
 aScjRIOLxO0Xm9kgbGGJV8e3QP0jJfH53V42iIZmRol3Z/9AJaYwSnR2C0HYxhJb5oJcxwG0
 QVNi/S59EFNCQFniyC2o2/gkOg7/ZYcI80p0tEE1KklsPPWPCSIsITFvA9RsD4m+z1OYJzAq
 zkLy5CwkT85C8swshLULGFlWMYqlFhTnpqcWGxWYIMf2JkZwmtXy2ME4++0HvUOMTByMhxgl
 OJiVRHh9cwrihXhTEiurUovy44tKc1KLDzGaAoN9IrOUaHI+MNHnlcQbmhqZmRlYmlqYmhlZ
 KInzvrO6ECckkJ5YkpqdmlqQWgTTx8TBKdXAxL5J5M2jqf9swpb+dotmePd7WlRTSs6pW8Y8
 LNPm6Uw+tzu1U7j5ypm1D3oesujEs+87XCmhKL4h6NQST4Yptiuub0y8E/x26sHZFvyz0rd2
 ZMuK2EzZ/19zmvRDx4Cv8kHSjQwbZZj4jhQWf33G5fTh0Kd/Sm+mcDRtkpWUjG7aVi28fL32
 wjrNOWfPbXCcI3X1+6P7Gy2cJ03KVmatbsg6N+9DQs2xr7NatoicFp2gu3zSVhm7Nx77P1S+
 CT75xXH7K43nWVblXbtfb2P0//Sb7YP0wQYN6SN72vl+5m1s7rHXOfn7rR7XSatHJz+EZXR2
 9Bk86X79zDLI8spu9exikelz71lsvPzbSXyVp7QSS3FGoqEWc1FxIgDKWnk+PAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSvO7D/YXxBsvm6llcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk8XRi4uZLBruNrNbbPi+ltHiSOMUJoudd04wO3B5bPjcxOaxc9Zd
 do9NqzrZPPq2rGL0WL/lKksAaxSXTUpqTmZZapG+XQJXxrr1q1kK3ghWtL57xdjA+IOvi5GT
 Q0LAROL/nBPMXYxcHEICOxglrjzaxAKRkJD4MP8MO4QtLHG/5QgrRNFzRomJO+cwgyTYBHQl
 vty7A2aLCIhJ/Hv3kBGkiFngBaPE/dZmsISwgLvEjQcbGUFsFgFViTf/TjGB2LwClhLPzqxn
 hbAFJU7OfAK2mVlAW6L3YSsjhC0vsf0txDIJAQWJn0+XsUIs05M4c6yHHaJGRGJ2ZxvzBEbB
 WUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcQVpaOxj3
 rPqgd4iRiYPxEKMEB7OSCK9vTkG8EG9KYmVValF+fFFpTmrxIUZpDhYlcd6vsxbGCQmkJ5ak
 ZqemFqQWwWSZODilGpiMLKXel/h5M7a83LCJq09u8mWtK4Kb7oe+Y5uz7Jf1pPsFOhxeovNv
 zJ0o/1q4JvXqGinHw0lL6i029F9eduvQ33zVvTafT8m0T3jCeubM15cduw26JsT4HEyZJvpP
 s0PG8nyHQOa936fmvZxYdGXF7sKF+1YEXYyQEG3yuhqvOSc+N4Z5cc+V+g85C9eKdWSonNOV
 CL3+nrfIcP/kNgXPqZ7flnSnM9u/jWuUtVfcIPl/h/lpE97+eofKxaV7P82b1FYn0KNxJD38
 3e9Ax7PG4c0fDpkEzOwQs3jp7sQpM0finld8iHEIk+wTxoerFHS19k9+l/+3rtPTZtefTdkP
 /igwG1mGnJ6XV+ZpqqnEUpyRaKjFXFScCAAb8HNFDwMAAA==
X-CMS-MailID: 20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3
References: <CGME20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com, s47.kang@samsung.com
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
restart it from the first.
If pause and resume is allowed during draining, user experience can be
enhanced.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/core/compress_offload.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 0e53f6f31916..90b437f302a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -708,11 +708,20 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
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
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+	}
 	return retval;
 }
 
@@ -720,11 +729,20 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
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
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+	}
 	return retval;
 }
 

base-commit: a1b8638ba1320e6684aa98233c15255eb803fac7
-- 
2.21.0


