Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 953E7257916
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 14:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64AE17CD;
	Mon, 31 Aug 2020 14:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64AE17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598876242;
	bh=G9EribnLBK4cacraIzV2935AdwZQIa2x94zNFGc2jjc=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJKsVQGhGLXW+C3fly1IOjMUfGNzuQdyDGloTrTvqv5Pxb38wuPkx32AA5dA0js+q
	 LVRDsJZn7HgJ1mKrfqt/j8Zy4xcN9+7ACNR+OwHP4J/N0yAgAASVbhDOq6obaG4GfT
	 MkaCkp7FoD0olFDXUo5h5I3iTZBvA63Ejpwwujj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 930ACF80268;
	Mon, 31 Aug 2020 14:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB95F80257; Mon, 31 Aug 2020 14:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB9EDF80058
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB9EDF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="EowjvH/n"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831121537euoutp01a71472a738fabec878c1303f6016d7fe~wWWAdyEyd1700417004euoutp01b
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 12:15:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831121537euoutp01a71472a738fabec878c1303f6016d7fe~wWWAdyEyd1700417004euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598876137;
 bh=UJaaP850TcSo0Wk4YAvKHVnjzMrMzArNu+6pdtEXdic=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EowjvH/nrcmSMQjQbvddNNvMMRPsnK8IgMgf2tF3EgFyvo1yLUN9IwpQi/IVnQv9O
 6V98la2sA7tXlYxlp3XjSUJbmCr0esbF5drthzEgat+b/6ATqaT3YwuTWvNhoaj7rF
 BR9oDOw3n4aABUenVDwiJGoXe/VFOiRvaommk0ds=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831121536eucas1p27115e29900beb7719f5d71c84ab00f4e~wWWAJe8_L2676526765eucas1p2W;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 79.5C.05997.8E9EC4F5; Mon, 31
 Aug 2020 13:15:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121536eucas1p1699b8f10f2312de987ec27cff551db49~wWV-sf3Px2392423924eucas1p1n;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831121536eusmtrp233519dc8867fe1bda633ce061dabfe4a~wWV-rdhkM2586825868eusmtrp2H;
 Mon, 31 Aug 2020 12:15:36 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-a3-5f4ce9e8db07
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D2.4C.06314.8E9EC4F5; Mon, 31
 Aug 2020 13:15:36 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831121534eusmtip1a908de5eccebd235b68a4c3ca3458167~wWV_AZ6hT2131921319eusmtip1o;
 Mon, 31 Aug 2020 12:15:34 +0000 (GMT)
Subject: Re: [PATCH 02/10] dt-bindings: gpu: arm,mali-midgard: Use
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
Message-ID: <618bd5f4-0100-c219-5d5e-77743de22a7a@samsung.com>
Date: Mon, 31 Aug 2020 14:15:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-2-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUxTQRSGnbuDFoe6cIJbUhcUg4iimahx19xEYtT4YEwAi9yAkYJpBcQX
 FUWQTXCJ2BBAo4JEI5aliIJJBeoSi8rigqYquABR1Basa+VyIfL2/Wf+M+f8kxFo9UnOV9gV
 u1fSx2pjNJwnU9X4wxbwsSskfP5z1yySZbtHkZbHFopcz7vGktNvOjny1PmBJQWOKcRdlUuT
 wnobS1r6ejlywp7DkOMdPTRpairjib2vAZH+ljSKmDraWNJck8+RvKY6ilytf8WTlNp6njwu
 cVIk9V0XTcpNp+mVE8UyRzIn1vYXMeIN4yteNJUe48SXbbc48bPNxovm/tesaM+wUmL5hQNi
 dkUpEh2mqZtGb/dcFinF7EqQ9IHLd3hGdze/Q3ta6H3lde/pgyiTTkceAuBgSM2s59ORp6DG
 JQgq7Z8ZRTgR2FPucLJLjR0InC7v4Y4vx1xDHcUILH8+DomvCE7d+TYgBGEc3g7mvBC5Ph63
 M+BMLxs00bgdgaunl5ev4nAQZDVkI5lVeDkcvfR3kBk8E049cg/yBBwGldZWSvF4w72znYzM
 HngRVP56wspMYx940VlIKTwNzJ/yaXkY4LsCVJpzh5KuheeHL1MKj4NuawWv8GRw35Cb5YbD
 CDJvtvOKyBl4AWsRUlxL4aXtJydno/EcuFYTqJRXwZGcc4ORAXvBs0/eyhJecKLqDK2UVZB2
 VK24Z8Cv0jNDK/hCRqebyUEa44hoxhFxjCPiGP/PLUJMKfKR4g26KMmwIFZKnGfQ6gzxsVHz
 dsbpTGjgqz74a3VWo5rfERaEBaQZo3I1bAhXs9oEQ5LOgkCgNeNVqx8+CFOrIrVJ+yV9XLg+
 PkYyWNAkgdH4qBae7wpV4yjtXmm3JO2R9MOnlODhexAlskvWX8m6pQ0NMr8tyBz9MyBMc9E/
 5VIDigjOqnauyy+JLF4zZYUf+6isKLXpdlzf7wOwqnfm13NLuhZGx39P6sP33wb7XdiftPmh
 ddP72R1bFx//0B/gkey/5Ztf46jqN90hW3URGdO2vUaJYyNaE9Iaszd+P1Rx2VEcGpLbkzB9
 brKGMURrg/xpvUH7D2po3DOmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7ovXvrEG7Qd4bLoPXeSyeLKxUNM
 FhtnrGe1mPrwCZvF9S/PWS3mfZa1+L9tIrPF/CPnWC2ufH3PZjHp/gQWi/7Hr5ktzp/fwG5x
 /+tRRotvVzqYLDY9vsZqcXnXHDaLGef3MVmsPXKX3aJ17xF2i4srvjBZtD99yWyxedNUZgcx
 jw2fm9g89n5bwOKxc9Zddo9NqzrZPO5c28Pm8e7cOXaP7d8esHrc7z7O5LF5Sb1H35ZVjB6f
 N8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
 Zby6/JSx4ApzxeZ9z5gbGHuYuxg5OSQETCQ+dP5g72Lk4hASWMoo8XfpXSCHAyghJTG/RQmi
 Rljiz7UuNoia94wSv9/1MoLUCAtESWyf4QMSFxG4zSLx4uYzsKHMAncZJc7Ol4Jo2Mwosebp
 fEaQBJuAoUTv0T4wm1fATqJt2T8wm0VAVWLKhf9gtqhAnMTj3v/MEDWCEidnPmEBsTkFTCW2
 /r7ECrFAXeLPvEtQy8Qlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW5
 6bnFhnrFibnFpXnpesn5uZsYgSlk27Gfm3cwXtoYfIhRgINRiYf3x1HveCHWxLLiytxDjBIc
 zEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wveWVxBuaGppbWBqaG5sbm1ko
 ifN2CByMERJITyxJzU5NLUgtgulj4uCUamBsruxOkFvz6YPHhBf/bWRFhHPN+PYd6P3+duU8
 IYnbC5olzBqsw573eXDkVQvU+W9gU2O47JLzqG6bhRmv8MffjN1XRG7c15cOrlHd/nXTlxrh
 tpZwjzVcu5bcW2rXZJ7bnJ8eJyaunRRyqndahuJDH8FIO0HPlFdmxcJsl3fb37huP/tArhJL
 cUaioRZzUXEiAEOjGK03AwAA
X-CMS-MailID: 20200831121536eucas1p1699b8f10f2312de987ec27cff551db49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142527eucas1p21347ea8f219b266872f6b78c376ccd67@eucas1p2.samsung.com>
 <20200829142501.31478-2-krzk@kernel.org>
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
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
