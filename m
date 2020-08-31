Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47225794D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 14:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85CAB1704;
	Mon, 31 Aug 2020 14:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85CAB1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598877209;
	bh=BdnsV0O1ataXWZ/KDJfLt1Q8q12MCa+kWLPegU8H56A=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkUstnP2mEbll4hK8NbFXs+Rz3eY0Vf2iNcVJOFZkOp7BlHpxNbhPyB00wcZLzzV3
	 /v1ZEVGd/akQG8fjokkyQO+z502Er6kwIWbqt42sHxIggnxoAhU7Jvzl+V2KWiTm6z
	 +TL7CQiaBe+BQI8y8qfrKbgxKSZX6WWpSjgz1r3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B40FCF80268;
	Mon, 31 Aug 2020 14:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F6B5F80257; Mon, 31 Aug 2020 14:32:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7F8EF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F8EF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ANb6fvxL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831123158euoutp02ebd53abfeecdb9af83fc7e5b7e55296e~wWkS24HDC2396823968euoutp02l
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 12:31:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200831123158euoutp02ebd53abfeecdb9af83fc7e5b7e55296e~wWkS24HDC2396823968euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598877118;
 bh=uTRRNvTCRsQum+vrvSwUmL4fLx/+QDRq/CTNIkAppF8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ANb6fvxLsW2rTM13+4qi4BVTyCw2u9JKhh0xOGrCV9ftko+P7UtBRkqGReieajycD
 wqINrZra2WYnfb40fUb8DXs+q1OTXWgC3RKNKwBl7zn3JIN3xc2tWE3r5Bg+CmrrR4
 kmkqMaKgCezy6Gqtf6+pEyX3i+42Jpmg39S7lHec=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200831123158eucas1p182b1a6090c46e82a3d5211292199075c~wWkSo4JUr1359713597eucas1p1v;
 Mon, 31 Aug 2020 12:31:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6F.68.06318.EBDEC4F5; Mon, 31
 Aug 2020 13:31:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831123158eucas1p1a4758578b65a050d7a95d36e30a10a31~wWkSQ4qkO1363213632eucas1p1a;
 Mon, 31 Aug 2020 12:31:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831123158eusmtrp29bc4404ad8f9b635e9a0a38e9fb56b4a~wWkSP42Wv0298402984eusmtrp2e;
 Mon, 31 Aug 2020 12:31:58 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-cf-5f4cedbec92a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1C.D1.06017.EBDEC4F5; Mon, 31
 Aug 2020 13:31:58 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831123156eusmtip2e4ce93287e03769e5e4870fc1ff0f665~wWkQjAHsV0981309813eusmtip2t;
 Mon, 31 Aug 2020 12:31:56 +0000 (GMT)
Subject: Re: [PATCH 06/10] dt-bindings: sound: samsung-i2s: Use
 unevaluatedProperties
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
Message-ID: <89e01241-c1f7-1d87-3cf3-30a6f2e26990@samsung.com>
Date: Mon, 31 Aug 2020 14:31:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-6-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUzMcRze9/d+cfy60GcX4caMeS2278a8zfjNsfkrZlMOv6WpK3cVwry/
 VF5OJK64oqX1snLVRZRJOVbutNKhznnJS1lauqLEcf2Y/nue5/N5vp/n2b4cqbjAKLkIbayo
 02oiVYwPZXnYb59V1bkmbO7x5Cn4tO0xgZsaqgl881IRjVPftDHY4f5I46s9E7DHco7Ephob
 jZt6uxic4jJQ+Oy7zyS224tZ7OqtRbiv6SSBze+aadxYkcHgS/YqAhfWOFl8rLKGxQ25bgKf
 eN9O4hJzKrl0nFDcc5gRKvsyKeG20ckK5rxERmhtvssIX2w2Vijve00LrmQrIZRkHxDOlOYh
 occcuG7ERp9F28TIiHhRN2fxZp/tn0oddEwfudtpeEUdRGYyCck44OdD6rEuIgn5cAo+F8GX
 bgeSiBtB2dkrlER6EDgsP5l/lpwLp0hpcANBRfKZv5ZuBM6qgT+E4/z49VDZHuLVx/AtFLiT
 ilkvIfkWBN8/d7Hepxh+Hpyu9bplnJxfDDWHzg2doPip8KDbTXjxWD4UyqzPCGnHFx5fbqO8
 WMYvgLI7WbQXk7w/vGwzERKeCOWdGUPxgK/n4IMji5Jyr4B6axqSsB90WEtZCY8Hz20TIRmO
 IDh1p4WViAGBy5r517EQWm0DjLcbyU+Hooo5krwMLv7MHpKBHwXPO32lEKMgxZJGSrIcTh5X
 SNtT4EdeGiFhJSS3eSgDUhmHVTMOq2McVsf4/24movKQvxinjwoX9cFacddsvSZKH6cNn701
 OsqM/vzVul/W3luoanBLNeI5pBop/16rDlPQmnj9nqhqBBypGiNf/qQuVCHfptmTIOqiw3Rx
 kaK+GgVwlMpfHnytfZOCD9fEijtEMUbU/ZsSnEx5EKn3pu893D93UpJOHfDWHEI3EEfO75yp
 PF/wVJuzP04Fl/dlmfof3SsJVKbm7I7NCCJr167Oj0hUhYxs9byabCgxpajzU1bc35D/4OuS
 o6uul6mnWW4lJMjqAqcWrAwtDFg/eu3gwKDfC89oU0X0otzyxnRnbuOJjgD7I4MrcVLQN4WK
 0m/XzJtB6vSa3zX4MKWnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+93X7qzBbWr+GmRxsQdGy23afppJ1B9drKAUCnpsDb2o6Jzt
 btKDyrLIzPkIBRviLCxLiGqaWqbQ0kpExQeGmppopYRabq0sybZW4H8fzvl+zuHAoXFpJSmj
 U9JNvDFdl8ZSfkT779cjW5qn92nDGrPFyNLZhqG+bgeGHpc+JFHJ2ASF3ro+kajcuQYt1hXh
 yNbSSaK+b7MUujFaSKCC8c846up6JEKj31oBcvflYMg+3k+i3mdlFCrtasbQg5ZhEbrS1CJC
 3fdcGLr6YQpHNfYSfOcq7pHzEsU1uSsI7ql1WMTZq69R3Lv+5xQ309kp4urd70lu9PprjKup
 vMDl11YDzmkPPrD8iDzaaDCb+HXJBsG0gz2qQEq5IhLJleGRcoVKfTxKGcFujYlO5NNSMnnj
 1pgT8uTJ2rdkhhs/NVw4QmQBO54LxDRkwuHd4jwP+9FS5g6AM02LZC6gPQ0ZtF1mfRl/uNCf
 S/kyswA+cRbj3ow/cxg2TR3y1gOYIQJODnz8OxRnhgHssMl8Qg2A2XkDlLdBMQpoac0HXpYw
 MbDlYtHfOsGshy+/ujAvBzIaOG5ZxH2ZlbDt5gThZTETAZ803iJ9CzbChfKef8uC4OCEDfPx
 Wlg/XYYXAql1iW5doliXKNYlSgUgqkEAbxb0SXpBKRd0esGcniRPMOjtwPMhda/maxtA7ky8
 AzA0YFdIfrTu1UpJXaZwWu8AkMbZAMmujnaNVJKoO32GNxq0RnMaLzhAhOe4IlwWmGDw/Fu6
 SauIUKhRpEKtUqu2ITZIksO8OCZlknQmPpXnM3jjfw+jxbIsELJ5ddymOFXbnrG5779iHLRz
 Gs4NzteELNtjC4tHXCL/414x7M+8qG1rSAnOGJs0H5wonSuw3I5a3NjzRqMy39BU/8z+2K4G
 G9B+ufLo7qrAVQlVJ8eeVw2ci3WlatJCY13s+WZ3QeXZNxX6L5YEuF2c1XuqmB+Kvx9SUvjp
 EEsIyTpFKG4UdH8AKQCl/jcDAAA=
X-CMS-MailID: 20200831123158eucas1p1a4758578b65a050d7a95d36e30a10a31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200829142546eucas1p22f1bdaedfe821f41b4cc0c6d6b323b35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142546eucas1p22f1bdaedfe821f41b4cc0c6d6b323b35
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142546eucas1p22f1bdaedfe821f41b4cc0c6d6b323b35@eucas1p2.samsung.com>
 <20200829142501.31478-6-krzk@kernel.org>
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
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@11440000:
>     Additional properties are not allowed ('power-domains', '#address-cells', 'interrupts', '#size-cells' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
