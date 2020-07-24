Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98722F5CF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 18:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C828616A1;
	Mon, 27 Jul 2020 18:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C828616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595868684;
	bh=GbllB7btzt7m3Qf94DyA8YQbGw1tjJowCf48jzqE/FI=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Z4zoLAULhGMRrTJVkLHuqOjHzDjxRrvtOI9UqDgBzTG2LK5BsH8WGtq6ISxthn+Sl
	 3I2htf4L/oFni3fOBgAEZ7owDqlo+6i3gZ/0rDqxD2/sSH0r7uOQEDNjrEp6k8kwSk
	 BNeLjJZjbTwKXaHL+Ac3cDYel9YLJEm2QgwMnvXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DACCBF801D9;
	Mon, 27 Jul 2020 18:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C147BF8014C; Fri, 24 Jul 2020 06:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4814BF800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 06:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4814BF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ErU03+q+"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200724041807epoutp03d4fccb068767d12846f589c0daa8e001~klUQek-DN0504305043epoutp03_
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:18:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200724041807epoutp03d4fccb068767d12846f589c0daa8e001~klUQek-DN0504305043epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595564287;
 bh=Bcj5xU512lG3Jg4M6ae1RTqTDaY0IYtJZcjje5G2dCQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ErU03+q+cvx2ZrVjmMxNnfqXYhkhEXcb28XA3WGLnFVtVg14miGhyI/ZbKJLVdCwD
 ScrShZYE20ac4LJQLUNE0z3JqYq+zrwqRYv9kungDf1eAhk/odxHmqySC2i7lN35hz
 DJBYNZLGH81zOh9+//caP2PoY8LwzClmH2PgRSlQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200724041807epcas1p365884c8e76638db4c472a3f30288add4~klUQERKvQ3009530095epcas1p3_;
 Fri, 24 Jul 2020 04:18:07 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BCbXY3txPzMqYl0; Fri, 24 Jul
 2020 04:18:05 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 39.34.19033.9F06A1F5; Fri, 24 Jul 2020 13:18:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200724041800epcas1p278804da75ff7212de2004577df8d6e63~klUJiKUyK1986419864epcas1p22;
 Fri, 24 Jul 2020 04:18:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200724041800epsmtrp17d7d51409e929d4d4323eb5700fa4846~klUJhYVf30977209772epsmtrp1a;
 Fri, 24 Jul 2020 04:18:00 +0000 (GMT)
X-AuditID: b6c32a36-16fff70000004a59-d6-5f1a60f96fe6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.87.08303.8F06A1F5; Fri, 24 Jul 2020 13:18:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200724041800epsmtip2a95b908969708d22b902baf4b0126676~klUJSiXIa1612116121epsmtip2V;
 Fri, 24 Jul 2020 04:18:00 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: alsa-devel@alsa-project.org, linux-rpi-kernel@lists.infradead.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, nsaenzjulienne@suse.de
Subject: [PATCH] ASoC: bcm2835: Silence clk_get() error on -EPROBE_DEFER
Date: Fri, 24 Jul 2020 13:19:31 +0900
Message-Id: <1595564371-13692-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdlhTX/dnglS8QeMEMYsrFw8xWaztPcpi
 MfXhEzaLX++OsFvc+NXGavHtSgeTxcTbG9gtts1azmbRuauf1eLpzM1sFu9WP2G0mDH5JZvF
 hu9rGR14PTZ8bmLzmHX/LJvHzll32T02repk89i8pN5j39tlbB59W1YxeqzfcpXFY/Pp6gDO
 qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKC7lRTK
 EnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFlgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZ
 GQ2rdjIWLGGv+DLzOnMD43/WLkZODgkBE4n5W7+ygNhCAjsYJZ7stOli5AKyPzFK3L7WyQLh
 fGaU+H3uGjNMx+YPlxghErsYJTbfWgRV9YVRYsrhW2Bz2QR0JPYv+c0KkhARmMwksbB7J9gS
 ZgEjiS3nNzGB2MICHhIn97YDjeXgYBFQldj+ygMkzCvgJrHw/lSo+xQkFtx7ywYyR0LgK7vE
 l+3N7BAJF4m3HXOZIGxhiVfHt0DFpSRe9rdB2dUS2yf8ZIdo7mCU6GlvZIFIGEvsXzqZCWQx
 s4CmxPpd+hBhRYmdv+cyQtzJJ/Huaw8rSImEAK9ER5sQRImKxM6jk9ggwlISszYEQ4Q9JNYe
 ameEBGOsxKKetWwTGGVnIcxfwMi4ilEstaA4Nz212LDACDmSNjGCk6KW2Q7GSW8/6B1iZOJg
 PMQowcGsJMKrwygeL8SbklhZlVqUH19UmpNafIjRFBhcE5mlRJPzgWk5ryTe0NTI2NjYwsTQ
 zNTQUEmc999Z9nghgfTEktTs1NSC1CKYPiYOTqkGplk/7pXdS1toy7Hr/DOv7Ksn7y1bO3cV
 h+Ehj53s1TXKtqtNdjR/aH13NuHKx+U35h+xfjYzaGfL0QO/ms27WXplOMT4RF/dEIzJLJCf
 k17P4XIxu1Z9pdbSuE0my5eoRZh89IzwU559SVCZ8Z+Jd9SWX4+mVu70lamSvyLpJjarcGfB
 5xNyG0zu3gv98feJPcPKMJ32UJnmokiBfx8UwvtT6q58LuQ1aUzUF0xP+fOlSzX56Xwfsy+Z
 PQrCYk8+SIVP3jNP4s2v8537A2J7ahUe+oc9YRD3yWjK1XKOnv1VZ1m13eHdZ323eHg9Paq1
 8cCi+5fl12R1Gzw+dYPj8SuBT7Pns7du9e3+9jH4khJLcUaioRZzUXEiAERuX/MTBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvO6PBKl4gx1b+CyuXDzEZLG29yiL
 xdSHT9gsfr07wm5x41cbq8W3Kx1MFhNvb2C32DZrOZtF565+VounMzezWbxb/YTRYsbkl2wW
 G76vZXTg9djwuYnNY9b9s2weO2fdZffYtKqTzWPzknqPfW+XsXn0bVnF6LF+y1UWj82nqwM4
 o7hsUlJzMstSi/TtErgyGlbtZCxYwl7xZeZ15gbG/6xdjJwcEgImEps/XGLsYuTiEBLYwSgx
 /8tSRoiElMTcb9uBbA4gW1ji8OFiiJpPjBK7/+wAa2YT0JHYv+Q3mC0isJBJovmJI4jNDDR0
 9e02JhBbWMBD4uTedmaQOSwCqhLbX3mAhHkF3CQW3p8KdYOCxIJ7b9kmMPIsYGRYxSiZWlCc
 m55bbFhglJdarlecmFtcmpeul5yfu4kRHKRaWjsY96z6oHeIkYmD8RCjBAezkgivDqN4vBBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXHer7MWxgkJpCeWpGanphakFsFkmTg4pRqYbK0fH2t9tTZD
 XvuJTqCb+G47TUu5Hs2ZbJv+CWl2RJUyPls8cYniQb5AvTy17bNOBiu9zxfcp7vHLnx7j1R2
 5deC6VP2JwXrd0obLjtdGHPpz4M9M5eUH01QaYtLCoqwThKoNtFd1NsdKrDgz3XJTLZZ/x0m
 u999up35eHXfKgEPq3mqFw1fT9NaP92xQ2vFxeXKbH9611Xk2O4q0A/5fiGYfdqRfYX1yRNK
 dy1a86S85frkpzdveObvvWO/VXlK0sGLL2b8kosRY2JzCtT2U2+0nF6oqpe3Km6nbeptP+Hp
 PJN+dG1xO76mat7rHV1lAoLfZ20s/lNoOdPFZa6mwv+F02etsotn7+mplRFWYinOSDTUYi4q
 TgQADLNoO8ECAAA=
X-CMS-MailID: 20200724041800epcas1p278804da75ff7212de2004577df8d6e63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200724041800epcas1p278804da75ff7212de2004577df8d6e63
References: <CGME20200724041800epcas1p278804da75ff7212de2004577df8d6e63@epcas1p2.samsung.com>
X-Mailman-Approved-At: Mon, 27 Jul 2020 18:49:41 +0200
Cc: jh80.chung@samsung.com, sw0312.kim@samsung.com
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

Silence clk_get() error with dev_dbg() on -EPROBE_DEFER.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 sound/soc/bcm/bcm2835-i2s.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index d80b570..dc34fe1 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -841,9 +841,12 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	dev->clk_prepared = false;
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "could not get clk: %ld\n",
-			PTR_ERR(dev->clk));
-		return PTR_ERR(dev->clk);
+		ret = PTR_ERR(dev->clk);
+		if (ret == -EPROBE_DEFER)
+			dev_dbg(&pdev->dev, "could not get clk: %d\n", ret);
+		else
+			dev_err(&pdev->dev, "could not get clk: %d\n", ret);
+		return ret;
 	}
 
 	/* Request ioarea */
-- 
1.7.4.1

