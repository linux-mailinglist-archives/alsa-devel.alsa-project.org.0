Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9D14CE87
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 17:39:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315061681;
	Wed, 29 Jan 2020 17:38:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315061681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580315945;
	bh=5CRTQzZv+WPwaeyw6AQWj80ZcPETp0ITR/8SEns6t6E=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Gpvhf0y9qDQgqHLfI7nIZeY5+YqxKiN6m/WhthWSUPZz7O8St8NVwKs+3fGa72kQ9
	 dQyDchWP7XHUKTfbf0p6Ttk2v/Ptp2pZZaK/gsmIUg2V0WVd9ePsAMRNi+MDMBY9e9
	 KKolo2dtXNJay8PF/GSiPW8Vr1aD/1EkwMyTYYXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FA1F80229;
	Wed, 29 Jan 2020 17:37:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EBEF80082; Wed, 29 Jan 2020 17:37:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38303F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 17:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38303F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="hig1v77V"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200129163717euoutp01f1aa8328ed82623cd7476bbf3f3c81f6~uaOGbfUrq2867428674euoutp01q
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 16:37:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200129163717euoutp01f1aa8328ed82623cd7476bbf3f3c81f6~uaOGbfUrq2867428674euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580315837;
 bh=KeY3WJwxS26svuYCyhdWmC4Xh064zsq7ajjxMpsxEEY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hig1v77VNdOrTQii7vn/DnVPFjH0ltg9YrP/AQ93wjYlh6Ahzyf4kvCoyAeibuRrY
 lTYiLROT/vfKaYAchz8KKdNft2c470uh0qCQDa/GXPGpdLyB+4Itva9qIY7nvYpm1h
 ByK+OWBmUQPQBnfgOQmCjkXJAh0/Y3BwdPNtwYWU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200129163717eucas1p10856e7078ae4d6c3f94897d5fdd9d3d7~uaOGQTeMD2907929079eucas1p1c;
 Wed, 29 Jan 2020 16:37:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 13.73.60679.DB4B13E5; Wed, 29
 Jan 2020 16:37:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200129163716eucas1p19550fcbfff81ca8586df28782399cff0~uaOF7qUwh2321823218eucas1p1D;
 Wed, 29 Jan 2020 16:37:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200129163716eusmtrp1bbb1ab30361b81c4b3b03bf251ba770b~uaOF6-TxR2835328353eusmtrp1t;
 Wed, 29 Jan 2020 16:37:16 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-16-5e31b4bd9c0f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 35.CB.07950.CB4B13E5; Wed, 29
 Jan 2020 16:37:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200129163716eusmtip16d0c8833c8a315eaae2e05c879a50810~uaOFczkby0593205932eusmtip1C;
 Wed, 29 Jan 2020 16:37:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 29 Jan 2020 17:35:48 +0100
Message-Id: <20200129163548.11096-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7djP87p7txjGGZy8xWVx5eIhJouNM9az
 Wkx9+ITNYvXUv6wWc2dPYrQ4f34Du8XlXXPYLGac38dksfbIXXaLnXdOMDtweWz43MTmMfGs
 rsemVZ1sHn1bVjF6fN4kF8AaxWWTkpqTWZZapG+XwJWx66lhwTSOirvHfrM0ML5g62Lk5JAQ
 MJF41v2GuYuRi0NIYAWjRN+xmSwQzhdGiTmv30M5nxklrh5bANfS9HIXE0RiOaPErl8rmOFa
 jjy9zwxSxSZgKNH1tgusQ0SgVmJVxy6wOLNAA5PE56n+ILawQKTE3qY2dhCbRUBVYseRA2D1
 vAK2EjNnbWSF2CYvsXrDAbAFEgLP2SSunt4ClXCReLB1DtRJwhKvjm9hh7BlJE5P7mGBaGhm
 lHh4bi07hNPDKHG5aQYjRJW1xJ1zv4C6OYBO0pRYv0sfIuwosXjuKUaQsIQAn8SNt4IQR/NJ
 TNo2nRkizCvR0SYEUa0mMev4Ori1By9cYoawPSQunZ4AZgsJxErcfjKBbQKj3CyEXQsYGVcx
 iqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJorT/45/2cG460/SIUYBDkYlHl6JMsM4IdbE
 suLK3EOMEhzMSiK8oq5AId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQW
 wWSZODilGhhdhL/GTAtxF5v4/K/hhyPncstO3bh63dXLSjH/7vZj3xc3JjnGfF7G7Koe9GH1
 gfOVRw+dspLsdtTQ7e/fb23g8fOIue3Fo8xsnqwT5x29Z9K+JDZsyt+rdxadr/Sc2GCzce20
 dVtz9SU6YwtXvA1ieufsdlSK3XvF+01iG7Sn+72cslkkMumjEktxRqKhFnNRcSIAebQx8hAD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsVy+t/xu7p7thjGGaydYGpx5eIhJouNM9az
 Wkx9+ITNYvXUv6wWc2dPYrQ4f34Du8XlXXPYLGac38dksfbIXXaLnXdOMDtweWz43MTmMfGs
 rsemVZ1sHn1bVjF6fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqk
 b2eTkpqTWZZapG+XoJex66lhwTSOirvHfrM0ML5g62Lk5JAQMJFoermLqYuRi0NIYCmjxKuO
 BYwQCRmJk9MaWCFsYYk/17rYIIo+ARWd7AdLsAkYSnS9hUiICDQySnTfe8YO4jALtDBJzL/z
 gwmkSlggXOLTkuPMIDaLgKrEjiMHwHbzCthKzJy1EWqFvMTqDQeYJzDyLGBkWMUoklpanJue
 W2ykV5yYW1yal66XnJ+7iREYotuO/dyyg7HrXfAhRgEORiUeXokywzgh1sSy4srcQ4wSHMxK
 IryirkAh3pTEyqrUovz4otKc1OJDjKZAyycyS4km5wPjJ68k3tDU0NzC0tDc2NzYzEJJnLdD
 4GCMkEB6YklqdmpqQWoRTB8TB6dUA2PGtl0671uqJEQn3nGQ/DbnX8XqkOf3FGcGuc74ukmg
 KGXntoOJ+uqpR19ena+4noXJ5UBxasfhROG+J3rJzi+3vPLtOhZke//iA8WNy5Te5zzf9b1D
 0rWGs2qzRePJRSGiBw+oz+sv0TrNlPdigeoqmUeejzYVfFN+tzxLbNnGux5/VM/E5y9RYinO
 SDTUYi4qTgQADVo8w2cCAAA=
X-CMS-MailID: 20200129163716eucas1p19550fcbfff81ca8586df28782399cff0
X-Msg-Generator: CA
X-RootMTR: 20200129163716eucas1p19550fcbfff81ca8586df28782399cff0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200129163716eucas1p19550fcbfff81ca8586df28782399cff0
References: <CGME20200129163716eucas1p19550fcbfff81ca8586df28782399cff0@eucas1p1.samsung.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH] dmaengine: Fix return value for
 dma_requrest_chan() in case of failure
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

Commit 71723a96b8b1 ("dmaengine: Create symlinks between DMA channels and
slaves") changed the dma_request_chan() function flow in such a way that
it always returns EPROBE_DEFER in case of channels that cannot be found.
This break the operation of the devices which have optional DMA channels
as it puts their drivers in endless deferred probe loop. Fix this by
propagating the proper error value.

Fixes: 71723a96b8b1 ("dmaengine: Create symlinks between DMA channels and slaves")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/dma/dmaengine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index f3ef4edd4de1..27b64a665347 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -759,7 +759,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 	if (!IS_ERR_OR_NULL(chan))
 		goto found;
 
-	return ERR_PTR(-EPROBE_DEFER);
+	return chan;
 
 found:
 	chan->slave = dev;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
