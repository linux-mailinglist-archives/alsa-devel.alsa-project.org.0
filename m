Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB172C5E8F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 02:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9483817FB;
	Fri, 27 Nov 2020 02:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9483817FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606441543;
	bh=GMBiT+GjqHPjyeUWzN+boe7ZyQVnteQbaJCJGWDgdrI=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHrbjqIddct84sRwVf3u8jcYkY5SfGKHSURDia7Q3z58yGEoUvMaDz/xe+O2vCXuV
	 7FrPkGoWuUbgsKSIlxxIqg423V4Xm8zb7g7PJj5w+etfSbiG6ghDeMl1XDJE7f4nEu
	 BURUMjmh8CC2XvkN2JP2JDKDNyMnYg7ZRpMr98bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2BAF80166;
	Fri, 27 Nov 2020 02:44:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 781FCF80165; Fri, 27 Nov 2020 02:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8794BF80159
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 02:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8794BF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dhAcK3l+"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201127014349epoutp01d7d998d413736abd4daf9fb6b57e45fc~LOfgYytgl0522005220epoutp019
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 01:43:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201127014349epoutp01d7d998d413736abd4daf9fb6b57e45fc~LOfgYytgl0522005220epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606441429;
 bh=79sh+txxx67jiRwlMZ4xd5Tqksda/MR/MaLJUUSme+4=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=dhAcK3l+5PSNGlto/x/kLS3eSSCICRVuE049EXnnFVAnfRx6xDWutPtPhqpDGoxyQ
 8cpDl6cOTsfP1bJTGp+cbXZLGG0mSc5FUevUdEpXFPa8MSJWJbqAdieAFZAkCaq3ix
 4Zz36irDsOQ6SPuzsPUsEIi0rxM+Rb7nIBiegUOw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20201127014348epcas2p25285af96b63abce800a5148084c4b17a~LOffc52bc0269702697epcas2p2w;
 Fri, 27 Nov 2020 01:43:48 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.184]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Chy8K38jBz4x9QF; Fri, 27 Nov
 2020 01:43:45 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 08.DE.10621.FC950CF5; Fri, 27 Nov 2020 10:43:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201127014343epcas2p10bf524de048e0a659aa2486080375a75~LOfaj9iPL0038900389epcas2p1k;
 Fri, 27 Nov 2020 01:43:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201127014343epsmtrp14f20f2af1ecb059668f0aa7fa3e8a185~LOfajN5N92982929829epsmtrp1i;
 Fri, 27 Nov 2020 01:43:43 +0000 (GMT)
X-AuditID: b6c32a45-337ff7000001297d-80-5fc059cfde49
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.7E.13470.FC950CF5; Fri, 27 Nov 2020 10:43:43 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201127014343epsmtip226685cc08527201940af1056aa06772b~LOfaRSoqv0082300823epsmtip2g;
 Fri, 27 Nov 2020 01:43:43 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <alsa-devel@alsa-project.org>
In-Reply-To: 
Subject: [PATCH] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Fri, 27 Nov 2020 10:43:42 +0900
Message-ID: <000001d6c45e$bd22e940$3768bbc0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbEXXsWqYYpYDBTSmWEOGYw7iIbHwAAN8pg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmme75yAPxBt2XrC2uXDzEZHH3h7nF
 jG3dLBY3P05jt2i8N4HNYvXVLUwWRy8uZrJouNvMbjHx7mt2iyONU5gcuDw2fG5i8+jbsoox
 gCkqxyYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6Awl
 hbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToGhYYFecWJucWleul5yfq6VoYGBkSlQ
 ZUJOxrueHSwFJ4wr9u7rZ2lg/KzZxcjJISFgIvFvbS9bFyMXh5DADkaJ608amSGcT4wSF+Z8
 Z4RwvjFKfHz5hgWm5fC5A0wQib2MEnPn7IZyXjJKvF24mAmkik1AV+LLvTvMILaIgKLExR9b
 WEGKmAVeMEq8WrcKyOHg4BTglZjwzxqkRljAWeLZxhdgvSwCqhLzJ55iA7F5BSwlXs7thLIF
 JU7OfAJ2BbOAvMT2t3OYIS5SkPj5dBnYSBEBI4mnjckQJSISszvboEpmckgsPRgJYbtInH2+
 lAnCFpZ4dXwLO4QtJfGyv40d5EwJgWZGiXdn/0AlpjBKdHYLQdjGElvmnmIC2cUsoCmxfpc+
 iCkhoCxx5BbUZXwSHYf/skOEeSU62qAalSQ2nvrHBBGWkJi3gX0Co9IsJG/NQvLWLCT3z0JY
 tYCRZRWjWGpBcW56arFRgSFyVG9iBCdQLdcdjJPfftA7xMjEwXiIUYKDWUmE1114b7wQb0pi
 ZVVqUX58UWlOavEhRlNgQE9klhJNzgem8LySeENTIzMzA0tTC1MzIwslcd7QlX3xQgLpiSWp
 2ampBalFMH1MHJxSDUwqucn6PZba4oun3zVo5yg5UX3F209KnfU8R4Sk6jz1iZKf+tt7e2Rs
 Xfu6thx/ePKl8EmvCZVF8jr3svddZGzp6vt26ZPPuo3tsjUW9SYiMaf2r7v/e+LJI7caavdm
 aoqJhMZH38z9bnLskPvTC8LT12hc37qeST7xB4tM/dRH51+/XW6isLpA4delxI0P2XRrnrUq
 xuzYuqwt5oHnQiPdzzyejm4H5yb8V0tNPyzEsX/bssPeZR3zT2xc3ptwbML6CsGq6ZMi/vQ3
 pVw5lbPT8eLFs82LdocozHNnaJyyVPeti9/KvprSWbr73etOlP3x6hSpVcl9KzTV8VO3rmFR
 iLHq4pWle3nL9jx9LKHEUpyRaKjFXFScCACcBUfgKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvO75yAPxBld2iFtcuXiIyeLuD3OL
 Gdu6WSxufpzGbtF4bwKbxeqrW5gsjl5czGTRcLeZ3WLi3dfsFkcapzA5cHls+NzE5tG3ZRVj
 AFMUl01Kak5mWWqRvl0CV8a7nh0sBSeMK/bu62dpYPys2cXIySEhYCJx+NwBJhBbSGA3o8T3
 ebUQcQmJD/PPsEPYwhL3W46wdjFyAdU8Z5SYcOstM0iCTUBX4su9O2C2iICixMUfW8CKmAU+
 MUp8/H6SHWIqj8SrDfsZuxg5ODgFeCUm/LMGCQsLOEs82/gCbDGLgKrE/Imn2EBsXgFLiZdz
 O6FsQYmTM5+wgLQyC+hJtG1kBAkzC8hLbH87hxniNgWJn0+XsYKUiAgYSTxtTIYoEZGY3dnG
 PIFReBaSQbMQBs1CMmgWko4FjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGC40hL
 cwfj9lUf9A4xMnEwHmKU4GBWEuF1F94bL8SbklhZlVqUH19UmpNafIhRmoNFSZz3RuHCOCGB
 9MSS1OzU1ILUIpgsEwenVAPTibuca7ZwH500Ya6uoFay7Btj9UX6sXfEri/PyHbYyt2w5Wv/
 hZOOi65F2QoedBdYPevErGVn16zUuzn7w8+dn3VPWKZPznkh2ftkvsOauXaKX182fl+/IfNj
 rohUh7qX6fNFqbPW1KpffP9W6KB7knEUv6Lf8U1+orc8b1+tEJ6Xu7NnTa74ywfy82UN6xWi
 PSbdDz/P8vLiggJfaZOGw27pU7aaemjmbp1s1PDuSq+l1q/7HssZdLw5pvK9iNp7ce+6xZOK
 PnS/NLmd32pqIOkl8nabtIdp5JuIJb/P3vN1Wl+ybJJmtKVTl09zPVuKUgEfp/7zShXNGJWT
 E1+si/weOF2LLVtxJntL0rvVSizFGYmGWsxFxYkAnT5r1BIDAAA=
X-CMS-MailID: 20201127014343epcas2p10bf524de048e0a659aa2486080375a75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201127014343epcas2p10bf524de048e0a659aa2486080375a75
References: <CGME20201127014343epcas2p10bf524de048e0a659aa2486080375a75@epcas2p1.samsung.com>
Cc: khw0178.kim@samsung.com, kimty@samsung.com, jaewons.kim@samsung.com,
 donggyun.ko@samsung.com, hmseo@samsung.com, seungbin.lee@samsung.com,
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


