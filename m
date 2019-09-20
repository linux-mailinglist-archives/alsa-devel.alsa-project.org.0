Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A77B9067
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34B9166F;
	Fri, 20 Sep 2019 15:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34B9166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568985038;
	bh=dwMvrwDpUBlksOBRZdp1yfZL2P701O6KOIfR2q8dyCU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeiJ4dBUvpQkWM5kKliKSQ1DatQy+xMcsNK7NbFDS98jVMAYmj2QqYXCSR6bjiIve
	 ZKLdGR4EyOgBeMGd9yRgn6KvDYniOZUQtLKItexhOttdQyZnO2IHnIpqFkUpeWdaNn
	 vME/oLEhP7/zipbJmWjmM2nCwOxV5mWl0Ylj9u+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5711F8067B;
	Fri, 20 Sep 2019 15:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7551F80678; Fri, 20 Sep 2019 15:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DE53F80674
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE53F80674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ubMgNsHA"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130325euoutp02de2c3b40c2b193df71a3140fe49bcfe4~GJy99yGAN2404424044euoutp02k
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:03:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190920130325euoutp02de2c3b40c2b193df71a3140fe49bcfe4~GJy99yGAN2404424044euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984605;
 bh=6Pr3bvlwTEEuaJryJIjyun0TpsiDiHDMaMQxx7hutTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ubMgNsHARLMq1TeGGWcA+08NV7BWgfXB58Pll3imGPzTllhXVFCsaU9V6SnZ3MQub
 8qc+B6C+GmTdlCueYGuSoKPzv3P1H3GaQTKDUlpRWhOUp/5IT7ZgmKwKT/mWzZ8BXu
 XsP0v/NDoGDJjACX4uTZY7AQXEsczYCixit7Evvo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130324eucas1p2026e88c13bccc5334aa475f44156ae9a~GJy9YmXuM1572315723eucas1p2Y;
 Fri, 20 Sep 2019 13:03:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 57.DB.04309.B1EC48D5; Fri, 20
 Sep 2019 14:03:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4~GJy8Pm_q91587515875eucas1p2n;
 Fri, 20 Sep 2019 13:03:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190920130322eusmtrp18133960dcc519cdf00c91349b024d1ed~GJy7_A22n0476604766eusmtrp1j;
 Fri, 20 Sep 2019 13:03:22 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-fa-5d84ce1bac4a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.11.04117.A1EC48D5; Fri, 20
 Sep 2019 14:03:22 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130322eusmtip22fb2f23f6afc2355304e5de35b82149b~GJy7UlkfU1284812848eusmtip2f;
 Fri, 20 Sep 2019 13:03:22 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:02:17 +0200
Message-Id: <20190920130218.32690-9-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHe89l5zidnqbim0bGNEvBWyWdUCKpYF+CPpYXaupBpW3ajloW
 qJmmeWtoMVHDUd6amDZ1lWGTeVl4m6MhkpqXBLPSAq3UQvN4tL79nv/z/7/Pw8NLouJ63J1M
 VKYwKqVMLhEIMUPfmsXfYzgnOmhplaZtVhNCPy9vxumHM3MC2parB3R1zzBOWywtBP3Tlo/Q
 +o+jOF1ueYPQTT2TBL38zYjTuZ09BN39NQ+nrQ0ryGlHactytkD6qmKSkOp19wTS1ppMqaZq
 E0hL2nRAuqw/cIGIEIbFMfLENEYVeOqKMKG/rBAkz4hvmNoWkSww7VQA7EhIHYfZxlqMYzHV
 AKDul6QACLd4BcDR8nWML5YBrNT2CXYTU+1tOJ+oB3Bx0PdfYmOiHeEaAioYFveWAI5dqMNw
 qjwb50wotYBAde+zbZMzdQZ+erBKFACSxKhD8N3a9gARFQo7520EP8wTNrZ0oRzbUWFwYewx
 wr0DKQMBX2wOAd50FlbOzO9s5ww/m9t2wvvhQFkRxgfuAFj0epzgCzWAU2btTjoUdputOLcF
 SvnC5o5AXg6HS9UWhJMh5QjHFvdyMrqFpQYNyssimH9XzLu94W+dBuHZHRbObWI8S+FanRnn
 D3QfwLmBdYEaeFb8H6YFQAfcmFRWEc+wR5XM9QBWpmBTlfEBsUkKPdj6PgMb5pWXoONPjAlQ
 JJA4iLRvc6LFuCyNTVeYACRRiYuoKiQ7WiyKk6XfZFRJl1WpcoY1AQ8Sk7iJbu2ZjhRT8bIU
 5irDJDOq3S5C2rlngUvekZagifovXn6Z+zzEyWhTl6GOPTcodwrOGE54umqMcbDqNImufobI
 wSMjj/KcvN7P9tcpjQarfCXKtarhRO3F8Wtlx2wZtWEK7dDtH9/9o4oLfTyLMkcE9t20/YSx
 dBhz8iw2h8QKK8LPq2Z91I0bT5CaIeXBiJPTH8ZagyQYmyAL9kNVrOwvfUZ2BjoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4PV2pcy2xBhPvWVpcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 OPymndXi4oovTA58Hhs+N7F57Jx1l91j06pONo/NS+o9ps/5z+jRt2UVo8fnTXIB7FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GacmdzMWPBSq
 OLTlLVMD4wP+LkZODgkBE4n7W7ewdjFycQgJLGWUWLvkIUsXIwdQQkpifosSRI2wxJ9rXWwQ
 NZ8YJfaeWcAMkmATMJToPdrHCGKLCGhKdMy7DTaIWeA7k8SBxyfBioQFnCVeTPnBDjKURUBV
 4vJPNpAwr4C1xN7nV9ghFshLrN5wAKycU8BG4uWNRUwgthBQzel9e9knMPItYGRYxSiSWlqc
 m55bbKRXnJhbXJqXrpecn7uJERgL24793LKDsetd8CFGAQ5GJR5ej2MtsUKsiWXFlbmHGCU4
 mJVEeOeYNsUK8aYkVlalFuXHF5XmpBYfYjQFumkis5Rocj4wTvNK4g1NDc0tLA3Njc2NzSyU
 xHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDGXkt1fTIv2cpUc+FjR9OdYlP+yVUVrr1Ut2BN
 aPf2o/wF9a/3i7ds57ereF5oUjDDnVPdNXJa3JcDJWuPT1c+OlVoJecklZPpvy8+fsm8R9Gs
 p/fa5r72nxuMGS4/0HiiWOC333yXsM1Myz0c0219DOfM/PNha3ySxe/XRT+q11atXvtwxXVH
 JZbijERDLeai4kQA4wv62JsCAAA=
X-CMS-MailID: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
X-Msg-Generator: CA
X-RootMTR: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 08/10] ASoC: samsung: Rename Arndale card
	driver
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

Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
than RT5631.  While at it replace spaces in Kconfig with tabs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - new patch.
---
 sound/soc/samsung/Kconfig                         | 10 +++++-----
 sound/soc/samsung/Makefile                        |  4 ++--
 sound/soc/samsung/{arndale_rt5631.c => arndale.c} |  0
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename sound/soc/samsung/{arndale_rt5631.c => arndale.c} (100%)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 6803cbfa9e46..1a0b163ca47b 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -194,11 +194,11 @@ config SND_SOC_ODROID
 	help
 	  Say Y here to enable audio support for the Odroid XU3/XU4.
 
-config SND_SOC_ARNDALE_RT5631_ALC5631
-        tristate "Audio support for RT5631(ALC5631) on Arndale Board"
-        depends on I2C
-        select SND_SAMSUNG_I2S
-        select SND_SOC_RT5631
+config SND_SOC_ARNDALE
+	tristate "Audio support for Arndale Board"
+	depends on I2C
+	select SND_SAMSUNG_I2S
+	select SND_SOC_RT5631
 	select MFD_WM8994
 	select SND_SOC_WM8994
 
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index c3b76035f69c..8f5dfe20b9f1 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -39,7 +39,7 @@ snd-soc-lowland-objs := lowland.o
 snd-soc-littlemill-objs := littlemill.o
 snd-soc-bells-objs := bells.o
 snd-soc-odroid-objs := odroid.o
-snd-soc-arndale-rt5631-objs := arndale_rt5631.o
+snd-soc-arndale-objs := arndale.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
@@ -62,5 +62,5 @@ obj-$(CONFIG_SND_SOC_LOWLAND) += snd-soc-lowland.o
 obj-$(CONFIG_SND_SOC_LITTLEMILL) += snd-soc-littlemill.o
 obj-$(CONFIG_SND_SOC_BELLS) += snd-soc-bells.o
 obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
-obj-$(CONFIG_SND_SOC_ARNDALE_RT5631_ALC5631) += snd-soc-arndale-rt5631.o
+obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale.c
similarity index 100%
rename from sound/soc/samsung/arndale_rt5631.c
rename to sound/soc/samsung/arndale.c
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
