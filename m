Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCE4021C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 03:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175F61730;
	Tue,  7 Sep 2021 03:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175F61730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630977978;
	bh=v9OKzkiV9I9SfVzRsaoqPA49bUFJBUP6XSdkoZ4u08Q=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k+7RAKiVpZhKM+ND8a8rCXlda6kDnj7UYW90IDETr+e6RMcr47fkCK5Y4H0X9tMxu
	 PJK5faXG8EOjppcVqNRCOeqj5tTH+dz+A9h2TulmHrs/r2KyT0hEbgovH/sJ0bGZnP
	 wFRvKLBKEIP6y8iGc4XtJG8JvCA2o06q1ND2ywE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DE97F80253;
	Tue,  7 Sep 2021 03:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B7BF80224; Tue,  7 Sep 2021 03:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5AD6F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 03:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5AD6F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Cc5ghiIv"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210907012444epoutp03ebe7d1f27bc079f74afa6ac9252d1e0f~iZb69vElS2980129801epoutp03w
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 01:24:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210907012444epoutp03ebe7d1f27bc079f74afa6ac9252d1e0f~iZb69vElS2980129801epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630977885;
 bh=ebXDZjnjfx5PMA0E9dVI+5JrhVFNjHxLzCeUiOcb7Zk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Cc5ghiIvMnx565cCf6iSa6txSL4uUId1yd2AUhC70b50NWpk2muwL86qjbp4AeiCO
 1MOrhCUSly6/IH4VdRGNdR9vzTJxXzMKjvCfDc1KGLch3Fio8h7Ao8Z9RERKvTMjJF
 T3nWGpVCYPxKkwJll3DW4eSsWWvCRuGCMqv2MVfQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20210907012444epcas2p3c85a75cb4c85504dbdc5546fbf5c1daa~iZb6ReVdc2504125041epcas2p3d;
 Tue,  7 Sep 2021 01:24:44 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.187]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4H3SHG1zTxz4x9Q7; Tue,  7 Sep
 2021 01:24:42 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D1.BF.09816.85FB6316; Tue,  7 Sep 2021 10:24:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20210907012440epcas2p3cab33295dff61e84ae422457fbc795f6~iZb2Ym1M92299222992epcas2p33;
 Tue,  7 Sep 2021 01:24:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210907012440epsmtrp22df72144690fae70332be9853e958700~iZb2X0Dbd1269012690epsmtrp2B;
 Tue,  7 Sep 2021 01:24:40 +0000 (GMT)
X-AuditID: b6c32a46-63bff70000002658-0d-6136bf585d70
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.3D.09091.75FB6316; Tue,  7 Sep 2021 10:24:39 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210907012439epsmtip2e4468bf3aa6b73983becfce12b265b28~iZb2K0Kg82236522365epsmtip2j;
 Tue,  7 Sep 2021 01:24:39 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
Subject: [PATCH] ASoC: dpcm: fix race condition to dpcm links in
 dpcm_be_dai_trigger
Date: Tue, 7 Sep 2021 10:24:39 +0900
Message-ID: <000001d7a387$20e68650$62b392f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdejEkgFBjUqDm9PTG2YZO2ZhzLijA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmhW7EfrNEg/tntCyuXDzEZHH3h7nF
 jG3dLBarr25hsvh2pYPJ4ujFxUwWDXeb2S26V51mtZh49zW7xcvNb5gcuDw2fG5i89g56y67
 R9+WVYwem09XB7BE5dhkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
 +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwNCzQK07MLS7NS9dL
 zs+1MjQwMDIFqkzIyZhwax5TwRGxigfbG9kaGBcLdTFycEgImEicehjRxcjFISSwg1Fiy+oX
 TBDOJ0aJ47teMkI43xglnr2fxN7FyAnWcXr7VyYQW0hgL6PEqRvMEEUvGSVurD4ElmAT0JX4
 cu8OM4gtIqAi8bR3HdhYZoG3jBL9U++zgCSEBcIk+tb+ALNZgIqWPv/BBmLzClhK/L02nQXC
 FpQ4OfMJmM0sIC+x/e0cZogrFCR+Pl3GCrFAT+LPhsvsEDUiErM726BqejkkFl+ogLBdJBZe
 XQ0VF5Z4dXwL1DdSEp/f7WUDOU5CoJlR4t3ZP1CJKYwSnd1CELaxxJa5p5hAAcYsoCmxfpc+
 JOyUJY7cgjqNT6Lj8F92iDCvREcbVKOSxMZT/5ggwhIS8zZAzfaQWDH5BfsERsVZSH6cheTH
 WUh+mYWwdgEjyypGsdSC4tz01GKjAiPkqN7ECE6pWm47GKe8/aB3iJGJg/EQowQHs5II719z
 s0Qh3pTEyqrUovz4otKc1OJDjKbAUJ/ILCWanA9M6nkl8YamRmZmBpamFqZmRhZK4rycr2QS
 hQTSE0tSs1NTC1KLYPqYODilGpgMd08oSGPO573vGfL+yqTvSXP5Mkx32vb1HuxU+varYKKc
 4LVNPjc2CLmYi17sbNssp9djdU+rq73q+0ZOZ6u/hzb6vHXb+o7tiW7w1iyLja5nL8y64Xp7
 n0778t8JK8teTfE5sCfsvfkhl4Pte2IlNA9Pnhq8YfrWtwvWeW/bxq89UdOL3f5jtsrcYtWq
 by9ttH0neic8XFu39pTZk9QTyunC/ptTG92Z3i2fLitqsveG/47nK5iWOnMf2D6L6ZTxXxuh
 /i+PD/fZbiiRnire9ST1wvP5qdOfNLluaOpj11v1odQ9fW709LelX8p6ZgmHmOkI3ii5uz9p
 7QcHu8/8bVHlae9v7OCfzv048M8tJZbijERDLeai4kQA37hyVzIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvG74frNEg3tLLS2uXDzEZHH3h7nF
 jG3dLBarr25hsvh2pYPJ4ujFxUwWDXeb2S26V51mtZh49zW7xcvNb5gcuDw2fG5i89g56y67
 R9+WVYwem09XB7BEcdmkpOZklqUW6dslcGVMuDWPqeCIWMWD7Y1sDYyLhboYOTkkBEwkTm//
 ytTFyMUhJLCbUWLh4xOsEAkJiQ/zz7BD2MIS91uOsEIUPWeUuPl9FhtIgk1AV+LLvTvMILaI
 gIrE0951YJOYBb4zSiz68xOog4NDWCBEYspTFpAaFqCapc9/gPXyClhK/L02nQXCFpQ4OfMJ
 C0g5s4CeRNtGRpAws4C8xPa3c5ghblCQ+Pl0GSvEKj2JPxsus0PUiEjM7mxjnsAoOAvJpFkI
 k2YhmTQLSccCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjB0aKluYNx+6oPeocY
 mTgYDzFKcDArifD+NTdLFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFq
 EUyWiYNTqoFpp6Gzs8xXSVOnRynlJROvZM2cz75tms9Ep7+svbXVBZINu8uOTukuXd8loaG0
 Llfw9j7hgGWqB9d6Jn7xOLhDdus73Zc52vYLjthkc9Ykzdf58uyct/hqQ82G1Oevdctsfs2d
 8lSjK/R/3/PdbitO5m+ZIPvfYevkvt35gh7iXK+fbV2e9/NYg2P42aCtonbHWM7cXroh9a7M
 5B0+vsYRZu+NVvN5PlONUjh7bCrDglfspZsXtQYufvHJ74jNMzUt5qkzGV/x/Lxxx0nrruIO
 y+At87T/R4VOY3rUzyPCxHRaKC9t2cmiTtbb/yTUT58ufMD88Xx2xaWv2e90PrK1BtvL/5H4
 2t9b6q0q5xSrxFKckWioxVxUnAgAd990ogUDAAA=
X-CMS-MailID: 20210907012440epcas2p3cab33295dff61e84ae422457fbc795f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210907012440epcas2p3cab33295dff61e84ae422457fbc795f6
References: <CGME20210907012440epcas2p3cab33295dff61e84ae422457fbc795f6@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, kimty@samsung.com, lgirdwood@gmail.com,
 senius.park@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 seungbin.lee@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com
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

If routing change and underrun stop is run at the same time,
data abort can be occurred by the following sequence.

CPU0: Processing underrun 	CPU1: Processing routing change
dpcm_be_dai_trigger():		dpcm_be_disconnect():

for_each_dpcm_be(fe, stream, dpcm) {

				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
				list_del(&dpcm->list_be);
				list_del(&dpcm->list_fe);
				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
				kfree(dpcm);

struct snd_soc_pcm_runtime *be = dpcm->be; <-- Accessing freed memory

To prevent this situation, dpcm_lock is needed during accessing
the lists for dpcm links.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-pcm.c | 53 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 48f71bb81a2f..df2cd4c0dabe 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1993,17 +1993,63 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+struct dpcm_be_list {
+	unsigned int num;
+	struct snd_soc_pcm_runtime *be[];
+};
+
+static int dpcm_create_be_list(struct snd_soc_pcm_runtime *fe, int stream,
+		struct dpcm_be_list **be_list)
+{
+	struct snd_soc_dpcm *dpcm;
+	struct dpcm_be_list *be;
+	int size = 0;
+	int ret = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+
+	for_each_dpcm_be(fe, stream, dpcm)
+		size++;
+
+	be = kzalloc(struct_size(be, be, size), GFP_ATOMIC);
+	if (!be) {
+		ret = -ENOMEM;
+	} else {
+		unsigned int i = 0;
+
+		for_each_dpcm_be(fe, stream, dpcm)
+			be->be[i++] = dpcm->be;
+
+		*be_list = be;
+	}
+
+	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
+	return ret;
+}
+
+static void dpcm_free_be_list(struct dpcm_be_list *be_list)
+{
+	kfree(be_list);
+}
+
 int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
 	struct snd_soc_pcm_runtime *be;
-	struct snd_soc_dpcm *dpcm;
+	struct dpcm_be_list *be_list;
 	int ret = 0;
+	int i;
 
-	for_each_dpcm_be(fe, stream, dpcm) {
+	ret = dpcm_create_be_list(fe, stream, &be_list);
+	if (ret < 0)
+		return ret;
+
+	for(i = 0; i < be_list->num; i++) {
 		struct snd_pcm_substream *be_substream;
 
-		be = dpcm->be;
+		be = be_list->be[i];
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
@@ -2092,6 +2138,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 	if (ret < 0)
 		dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
 			__func__, be->dai_link->name, ret);
+	dpcm_free_be_list(be_list);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);

base-commit: 4ac6d90867a4de2e12117e755dbd76e08d88697f
-- 
2.21.0


