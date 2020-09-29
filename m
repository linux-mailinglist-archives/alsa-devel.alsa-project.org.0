Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B163C27BA87
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 03:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D391861;
	Tue, 29 Sep 2020 03:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D391861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601344423;
	bh=MVYkr48+yZeIaQDOhkV9ZKbLop4GUOoeXGay/VBs93w=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjFiSSq5QasiC6jAp6kcTu2EMtX5JZGv1ruqcm/AoSoNy5QbBMPzj/DmyzeQhHGah
	 JejMhCPygwzeJ0OwUNg4a0jvw8Ldq9mQU1YcHGdjbHsVkTSL6vA9RVhmhYdIuezRWD
	 p2/3Ob7fHt1RVpA8YoSjYqsHw43f9gZILVKQMJv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A22F8020C;
	Tue, 29 Sep 2020 03:52:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF48F801F5; Tue, 29 Sep 2020 03:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6363F80115
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 03:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6363F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Eh4xOR6f"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200929015144epoutp0305b6b32298e326126da6a2a1b35c105b~5HikzpDdx1944319443epoutp03s
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 01:51:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200929015144epoutp0305b6b32298e326126da6a2a1b35c105b~5HikzpDdx1944319443epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601344304;
 bh=cpkM00fl19imP9hyiItMC5wLdNDgxqocBlHbF67dhu8=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Eh4xOR6fVkAquxYXQqMLk80l8rCmxEExFtnjEIzhI26JfVi7uw5D1OJMEp7SJ6Yl5
 XZnMYG1HYEgK5MtcCpX+uVMg3sXPuxRhLOAV1a9O8sQYzpFZP4rSq/YKN72lpCaP/w
 Ggrh7PAxgZ4GMEZ2FM9iBnbBr+iAUa81mXKo1KtQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200929015141epcas2p1201a972848ffe3f74589f7ec569bef72~5HiiI9j4R0443504435epcas2p1G;
 Tue, 29 Sep 2020 01:51:41 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.191]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4C0j6g3HKHzMqYkk; Tue, 29 Sep
 2020 01:51:39 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.06.09937.A23927F5; Tue, 29 Sep 2020 10:51:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200929015135epcas2p34f36cd53286b841acb4f0c8556fe051f~5Hicf7p-m1596315963epcas2p39;
 Tue, 29 Sep 2020 01:51:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200929015135epsmtrp2da6a2923ee31a22d8c4b3c868725704f~5HicfDtJc2330523305epsmtrp2e;
 Tue, 29 Sep 2020 01:51:35 +0000 (GMT)
X-AuditID: b6c32a46-737ff700000026d1-3a-5f72932ab134
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.5E.08604.723927F5; Tue, 29 Sep 2020 10:51:35 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200929015135epsmtip2871ae1ae750238668928f4b0509c1682~5HicR-9LT1305813058epsmtip2s;
 Tue, 29 Sep 2020 01:51:35 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.intel.com>,
 "'Jaroslav Kysela'" <perex@perex.cz>, <vkoul@kernel.org>
In-Reply-To: <eaa35431-01f4-f858-0673-cc3b4ddf1c5a@linux.intel.com>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Tue, 29 Sep 2020 10:51:35 +0900
Message-ID: <000f01d69603$10573fb0$3105bf10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHSbLpiN3DehOWkovAyciKGRIYoQL/M4aVAkKT4wQB6FhIVahkH18g
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmma7W5KJ4g9dL1S2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFkcapzBZ7LxzgtmB
 x2PD5yY2j52z7rJ7bFrVyeYx72Sgx763y9g8+rasYvRYv+UqSwB7VI5NRmpiSmqRQmpecn5K
 Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtClSgpliTmlQKGAxOJiJX07m6L8
 0pJUhYz84hJbpdSClJwCQ8MCveLE3OLSvHS95PxcK0MDAyNToMqEnIwJsw6yFZwzqGh8v56l
 gfGQRhcjJ4eEgInE1pWr2LoYuTiEBHYwSnydM58RwvnEKNH18jo7hPONUeLKrxuMMC3/G5qY
 IBJ7GSWWnpkM1fKSUWL6oRYWkCo2AV2JL/fuMIPYIgL1Er2PJzCDFDEL3GOUmNj/DmwUp4Cz
 xIc309hBbGEBb4mfRz+BxVkEVCW+/3/HBGLzClhK9C2ayQJhC0qcnPkEzGYWkJfY/nYOM8RJ
 ChI/ny5jhVjmJrFy6zeoGhGJ2Z1tYIslBM5wSLx5fxBoAQeQ4yLR+DEColdY4tXxLewQtpTE
 53d72SDqmxkl3p39A5WYwijR2S0EYRtLbJl7iglkDrOApsT6XfoQI5UljtyCWssn0XH4LztE
 mFeiow2qUUli46l/TBBhCYl5G9gnMCrNQvLXLCR/zUJy/yyEVQsYWVYxiqUWFOempxYbFRgh
 R/YmRnAq1nLbwTjl7Qe9Q4xMHIyHGCU4mJVEeH1zCuKFeFMSK6tSi/Lji0pzUosPMZoCQ3oi
 s5Rocj4wG+SVxBuaGpmZGViaWpiaGVkoifPWK16IExJITyxJzU5NLUgtgulj4uCUamA6tDzW
 y1f+nfzh8pAPMVZr30RNnatU89j6+Fv/9WdmlzUsnhiomqUfV3dnZ1tL0k7N5VE8wm9ffns/
 /XboGtuY+HmN8pI5N22KYz30q7i29O1w9U6Jzp2XoPg56TgTT6W0Dou326xzDzMfHL5QN3Fr
 +XV59fID/htST3pOKBQsecR+2uj0X40nj6sMmyqVRMQeqWz9ldb7eEosw52Ccra7kn4SD2Yq
 fLISKolZZKoTMUf7q+zubf93m+jUzF+Yn3yisDZ22WPWk/oVMX84mm6bHTKy8Qnv/VPiyGsU
 p6f7+duDcx+OR8ms+2RQHf3jk1hhmu38WnHzyRMzfnOZn3oU6dyj037XMVen7XBioBJLcUai
 oRZzUXEiAFJROhFOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsWy7bCSvK765KJ4g88n9C2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFkcapzBZ7LxzgtmB
 x2PD5yY2j52z7rJ7bFrVyeYx72Sgx763y9g8+rasYvRYv+UqSwB7FJdNSmpOZllqkb5dAlfG
 hFkH2QrOGVQ0vl/P0sB4SKOLkZNDQsBE4n9DE1MXIxeHkMBuRokzHROYIRISEh/mn2GHsIUl
 7rccYYUoes4ocXvzC7AEm4CuxJd7d5hBEiICjYwS69e+ZQdxmAVeMEpcWnqOGaLlE6PE9q0r
 wFo4BZwlPryZBmYLC3hL/Dz6iRHEZhFQlfj+/x0TiM0rYCnRt2gmC4QtKHFy5hMwm1lAW6L3
 YSsjhC0vsf3tHKhbFSR+Pl3GCmKLCLhJrNz6DapeRGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxg
 ZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcm1qaOxi3r/qgd4iRiYPxEKMEB7OS
 CK9vTkG8EG9KYmVValF+fFFpTmrxIUZpDhYlcd4bhQvjhATSE0tSs1NTC1KLYLJMHJxSDUyu
 OocsIhf9NtdmvnRgD5spe8GtP24HLP5wsW24+3uR0iTLj7P9y5/ZPlQ9stT94kH1w0uKb3rk
 L/ygZHj18onL69W3+ls6ldScO7Eqb9frvTUByXF9giFfo677H75X9uxtlO9MtSedF772HmJP
 M62unrkor+BAtWNjIsvdyAvcK4VXakkHxq6a3X9g2wcLwdN79zmdiT/xN93zcb3u8+csbWeu
 KlaYH1GMW7Lx3+xv+7447gvkdjgSf+r3x1NcedGhZtcUSjrW22eHizVpv7vitH3z3W2xcSWm
 jdfrlv7XDtm8OnZizk6rPbMPdJs0Lj8fsERyRbXJ/herpvQaKe9wfRwrwGQibOOy+odyRXGV
 EktxRqKhFnNRcSIAvxmrBzwDAAA=
X-CMS-MailID: 20200929015135epcas2p34f36cd53286b841acb4f0c8556fe051f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3
References: <CGME20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3@epcas2p4.samsung.com>
 <000c01d69585$228db6b0$67a92410$@samsung.com>
 <7ba714ce-8b33-1b64-7503-6b155bf43909@perex.cz>
 <eaa35431-01f4-f858-0673-cc3b4ddf1c5a@linux.intel.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com, tkjung@samsung.com,
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

On 9/28/20 11:35 PM, Pierre-Louis Bossart wrote:
>On 9/28/20 6:13 AM, Jaroslav Kysela wrote:
>> Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
>>> With a stream with low bitrate, user can't pause or resume the stream
>>> near the end of the stream because current ALSA doesn't allow it.
>>> If the stream has very low bitrate enough to store whole stream into
>>> the buffer, user can't do anything except stop the stream and then
>>> restart it from the first.
>>> If pause and resume is allowed during draining, user experience can be
>>> enhanced.
>> 
>> It seems that we need a new state to handle the pause + drain condition for
>> this case.
>> 
>> With this proposed change, the pause state in drain is invisible.
>
>Indeed it's be much nicer to have a new state, e..g 
>SNDRV_PCM_STATE_DRAINING_PAUSED.
Ok. I will add the new state.
>
>One concern is that states are defined in uapi/sound/asoc.h, so wouldn't 
>this have impacts on userspace as well? We'd change the value of 
>SNDRV_PCM_STATE_LAST.
>
I also agree that adding new state and increase LAST value in the header of uapi
could be dangerous. So, I added it to comress_offload.h for now.
It could be merged into snd_pcm_state_t in someday with big changes.
Could you review the fixed patch below?


With a stream with low bitrate, user can't pause or resume the stream
near the end of the stream because current ALSA doesn't allow it.
If the stream has very low bitrate enough to store whole stream into
the buffer, user can't do anything except stop the stream and then
restart it from first.
If pause, resume are allowed during draining, user experience can be
enhanced.

New state for pause during draining is defined in compress_offload.h for
now. If PCM_STATEs in uapi/sound/asound.h is changed, pcm libraries and
userspace application will be affected.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 include/uapi/sound/compress_offload.h |  3 ++
 sound/core/compress_offload.c         | 47 ++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 7184265c0b0d..f30b9851d1d7 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -189,4 +189,7 @@ struct snd_compr_metadata {
 #define SND_COMPR_TRIGGER_DRAIN 7 /*FIXME move this to pcm.h */
 #define SND_COMPR_TRIGGER_NEXT_TRACK 8
 #define SND_COMPR_TRIGGER_PARTIAL_DRAIN 9
+
+/* FIXME move this to asound.h */
+#define	SNDRV_PCM_STATE_DRAINING_PAUSED	(SNDRV_PCM_STATE_LAST + 1)
 #endif
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 0e53f6f31916..58fbe0d99431 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -151,6 +151,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_DRAINING:
 	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING_PAUSED:
 		data->stream.ops->trigger(&data->stream, SNDRV_PCM_TRIGGER_STOP);
 		break;
 	default:
@@ -431,6 +432,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING_PAUSED:
 		if (avail >= stream->runtime->fragment_size)
 			retval = snd_compr_get_poll(stream);
 		break;
@@ -708,11 +710,23 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
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
+		if (!retval)
+			stream->runtime->state =
+				SNDRV_PCM_STATE_DRAINING_PAUSED;
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+	}
 	return retval;
 }
 
@@ -720,11 +734,22 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
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
+	case SNDRV_PCM_STATE_DRAINING_PAUSED:
+		retval = stream->ops->trigger(stream,
+			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+		if (!retval)
+			stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
+		break;
+	default:
 		return -EPERM;
-	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
-	if (!retval)
-		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+	}
 	return retval;
 }
 
@@ -835,7 +860,9 @@ static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
 	 */
 
 	ret = wait_event_interruptible(stream->runtime->sleep,
-			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING));
+			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING) &&
+			(stream->runtime->state !=
+				SNDRV_PCM_STATE_DRAINING_PAUSED));
 	if (ret == -ERESTARTSYS)
 		pr_debug("wait aborted by a signal\n");
 	else if (ret)
@@ -857,6 +884,7 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING_PAUSED:
 		return -EPERM;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
@@ -909,6 +937,7 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING_PAUSED:
 		return -EPERM;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;

base-commit: a1b8638ba1320e6684aa98233c15255eb803fac7
-- 
2.21.0


