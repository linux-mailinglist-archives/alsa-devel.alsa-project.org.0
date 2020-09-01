Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE34E258CD1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A6917B2;
	Tue,  1 Sep 2020 12:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A6917B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598956267;
	bh=QQrEl0MdYPJZee6IjdeDBZJ0YI3wcCnel0tjCyODfbQ=;
	h=Subject:To:From:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRk3hmfrE3Ese9m4EpKOmkik2cIxHY82r/Nyt/yRFxfdO8HM5HWIDy8IAutOWBNbx
	 v7kncZZSKnMglbBTUi/ZJlsGVVo/eVrdZw07seLBVPlKO5BFVIGud03lnvgnUmzGoN
	 zLrFqp1SGFzd8/23T6ZBGiZma7PN8xFTuFGrhfHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EBB8F8021D;
	Tue,  1 Sep 2020 12:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F62CF80217; Tue,  1 Sep 2020 12:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A84D5F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 12:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A84D5F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="J/63J8zT"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200901102907euoutp022748e5c78e30c1495be800131f579c89~woiUUms-C0830608306euoutp02o
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 10:29:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200901102907euoutp022748e5c78e30c1495be800131f579c89~woiUUms-C0830608306euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598956147;
 bh=k5vdeDzHjYYiOBpxPyP+677nyH6MYEa+gndR4S5JbNE=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=J/63J8zTmTHycRavFZ3I7T8m9hK9IQ39Vjvbir6Ha1h2tm9rc+0iaSwRnlCru1I7n
 6lD0wNzE9tAwbOtYCOv8zGr7N3lXJWya84SXsFmb175nJ5zr3ZYjqARserwVwROGoT
 lv9ok0yfVjZzkHwamwV6AER7etAaIpMfum1KAyI4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200901102907eucas1p25fc8fbd96345364cfa6246fe9d750c7a~woiUNy6FR0806608066eucas1p2-;
 Tue,  1 Sep 2020 10:29:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 46.A8.06318.3722E4F5; Tue,  1
 Sep 2020 11:29:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200901102907eucas1p1fce2d1ab4aa01b0627d715f046653c55~woiTu-ADu2026520265eucas1p1A;
 Tue,  1 Sep 2020 10:29:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200901102907eusmtrp2fbedb8238049e1949d0fb4a4b333c7ae~woiTuJucu3227932279eusmtrp2f;
 Tue,  1 Sep 2020 10:29:07 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-2a-5f4e22732de5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EF.B5.06314.3722E4F5; Tue,  1
 Sep 2020 11:29:07 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901102906eusmtip177a377bbd9f4ff37849a2fde134ace8c~woiSpHjga0106201062eusmtip1z;
 Tue,  1 Sep 2020 10:29:05 +0000 (GMT)
Subject: Re: [PATCH 2/2] dt-bindings: sound: odroid: Use unevaluatedProperties
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <30b8ea43-c2d0-5ddf-dc16-a8fe80d47c38@samsung.com>
Date: Tue, 1 Sep 2020 12:29:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200830112633.6732-2-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7rFSn7xBl1zNSyuXDzEZDH14RM2
 i/lHzrFanD+/gd3i25UOJovLu+awWbTuPcJucXHFFyYHDo8Nn5vYPHbOusvusWlVJ5tH35ZV
 jB6fN8kFsEZx2aSk5mSWpRbp2yVwZdw9toal4DdzxcWOHrYGxo3MXYwcHBICJhJbNhZ0MXJx
 CAmsYJS49vMpG4TzhVHi5/NV7BDOZ0aJby9/AzmcYB1v1lyFSixnlPj0/ysThPORUeLl5Q8s
 IFXCAgESjxvXs4AkRASmMEmcPrmGFSTBJmAo0Xu0jxHE5hWwk3jS2gsWZxFQkXh1uokZxBYV
 iJPYevwqE0SNoMTJmU/AhnICrV7y4yUbiM0sIC5x68l8JghbXmL72znMIMskBDaxS6x4upwJ
 4lYXiYkreqBsYYlXx7dA/SAj8X/nfCaIhmZGiZ7dt9khnAmMEvePL2CEqLKWuHPuFxsonJgF
 NCXW79KHCDtKbH4zBxp8fBI33gpCHMEnMWnbdKgwr0RHmxBEtYrE71XToU6Qkuh+8p8FwvaQ
 2HVpB/sERsVZSN6cheS1WUhem4VwwwJGllWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiB
 Cen0v+NfdzDu+5N0iFGAg1GJh3fFN594IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccX
 leakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAKDKHYZWIx8QT1k9NAi15Dmbv
 NfDfP0Hhvmjt55+/I/66Bz9Y9JEtVIbftduwi9Hm3h3P5s7DHzZkmV3K1zjx0v//CZn68A77
 7R+nms+9fOdE9hm+L2mbNtzTvq78eq3Rcw3RSzorHq48uZmX9W7Gdb4TRz5+VRC59d9IbW53
 puWrt9e3l3H5KimxFGckGmoxFxUnAgCARsoTRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xu7rFSn7xBs9mcFtcuXiIyWLqwyds
 FvOPnGO1OH9+A7vFtysdTBaXd81hs2jde4Td4uKKL0wOHB4bPjexeeycdZfdY9OqTjaPvi2r
 GD0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3S
 t0vQy7h7bA1LwW/miosdPWwNjBuZuxg5OSQETCTerLnK3sXIxSEksJRRov/gSdYuRg6ghJTE
 /BYliBphiT/Xutggat4zSiy9eRysWVjAT2LPzSdgCRGBKUwSt749hZq0kVHi157f7CBVbAKG
 Er1H+xhBbF4BO4knrb2sIDaLgIrEq9NNYJNEBeIkHvf+Z4aoEZQ4OfMJC4jNCXTekh8v2UBs
 ZgF1iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFRcBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9Nxi
 Q73ixNzi0rx0veT83E2MwEjbduzn5h2MlzYGH2IU4GBU4uEN+OITL8SaWFZcmXuIUYKDWUmE
 1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgcmgbySeENTQ3MLS0NzY3NjMwslcd4O
 gYMxQgLpiSWp2ampBalFMH1MHJxSDYw1f9/MqRT49qvh8bb3us33rU/ZSx5JqHtVV7Ro9l2n
 s85nHhpXr3syTSZQgSNZ/HKZy5s552N01gbF2Sxfu3tqlppst92si8LHezYcz0zzvqv4fKr9
 otU75T7N6U7bcchZ0nPhi+Ckqfo/Wp5bX0yMMT0dXx62YZHJN031rxv0Vf7EPyu7kHheiaU4
 I9FQi7moOBEAXT6ly8oCAAA=
X-CMS-MailID: 20200901102907eucas1p1fce2d1ab4aa01b0627d715f046653c55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200830112645eucas1p2e94b4e40ef019afd643461a634d1cdfe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200830112645eucas1p2e94b4e40ef019afd643461a634d1cdfe
References: <20200830112633.6732-1-krzk@kernel.org>
 <CGME20200830112645eucas1p2e94b4e40ef019afd643461a634d1cdfe@eucas1p2.samsung.com>
 <20200830112633.6732-2-krzk@kernel.org>
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

On 30.08.2020 13:26, Krzysztof Kozlowski wrote:
> Additional properties or nodes actually might appear (e.g.
> assigned-clocks) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml: sound:
>     'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

