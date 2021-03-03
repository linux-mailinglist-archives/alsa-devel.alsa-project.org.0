Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2932B50A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 07:07:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B061B06;
	Wed,  3 Mar 2021 07:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B061B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614751621;
	bh=/iySeUcuHzDgNoS9HF0z1UfCvH5DAe+7NHper0l0i70=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=K9wJCx7CVvznkl8DvyvhD5rh+LE89fLuGWQMvDiFLjrv+4d9NT+RMuDR9CO4dyTig
	 IewwhQ/E1azOtF02LydAduCT/ZzT46BaNE0MfL/gU47/9sD8NDXAYu5eo4fJhXCxwY
	 NkOr13Tj9WNHRpGXI2rn7qTnInMZrwdfwXoRAmLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B38E5F802C4;
	Wed,  3 Mar 2021 07:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13F8BF80275; Wed,  3 Mar 2021 07:05:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E0C0F80257
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 07:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0C0F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="MU6A9W1L"
Received: from epcas3p4.samsung.com (unknown [182.195.41.22])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210303060502epoutp022a3df453e3bc34e6b6b6b57e8a2719be~ov_-IWPkM1745717457epoutp02k
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 06:05:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210303060502epoutp022a3df453e3bc34e6b6b6b57e8a2719be~ov_-IWPkM1745717457epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614751503;
 bh=n5x8GjLVeHvJeVafOBYgAnmZgqYXIkvfqZQ2s/J4n7M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=MU6A9W1L5WiHJqMmAaVz1ZT+tBW+R14MRJyNg5KBJJISdUPpxFYVlbmkGaHxAT8NF
 xEl3r9ctsmYeRAGUl50Xf7ERJHZCtU4fvRwev094Qclz57nb7hPCAPWVzv9S64N+DE
 AT2L5eq2H7l3PWQ2j07YTROiVJi7fAJ8S8JoUnPs=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20210303060502epcas3p4ebf824aec5c762f080666c62739a6b10~ov__maj6f2371623716epcas3p4p;
 Wed,  3 Mar 2021 06:05:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4Dr3PV2lsdz4x9Q5; Wed,  3 Mar 2021 06:05:02 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20210303060135epcas2p3677a88a1ae15b93fea8f0e2821558f6e~ov79g6SbQ0757907579epcas2p3A;
 Wed,  3 Mar 2021 06:01:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210303060135epsmtrp24bff63fbd615a2091056b6557a540158~ov79f7sp40505505055epsmtrp2B;
 Wed,  3 Mar 2021 06:01:35 +0000 (GMT)
X-AuditID: b6c32a2a-73fff70000002229-c0-603f263eae71
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 4E.A2.08745.E362F306; Wed,  3 Mar 2021 15:01:34 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210303060134epsmtip26dfbf50eedb4da8df50860da33a5d079~ov79NWFVP2545025450epsmtip2W;
 Wed,  3 Mar 2021 06:01:34 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <broonie@kernel.org>, <cpgs@samsung.com>
Subject: [PATCH v5 1/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Wed, 3 Mar 2021 15:01:34 +0900
Message-ID: <1935972447.41614751502383.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcP8qUM+BZE9PK9S0So0TVQPn478A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvK6dmn2CwbNn5hZXLh5ispj68Amb
 xctDmhZ3f5hbzNjWzWLReG8Cm8Xqq1uYLF4d3sVo8e1KB5PFr//PmCyOXlzMZNFwt5nd4uXm
 N0wWRxqnMDnweWz43MTmsXPWXXaPTas62TzmnQz0+HZmIotH35ZVjB6bT1cHsEdx2aSk5mSW
 pRbp2yVwZRyc0MNWcESlYvOPtYwNjD2yXYwcHBICJhLzW0u6GLk4hAR2MEp8aDvJ1sXICRSX
 kPgw/ww7hC0scb/lCCuILSTwnFHi43ceEJtNQFfiy707zCC2iECWxMv/d5lBBjELvGOSuPpr
 BRNIQljAS+LNo0Vgg1gEVCRO3+xhBlnMK2ApsXW+B0iYV0BQ4uTMJywgNrOAtkTvw1ZGCFte
 YvvbOcwQNyhI/Hy6jBVil57E1emHmCBqRCRmd7YxT2AUnIVk1Cwko2YhGTULScsCRpZVjJKp
 BcW56bnFhgVGeanlesWJucWleel6yfm5mxjB8aaltYNxz6oPeocYmTgYDzFKcDArifCKv7RN
 EOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoEpm73qc12E
 OaNoZ+yrv1+SJv+a/1Zr8Z/4M9+i5zvKey48KMz+Yf7ZiI1XfrNlrWp6Euy9mWHDF+4p75u4
 C46EG3/d7s36q724Id6L67T4xnQ95gq+wJdlgeeE186/tbLd4dk+jZaaB+8mZe2d5mGxzEFv
 1XdPV8Gzx0OPGrEXHG6+F7NPW2EFu/avvJ3XM7/mV11jMdQWtUlUfzcl9aPavhlS22znbTnB
 53PFpypSTt/t3vQvT5qKbd3rZbVLTnB15lTcEbh6xaj+ZmKNmNZv+1ONu0rbGLbtfypgbG8l
 oPhJt/1OsHnth8iCGD9u5/b+Ww8neRc26d1hEujlsBKRrerz9phy/pd9wDmxrUosxRmJhlrM
 RcWJAFuOnQUmAwAA
X-CMS-MailID: 20210303060135epcas2p3677a88a1ae15b93fea8f0e2821558f6e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210303060135epcas2p3677a88a1ae15b93fea8f0e2821558f6e
References: <CGME20210303060135epcas2p3677a88a1ae15b93fea8f0e2821558f6e@epcas2p3.samsung.com>
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
 include/sound/soc-dpcm.h |  5 ++++
 sound/soc/soc-pcm.c      | 59 +++++++++++++++++++++++++++++++++-------
 2 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 0f6c50b17bba..599cd6054bc3 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -103,6 +103,11 @@ struct snd_soc_dpcm_runtime {
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
 };
 
+struct snd_soc_dpcm_rtd_list {
+	int num_rtds;
+	struct snd_soc_pcm_runtime *rtds[0];
+};
+
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
 	list_for_each_entry(_dpcm, &(be)->dpcm[stream].fe_clients, list_fe)
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 14d85ca1e435..ccda0f77e827 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2028,15 +2028,51 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int dpcm_be_list_create(struct snd_soc_pcm_runtime *fe, int stream,
+		struct snd_soc_dpcm_rtd_list **be_list)
+{
+	struct snd_soc_dpcm *dpcm;
+	unsigned long flags;
+	int size, i, ret = 0;
+
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+
+	size = 0;
+	for_each_dpcm_be(fe, stream, dpcm)
+		size++;
+
+	*be_list = kzalloc(struct_size(*be_list, rtds, size), GFP_ATOMIC);
+	if (*be_list) {
+		i = 0;
+		for_each_dpcm_be(fe, stream, dpcm)
+			(*be_list)->rtds[i++] = dpcm->be;
+
+		if (i != size)
+			dev_err(fe->dev, "ASoC: abnormal change in be clients: %d -> %d\n",
+					size, i);
+
+		(*be_list)->num_rtds = i;
+	} else {
+		ret = -ENOMEM;
+	}
+
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
+	return ret;
+}
+
 int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
-	struct snd_soc_dpcm *dpcm;
-	int ret = 0;
+	struct snd_soc_dpcm_rtd_list *be_list;
+	int i, ret = 0;
 
-	for_each_dpcm_be(fe, stream, dpcm) {
+	ret = dpcm_be_list_create(fe, stream, &be_list);
+	if (ret < 0)
+		return ret;
 
-		struct snd_soc_pcm_runtime *be = dpcm->be;
+	for (i = 0; i < be_list->num_rtds; i++) {
+		struct snd_soc_pcm_runtime *be = be_list->rtds[i];
 		struct snd_pcm_substream *be_substream =
 			snd_soc_dpcm_get_substream(be, stream);
 
@@ -2056,7 +2092,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2066,7 +2102,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2076,7 +2112,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2090,7 +2126,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
@@ -2103,7 +2139,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
@@ -2116,13 +2152,16 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret)
-				return ret;
+				break;
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
 			break;
 		}
+		if (ret < 0)
+			break;
 	}
 
+	kfree(be_list);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
-- 
2.21.0



