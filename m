Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD622F57B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 18:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B0A16B6;
	Mon, 27 Jul 2020 18:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B0A16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595867720;
	bh=QN37IUhH9LKT9zdtlt3IqB6mJSC0V67MzZVjPJ5ZmBU=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d93ZtJPqj4XAKk+RVBhhsrA82AK78AtrcrYVquPw++Pah/5QhC2Kx4KdmuIkI4elc
	 Y3MBVwizcCb2CINgI/SGQhlAQv/9m55+NYs2Y9Dvu0hJACw8BchJk/DMbMs/KYwoBd
	 FwsxYcGbEvk+uHc65z1T0QmvwNGMYe6dBVe0VjE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75831F80158;
	Mon, 27 Jul 2020 18:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97303F802DB; Mon, 27 Jul 2020 18:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F140F80171
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 18:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F140F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="tiUPPAEa"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200727163254euoutp02844f61addfe96a267882cd5d8ef20ede~lqRqGn9gf2043220432euoutp02N
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:32:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200727163254euoutp02844f61addfe96a267882cd5d8ef20ede~lqRqGn9gf2043220432euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595867574;
 bh=+k20sNF0O+eIZtuwNh+OkHMj7NqqpDTpfLAF3X8ZuOw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=tiUPPAEawVOSJeaDWbl1Wu1yMihJeTSJv4gL5L97KIfzx5TV0aePu/OROuhpkul6j
 hpFFocbCqWP2WVezSSRYxyKhQ69hR7y5deIPlPxOhrUPLB0hHsDt1lnzw6xgiSQpf5
 OGxprwxilLjyQOIacdbuO+O2aJm9P5gCfZbv74YQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200727163254eucas1p201e02be47bc6cda4510f22b94803124c~lqRp4KGNq0877908779eucas1p2K;
 Mon, 27 Jul 2020 16:32:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2A.31.06318.5B10F1F5; Mon, 27
 Jul 2020 17:32:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200727163253eucas1p1facafeed2a9acc00f25fec554d99d055~lqRpm6CKX1333213332eucas1p1y;
 Mon, 27 Jul 2020 16:32:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200727163253eusmtrp1c6be92a604d7aa44b97e3c435e1e2ce2~lqRpmT8UX1357013570eusmtrp1T;
 Mon, 27 Jul 2020 16:32:53 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-16-5f1f01b52ced
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D9.16.06017.5B10F1F5; Mon, 27
 Jul 2020 17:32:53 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200727163253eusmtip10c94af91925132f7a8bcbbfe65a2ce61~lqRo5l08m3216632166eusmtip1n;
 Mon, 27 Jul 2020 16:32:53 +0000 (GMT)
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add sound support to Midas
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <9171a38d-a77e-a936-7311-34c4f6c70d6b@samsung.com>
Date: Mon, 27 Jul 2020 18:32:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720143458.GB22554@kozik-lap>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk752w0+ZyWLxoKo6ul0/TH6YJZJAzqR9E/8dLSw5R02uYl
 RWJ4iVKbmpimhZZQuUineaPUUkyT5Q21i5uZsUwlwVALSzOPR8l/z/u8z/O9zwMfQ8gbxK5M
 tDaB02nVMQpKSjZ2LfV5NSKPcJ+JKhE7PNghYmtLasRs0YSdYss7+8Rsf7+ZZkv620Ts084x
 ms1q7aTZ+rdWKlCiMs+nU6o60w1KlVlTR6mM9Sakmq9zPysOlh6L5GKikzidMuCCNGpmrlkc
 n8dcMb4rIw3oGZWNJAxgf0jPyyJ5LMePEVhr07KRdA0vIFguyqCFYR7B7ckBtOlovjckEhaP
 EFhaZilh+IFgoLZaxKuccBCUPRmheeyM98P7lV9iXkTgIQSFb+YIfkFhX7j52rj+rAwHwBfb
 4JqBYUi8G+YLDvL0dhwGNdNNIkHiCD137OtZJVgJUw096zyBXWDUXr6BPaBp9i7B3wLcRUPO
 Q9tG7FNQvbBICNgJZrrraQHvBEthLikYMhDkvrDSwpCPYLy7YsN9FGx9vyk+HbFWp+a5UqBP
 wNjAJ5KnATvAh1lHIYQD3GosJgRaBtevyQX1LvhjKhYJ2BVy7KtkPlKUbqlWuqVO6ZY6pf/v
 ViDShFy4RH2shtP7ablkb706Vp+o1XhHxMXWobXPZPnbvdiM2pYvdiDMIMU22at293C5WJ2k
 T4ntQMAQCmfZyV5LmFwWqU5J5XRx4brEGE7fgdwYUuEi83swHSrHGnUCd4nj4jnd5lbESFwN
 CJlOrxaM5++ISj+T9/3cwtxejXbMXGnTGdOoKKplypLlFmr0aIvw17xssx44X3kko2opjsuI
 NOCQmcOS1p9fg0MK7wfaZjPTPub27hscabcOL3069Hl04Jtyak/KnJ3xrJ6ksdkxPjXZsHJ8
 sc8U7XU1oYca83FQFl/O8wniFKQ+Su3rSej06n9DnfEpSAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7pbGeXjDXq3GFhcuXiIyWLjjPWs
 FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gttpy5zebA6bHhcxObx6ZVnWweLes3
 sXn0bVnF6PF5k1wAa5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpq
 TmZZapG+XYJexqsPO1gL+jkq+q7NZmlg3MzWxcjJISFgIrFj7mWmLkYuDiGBpYwSi39PYuxi
 5ABKSEnMb1GCqBGW+HOtiw2i5j2jxKcNJxlBEsICrhKzV19lB7FFBDQlrv/9zgpSxCxwmVHi
 0pOlUFOfMUrMOHkZbB2bgKFE79E+sG5eATuJR3cusoNsYxFQlfg8UQckLCoQJ7F8y3x2iBJB
 iZMzn7CA2JwC+hIvtp5kArGZBdQl/sy7xAxhi0vcejIfKi4vsf3tHOYJjEKzkLTPQtIyC0nL
 LCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG4rZjP7fsYOx6F3yIUYCDUYmH98BB
 uXgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BfptIrOUaHI+MEnklcQb
 mhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgLBXfcFlGNaHJ4XFd1Med
 zlyvZA4wqb5/GaIxR+Z9W4JFq45N08nVTvY/IvSvn2C4fXSj2dKTv33y2BeXz7hpVTL9/ttt
 +n2dDrt6DK62cEcvM1OfslpmuQ1/gn5EVu0hXvfzzmc5+OVE/27/GnnZjLFrubnIy9Bdsrs2
 /3HSX1ZtJHTyUv55JZbijERDLeai4kQAhFQdldoCAAA=
X-CMS-MailID: 20200727163253eucas1p1facafeed2a9acc00f25fec554d99d055
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173518eucas1p1eeaaadd2359da3c863c43cd368a84213@eucas1p1.samsung.com>
 <20200710173500.22365-3-s.nawrocki@samsung.com>
 <20200720143458.GB22554@kozik-lap>
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On 20.07.2020 16:34, Krzysztof Kozlowski wrote:
> On Fri, Jul 10, 2020 at 07:35:00PM +0200, Sylwester Nawrocki wrote:

>> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>> @@ -175,3 +175,41 @@
>>  	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
>>  	status = "okay";
>>  };
>> +
>> +&submic_bias_reg {
> 
> Put them in alphabetical order against oder phandle overrides. Same for
> n710x.dts.

>> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
>> @@ -102,6 +102,30 @@
>>  		status = "disabled";
>>  	};
>>  
>> +	vbatt_reg: voltage-regulator-9 {
> 
> Since this is the basic DTSI for multiple boards, the numbering here
> should be consistent. You will have to rename the ones in Galaxy S3 and
> N710 DTSI.

>> @@ -266,16 +290,18 @@

>> +		cpu {
>> +			sound-dai =  <&i2s0 0>;
> 
> Double space after '='.

Thanks for your review, I have addressed all these issues in just
posted v2.

-- 
Regards,
Sylwester
