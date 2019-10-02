Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D86C86D1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 12:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DD1167D;
	Wed,  2 Oct 2019 12:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DD1167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570013887;
	bh=CUa5GhR6sVC3XSkkGJnDk1sEko8sx6nnsy2SFgFD8hE=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKUH7aAa1EdDXwtZ3zFcKZZHY4ltXd02ZfgoCs+dQGp26pnjRqli3NjKdOu30f7U/
	 SKnLOw0pSbK14+GDElVz0T6azPdmVkqpolOSCypdD05izvJmRIwWtIAJOej/hNXF3J
	 PHWHThERE8Dc7JJa/Pxh5K6f7hrqwGmeB6PkzjZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8862F803F3;
	Wed,  2 Oct 2019 12:56:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66FCEF80391; Wed,  2 Oct 2019 12:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FD83F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 12:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FD83F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="P31ypzpV"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191002105616euoutp02c50aea2738ba2e7e3d84121a24ceab32~JzzYetInl2169821698euoutp024
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:56:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191002105616euoutp02c50aea2738ba2e7e3d84121a24ceab32~JzzYetInl2169821698euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1570013776;
 bh=a0IMDPZhOCWOk4Vu3wxuz1nmbnSLf3W3a5GRUP5wqqc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P31ypzpVLOOr89SvbXlzOT0MQ3zjzaxCj5JRVtb8FU2x6Ho6tTQU60+JOgto2OSmX
 0etqzwd5VmQLTniT/ENL5qMAYz+Rc8c92kEPj1s2zquNJCCDRoY1P72eLesSWx1t7d
 nnTlpwnGNt/BwA08rhFO7PrX0kFw+zyj/6vQ2DnM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191002105616eucas1p28dc2ab30bfff5459c6fa692713e7109a~JzzYIp7NE2135821358eucas1p2u;
 Wed,  2 Oct 2019 10:56:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E2.2F.04469.F42849D5; Wed,  2
 Oct 2019 11:56:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191002105615eucas1p2238ff9e54dd3a452d5e65a979a89a3e3~JzzX1_0pR2135821358eucas1p2t;
 Wed,  2 Oct 2019 10:56:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191002105615eusmtrp1a454ad35e225ea92a8f12fbd712a4c6f~JzzX1Ixrf3228132281eusmtrp1C;
 Wed,  2 Oct 2019 10:56:15 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-0a-5d94824f4fa6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.05.04117.F42849D5; Wed,  2
 Oct 2019 11:56:15 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191002105615eusmtip128d5bcd7a7ad5826a706a709fb85509a~JzzXXy9oE0068900689eusmtip1p;
 Wed,  2 Oct 2019 10:56:15 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <9ddc271f-e88f-8991-2625-b885f2f2fae7@samsung.com>
Date: Wed, 2 Oct 2019 12:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001175601.GB14762@sirena.co.uk>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djP87oBTVNiDX6dZ7K4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VouLK74wOXB7bPjc
 xOaxc9Zddo9NqzrZPDYvqfeYPuc/o0ffllWMHp83yQWwR3HZpKTmZJalFunbJXBlTJ43k6ng
 IXvFvcYv7A2MG9m6GDk5JARMJFaf+8TSxcjFISSwglHi2dk/rBDOF0aJX/fb2SCcz4wSL1oe
 s8K0zJvfANWynFFixd73UFVvGSWuLVrHDFIlLBAr8WvjBBYQW0RAWeLq971gHcwCc5kk9v59
 yQ6SYBMwlOg92scIYvMK2Ek0Xv4FtoJFQEVi6tafYDWiAhESnx4cZoWoEZQ4OfMJ2FBOASOJ
 BdtmMoHYzAIGEkcWzWGFsMUlmr6shLLlJba/ncMMslhC4BG7xNatlxghfnCR+H/tPtQ/whKv
 jm9hh7BlJE5P7mGBaGhmlOjZfZsdwpnAKHH/+AKobmuJw8cvQnU7ShxechBoBQeQzSdx460g
 xGY+iUnbpkOFeSU62oQgqlUkfq+azgRhS0l0P/nPMoFRaRaS32Yh+WcWkn9mIflnASPLKkbx
 1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMA0dvrf8U87GL9eSjrEKMDBqMTDeyNkcqwQa2JZ
 cWXuIUYJDmYlEV6bP5NihXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgt
 gskycXBKNTDG/rbP3a6QopPFFeP3uVBe04SpceYt5WqBjFNJ16y+WJwItl5jM3+ejXCb8IQZ
 r37+2H9CNalh3+ET/94GflO5q6M/bcJ0c+XkG/u3Bj29fJlDod/XWH2D87l7t7okHrc2CQjF
 Bz1MdLsdeEs8vfzFuztpkrt+JrpIVn/dY2G3ZlKd65uFlgpKLMUZiYZazEXFiQDsoHNdXwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7r+TVNiDbbd0bW4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VouLK74wOXB7bPjc
 xOaxc9Zddo9NqzrZPDYvqfeYPuc/o0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZ
 WlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlTJ43k6ngIXvFvcYv7A2MG9m6GDk5JARM
 JObNb2DpYuTiEBJYyiixfO80xi5GDqCElMT8FiWIGmGJP9e62CBqXjNKrF7bzAqSEBaIlfi1
 cQILiC0ioCxx9ftesEHMAnOZJLbdfMEK0bGdUaLz/ytGkCo2AUOJ3qN9YDavgJ1E4+VfYJNY
 BFQkpm79yQ5iiwpESBzeMQuqRlDi5MwnYBs4BYwkFmybyQRiMwvoSey4DtHLLCAu0fRlJZQt
 L7H97RzmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERuy2
 Yz+37GDsehd8iFGAg1GJh7chaHKsEGtiWXFl7iFGCQ5mJRFemz+TYoV4UxIrq1KL8uOLSnNS
 iw8xmgI9N5FZSjQ5H5hM8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFx
 cEo1MPrt+moq8Xb62rnvJNR81h+84vf9r+2+qeJe77xyZbcIFk/Sv3P8ukvQvSt35jl9dFlZ
 +OKlbo1iCfsTuYk1T7lO/mu7P1Vx0sIpuS/Zj/1nnzOvKOzt5knB9Yu3Z/6s+vP4a9Ybw9eT
 Z75Rq9uYPvu8SHtsq1jPv6oG+TsWZtP+33n3WJ3TTdtNiaU4I9FQi7moOBEAlNLUqu4CAAA=
X-CMS-MailID: 20191002105615eucas1p2238ff9e54dd3a452d5e65a979a89a3e3
X-Msg-Generator: CA
X-RootMTR: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5
References: <CGME20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5@eucas1p2.samsung.com>
 <20191001123625.19370-1-s.nawrocki@samsung.com>
 <20191001175601.GB14762@sirena.co.uk>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v3 RESEND 1/3] ASoC: samsung: arndale:
 Simplify DAI link initialization
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

On 10/1/19 19:56, Mark Brown wrote:
> On Tue, Oct 01, 2019 at 02:36:23PM +0200, Sylwester Nawrocki wrote:
> 
>> Changes since v1:
>>  - rebased due to reordering patches in the series
>
> These still don't apply, please check and resend specifying what you're
> basing them on - I don't think this is an ordering issue.

Sory, the above is an old comment, it just refers to what I did
between v1 and v2. I'm not sure what happened, the patches were based 
on for-next branch, git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound

I will resend shortly with a fix for issue reported by the kbuild test.

ea7bfc805cee ASoC: samsung: Rename Arndale card driver
2db0e4f97a07 ASoC: samsung: arndale: Add support for WM1811 CODEC
fb5ca16f40f0 ASoC: samsung: arndale: Simplify DAI link initialization
82965165b0a9 Merge branch 'asoc-5.5' into asoc-next
952139a546d0 Merge branch 'asoc-5.4' into asoc-linus
4bb41984bf2f ASoC: max98373: check for device node before parsing
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
