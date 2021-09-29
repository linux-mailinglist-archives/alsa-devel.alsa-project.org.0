Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8041BEDD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 07:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3394C169F;
	Wed, 29 Sep 2021 07:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3394C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632894665;
	bh=v9OKzkiV9I9SfVzRsaoqPA49bUFJBUP6XSdkoZ4u08Q=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJfz0dYiy4Irg5nYBfOASLA5nxj7PQU/dXtDS1fzC4H/cM4fMA9AajqZO+i9p+UP1
	 QUIuybWa6Ln9XZVuzxNbp4efAnV3vVttH6HZq7dEB1HIke+wmNZcu48Bo+wF7zeaAB
	 H7TsG3eibn4g8CxKmJ47sEPLH06r60Ui3kRIX+N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A67E7F8026D;
	Wed, 29 Sep 2021 07:49:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C84BF80227; Wed, 29 Sep 2021 07:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2BA4F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 07:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BA4F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="YMFeGzLa"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210929054932epoutp0332f4a0f697ccadcd08d6a1fb27b3ca9e~pNPZxWaSW0891008910epoutp033
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 05:49:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210929054932epoutp0332f4a0f697ccadcd08d6a1fb27b3ca9e~pNPZxWaSW0891008910epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632894573;
 bh=ebXDZjnjfx5PMA0E9dVI+5JrhVFNjHxLzCeUiOcb7Zk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=YMFeGzLalWHDIEwvNh+w6UvT3qITOdfCmsuvP/clf4r6juPXR67JwzFWmtjSIYU79
 Bxzf+KhChCZyBaReF8HZStzNqEdKyoQx7mKqyi7atB1qnbAqoMWk7pbsPiXHjJrxRW
 VPF7lBnDArMyh/PIf92pkbxc9qqI6SkMwDXhorZI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20210929054932epcas2p4a530f13c6c88e72b30bfbf83062fa3fc~pNPZHG65s1157711577epcas2p4y;
 Wed, 29 Sep 2021 05:49:32 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4HK56Z6S1Yz4x9Q2; Wed, 29 Sep
 2021 05:49:26 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 81.92.09816.26EF3516; Wed, 29 Sep 2021 14:49:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa~pNPPPbRzT1077810778epcas2p2F;
 Wed, 29 Sep 2021 05:49:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210929054921epsmtrp10c3a24954d2f325ae2a0a2e775846b9d~pNPPOrZZ62592725927epsmtrp1J;
 Wed, 29 Sep 2021 05:49:21 +0000 (GMT)
X-AuditID: b6c32a46-63bff70000002658-0d-6153fe62ad32
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.C2.09091.16EF3516; Wed, 29 Sep 2021 14:49:21 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210929054921epsmtip2c0003f42b8b1260ba035ce21e2f4e0a9~pNPPEHFqU2307723077epsmtip2d;
 Wed, 29 Sep 2021 05:49:21 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
In-Reply-To: 
Subject: [PATCH] ASoC: dpcm: fix race condition to dpcm links in
 dpcm_be_dai_trigger
Date: Wed, 29 Sep 2021 14:49:21 +0900
Message-ID: <002f01d7b4f5$c030f4a0$4092dde0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdejEkgFBjUqDm9PTG2YZO2ZhzLijAR4yNWQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmhW7Sv+BEg7/zOSyuXDzEZHH3h7nF
 jG3dLBarr25hsvh2pYPJ4ujFxUwWDXeb2S26V51mtZh49zW7xcvNb5gcuDw2fG5i89g56y67
 R9+WVYwem09XB7BEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
 +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
 LbEyNDAwMgUqTMjOmHBrHlPBEbGKB9sb2RoYFwt1MXJySAiYSKz78oO5i5GLQ0hgB6PEjq4b
 bBDOJ0aJxbensEI43xgl5rTOYINpud+3hwkisZdR4v7Xl1DOS0aJf11nWEGq2AR0Jb7cu8MM
 YosIqEg87V0HVsQs8JZRon/qfZYuRg4OTgFeiQn/rEFqhAXCJPrW/mABsVkEVCV2Xt4PNodX
 wFKi+fw5dghbUOLkzCdgNcwC8hLb385hhrhIQeLn02WsELuMJNrP72OCqBGRmN3ZBvachMBS
 Don1x65BNbhINC/ZwQhhC0u8Or6FHcKWknjZ38YO0dDMKPHu7B+oxBRGic5uaJAZS2yZe4oJ
 5AFmAU2J9bv0QUwJAWWJI7egbuOT6Dj8lx0izCvR0QbVqCSx8dQ/JoiwhMS8DewTGJVmIXls
 FpLHZiF5YBbCqgWMLKsYxVILinPTU4uNCozgkZ2cn7uJEZxUtdx2ME55+0HvECMTB+MhRgkO
 ZiUR3h/iwYlCvCmJlVWpRfnxRaU5qcWHGE2BQT2RWUo0OR+Y1vNK4g1NLA1MzMwMzY1MDcyV
 xHnn/nNKFBJITyxJzU5NLUgtgulj4uCUamCytYyObdbnyRZkSav3EcpNkIj+r2S6T9VmwyF5
 2VUT5hy6EyB8yUaNa1fz/sC7h3s/ZO8LFP2TuYXDYgW3e4T3yxMWQbaXZZ8ddlsUx7zmdf13
 HyfG6+tyWS/VssYaxhsp9Jx3rPf68nFp19Q9CSf2mu9Kf230bdH5l3nX+cwt6s51fi2U3Pon
 ca3cn0V97GWNx5N/M2xWztv4zqondGfd4fPno4/syT5/iovrafPp+77ZoqX5Mzm3O3+IWGip
 tO+r8oupOhYFllkPp86otJCcc3E/t3nYSZH9YnyHw366q7yYNFvm/gO19zs2b32TwGu/llnr
 b3DWj2P/3iZMWh9waqml+pxMZl/+3ydd3n5WYinOSDTUYi4qTgQACwHjiTMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXjfxX3CiwfkjyhZXLh5isrj7w9xi
 xrZuFovVV7cwWXy70sFkcfTiYiaLhrvN7Bbdq06zWky8+5rd4uXmN0wOXB4bPjexeeycdZfd
 o2/LKkaPzaerA1iiuGxSUnMyy1KL9O0SuDIm3JrHVHBErOLB9ka2BsbFQl2MnBwSAiYS9/v2
 MHUxcnEICexmlHh56z8TREJC4sP8M+wQtrDE/ZYjrCC2kMBzRolJl/lAbDYBXYkv9+4wg9gi
 AioST3vXgQ1iFvjOKLHoz0+oBh6JVxv2M3YxcnBwCvBKTPhnDWIKC4RITHnKAlLBIqAqsfPy
 frBqXgFLiebz59ghbEGJkzOfsICUMwvoSbRtZAQJMwvIS2x/O4cZ4jIFiZ9Pl7FCXGAk0X5+
 HxNEjYjE7M425gmMwrOQTJqFMGkWkkmzkHQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeu
 l5yfu4kRHFlamjsYt6/6oHeIkYmD8RCjBAezkgjvD/HgRCHelMTKqtSi/Pii0pzU4kOM0hws
 SuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYBDZnv9b1655aVveYab3086Vpbi52AWoJq14m
 Lpc9wm+efa19+0eB1O1Fosviil46NRWxLt1w7RvfasYj2zQtTaR6I64smTP3kVGj+exqiWNG
 qwXS9r0UyQ70CZn7cM9llpcBvoffLSqvyw8uVHt/+dxcn9JTCUll9/5IxLxcI6W5UU1Qr7bn
 Vr5ChaBcf92VNV9PVJzXWs5QY+85qXxmsYa5u9Ka4OMn5B5/Xsp/6VJUPcf5v/pvSzgO3Ak4
 KM/ZysyZE7aOk1Ml01t7q2rAYgEe1W6+a5dXnZ+7KPniGf2ldV5ZadJ2z7k2Xz3x9tQlNT17
 /aTNPqr333QzXj3lEffvreR51sNbT7x+6DRTiaU4I9FQi7moOBEA19l9ohsDAAA=
X-CMS-MailID: 20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa
References: <CGME20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa@epcas2p2.samsung.com>
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


