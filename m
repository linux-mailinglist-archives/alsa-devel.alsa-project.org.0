Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14195C3A13
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 18:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E901674;
	Tue,  1 Oct 2019 18:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E901674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569946285;
	bh=geskF9KVaaFr3atN/DyXttrf5iE6w7d9OZHJYrOo9l4=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NPG3AaMhpYZ3ODuqxrTnJpUbGraOyxRdW39y18DfSd/2hzY0a+kISldxs007WLON3
	 t2WXm/P9TkstVZ1GWbEMX/YWmtjIhdoFSV/tnBPjg/97cbLzpzjEkcthchzGF9Iuq7
	 CtxQVRpWCgUu8wfT4RV6eMRwgC15FcaSLolJqlUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465F7F805FF;
	Tue,  1 Oct 2019 18:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01BAFF80482; Tue,  1 Oct 2019 18:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E975F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 18:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E975F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="OzBe6rYt"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191001160914euoutp019a57901cc65db4f3959976d48e3dd93b~JkbW0-tP_0806408064euoutp01x
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:09:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191001160914euoutp019a57901cc65db4f3959976d48e3dd93b~JkbW0-tP_0806408064euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569946154;
 bh=0iXMcbO5zbECgDnWNZ06BqtYV9m9VlieFlQ6pOPEbvA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OzBe6rYt5XCT0stjr5ugyXUZJPiZlu4PWOWyn3H3KQTrSugx2+lS0A+eEYTIg5VnE
 A7/fVyDJMvGQeWkw/5DDRHEUux+iFx2k9O0o0FBH2tUnosJVSI7E0Tdtl/levzNTT6
 qFjO5OGQ/OVeV+aNvEHe7nNkBKbjwQpfsCeAyBLw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191001160914eucas1p278f9a0f55b635d74feeb1c0e4117d6e1~JkbWrWueW2183421834eucas1p2Z;
 Tue,  1 Oct 2019 16:09:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.B8.04309.A2A739D5; Tue,  1
 Oct 2019 17:09:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191001160913eucas1p1ce452b9fe9bfa44843438a67a7822a57~JkbV_BVvv2988729887eucas1p1E;
 Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191001160913eusmtrp2acb5fb911c2b830ef6a7bb3f1d64291c~JkbV9V3dx1352113521eusmtrp2s;
 Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-b1-5d937a2a24e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.F6.04166.92A739D5; Tue,  1
 Oct 2019 17:09:13 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191001160913eusmtip28cac83a3c5e49e10aa8353c3e73e9d70~JkbVUfWlO1030610306eusmtip2I;
 Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
To: broonie@kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <4baf2a0d-f0b3-579c-365c-2948e7c841c9@samsung.com>
Date: Tue, 1 Oct 2019 18:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001123625.19370-3-s.nawrocki@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO5ftuFp8ztvLkoqxP0U3JehAIkWBEwqkfhSF1ClPGrkpO2rO
 ytRu3tJKa+s0yUuwGl10VmoXrU03TdgUTBSzC0mhIIYbQRSutlPkv+d53ud93+95+RhS5abV
 zHFDHm80cNkamYJ66v7hXb+2qC59U+W8mh0ZdhJsm+URzV7/NCVjRy44EOvztcrZ7yPlBOv4
 PEqzFl83wT7onZSz/rkemh2+GyC2LdW1+stkui5xUq5z2CtkuvY7Z3VmaxDpah7bkc7vWJkm
 P6BIyuCzjxfwxo3JhxVZlzpjcr1Eoc0yKCtB9UQlimAAbwbxRhVViRSMCt9F0DgukhIJILhf
 2y2TiB/B4Plzf2xMuKXegyXdhuChd4AOjVLhWQS3XIqQJwrvgjafKSRH41iYsFaEh5K4gYBp
 ew8ZKshwAlzuq0EhrMTJ4D3vpkKYwloY/CKGZ8bg/TD/0UVLnkgYuDkV9kTgJGjxPwz3kjgO
 ygL3aAmvgo5Za3gZ4PdysHZ8kks5d8JM71tawlEw43n8V4+HYNdtQmo4h6D6+YRcIlcQfPA0
 Ism1FVyeYToUjcRr4NGzjZK8HbpezBHSVZbD2Gyk9IjlcO2pmZRkJZRfVEluLfy0m/+eXQ1V
 U0HqCtKIi6KJi+KIi+KI//c2IsqO4vh8QZ/JC4kG/uQGgdML+YbMDUdz9A7053cNLngCnejZ
 ryNOhBmkWaYs2VOXrqK5AsGkdyJgSE20MunXtXSVMoMzFfHGnEPG/GxecKIVDKWJU55a8vGg
 CmdyefwJns/ljf+qBBOhLkHapgTfrr2NhS9fGXaL0/7U6nXeBkXfvoGhuaPN/c0tZadZ5nXQ
 Uv/tw8KTjOoIxVetUjg43dlfbAnM82VgMDe3p8X7V7pNtU2aN6ljy4bp3ZytYW+pb8vNsVWu
 1LSa4I6lD8aHYgtSrua9e5+Y0hSXmLq62HUs1zZdKjtjHa3VUEIWl7CWNArcb1mudhRZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7qaVZNjDfbd0ba4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VouLK74wOXB7bPjc
 xOaxc9Zddo9NqzrZPDYvqfeYPuc/o0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZ
 WlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehltO8QLTjHVLF8xmm2BsYpTF2MHBwSAiYS
 U44LdDFycQgJLGWU2PdpNjNEXEpifotSFyMnkCks8edaFxuILSTwmlHi5Z5QkBJhAR+Jjecr
 QcIiAmISt+d0MoOMYRaYyyTR928zC8TMg4wSWx7vYAWpYhMwlOg92scIYvMK2EmcaznGAmKz
 CKhInH42C6xGVCBC4vCOWVA1ghInZz4Bq+EUsJFY/HkdWJxZQF3iz7xLzBC2uETTl5WsELa8
 xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYqduO
 /dy8g/HSxuBDjAIcjEo8vA1Bk2OFWBPLiitzDzFKcDArifDa/JkUK8SbklhZlVqUH19UmpNa
 fIjRFOi5icxSosn5wCSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBsW05K8v6qpbKXw7Ps/Nr+Q/pJpv+We0ZYLZWS/3xm8mXFkifyJvZK7/F3nxhnV4Qg/os
 j+oZ13Jvb7FRPaV/8ebZXyuXaX4QWnXwgN9ilzzLNU/0/qodCz60WtrA7Fe9ntjXz6mLuquP
 d8R+Fg7M0T26OTyiJFJm1uF8wfdnXDmiLm9bkmfOpMRSnJFoqMVcVJwIANxqanXqAgAA
X-CMS-MailID: 20191001160913eucas1p1ce452b9fe9bfa44843438a67a7822a57
X-Msg-Generator: CA
X-RootMTR: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
 <CGME20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628@eucas1p2.samsung.com>
 <20191001123625.19370-3-s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v3 RESEND 3/3] ASoC: samsung: Rename
	Arndale card driver
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

On 10/1/19 14:36, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I forgot to add carry the tag:
 Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
