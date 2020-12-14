Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09B2D95AA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 11:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4EDE1777;
	Mon, 14 Dec 2020 11:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4EDE1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607940123;
	bh=PwRLMvJHAUwCjlDQgTiSqtXT16/6gII85ctLNdFXxFI=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWoUAW2a6QlKGWNWuJvXpwpn6b3RPxIosy7Xg7wxzRPpXv+kmM+J/snwq6LvSVjvH
	 +keL+0RLYP3ri+pGxCHu2z9/o+BcFY8t8SwsUsKB/owvrqRm/U5UwqNLnJ6MCXXXlS
	 OlAKuyxWtABj3wMSZ6d1OCjSAG8I1enaM1sz21qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B9A7F80274;
	Mon, 14 Dec 2020 11:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB3CF80274; Mon, 14 Dec 2020 11:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A350FF80129
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 11:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A350FF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="RTMqWOTK"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201214100002epoutp04d57ae5c13246afab68534e2889ff78c1~QjOm-SW_r0138401384epoutp04_
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 10:00:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201214100002epoutp04d57ae5c13246afab68534e2889ff78c1~QjOm-SW_r0138401384epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607940002;
 bh=6mjmvTKYi5n8uE/b9GzEfeO2rilVfByLM24p6DFxT5w=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=RTMqWOTKD+TDBreNNIEHD5MssPfbywvnL3+XiSaRX7jzLINziXOzZlDUMB/BwHtme
 cnQ9HOMXlxjmiQHrEGCcQebkyz73QF2BAuOVqVlc936OkeuykBGIQWNFTLLxTtA6Q4
 Rbq9lO8sSQfqA1vNgc6JC4/7Sq1Qzq0lUnQRd9OY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20201214100002epcas3p354a04c76d9d026abb131b5badad32dbc~QjOmm374y0248902489epcas3p33;
 Mon, 14 Dec 2020 10:00:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4CvcM60X26z4x9Q3; Mon, 14 Dec 2020 10:00:02 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20201214083825epcas2p4b9704b0ddcf0debc9ad99ddee015c6c6~QiHWpLwcF1191911919epcas2p4P;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201214083825epsmtrp11d89f7d88d327d6a4b9e85c3b2a7fdc1~QiHWkl48V1364913649epsmtrp1V;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
X-AuditID: b6c32a2a-755ff70000002229-5f-5fd72481beb4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.1C.08745.18427DF5; Mon, 14 Dec 2020 17:38:25 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201214083825epsmtip2b14756839017e58d3adf402b149f91cf~QiHWX2omi0444004440epsmtip2B;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
In-Reply-To: 
Subject: [PATCH v3 1/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Mon, 14 Dec 2020 17:38:25 +0900
Message-ID: <1891546521.01607940002053.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdbJUefzWBsBwqKdQFqEbWIOCt4/TAIohdnA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSvG6jyvV4g4bnuhZXLh5isnh5SNPi
 7g9zixnbulksGu9NYLNYfXULk8Wrw7sYLb5d6WCy+PX/GZPF0YuLmSwa7jazW7zc/IbJ4kjj
 FCYHXo8Nn5vYPHbOusvuMe9koMe3MxNZPPq2rGL02Hy6OoAtissmJTUnsyy1SN8ugSvj1Ker
 bAUPjCoOXbjP2sD4X6OLkZNDQsBEYuLvXYxdjFwcQgI7GCX6325nhUhISHyYf4YdwhaWuN9y
 hBWi6DmjxIwVu5hAEmwCuhJf7t1hBrFFBIIkFiz9C1bELPCOSWLimo8sIAkhAR6JVxv2A63g
 4OAU4JWY8M8aJCws4CXx8PEfNhCbRUBV4uzNiWDLeAUsJZ6/PwllC0qcnPkEbAyzgJ7E+vVz
 GCFseYntb+cwQxynIPHz6TJWiLiIxOzONqh7jCSm9nazT2AUnoVk1Cwko2YhGTULSfsCRpZV
 jJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjB8ailtYNxz6oPeocYmTgYDzFKcDArifD+
 rr8cL8SbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVANTK0uk
 tkjeimK/V3956078YvH7JxzpJzTj8UaXaBeZqqcbzh0UeSC6ZW///yv7vrgttHdb/XS9P8u+
 iy8jD62Uk0j4kvI/WWxjfoOJlMnz2+8NFz9jmfDwGFP3Fgef0FvfJkhrpUVa3b8dxDihvfTF
 fKnmt15v/T4nRnxPs9j7Zv/TDyevPXxS/+r5zydSf39XdvQ9fKbnZfJO2m6nxY/nz761TVz4
 UOh89LLOLJ6Z1970Hte8dGbV2TdLNPVlLh34y+f/pUI0r2zxnw1fln0UXrGeLWOmrO76zrSa
 8OUtv+8b3IqftjF6k+zb7Kp3n/bznJgU5NIoty9qB2fhVdOXbv27PpWJXz39y1cl9cAclZ9K
 LMUZiYZazEXFiQAFAR3INgMAAA==
X-CMS-MailID: 20201214083825epcas2p4b9704b0ddcf0debc9ad99ddee015c6c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201214083825epcas2p4b9704b0ddcf0debc9ad99ddee015c6c6
References: <CGME20201214083825epcas2p4b9704b0ddcf0debc9ad99ddee015c6c6@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>, lgirdwood@gmail.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 kimty@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 cpgs@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
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



