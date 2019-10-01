Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582B3C3472
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50F6167E;
	Tue,  1 Oct 2019 14:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50F6167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569933558;
	bh=dwMvrwDpUBlksOBRZdp1yfZL2P701O6KOIfR2q8dyCU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R8rIUkvZjJg36VQddOmzPh1sWI1GNjdywK+FpMVPbL8WeD7scA9YrOgFQaS390+5K
	 s06bD/7IuiSkoVF5jLioZpc6q243nQmvKqxlq8lpuuKJL8PrJotPhgdOtEBsUvU1if
	 SWFSS/DYQLWLTACbcEF5wxptAQPqJnf1W38dw3bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FDBF805E1;
	Tue,  1 Oct 2019 14:36:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE51F80482; Tue,  1 Oct 2019 14:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B656F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 14:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B656F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="VEhDDGOA"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191001123641euoutp01781401e0b8026153afd789eb8f0dddbd~JhhxNmnEv1111811118euoutp01X
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 12:36:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191001123641euoutp01781401e0b8026153afd789eb8f0dddbd~JhhxNmnEv1111811118euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569933401;
 bh=6Pr3bvlwTEEuaJryJIjyun0TpsiDiHDMaMQxx7hutTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VEhDDGOAJcXcLxe+oLqmkUtIfGibVYCn3SHrBjdPXiXV+lZJCqaxqCPyQD0RyzVb2
 X7kuz057tW+timTJgXhB65EyIyVIUNe+pT6FEba50Cye6I6A4ep8A9ljJjt6WDWBo0
 Z/5EtmEGZZSVpwgVRPulBlBw+XW01xfcZg89oBhw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191001123640eucas1p20b765903788d7e533396cf28af66f0f2~Jhhw8BUhk0767207672eucas1p28;
 Tue,  1 Oct 2019 12:36:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A5.33.04374.858439D5; Tue,  1
 Oct 2019 13:36:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628~JhhwqTg3E0566705667eucas1p2K;
 Tue,  1 Oct 2019 12:36:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191001123640eusmtrp108eb05d1591c62afe095edda02189ddf~Jhhwpo-zP0390803908eusmtrp1P;
 Tue,  1 Oct 2019 12:36:40 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-be-5d934858d106
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.33.04117.858439D5; Tue,  1
 Oct 2019 13:36:40 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191001123640eusmtip25fdf9f8993637bb262eebb300b1dd1a5~JhhwEfYGH1272012720eusmtip2i;
 Tue,  1 Oct 2019 12:36:39 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Tue,  1 Oct 2019 14:36:25 +0200
Message-Id: <20191001123625.19370-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001123625.19370-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+85lO1ueOk7JL7OkpZRCXjLihNIFw47/xP4Iisxq5Ulnbsrm
 JY1ILC9NU1Nqy5Q0ZtnUnJuKZllMc5DV0LS0EF0KZiYDp0klmdtR+u/3PM/78L58fAQqqsS9
 CZkilVUqpElinhBr6/31fvdJpjw2ZHpqHz3Yb0boZm0TTt+xTfLowVwjoK1WA5/+OViA0MaJ
 jzittXYhdGPPKJ922F/idPePfJzur5tHDrkxBkcOj+moGOUzRv1NHmPSXWM0lcuAKW7RA8Zh
 3CbhnxJGxLFJsnRWGXzgnDDhTXkhSLGJLptbZpFsML5RDQQEpPZC63Q9Tw2EhIiqA9Dc3bUq
 5gGs6elBOOEA0GjUgLXKk7d3MS54DOCCYYbnDFyVkqciJ/OoUHjrdbGr4EnthGPaHNxZQKkO
 BH4dGsOcgQfFwPxPcy7GKH9Ya83GnUxS4dA2N4xx23xhveEVqgYEIaAiYIFewNmP+HBAd4zj
 I9D2rX31OA/43dLC59gH9pUXuQ6F1HUAizq/8DlRCuCYpXq1EQ67Lf24cwFKBcCmZ8GcfRh2
 PLcjThtSG+DwrLvTRlewrE2DcjYJC/JE3LQf/KPXIBx7w8LJZYwbYWDvvQzuqUoA1FXp+KXA
 t+L/rmoA9MCLTVPJ41lVmILNCFJJ5ao0RXzQhWS5Eaz8mb6/loV20LV03gwoAojdSHrqdqwI
 l6arMuVmAAlU7ElGLJXFisg4aWYWq0w+q0xLYlVmsIXAxF7klXXjMSIqXprKXmLZFFa5liKE
 wDsbSELco37nHR9wJwNytye/aMjCpurFHyYSvBKx2hOF8vGaeptpz6bGKrt4UfaQIWdkiRlZ
 pzc3fE4IGzbFPNhlUSOsRCLY0XoGOVjeOsprXh8dRXZuNeWH40fDyEXPG6iPn+ni/c7IIXmd
 ttY/sFe+/133yEJAdKTWXjGiuZomxlQJ0tBAVKmS/gOln6FGLwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsVy+t/xe7oRHpNjDaZOVLS4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VovDb9pZLS6u+MLk
 wOOx4XMTm8fOWXfZPTat6mTz2Lyk3mP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsU
 bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxanI3Y8FDoYpDW94yNTA+4O9i
 5OSQEDCRWHlmGksXIxeHkMBSRolfX2YxdjFyACWkJOa3KEHUCEv8udbFBmILCXxiBHJcQWw2
 AUOJ3qN9jCC2iICmRMe826wgc5gFDjNJLO44yAKSEBbwkGi//gnMZhFQlVh6voEVxOYVsJZ4
 +OkGC8QCeYnVGw4wg+zlFLCR6FjFCbHLWqLl6xrGCYx8CxgZVjGKpJYW56bnFhvpFSfmFpfm
 pesl5+duYgQG/bZjP7fsYOx6F3yIUYCDUYmH1+L5xFgh1sSy4srcQ4wSHMxKIrw2fybFCvGm
 JFZWpRblxxeV5qQWH2I0BbppIrOUaHI+MCLzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
 pGanphakFsH0MXFwSjUw7pl0b+vCKWH5Zf7ea+XMe3Yqei/lZFtyJ8D83Jwfl7WfMR1y7v9l
 ljn/zpoVAelVjdemLNUtW///SFLX+t0Mnq21q44FSPxjatVSDdo5bc8PLoaY+fkvDh00+afc
 m9agN7FtzeMdai93KDht2BKgdujlT64JlnnlAtdr/mimn+sRTZH6tPWFqBJLcUaioRZzUXEi
 AJfY47SQAgAA
X-CMS-MailID: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
X-Msg-Generator: CA
X-RootMTR: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
 <CGME20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628@eucas1p2.samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v3 RESEND 3/3] ASoC: samsung: Rename Arndale
	card driver
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
