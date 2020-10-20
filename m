Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E04293441
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 07:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EBE1170B;
	Tue, 20 Oct 2020 07:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EBE1170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603171549;
	bh=6mg201c6T1i3wpAtUrMuKZECFXqDNpS3it0GyPY1FS4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGXBJFq2vmhh75+BU5lnLpaaEo0g8t7mvYNZs+ChUlQ84G2hPdm0sSrsZBXbAO1CC
	 rzV4brKn8v3EJDrV4SlSyere8oTqHcs1uhdRbCp48BqOegcpNhbk45QM4r5OwOOcjO
	 8cYy0BRcCtBO1L/2EFAPyGsPFVxW/Q3pe+cSahIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FD9F80216;
	Tue, 20 Oct 2020 07:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5A5DF801F2; Tue, 20 Oct 2020 07:24:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8CC0F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 07:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8CC0F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="pA7YMzF0"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201020052353epoutp01169372e98f7ef414a8974cd4fa0a0b52~-m_y4tRxg2711327113epoutp01w
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 05:23:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201020052353epoutp01169372e98f7ef414a8974cd4fa0a0b52~-m_y4tRxg2711327113epoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603171433;
 bh=stsJtmvhUlpkimjuIihwZJ4Xcr0PZaaaApjJl3P5Abk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=pA7YMzF03LJcY9xaMw6sn6Xanqy8/Wey9jQ5JC+DOuwq30p1uXNc4tCpyHd2SPh6s
 cDVSx9T7Jr2JK2dp2XeUaZetVysiMxYKwTTqPSnwEcmvZL4qzTN+ui7cWY8WGTg0hw
 w245gaClIx51FUjpmEcgQ8x7lnBnwvW7wx+PylSE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20201020052352epcas2p1deb836b4f97a3871d3e8184c2b6bc1be~-m_ybDmnw1466014660epcas2p1w;
 Tue, 20 Oct 2020 05:23:52 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.189]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CFhqp46S3zMqYlh; Tue, 20 Oct
 2020 05:23:50 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 10.BC.09580.5647E8F5; Tue, 20 Oct 2020 14:23:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20201020052349epcas2p42a97c1ddb63560f6fffe1d3c113fdc02~-m_vB9JZ80938509385epcas2p4i;
 Tue, 20 Oct 2020 05:23:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201020052349epsmtrp2c419c6f95006a56aca5e11812841b2fe~-m_vBFnjM0434304343epsmtrp2Z;
 Tue, 20 Oct 2020 05:23:49 +0000 (GMT)
X-AuditID: b6c32a47-133ff7000000256c-b9-5f8e74656677
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D3.36.08745.5647E8F5; Tue, 20 Oct 2020 14:23:49 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201020052348epsmtip2e615c204d4ecedbb9cf05671c66ebe94~-m_uyehdT1321313213epsmtip2N;
 Tue, 20 Oct 2020 05:23:48 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
In-Reply-To: <000001d6a2e0$8e6f4840$ab4dd8c0$@samsung.com>
Subject: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Tue, 20 Oct 2020 14:23:48 +0900
Message-ID: <014601d6a6a1$30ac9310$9205b930$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQFYfkYlW14yIW5U9SNXNoYFWW92AgKTudZwAbYfV/gDH6isoAKHE7a9AdRQf28BYefddgKT6KNVAgBXeBkClq6mqAEeV+jFAljo6UsBqsh+KQIAfJ5tAba34gUBunORDwHIvLbUqZbTUQA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxj23NveXthq7toqJ/yRXGRbNYUWaL0wMGZjo1EyMe6DfST1hl6B
 2a+1hY0tywpkhIKrLLgNquI2EsgQV5COjwqSFLYVEReiFEQpVGHCsuq2EpWiY20vy/j3vM/7
 vOd93vecg6MCNxaPl+jMjFFHa0gsltMzLKYkjNmmkn47JKOuT7gRqrGnjkNV+Oox6tykE6Ee
 XK9BKKvrBJcKrf+GUD9NtCCUZbaKR3U+PA+o5e4/EGqk4iRC9d/yoPv4ys5gJabst8/ylBfa
 rZiyefSQ8lKgFVPanO1A6XBOcpTdYx/n429rsooZWs0YExhdoV5doivKJg8cVr2kkiukMoks
 g9pDJuhoLZNN5uTlS14p0YQtkwlltKY0TOXTJhOZsjfLqC81MwnFepM5m2QMao1BJjMkm2it
 qVRXlFyo12bKpNJUeVh5RFO81CAxjIo/9C/Pcy2gk6wFOA6JdGiboWtBLC4g+gC817oA2OBv
 AG3eqo0gCKCn1o/UgphoxeDVEMImXADWVZxH2WAZwONtX3IjKoyQwBXfLTTSQ0Tsh47A8xEN
 Sowg8NyDEIhoYohMeLxiLnqqkMiF0/NdUZ5DJEFv22KU5xMZ0D83wmXxM3C0aYETwSixA/YG
 TqOsowS4utjKZXkRPGWtjhoSEc0A/thRCVjRNA4XemNYnAPvt93mslgIf//FyWNxPAzeG8Qi
 xZCoCm9j/PFG4iSA1joBi9Og88xlJDIZSoihw5XCLjIRjsxseNsKa4af8FiaD2uqNwpJ2HX5
 H4SlIWzu5NUD0r5pMPumweybhrH/3+obwGkH2xmDSVvEmFINaZuv+gKIPuZduX2gMfBnshsg
 OHADiKOkiF/PtakEfDVd/hFj1KuMpRrG5Aby8Kq/QOO3FerDv0FnVsnkqQqFNENOyRWpFBnH
 35lcoxIQRbSZOcYwBsb4Xx2Cx8RbEMVj11dJa1uZDJ4H5nZPZ/rHL54V4WPflT162sG3XKPj
 9g4VlHc98Vd6em6YQeB9oXPgM8+icIt5x8rBiTj7/UuDDSNXrddCddhyouPzi1M3DjRUvRzU
 vuAX+yR5+z6Jm1oKzg4UnFqdSm+JMdzBC4/Ad7yvCauda+ix7gFB5f4PRg+VzXc4xnIcrhe3
 xyoO5/515dWfpVfudmFHY71ov+dmOvJUyLfWfXT4jPrN8YImq+VR8C3vzXf7d667NFkF+HNC
 /L2HzJ4TjS0z22TiO89+L0izz00qfG0WRJM39cYPivKhg327E8mx9VxPx0pS0/DrWz79dfWu
 +Ovdt1OWeskAyTEV07JdqNFE/wuE2cXoVQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWy7bCSvG5qSV+8wZa/7BZXLh5ispixrZvF
 ovHeBDaL1Ve3MFl8u9LBZNG5q5/V4tf/Z0wWRy8uZrJouNvMbrHh+1pGi5eb3zBZHGmcwmSx
 884JZgdejw2fm9g8ds66y+6xaVUnm8e8k4Ee+94uY/Po27KK0WP9lqssHptPVwdwRHHZpKTm
 ZJalFunbJXBlvJisW3BSs+LhywesDYwblLoYOTkkBEwk9p77xQRiCwnsYJRYvDweIi4h8WH+
 GXYIW1jifssR1i5GLqCa54wSz688ZwVJsAnoSny5d4cZxBYR8JE4cvI+WBGzwAUmiQvnPzND
 dFxnlbg4+yFYB6eAlURP432wdcIC7hI3HmxkBLFZBFQlri1/ChbnFbCUeHj/CCuELShxcuYT
 FhCbWUBbovdhKyOELS+x/e0cZojzFCR+Pl3GChEXkZjd2Qa2WERgHqPE1jVNjBMYhWchmTUL
 yaxZSGbNQtK/gJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcKRqae1g3LPqg94h
 RiYOxkOMEhzMSiK8E1j74oV4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7NbUg
 tQgmy8TBKdXAdPk+u1/avmePDZ0NF0uvvLPI5n1gwPnsulWf1TZf36Pxnms+7wTxshj1xuCG
 C8f+tf0+/ZLlxrd5xt8u8bO2b+uy1eLXP/VIXFB8eX3hFpONhinp9nOV+0qn5EVY+f7yszVe
 MTFMm/GnsNaLY1ZXm7lY3lYnPMs9elv3zr/W81Hn3LueJbruujFDY/aqGYacysJ226Kzee/0
 ntMVzyquNbM6epV9sv3xvDWik5vvP4/vXrBfrVthw9ITk38LprvKcIp2fZobo3S/ce/W5sIi
 f26vv79Vf328HcB+2Krz8bep/kv/XlaefKxO/++GkAa/4lf+fJtqzN0kE5fetrRWWOZxRlIk
 t2T+mjSlOz0nlViKMxINtZiLihMBH/ysfkMDAAA=
X-CMS-MailID: 20201020052349epcas2p42a97c1ddb63560f6fffe1d3c113fdc02
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


