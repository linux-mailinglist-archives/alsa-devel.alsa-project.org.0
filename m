Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5862579F1
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 15:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC6DF17D2;
	Mon, 31 Aug 2020 15:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC6DF17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598878965;
	bh=u31IkwwsdUlgvxNouhia5tBMp9KsCfsp7+5wI4LiTGs=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YacMJlMYvLuQ1rZGrlSHzFGpzoU61mT43U0IvDuHkpyvk/M/fKCeT2R3l5KF8mQNX
	 ksXA8vce145yDxyJj4vrq2aKO6yEWlwlVA0yjbar12iZUEuS8N7joariv44L3BJG17
	 D5+lm7aNHdvNVlvq0BugIJEnJpHyc2sdszXASV6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA7CF8024A;
	Mon, 31 Aug 2020 15:01:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D54F80212; Mon, 31 Aug 2020 15:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C85CF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 15:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C85CF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="FVnP0RXJ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831130055euoutp02b461867845942dcd4fec7b795b22631f~wW9j903Wj0926509265euoutp02-
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 13:00:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831130055euoutp02b461867845942dcd4fec7b795b22631f~wW9j903Wj0926509265euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598878855;
 bh=f/rWok6CJ7/IYjKn1cpZQvn31jSua31cQD97YIm0q8Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FVnP0RXJlfY2ZvA5nG7Pgx9A/IX08DF7NCMbuZUdk+I0a2CKjDwrkbErVDYiSg0rI
 GztQKaB6VQpx3rGgwaeug1WKBIggyv69Q0uQNKCRX1PzdfEWnxTHegFcs0PZOy1ggg
 Fp309Oo0wX7vxDLW6rasaIxZteXOr6BY8SaMPDlI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831130054eucas1p2328868ab157425b00cef2b6247f73897~wW9jleBVl2410024100eucas1p2p;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5D.B3.05997.684FC4F5; Mon, 31
 Aug 2020 14:00:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831130054eucas1p235cdcf361f5474a0871c51129d12541c~wW9jP3-qD2812528125eucas1p2C;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831130054eusmtrp1f69895d85ce6af64b2b57b067f199817~wW9jO3Rrl2421924219eusmtrp1Y;
 Mon, 31 Aug 2020 13:00:54 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-16-5f4cf4867686
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.B2.06314.684FC4F5; Mon, 31
 Aug 2020 14:00:54 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831130052eusmtip25eaef84dfc2e904b6394d553b241f70c~wW9hx00Mp2992729927eusmtip2N;
 Mon, 31 Aug 2020 13:00:52 +0000 (GMT)
Subject: Re: [PATCH 08/10] arm64: dts: exynos: Add compatibles to sysreg nodes
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <0e2b595a-eacc-bddb-617b-d22c908212fc@samsung.com>
Date: Mon, 31 Aug 2020 15:00:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-8-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTle7vayGu0vFlWDEaMmEvrF4W0/XjQQgWCtOlUD1scqxmtlLAs
 UlNT02wZwoZIMq200dHSxsi0UdRnmllkMoaWlJSJo7RaPZ+S/86599zv3nP4OFJ9kfHm9kfH
 iIZoXZSGcaXKn32XFiQ5N4QH3S4JwuelBgK3t9YQ+P6VYhrnvutl8CtnH43zhnzwn/ILJL5e
 K9G4fXiAwdmOLApn9vSTuKWlhMWO4TqER9pTCGzp6aDxi8prDL7SUk3gu7VdLD5rq2Vxa4GT
 wMnvP5K41JJLrpoulAydZgTbiJkSHpq6WMFSeI4R3nY8YoQvksQKFSPdtOBIsxNC6c2TQkZZ
 IRKGLLM3u21zXblXjNp/VDQEhkS47nM4cujD1eTx+vyn7Cn0g0hFLhzwi+HroJVKRa6cmi9A
 UPn4A60QJ4K2J9WEQoYQDCbWk6mIGxuxtc1R6rcQlBcnjYsGESS3mVn5XQ9+M5SlVJFyw5Pv
 pMCZWsLKhOQ7EXzrHxhTMXwwnK/LQDJW8SGQmXeGkTHFz4PMJ5doGU/jd4HV/pJQNFOh4Wov
 JWMXfgnYHplIGZO8F7zpvU4oeA5UfL42thn4Jg6KWstYxeo6GC66N4494JN9oj4LGnPSKWXg
 DIL0qk5WIVkIHHYzUlQr4K30g5ETIHktFFcGKuXV0P3TRinBuMPrz1OVI9whu/zyeF4qSElS
 K2pf+Fl4eTx5b0jr/UNlIY1pkjXTJDumSXZM//eaEVWIvMRYoz5SNC6MFo8FGHV6Y2x0ZMCe
 Q3oL+vdXG0ftzgeo8tfuGsRzSDNF9a1ufbia1h01xulrEHCkxlO1prlxl1q1VxcXLxoOhRti
 o0RjDZrJURov1aIbH3eq+UhdjHhQFA+Lhokuwbl4n0IRfagd5ehjMr4XpM932R7iltQV5Dsa
 t3ErO8P9yHNzyEAyOeqsCo5o8VtGBHtYE/P1Xf7SK0/P5ng3SZVmzdujPaHV972ZNbPZkFvv
 s+lS6LGOX3cSQldoE+cGLV86t9G/bP7g7x2aTXTTlnzfd9ri8DDpxtrn1VcTYg8eyA6zumko
 4z5dsB9pMOr+Aj1XheKnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7ptX3ziDc5ckrToPXeSyeLKxUNM
 FhtnrGe1mPrwCZvF9S/PWS3mfZa1+L9tIrPF/CPnWC2ufH3PZjHp/gQWi/7Hr5ktzp/fwG5x
 /+tRRotvVzqYLDY9vsZqcXnXHDaLGef3MVmsPXKX3aJ17xF2i4srvjBZtD99yWyxedNUZgcx
 jw2fm9g89n5bwOKxc9Zddo9NqzrZPO5c28Pm8e7cOXaP7d8esHrc7z7O5LF5Sb1H35ZVjB6f
 N8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
 Zdy/P5m1YB9zxYmlh9kbGH8xdTFycEgImEjsvSTfxcjFISSwlFHi8JftzBBxKYn5LUpdjJxA
 prDEn2tdbBA17xklXuy5wwSSEBbwk5j18SUzSEJE4DaLxIubz5hBEswCdxklzs6XgujYzChx
 4fhusASbgKFE79E+RhCbV8BOon9eMxuIzSKgKtF/cBoriC0qECfxuPc/M0SNoMTJmU9YQGxO
 AVOJvXtmQS1Ql/gz7xKULS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEkt
 Lc5Nzy021CtOzC0uzUvXS87P3cQITCHbjv3cvIPx0sbgQ4wCHIxKPLwBwNQixJpYVlyZe4hR
 goNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6a3vJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjByLBItUCn4883whE6ugtt4n6NFFvQKvF52f
 w7lnX6vV43q4xt72ZtF6f+eag7K6M6ftknKMucbxNuRetotdZuWEotmSv+t+BPJ7TFg4M1mr
 7euuDTWfEjovnG4SFbjv0LhOP/LXAjvjCwVb7xT/0P/7bdrKGNeGR59k5z6PiLs2/7XehX9T
 W5RYijMSDbWYi4oTAchKo7k3AwAA
X-CMS-MailID: 20200831130054eucas1p235cdcf361f5474a0871c51129d12541c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142557eucas1p2a9613c8ba9a57ee4842f8ec24b0c5450@eucas1p2.samsung.com>
 <20200829142501.31478-8-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> System register nodes, implementing syscon binding, should use
> appropriate compatible.  This fixes dtbs_check warnings:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: syscon@13b80000:
>     compatible: ['syscon'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
