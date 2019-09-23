Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A30BB12E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 11:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020791680;
	Mon, 23 Sep 2019 11:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020791680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569230102;
	bh=qxPAm29J7u3rdjL5xV8NdGrOVNoSKgKCiqubKBEXzW4=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxNuPutRvAKNq1RrZPbRWOMQRvremRvYrjbsGOppVYrSCf89mLOjR5zr3ViasGx1L
	 /+u+P4dSM9LGQ6QE6sYg+89MyNxjJiJy9IvlxEpOfh7/dkhisWDd+cXUILimGmbDPl
	 fnvgtqEZ3bWunTx6OjVwLHo8lhw/9wISqF6T4rxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C23F8031A;
	Mon, 23 Sep 2019 11:13:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0335F8044C; Mon, 23 Sep 2019 11:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 211D6F80213
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 11:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 211D6F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="aHcqw3KX"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190923091311euoutp0106ab3f56a6d4d4b734c2ae31b0680ac0~HBlz0cXEY3131431314euoutp01Q
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 09:13:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190923091311euoutp0106ab3f56a6d4d4b734c2ae31b0680ac0~HBlz0cXEY3131431314euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569229991;
 bh=qIK8taltfCKWFlPoIMMxrFkgSt6/LrKqErC+DI905S8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=aHcqw3KXIo8dgjm/vOz6DEGLIlasXI1x77rly79o146HeDKfesTpqbFJlegqrS1Ag
 VTnOfpw1NF9BRDJZ13DKEpRbJsgs3tD059nJzEnlpfDc42CqNZrhCDpWxPF0cDuSPi
 tWSQfJYDai1j4F4BYIOVsuILlLOD+8Rw8NMZyBdQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190923091311eucas1p2d2be606ea670487014c75c9ad3ad6d5e~HBlzmzCI82760427604eucas1p2V;
 Mon, 23 Sep 2019 09:13:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.2C.04309.7AC888D5; Mon, 23
 Sep 2019 10:13:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190923091310eucas1p2c0661bfbcf97f525d614c305f3d9069e~HBlzPKfuK3004130041eucas1p2T;
 Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190923091310eusmtrp1379bfc3dfaa0b68f652ac9cadf7cc353~HBlzOB8yp2265222652eusmtrp1w;
 Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-68-5d888ca7f3c1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9C.9A.04166.6AC888D5; Mon, 23
 Sep 2019 10:13:10 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190923091310eusmtip25b8e0ba225f8520fbed0c7b717e3db16~HBlysU_ZI1815118151eusmtip2L;
 Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
To: Charles Keepax <ckeepax@opensource.cirrus.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <91b0fc41-61e6-4650-2991-313dda4b494a@samsung.com>
Date: Mon, 23 Sep 2019 11:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTudx+722h1XYaHJT1GUY3SZgWXSiuIWlBqURCa1a0uS3IzdrWH
 0UvztdaUHsxG0ChJG6VuiemigrU1cuVYWIQlJa2oSEu3XibZtovkf9/3ne+c8x04YlweJBXi
 fH0RZ9CzBUqRlGh79LtrYYOpKm/RULuU6Q66McZR10wyF/tCIqa73ImYK54ukgkEWijmR3cV
 xjjfvSCZusB9jLnl6aWY8NcHJFN+z0MxwcYItkqmaQmXijQd1l5K47RXizS3609oLJdHkcbc
 akeasHN6NpUjXbGXK8g/yBlSM3ZJ9/lDTdiBCHG43ObFTqLThBFJxEAvgWftI1gMy+lGBKM1
 WUYkjeIIgsGPj0UCCSO4OfCBHOsI9FlIodCAYMjUigmkH8HwLx+KuabQ2dDjex3vSKTTYNDX
 EzfhtBuDjoHn8YUiWg1nveZ4g4zOgGBjfVwn6Dlg/uISxfBUehsMvX1ICp4EeHwpFA8uodPB
 UXk/7sfpJCiN3CAFPAPu9F/GhajfKbjwR2FE4iheAx3D6wV5Cnz2tVICTgb/eRMRywZ0GQLT
 3VeUQGoRvPHZkOBaDg99QTI2CKfnQ7MrVZBXg7HXRQjzJ8HL/gQhwiQ412bBBVkGVRVywT0b
 /tgtmIAVcCY0StQipXXcYdZxx1jHHWP9v9eGCDtK4op5nZbj0/TcoRSe1fHFem3KnkKdE0Uf
 zf/XF2lHrpHdbkSLkXKi7JujMk9Osgf5Izo3AjGuTJQ5VRV5ctle9kgJZyjcaSgu4Hg3miYm
 lEmyoxPe5sppLVvE7ee4A5xhrIqJJYro12SNsnjfsrlL29TGTj/R1fK5ZMLVlmP248/Mfluz
 8b33eq4qJ2X3OlPm1qfzqivrZ277uWD7zprrh7Mnh7ZoNqz81CSzrDUt3iFSbby3RCs5VfrJ
 PXUw2LloeuoTPD09rSH590vp5ia+Th3Mz7w2y5vgOT2wiaXWZuVVv7jp0BaVKQl+H6tW4Qae
 /QduY9ZyZAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xe7rLejpiDe49MbC4cvEQk8XGGetZ
 LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
 cXHFFyYHXo8Nn5vYPHbOusvusWlVJ5vH5iX1HtPn/Gf06NuyitHj8ya5APYoPZui/NKSVIWM
 /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzTT9YxFXxhqWhdcJSp
 gbGFpYuRk0NCwETi/MPprF2MXBxCAksZJT6t38DcxcgBlJCSmN+iBFEjLPHnWhcbRM1rRomm
 nvWMIAlhAT+J6ZvOgNkiAkYSH4/fYgIpYhY4xCRxf91aJoiOL4wSpz7fYQapYhMwlOg92gfW
 wStgJ3FxxRImEJtFQFWi780uNhBbVCBC4vCOWVA1ghInZz4BO5VTwFZiY/s+sHpmAXWJP/Mu
 MUPY4hJNX1ayQtjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFp
 Xrpecn7uJkZgFG879nPzDsZLG4MPMQpwMCrx8H7Y2B4rxJpYVlyZe4hRgoNZSYR3k1ZbrBBv
 SmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNMXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTE
 ktTs1NSC1CKYPiYOTqkGxgmufQ/i62/+Ed6Z3dRo0/bG+flqmRuX5We+e66vr5wwNUT556Gg
 X5NXBGz8X+Tg5n/z2+c5bKmTX3QVFl5QnBqRXuiy7NLNjXmM+zOLo4+9KI66OOdNTVNYmPr9
 Il1JzuPeYdu1Fr/YzLTxwt66BY4Kp6PiF8WkcPxZNG9R1bU+uQ09lz6e0VNiKc5INNRiLipO
 BADi7Ypi+AIAAA==
X-CMS-MailID: 20190923091310eucas1p2c0661bfbcf97f525d614c305f3d9069e
X-Msg-Generator: CA
X-RootMTR: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
 <20190920130218.32690-5-s.nawrocki@samsung.com>
 <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 04/10] ASoC: wm8994: Add support for
 MCLKn clock gating
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

On 9/23/19 10:51, Charles Keepax wrote:
> On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
>> As an intermediate step before covering the clocking subsystem
>> of the CODEC entirely by the clk API add handling of external CODEC's
>> master clocks in DAPM events when the AIFn clocks are sourced directly
>> from MCLKn; when FLLn are used we enable/disable respective MCLKn
>> before/after FLLn is enabled/disabled.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Looks good to me:
> 
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks a lot for reviewing!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
