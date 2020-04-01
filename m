Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85BF19A325
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 03:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47F7D1662;
	Wed,  1 Apr 2020 03:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47F7D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585703182;
	bh=1IyHJDP45ESCHpiMa5s28d69fU5fOKag7ZlngJT5x9I=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=twNeyjH2TvgrYuYkt2kabuzmZz5i7rB49ppuxvgqS8m4ptSnkFoi5JuqoP2Eo6AIJ
	 DG2nFehx/NKY54ydYKB/OAhsS0u6HuqhHaVmqlKPCmth7fBRsHRBRebDNLhZDC3F9V
	 Wku9HvvW2LOvYF2CghaxFSCfVvMNjf9QLe5v0Nd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EC8F800AA;
	Wed,  1 Apr 2020 03:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 228ABF80146; Wed,  1 Apr 2020 03:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F046F8010C
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 03:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F046F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="EDKztMsa"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200401010427epoutp04550ebd3ac95ad60b18491f91eab2723d~BjInZ_O1C1524715247epoutp040
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 01:04:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200401010427epoutp04550ebd3ac95ad60b18491f91eab2723d~BjInZ_O1C1524715247epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585703067;
 bh=Hv1HlAyLvC+X7Yi0z09bZO6VkFkquifFbau9sGI+zo4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=EDKztMsanUKEQ/4LWcFKTGSQB3/SFO/sv5nSfO2dNPC5etOmbEIOadlHeKUz54nF6
 niCdfaykhYog/lJ2Mlnem5i914ofH595Ba2WO++3oYYiNWs3Omv5i9V5msqfHyexWt
 GIdGSxv/VNE9ql403Upancfn7yESCOARW4hYVYeE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200401010427epcas2p49e88144c2cb0ecda7b61968972c74193~BjIm9z03Y3131931319epcas2p4U;
 Wed,  1 Apr 2020 01:04:27 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.185]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48sSdh672gzMqYks; Wed,  1 Apr
 2020 01:04:24 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.30.04128.698E38E5; Wed,  1 Apr 2020 10:04:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200401010421epcas2p3d5b16041fa59efa0ac8786f682d4c991~BjIh_mNSG2877428774epcas2p3X;
 Wed,  1 Apr 2020 01:04:21 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200401010421epsmtrp254851d442eaa1fd43b049e5e59ed738c~BjIh9xJ900728207282epsmtrp2Q;
 Wed,  1 Apr 2020 01:04:21 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-bc-5e83e896a6a1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E5.3F.04158.598E38E5; Wed,  1 Apr 2020 10:04:21 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200401010421epsmtip12b69b8034c30f6b47f27bcfbd0a519eb~BjIhx-4QL2530425304epsmtip1t;
 Wed,  1 Apr 2020 01:04:21 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
Subject: [PATCH] ASoC: dpcm: allow start or stop during pause for backend
Date: Wed, 1 Apr 2020 10:04:21 +0900
Message-ID: <004d01d607c1$7a3d5250$6eb7f6f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYHwP4G1c7OgnqKTquv+mCyAtB3qA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+c7Zzo7W4rSsXoRqHYUw0rbV1lGygi7MshIq0MrZyR2ctFs7
 m6R00QamKWbldVkp2QVLM29doARNLOnCSCHLispIpdS8FN3bPAv23+/73ud5v/fhe0lcdo0I
 JlPNds5mZo00EShqaQ/ThJcMOHWK1xVSptvdhjHFb/sJpqwlT8R87c7BmA73BYyp/1aLmPtZ
 RRhzu+8BvobU1o8fJbS3Xa8k2oaaXEJb0FSDtNebekRx4p3GlQaO1XM2OWdOtuhTzSnR9KZt
 SWuT1BqFMlwZyayg5WbWxEXT62LjwjekGj3D0PI01ujwXMWxPE8vXbXSZnHYObnBwtujac6q
 N1qVSmsEz5p4hzklItliilIqFCq1R7nHaGj90kxY3dMPnOh4L8lE9wKPowASqOXQPPxD4mUZ
 dQtB9cT24yjQw2MI6iYbkXD4iuDFm7/i/47WrkpcKNxFUFrT6TsMIsgqrvT0IkmCioL8PNpr
 CKKWwNP8OsyrwalTCK4OfETewiwqBi6/7pliERUK2aX5uJelVCRkFVQjgWfCw/J+kZdxSgXV
 V89jAi+Am58rcGEiOXz/cEksPBYBlytGxIImCM7kZk8NB9RLAiZ+VhGCYR305byUCDwLhjqb
 fBwM48N3CcHgRDD8+JevUIQgN08m8DJoOtuFeVMCFQL3X/iGmwE57b8lwrUUcrJ9ahpudP3x
 qQHO1fsaauF9y5C4EC10+aV0+aV0+aV0+aWpRKIaNIez8qYUjldZlf6/3YCmNnXx+luo7Els
 G6JIRE+XyqOcOpmYTePTTW0ISJwOkhJbM3UyqZ5Nz+BsliSbw8jxbUjt+YWTePDsZItn7832
 JKVapdEoItWMWqNi6LnSxmm9u2VUCmvn9nGclbP992FkQHAmMozZQp6NXp//4FFC+qKQK9UW
 3Z0jT1br3vWc7ovv2uvIKITnkTs62j+09Bclt7eObnEfIg6GMfbVtWHOswk3iYzNxzLdteSq
 ir+h8X3yT871WGLzZO+XaaMxjtzx+KJ5gxdnJu5/FDTQLAnsrNq1pUTMjhzWl38bqoqJ2Jj2
 cFn5JC3iDaxyMW7j2X8d/ahZvwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSnO7UF81xBkeXK1lcuXiIyWLqwyds
 FjO2dbNYfLvSwWRx9OJiJosN39cyWhxpnMJksfPOCWYHDo8Nn5vYPHbOusvusWlVJ5tH35ZV
 jB7rt1xlCWCN4rJJSc3JLEst0rdL4MrY/3ErW8FFnor+o4/ZGxj3cXUxcnJICJhI7D+1gLmL
 kYtDSGA3o8TZpbcYIRISEh/mn2GHsIUl7rccYYUoes4oseXwJbYuRg4ONgEriZ5uJZAaEQE9
 iaW7jrOA1DALzGKUeDVnNitIQljAU2L5vatgQ1kEVCTapvcwg9i8ApYSjX1LGCFsQYmTM5+w
 gNjMQBc1Hu6GsuUltr+dwwxxhILEz6fLWGGWLZ/znhWiRkRidmcb8wRGwVlIRs1CMmoWklGz
 kLQsYGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHCtaWjsYT5yIP8QowMGoxMOr
 aNUcJ8SaWFZcmXuIUYKDWUmEl82/IU6INyWxsiq1KD++qDQntfgQozQHi5I4r3z+sUghgfTE
 ktTs1NSC1CKYLBMHp1QDo+y09vQJs6JLbxfnerHWrJFtVy7/uLB+0dPNq+ZYhNzJDm9zO+h/
 Qax0rrnFZBlflS0F4jpmJ+euM7P31uF/w1zuc2Srgn6tepfr/kUSKYnOU31nLb5k+m+vy5mF
 OfbB1vsf2urmTN6zcc/PGdsvSC+Zde7/CoGwhywMf+psvG5UfOwPzTv5SomlOCPRUIu5qDgR
 AHqBKDqRAgAA
X-CMS-MailID: 20200401010421epcas2p3d5b16041fa59efa0ac8786f682d4c991
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200401010421epcas2p3d5b16041fa59efa0ac8786f682d4c991
References: <CGME20200401010421epcas2p3d5b16041fa59efa0ac8786f682d4c991@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

soc_compr_trigger_fe() allows start or stop after pause_push.
In dpcm_be_dai_trigger(), however, only pause_release is allowed
command after pause_push.
So, start or stop after pause in compress offload is always
returned as error if the compress offload is used with dpcm.
To fix the problem, SND_SOC_DPCM_STATE_PAUSED should be allowed
for start or stop command.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c59b3688ca0..8f6f0ad50288 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2236,7 +2236,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
-			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP))
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
@@ -2266,7 +2267,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
-			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
+			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
-- 
2.21.0


