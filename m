Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741B2CB5D3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 08:39:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF2717DC;
	Wed,  2 Dec 2020 08:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF2717DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606894795;
	bh=GMBiT+GjqHPjyeUWzN+boe7ZyQVnteQbaJCJGWDgdrI=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nV/zp0g9RcC3aUCS4W44LediyqK2DvoaR4owWhGlGilQvJhhr5nIkyTF27Xk67OFd
	 KpsQ5d/RmXUOPLQKqcznCELSXJkYv1F1MnIgTVUTj7eyAuclIYkyBuritQtw5mGy41
	 xgemlmoBsSEzsB2yGyDry47pfYTn7ARKupLDGh8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B25F8025F;
	Wed,  2 Dec 2020 08:38:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B926EF8026B; Wed,  2 Dec 2020 08:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A402F80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 08:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A402F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="jQ9szAUp"
Received: from epcas3p4.samsung.com (unknown [182.195.41.22])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201202073802epoutp0425ed77aee2fa46eecf7dc1c142184a59~M1jM3V8JB0145801458epoutp04e
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 07:38:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201202073802epoutp0425ed77aee2fa46eecf7dc1c142184a59~M1jM3V8JB0145801458epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606894682;
 bh=79sh+txxx67jiRwlMZ4xd5Tqksda/MR/MaLJUUSme+4=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=jQ9szAUpDfOVZJIS2R6aJ7KJZ7bXtG8LF7J8jW0gBARVaLEVMEm4pMz+jGDfW0BZH
 nPMNhWhKzKIzZjkW4tLbPpJjoh6dIuA7L4O5Vsz76TXsIYkywzRu5oa9gPA5V7ZsJ+
 CNxT9oN91AJykNEVQhVDXmod3l1Rdi6k14bYWylI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20201202073802epcas3p30ac7942fced3f9c1966b16894be44647~M1jMlolMT2322723227epcas3p3h;
 Wed,  2 Dec 2020 07:38:02 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp3.localdomain
 (Postfix) with ESMTP id 4Cm9mp1K2XzMqYkf; Wed,  2 Dec 2020 07:38:02 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8~M1YyftY-11517615176epcas2p4R;
 Wed,  2 Dec 2020 07:26:07 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201202072606epsmtrp20816bfabd35e4da708f908a3a2bae12d~M1YyeuV_u0370103701epsmtrp2k;
 Wed,  2 Dec 2020 07:26:06 +0000 (GMT)
X-AuditID: b6c32a2a-73fff70000002229-4c-5fc7418e44fc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 10.E1.08745.E8147CF5; Wed,  2 Dec 2020 16:26:06 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201202072606epsmtip18cc784c288407292da6abd741a1857a8~M1YyOkEE30290602906epsmtip1h;
 Wed,  2 Dec 2020 07:26:06 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <kuninori.morimoto.gx@renesas.com>, <cpgs@samsung.com>
In-Reply-To: 
Subject: [PATCH] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Wed, 2 Dec 2020 16:26:06 +0900
Message-ID: <2038148563.21606894682167.JavaMail.epsvc@epcpadp4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbEXXsWqYYpYDBTSmWEOGYw7iIbHwEHqxVQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSnG6f4/F4gwmXTC2uXDzEZPHykKbF
 3R/mFjO2dbNYNN6bwGax+uoWJotXh3cxWny70sFk8ev/MyaLoxcXM1k03G1mt3i5+Q2TxZHG
 KUwOvB4bPjexeeycdZfdY97JQI9vZyayePRtWcXosfl0dQBbFJdNSmpOZllqkb5dAlfGu54d
 LAUnjCv27utnaWD8rNnFyMkhIWAisbtlA2MXIxeHkMAORokz3w8zQyQkJD7MP8MOYQtL3G85
 wgpR9JxRov3JUbAEm4CuxJd7d8AaRARsJG6tngI2iVngBpPEiz8PmEASQgI8Eq827AdKcHBw
 CvBKTPhnDRIWFnCWeLbxBVgJi4CKxK+NJ8Bm8gpYSrS3XmWGsAUlTs58wgLSyiygJ9G2kREk
 zCwgL7H97RyoOxUkfj5dxgpxgpFE26xNzBA1IhKzO9uYJzAKz0IyaRbCpFlIJs1C0rGAkWUV
 o2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwLGpp7WDcs+qD3iFGJg7GQ4wSHMxKIrws
 /47EC/GmJFZWpRblxxeV5qQWH2KU5mBREuf9OmthnJBAemJJanZqakFqEUyWiYNTqoHp8uFC
 ryPqwWte7mZP+Rq0PWj6g9Wrfmau8Hh54b/M1oWLD6XahfysFVhYunKS3zHLU5sulExl8H3y
 KO0Ep2pT6guexG8XKhYo7hQ1npD4uFX+/ouHse9SpvmvX3Ihv6T6gNB3tcdb598yZVb5aRfE
 yXLWtn3qsVcXJz8w2LGSZ86i6v5XV12YhV5qf+/VvzW/+ollMQd/a8qki4c7nDYlKxVu2G0u
 tfXyAaf0Y2vDrVw/F12+oHPwRJLWnNAlfMGqFek3niQeFuHnaNzWvWgxn6iyVhyjomjZJRup
 W5Ov/JfeKvLyne1J/5mSXUasV25vlxcUSzl5f9ZX05KswveKSwvlcyV/uU6e/ZBL8kXTCiWW
 4oxEQy3mouJEANhHkX40AwAA
X-CMS-MailID: 20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8
References: <CGME20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com,
 'Takashi Iwai' <tiwai@suse.de>, 'Pierre-Louis
 Bossart' <pierre-louis.bossart@linux.intel.com>, lgirdwood@gmail.com,
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

If stop by underrun and DPCM BE disconnection is run simultaneously,
data abort can be occurred by the sequence below.

/* In core X, running dpcm_be_dai_trigger() */
for_each_dpcm_be(fe, stream, dpcm) {
/* In core Y, running dpcm_be_disconnect() */
spin_lock_irqsave(&fe->card->dpcm_lock, flags);
list_del(&dpcm->list_be);
list_del(&dpcm->list_fe);
spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
kfree(dpcm);
/* In core X, running dpcm_be_dai_trigger() */
struct snd_soc_pcm_runtime *be = dpcm->be;   <== Accessing freed memory

To prevent this situation, dpcm_lock should be acquired during
iteration of dpcm list in dpcm_do_trigger().

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dcab9527ba3d..7c5d950a8628 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2073,6 +2073,9 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+		struct snd_soc_pcm_runtime *be, int stream);
+
 static int dpcm_do_trigger(struct snd_soc_dpcm *dpcm,
 		struct snd_pcm_substream *substream, int cmd)
 {
@@ -2092,8 +2095,10 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
 	struct snd_soc_dpcm *dpcm;
+	unsigned long flags;
 	int ret = 0;
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	for_each_dpcm_be(fe, stream, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -2113,7 +2118,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2123,7 +2128,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2133,7 +2138,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2142,12 +2147,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
@@ -2155,12 +2160,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
@@ -2168,17 +2173,20 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
 			break;
 		}
+		if (ret)
+			break;
 	}
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	return ret;
 }
@@ -2916,10 +2924,9 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dpcm *dpcm;
 	int state;
 	int ret = 1;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	lockdep_assert_held(&fe->card->dpcm_lock);
 	for_each_dpcm_fe(be, stream, dpcm) {
 
 		if (dpcm->fe == fe)
@@ -2933,17 +2940,12 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 			}
 		}
 	}
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 	/* it's safe to do this BE DAI */
 	return ret;
 }
 
-/*
- * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
- * are not running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+static int dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
@@ -2954,6 +2956,23 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
+
+/*
+ * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
+ * are not running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+		struct snd_soc_pcm_runtime *be, int stream)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	ret =  dpcm_can_be_free_stop(fe, be, stream);
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
 /*
@@ -2963,6 +2982,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
+	unsigned long flags;
+	int ret;
+
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
 		SND_SOC_DPCM_STATE_PAUSED,
@@ -2970,6 +2992,10 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		SND_SOC_DPCM_STATE_PREPARE,
 	};
 
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	ret = snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);

base-commit: fa02fcd94b0c8dff6cc65714510cf25ad194b90d
-- 
2.21.0



