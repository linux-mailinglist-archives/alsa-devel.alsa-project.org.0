Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A659E38EF0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 17:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DEE1950;
	Fri,  7 Jun 2019 17:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DEE1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559921133;
	bh=0f3xDmMNfFi2Xp+xlIM4HOg8K67lqTskpdHXh+6EwjQ=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eD/6DO3OrvBzI6eBO+mysydQt21gufog/6JrrvIEIDejR4JNNgBfFtSL9l8hkcqWJ
	 mnt37mVv4I1Ds2XYq+h/gJ4yIREzML+QZOPu+M9QO3f5qUqrAqlg6A1BTUG5rMze6r
	 /9JxppKZGOvlCV+KVV+/JKN+YJmbC5mINkZyO+VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B051DF896ED;
	Fri,  7 Jun 2019 17:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B671F896DD; Fri,  7 Jun 2019 17:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A3A2F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 17:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3A2F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dwo+ESBS"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607152337euoutp01e2aafe5a7cf75810576430941fa91c95~l8_aNfMot2226322263euoutp01c
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 15:23:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607152337euoutp01e2aafe5a7cf75810576430941fa91c95~l8_aNfMot2226322263euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1559921017;
 bh=AnxWjz7LzD+6Z9kZ/m9tjKJvjEZvx3zd1nNGGOVwEOE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dwo+ESBSYJDrb6yVZJVKMiDnigtAltUuss4SjnYdYrUay67nu1hDCPNhf8FlQvrS3
 +TWrNfDecStKd57wgxw0Ew4LfVWCrVn+IkdURqnG8BRwZsKuk/YXM6c6vi5cCwjEDH
 upIwj+8X6X/l5zJT4m6ZmhbtelVY4q57dbLAnD3c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607152336eucas1p2ee7610a6bd717f7913882918740db41f~l8_Zj0G-t1546415464eucas1p2g;
 Fri,  7 Jun 2019 15:23:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 79.75.04325.8718AFC5; Fri,  7
 Jun 2019 16:23:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607152335eucas1p2c22226b6ae0c7517384bd866d67d75d5~l8_YsAl501426414264eucas1p21;
 Fri,  7 Jun 2019 15:23:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607152335eusmtrp1e450f47d627e3afbac673a1521054a2b~l8_YcLURJ0882908829eusmtrp18;
 Fri,  7 Jun 2019 15:23:35 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-32-5cfa81780143
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 85.AA.04146.7718AFC5; Fri,  7
 Jun 2019 16:23:35 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607152335eusmtip21b9ca33cdf5471dd1d0ffd1d3fa48643~l8_X7vFrS2340423404eusmtip29;
 Fri,  7 Jun 2019 15:23:35 +0000 (GMT)
To: Tzung-Bi Shih <tzungbi@google.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <11aad80c-bdde-9a09-c74f-8082e6ee50c4@samsung.com>
Date: Fri, 7 Jun 2019 17:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUOjG9YvDrPud7TH1xdBVDX50Y9f3mA8hgyFQBVTgM==A@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj13b3brqPJ6zR80kAYElikmVaXFCkyGBGhP6I0I6fe1HIqmzNN
 Cqei8zOzbLqC9E+mYdrSlR+JbOqqZXMllF+kw6wGSuEHZp9ud5H/znvOeTjPeXgpQvSM60ul
 ZWQz8gxpupgnIPXD31/vzlWtx++5pvKnx6wGDv2ovp1L183O8ejnRhVBlzaoEW2xdPBpu7EH
 0atjag7dNjjNp/usdv4hgaRjqZAn6dZO8yWNOqVE11rGk6y+uk5KqjtbUTQvThCRzKSn5TDy
 4MgEQart2xA3axHlLj6wcAqQEZUjdwpwGKzYSshyJKBE+D4Cc5POKYjwMoLlz+GssITANjVB
 /Jtoapl2mZoRWB9Gs6YFBNM3fzkFLxwLH20zTuyNd0CRuZdwmAj8kgNTKgvpEHg4BKqGqp0m
 IY6Ed5pxZwKJA2C+WsNz4K34NCx361weT3jRMLcxS1HuOAYeG+McNIF9oHC5hctif3iycMe1
 6Bs+dI2dZXEUjM53u3gvsJs6+SzeDuYblc76gIsQVPZO8tlHDYIPpkbXkcLBaLJyHcEEDoT2
 nmCWPgyzahPHQQP2gPcLnuwOHlCr1xAsLQR1iYh1B8CPVg2Hxb5QMfeHrEFi7aZi2k1ttJva
 aP/nNiKyFfkwSoUshVGEZjCXghRSmUKZkRKUlCnToY1PZf5tWnmK+n8mGhCmkHiL8Gv+eryI
 K81R5MkMCChC7C3MGV2LFwmTpXmXGXnmObkynVEYkB9Fin2E+W4zZ0Q4RZrNXGSYLEb+T+VQ
 7r4FiHeg2XI7KHV4wlAcY6xMTNCkXdhnSbhXN7FUiicrBvXKiOhbB1W1oTXnjxki9icF5h0N
 aJNX9ld9WtCvSSIKwgb0Nsla1cmr/X4+hYuzfcUjb3N21ayvHu+y2OvHw62xSXR+2hF11OLe
 kbbygGxLpn1AL3erKvuiPLFt4FTR3StiUpEqDdlJyBXSv9SSbptQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7rljb9iDNruyVpcuXiIyWLjjPWs
 FlMfPmGzOHG4kdmifWYHo8X58xvYLV4d3sVo8e1KB5PF2iN32S32XHzF7sDlseFzE5vHzll3
 2T0WbCr12LSqk83j25mJLB59W1YxBrBF6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqb
 x1oZmSrp29mkpOZklqUW6dsl6GU8+niUteAdY8W71eeZGhgPM3YxcnJICJhILFx5F8jm4hAS
 WMoo8aZxAnsXIwdQQkpifosSRI2wxJ9rXWwQNa8ZJXo2dzGDJIQFIiWePnoANkhEQE2i+fRu
 ZpAiZoFTTBKNE49ATb3CKHHl9St2kCo2AUOJ3qN9YB28AnYS16ffBJvEIqAi8axvOhuILSoQ
 ITF7VwMLRI2gxMmZT1hALuIUCJTYfDgKJMwsoC7xZ94lZghbXKLpy0pWCFteYvvbOcwTGIVm
 IemehaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMzm3Hfm7ewXhpY/Ah
 RgEORiUe3hclv2KEWBPLiitzDzFKcDArifCWXfgRI8SbklhZlVqUH19UmpNafIjRFOi3icxS
 osn5wMSRVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBcUrZxv/M
 vbxP383pXvSYs3JVMPvaRokGf1+FpZHOf2bObopuCfKer/Ku5JSszvzAj1tvGRV318peONSb
 FhVTt6i6ZVnY7AnzHS+ollzv+6bPX7Vq09WnWmvOrXrNsWjehltzN/EkT3e2b1seeLXowUHF
 9qje4My2Nemmvyo/7v1hPUEuddby5UosxRmJhlrMRcWJAGvfJdLkAgAA
X-CMS-MailID: 20190607152335eucas1p2c22226b6ae0c7517384bd866d67d75d5
X-Msg-Generator: CA
X-RootMTR: 20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837
References: <CGME20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837@epcas2p1.samsung.com>
 <20190607141745.759-1-s.nawrocki@samsung.com>
 <CA+Px+wUOjG9YvDrPud7TH1xdBVDX50Y9f3mA8hgyFQBVTgM==A@mail.gmail.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, kuninori.morimoto.gx@renesas.com,
 b.zolnierkie@samsung.com, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Dylan Reid <dgreid@google.com>, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Fix freeing of incompletely
 initialized snd_soc_dapm_context
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

On 6/7/19 17:02, Tzung-Bi Shih wrote:
> Based on current for-next branch, we could simply remove the
> soc_cleanup_card_resources() call.

Thank you for looking into this, I will post a patch removing that
unnecessary call instead.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
