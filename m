Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 371111734E8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 11:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B3116DB;
	Fri, 28 Feb 2020 11:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B3116DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582884251;
	bh=36/Fjd64dLx1SWTfG0q5Udxj2+kfk7RGS9ckU5BOzyQ=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKqNO8+JgoS44KJwDoKGCpKJGILWMksPlNxIDkubA7RatCSERhnSwhiKyUEo+2o44
	 53HwrjcdcRHgK9SjQS47CPa65mN2T2aQHLia9uf2Rnaiq3S/G/wJXNxRH9ym/AyTGV
	 Twxj/HS1QpP1DfPKPn4RhUqYVJP2w+zkI5hKmkx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A41F801F2;
	Fri, 28 Feb 2020 11:03:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D66DF8016F; Fri, 28 Feb 2020 11:03:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57724F8014D
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 11:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57724F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="MFvdCmoN"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200228100316euoutp02180cd6baf8be959123920dd71691874d~3iMplkAlb0201902019euoutp02Q
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 10:03:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200228100316euoutp02180cd6baf8be959123920dd71691874d~3iMplkAlb0201902019euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582884196;
 bh=eMqj8pWOediDjlLy2+V4VkSpUINij1DKCJJhLJG7JJc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MFvdCmoNI0ABSuTlMKlJzVRdwnOVhI9yLys3WAYbSWhiNuYLpI93Tm2c6T0+NKfmX
 Pvr/wBAz8qiuTylVISswW7J9em8AgJl30QXy1s6+/+OibD/zBkYy5riClIm3LoM6Pd
 9kpPKCXEOA1WTmR777PK5AxEbqbnLAsQueG9yNhc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200228100316eucas1p1cb06befaf72b5594e5afe86336a91319~3iMpavXDu2785327853eucas1p1J;
 Fri, 28 Feb 2020 10:03:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B9.9B.60698.465E85E5; Fri, 28
 Feb 2020 10:03:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200228100316eucas1p2cad2e9fa40e442ce7f0baf0fc311be10~3iMo4YyCW1566715667eucas1p2d;
 Fri, 28 Feb 2020 10:03:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200228100316eusmtrp24cf641cac51e4d4a74f7e79798580b3d~3iMo3tTdf2532325323eusmtrp2T;
 Fri, 28 Feb 2020 10:03:16 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-5f-5e58e564b4ac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.53.07950.465E85E5; Fri, 28
 Feb 2020 10:03:16 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200228100315eusmtip169cabc83cf64560d36922f66e5cdd17b~3iMoiIPyo2642426424eusmtip1R;
 Fri, 28 Feb 2020 10:03:15 +0000 (GMT)
Subject: Re: [PATCH] ASoC: samsung: Silence warnings during deferred probe
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <c39a1906-cc4d-031e-8dce-17d7be1891a5@samsung.com>
Date: Fri, 28 Feb 2020 11:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228095042.27389-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87opTyPiDFY/1bS4cvEQk8XUh0/Y
 LM6f38BuMeP8PiaLtUfusltcXPGFyYHNY8PnJjaPTas62Tz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoErY1a7VkEvW8W3H0INjI9Yuhg5OSQETCSe/f3A2sXIxSEksIJR4tWhzWwQzhdGifZ1
 XUwQzmdGiVlbjsC13Dk4FapqOaPEjafPoZy3jBJd8x+xg1QJC3hJHF7fxghiiwgUSsz+vhXM
 ZhYokLj+4zUriM0mYCjRe7QPLM4rYCexZPUSZhCbRUBVYs/+W2BxUYEIiWnb/0HVCEqcnPkE
 7ApOoPqt5+czQ8wUl2j6spIVwpaX2P52DjPIQRIC89glXr25wgRxtotEx6fjUC8IS7w6voUd
 wpaR+L9zPhNEQzOjRM/u2+wQzgRGifvHFzBCVFlL3Dn3C+hPDqAVmhLrd+lDhB0l5u6+xwQS
 lhDgk7jxVhDiCD6JSdumM0OEeSU62oQgqlUkfq+aDnWOlET3k/8sExiVZiF5bRaSd2YheWcW
 wt4FjCyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAtPN6X/Hv+5g3Pcn6RCjAAejEg/v
 gh3hcUKsiWXFlbmHGCU4mJVEeDd+DY0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6
 YklqdmpqQWoRTJaJg1OqgVGAc/a7FL/jYpabLhnf4F5ZY/tK07rxzOUfXLfm5X5IeHrfIXRz
 6Yme9w8X82WfcOfZ8WdN7JOszvRZxq1f77pL3ss9wuM7+dJr1c8qPD6b/699lTtjms7ZH/tu
 nrz33F0nhTuWX+7qWYXEd8zVfeu69NnuzZqudp/578n5y36cc13288jSh7PYlViKMxINtZiL
 ihMBsOIx9TMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7opTyPiDNp62C2uXDzEZDH14RM2
 i/PnN7BbzDi/j8li7ZG77BYXV3xhcmDz2PC5ic1j06pONo++LasYPT5vkgtgidKzKcovLUlV
 yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLmNWuVdDLVvHth1AD
 4yOWLkZODgkBE4k7B6eydTFycQgJLGWUeP74GWMXIwdQQkpifosSRI2wxJ9rXWwgtpDAa0aJ
 Sb+sQGxhAS+Jw+vbGEFsEYFCiaNbpoC1MgsUSJzcpwYxciKjxL/pJ8Fq2AQMJXqP9oHZvAJ2
 EktWL2EGsVkEVCX27L8FFhcViJB4PLEdqkZQ4uTMJ2B3cgLVbz0/H6yeWUBd4s+8S1C2uETT
 l5WsELa8xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7
 iREYWduO/dyyg7HrXfAhRgEORiUeXo9t4XFCrIllxZW5hxglOJiVRHg3fg2NE+JNSaysSi3K
 jy8qzUktPsRoCvTcRGYp0eR8YNTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1I
 LYLpY+LglGpgjHCwFbBJ33nbOSpxb7ZvY3HEqaC5XOIXv6qZX/vbY5X9yn/V/P/ar3U3Zj+9
 p2l+6lmP97uTQv/jJ8xSD7mtvadfM1RfZUpfwwSPzVOulPqFFz/lXtneOP+Ia6iOylXTPo5j
 89uWS/IeNdSyN7D2j8pdOEV8cYdh6Y3JswTXuGxk7PdYbbBeiaU4I9FQi7moOBEAen7eaMIC
 AAA=
X-CMS-MailID: 20200228100316eucas1p2cad2e9fa40e442ce7f0baf0fc311be10
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228095049eucas1p291d54f69ee1586060c3594c017616265
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228095049eucas1p291d54f69ee1586060c3594c017616265
References: <CGME20200228095049eucas1p291d54f69ee1586060c3594c017616265@eucas1p2.samsung.com>
 <20200228095042.27389-1-m.szyprowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

On 2/28/20 10:50, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  sound/soc/samsung/arndale.c        | 4 +++-
>  sound/soc/samsung/littlemill.c     | 2 +-
>  sound/soc/samsung/lowland.c        | 2 +-
>  sound/soc/samsung/odroid.c         | 4 +++-
>  sound/soc/samsung/smdk_wm8994.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
>  sound/soc/samsung/snow.c           | 4 +++-
>  sound/soc/samsung/speyside.c       | 2 +-
>  sound/soc/samsung/tobermory.c      | 2 +-


sound/soc/samsung/tm2_wm5110.c is missing?

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
