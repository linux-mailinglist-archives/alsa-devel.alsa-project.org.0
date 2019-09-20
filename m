Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3FB9069
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 15:11:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7521C1677;
	Fri, 20 Sep 2019 15:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7521C1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568985089;
	bh=aktp5N47SuO6CTlMayMpU1oFeuqVOlCyRKUY3W5VL58=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LN9QtytkuPK25uwhfIabrU0UYk/CX4l2BVk3aU36PoEC1f0c+0qRlimE6xLo5pras
	 8109l1ip429gUJAQNlJxnEZNEuQNeSb5hrKvBMVzSJJUOyer/t1BDMwdPL/0IVkhyV
	 JnTgGAR/SSCOifrizqDrjK3Bj4pHYzsSPvIQq4Mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C715BF80534;
	Fri, 20 Sep 2019 15:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF44F80527; Fri, 20 Sep 2019 15:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9A5FF804FF
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A5FF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="mhtJSnGD"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920130713euoutp01eed94282da4412476793c053af8a8067~GJ2SOn4n80075000750euoutp01g
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:07:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920130713euoutp01eed94282da4412476793c053af8a8067~GJ2SOn4n80075000750euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568984833;
 bh=RBnORndzl0r5DR9rLoc1/OmKlMa2JITIDuEsjCDUmJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhtJSnGD9ALbAFp6MhBMMaI6gsS1jOMd8H4j+Gi3dpedHWYbq18P+f7B4SLMXKtHi
 qdUNtK/0O5As1V4ID3CsIyjKh6LvB1zIjcCOaI/0mQFLAraGRSX20KqbEgYu2n4sB6
 vbuk8pGZrVUtC0ZqWM2rFF2gKcCFB0JTk2nA3/KM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920130712eucas1p225301468b166f458d2b9fbc914c69e6b~GJ2RtZ7nS0795407954eucas1p2w;
 Fri, 20 Sep 2019 13:07:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.1B.04374.00FC48D5; Fri, 20
 Sep 2019 14:07:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130711eucas1p29497b40981e4e0a24769ced4e06be208~GJ2QyD4141017610176eucas1p2k;
 Fri, 20 Sep 2019 13:07:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920130711eusmtrp21e270937a7a286a63d5c1254caba0674~GJ2QbmfsK1249212492eusmtrp25;
 Fri, 20 Sep 2019 13:07:11 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-02-5d84cf00da5d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6D.91.04117.EFEC48D5; Fri, 20
 Sep 2019 14:07:10 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920130710eusmtip2e93b81b07e4cab6c4af2ada6403edf60~GJ2PvEbAU1601916019eusmtip2X;
 Fri, 20 Sep 2019 13:07:10 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Date: Fri, 20 Sep 2019 15:07:02 +0200
Message-Id: <20190920130702.529-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920130218.32690-2-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfUgTYRz2vdvtbqvJNQVfVmYMJQz8orKLLJJqHBhoRUGJ1WqHWtuUnZpa
 kM2vpaarCEWkiUXKotQp5gdazumSoackIYmZZh+z8iMtiMzlvFn/Pb/f8zy/5+HlJVBpLSYj
 krVpjE6rVMuFYkFL3y8uxIvLSwgfLhZRI8NWhGqsqMeoe5PTQmok3wIok20QoziuAad+jhgQ
 yvL+NUZVcF0I9cQ2jlOLc88xKr/ThlM9XwsxarhuCTnoTTcs6oV0W+U4TlvMN4V008PrdHmV
 C9ClzWZAL1q2xuFnxFEqRp2cwejCDpwXJz2qcuGpnVhmbv8CkgM+CYqAiIDkLrjS1CwsAmJC
 StYBOFbfB/hhCcCy6WUPswjgjVETvm65P9DiIWoB/OwoQf9ZxgxO1K0SkhHwVm8pcGNfcjuc
 qNBjbhFKOhFo7H2KuAkf8ih88NG0eoogBGQQ/F6T5F5LyL1wfqpdyKcFwMcNL9ZuisgoqG/q
 WkuGZAsO5+yznkqHodNShvDYB87Ymz37LdDVZkJ4Qy6AJR1jOD8YAZywVwNetQ/22IcxdwuU
 DIb17WFuCMlo+Gc+iIfecPTbJrcYXYV3WspRfi2BhgIpfyMQ/jaXexrIYPG0S8BLaOhq9eWf
 pwzA3slG3AgCKv9HVQNgBn5MOqtJZNidWuZKKKvUsOnaxNCLKRoLWP0+jhX7j1bQtXzBCkgC
 yDdK6L68BCmmzGCzNFYACVTuK6narU+QSlTKrGxGl3JOl65mWCvYTAjkfpKrXu/ipWSiMo25
 zDCpjG6dRQiRLAfEdx7x9r/bMSC+xMVmWn1Oc+yJN0Wu23H5Z18avjh6Mo6Xa8wd/nsORSkC
 p4audS40M7HZMyGywqGaZT9zZEc0zoUrshTdsWpLcMysf0rMK8184CFVzGCk4UNhwdvkUnFq
 FWlzDW1QMUXR3f3HnA6j37Pg/QpLjL445VTQyW1yAZukjNiB6ljlX3HmpJU6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4Pd1/51piDT7vsbG4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
 cfhNO6vFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB6bl9R7TJ/zn9Gjb8sqRo/Pm+QC2KP0bIry
 S0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MpbN+c9esJe1
 ovnkR6YGxucsXYycHBICJhLzzm5j62Lk4hASWMooMWXbbqYuRg6ghJTE/BYliBphiT/XuqBq
 PjFKHP4xlwkkwSZgKNF7tI8RxBYR0JTomHebFaSIWeA7k8SBxyeZQRLCAj4Si5/NZwMZyiKg
 KvFpUQZImFfAUuLDo11sEAvkJVZvOABWzilgI9G0eR9YXEjAWmLa3BbmCYx8CxgZVjGKpJYW
 56bnFhvpFSfmFpfmpesl5+duYgTGwrZjP7fsYOx6F3yIUYCDUYmH1+NYS6wQa2JZcWXuIUYJ
 DmYlEd45pk2xQrwpiZVVqUX58UWlOanFhxhNgW6ayCwlmpwPjNO8knhDU0NzC0tDc2NzYzML
 JXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2Mh98uE59xquh/8uPNaS4buSdPmXbl3RW12ye1
 nV+9X/D8n4zagUlXpmp+4y9NZfpRW/P1PUvqb+s3e2wUzVNdisu9Ov92al45mlH8zZlPffuD
 KRdfBvAcPhjsaJiinpcSq/F/Z5nZ/V0NF3YGvWqU9MsynBGxKuDOxX4xhwtreRiiwrcfXTw1
 XYmlOCPRUIu5qDgRAFXHQuibAgAA
X-CMS-MailID: 20190920130711eucas1p29497b40981e4e0a24769ced4e06be208
X-Msg-Generator: CA
X-RootMTR: 20190920130711eucas1p29497b40981e4e0a24769ced4e06be208
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130711eucas1p29497b40981e4e0a24769ced4e06be208
References: <20190920130218.32690-2-s.nawrocki@samsung.com>
 <CGME20190920130711eucas1p29497b40981e4e0a24769ced4e06be208@eucas1p2.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 10/10] ARM: exynos_defconfig: Enable Arndale
	audio driver
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

Enable audio driver for Exynos5250 based Arndale boards to improve
testing coverage.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 2e6a863d25aa..8d4d6bb5c47b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -227,6 +227,7 @@ CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=y
 CONFIG_SND_SOC_SMDK_WM8994_PCM=y
 CONFIG_SND_SOC_SNOW=y
 CONFIG_SND_SOC_ODROID=y
+CONFIG_SND_SOC_ARNDALE=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
