Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4D322923
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 11:59:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614BC86E;
	Tue, 23 Feb 2021 11:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614BC86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614077948;
	bh=weq/ytXsfwPl82u1FVxuh9duJvAW6ItynvJxmtS/k0U=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9HFr8gHcF5tX71F9+Bq4JtxyCKQE5nc83uUa8+FNiLwXp1cn4ZwGxQpbaxxFyD4R
	 rIBnm8gS3B1qVZGMA5CkPmYDjVGscJ4tgOYgICW8up8mkTTFwAq7gJcKmo0N7p4YeS
	 x+ngFxophfUP+cmk8rRs3NTmXLRmFjHjbXd/r8eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE049F80169;
	Tue, 23 Feb 2021 11:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B130F8016A; Tue, 23 Feb 2021 11:57:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735CAF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735CAF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="gDIMtiJn"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223105713euoutp02a97c02b39f67448416ca44cb12fe3690~mWzz7aSW22709227092euoutp02k
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:57:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223105713euoutp02a97c02b39f67448416ca44cb12fe3690~mWzz7aSW22709227092euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614077833;
 bh=5Hp5cqvIhEbjl3dxwwsHZW5Mhbh1JKq6PIuVZeVhgPs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=gDIMtiJnSq2xnuP4FdnYsByW1gj8SOQmSYBiCkAPOYi+/yxF9Oa4ISnxPesUDXKmB
 6qDaUC4IYD5REgQWTBiwWMPrepSkgfi9hH9QQg201HeOo2EiaJoqAErGF/hoO3J42e
 lQj14xKr3y4m1aYjUksHEnz4LsNCCu1uUYyuydkw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210223105713eucas1p1d475f56787ad369bff4f1ae89fd75446~mWzzrSm9e3155831558eucas1p1r;
 Tue, 23 Feb 2021 10:57:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9E.42.45488.98FD4306; Tue, 23
 Feb 2021 10:57:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210223105713eucas1p1b60061a3cfd8e24f087e24b4797fc953~mWzzVASpp1389413894eucas1p10;
 Tue, 23 Feb 2021 10:57:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223105713eusmtrp1a2ee3ade3770479cd951f75426ca4f11~mWzzUKaLZ3267032670eusmtrp1q;
 Tue, 23 Feb 2021 10:57:13 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-7b-6034df89fcac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.EC.21957.98FD4306; Tue, 23
 Feb 2021 10:57:13 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223105712eusmtip1f892ecd4713842eb734b1a6e99b4a14c~mWzy9WrXR2693526935eusmtip1b;
 Tue, 23 Feb 2021 10:57:12 +0000 (GMT)
Subject: Re: [PATCH v2 3/6] ASoC: samsung: s3c24xx_simtec: add missing error
 check
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <a24b9741-7621-78a1-fdb8-73ce9f78f056@samsung.com>
Date: Tue, 23 Feb 2021 11:57:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222213306.22654-4-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduzned3O+yYJBu1/VCyuXDzEZDH14RM2
 i/PnN7Bb/Pr/jMni5eY3TA6sHhs+N7F5bFrVyeYx72Sgx+bT1QEsUVw2Kak5mWWpRfp2CVwZ
 9y++YS74yVKx8pNYA2MvSxcjJ4eEgInEpbdH2EFsIYEVjBKtfwq7GLmA7C+MEi0HvjFBOJ8Z
 JR4e6GeF6Zi6eQYbRGI5o8Sv2WegnI+MEvNOnwSbKywQIrHp9wywDhGBOInlX86D7WAW8JGY
 9+wdWA2bgKFE79E+RhCbV8BO4sCPpWA2i4CqxPZJy8FsUYEkib+/bzJB1AhKnJz5BKyXU8BL
 4ujbe2wQM8Ulbj2ZzwRhy0tsfzuHGeQgCYEjHBKne08wQ5ztIvHr8zwoW1ji1fEt7BC2jMTp
 yT0sEA3NjBI9u2+zQzgTGCXuH1/ACFFlLXHn3C+gdRxAKzQl1u/Shwg7Srz9OxssLCHAJ3Hj
 rSDEEXwSk7ZNZ4YI80p0tAlBVKtI/F41nQnClpLofvKfZQKj0iwkr81C8s4sJO/MQti7gJFl
 FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCKOf3v+NcdjCtefdQ7xMjEwXiIUYKDWUmE
 l+2uUYIQb0piZVVqUX58UWlOavEhRmkOFiVx3l1b18QLCaQnlqRmp6YWpBbBZJk4OKUamEoW
 R988+qFUICvpR25EerPLNfal2qHZWauPKjmFqIs8+n7lrN3zXMOEGimZ5BfPMk+YbopTyre/
 teL+5ok6K61Npy06ICBXJB0zNWbiqhsdSx/e1J9oUpoge/Tt7fqDGVeilUzf6P9/VKlxsXlO
 49O+u3WOUhsfpEzeoiCqdC/+k7AaW4VMKDN7ScqfU+7rfnFeLl3bGpHf0TfRX8XTqshp+WSl
 ut+X/4s9vlDXbfOtTdWz5KyvIDfP2Z6J/9v37/1evuZgStXSiB4zMZkim7e/op5OstB+UzZ7
 77F5ro/VplVpfZ64eOLredtN/PoW+dfLr9ulqzXvXGKf5/naXdpHqjS2Hg/ubP3L9PSIthJL
 cUaioRZzUXEiAIHGU3OgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7qd900SDLbO57O4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl3L/4hrngJ0vFyk9iDYy9LF2M
 nBwSAiYSUzfPYOti5OIQEljKKHH4eQt7FyMHUEJKYn6LEkSNsMSfa11QNe8ZJU7t/cMIkhAW
 CJHY9HsGK4gtIhAnsXvhIbChzAI+EvOevWOBaLjLKLGjax4bSIJNwFCi92gfWDOvgJ3EgR9L
 wWwWAVWJ7ZOWg9miAkkS66ffZIKoEZQ4OfMJ2FBOAS+Jo2/vsUEsUJf4M+8SM4QtLnHryXwm
 CFteYvvbOcwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiM
 qW3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeNnuGiUI8aYkVlalFuXHF5XmpBYfYjQF+mcis5Ro
 cj4wqvNK4g3NDEwNTcwsDUwtzYyVxHm3zl0TLySQnliSmp2aWpBaBNPHxMEp1cC0o0/xzxQ9
 2Tc72aVcvhz8VnUzRucpS7JE5/WqJzzvXc+7K6e9kvy2emqOXx8v8zLtJP1Z2cmGVSxX528X
 yjMwvK9leMNOVLBsX+eOaRxXrp6Nmv478MTrJ8yep1Zt9VzwVS72RMVFi3C5mDdXi46nvqvm
 DL99snDtscolak/KJb4mLwyfUfG+Mvv8G7XZYXe7tupd4nd7HmdapVmpvG9P14l5X9iXx/TN
 4LF1D6jj+X+3wt4lUTkgu6GbuXXZ/E3bkxdfXfU+zWx/4t6k65ffbpmquUey88xxn6u96zvd
 yrfZOG9+4vIkKi3H6lG80feLJosWmiXnvPO1vDDjYFT5AsufV9ptKvakdM+uDa5VYinOSDTU
 Yi4qTgQA9l2yejIDAAA=
X-CMS-MailID: 20210223105713eucas1p1b60061a3cfd8e24f087e24b4797fc953
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222213326eucas1p2d0eacf79c5f34b08d5e493782f8d1fdc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222213326eucas1p2d0eacf79c5f34b08d5e493782f8d1fdc
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213326eucas1p2d0eacf79c5f34b08d5e493782f8d1fdc@eucas1p2.samsung.com>
 <20210222213306.22654-4-pierre-louis.bossart@linux.intel.com>
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
> cppcheck warning:
> 
> sound/soc/samsung/s3c24xx_simtec.c:191:7: style: Variable 'ret' is
> assigned a value that is never used. [unreadVariable]
>   ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
>       ^
> 
> Looking at the code, it's not clear why the return value is checked in
> the two other cases but not here, so mirror the behavior and add a
> check.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
