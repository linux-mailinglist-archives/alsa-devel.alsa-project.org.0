Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C54DB61E1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE2F1667;
	Wed, 18 Sep 2019 12:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE2F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568803986;
	bh=ATEpg/wrN0VpmlCeeRTIjLz1SLMTgmLSoy++Q3KB4GA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1nqoCpZ4wypUX20Dk67gfQ124MPhehWdkQwS1ciZ/1WOKh8SqVrUHuwoxSquDK2/
	 ivabqc6XX2gaFcWgO99KYIMXq4aiY3Kw71o5V/kGLfXcsGlEOLqsbvgNFlhlCMBnw4
	 RnwWbT9aLuiAbc/payo5UK9h6VbBo04A7paoh/XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CE0F8065B;
	Wed, 18 Sep 2019 12:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9EDF805A1; Wed, 18 Sep 2019 12:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C39D0F80292
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39D0F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="QNVtYOeX"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918104704euoutp0284f7e98cf424f9419e1843a6dc742492~FgpXCdlf53145031450euoutp02J
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:47:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190918104704euoutp0284f7e98cf424f9419e1843a6dc742492~FgpXCdlf53145031450euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568803624;
 bh=I7U/aKHNrCY1D+09WXBMjW4deg9Mt3W9OYXWUaaxfto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QNVtYOeX9dRQq0BsVSpWcyb/yF7qdlCHFDDD8UmpaM6FVCH5Gyf/suiNAacIQfTSS
 9oOzW1djdw225dTB8oj60QmFULYZ/6DdI+C40uSVLGzjYZeJODJ4kAw0bZJYCEPlZ9
 whBf4UBgmLyJ7BN8EycAI8hogH1Pn7f9AvjdchPY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190918104704eucas1p1423adf7331dc8711d0739adfe4519ecd~FgpWh648W2008520085eucas1p1m;
 Wed, 18 Sep 2019 10:47:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 86.B4.04309.82B028D5; Wed, 18
 Sep 2019 11:47:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c~FgpVznU012985529855eucas1p1P;
 Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190918104703eusmtrp2a908048a1a8b4996403345653f978e8a~FgpVkEUs_1555615556eusmtrp2m;
 Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-16-5d820b282f21
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.2C.04117.72B028D5; Wed, 18
 Sep 2019 11:47:03 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918104702eusmtip17fabbbca8d2668ec5a92c504d233cd8d~FgpU6jEB50585005850eusmtip1L;
 Wed, 18 Sep 2019 10:47:02 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Wed, 18 Sep 2019 12:46:31 +0200
Message-Id: <20190918104634.15216-7-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+87Z2TmuVsdp+jFFYRhdIG8YHJhIgcQIAv+JbojNPKjkVDYv
 aYmmaF5qmZiazRyycFqiTRlppPNSK4XNmcwbosNLplngluFcrW1H67/3fd7f873P9/ERKK8N
 4xOp6Vm0NF2cJmBzWNoPO8bTJw4Wx4fXWTBq0jSEUK8bOjHqiWWZTU2WagDVPGLAKKOxC6e2
 J8sRSrNkxqgGYz9CdYzM45T1xwBGlb4bwanhb/cxyqS2IWcPi7qsxWxRb+M8LtK0V7BF3apC
 Ub3CCUTynnYgsmqC4vBrnOgkOi01h5aGxdzgpHR+d7Ay6/Db3atbWBGoZlcCLwKSUXClaZxV
 CTgEj1QDuGZ3okxjA3BhtdND8UgrgP1fIvYdyzo5YKBWAO2LG8g/h+VXK+am2GQEfPjeTXkR
 vqQfnFNUeI5FSQcCN383stwDH/Iq3Py84DGwyGOwo8SMumsuKYRTcjnOrAuGL7t0Ht2LjIZb
 44uesJDU4lCnViIMFAsHDVMoU/vAdX3PnjkQOnubEcZQAuCDt3M401S7bqdXAoYSwmG9yRWD
 cOU7CTv7whj5HBxcLcHdMiQPw+lNb7eMusoabT3KyFxYXsZj6BC4216/F4cPq5adLKYWwReq
 Gpx5oUcAmqpW0GoQ3Ph/mRKAduBPZ8skybQsMp3ODZWJJbLs9OTQmxkSDXB9oLE/etsb0OdI
 HAIkAQSHuLrRongeJs6R5UmGACRQgS83rqAwnsdNEufl09KMBGl2Gi0bAgEES+DPvXNg8TqP
 TBZn0bdoOpOW7k8RwotfBGrP5z1PNEQNCDMiJbnQVmCY9Z6WaO2f1BOVS+wFX8rYL/948Yhw
 beNCAmjxu9yT3/I0SD5mOe674zi6rVLMXpox7AaEK5Zq1+8af5aNPeOHZLbZctqCGpScho3d
 M49nWiYS7Lv2r6Z7qlfBYeOS0ZjAKvMVurgj1twk51r8BSxZijjiFCqVif8CX0K+tjwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV117qZYg+ntQhZXLh5istg4Yz2r
 xdSHT9gsrrRuYrSYf+Qcq8X58xvYLb5d6WCy2PT4GqvFjPP7mCzWHrnLbvH5/X5Wi9a9R9gt
 Dr9pZ7W4uOILkwOfx4bPTWweO2fdZffYtKqTzWPzknqP6XP+M3r0bVnF6PF5k1wAe5SeTVF+
 aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvp3f1gKprFX
 bH72ibWBcQJbFyMnh4SAicSTA32MXYxcHEICSxkllq6cxdTFyAGUkJKY36IEUSMs8edaF1i9
 kMAnRonnx1RBbDYBQ4neoyC9nBwiAmISt+d0MoPMYRboYpZ4v+MXK0hCWCBcYt3aLewgNouA
 qsTa5mvMIDavgLXE9b4+dogF8hKrNxwAi3MK2Eh8uvCABWKZtcSCY9MYJzDyLWBkWMUoklpa
 nJueW2ykV5yYW1yal66XnJ+7iREYC9uO/dyyg7HrXfAhRgEORiUeXomzDbFCrIllxZW5hxgl
 OJiVRHgDautjhXhTEiurUovy44tKc1KLDzGaAh01kVlKNDkfGKd5JfGGpobmFpaG5sbmxmYW
 SuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYN2y84KCjaBd7g+NemcUya7+LU/M9rkpJ79wb
 1Pje4URoWdL+GbOX3k0pDizpyX/612FZY8M/JZHc76LMbLWxIdyH2Nhn5ky/zOTvZu3tY9W1
 Mr2R41Fq4o6EVw0G0YLSk6qD596Pca8z1uTiWujy+6ppanPOtmei9a8vd8edavHuaKhrnqfE
 UpyRaKjFXFScCAD8b0pwmwIAAA==
X-CMS-MailID: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
X-Msg-Generator: CA
X-RootMTR: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c@eucas1p1.samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v1 6/9] ASoC: dt-bindings: Document "samsung,
 arndale-wm1811" compatible
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

Add compatible string for boards with WM1811 CODEC to the list.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
index 0e76946385ae..17530120ccfc 100644
--- a/Documentation/devicetree/bindings/sound/arndale.txt
+++ b/Documentation/devicetree/bindings/sound/arndale.txt
@@ -1,8 +1,9 @@
 Audio Binding for Arndale boards
 
 Required properties:
-- compatible : Can be the following,
-			"samsung,arndale-rt5631"
+- compatible : Can be one of the following:
+		"samsung,arndale-rt5631",
+		"samsung,arndale-wm1811"
 
 - samsung,audio-cpu: The phandle of the Samsung I2S controller
 - samsung,audio-codec: The phandle of the audio codec
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
