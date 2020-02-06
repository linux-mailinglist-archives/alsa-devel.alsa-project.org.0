Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA997154970
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:42:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C58716BB;
	Thu,  6 Feb 2020 17:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C58716BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007340;
	bh=niIeyV2gna+6DsXDhV3Y1ssQ3xgBDIVw+dyqE98g4LI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETb3cY9/Ts2HaAVODNe0Tovw3JdI6v4ZIvSTx/WKHcrfMvroQNSFCrqJIALt5qRiS
	 Q9jcRGXjtu2u5ayYEvaMBfwR3FIshhVIbN7CRVoRXyAyVS+loXdepdqCozODLZDEKU
	 OnO5pKa+HKm6W1FP58pdfmUa2U/Cf4N9dqtXfFv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2955F80278;
	Thu,  6 Feb 2020 17:39:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756A3F80059; Thu,  6 Feb 2020 17:39:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDEBDF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEBDF80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A0FBAE17
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:39 +0100
Message-Id: <20200206163945.6797-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/8] ALSA: pcm: More helper macros for reducing
	snd_pcm_format_t cast
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

snd_pcm_format_t is a strong-typed integer and requires the explicit
cast with __force if converted or compared with a normal integer
value.  Since most of use cases do iterate over all formats and test /
set the mask, provide a couple of new helper macros that do the
explicit cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h        | 9 +++++++++
 include/sound/pcm_params.h | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f657ff08f317..31a4b300e4c9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1415,6 +1415,15 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 	return 1ULL << (__force int) pcm_format;
 }
 
+/**
+ * pcm_for_each_format - helper to iterate for each format type
+ * @f: the iterator variable in snd_pcm_format_t type
+ */
+#define pcm_for_each_format(f)						\
+	for ((f) = SNDRV_PCM_FORMAT_FIRST;				\
+	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
+	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
+
 /* printk helpers */
 #define pcm_err(pcm, fmt, args...) \
 	dev_err((pcm)->card->dev, fmt, ##args)
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index 661450a2095b..36f94735d23d 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -133,6 +133,13 @@ static inline int snd_mask_test(const struct snd_mask *mask, unsigned int val)
 	return mask->bits[MASK_OFS(val)] & MASK_BIT(val);
 }
 
+/* Most of drivers need only this one */
+static inline int snd_mask_test_format(const struct snd_mask *mask,
+				       snd_pcm_format_t format)
+{
+	return snd_mask_test(mask, (__force unsigned int)format);
+}
+
 static inline int snd_mask_single(const struct snd_mask *mask)
 {
 	int i, c = 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
