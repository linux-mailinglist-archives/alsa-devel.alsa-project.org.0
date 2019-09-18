Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9DB61F7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 13:01:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE46167F;
	Wed, 18 Sep 2019 13:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE46167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568804482;
	bh=NDkdXTWEwjEm9tA1gD24xpN40v2bEKtwj36iMMUm4qE=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zk8P0veUhaZY0/Svz0KT4gPHR1tU1cpv8Rq2ixiBl34Q4LqajW6WSSseBw309A8NK
	 dSrja/6oyIbnjBH9NNy89xYyzQhXFa1WoclQI/FP8wWi1KmeZsmEHpMfFQJRXxYYuv
	 A0CAmWEoXvXbftqiQB3DLTFH0OzgN6tvX4VsraO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A555DF804FF;
	Wed, 18 Sep 2019 12:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E16E0F80506; Wed, 18 Sep 2019 12:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C9AF80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C9AF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Qs5rX89+"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918105931euoutp014ca906e9d80a119bce27cbb4d71a4d61~Fg0OLkou_2141621416euoutp011
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:59:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190918105931euoutp014ca906e9d80a119bce27cbb4d71a4d61~Fg0OLkou_2141621416euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568804371;
 bh=2jEDKj5MAFz6XTPKSrPwEfw2rGM2tsF45iQeb5MLdts=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Qs5rX89+tABge3oooYdo+0uepfFED1PdWTNBRCe/GvGjjfzh7HHo0iz36iRNbsthN
 5GNy3yS1+O9vM5cSC50foHGMsK4YB/A6YYQCfDQu8PpsknKwbBcGMHxge9Bvtt64uJ
 TFoyAnSIFs5pOPJUCmGlcB0yKg+he4CqZP9d+VWU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190918105930eucas1p2946de83232f86640cf525db00739041a~Fg0NvRw3Y1803818038eucas1p2j;
 Wed, 18 Sep 2019 10:59:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E8.85.04374.21E028D5; Wed, 18
 Sep 2019 11:59:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190918105930eucas1p267a84aa997cabf559ecdba8a948f698c~Fg0NAiiCd1803118031eucas1p2g;
 Wed, 18 Sep 2019 10:59:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190918105929eusmtrp1d840941e062720d7d2e8ed8a09a31c36~Fg0MwRTue0218202182eusmtrp1w;
 Wed, 18 Sep 2019 10:59:29 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-a9-5d820e128b2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BB.CD.04117.11E028D5; Wed, 18
 Sep 2019 11:59:29 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918105929eusmtip11765f3282342cbbe84a55797020dad3f~Fg0MHSMz_1131611316eusmtip1Y;
 Wed, 18 Sep 2019 10:59:29 +0000 (GMT)
To: broonie@kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
Date: Wed, 18 Sep 2019 12:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918104634.15216-3-s.nawrocki@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGe+/H7nW4eV0fHkwMpkEFaZLFpcwUKi4RZX9EUVnNvFikM3bT
 0grnwrLlF9WYTaHI0BrUapllH0ZrusxUNBuFmporsJLSzaIv17ab5H+/c97nvM95Xl4aV/SR
 4fR+9SFeo1ZlKiVSoqHlR8dihVyXusT7LYrt6bJh7K1KC8kahlwStqfIitiL9g6S7ey8SbED
 E82I/dZTjLHWYSfJVnY2Yex1ez/Fur88JtmiR3aK7brqwZLk3E23TsI1mvopzmo+LeH6nA8l
 3O0rBZyx2ou4snoz4tzWyBR6uzQhnc/cn8trYhP3SPf9vsMfbFYc+XDmB6VFbrkeBdHAxMP5
 hmuknxXMVQSGwgN6JPWxB8EnWzkpFm4E+sIn2NTE2IsGQjyoQ1BiMlJiMepTuYoIv2omswEM
 2kmJn2cxc6C3+jTuF+HMMAZVJ1wBQwkTB6XNZcjPMiYRGrurAkww86HmlSEwPJvZBuODT0lR
 EwqtF1wBgyAmAe7YmnA/40wY6DxiCJyZB3dHqwNmwPyh4GK3jhT3XgPFQ624yDPho6OeEjkC
 2s6VEOLACV+eB72UWFQgGHBcQqJqJTx1dPluon0WC8FyP1ZsJ8PzsteYvw2MHF6PhopLyOFs
 gxEX2zIoPqkQ1dHwy2z894zhcMblJSqQ0jQtmmlaHNO0OKb/vpcQYUZhfI6QlcELS9X84RhB
 lSXkqDNi9mZnWZHvz7VNOibuoabfaTbE0EgZLIN2baqCVOUKeVk2BDSunCVLOV6QqpClq/Ly
 eU32bk1OJi/Y0FyaUIbJjs4Y3KFgMlSH+AM8f5DXTJ1idFC4Ft1Y9qpgdflZU/vY18rJ6AXr
 Vxl3syO9QVTEOIoPUaprU97eevkgun8FtJi3b9Vt2vL9TWnxkGUkofxZbUnNC9ZZvTaqblft
 cLBtVdvz0Pc7RwZC7Pf0p94sT6pKrDq/rmPzZbmz09tXf6yrhYuMyDdOaJItnjQgPuuljT/f
 DW0klISwTxW3CNcIqr+Vs423bwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xu7qCfE2xBge3allcuXiIyWLjjPWs
 FlMfPmGzuNK6idFi/pFzrBbnz29gt7j/9SijxbcrHUwWmx5fY7WYcX4fk8XaI3fZLT6/389q
 0br3CLvFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB53ru1h89i8pN5j+pz/jB59W1YxenzeJBfA
 EaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8Wdr
 asFRoYpn3T/ZGxg/83UxcnJICJhIfDyzjQXEFhJYyihxY45QFyMHUFxKYn6LEkSJsMSfa11s
 XYxcQCWvGSWabk1nB0kIC/hITG34xwZiiwiISdye08kMUsQs8JhJouPRGUaIjoOMEpN/vWMG
 qWITMJToPdrHCGLzCthJ7Lw0G8xmEVCVWHx1KtgkUYEIicM7ZkHVCEqcnPkE7DpOARuJrYf2
 gc1hFlCX+DPvEpQtLtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bn
 FhvpFSfmFpfmpesl5+duYgRG9bZjP7fsYOx6F3yIUYCDUYmHV+JsQ6wQa2JZcWXuIUYJDmYl
 Ed6A2vpYId6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HJpy8knhDU0NzC0tDc2NzYzMLJXHe
 DoGDMUIC6YklqdmpqQWpRTB9TBycUg2ME8VeRrE6H4sV38d5Vc1P1U8prSprzoeQMxvb8iu1
 3YKOiPSE68YpLfzkdJ/r8vS8g7d904uM5h9Z+HdZ0JGQeZdz9Cp+O2yuOTT1+L48k8qLhdrR
 rxwm3vA5F7sq6Iy5yq27TDOM2Da/Dud811P9P8DSrqt56y4tpshnR9qczzzkCf2QerFXiaU4
 I9FQi7moOBEA69LGWgADAAA=
X-CMS-MailID: 20190918105930eucas1p267a84aa997cabf559ecdba8a948f698c
X-Msg-Generator: CA
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
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

Cc: lee.jones@linaro.org

Excuse me Lee, I forgot to Cc entire series to you, will do it in case
of posting v2.

On 9/18/19 12:46, Sylwester Nawrocki wrote:
> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> part of the wm8994 driver so they can be further handled in the audio
> CODEC part.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c       | 9 +++++++++
>  include/linux/mfd/wm8994/core.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 1e9fe7d92597..02c19a0bdeb0 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -7,6 +7,7 @@
>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -333,6 +334,14 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
>  
>  	dev_set_drvdata(wm8994->dev, wm8994);
>  
> +	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
> +	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
> +
> +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
> +					 wm8994->mclk);
> +	if (ret != 0)
> +		return ret;
> +
>  	/* Add the on-chip regulators first for bootstrapping */
>  	ret = mfd_add_devices(wm8994->dev, 0,
>  			      wm8994_regulator_devs,
> diff --git a/include/linux/mfd/wm8994/core.h b/include/linux/mfd/wm8994/core.h
> index e8b093522ffd..320297a1b70c 100644
> --- a/include/linux/mfd/wm8994/core.h
> +++ b/include/linux/mfd/wm8994/core.h
> @@ -10,12 +10,19 @@
>  #ifndef __MFD_WM8994_CORE_H__
>  #define __MFD_WM8994_CORE_H__
>  
> +#include <linux/clk.h>
>  #include <linux/mutex.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/mfd/wm8994/pdata.h>
>  
> +enum {
> +	WM8994_MCLK1,
> +	WM8994_MCLK2,
> +	WM8994_NUM_MCLK
> +};
> +
>  enum wm8994_type {
>  	WM8994 = 0,
>  	WM8958 = 1,
> @@ -60,6 +67,8 @@ struct wm8994 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  
> +	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
> +
>  	bool ldo_ena_always_driven;
>  
>  	int gpio_base;
 -- 
Regards,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
