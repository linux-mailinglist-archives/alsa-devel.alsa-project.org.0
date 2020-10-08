Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD472871FC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 11:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264141665;
	Thu,  8 Oct 2020 11:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264141665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602150681;
	bh=KEXDwUNuaS5qQm3GkdmLCtdrpAfhEhKLTDTwwNfAPWQ=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UCuZaVTPVMzlA+O4t3VVPkyGor1JpKoM18qbohgzDs9ZtW66RjDGxYWkkCyG+s3bk
	 SH5bQ/PyBnvf9MPOgJvYhhZjIb/8xQj66Apm0+gjioOxu+5ff17f+ohcxGzXyo5sjG
	 NKaT9Tf1RPjvyuMtgmNBlmd0DKpST0LH4jH0sO24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D879BF80164;
	Thu,  8 Oct 2020 11:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3545F80164; Thu,  8 Oct 2020 11:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64025F8015A
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 11:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64025F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ddlSVBNY"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201008094928epoutp0418bc0f8b1debd4faf68eff3376f3ff83~7_3QQ8GOp2333023330epoutp049
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 09:49:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201008094928epoutp0418bc0f8b1debd4faf68eff3376f3ff83~7_3QQ8GOp2333023330epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602150568;
 bh=I1R/xjytiLU1vjxT9zgYFHL4XsUuc0OxEQCQYgEJySg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ddlSVBNYCZuILS3U1/lQ2qfEkbtCmzIyoj87W1XC4uB377D0t4onxYuUHc2gyUava
 QdZUNXiqQ7D54n5SZaVlYFPvZmpAfDYhEbZHOjv6VHlJY9YAcUKg4sgtYl8GUrc3lq
 3zlfSH8rRwco8h+kQTWc4Apa4RHkLgL7Hty0TiUE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20201008094927epcas2p3aaa6366c0bc4a62f56bd350b9970ec7b~7_3PtzyOd2032320323epcas2p3J;
 Thu,  8 Oct 2020 09:49:27 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.187]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4C6RHn54YZzMqYkW; Thu,  8 Oct
 2020 09:49:25 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.7D.09580.5A0EE7F5; Thu,  8 Oct 2020 18:49:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201008094925epcas2p23ccd0e90c975174eff2c36f7c12b8274~7_3NISn010361203612epcas2p2y;
 Thu,  8 Oct 2020 09:49:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201008094924epsmtrp2325a180475770868496f04c887fa575b~7_3NHbOJV0114401144epsmtrp2c;
 Thu,  8 Oct 2020 09:49:24 +0000 (GMT)
X-AuditID: b6c32a47-133ff7000000256c-d1-5f7ee0a57339
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 34.79.08604.4A0EE7F5; Thu,  8 Oct 2020 18:49:24 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201008094924epsmtip1b68798c5c666737e4181bfcaa7224c1f~7_3M5q0f12452724527epsmtip1Q;
 Thu,  8 Oct 2020 09:49:24 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.intel.com>, "'Vinod
 Koul'" <vkoul@kernel.org>, "'Jaroslav Kysela'" <perex@perex.cz>
In-Reply-To: <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Thu, 8 Oct 2020 18:49:24 +0900
Message-ID: <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIUfoZK8dcLaUFmbqZ4zOMZA20dmgNDBv+0Ad0z+BkB4YqIEwH9HqXQAVh+RiUCk7nWcKiqMGRA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmme7SB3XxBr0flS2uXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyaJzVz+rxa//z5gsjl5czGTRcLeZ3WLD97WMFi83v2GyONI4hcli
 550TzA68Hhs+N7F57Jx1l91j06pONo95JwM99r1dxubRt2UVo8f6LVdZPDafrg7giMqxyUhN
 TEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6WUmhLDGnFCgU
 kFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYGhYoFecmFtcmpeul5yfa2VoYGBkClSZkJPx/tIv
 toJZDhVntjg2MG437WLk5JAQMJHYv+gtSxcjF4eQwA5GiY1XtjNBOJ8YJZasXwnlfGOUWDvv
 I3MXIwdYy9OfehDxvYwS39omsEE4Lxklbqy7zg4yl01AV+LLvTvMIAkRgT5GiSPv57CCOMwC
 DUwS75u3gVVxCjhLfJo3iQ3EFhbwlvh59BMjiM0ioCLRveoWWJxXwFLiZdMlJghbUOLkzCcs
 IDazgLzE9rdzmCG+UJD4+XQZK4gtIhAlcW7eV0aIGhGJ2Z1tYFdICNzgkNj24glUg4vE+Xuf
 WCBsYYlXx7ewQ9hSEp/f7WWDaGhmlHh39g9UYgqjRGe3EIRtLLFl7ikmUGAwC2hKrN+lDwkX
 ZYkjt6Bu45PoOPyXHSLMK9HRBtWoJLHx1D8miLCExLwN7BMYlWYheWwWksdmIXlgFsKqBYws
 qxjFUguKc9NTi40KjJEjexMjODlrue9gnPH2g94hRiYOxkOMEhzMSiK86d418UK8KYmVValF
 +fFFpTmpxYcYTYFBPZFZSjQ5H5gf8kriDU2NzMwMLE0tTM2MLJTEeYutLsQJCaQnlqRmp6YW
 pBbB9DFxcEo1MJlMPn6bTyB651XtK0/ruPdfZZYyez6dM6LX6sCNoEqrduWAjm1e/0tktxsc
 bvny9tv8LO2lqiWFD0p3BOk2hnxdvGT2NLEPzyKC9/rXRE5snTy7+rH63qKMzQGT2eedLzZP
 5hM4JOL7pLv4dUfQ482qS+Z9VEmfqnK6tyGB67L2hL0mNR5LjlpPepr17N8Vg91pxW7fqoUv
 cvFwXGja9WNz0o5s23nuG23U+DyNplS7czjn8i+/u61km9xjA8XcAIfJ2Rbzw4yyGhZMeb35
 6bSXdo1FBbpve+3OFmmsqzvfsDM2aekc6+K2gIQDxuu33av6Nef1b7Z9GWunJSpP4g25NunQ
 zhbZAuH9l/+/lVdiKc5INNRiLipOBABnNBrPVwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWy7bCSnO6SB3XxBm8vmllcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk0Xnrn5Wi1//nzFZHL24mMmi4W4zu8WG72sZLV5ufsNkcaRxCpPF
 zjsnmB14PTZ8bmLz2DnrLrvHplWdbB7zTgZ67Hu7jM2jb8sqRo/1W66yeGw+XR3AEcVlk5Ka
 k1mWWqRvl8CV8f7SL7aCWQ4VZ7Y4NjBuN+1i5OCQEDCRePpTr4uRi0NIYDejxKUZZxi7GDmB
 4hISH+afYYewhSXutxxhhSh6zijR/24mM0iCTUBX4su9O2C2iMAERok7M01BipgFepgkeg4u
 Y4PouMck8a/pKhNIFaeAs8SneZPYQGxhAW+Jn0c/ga1jEVCR6F51CyzOK2Ap8bLpEhOELShx
 cuYTFhCbWUBbovdhKyOELS+x/e0cZojzFCR+Pl3GCnFFlMS5eV+hakQkZne2MU9gFJ6FZNQs
 JKNmIRk1C0nLAkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGqpbmDcfuqD3qH
 GJk4GA8xSnAwK4nwpnvXxAvxpiRWVqUW5ccXleakFh9ilOZgURLnvVG4ME5IID2xJDU7NbUg
 tQgmy8TBKdXAxLTeqvTq05uPF3+xzWu8zRtcuXhZ6lfW+SFr7Dgj1s1UkrtwtXDX7heO/m+7
 F9yYKvtk5vTQYt2ZU74n5W7ed6738x4OG+1arlr7+wsv/JPMT5B+5vPD6mmyz35+3ls+jXtq
 8hi6Kw/fjqjbERhd9ORO+Ip4GdZpl45P+1nq/a1P23LFno3yu755SciUKoQHfp7JbVHFMGvx
 9ovq3is4RBiOvFRVvz7hu0bH379mO1dt4VaKz0/0ZXuy4D07x/wlE5zjj+Tos/PoHtq0W9Ry
 l1bms+SF3Rd6zftd5iopuW7f0Pz4dFWT28/L9y6WJnmEb4/QCo9+xpbnco97T28p7/SsQ3Fc
 hzZ4LIi+kvK6S4mlOCPRUIu5qDgRABsE4CNCAwAA
X-CMS-MailID: 20201008094925epcas2p23ccd0e90c975174eff2c36f7c12b8274
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com> <s5heemlklo0.wl-tiwai@suse.de>
 <20201001102938.GU2968@vkoul-mobl>
 <2bf52360-bd11-b4cd-b255-8a5610b4aa5f@linux.intel.com>
 <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>, lgirdwood@gmail.com, tiwai@suse.com, kimty@samsung.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com,
 s47.kang@samsung.com
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

On 10/06/20 11:57 PM, Pierre-Louis Bossart wrote:
>> The SM in kernel might be bit more convoluted so was wondering if we can
>> handle this in userland. The changelog for this patch says that for
>> test case was sending whole file, surely that is not an optimal approach.
>
>It's rather common to have to deal with very small files, even with PCM, 
>e.g. for notifications. It's actually a classic test case that exposes 
>design issues in drivers, where e.g. the last part of the notification 
>is not played.
>
>> Should we allow folks to send whole file to kernel and then issue
>> partial drain?
>
>I don't think there should be a conceptual limitation here. If the 
>userspace knows that the last part of the file is smaller than a 
>fragment it should be able to issue a drain (or partial drain if it's a 
>gapless solution).
>
>However now that I think of it, I am not sure what happens if the file 
>is smaller than a fragment. That may very well be a limitation in the 
>design.
>
Thanks for the comments.

Actually, problem can be occurred with big file also.
Application usually requests draining after sending last frame.
If user clicks pause button after draining, pause will be failed
and the file just be played until end.
If application stop and start playback for this case, 
start of last frame will be heard again because stop sets state to SETUP,
and write is needed to set the state to PREPARED for start.
If bitrate of the file is low, time stamp will be reversed and be heard weird.
I also hope this problem can be handled in userspace easily but I couldn't find a way for now.

I think that this is the time that I should share fixed patch following the comments to help the discussion.
Following opinions are added to the patch.
1. it's be much nicer to have a new state - Takashi
2. We can add this state to asound.h so the user space can be updated. - Jaroslav
3. don't forget to increase the SNDRV_COMPRESS_VERSION - Jaroslav

I'm bit wondering whether it is good to increase SNDRV_COMPRESS_VERSION
with a change in asound.h not in compress_offload.h.
Should I increase SNDRV_PCM_VERSION also?

And what happened if I request back-porting a patch which changes VERSION to stables?

Below is the patch just to help discussion.
I'll resend the fixed patch after this discussion is completed.

With a stream with low bitrate, user can't pause or resume the stream
near the end of the stream because current ALSA doesn't allow it.
If the stream has very low bitrate enough to store whole stream into
the buffer, user can't do anything except stop the stream and then
restart it from the first.
If pause, resume are allowed during draining, user experience can be
enhanced.

The version is increased due to new behavior.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 include/uapi/sound/asound.h           |  5 +--
 include/uapi/sound/compress_offload.h |  2 +-
 sound/core/compress_offload.c         | 47 ++++++++++++++++++++++-----
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..499b364974ec 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -315,8 +315,9 @@ typedef int __bitwise snd_pcm_state_t;
 #define	SNDRV_PCM_STATE_XRUN		((__force snd_pcm_state_t) 4) /* stream reached an xrun */
 #define	SNDRV_PCM_STATE_DRAINING	((__force snd_pcm_state_t) 5) /* stream is draining */
 #define	SNDRV_PCM_STATE_PAUSED		((__force snd_pcm_state_t) 6) /* stream is paused */
-#define	SNDRV_PCM_STATE_SUSPENDED	((__force snd_pcm_state_t) 7) /* hardware is suspended */
-#define	SNDRV_PCM_STATE_DISCONNECTED	((__force snd_pcm_state_t) 8) /* hardware is disconnected */
+#define	SNDRV_PCM_STATE_DRAINING_PAUSED	((__force snd_pcm_state_t) 7) /* stream is paused during draining*/
+#define	SNDRV_PCM_STATE_SUSPENDED	((__force snd_pcm_state_t) 8) /* hardware is suspended */
+#define	SNDRV_PCM_STATE_DISCONNECTED	((__force snd_pcm_state_t) 9) /* hardware is disconnected */
 #define	SNDRV_PCM_STATE_LAST		SNDRV_PCM_STATE_DISCONNECTED
 
 enum {
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 7184265c0b0d..46fdf50d5c00 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -31,7 +31,7 @@
 #include <sound/compress_params.h>
 
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 1)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
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
-- 
2.21.0

