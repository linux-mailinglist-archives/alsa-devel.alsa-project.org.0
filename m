Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B444B79C4
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 14:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39591674;
	Thu, 19 Sep 2019 14:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39591674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568897497;
	bh=7IRjz9JKw5tCDFr6jCQSQVEWjA/tbAnklSnATqqTnF8=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGWIFikNB4CWHfpvcWAwzV0H0ACiaPRedWRDVDAcx8a/W7XW5ylY0Exae4AWOkdEL
	 ZFBn+E6bMdZA1MU/Kob/yR/8LjgrcHfKxT138pEWKqB5ema4rQzQkV+00DwCf70Hoo
	 nxOXLZoH9SNAZ+VqNhelUZHVlsMP1lWIR6OYmp4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B0FF8048E;
	Thu, 19 Sep 2019 14:50:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 592C6F803D6; Thu, 19 Sep 2019 14:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FA97F80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA97F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="tNetOo1Y"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919124953euoutp02ad4afcfa5758c4590251cf9bcb812a39~F194D_qHv2727627276euoutp02R
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 12:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190919124953euoutp02ad4afcfa5758c4590251cf9bcb812a39~F194D_qHv2727627276euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568897393;
 bh=sbmvg1Ra4kPeyA4lEdy07dbJP9Cknvyi7VQZy0GRotg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=tNetOo1Y+G+6AJlKUFRRsPmL/1qGHQlAMajAPC/Vguu6R7pcQOXYK7L4Tt5k25tEX
 moJhWoeb1+AKZpvXzO/bPXpkLmdJZripDYRNkv+qcWQd01R1h2Q2s7lKRfYE9iEdxw
 2KKpWhHS4Wm5kr7/yY/P7V0map+yRBdRcogZcY60=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919124953eucas1p2c3b7ba12e7047787051999d4e6211862~F193keRe23170331703eucas1p2-;
 Thu, 19 Sep 2019 12:49:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E8.9D.04469.079738D5; Thu, 19
 Sep 2019 13:49:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190919124952eucas1p29de8004517cbf8d453f7559822f44e88~F19213SSt1424714247eucas1p2Q;
 Thu, 19 Sep 2019 12:49:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190919124952eusmtrp29d4b73e2bf3b7efb887e09a1abeadfbe~F192nnyzd0767907679eusmtrp2T;
 Thu, 19 Sep 2019 12:49:52 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-ed-5d837970b1df
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.31.04166.079738D5; Thu, 19
 Sep 2019 13:49:52 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919124951eusmtip18d29027b98da48e960a1e2a4311542e7~F1919rEHn0687006870eusmtip1S;
 Thu, 19 Sep 2019 12:49:51 +0000 (GMT)
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
Date: Thu, 19 Sep 2019 14:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919082211.GF13195@pi3>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO3elyWkae9OoGEWYpYlWpwtS1I9DQfWrpFy19OQlnbbjbfWj
 0i7m5liSTNe8BJk6DHWFtyhxmmJWNpXKTPIWxFAsL0VFmdsp8t/zvO/7vM/7fHwMLneS/ky8
 JlXQatSJSsqbqO/4/nJTii5btbnj+Tau3+nAuLrCGpIrGBmnuP6rdsSVtr8kuZ6eWpr72p+D
 cfax1yRX2PME4+63D9HczFQLyV193E5zzspZbLeMr53JovgmyxDN2203KP7B3Yu82TqPeOND
 G+Jn7KsO08e8d8UIifHpgjYk4pR3nOteJZbSiGV2ffyJXUJfUS7yYoANB+fnG1gu8mbkbCWC
 gbEvuERmEbzTd1MSmUHQ7LpD5iLGI8nt2SjVKxDcNo8giUwiMI6NYu69vuxReF9t9GA/NhDe
 /PpGuodw9hUGz9oMhLtBsaGQ99ToOUTGRkBhq55wOxDsOujK8WiXs5EwPdxGSiPLoKto3CP1
 WtjpvJJHuTHOKiBrtoqU8GpomLTiUrZJGlyuRAnvg5bRlr+ZfcHV+ZCW8EqYbyr15Ac2G4Hh
 0SAtEROCD51lfxU7oa3T6YmPLzjXNIdI5T1Qd6WIll7FB95OLpNu8IH8ejMulWWQc00uTa+F
 nzYzJmF/0I/PEyaktCxKZlmUxrIojeW/bxkibEghpIlJsYIYqhEygkV1kpimiQ2OTk6yo4WP
 1v27c7oRzfWediCWQcqlsjUZ2So5qU4XdUkOBAyu9JNZt2Sp5LIYte68oE0+qU1LFEQHCmAI
 pUJ2YcnwcTkbq04VzgpCiqD918UYL/9LCEO7A/ZX7Eqb0J/oK7ceWpF5a6mjz7QnPFwRZBte
 j6uIMB1lOFg8EKUyTSQU9TJVF3hD4+XqTyEvfvwqb4DYA2ER96K3U5qtikZzSQXsLWgqmc5X
 BbUGXi8tmytWBvTlXDt0vjXoHIqyvqkNjNxxcvtmRfXUzdcJusG5M0fCzEpCjFOHbsC1ovoP
 xF2yR2QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oFlc2xBpdfsFlcuXiIyWLjjPWs
 FlMfPgFyWzcxWsw/co7V4vz5DewW3650MFlsenyN1WLG+X1MFmuP3GW3+Px+P6tF694j7BYX
 V3xhcuD12PC5ic1j56y77B6bVnWyeWxeUu8xfc5/Ro++LasYPT5vkgtgj9KzKcovLUlVyMgv
 LrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLeLVsBVPBDqaKk09/MzUw
 fmPsYuTgkBAwkeg6r9PFyMUhJLCUUeLVtZ+sEHEpifktSl2MnECmsMSfa11sEDWvGSWenJnO
 DJIQFgiXuLOmjwnEFhHQlLj+9zsrSBGzwAUmie9tIEUgHfcYJR4f2QpWxSZgKNF7tI8RxOYV
 sJOYcbCbBWQbi4CqxMkOsBJRgQiJwztmQZUISpyc+YQFxOYEWnCxpZcNxGYWUJf4M+8SM4Qt
 LtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl
 5+duYgRG8LZjPzfvYLy0MfgQowAHoxIPr0J5c6wQa2JZcWXuIUYJDmYlEd45pk2xQrwpiZVV
 qUX58UWlOanFhxhNgX6byCwlmpwPTC55JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNT
 UwtSi2D6mDg4pRoYWbhztrtec3qldu54QcOJaxa+6Wt23cwQvhtS1PbEQ3wRl9fn9znba7UO
 TGe26/zYeDRJRsbE/YbBrnW7Trbs73ojcKHd9uxK74zfvnxrtgkq17Ds/y9Xemf396vTn5mm
 /S3TbZ9pkGNqMuVxmsnBHZ+WF7YUNIlr+hpu0w+cKRF3xPw88/EcJZbijERDLeai4kQAZ+/k
 dvYCAAA=
X-CMS-MailID: 20190919124952eucas1p29de8004517cbf8d453f7559822f44e88
X-Msg-Generator: CA
X-RootMTR: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 8/9] ASoC: samsung: arndale: Add missing
 OF node dereferencing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/19/19 10:22, Krzysztof Kozlowski wrote:
> Wasn't this issue introduced in 5/9? It looks weird to fix it here...

It has not been introduced by 5/9, the issue was there already before 
my patch, there was even no remove() callback where OF node references 
could be dropped.

-- 
Thanks,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
