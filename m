Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68652CCEB3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 06:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4569C180D;
	Thu,  3 Dec 2020 06:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4569C180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606973813;
	bh=Eg2XVanWfpVAwiiRmz4ltmIQb/NogP5zrdVWIhPrWbA=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Xd2bbCX6QWXX5e4J7ZMWhLRgQbKhxdU6xJRD/er10IPVbCF40X4IoZ7lBfP9fmFjW
	 LiP3QDrrEIEWs//VXjz72lszX+4B1jPgM08ABKh7/WThqnjfpz7456XHRM6I9lJ+A8
	 hssJCB4HJ31rsHvLl9i2IV0oZoxhLLjzCdf/3kUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78114F80254;
	Thu,  3 Dec 2020 06:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76184F8012A; Thu,  3 Dec 2020 06:35:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40D3F80158
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 06:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40D3F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dRdabTxm"
Received: from epcas3p3.samsung.com (unknown [182.195.41.21])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201203053502epoutp04dfd46cd89d069b834f2aabfef528e328~NHhFrGsdW2209722097epoutp04J
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 05:35:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201203053502epoutp04dfd46cd89d069b834f2aabfef528e328~NHhFrGsdW2209722097epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606973702;
 bh=Uku8ZK0H2CLbNlDFU/hau7C5vRI2vEgiJeveeYtAX+M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dRdabTxmnADl0hLBcyBcsw8ZJZ90J3BxTNVWiFVSyTedu9JFYMSw9UhLncCWm9tJD
 /HzPllul41rGX23DMR6iJ6r4jultntW7+zN8hkmRfBNyA3AEZR9zlXuyYUwzgO+qvH
 5sj66jjAyMJ7lojgr6d0dUxA8Gde/RMrbwjeSohI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20201203053501epcas3p49019d69f888bf86bd2dc3a995eba4076~NHhFbmyld0926709267epcas3p4t;
 Thu,  3 Dec 2020 05:35:01 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp2.localdomain
 (Postfix) with ESMTP id 4Cml0P6SHFzMqYkW; Thu,  3 Dec 2020 05:35:01 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201203053226epcas2p23199d15a27c5a9996ba5d26085453523~NHe08fjMO0521205212epcas2p2H;
 Thu,  3 Dec 2020 05:32:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201203053226epsmtrp167c4836a0856d106bc00d82c97359ce5~NHe05oknK3147231472epsmtrp1k;
 Thu,  3 Dec 2020 05:32:26 +0000 (GMT)
X-AuditID: b6c32a2a-755ff70000002229-a5-5fc8786a5903
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 34.6A.08745.A6878CF5; Thu,  3 Dec 2020 14:32:26 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201203053226epsmtip27181adab237b2e1fafe8cf3a6ce50d09~NHe0nMqzA2160921609epsmtip2i;
 Thu,  3 Dec 2020 05:32:26 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
Subject: [PATCH v2 1/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Thu, 3 Dec 2020 14:32:26 +0900
Message-ID: <1935972447.41606973701904.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbJNHXbWlM7tNX0SPKQFEQn0dNfaQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJXjer4kS8was7yhZXLh5isnh5SNPi
 7g9zixnbulksGu9NYLNYfXULk8Wrw7sYLb5d6WCy+PX/GZPF0YuLmSwa7jazW7zc/IbJ4kjj
 FCYHXo8Nn5vYPHbOusvuMe9koMe3MxNZPPq2rGL02Hy6OoAtissmJTUnsyy1SN8ugSujpXc6
 W8Fk44r+/w+ZGxgPa3YxcnJICJhILN/1krWLkYtDSGAHo8TDbY+YIRISEh/mn2GHsIUl7rcc
 YQWxhQSeM0qsO54BYrMJ6Ep8uXcHrF5EIEhiwdK/YIOYBd4xSVz9tYIJJCEs4CWx+ed2MJtF
 QEVi8sxZLCA2r4ClxNPfP9khbEGJkzOfgMWZBbQleh+2MkLY8hLb386BOkhB4ufTZawQy/Qk
 Pl05xQZRIyIxu7ONeQKj4Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwykst1ytOzC0u
 zUvXS87P3cQIji8trR2Me1Z90DvEyMTBeIhRgoNZSYSX5d+ReCHelMTKqtSi/Pii0pzU4kOM
 0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwae9Qyl/OdK68ejJbZf4J1bZ/DIfkHp7V
 /rFxoSqPqN1Ot0Wr1wjIzHnzcvmEi3VHLVzZP06KOdssbePW2n3aY93Ks4tSt19vUefccKi3
 W61rorNdMcOSSY/XzXi6p+bWrV9rCvrOW3/gfqm9o1P6xq00D/FZ95oYlynXMmg8ef7k62dt
 GcX8X6KZEV8Ontv18McUpf+H85Zc+XLO58ZDB8mC6OP71U0ezP1q5JR4Ru7/gRCmlAfru6/q
 qT9rNmGM/KT5NixxzVuVB9dmSgbsPt/mLmPVq8XG4f56A8fWcwuko98VxAYLVP5/fCpqk5ek
 UmHiJfvdT7Kuu7ZND7uiN8si8vtRJvY2zr4FZQ6t05VYijMSDbWYi4oTAVF33woeAwAA
X-CMS-MailID: 20201203053226epcas2p23199d15a27c5a9996ba5d26085453523
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201203053226epcas2p23199d15a27c5a9996ba5d26085453523
References: <CGME20201203053226epcas2p23199d15a27c5a9996ba5d26085453523@epcas2p2.samsung.com>
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
iteration of dpcm list in dpcm_be_dai_trigger().

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
-- 
2.21.0



