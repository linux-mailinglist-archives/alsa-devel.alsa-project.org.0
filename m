Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C2380994
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 14:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4DA1781;
	Fri, 14 May 2021 14:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4DA1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620995559;
	bh=q8tUtHXlI51+ZLq03fCK3eb79tCnS17UHIPNEKA1PXg=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhKuuHwPwMeECF2LeXQziZSpUUAt0hUdw8Ym29BdMyJC6YnGhFzUQoLoeMTrqOnoj
	 3kyqloGIS5nP23V4Q7X6xyjlaMdcJREsY//CnPnMOgz/a7j0Pff50IR3ZkYGvh9MM1
	 /zXnCMu5b0cq/Q/eLcPlbBpy7m4sii/khpp96e1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0BFF8026B;
	Fri, 14 May 2021 14:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45048F80240; Fri, 14 May 2021 14:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6007F8012A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 14:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6007F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ioujkn46"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210514123056epoutp016c9bf4dab4088dd940da7204c8dbac01~_7sdi_MDh1704217042epoutp01G
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 12:30:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210514123056epoutp016c9bf4dab4088dd940da7204c8dbac01~_7sdi_MDh1704217042epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620995456;
 bh=LI8NeRfHBdleifVePqaG9Mm51mHfnSAIoqSBCWxvrxA=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ioujkn46QzV6rXMp/KEJ8dHwrZ7nMAG59SqKzMP7fCfJe7UcYYkID+3t6TSBqy/aH
 SAjEKk83HdDGsr50uNTWxYIVQ6K0G4e2KHNIwzaVQHhTE/X9TjazyTCkIQvYDbB3Hw
 a69tZ925tuItF43sOpt5fdk4cP2NVMWGlmFfbDF0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20210514123055epcas2p295a65181e0cbd5121e5e661e7939a1e2~_7sctQ0KL1107811078epcas2p2w;
 Fri, 14 May 2021 12:30:55 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.184]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4FhSYT6Fvkz4x9Pw; Fri, 14 May
 2021 12:30:53 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 BE.E7.09604.D7D6E906; Fri, 14 May 2021 21:30:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20210514123052epcas2p37cb55a80e713340c1f2ee96c31ffa591~_7saEHHvd2385823858epcas2p3d;
 Fri, 14 May 2021 12:30:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210514123052epsmtrp2f62a45fd3001abab9dc567927a49c143~_7saApAOH3245032450epsmtrp2r;
 Fri, 14 May 2021 12:30:52 +0000 (GMT)
X-AuditID: b6c32a45-db3ff70000002584-90-609e6d7da377
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.E5.08637.C7D6E906; Fri, 14 May 2021 21:30:52 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210514123052epsmtip241713070c66588af0369a9071818bbf3~_7sZzhfO61189711897epsmtip2N;
 Fri, 14 May 2021 12:30:52 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: 
Subject: [PATCH] ASoC: soc-dai: fix up hw params only if it is needed
Date: Fri, 14 May 2021 21:30:51 +0900
Message-ID: <000401d748bc$fa466d50$eed347f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AddIu/X1plkQBUM/QE2gr2u8YuoshgAAMx4g
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmhW5t7rwEg+3t+hZXLh5ispj68Amb
 xd0f5hYztnWzWDTem8BmsfrqFiaLb1c6mCx+/X/GZHH04mImi4a7zewWLze/YbI40jiFyYHH
 Y8PnJjaPnbPusntsWtXJ5jHvZKBH35ZVjB6bT1cHsEXl2GSkJqakFimk5iXnp2TmpdsqeQfH
 O8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAnaikUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8u
 sVVKLUjJKTA0LNArTswtLs1L10vOz7UyNDAwMgWqTMjJOLlzInvBa46KHSdWszQwTmPvYuTk
 kBAwkZi69xIriC0ksINR4vMm3S5GLiD7E6NEw9YNTBDON0aJTwdXMMN07HvwDSqxl1Hi+5YD
 UM5LRomrZ5pZQKrYBHQlvty7A9YhIiAh8WXXCbAiZoEzTBK7zp8HWsjBwSnAKzHhnzVIjbCA
 q8ScWfuZQGwWAVWJo39mgt3HK2Ap8WfLEiYIW1Di5MwnYPOZBeQltr+dA3WRgsTPp8tYIXYZ
 SbxvP8AGUSMiMbuzjRlkr4TAAQ6J89tuQz3tIjHx00KoZmGJV8e3QMWlJD6/28sG0dDMKPHu
 7B+oxBRGic5uIQjbWGLL3FNMIA8wC2hKrN+lD2JKCChLHLkFdRufRMfhv+wQYV6JjjaoRiWJ
 jaf+MUGEJSTmbWCfwKg0C8ljs5A8NgvJA7MQVi1gZFnFKJZaUJybnlpsVGCIHNebGMGpV8t1
 B+Pktx/0DjEycTAeYpTgYFYS4RVLmp0gxJuSWFmVWpQfX1Sak1p8iNEUGNQTmaVEk/OByT+v
 JN7Q1MjMzMDS1MLUzMhCSZz3Z2pdgpBAemJJanZqakFqEUwfEwenVAOTsU//j6sfEqau5N72
 0++D+bIlUyJ6Yt6d7nB/obFrXbOOZFF62578+WKnJsu1xs9/Uj5bZofHDkupP3m/HuqV3BMu
 +T99z6Wn4e7fS/sDbjOendPAz7nx0aoY+Qato5xTZS3uN+XZlDcVK7IYyRczXD8ifOCRx9K9
 it6xQvsKfuzYnsj0LvFQmJmJwLOAewHSQucXn6z6N03HXEyH+1xDkslBY5eAb5eXWG0QKZGW
 8H20oclw+bIl5ycGSB6eOOt4U9Q1y64/rfxqZxcG+ys1Fbrfzmxjy5v2P/3lkbV7pIU7baZa
 1rWWbSm48ObdTj3TeNeSFcHfFs3UVZr190Gw4ak7u2P01XbfPlzbyMSgxFKckWioxVxUnAgA
 RUnodEYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvG5N7rwEg1Of2S2uXDzEZDH14RM2
 i7s/zC1mbOtmsWi8N4HNYvXVLUwW3650MFn8+v+MyeLoxcVMFg13m9ktXm5+w2RxpHEKkwOP
 x4bPTWweO2fdZffYtKqTzWPeyUCPvi2rGD02n64OYIvisklJzcksSy3St0vgyji5cyJ7wWuO
 ih0nVrM0ME5j72Lk5JAQMJHY9+AbUxcjF4eQwG5GiWkXO5ghEhISH+afgSoSlrjfcoQVoug5
 o0RL738WkASbgK7El3t3wBpEgBq+7DoBNolZ4AaTxPotn8GKhAR4JF5t2M/YxcjBwSnAKzHh
 nzVIWFjAVWLOrP1MIDaLgKrE0T8zwZbxClhK/NmyhAnCFpQ4OfMJ2BhmAW2J3oetjBC2vMT2
 t3OgDlWQ+Pl0GSvEDUYS79sPsEHUiEjM7mxjnsAoPAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz
 03OLDQsM81LL9YoTc4tL89L1kvNzNzGC41BLcwfj9lUf9A4xMnEwHmKU4GBWEuEVS5qdIMSb
 klhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPT/j8v3q2vYJkv
 HFay47jGs99pqlIVhjqnJLu037kJfHU/nHvfeYWCtdvqG5rGEqdnNFltNJkmLO1/zdDLdNYX
 2Z6yvVNtmbjnJ507IztBaHfCD8G+QKmi6S6GXsY3lZcm5hwXX1iXpiqxmn/FSvF9zt/tYlS5
 3acJL92kta6Sy8VMSblffMfWuQ9Sbxx2t1VQz/bdnuKx/5vVSg6bqze+zJ5pIr7Pe9ftEBfl
 ZT9XXnESmPzpF2dpRtH9RXqstd456u7nQ77f7uES+LJ1z4bmb3+fzvCvbzDTjmB+Ocn07fvX
 7g81n/atyW7+5PpvFusJ1VaxvbzTlngWOV3aOE82855Dx8Hn06qLm5k9ZeuUWIozEg21mIuK
 EwE0018nMgMAAA==
X-CMS-MailID: 20210514123052epcas2p37cb55a80e713340c1f2ee96c31ffa591
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210514123052epcas2p37cb55a80e713340c1f2ee96c31ffa591
References: <CGME20210514123052epcas2p37cb55a80e713340c1f2ee96c31ffa591@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, kimty@samsung.com, donggyun.ko@samsung.com,
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

If fixed hw params won't be used, fixing up isn't needed also.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-dai.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 080fbe053fc5..4df1aae8abf3 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -327,14 +327,15 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int ret = 0;
 
-	/* perform any topology hw_params fixups before DAI  */
-	ret = snd_soc_link_be_hw_params_fixup(rtd, params);
-	if (ret < 0)
-		goto end;
-
 	if (dai->driver->ops &&
-	    dai->driver->ops->hw_params)
+	    dai->driver->ops->hw_params) {
+		/* perform any topology hw_params fixups before DAI  */
+		ret = snd_soc_link_be_hw_params_fixup(rtd, params);
+		if (ret < 0)
+			goto end;
+
 		ret = dai->driver->ops->hw_params(substream, params, dai);
+	}
 
 	/* mark substream if succeeded */
 	if (ret == 0)

base-commit: c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1
-- 
2.21.0


