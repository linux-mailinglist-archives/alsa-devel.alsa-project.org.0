Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935F31D49F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 05:34:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1C11658;
	Wed, 17 Feb 2021 05:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1C11658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613536493;
	bh=dC2gnEIodNUQyu9YnGwuziFGy4WLBnmNBNkt09gyQmo=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Byhnjd2PlWYTYkxI9Coc2uW11zoWKiWxBkRk5ZZnkkj6AhBmSDOY5wfDcKcMa0qft
	 Oiqd8IrxL0CDsLnqvwjbsXk6eKcrK7lxHxJXfsFSS7ALShIOprMn7676Ngsaf1FVQt
	 sK0uN4LTMYNR3VUQJSbD5c8BVea5JN/HRDYmBK9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D693AF800AE;
	Wed, 17 Feb 2021 05:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BCF9F8025B; Wed, 17 Feb 2021 05:33:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD8DF800D0
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 05:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD8DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ZKX8YHRl"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210217043303epoutp01cbe4c52919c34fec64dd3ecab8b5a19b~kbsq9pLX-0915309153epoutp01C
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 04:33:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210217043303epoutp01cbe4c52919c34fec64dd3ecab8b5a19b~kbsq9pLX-0915309153epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1613536383;
 bh=j0zPIE9VLJips+SzjmrFyntDWnbu0Pb7RhYqpoNPrDU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ZKX8YHRlniwqcxbsd7rg1Xewy7Ty6bSQhE/h8yML5RrkbGaYLs25Z+U5EHPqI4NwZ
 U+OP/O1GOl1YqZc8wlkXtizWhkf7Xrw7CJWIasdPqC2kY5sp1NEH+NmXXTb+YNgF66
 xlnH3uVEYohHbWhGun8CbRVkAMuXW+C4saJGB4OM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas3p2.samsung.com (KnoxPortal) with ESMTP id
 20210217043302epcas3p2941fd5cab93ab522b812414695abbe30~kbsqTjVV61570015700epcas3p2S;
 Wed, 17 Feb 2021 04:33:02 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4DgQ1p5k5lz4x9Q7; Wed, 17 Feb 2021 04:33:02 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20210217043150epcas2p3d7776bc10dc822875cc23b3e721658b6~kbrmlC5ze3152231522epcas2p3G;
 Wed, 17 Feb 2021 04:31:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210217043150epsmtrp113194e519fff72ca5890283c16d3c5f0~kbrmkDlm91879118791epsmtrp1E;
 Wed, 17 Feb 2021 04:31:50 +0000 (GMT)
X-AuditID: b6c32a2a-73fff70000002229-c4-602c9c35410d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DB.B9.08745.53C9C206; Wed, 17 Feb 2021 13:31:49 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210217043149epsmtip22a95ef2269cc91bf4563b851be59d921~kbrmVDRSS0095300953epsmtip2E;
 Wed, 17 Feb 2021 04:31:49 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <broonie@kernel.org>, <cpgs@samsung.com>
Subject: [PATCH v4 1/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Wed, 17 Feb 2021 13:31:49 +0900
Message-ID: <1773638882.61613536382796.JavaMail.epsvc@epcpadp4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcE5c6CHkH9aWF0S1+un2AizJ94RA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7bCSvK7pHJ0Eg5+vbCyuXDzEZDH14RM2
 i5eHNC3u/jC3mLGtm8Wi8d4ENovVV7cwWbw6vIvR4tuVDiaLX/+fMVkcvbiYyaLhbjO7xcvN
 b5gsjjROYXLg89jwuYnNY+esu+wem1Z1snnMOxno8e3MRBaPvi2rGD02n64OYI/isklJzcks
 Sy3St0vgylh9uoOtYJdhxfKpJ9kbGL+qdzFyckgImEjsuLODqYuRi0NIYAejxLwPe1ghEhIS
 H+afYYewhSXutxxhhSh6zihx9fNeRpAEm4CuxJd7d5hBbBGBLImX/+8ygxQxC7xjkrj6awUT
 SEJYwEvi+d33YDaLgKrEgz9rwKbyClhKbJ22gw3CFpQ4OfMJC4jNLKAt0fuwlRHClpfY/nYO
 M8QVChI/ny4DuoIDaJmexNRlvhAlIhKzO9uYJzAKzkIyaRaSSbOQTJqFpGUBI8sqRsnUguLc
 9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgmNPS2sG4Z9UHvUOMTByMhxglOJiVRHjZP2slCPGm
 JFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cBU8E3vpaVJ0cbN
 S/45c7odOTAh4fSqEyXrb9UplkvMrJt84az2M84kPtMOhe2rT983KDkv/n/GDNXXy++c7ls7
 fUHqjtflykGbWu4onNvE48jw7HZbc1a+re+R5CQJE9ajVZPZw+t699d+2btzczvfqyu7jkw9
 pprwTTUjKI/T3qbhyIkQ64Ka0A+dJuadn35xnd/Ww1Ljc0Y8Luj0tRbZ7ccjfK56T722863U
 Xmk9zivflqn57VU6qdGRvLs1OlcmQsN+/rT5L/I5TeZLbLn+ep+9BHPQ5RmOG6bsk7z3+XfX
 jdLLnjaX/ErmJmrpO2t0OxYe5om6VT9f4+fmx+/WGt09/eexbPmVL4fFvlZvVmIpzkg01GIu
 Kk4EAC9fw5goAwAA
X-CMS-MailID: 20210217043150epcas2p3d7776bc10dc822875cc23b3e721658b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210217043150epcas2p3d7776bc10dc822875cc23b3e721658b6
References: <CGME20210217043150epcas2p3d7776bc10dc822875cc23b3e721658b6@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, kimty@samsung.com, donggyun.ko@samsung.com,
 hmseo@samsung.com, cpgs@samsung.com, s47.kang@samsung.com,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

CPU0					CPU1
dpcm_be_dai_trigger():			dpcm_be_disconnect():

for_each_dpcm_be(fe, stream, dpcm) {

					spin_lock_irqsave(&fe->card->dpcm_lock, flags);
					list_del(&dpcm->list_be);
					list_del(&dpcm->list_fe);
					spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
					kfree(dpcm);

struct snd_soc_pcm_runtime *be = dpcm->be; <-- Accessing freed memory

To prevent this situation, dpcm_lock should be acquired during
iteration of dpcm list in dpcm_be_dai_trigger().

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ee51dc7fd893..718f6b3a309a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2074,12 +2074,17 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+		struct snd_soc_pcm_runtime *be, int stream);
+
 int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
 	struct snd_soc_dpcm *dpcm;
+	unsigned long flags;
 	int ret = 0;
 
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 	for_each_dpcm_be(fe, stream, dpcm) {
 
 		struct snd_soc_pcm_runtime *be = dpcm->be;
@@ -2102,7 +2107,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2112,7 +2117,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2122,7 +2127,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2131,12 +2136,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
@@ -2144,12 +2149,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
@@ -2157,17 +2162,20 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				continue;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
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
@@ -2905,10 +2913,9 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dpcm *dpcm;
 	int state;
 	int ret = 1;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	lockdep_assert_held(&fe->card->dpcm_lock);
 	for_each_dpcm_fe(be, stream, dpcm) {
 
 		if (dpcm->fe == fe)
@@ -2922,17 +2929,12 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
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
@@ -2943,6 +2945,23 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 
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
@@ -2952,6 +2971,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
+	unsigned long flags;
+	int ret;
+
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
 		SND_SOC_DPCM_STATE_PAUSED,
@@ -2959,6 +2981,10 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
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
-- 
2.21.0



