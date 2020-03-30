Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108C1975D8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B6115F9;
	Mon, 30 Mar 2020 09:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B6115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553874;
	bh=1e3pMebWUbZDoixo7d0H/Gp3cux0d02OWLxGb1a6aqQ=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZhvIX0OsAttfyeCntq9EEIRe9wCXnr12F2X2Zt/v1PLzsQOCbf+TFBBB+8PoPmnOc
	 2f6/mtj/YxYYMM+mhWgp2bn6OhqlalkNQr99ltMNEIkht33FRTTXIFFm39dgbqYgQ2
	 6ulSNyyRZ72Lr/Ks0tqP7xKCFMuFwQlIgDOvdXvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB497F8022D;
	Mon, 30 Mar 2020 09:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5367F8015C; Mon, 30 Mar 2020 09:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB97F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB97F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Toh3f0aT"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200330073552epoutp026d34a8801415245c4cad71d3caf9b53e~BBLzQL6Dm0588205882epoutp028
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:35:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200330073552epoutp026d34a8801415245c4cad71d3caf9b53e~BBLzQL6Dm0588205882epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585553752;
 bh=/WDzIcxqny7X2Y7xn3LTCJdBJ6oAxG+htP6WsdBuRb8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Toh3f0aTSSzdvIBAEyA4DnAc+iaOC8IFmc2OVaHGelC/mAHptOVyUj6jrx+4SRCqu
 6bVzNWJFSmwXc8EborVB2II52deVQtc4IaK51Eec8ZqWsGxo+RQx1AhgYrKP4uY0up
 KwGDP4Sws83liw4HH56pPRIj3ZgRVC2fWWMP+MUI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200330073552epcas2p414ad4db63ae17865d235c1e05ae627b4~BBLyvjQij1825418254epcas2p4D;
 Mon, 30 Mar 2020 07:35:52 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48rPQG5TQmzMqYkh; Mon, 30 Mar
 2020 07:35:50 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.F5.04142.451A18E5; Mon, 30 Mar 2020 16:35:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f~BBLvDDdhK3138731387epcas2p3K;
 Mon, 30 Mar 2020 07:35:48 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200330073548epsmtrp1255758a111ece4007fbf1c07cb26c66f~BBLvCHdCE1749117491epsmtrp1z;
 Mon, 30 Mar 2020 07:35:48 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-85-5e81a154860f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.9E.04158.451A18E5; Mon, 30 Mar 2020 16:35:48 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330073548epsmtip1ce8395992e5e034b9f2c4750e1b2edd7~BBLu22bBT2907729077epsmtip1s;
 Mon, 30 Mar 2020 07:35:48 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Date: Mon, 30 Mar 2020 16:35:47 +0900
Message-ID: <000e01d60665$d48444b0$7d8cce10$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYGZTjyo8u3CJE6Rom1ek84xNvO3g==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRT23db19jG5Tq3Dgpo3IhJc22xrilqS2aLARSEV4rrpy5T21e4m
 GQWWtfyIUinIpVYglqvITM2MQEyNjCJxBhVFmZkGVtPSQrO23Rvs33PO+zznvM85hxRKqgkp
 WWBxYLuFMdHEIlH7o7Ub4ndfPZ6jqBygtd6BboH2wocRQjvtLRVom2duoU0iXfPUCUJ33/02
 XNfiKSN0t1uHRHrRPlNyPmbysF2GLbnWvAKLMYXevsuw2aDWKJTxykTtBlpmYcw4hU7foY/P
 KDD5e9KyQsbk9Kf0DMvS61KT7VanA8vyrawjhca2PJNNqbTJWcbMOi1Gea7VnKRUKFRqP3O/
 KX9yuF1ge0AervvTh4pRP1GOFpJArYdP114KytEiUkJ1IPBNfhZywSSCvzPtiAumEXye8IWX
 IzIoGbyzl8s/RNDj6efl4whGmkqEARJBJcGZCjrQIppKg599xaIAFlKx8HGuNoijqK3gLbke
 /IaIWg2PmzqDWEwlwuj3knAOR8KTmhFeq4KGG5cFHF4J9yZqhZwFGfz+1LiA6yWH+eE5nh8N
 l8pcQTdANRMw2MsVBSodehqHeHEUfHncyuelMH7OFc4JShB8fTbHP5xHUFYh4XACtNYFHAcm
 sQp6XvPNIqD00R9+QGIodfFsGu70z/NsgPpmvqAOfMMuohLFukNcukNcukNcukPcXEEiD1qK
 bazZiFmVTRW67BYUvMe4jA7U8HxHN6JIRC8RX2wrzpEsYArZInM3AlJIR4uJTH9KnMcUHcF2
 q8HuNGG2G6n9W6gSSmNyrf7rtjgMSrVKo1EkqrVqjUpLLxO3LH6VLaGMjAMfxNiG7f91AnKh
 tBglVM0WNU67fL2Ry02/5dvcXd6ptHfHNp72ZEkj9Amp1uxY3/iezJsjs5t23Y1asebbTWvW
 08H6lK6NU4WJv8b6OrN6cdfZsRzjqpOjk9d/zNR4vC0P38idhlOWMs06fChMv6wjQpIsqe9S
 4fnUX46wLUczDkTe6NvZ9j7mRfW1ASUtYvMZZZzQzjL/AIDpVw6lAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnG7IwsY4g433OC2uXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAlfGp0fb
 mAp2c1TM/XuMsYHxFFsXIweHhICJxOWNkV2MXBxCArsZJTY2nGTpYuQEiktIfJh/hh3CFpa4
 33KEFaLoOaNE748HYM1sAlYSPd1KIDUiAq4S9/c2gNUzCyhKPP4zB2yOsIC7xJXmFWwgNouA
 qsTxlbvAbF4BS4lnH5rZIWxBiZMzn7BA9JpINB7uhrLlJba/ncMMcYOCxM+ny1ghdulJ/Hv0
 B6pGRGJ2ZxvzBEbBWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66X
 nJ+7iREc9FpaOxhPnIg/xCjAwajEw/the0OcEGtiWXFl7iFGCQ5mJRFeNn+gEG9KYmVValF+
 fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBka3VYITWn9vKBIsO3PLVWX2
 i+MXAmwzqpZf6kh4OnfxjI/tM8RZtuhccWTfFllqHaiVuqVk/fdgnqOFHscuW363nMltpb0k
 Zo56/FmRW2pc7tpuOcuP//NmZvbXaa6tll8oWcFyolZaqWKaxpGEwhKet7q+S+vLX6/8PemP
 yz6N7+Fvl344u1yJpTgj0VCLuag4EQACe4xzdgIAAA==
X-CMS-MailID: 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
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

Since a virtual mixer has no backing registers
to decide which path to connect,
it will try to match with initial value 0.
This is to ensure that the default mixer choice will be
correctly powered up during initialization.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-dapm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 9fb54e6fe254..fc55a0534252 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -802,7 +802,16 @@ static void dapm_set_mixer_path_status(struct
snd_soc_dapm_path *p, int i,
 			val = max - val;
 		p->connect = !!val;
 	} else {
-		p->connect = 0;
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial value 0.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		val = 0;
+		if (invert)
+			val = max - val;
+		p->connect = !!val;
 	}
 }
 
-- 
2.21.0


