Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFC197A53
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 13:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CB91675;
	Mon, 30 Mar 2020 13:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CB91675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585566249;
	bh=Vdjz+cL2sVdlPuwPNDr4zOowAvOpMOQSyggPxGJaS1g=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KShCHFgqv3LlXTE6tnJNuOPmW/Q34RWq3YbrpIr5tXgEcLl7fvFZE3CWP1sUtiTEI
	 VKTTrQpeQchtmTCogFnFSRj2Zpvf/vl8+/+XOotzqIx98IrpG2EmUROX6xHdkpYK61
	 aCN9wqiBsmVNnOxp3v5gGgQA/cegwnnmaz+zg3EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E277F80252;
	Mon, 30 Mar 2020 13:01:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618BBF80148; Mon, 30 Mar 2020 13:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23537F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23537F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="t0SoE5iO"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200330110128epoutp03817a01cf2c4205b6334bcddf6630bc54~BD-Td-v5g1552815528epoutp03X
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 11:01:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200330110128epoutp03817a01cf2c4205b6334bcddf6630bc54~BD-Td-v5g1552815528epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585566088;
 bh=mqcJHin9DZuxRbWnbcV20OHiH36huxb9vs5Hi4T26ws=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=t0SoE5iOaJYFbMKt/gL1GXcFXaIouoibvV241QGJoX7YtK/WgsOK7f7e5OfJVB7xl
 d13YDsoJhbsSqv04XFvARWDKdwLwVxh7umtKq76m3YgQsbvi0DIaCjHHrDd7Hb3zD3
 F9dfTUbzDKBiuDbB3PsMGc7RpwjgQZRT6eXf5i8I=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200330110128epcas2p42410d85ed82803b12d01f6a7ec33263f~BD-TT8Ugv0130101301epcas2p4H;
 Mon, 30 Mar 2020 11:01:28 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48rTzV6FsdzMqYlr; Mon, 30 Mar
 2020 11:01:26 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.92.04105.681D18E5; Mon, 30 Mar 2020 20:01:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200330110126epcas2p4525e5c6f61f7452df008696f9153770d~BD-R-dOXf0615806158epcas2p4M;
 Mon, 30 Mar 2020 11:01:26 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200330110126epsmtrp22290e7544916453d6cebbb7ea12a07f1~BD-R_0PHl2404324043epsmtrp23;
 Mon, 30 Mar 2020 11:01:26 +0000 (GMT)
X-AuditID: b6c32a47-173ff70000001009-50-5e81d1862e87
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 06.FE.04158.681D18E5; Mon, 30 Mar 2020 20:01:26 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330110126epsmtip110e688e76428870515305b32e7bbd164~BD-R1zZ9p1232612326epsmtip1c;
 Mon, 30 Mar 2020 11:01:26 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <vkoul@kernel.org>
In-Reply-To: 
Subject: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve lockdep
 error
Date: Mon, 30 Mar 2020 20:01:26 +0900
Message-ID: <002101d60682$8ec21ed0$ac465c70$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYDSscBSVBNfjlCS4qPRcBesQFFBADNYf5A
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURjt7szOjubUtJl9SOE2PSDD2l1bGx/bg6S2MpIKNkLSQQeVZh/s
 rJZBYBa6a1YWSbSZmUiUJposmph/VulhDxTsrUL5iITKNJVCq51mg/13vvOd737n3HtJTF1B
 RJK5VifvsHICQ4TiLZ1r2Zji3lNHtK9/6di+Xp+CrfgwTLDTfS4F2zTTgNi2/sfYVqWpabKI
 MLV5BlSm5jo3YWr0vsRT8cNCUg7PZfEODW/NtGXlWrONzJ4D6dvTDXFaXYwunt3EaKychTcy
 ySmpMTtyBf9iRpPPCXl+KpUTRWbD5iSHLc/Ja3JsotPI8PYswa7T2deLnEXMs2avz7RZEnRa
 rd7gV2YIOTM/Jgh7P3m8++5NZSHqVJWiEBLojdB4rlpRikJJNX0fwdSbB7hcTCD4UzMT6Ewj
 aByUCnmkb9oVaHQguNczppSLzwgGnjUSpYgkCToBys4y0kA4bYaaKxVKCWP0ChiarcQlSQhN
 QfnvRAkupvfD6BhICpxeDQ31j1QSTdHxUPZxuURT9CJ4cnUYlw/RQ239DYWMo6D1SyUmO9PA
 z5FbSnmpHt6fmVLJmnC45i7GJJNAvybg0vm2QPpkmPC5CRkvhrFH3gAfCZNfOwh54DSCr89n
 A43LCNxn1TKOBe/1boVkFOiV0PUuYG4BuDrnVDJNgas4oGbgXvfvgBqgqklVjhhPUDJPUDJP
 UDJPUIJqhNehCN4uWrJ5UW+PDX7qZvTvS0bvvI9aXqT4EE0iJowaby08olZy+WKBxYeAxJhw
 itjnp6gsruAE77ClO/IEXvQhg//iL2KRSzJt/g9udabrDPq4OG28gTXE6VlmKdU8/22ams7m
 nPxRnrfzjv9zCjIkshART9Ii8s0pUT2fqFNPXVvSIr51VF6Yrtn7aqHZVOnaNfI9f/BhiTm+
 fTZswbPaS3jbKtG7bPn46i7vmqiSuhNzt6tSBVdse2lG1LHtzkOjya6iecLaPylfzHdf3Uls
 7dzW/NF9cgZroItjMta17haGWtpjHfSShcaCQeOhDPagZjeDizmcLhpziNxfNWV0hKgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnG7bxcY4gx9HFC2uXDzEZDH14RM2
 i29XOpgsNnxfy2ix884JZgdWjw2fm9g8ds66y+6xaVUnm8f6LVdZAliiuGxSUnMyy1KL9O0S
 uDK+f/nEVnCHo+LUmoWsDYyH2bsYOTkkBEwkrnzrYOpi5OIQEtjNKNG36CtUQkLiw/wzULaw
 xP2WI6wQRc8ZJX6uugvUwcHBJmAl0dOtBFIjIhAtMadtNRuIzSygKPH4zxwWEFtIgEfi1Yb9
 jCDlnAK8EhP+WYOEhQUCJCY8O8cEYrMIqEqsXX2cHaSEV8BSoueRLEiYV0BQ4uTMJywQE00k
 Gg93Q9nyEtvfzmGGuExB4ufTZawQFxhJ3G6BuJ5ZQERidmcb8wRG4VlIRs1CMmoWklGzkLQs
 YGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHC1aWjsYT5yIP8QowMGoxMP7YXtD
 nBBrYllxZe4hRgkOZiURXjZ/oBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe+fxjkUIC6Yklqdmp
 qQWpRTBZJg5OqQZGl6Wd6zo/bHCd9men7ue1WzL/3by53fWKRnVX3Fsm9qk/r1RMm+nxzGbj
 Uab9jdX3SjX4dnZPesSelmQgEj85lVG/wChO/9fMCL2bajGNFhY2V574a1i9Xbp9bsZ6h5A1
 08o4IvOOTbzJOO2G8uk1fQuqO3Ur7vu5d3YvtH/yN+HWuo8TTisvVGIpzkg01GIuKk4EAMgE
 6g6SAgAA
X-CMS-MailID: 20200330110126epcas2p4525e5c6f61f7452df008696f9153770d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330110126epcas2p4525e5c6f61f7452df008696f9153770d
References: <CGME20200330110126epcas2p4525e5c6f61f7452df008696f9153770d@epcas2p4.samsung.com>
Cc: alsa-devel@alsa-project.org
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

snd_soc_runtime_activate() and snd_soc_runtime_deactivate()
require locked pcm_mutex.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 392a1c5b15d3..42d416ac7e9b 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -207,7 +207,9 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
+	mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);
 	snd_soc_runtime_activate(fe, stream);
+	mutex_unlock(&fe->pcm_mutex);
 
 	mutex_unlock(&fe->card->mutex);
 
@@ -285,7 +287,9 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)
 	else
 		stream = SNDRV_PCM_STREAM_CAPTURE;
 
+	mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);
 	snd_soc_runtime_deactivate(fe, stream);
+	mutex_unlock(&fe->pcm_mutex);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
-- 
2.21.0


