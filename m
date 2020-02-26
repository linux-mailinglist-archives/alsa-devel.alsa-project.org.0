Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24716FBA1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 11:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3794168B;
	Wed, 26 Feb 2020 11:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3794168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582711804;
	bh=EoZNpZ30/7pm1pQdY5ugOn9swXXIqDW64kyuo+YBXwk=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uRJltWCNK+X1KNtx1UVIWbgojyJHpRuPWBrYiYb88zw7OeWA/Rsh9Hu7YVBzcU4er
	 gRIlQ35krvafgu+E58+DvmNOTpV9PTj0EbhT7Wp+X9m2jcVDbnjmwhxrlAZtb95KGJ
	 EwlZKOneUzh8C1yGku2nVnMw5gwoGQpVmf6N82uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BA5F8016F;
	Wed, 26 Feb 2020 11:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B75B3F8016F; Wed, 26 Feb 2020 11:08:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4327EF800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 11:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4327EF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="AM2dgbkX"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200226100815euoutp02a42a11c2976bda471171fa4d40fa92fc~26_axNp-I1468514685euoutp02d
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 10:08:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200226100815euoutp02a42a11c2976bda471171fa4d40fa92fc~26_axNp-I1468514685euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582711695;
 bh=cmpnpBfW2ql8aa9zpAhTcZpr5gmx50tzEyXVFAw4y1k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=AM2dgbkXNxKixVk+B6xEXAlWwyLz5SwMsOcdgP5O2YtXXNduzWZYDchjEOM/M4BiZ
 ManImm4p53kpvDxHLvuOkAt5TvhGUani+hpuPSOtaqpxinlDu6XqRCqBl4u83dNF+c
 UQfdz6WGjIo6g2dcRB4POioP/0SstTx/wXMoiXrs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200226100814eucas1p234346167da6caec045e632ca38defc1f~26_akvobp1149011490eucas1p23;
 Wed, 26 Feb 2020 10:08:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 32.E3.60679.E83465E5; Wed, 26
 Feb 2020 10:08:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200226100814eucas1p1ef5e4d5eb763f37bcd4eceffc798792d~26_aWLOXY0946309463eucas1p1F;
 Wed, 26 Feb 2020 10:08:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200226100814eusmtrp1cce939d30a2ec3adf4954d714b9857da~26_aVigXh1384413844eusmtrp1Y;
 Wed, 26 Feb 2020 10:08:14 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-88-5e56438e8f64
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 42.8B.07950.E83465E5; Wed, 26
 Feb 2020 10:08:14 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200226100814eusmtip12634683c04f9765a6f4fa15635c57896~26_Z13_Qv0611906119eusmtip1E;
 Wed, 26 Feb 2020 10:08:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mfd: wm8994: Fix driver operation if loaded as modules
Date: Wed, 26 Feb 2020 11:08:01 +0100
Message-Id: <20200226100802.16384-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7djP87p9zmFxBnd+m1pcuXiIyWLjjPWs
 FlMfPmGzuP/1KKPF5V1z2CzWHrnLbnH4TTurA7vHhs9NbB6bVnWyedy5tofNo2/LKkaPz5vk
 AlijuGxSUnMyy1KL9O0SuDK+XWlnLdjPWXH4fS97A+M0ji5GTg4JAROJnsWPWLoYuTiEBFYw
 SkzYOY0ZwvnCKHFr40GozGdGibN/DzDCtGxq+M0IkVjOKDHtcw8bSAKsZW2TBIjNJmAo0fW2
 CywuImAr8XpHA9gkZoGbjBI77vSxgCSEBQIkni54zgRiswioSjz995gdxOYFatg/ZxkrxDZ5
 idUbDoDdJCFwmU3idfsdqISLRPuKD1AnCUu8Or6FHcKWkTg9uYcFoqGZUeLhubXsEE4Po8Tl
 phlQHdYSd879ArqPA+gmTYn1u/Qhwo4Sp7Y9YwYJSwjwSdx4KwgSZgYyJ22bDhXmlehoE4Ko
 VpOYdXwd3NqDFy4xQ9geEndOLmKHBEqsxP0fB5gnMMrNQti1gJFxFaN4amlxbnpqsVFearle
 cWJucWleul5yfu4mRmA6OP3v+JcdjLv+JB1iFOBgVOLhfcEZGifEmlhWXJl7iFGCg1lJhHfj
 V6AQb0piZVVqUX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjKvnRl9T
 5Tc3sEn6EbQrYftWxTNRr/7W/lhyVrev+q/IxWyhWzuUpiVNETparrhps2GjgaVwVqVe5f0y
 0RtuvI3LA465NvoKHH/ueH/Te26bIy9vSHM2LJ25Ubns0vXNa0Ue159ZW7wv4pPE1adeB21u
 XjO74ZosfmPPS8GvC5+uPCaRed1KWUmJpTgj0VCLuag4EQDJpboYAwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xu7p9zmFxBv+uKllcuXiIyWLjjPWs
 FlMfPmGzuP/1KKPF5V1z2CzWHrnLbnH4TTurA7vHhs9NbB6bVnWyedy5tofNo2/LKkaPz5vk
 Alij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DK+
 XWlnLdjPWXH4fS97A+M0ji5GTg4JAROJTQ2/GbsYuTiEBJYySvw9M5URIiEjcXJaAyuELSzx
 51oXG0TRJ0aJy9+uMoEk2AQMJbregiQ4OUQE7CUe/PoHZjML3GWUuPLaD8QWFvCT2NbxGqye
 RUBV4um/x+wgNq+ArcT+OcugFshLrN5wgHkCI88CRoZVjCKppcW56bnFRnrFibnFpXnpesn5
 uZsYgUG47djPLTsYu94FH2IU4GBU4uF9wRkaJ8SaWFZcmXuIUYKDWUmEd+NXoBBvSmJlVWpR
 fnxRaU5q8SFGU6DlE5mlRJPzgRGSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUg
 tQimj4mDU6qBUWrlD5+Ar38Z+W/HaebmHY8+dZzVdarmvooDoiGLfpnn8/7tsq6Qdy3uZu1O
 5XRhCRY/eH3nErPtHAv0xLL87r93Yt0R8Fbq6DqmN/tOyq27xuchfPHxw++86y1jLD/WXiu8
 r7t6Ue/pI1/bdy8W3hPyYHVzQ1+zfBk/i4xZ+wrlwBky4bODlViKMxINtZiLihMBbdPq61gC
 AAA=
X-CMS-MailID: 20200226100814eucas1p1ef5e4d5eb763f37bcd4eceffc798792d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200226100814eucas1p1ef5e4d5eb763f37bcd4eceffc798792d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226100814eucas1p1ef5e4d5eb763f37bcd4eceffc798792d
References: <CGME20200226100814eucas1p1ef5e4d5eb763f37bcd4eceffc798792d@eucas1p1.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

WM8994 chip has built-in regulators, which might be used for chip
operation. They are controlled by a separate wm8994-regulator driver,
which should be loaded before this driver calls regulator_get(), because
that driver also provides consumer-supply mapping for the them. If that
driver is not yet loaded, regulator core substitute them with dummy
regulator, what breaks chip operation, because the built-in regulators are
never enabled. Fix this by annotating this driver with MODULE_SOFTDEP()
"pre" dependency to "wm8994_regulator" module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- replaced request_module() call with MODULE_SOFTDEP() annotation
---
 drivers/mfd/wm8994-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 1e9fe7d92597..737dede4a95c 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -690,3 +690,4 @@ module_i2c_driver(wm8994_i2c_driver);
 MODULE_DESCRIPTION("Core support for the WM8994 audio CODEC");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
+MODULE_SOFTDEP("pre: wm8994_regulator");
-- 
2.17.1

