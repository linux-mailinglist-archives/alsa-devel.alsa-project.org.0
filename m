Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1F258CD2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F80917D0;
	Tue,  1 Sep 2020 12:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F80917D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598956311;
	bh=RyyRksn/l0L3ABmBhXELIMi8M4rndskNe9jtbeEByNk=;
	h=Subject:To:From:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yw6tK5c58nfE4lTykFk+0DvacdY5WmA5PsAcVH+BlidaqoU7O4CptftqNlV+jDOSC
	 IpRdGGKe5DhsRQd/of9m/+KyYYakXDVltRc133BAi2ON1w1cNYvN5UBJzXie2KgWAL
	 BZ7vqDxLHzw9lE9WSkoCnl6xKygSBrKh99kQS9kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AF9F8020D;
	Tue,  1 Sep 2020 12:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C73FF80278; Tue,  1 Sep 2020 12:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C68CCF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 12:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C68CCF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XAzAG68L"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200901103006euoutp01da7ab5fdbaf29578e2fc717084c1ba3d~wojLC3_Ja1005210052euoutp01w
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 10:30:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200901103006euoutp01da7ab5fdbaf29578e2fc717084c1ba3d~wojLC3_Ja1005210052euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598956206;
 bh=wt/lfrYvi6NYE+rsChJGWO7vqFppDLQ0HZIW/Allo4E=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=XAzAG68LmG1G0IJVDdTTsUkMGGc9poz+j6ErBgtpJGYCssSn9jZpvy1j0athjoEGj
 2KDHDNqYY4IVBWcqZwv5yGXzbrJa4B6R5yjL76fo7qNnwwFeijvy1e6lR8/KartGy3
 Fll7KzoIuarg+EeEgYz6gm8ISEhO66heWaCLvI6E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901103006eucas1p129f50fc9ee5c81d9bf33b83d202c66f3~wojKySMEl2238822388eucas1p1a;
 Tue,  1 Sep 2020 10:30:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 2F.11.05997.EA22E4F5; Tue,  1
 Sep 2020 11:30:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200901103005eucas1p1c28f849d841ec56d87459314fae85654~wojKU4q1B2243422434eucas1p1Y;
 Tue,  1 Sep 2020 10:30:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901103005eusmtrp1c0efa6dcd6cc9fcbbfd87099073d25c9~wojKUGJJA1923319233eusmtrp1Z;
 Tue,  1 Sep 2020 10:30:05 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-d6-5f4e22ae50b7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 38.68.06017.DA22E4F5; Tue,  1
 Sep 2020 11:30:05 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901103004eusmtip1cd15b079b2a68327794223d5d080e177~wojJEvRQA0142501425eusmtip1Q;
 Tue,  1 Sep 2020 10:30:04 +0000 (GMT)
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <7a30c1c3-d243-9952-4f13-d26380f31bcc@samsung.com>
Date: Tue, 1 Sep 2020 12:30:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200830112633.6732-1-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sb0hTcRT1997b23M0eW6GF4uioR8U0kyDF4VUFO1DiFGBWWlTHyq5qZta
 BoVo5VIzSUV8jZQi0iVmyz/TdMQ0l00npv3TTMuhqEiGw7Ay8/kW+e2cc8/hnguXwmWNIj8q
 RZPJajWqVAUpIVp6lh07GxSRcbsK6uTM8KAVYyq+OEmmutshYgYGGsXM0rAeY4baDSRzvbNb
 zAzWurADlLJxMY9UtnFjYqXJeJNUljQZkXLRtC1KFCPZn8impmSz2pCI85LkhndmMr2IuNRr
 1RO5qAMvRJ4U0OFQoH+FFSIJJaNrEbjynxECcSFY4PrdZBHBg9pr5L/I1OCYO/IIwdI9PRLI
 dwSWhnGMd8npWBiv6Fof+NDlGNh760X8gKRD4dbLEsRjKR0BnU6O4DFB+8Ocs3o9vHkt3Gx7
 iwkeb+itcq55KMpzbfVyUxAv47QvjLjtOL0dWucNOL8L6AYxlE8vi4Sqh+FH2Qs3lsOsrUks
 4K1gLysmhEA+guLno2KBlCIYt9UgwbUPPjl+kvxmnA6EJ+0hgnwQTLmvcV4G2gs+zHsLJbzg
 TkulW5aC/oZMcPvDL2MlJmA/KHKuEoJFCX2TKaVoB7fhSG7DZdyGy7j/FWoQYUS+bJZOncTq
 dmvYi8E6lVqXpUkKTkhTm9DaH9n/2Fxm1P473opoCik2SaNcx+JkIlW2LkdtRUDhCh/poX57
 rEyaqMq5zGrT4rRZqazOirZQhMJXGnZ/5pyMTlJlshdYNp3V/ptilKdfLrqdXbuiPRv7NVJ+
 pSIhQML0vPE3nGgLt5TNvt/TaulSH+k73unxEe4OL8RzRweMHrK9eSLZinbSPBco98mY9s4Y
 dUhcoXWPJ4IMYU9XP2ND0S0W7upSVfXEqT5D8pmqicIp20zHt9mTAc1JsacfmtHMYjSJV9Yo
 6kdifEPS4xSELlkVGoRrdaq/9mXi00MDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xu7prlfziDW7cNbC4cvEQk8XUh0/Y
 LOYfOcdqcf78BnaLb1c6mCwu75rDZtG69wi7xcUVX5gcODw2fG5i89g56y67x6ZVnWwefVtW
 MXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
 b5egl7Hu2g62gm6WipOHOlgaGPcwdzFyckgImEg8u3iXCcQWEljKKNF0orSLkQMoLiUxv0UJ
 okRY4s+1LrYuRi6gkveMEl/ufgSrFxaIk7g/9TAjSEJEYAqTxK1vT9khqtoZJZb8nc8CUsUm
 YCjRe7SPEcTmFbCT2PtkFlicRUBF4vWT+WCTRIEmPe79zwxRIyhxcuYTFpArOIGu+7lFCyTM
 LKAu8WfeJWYIW1ziFlQrs4C8xPa3c5gnMArOQtI9C0nLLCQts5C0LGBkWcUoklpanJueW2yk
 V5yYW1yal66XnJ+7iREYZduO/dyyg7HrXfAhRgEORiUe3oAvPvFCrIllxZW5hxglOJiVRHid
 zp6OE+JNSaysSi3Kjy8qzUktPsRoCvTbRGYp0eR8YALIK4k3NDU0t7A0NDc2NzazUBLn7RA4
 GCMkkJ5YkpqdmlqQWgTTx8TBKdXAqHVeTKXlSDVbWnfDrRNiB5Qm3l604VTjLGOus7Fbqh7t
 fD/hFc8jgb1HLSQ6fDYmPvMWC3+gEXORccYj02op3b2GOwrfHxNaWq726GLMmhqJH5P3XFCu
 WXxSu7dZi2tGQMXttw8TTAM/v1ay2qCeuKKjoc9B/AmX94bWpGrOzLYzW4SFjr4RV2Ipzkg0
 1GIuKk4EAKc7/27IAgAA
X-CMS-MailID: 20200901103005eucas1p1c28f849d841ec56d87459314fae85654
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200830112644eucas1p284d918eef5dcc6039ca27d8f52be89ab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200830112644eucas1p284d918eef5dcc6039ca27d8f52be89ab
References: <CGME20200830112644eucas1p284d918eef5dcc6039ca27d8f52be89ab@eucas1p2.samsung.com>
 <20200830112633.6732-1-krzk@kernel.org>
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
> The "sound-dai" property has cells therefore phandle-array should be
> used, even if it is just one phandle.  This fixes dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0:1: missing phandle tag in 0
>   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0: [158, 0] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
