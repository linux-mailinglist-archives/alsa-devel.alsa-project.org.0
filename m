Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A9322949
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 12:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EC91679;
	Tue, 23 Feb 2021 12:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EC91679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614078629;
	bh=bPTcmgVqLC7LH4VCyBQF/EVo3YQCh4IE6cTwf+tIvxM=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fi/bKj4+/WW7Ae7NAA4y6TURkup0rejN0OnQhxage4RBYYvVou9/0KQ4KCZ4NrwpY
	 ulIW4SuDzZ3O/xigFuBjfaDBEO/f0nV/HvXnUxu8+s2LnHLk26SezPMCgXwLg31K0h
	 VoIeBwsygYOLKI6obJvU/vcz0g39O88l6Vo37WCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F898F8016D;
	Tue, 23 Feb 2021 12:08:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE65F80167; Tue, 23 Feb 2021 12:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51E30F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 12:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E30F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="LokRFB4Y"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223110834euoutp020a6023049e20d318e00cf5e73dbac74b~mW9tp04a40297302973euoutp02E
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:08:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223110834euoutp020a6023049e20d318e00cf5e73dbac74b~mW9tp04a40297302973euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614078514;
 bh=0ZtjqZHEBn344T5qB+uTrgn4sh7hjC5IHLFRSbfecB8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LokRFB4Ypq+9bxzy52yUKF9OHrrUy7BI+K0MCVjR9AJ5r/bfM9UwAm4mtEemOoLkG
 xWZBNkJtGNugU85RutRPbUCnUAIFewUwOduwrMqCoiUhrvhyGjnr6T8xskVJgc85tf
 KN6PfxjqQBzcJJie8QoZDpnT0qL1hSaB3vBrhtFA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210223110829eucas1p263d869576044103bfd97d65de99697e7~mW9o37MmT0784907849eucas1p2P;
 Tue, 23 Feb 2021 11:08:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 51.64.45488.D22E4306; Tue, 23
 Feb 2021 11:08:29 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210223110828eucas1p12ee86fb556a580f3ac6e993eb45617d6~mW9okTSJR2197721977eucas1p1r;
 Tue, 23 Feb 2021 11:08:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223110828eusmtrp191dff96a6d77e6d4d01673878184b796~mW9ojuEVr0593105931eusmtrp1B;
 Tue, 23 Feb 2021 11:08:28 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-7d-6034e22dd213
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.DE.21957.C22E4306; Tue, 23
 Feb 2021 11:08:28 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223110828eusmtip1f8d047ca4f4b6c87173599ea9458c6ea~mW9oHPLPt0146401464eusmtip1E;
 Tue, 23 Feb 2021 11:08:28 +0000 (GMT)
Subject: Re: [PATCH v2 4/6] ASoC: samsung: smdk_wm8994: add missing return
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6eceb431-3977-f86b-2075-d27b7d193da1@samsung.com>
Date: Tue, 23 Feb 2021 12:08:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-5-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzneV3dRyYJBt9mcltcuXiIyWLqwyds
 FufPb2C3+PX/GZPFy81vmBxYPTZ8bmLz2LSqk81j3slAj82nqwNYorhsUlJzMstSi/TtErgy
 ziz8wVrwmb3i+qUnrA2MR9i6GDk5JARMJHqvfWXuYuTiEBJYwSjx79dTRgjnC6PEjdYGKOcz
 o8ShpU/Yuxg5wFrmfiiFiC9nlPjTsIsJZJSQwEdGid3PZUFsYQEviYPbdjGD2CICcRLLv5xn
 B7GZBXwk5j17xwJiswkYSvQe7WMEsXkF7CTed84Aq2cRUJU49ek1mC0qkCTx9/dNJogaQYmT
 M5+A9XICzd94/CMbxExxiVtP5jNB2PIS29/OYYZ47QiHxL3JlRC2i8SZQ32sELawxKvjW9gh
 bBmJ05N7WECekRBoZpTo2X2bHcKZwChx//gCRogqa4k7536xgXzPLKApsX6XPkTYUeJQ33Jo
 oPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVKhK/V01ngrClJLqf/GeZwKg0C8lns5B8MwvJN7MQ
 9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmGBO/zv+dQfjilcf9Q4xMnEwHmKU
 4GBWEuFlu2uUIMSbklhZlVqUH19UmpNafIhRmoNFSZx319Y18UIC6YklqdmpqQWpRTBZJg5O
 qQamWItUT0mX5upVU584CptNbChyeJe7YeFUz2Xdj3fZTHdL6b9skn97b7y90mG7vOPH9h5g
 4yjfvvj8ny6Tu92X19ebGErlT18gf/bn/dzIfTrRlwqZl/55EVDO9/DJ1rl2VdfjF5q4HtjG
 wjr/1mkpJd7L+Ufi5te5mezvjl0p5Xao8HLGyfOVlup/P6/9vF/kgqmlzd23eyStV5UpHNVP
 utihfe1ucvmVoA+FnFYnOQMWNd6Sipt8uO+TseR2JsMrXzZbc8sJLxEyqFgeaMt24p7t+ua7
 h/QmV86tat9sW+Gv/bLhiMqxBjbnxwVyp1KV55jsen43jPPUEc/jM/Yu3T772e3rDBHTHEUv
 sSw/rsRSnJFoqMVcVJwIADFgXPufAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7o6j0wSDJbsMLS4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlnFn4g7XgM3vF9UtPWBsYj7B1
 MXJwSAiYSMz9UNrFyMUhJLCUUeLuscMsEHEpifktSl2MnECmsMSfa11sEDXvGSVebdjKCpIQ
 FvCSOLhtFzOILSIQJ7F74SEWEJtZwEdi3rN3LBANdxklui9/YQJJsAkYSvQe7WMEsXkF7CTe
 d84Aa2YRUJU49ek1mC0qkCSxfvpNJogaQYmTM5+ADeUEWrbx+Ec2iAXqEn/mXWKGsMUlbj2Z
 zwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsY
 gTG17djPzTsY5736qHeIkYmD8RCjBAezkggv212jBCHelMTKqtSi/Pii0pzU4kOMpkD/TGSW
 Ek3OB0Z1Xkm8oZmBqaGJmaWBqaWZsZI479a5a+KFBNITS1KzU1MLUotg+pg4OKUamFzYw176
 K4S999feeUC9JinXOiLV84V+yz4n0cNmK/kyN4Td2FM/8e8jowXfVTZb3nmsaBVosHlf1dlP
 abfXGK/S9uxu+c0uYeR0Ocsj4N5uP4aGm5WHXPccy8l54fxSzStCItCZ//AMhbeMa2u0PiqX
 iqitDphz8dUnbc9tgVOPXWWNLBcOqwpfEbfR63u5lUjA3A+H78U6Bb2cf2jifqF4hvN2J/Yc
 WHOjUuSvuX41H4PUNJ1fm4sfeepMTr36d1/5sctOy/O/zmhcW9IZc2HawY9eMQ4iOzomTpoR
 vVp3pr52Sdj/PBaJmnm1h4MOKNkvmuxo8vFwNnvrudtTM54bh8ZcOH/b13dX/4QP55RYijMS
 DbWYi4oTAZnsAgQyAwAA
X-CMS-MailID: 20210223110828eucas1p12ee86fb556a580f3ac6e993eb45617d6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213326eucas1p2a5ec3f9006b1a7a207fc9cfb30557dbc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213326eucas1p2a5ec3f9006b1a7a207fc9cfb30557dbc
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213326eucas1p2a5ec3f9006b1a7a207fc9cfb30557dbc@eucas1p2.samsung.com>
 <20210222213306.22654-5-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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

On 22.02.2021 22:33, Pierre-Louis Bossart wrote:

> The initial authors bothered to set ret to -EINVAL and throw a
> dev_err() message, so it looks like there is a missing return to avoid
> continuing if the property is missing.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>  sound/soc/samsung/smdk_wm8994.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
> index 681b244d5312..39a7a449f554 100644
> --- a/sound/soc/samsung/smdk_wm8994.c
> +++ b/sound/soc/samsung/smdk_wm8994.c
> @@ -164,6 +164,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev,
>  			   "Property 'samsung,i2s-controller' missing or invalid\n");

>  			ret = -EINVAL;
> +			return ret;

I think it would be better to just make it "return -EINVAL;"
