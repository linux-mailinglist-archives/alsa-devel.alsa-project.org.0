Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA2B61D3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59509167C;
	Wed, 18 Sep 2019 12:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59509167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568803842;
	bh=CiZ5eBK3zugLlSPvRyEqi9UTUIi22cObJaqc8iYsKl4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXZaumimfee1N8AmpbkOefHMpPG5HSoOJsZaL3dL38KgH69PsW0ci9rXmf3h0AkWX
	 9X2PiIP6zjcqc0JRfFhbkwpstb/1PF5nOcJyQi9J82wQtIeGajFhr9DmQ19vppaEEB
	 /qpJTSKC891JndtIzf6q1Khh/WFDxvIlWRmckst0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D085F80612;
	Wed, 18 Sep 2019 12:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2399DF800C1; Wed, 18 Sep 2019 12:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31C9FF80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C9FF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="CTrkaf5I"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918104700euoutp02a92a803ff4eb03b07b9a00e3c7b15999~FgpSfHetb3079330793euoutp021
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190918104700euoutp02a92a803ff4eb03b07b9a00e3c7b15999~FgpSfHetb3079330793euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568803620;
 bh=jo8NfcFsM8ji+aA0mcIGGdLDNGkm0zm4tpKoJrabSrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CTrkaf5I2LFLe+b0XBhJjavasYCLap3TqC3EL56dXR0IdTy270pElDrT8PDZMVWfu
 nlzhs0ZsvIIFoZ/ujrIULQeWc+H7pSZZC0awRWJ749YTBtI18KL0msSr+G3oukWkK4
 xoUjO8ewVLfyOjwxaC3FMxInN0XkGGE9EXH37zG8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190918104659eucas1p268d83ad670640425cfc782c6a87e1dda~FgpSDt1CI2378523785eucas1p2Q;
 Wed, 18 Sep 2019 10:46:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D3.B4.04309.32B028D5; Wed, 18
 Sep 2019 11:46:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0~FgpRPSm0y2379323793eucas1p2S;
 Wed, 18 Sep 2019 10:46:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918104658eusmtrp251a8c7bd204d9283fc9fada0282614bd~FgpQ-n90U1555615556eusmtrp2V;
 Wed, 18 Sep 2019 10:46:58 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-0b-5d820b23ff2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.2C.04117.22B028D5; Wed, 18
 Sep 2019 11:46:58 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104657eusmtip1bc8fbffa86f46a4eab0e900e30467598~FgpQVzh8b0585005850eusmtip1H;
 Wed, 18 Sep 2019 10:46:57 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed, 18 Sep 2019 12:46:28 +0200
Message-Id: <20190918104634.15216-4-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSXUgUYRSG/WZ2dkZzbHaUPJhobUkU5E91MaCUWheDZAne9KPllpNK/rWj
 VlYomvlTamm2JoZl4aqR2mpLa1TLqi0luG1toqlkJl1YYrVaRpq5jtXde573fTnng4/CWS3h
 RSWlZgjqVFWyUu4i0z/72bd53Yq82EDTFZazWU0Yd7+6leCq3o/LOVuBDnF13X0EZ7G0kdx3
 WxHG6T70E1y15QnG3eseITn71FOCK3jcTXJdnwsJzto4jYW68W32PDlvqBkheV1zsZxvv5PD
 a2oXEF/W0Yx4u84nijzgEhIvJCdlCeqA7XEuiU97+8j0MsUpfZse5aIvdAlypoDZBqW2T7IS
 5EKxTCOCyvwWuTRMI/gyN0VIgx2BXTuL/la0PfO4ZGgRGM1j6F+laqCdcKTkTBCU9pQtNTyY
 VTBUW7zUwJk5DCbna2QOw52JgtcTRqwEUZSM8YNym68D00wwXB3OxaVtvnC3zbiknZkQ+PZy
 dOlYYPQkWAw3ZFJoFwzVW5a1O0yYO0hJe8OCoQ6TCvkILj0aIqXhMoJ35pvLDwqGLrOVcFyB
 MxuhtTNAwmFQOmeTOzAwbjAwqXBgfFFW6DW4hGkousBK6fXwq1mDSdoLLo4vyKQIDw9mwIFZ
 phzBzMipy8i35v+qmwg1I08hU0xJEMQtqcJJf1GVImamJvgfTUvRocXv0/vbPP0Qdc4dMSGG
 QkpX2vgiN5YlVFni6RQTAgpXetBR53JiWTpedTpbUKcdVmcmC6IJraZkSk/6jNPoQZZJUGUI
 xwUhXVD/dTHK2SsX1YW+6Q3spOsPJQa3aCfYylvPLbTr+ahhS3b4NfvbmPIdVdbo8Mi4MxWR
 Tla1vdBPuO0T16BZSwS++jpWP73ybPHOfU2uEQ2zx0Tznu7q0WFN9e6c99Gd+2MVW78p9m4z
 dGFho8cjBme949fHGK6PDP5QzPPPT2zob4qP5oyNaz4qZWKiKmgTrhZVfwC7XBIZOgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV0l7qZYg6uTRS2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
 0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jP2nz7EX9AlW
 bNuwjbGB8QNvFyMnh4SAicTyo3+Zuxi5OIQEljJKPNqzga2LkQMoISUxv0UJokZY4s+1LjaI
 mk+MEtPXTmEHSbAJGEr0Hu1jBLFFBMQkbs/pBBvELNDFLPF+xy9WkISwgJ9E87QHjCBDWQRU
 JfqvyIOEeQWsJabcaWCGWCAvsXrDATCbU8BG4tOFBywgthBQzYJj0xgnMPItYGRYxSiSWlqc
 m55bbKRXnJhbXJqXrpecn7uJERgL24793LKDsetd8CFGAQ5GJR5eibMNsUKsiWXFlbmHGCU4
 mJVEeANq62OFeFMSK6tSi/Lji0pzUosPMZoC3TSRWUo0OR8Yp3kl8YamhuYWlobmxubGZhZK
 4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgVaiceVbvDaNek5n3E5zFbjaWdmN51/UU/o6sE
 ZFX/1uza2ry1JX+up8u5XfOO6i2y5DhRZjdpluqcC7t2rG9gV9zZyPm0vCtvVu9c/9/97fKs
 JoE+547wXf95lZFrwXNHe3+/CxwiUulKhp/W7xXo/z6f+0qGGaeFDouo/cxfxre9UkPWKCix
 FGckGmoxFxUnAgAmziw7mwIAAA==
X-CMS-MailID: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
X-Msg-Generator: CA
X-RootMTR: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v1 3/9] ASoC: wm8994: Add support for setting
 MCLKn clock rate
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
MCLK2 clocks through clk API when those clocks are specified in DT for
the device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index d5fb7f5dd551..b6b0842ae1fc 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2372,12 +2372,30 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	struct wm8994 *control = wm8994->wm8994;
+	int ret;
+
+	if (!control->mclk[id].clk || *freq == wm8994->mclk[id])
+		return 0;
+
+	ret = clk_set_rate(control->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(control->mclk[id].clk);
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
@@ -2392,6 +2410,11 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
 		wm8994->mclk[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
@@ -2400,6 +2423,11 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
 		wm8994->mclk[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
