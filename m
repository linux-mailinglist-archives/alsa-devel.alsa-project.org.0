Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991C193B4B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 09:48:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECCE1674;
	Thu, 26 Mar 2020 09:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECCE1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585212518;
	bh=+AhK59CWeCv8LPrSWDLDRXN2m7Y1sBNephf5Pl8b12o=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KNqWoOaZ2qZ6PUfm2+lB5aaSNk4YJ392sY+csBnZ+iJIEwl+l6tx29/Zdm2DLmwMF
	 Uoje6yjIZlLaNIE+ghMLHv2FyETgqQQwTR/7dOPqFC294GSNB4rGa7lT2Sy9SAJkun
	 t21Xb6Ikr+csRboqrB5wIBn61b3jY/UwvUupvIXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A1CF80273;
	Thu, 26 Mar 2020 09:46:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8A3F80258; Thu, 26 Mar 2020 09:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,PRX_APP_IMAGE_GIF,PRX_BODY_135,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB228F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 09:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB228F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="P9ajX/mk"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200326084613epoutp04b015c2dee504213b620c36c85afec7dc~-zkFOwI-z1888918889epoutp04t
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 08:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200326084613epoutp04b015c2dee504213b620c36c85afec7dc~-zkFOwI-z1888918889epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585212373;
 bh=cBu5NUKNX42vw5AX+6LIp9+AcOmCNWxpiH+wXcJbM0c=;
 h=From:To:Cc:Subject:Date:References:From;
 b=P9ajX/mkImgjILGbhpA3AqY+rtwPlljSW5fV4C+d3qzKnowkhXW+MWTn7iIktMHhy
 mfAQv9SYUQ4xg9MMisXg/7Aa635W74Y6Qma3L79xKoFhPxN9iR91uQIBBX9U22J3OF
 hWaG1mIFmn4RV0zIBlxzVq9TWBLpisUQi92Y/+Ho=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200326084613epcas2p39ea509206d69c506b315bf43e2b46b6d~-zkE1bhvL2858128581epcas2p3J;
 Thu, 26 Mar 2020 08:46:13 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48nz9J0WFDzMqYkY; Thu, 26 Mar
 2020 08:46:12 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.82.04128.0DB6C7E5; Thu, 26 Mar 2020 17:46:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200326084608epcas2p32239121f201613573e7dd86c3172a29f~-zkAL6DDy1555615556epcas2p3n;
 Thu, 26 Mar 2020 08:46:08 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200326084608epsmtrp148349bfa690b75ffd302b3845750caed~-zkAK0s4E3044930449epsmtrp1j;
 Thu, 26 Mar 2020 08:46:08 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-d1-5e7c6bd0399c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.26.04158.0DB6C7E5; Thu, 26 Mar 2020 17:46:08 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200326084608epsmtip10c60c412b1d61b7fac72ecd5061a84e0~-zkAAyFCI1857018570epsmtip1x;
 Thu, 26 Mar 2020 08:46:08 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve lockdep
 error
Date: Thu, 26 Mar 2020 17:46:07 +0900
Message-ID: <000101d6034a$fe37c7a0$faa756e0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYDSscBSVBNfjlCS4qPRcBesQFFBA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0hTcRTmtzvvruXitqwOYrRuVGhou6utKRo9bZCBJP1hD+2il2nuxe4W
 PgpES+ajtDC1pWZQUtpjmdSKylqhZWXOlLQoMrOHUlLLtLBo617B/75zzved853fg8BkH/EQ
 IsNoZS1GRk/hM8TX7oepI7oy9ycrGq6v1PR43CLN8YH3uOZnj12kcY5fRGvFWqc3H9fecLyW
 aJsbi3Dt5ZZecYJ4hz4mnWXSWIucNaaa0jKMulhqS2LKhhSVWkFH0FGa1ZTcyBjYWGpjfEJE
 XIbeN5OS72P0Nl8qgeE4asWaGIvJZmXl6SbOGkux5jS9mabNkRxj4GxGXWSqyRBNKxRKlY+5
 R59+t8+Dmav6UZbreaskD412oWIUSAC5CpqaSv9jGelCcKktsBjN8OHvCMp7iwP44CeCusNt
 kinF60N2EV+4jeBZ2VsJH3xGUHn1qK8XQeBkNJSWUH5BMLkOxtryxH6MkYtgcLJG7KfMIbfB
 h2Hwp8XkEqh75x8WSEjJKGh3tWM8ng2PTrwXpDvhoPeY4FoOv4YaAvj2kfDj7AUJzwmGk0WF
 mN8OkE9wKHd0YrxgI1SNTgriOTDc3iIsEwKfywolvKAAwdenk0KhAkFRiYzHK6GltkPkNw3k
 YnjwUjA0C+z3/0j4tBTshQKbgisdfwU2QJ1TaKiF7wX3RPxB74Y73vqAciR3TNvSMW1Lx7Rt
 eKyEM02nRDxeCNe/1Aj5vVD7bULQ0nDi5nmBsxwaTo8InPnQ2jPVZxFUlAxIeLwMOm6dwerR
 zEY0jzVzBh3LKc309BfUjP4/8vBNLlTdGe9GJIGoIKkzKjdZFsDs47INbgQERgVLh5L2J8uk
 aUx2DmsxpVhsepZzI5XvZo9iIXNTTb4vY7Sm0CqlWq2IUmlUaqWGmi+9OrN/l4zUMVY2k2XN
 rGVKJyICQ/JQ9pKxsDEnud1yKjHnxitPd816ddCR1osHPAnMgoy2XOdkkbE+93dcya1h3FX5
 KUZ7Lsv7KLSxVXbt8NKl7tBMnKscDM3Shz14cVJ3kxwfyeyY2IDKkrq8WaG2PtIWv7nZpuIe
 Lh+qLk301JsN6m574+Pa3tH88DeuI0mxWw8qKTGXztDhmIVj/gGcf5sK+gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSnO6F7Jo4g77HvBZXLh5ispj68Amb
 xbcrHUwWG76vZXRg8djwuYnNY+esu+wem1Z1snms33KVJYAlissmJTUnsyy1SN8ugSvjwZLD
 LAUzbCo+H/jK1MB41rSLkZNDQsBE4m5rB1MXIxeHkMBuRomWSQtZIRISEh/mn2GHsIUl7rcc
 YYUoes4ocWrZZbYuRg4ONgEriZ5uJZAaEQFXift7G8DqmQUUJR7/mcMCYgsLBEhMeHaOCcRm
 EVCVmPeoC2w+r4ClxPEdx5khbEGJkzOfsED0Rku0fJ7ECLFXQeLn02WsEPP1JL4sXQM1X0Ri
 dmcb8wRGgVlI2mchaZ+FpAzCNpFoPNwNVSMvsf3tHKi4scSFpgaoem2JZQtfMy9gZF/FKJla
 UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcJ1paOxhPnIg/xCjAwajEwxthXh0nxJpYVlyZ
 e4hRgoNZSYT3aWRNnBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe+fxjkUIC6YklqdmpqQWpRTBZ
 Jg5OqQZGszd6+3cFbpih5dn9Zunvtvzb87aHSv3ZtdP8QfdBztzi7Q88rNb0XGBljLp6Joe9
 eZ/B5zkKd/cmXLvScb1rW1XN0+d3bkQzPs/Z+F6Ke5J61ibujZty+p3/vTwQXtf/+GRHmqTy
 0iUyK8v3mU9f6NnfPlFmicT7j0dP66y7/MNDMXy3zvvtl5VYijMSDbWYi4oTAaZDnZiPAgAA
X-CMS-MailID: 20200326084608epcas2p32239121f201613573e7dd86c3172a29f
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200326084608epcas2p32239121f201613573e7dd86c3172a29f
References: <CGME20200326084608epcas2p32239121f201613573e7dd86c3172a29f@epcas2p3.samsung.com>
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

require pcm_mutex lock.

 

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

+         mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);

         snd_soc_runtime_activate(fe, stream);

+         mutex_unlock(&fe->pcm_mutex);

          mutex_unlock(&fe->card->mutex);

@@ -285,7 +287,9 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)

         else

                    stream = SNDRV_PCM_STREAM_CAPTURE;

+         mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);

         snd_soc_runtime_deactivate(fe, stream);

+         mutex_unlock(&fe->pcm_mutex);

          fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;

-- 

2.21.0

 

