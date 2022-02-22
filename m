Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2364BF778
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 12:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1161722;
	Tue, 22 Feb 2022 12:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1161722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645530929;
	bh=iF9W9CsNZ+wpts2wJmuYc8MnWsu9X3zBAQY7EUGlcag=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bsgAOPOS1OBJlTnbDM9yGSRbIBadjAnt9AgnNpEQySiJChdv2ymu2AMCAD4g9gh24
	 icHY00IKpJ/yfk/w4ktVbkgS5dLBUOb2IgsscGHzrgBmF7yoo9/cDTYEM9PO0VtQDd
	 edfzrHRQSzNxj/hpuA77Gh+VmrdbOrd60Z9hMfAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC4CF800D1;
	Tue, 22 Feb 2022 12:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65BB6F80118; Tue, 22 Feb 2022 12:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F802F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F802F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="wom2MThn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1645530845;
 bh=5Rr06d3Yrk3kLF8gXcrflHOop0uoK/3urOWvnEtWmH4=;
 h=From:To:Cc:Subject:Date;
 b=wom2MThnW5HiF1vkfswGwEK+O/3fYEULtzLy4T+FcYODeqDZXCuIwtRYwNKhcYE2y
 cXmKRwntBz6WQdgQFfx4WtavIrIZ9W1UdzUz8aEFJe8cVzvdLK6FnVTKlX4NLQUdPd
 CDwnEX+SPmDIsIJFuPDqWClx6pGJngbACN2ijIqg=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id D828323E; Tue, 22 Feb 2022 19:54:02 +0800
X-QQ-mid: xmsmtpt1645530842thq7la2s8
Message-ID: <tencent_5F9F4223DC44A9ECBF02649AF934F786E305@qq.com>
X-QQ-XMAILINFO: NO7nxmS7l766leqfrpUZ5sDiiO2Ci+eePA+fHyfgbhMFEv3iJBETm3aqlE5TeR
 k+vLbLRC0hPGfKZLatOPMfn83VBHBl0Crmu/Xwx/QzxAYxtqLCSFJnpdSGDAXy47GKgA3CmNPSTR
 jWDwQGvJXJodVs4cCc5lSwoaWwn66NXtHZkL/2dDmHaXMfS+5QeVbnkNIu9Qr1fALG/20oefUhXY
 LcJeFwX5x0U0TwExSqzaP9K7J7rhZJelir2YEf3wPxIv+PZan+RvMXc6XcspHQBV+GyXslg5B35/
 oFlz64F3CxpaprsuTZzgpAr3z1vsh9oqjJWk7sUNzGTO5iofsodVn86MXw/w9Y/+nbVANdKkGr5/
 aJSv23JTq9wtwPiw4Vj3TCmlnLrQdJx+SKoJwvwb3aPbak55Uu9kGlIR24p+AFVSikYAFCNzRvce
 4xu2n5XHxjjFTAqcKOUOOiv9FDysjcVVSFL7EUIxvyzvVLu7ZoUp2GMS24kSi6Wy93KviJItfOYE
 Z+O9t1kiXVxydSbLzyOUWly8jzHNHT26Yifdb+UVPVfUpjS9t6D2670A17Hyr7GeZTaaHLzsduyk
 r336mDqgZJnOBrlU8W6he9+zhp0CMjtkbudzyo87cRsBwBfNu8BIaDmSNyW3fyNk4R5sdRsPBXAn
 FUTqHyotwoEvoRqdSafpX7wVn3JlDfwIBjboRSVlHrVUzqhtwEyw2SeDp8To8s91LmECDlI5NqTy
 qPignu+D4kAzsbSiS0ziCzooKrKv27aaU+MMsLZNjiaPjLbX2dxbZ2Y1+uKuDb+9Du+HF8ADa/gX
 Z4+PvR+N7YMnRc15TVDzLp1wzhiCJwa3XWoRpwkxzr4Mke4wX7qruA3Zpb5X6mNjzG8IKcMs3dFN
 C9UYJ815cC95aRU9mXnSMXJO6kHBw/xsMcC3tVY0sMmCECxYpABfs=
From: xkernel.wang@foxmail.com
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ASoC: samsung: i2s: check the return value of kstrdup()
Date: Tue, 22 Feb 2022 19:53:32 +0800
X-OQ-MSGID: <20220222115332.4084-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kstrdup() is a memory allocation function which can return NULL when
some internal memory errors happen. It is better to check the return
value of it to catch the error in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 sound/soc/samsung/i2s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 309badc..70c8271 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1349,6 +1349,10 @@ static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
 		return -ENOMEM;
 
 	pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
+	if (!pdev_sec->driver_override) {
+		platform_device_put(pdev_sec);
+		return -ENOMEM;
+	}
 
 	ret = platform_device_add(pdev_sec);
 	if (ret < 0) {
-- 
