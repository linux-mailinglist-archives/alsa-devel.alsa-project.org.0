Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A8B9051
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092B61685;
	Fri, 20 Sep 2019 15:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092B61685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568984782;
	bh=4cetaVtt8JpyyFH/3mSBs9X96CX971bwQxW8AfxULpI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwdVx0I0wzogVxnlTWWfT3xoKOL6ziXLmYiTQaD/X2twIy/7VeK9ojhzN7++gPE0H
	 RYu08+GOyInXnh8CexD+3pEmiyBlOyjCUSk0SR47+fIOQiq5DfdsGQm/5UsDYo4IpO
	 cMmojorUteTfcszQsd8iBnjo4m5SRTB5F8FDtpao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A57F80612;
	Fri, 20 Sep 2019 15:03:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68B90F805FA; Fri, 20 Sep 2019 15:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE532F80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE532F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="TutGf3/z"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130318euoutp019007faac36e454c8cf43c96a65791327~GJy3XXF-a3049230492euoutp01P
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130318euoutp019007faac36e454c8cf43c96a65791327~GJy3XXF-a3049230492euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984598;
 bh=vl5ukbhanInM0ZjlN2586DHL2dhCl7kr3dkl0Go81Z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TutGf3/za4lA3P9uanFGz2tUXD5fekDNIJCtVB/pmEcZ3oL3aR72W/ANzrJLsoo2Q
 QERQfNA7TKpstvAu2CcsJuKU0ey+1uKm1GqzxiMk5g4SqYSL0WckUnC4ANCGarfIt6
 T3Er8u4KQ8nzMt9tULg1cnqBt9TJFe/j5axuxDJs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130317eucas1p2c161f57c15e2a3085af15593dd836914~GJy22549z1573015730eucas1p2O;
 Fri, 20 Sep 2019 13:03:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 46.DC.04469.51EC48D5; Fri, 20
 Sep 2019 14:03:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7~GJy15tgpC1583815838eucas1p2t;
 Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190920130316eusmtrp1397d5d5cc0aae0cfeb1d611957d82cc1~GJy1oE6Nf0476604766eusmtrp1T;
 Fri, 20 Sep 2019 13:03:16 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-5e-5d84ce15a5e4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BB.01.04117.41EC48D5; Fri, 20
 Sep 2019 14:03:16 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130315eusmtip22332a7552dd261f3f1944790f207ef78~GJy07P_Tl1336913369eusmtip2x;
 Fri, 20 Sep 2019 13:03:15 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:12 +0200
Message-Id: <20190920130218.32690-4-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87qi51piDW7sZre4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
 cfhNO6vFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB6bl9R7TJ/zn9Gjb8sqRo/Pm+QC2KO4bFJS
 czLLUov07RK4MmZt+89WcEi54u2GHpYGxm8yXYycHBICJhLzj+1hBbGFBFYwStztc+hi5AKy
 vzBKzN92kQnC+QyUWHSPCaZjctMZdojEckaJJ5ees8O1nNh3mRGkik3AUKL3aB+YLSKgLnF/
 RhMrSBGzwEsmiQlH14GNEhYIlHh/tIEFxGYRUJV4cfUrWJxXwFqi5+pvVoh18hKrNxxgBrE5
 BWwkXt5YBHXGNnaJKYesIGwXib9zfrFA2MISr45vYYewZSROT+5hAVksIdDMKNGz+zY7hDOB
 UeL+8QWMEFXWEoePXwTaxgF0nqbE+l36EGFHifkNs1hAwhICfBI33gqChJmBzEnbpjNDhHkl
 OtqEIKpVJH6vmg51mpRE95P/UOd4SHx6NZ8FEkD9jBJ/fzazTmCUn4WwbAEj4ypG8dTS4tz0
 1GLDvNRyveLE3OLSvHS95PzcTYzA9HP63/FPOxi/Xko6xCjAwajEw+txrCVWiDWxrLgy9xCj
 BAezkgjvHNOmWCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTByc
 Ug2Mq2dvT/J4o7t89dfQd9z/bhZK2Tsbev2yLotJ9HR0E+Gotg2Wkw9OndEjypY+5/zaxoD3
 E9fsDbEO6es+dvoJC2OF6IeZRmumyB3t95LkbJ005Uhgv0CpY0/91MCZ1mYFh2sr2h/M5Jab
 tn+TbdmrIpb/k7KKJxwM4n4cX7DwbqFE9Znf6b+UWIozEg21mIuKEwF7IZvvOwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4PV2Rcy2xBtNusVpcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GbO2/WcrOKRc
 8XZDD0sD4zeZLkZODgkBE4nJTWfYuxi5OIQEljJK/FjRwtzFyAGUkJKY36IEUSMs8edaFxtE
 zSdGiVVdB1lBEmwChhK9R/sYQWwRAU2Jjnm3WUGKmAW+M0kceHySGSQhLOAvcXX7X7AiFgFV
 iRdXvzKB2LwC1hI9V3+zQmyQl1i94QBYPaeAjcTLG4vAaoSAak7v28s+gZFvASPDKkaR1NLi
 3PTcYiO94sTc4tK8dL3k/NxNjMBo2Hbs55YdjF3vgg8xCnAwKvHwehxriRViTSwrrsw9xCjB
 wawkwjvHtClWiDclsbIqtSg/vqg0J7X4EKMp0FETmaVEk/OBkZpXEm9oamhuYWlobmxubGah
 JM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoEx0379qg9lB9/f/PzMa+/OW5d6vxbdYLlyi8Ou
 ZvKDuWoT2RdHbuCQ8Fq063rO+q/9CiuMyxhOP//33Y1ncTAHf8+jXMXwPW5b95xn/nx3e8Zu
 7StLrOPOvdz/T3xd1plMFoOZC/1tzmb+2Kqi58gy9zH/9geGNbKzP5SxT+8xfTVFl7fb58GF
 B0osxRmJhlrMRcWJAFGHBa+cAgAA
X-CMS-MailID: 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7
X-Msg-Generator: CA
X-RootMTR: 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 03/10] ASoC: wm8994: Add support for setting
 MCLK clock rate
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Extend the set_sysclk() handler so we also set frequency of the MCLK1,
MCLK2 clocks through clk API when those clocks are specified in DT.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - getting of clocks moved from MFD to the CODEC's driver probe()
---
 sound/soc/codecs/wm8994.c | 48 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8994.h | 10 +++++++-
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index d5fb7f5dd551..f69545dced25 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -167,12 +167,12 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 	switch (wm8994->sysclk[aif]) {
 	case WM8994_SYSCLK_MCLK1:
-		rate = wm8994->mclk[0];
+		rate = wm8994->mclk_rate[0];
 		break;
 
 	case WM8994_SYSCLK_MCLK2:
 		reg1 |= 0x8;
-		rate = wm8994->mclk[1];
+		rate = wm8994->mclk_rate[1];
 		break;
 
 	case WM8994_SYSCLK_FLL1:
@@ -2372,12 +2372,29 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	int ret;
+
+	if (!wm8994->mclk[id].clk || *freq == wm8994->mclk_rate[id])
+		return 0;
+
+	ret = clk_set_rate(wm8994->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(wm8994->mclk[id].clk);
+
+	return 0;
+}
+
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	int i;
+	int ret, i;
 
 	switch (dai->id) {
 	case 1:
@@ -2392,7 +2409,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
-		wm8994->mclk[0] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -2400,7 +2422,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
-		wm8994->mclk[1] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -4456,6 +4483,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 static int wm8994_probe(struct platform_device *pdev)
 {
 	struct wm8994_priv *wm8994;
+	int ret;
 
 	wm8994 = devm_kzalloc(&pdev->dev, sizeof(struct wm8994_priv),
 			      GFP_KERNEL);
@@ -4467,6 +4495,16 @@ static int wm8994_probe(struct platform_device *pdev)
 
 	wm8994->wm8994 = dev_get_drvdata(pdev->dev.parent);
 
+	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
+	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
+
+	ret = devm_clk_bulk_get_optional(pdev->dev.parent, ARRAY_SIZE(wm8994->mclk),
+					 wm8994->mclk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_idle(&pdev->dev);
 
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 1d6f2abe1c11..41c4b126114d 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -6,6 +6,7 @@
 #ifndef _WM8994_H
 #define _WM8994_H
 
+#include <linux/clk.h>
 #include <sound/soc.h>
 #include <linux/firmware.h>
 #include <linux/completion.h>
@@ -14,6 +15,12 @@
 
 #include "wm_hubs.h"
 
+enum {
+	WM8994_MCLK1,
+	WM8994_MCLK2,
+	WM8994_NUM_MCLK
+};
+
 /* Sources for AIF1/2 SYSCLK - use with set_dai_sysclk() */
 #define WM8994_SYSCLK_MCLK1 1
 #define WM8994_SYSCLK_MCLK2 2
@@ -73,9 +80,10 @@ struct wm8994;
 struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
+	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
 	int sysclk[2];
 	int sysclk_rate[2];
-	int mclk[2];
+	int mclk_rate[2];
 	int aifclk[2];
 	int aifdiv[2];
 	int channels[2];
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
