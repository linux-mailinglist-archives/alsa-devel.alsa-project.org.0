Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263451B990C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 09:52:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C1F844;
	Mon, 27 Apr 2020 09:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C1F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587973974;
	bh=w0gzh38Mzzxj6qXw1iDmS8eJ/8huiQYk39LMjyYO4Xw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBs8qEpAlbwowBQuS4TmUuTKWTLjvunKaRKnwf4SB/kdjP8B2crrhHPvkV7cif1UQ
	 hEAL9EKNPRLnagR9JziB6z6RUuknvZ6EL7yWEWjt80cSAQY8ldRWnvx3k2pzDPsyes
	 5X+bGLoqhS3T5XNK9G9bJb4lnJmuo/9TaMSQ7QnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4038F8029B;
	Mon, 27 Apr 2020 09:49:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D387F8025F; Mon, 27 Apr 2020 09:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFDADF80232
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 09:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFDADF80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dUK2UyZD"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200427074843euoutp01592de71039439b5b46e70889161644ff~JnbA_ia_C0944409444euoutp01D
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 07:48:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200427074843euoutp01592de71039439b5b46e70889161644ff~JnbA_ia_C0944409444euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587973723;
 bh=Jk8KR55ncQLtd1sMYYkwZP6VPLr+D89pm+J/YGxp7hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUK2UyZDlHqTlOJ7XpC2ZvCYG5mZ4UjgnO/qA15CUCNEWsDAV5ycLTRj7gkCVPIIl
 k6rucn06EeijyTO2OSHUwHuol772PPcc2+kQOo064ydmSjr/GDZHct98OH946jxVwa
 PJHqxbLHyhD/3F71bGoRRKJt2zSKi+3lh+NGK7A0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200427074843eucas1p2c6da8cc2a13539bab1759a84d64e981f~JnbAxujPh3203632036eucas1p2S;
 Mon, 27 Apr 2020 07:48:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 23.91.61286.B5E86AE5; Mon, 27
 Apr 2020 08:48:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794~JnbAX-qwJ0174601746eucas1p2Y;
 Mon, 27 Apr 2020 07:48:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200427074843eusmtrp113284b063e7a36afe361aedb0bab002b~JnbAXWKOc0061900619eusmtrp1R;
 Mon, 27 Apr 2020 07:48:43 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-76-5ea68e5b7820
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AD.7D.08375.B5E86AE5; Mon, 27
 Apr 2020 08:48:43 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200427074842eusmtip2ae1ad5e8b5313373f2cc7a04a4f3c0bc~Jna-5gTiu0962309623eusmtip2M;
 Mon, 27 Apr 2020 07:48:42 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mfd: wm8994: Silence warning about supplies during
 deferred probe
Date: Mon, 27 Apr 2020 09:48:31 +0200
Message-Id: <20200427074832.22134-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427074832.22134-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7rRfcviDFb3q1hcuXiIyWLqwyds
 FldaNzFa3P96lNHi25UOJovLu+awWaw9cpfd4vP7/awWh9+0szpwemz43MTmsXPWXXaPTas6
 2TzuXNvD5jF9zn9Gj74tqxg9Pm+SC2CP4rJJSc3JLEst0rdL4Mp4t2QtY8EBtoo9HzexNjCu
 Ye1i5OSQEDCRaLi8AMjm4hASWMEo8binkR3C+cIosW7aKqjMZ0aJ6ZtnwLVsb9jECJFYzigx
 b8pbFriWO5eWMIJUsQkYSnS97WIDsUUE4iSWL17ABFLELPCLUeLzp01MIAlhgQiJFStawWwW
 AVWJqTt3sIDYvAK2Esve74VaJy+xesMB5i5GDg5OATuJhdPdQOZICPSzS3Sdv8oIEpcQcJFo
 m8ALUS4s8er4FnYIW0bi9OQeFoj6ZkaJh+fWskM4PYwSl5tmMEJUWUvcOfeLDWQQs4CmxPpd
 +hBhR4m7e/9CzeeTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xihrA9JFZc+sQG
 CZ+JjBKNTY9YJzDKz0JYtoCRcRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZgOjn97/in
 HYxfLyUdYhTgYFTi4eXYvjROiDWxrLgy9xCjBAezkgjvo4xlcUK8KYmVValF+fFFpTmpxYcY
 pTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUwSjqVGTM+PPi0yI1/xo9HjWpvThjVTBAz
 fOHw5nzLisIt2t6TFiv/zVyws9iK6cYj3rmb3/wO9bscyL5tRfBnjs7nf440vtm6tS9EbWvq
 C9/U6qUbYlZ8ZLDfVrfd+k/+mvoZJptmVars2RhuGHM69oHJvTcKyofVNxbZOxy2btlrIPnz
 lVHnTiWW4oxEQy3mouJEAIOk0D8jAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsVy+t/xe7rRfcviDBb081hcuXiIyWLqwyds
 FldaNzFa3P96lNHi25UOJovLu+awWaw9cpfd4vP7/awWh9+0szpwemz43MTmsXPWXXaPTas6
 2TzuXNvD5jF9zn9Gj74tqxg9Pm+SC2CP0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2
 j7UyMlXSt7NJSc3JLEst0rdL0Mt4t2QtY8EBtoo9HzexNjCuYe1i5OSQEDCR2N6wibGLkYtD
 SGApo8Sn7fsZIRIyEienNUAVCUv8udbFBlH0iVHiXcsqdpAEm4ChRNdbkAQnh4hAgsSh5S3M
 IEXMAv+Aih7dZAZJCAuESSxcsw9sEouAqsTUnTtYQGxeAVuJZe/3Qm2Ql1i94QBQPQcHp4Cd
 xMLpbiBhIaCSj9/fMk9g5FvAyLCKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMLi3Hfu5eQfj
 pY3BhxgFOBiVeHg5ti+NE2JNLCuuzD3EKMHBrCTC+yhjWZwQb0piZVVqUX58UWlOavEhRlOg
 myYyS4km5wMjL68k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2PF
 Tzb2bw5bK0vqBH7faWWwMmyw8GErOHqtp+XAxlROC08vB90rp3svSf6NmGS4/NPM9GnZ8rcT
 3VxkT36s2/vixWO1488kZPq2WSi2SXWxZypevGWm7ztL6N/lbWxb9op83Hj3gVfP+bTrrgtc
 zj85Fvb8f/gMFU6BNWVrT/sXqptdXrQvnVWJpTgj0VCLuag4EQChyMHkhAIAAA==
X-CMS-MailID: 20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794@eucas1p2.samsung.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Don't confuse user with meaningless warning about the failure in getting
supplies in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mfd/wm8994-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 69d973ec42bf..3b2b93c5bbcb 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -393,7 +393,9 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 	ret = regulator_bulk_get(wm8994->dev, wm8994->num_supplies,
 				 wm8994->supplies);
 	if (ret != 0) {
-		dev_err(wm8994->dev, "Failed to get supplies: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wm8994->dev, "Failed to get supplies: %d\n",
+				ret);
 		goto err;
 	}
 
-- 
2.17.1

