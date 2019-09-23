Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147FBB116
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 11:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991031685;
	Mon, 23 Sep 2019 11:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991031685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569229907;
	bh=wuLav0rwCCHJBWiG8SGminEvTMbnQr3oSNAqnLgJ38A=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTN/sUJwDYoPwpbDeUXsGH/6UOA67RhrsxgXxdFb2yM3ahrLdEWml7GU1+0/jAUgp
	 JOhq5ZE3GnJOqLbalqTan2QjY+2uQY05eHieEsy/ykh3Hb39zGoC7PF6zVfouSpod2
	 YY/UFla26ggAnyBBqGeCSti9OVl/HkYb/Na3/rWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A568F80307;
	Mon, 23 Sep 2019 11:10:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D055BF80307; Mon, 23 Sep 2019 11:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F234F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 11:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F234F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="aNDJgGba"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190923091050euoutp02aaf9f92bc0479eccc77b445b9a56c761~HBjwL5Dtq2425624256euoutp024
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 09:10:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190923091050euoutp02aaf9f92bc0479eccc77b445b9a56c761~HBjwL5Dtq2425624256euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569229850;
 bh=sJFGixggdfSh+3Tydvyrjw/01BV99aMGABZcrjIjOUw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=aNDJgGbaXScdaz3ffMIFVeg/kJsA15EwmXTxbib8IZ7obhlZJH/7+qglUnSfswcUd
 GoyZrzdLRVouZUhTFRgPRITtC7hZWfSgiOWdm/Nq2LCrRRh/mfmnqS2/4mDS4P+SDX
 SKdLOMUGpa3jIGRdByT9J12BV/2cO4sKznyW51Mo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190923091049eucas1p18b9dbfc97dc9f0f0a364603fffc0114c~HBjv9x0Zu2396623966eucas1p1_;
 Mon, 23 Sep 2019 09:10:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9A.AB.04309.91C888D5; Mon, 23
 Sep 2019 10:10:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190923091049eucas1p2bf446bf588bc572efb8b29e615df146f~HBjvedxh81559015590eucas1p2s;
 Mon, 23 Sep 2019 09:10:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190923091049eusmtrp129bf025e48f9e71dcb8d2cc3f3aeee07~HBjvbwmAF2163521635eusmtrp1M;
 Mon, 23 Sep 2019 09:10:49 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-53-5d888c1979fb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1C.3A.04166.91C888D5; Mon, 23
 Sep 2019 10:10:49 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190923091048eusmtip17aa662854177c63d68ebe7df5d93881f~HBjuzdgQD2228322283eusmtip1c;
 Mon, 23 Sep 2019 09:10:48 +0000 (GMT)
To: krzk@kernel.org, ckeepax@opensource.cirrus.com
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
Date: Mon, 23 Sep 2019 11:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920130218.32690-4-s.nawrocki@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djP87qSPR2xBsvPGVlcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
 uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHsUl01Kak5mWWqR
 vl0CV0bnb5OCeawVf/f8Z25gnMPSxcjJISFgInHv6ER2EFtIYAWjxMxvkV2MXED2F0aJW6fm
 MkE4nxklNv28xQbTceffW0aIxHJGiWenfrJCOG8ZJRb83Qo2V1ggVOLr5nNgHSICRhJbD8xm
 BrGZBTYySaybYgJiswkYSvQe7WMEsXkF7CSu7tsNdgeLgKpEZ98HMFtUIELi04PDrBA1ghIn
 Zz4Bm88pYCNxaU0vG8RMcYmmLytZIWx5ie1v5zCDHCQh8JFd4tbTlewQZ7tIPL64ihXCFpZ4
 dXwLVFxG4vTkHhaIhmZGiZ7dt9khnAmMEvePL2CEqLKWOHz8IlA3B9AKTYn1u/Qhwo4S8xtm
 sYCEJQT4JG68FYQ4gk9i0rbpzBBhXomONiGIahWJ36umM0HYUhLdT/6zTGBUmoXktVlI3pmF
 5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECExop/8d/7KDcdefpEOMAhyM
 Sjy8Hza2xwqxJpYVV+YeYpTgYFYS4d2k1RYrxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0
 kEB6YklqdmpqQWoRTJaJg1OqgVF79sYWN/ngu7wqia+fqt+9pvjpXHUVn3f7p1qf7hCmo7++
 ZOVWBRy4PKuixLq21c2qNz4oxv1Y8rG++MOPPxwqsdLZnrvyit0/gXV3+TjTboVf85mW9uzo
 9SllaWZ3BWMYVrn9Oh68dOcXJoN8Ucu5BjnqL34W2VZE9y/69KnoZsBrPqu/pUosxRmJhlrM
 RcWJAM5xCKZkAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7qSPR2xBn1neC2uXDzEZLFxxnpW
 i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
 XFzxhcmB12PD5yY2j52z7rJ7bFrVyeaxeUm9x/Q5/xk9+rasYvT4vEkugD1Kz6Yov7QkVSEj
 v7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL6Pzt0nBPNaKv3v+Mzcw
 zmHpYuTkkBAwkbjz7y1jFyMXh5DAUkaJSaumAjkcQAkpifktShA1whJ/rnWxgdhCAq8ZJS6f
 CgCxhQVCJSbPmc8MYosIGElsPTCbGWQOs8BGJokFR/uhhh5klLj/4S8jSBWbgKFE79E+MJtX
 wE7i6r7d7CA2i4CqRGffBzBbVCBC4vCOWVA1ghInZz4Bu5RTwEbi0ppesCuYBdQl/sy7xAxh
 i0s0fVnJCmHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6
 yfm5mxiBEbzt2M/NOxgvbQw+xCjAwajEw/thY3usEGtiWXFl7iFGCQ5mJRHeTVptsUK8KYmV
 ValF+fFFpTmpxYcYTYGem8gsJZqcD0wueSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1Kz
 U1MLUotg+pg4OKUaGD3aTk2X5OuLMPStW/+U60hvnM7PlYsSowTvB7i7/ujfNOkVS79g2P/Q
 1I0G7l9EK809iyc77RXemL9qHd8Kh9v7nx2M/rHq9W/V+ZcWl3vO3WY4a7vqs/7YK9Gyy7Xm
 itv/qllVfXZdoZCHrNeXFZE1e3/P9V150W37xZ8nAnZ3ZBxZbX6hvkSJpTgj0VCLuag4EQBt
 27UX9gIAAA==
X-CMS-MailID: 20190923091049eucas1p2bf446bf588bc572efb8b29e615df146f
X-Msg-Generator: CA
X-RootMTR: 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
 <20190920130218.32690-4-s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 03/10] ASoC: wm8994: Add support for
 setting MCLK clock rate
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

On 9/20/19 15:02, Sylwester Nawrocki wrote:
> Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> MCLK2 clocks through clk API when those clocks are specified in DT.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Sorry, I squashed other patch to this one but forgot to remove above tags, 
not sure if those still stand as there was rather significant change in 
the patch. 

> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - getting of clocks moved from MFD to the CODEC's driver probe()
> ---

-- 
Regards,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
