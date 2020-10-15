Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7687528F058
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 12:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F5C176E;
	Thu, 15 Oct 2020 12:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F5C176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602758964;
	bh=fMRn7JAfcSKD9/IOeUGjYo7SnFIFoZmS71U/kg5NEC4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBzz/H3Ab8HFdnahoR3CoZxLSkYl/7SqSFkS4Slu4tK8izZTR/FRFM84OS5NYNB2z
	 NEJR5jTE0fCEw+iBNEaeax0483RDhukS/cOBvlmSvIcj6iiFmMAmUlepIUDKsjFrce
	 oDU9K68yByfNHf2ZfwCuJaoKiW3szmIIR8oPcens=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940E3F800F6;
	Thu, 15 Oct 2020 12:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ECB6F801A3; Thu, 15 Oct 2020 12:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A011F8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 12:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A011F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="LuOAH0VI"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201015104724epoutp01a30379970cedc2576abb0f2f8e845528~_JK1g0wkJ0356803568epoutp01H
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 10:47:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201015104724epoutp01a30379970cedc2576abb0f2f8e845528~_JK1g0wkJ0356803568epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602758844;
 bh=laRHhmIfTo2kTlVpcTKAhVRlrOG4tMJKgJxh5j9RVqI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=LuOAH0VIp49I+813hRA22s5gIqlBBBe3apV+oeClFz6AQg2LECVDKO3rB3sCUCEhb
 oIpMn7YoYgHJAyx2uHnZey/u7lHp0WtsnslymHGctgHsv97DWqhVgo4y+BCvBE3FjH
 v7v3aJLBPQcvjOrb13t626+UjOdFLIe2phNcBxO4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20201015104723epcas2p1249e73c2726f866c57936f11a27c0fde~_JK0yVulM3175731757epcas2p1a;
 Thu, 15 Oct 2020 10:47:23 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.185]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CBmFP2Cs0zMqYkZ; Thu, 15 Oct
 2020 10:47:21 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.54.09588.9B8288F5; Thu, 15 Oct 2020 19:47:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201015104720epcas2p1caef757107cbfbeea9fd40294f05dc15~_JKxm5gPQ3175731757epcas2p1Z;
 Thu, 15 Oct 2020 10:47:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201015104720epsmtrp2268a7aba1e39223fc345320409b3a743~_JKxmHx1E2704527045epsmtrp2X;
 Thu, 15 Oct 2020 10:47:20 +0000 (GMT)
X-AuditID: b6c32a45-36bff70000002574-ae-5f8828b9b5d9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9A.9F.08604.8B8288F5; Thu, 15 Oct 2020 19:47:20 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201015104719epsmtip116aa8b9b14ea9ac3816faff58710c274~_JKxQt0Ia2105021050epsmtip1g;
 Thu, 15 Oct 2020 10:47:19 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
In-Reply-To: <s5ha6wrpk1t.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Thu, 15 Oct 2020 19:47:19 +0900
Message-ID: <000001d6a2e0$8e6f4840$ab4dd8c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFYfkYlW14yIW5U9SNXNoYFWW92AgKTudZwAbYfV/gDH6isoAKHE7a9AdRQf28BYefddgKT6KNVAgBXeBkClq6mqAEeV+jFAljo6UsBqsh+KQIAfJ5tAba34gUBunORD6mdeVMg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwbZRz2vTvag6RwMmSvqLE7MbCaQtvReix0Y8qW8vEHZv6hS7SecGmR
 0jY96sc+XFljaSGB4dh0iLjpXAKTgYCsEOiWAsGCdYDMKTKMFuZAPpayMUdA7HFd5L/n9/ye
 J/c87/sejsb2CxLwImMpYzHSBlIQhXX27VRJu5KdWllNuYgaH/Ui1KedlRhVNnVSQF260YFQ
 K+NOhHJ1V0dQqxu3EWpg9CuEst2yC6nWB82Amm2fR6j+slqE6pr8Hs0UaVqXTwg0XXW3hJq2
 JpdA0+B7ReNZuCjQVHU0AU1Lxw1M0z58JB8/ZMjQM3QhYxEzxgJTYZFRpyZzD2pf1ipVMrlU
 nk69SIqNdAmjJrPy8qUHigyhyKT4XdpgDVH5NMuSqXsyLCZrKSPWm9hSNcmYCw1mudycwtIl
 rNWoSykwleyWy2QKZUj5lkH/tTeAme+lv/9TjxOxgUupFSASh0QaDPaugAoQhccSbgCvLc2E
 hyCAnb/3YvywAuDV1Z+RR5bhqfEIftEL4OJ314T8MAvglaqlCE4lIKTw3tQkWgFwPI7IgS0L
 yZwGJfoR2FbZiHKaSOIFWDO7Dji8jciFDweCmxgjnocn/PUY5xUR6bCrkeJoEfE49J2dxjiM
 Es/CKwv1KB9IDB/OXNwMFEecAfB6hQ/wojj4mcuBcgtITOLwtvt62JEFB31LQh5vg3ODHWGc
 AJcXewW8wR6q5l8LL2oBdFXG8ngX7Ph8COHSocRO2NKdykFIPAf7J8LhoqGzb13I0yLodISN
 JPx26F+EpyFsaBWeBGTdlmZ1W5rVbSlQ9/+nzgGsCcQzZrZEx7AKs3zrZbeBzecs2e8Gpxbu
 pngBggMvgDhKxonmnnJoY0WF9AeHGYtJa7EaGNYLlKGjrkETnigwhf4HY6lWrlSoVLJ0JaVU
 KShyu6isOmQidHQpU8wwZsbyyIfgkQk25CXHKlG/bk+kT2enG6bW9v4maZ74Ycx+/o7+j2Ht
 7rvznrSRqXW9NvIZf+ZfaXPFy+2e7mVb9bFu9ojUT2w0vNFywXX1/OVp9cDHjGRx5vWc5PuH
 Yox/35zx9Rx7+kly78GhnPhzqD84PTIWOBNTFTEz9F603t65phvVzhvI+zvKHdPHm/ebC5rn
 PtyjeMxGbw84+xyJLu8vxxXBo0tHM96h2ZHRRvOXI+7a1xLVTUlWS64jq7g8KfHBrxvGwUAg
 2X1B5VO/OuvxHHbn/bnyhX0XeVn60UBe1NmJpGVJZlVmQu3Y9Dfx+36805M9+XZMcfZNqi36
 zVMHPsGT9uXs+CcKJzFWT8slqIWl/wNt4o24VwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsWy7bCSnO4OjY54g8YbrBZXLh5ispixrZvF
 ovHeBDaL1Ve3MFl8u9LBZNG5q5/V4tf/Z0wWRy8uZrJouNvMbrHh+1pGi5eb3zBZHGmcwmSx
 884JZgdejw2fm9g8ds66y+6xaVUnm8e8k4Ee+94uY/Po27KK0WP9lqssHptPVwdwRHHZpKTm
 ZJalFunbJXBlLD30mKXgi2XF5T0dTA2Mq/W7GDk5JARMJE7fu8LaxcjFISSwm1Fi3qNbzBAJ
 CYkP88+wQ9jCEvdbjrCC2EICzxklTj6pArHZBHQlvty7A1YvIuAjceTkfbBBzAIXmCQ+7NvB
 DjF1JavE+YV3wSZxCmhLTHz5lxHEFhbwlvh59BOYzSKgKtF0dg5LFyMHB6+ApcTOlRYgYV4B
 QYmTM5+AhZkF9CTaNoJVMwvIS2x/OwfqTgWJn0+Xge0VEZjGKHG+6yRUkYjE7M425gmMwrOQ
 jJqFMGoWklGzkHQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHKVamjsYt6/6
 oHeIkYmD8RCjBAezkgjvK+m2eCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8NwoXxgkJpCeWpGan
 phakFsFkmTg4pRqYFNP+vN1Ro373Izv3Et/molft5cVW280v7FDyulOarWoieqmtU4H1k+Rx
 FS7Jjhf6eT85Mq2+fvjhdIBxzcbg8x4a02KFin1OdtYpnep1rpp+jTHtn9VpuSVVc46m9dS9
 61/BH7ijWORya868eWnaUQG2nJpPa6+XbXn95/GMxE0RhZe3PnDoCnzL1HnPlMvts/Miru7I
 b6wGz5baHTp67v6JfM+t7x1OTEv8fUvZacHt+1LymxI3h00xc9aZ3M1/4PtWHv5LTGs5SxYb
 25Vnc1y5V21tI3TkXO6Z9ztzE5JkGWdaat96apJT4Md5cvU8D27tJVm7+OdYP7mX07ZwbUfM
 8vv3M1hPHp+164mDEktxRqKhFnNRcSIA0tl5gEEDAAA=
X-CMS-MailID: 20201015104720epcas2p1caef757107cbfbeea9fd40294f05dc15
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
 <s5ha6wrpk1t.wl-tiwai@suse.de>
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

On 10/08/20 06:49 PM, Takashi Iwai wrote:
>On Mon, 12 Oct 2020 16:46:56 +0200,
>Jaroslav Kysela wrote:
>> 
>> Dne 12. 10. 20 v 16:21 Takashi Iwai napsal(a):
>> 
>> > But, I doubt whether we really need to care about that; as mentioned
>> > earlier, there is little to change from the user-space side.  It just
>> > pause or resume.  The only difference is the resume target, and
>> > honestly speaking, there is no interest in it from user-space side.
>> > And, the rest is about the kernel internal, and this can be really
>> > done in the way of the original patch.  The flow is quite simple and
>> > understandable...
>> 
>> The core compress code already uses the state mechanism (although internally).
>> 
>> Also, it's really unclear if all drivers were checked, if the pause triggers
>> can be called from the drain state (I know it's another point, but the drivers
>> should probably offer a flag that they support this). And why to call the
>> pause release callback when there's no pause (drain + release ioctl instead
>> drain + pause + release ioctl)? It's a clear midlevel code fault. This
>> protection should be there not in the hw drivers.
>> 
>> I refer the original patch:
>>   https://lore.kernel.org/alsa-devel/000c01d69585$228db6b0$67a92410$@samsung.com/
>
>Point taken, and yes, this should be handled conditionally only for
>the drivers that do support such a mode.
>
Thanks for all your advices.
I updated the patch from original as all your comments.

1. API 'snd_compr_use_pause_in_draining' is added to allow pause during draining
   only when the hw driver allow it explicitly.
2. Flag 'pause_in_draining' is added to the struct snd_compr_stream to check whether
   the stream has been paused during draining when snd_compr_resume is called.
   I need this change in the older stable kernels. 
   However, changing states is too complicated and even dangerous for not only kernel
   but also userspace as this discussion.
   So, I'd like to suggest to use this simple flag first, and then apply more patch
   which fixes this patch to use states for compress after SNDRV_COMPRESS_STATE_*
   is applied to the ALSA mainline by Vinod.

Following is the fixed patch. 
If there is more points should be fixed or discussed, just let me know.


With a stream with low bitrate, user can't pause or resume the stream
near the end of the stream because current ALSA doesn't allow it.
If the stream has very low bitrate enough to store whole stream into
the buffer, user can't do anything except stop the stream and then
restart it from the first.
If pause, resume are allowed during draining, user experience can be
enhanced.

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

base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
-- 
2.21.0
>
>Takashi
>

