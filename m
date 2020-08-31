Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F522579E0
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 15:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8612B17AA;
	Mon, 31 Aug 2020 14:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8612B17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598878801;
	bh=lpbvA4t7LtNUsU9mK0mpVon1d9Lu6POSGvulVDDqXbU=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1uPM904WOokp+x8aQChoaakPQGW4HAs2ubjlQvaRrSFLCyh/WL27F0EVJT31dcT4
	 7Q6JBusKVKeRzHZjArI0JuZOBjPcfvr9ixs92FpUpbBdeOXBCkfhh5fFhfvu0tXedx
	 WrPg/hk8k0r3BJ/M3OsKXVZfgftFcY5sSYhNWedg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AB2F80058;
	Mon, 31 Aug 2020 14:58:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C474CF80212; Mon, 31 Aug 2020 14:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1941F80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1941F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="icru3UwQ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831125810euoutp017ba6da2fd7c31aeb7f83cf5568f56eae~wW7Ku5Tg-1896918969euoutp01c
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 12:58:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831125810euoutp017ba6da2fd7c31aeb7f83cf5568f56eae~wW7Ku5Tg-1896918969euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598878690;
 bh=5hta59IRZLSNNr+WbWu6r5jevngwOh7wCzqJE4jHiXk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=icru3UwQZbSY7HTqiZXEq7bsDeoggsCupBXqMuU19yAQbz9BVSvHbQ8rrmAb43S2J
 J49d+vRGCN7C8Pw1Mqc5+qyzSI20WQJSikhnTdIUVrEfabnQ8zVL4PJEDjH2HNmaxD
 L+3z/8baEr3q5bfjIPFGYiHTMmy9thMtMYdF+aDE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200831125810eucas1p18e4c1a0d6e06d69f6b931f67063f085e~wW7Ke_tVs2666826668eucas1p1Z;
 Mon, 31 Aug 2020 12:58:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DB.43.05997.2E3FC4F5; Mon, 31
 Aug 2020 13:58:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831125809eucas1p2b8b064cf3e210acd67e44508eba8fa4b~wW7J8aHM01326813268eucas1p2J;
 Mon, 31 Aug 2020 12:58:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831125809eusmtrp23f9884792d1bb0ac01da2630e444da54~wW7J7YM-P1918819188eusmtrp2d;
 Mon, 31 Aug 2020 12:58:09 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-e6-5f4cf3e2adbf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.A5.06017.1E3FC4F5; Mon, 31
 Aug 2020 13:58:09 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831125808eusmtip1142af4699c5755d05c09a550ae474fc6~wW7If_y_A1670816708eusmtip1T;
 Mon, 31 Aug 2020 12:58:07 +0000 (GMT)
Subject: Re: [PATCH 07/10] arm64: dts: exynos: Replace deprecated "gpios"
 i2c-gpio property in Exynos5433
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
Message-ID: <7eaf6e3d-59ab-a881-3a4a-e540e1c524fb@samsung.com>
Date: Mon, 31 Aug 2020 14:58:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-7-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BMYRj2nXP2nNOydWzRq1zGDgYzpIhvpjRuY84Mg39MQ1k6KmpjTyWG
 0aAktzRM2VK5jSymrC6U22yX1ZRNROiyLrmkSZPdGkLp7Mno3/O8z/O83/vMfCypTqe92Ehd
 rKDXaaM0tJIqqf5pnfPevjp0XtP5CfiEtYbAjQ1mAt/KLFDgs+/aadzk+KzAOfZJeLDkNIlz
 K60K3NjbTeN0WxqFT33oJHF9fSGDbb1VCPc1phDY9OGlAj8vy6ZxZv0DAt+sbGVw0v1KBjfk
 Owh85GMHiW+bzpJLxvOF9oM0f78vj+LvGloZ3mQ8SvMtL+/R/DerleFL+94qeNsxC8HfvnyA
 P1lkRLzdNHnd6GBlYJgQFRkv6H2CNisj8o6v3dlGJnzqaqUTUTaZilxY4BZAuamNSkVKVs3l
 I0hLalPIxIGg6YVjWLEjOFVbhv5FLmQ3DAtXEfSbLYwkqLkeBMZqlYTduR1QV1FMSyYPrpkC
 R2ohIxGSa0bwo7PbmaA5XzhRddK5VsUFQXHBNeec4qaDLafQicdxIVBseUHInrFQc66dkrAL
 5w+ZzyxOTHKe8KY9l5DxFCjtktoph059zMLn8tdDAjtEVsCnMwq5gjt8tRQxMp4Ig3elrOQ/
 hOB4eTMjkzQENkvecOkAaLH209IikpsFBWU+8ngpPC7KQPJ+V3jVNVa+wRXSSzJIeayClGS1
 7J4Gv4wZhIy94Fj7IJWGNIYRzQwj2hhGtDH8fzcPUUbkKcSJ0eGC6KcTds8VtdFinC587taY
 aBMa+qm1AxbHHVT2e4sZcSzSjFH9qFoVqlZo48U90WYELKnxUC17UhuiVoVp9+wV9DGh+rgo
 QTQjb5bSeKrmX+zYpObCtbHCDkHYKej/qQTr4pWIIp4nrrFXTA0q2bBuwM0rpSX0aF3CyvXF
 scnh1MbtAVfc+kL2KXOuL8/6c2BpwoyZb989CnO9c3jJw8DugC/XZ8KlDGK/KGb1jPrud6PW
 u2NR86GpMYuqPbZVrd/iV+rr/8t9l87Y33tkzuKrPZx/cIT9i63uaaxPTf3C3ac76XhvyrpX
 Q4kRWt/ZpF7U/gVj6QeSpQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRiGeXfOzqa5OC7Lt0FWByJJm2229holFRSnMvqCfuhsLTttodtk
 Z0pFlEWSzUyLIhvmLFRKCG2afS5yzkRrDk2UyjljpkWsBdNREdk+Cvbvgvu+nocHHj4mvMMV
 8Y/pjIxBpyqiiHj89Z9e9+qPgRzlGn+jFFUN9HHQ8KCdgx7UtnLR9Y+TBBqdmeai+sASNNd5
 BUMWxwAXDc/6CXTVU4Ojau9XDLlcbTzkme0BKDhcwUFW7wgXvX1aR6Ba1wsOuu9w81C5zcFD
 g3dnOOjCpy8YardexzYtotsC5wjaFmzA6SdmN4+2tlwk6LGR5wT9bWCARz8KTnBpT2Uvh25v
 PENf7mgBdMCasmderniDQV9iZJZp9KxxI5UnQVKxJAuJpWuzxJJMef56qYzKyN5whCk6VsoY
 MrIPiTUNl3YXj2PHp3xuogzUYSYQx4fkWni7bhA3AT5fSDYB6M8NIyRF0HKeijYWwN8jJsIE
 4kMNP4C/hqa54WABWQjfdD+MBEnkBxx+fjcVmYmRbgCdFlHUaAew89M4CAcEKYFVPZcjLCCz
 4cPWe7ww4+QK6Klvi/BC8iD0Vs1h0U4i7Ls5iYc5jpTB2qFePLpgJfxdP/RvWTJ8P2nhRHkp
 fOSrw2qA0Byjm2MUc4xijlEaAN4CkpgSVqvWslIxq9KyJTq1uECvtYLQf3S++tnxGJi+7bcD
 kg+oBMGPnp1KIVdVyp7Q2gHkY1SSYIvz9UGh4IjqxEnGoFcaSooY1g5koeOuYKKFBfrQt+mM
 SolMIkdZEnmmPHMdopIFFWSXQkiqVUamkGGKGcN/j8OPE5UBQXvajf7dwOaj5uc35qcav6ft
 yU1fMoGo0+nqmR3PnDUw+dS8CQr6dyV2l+17XLy3lW7afubAYlNes6LA8vLw2bkpd4YibX3K
 n8CzVKlm9F35NZfjaN6t8m3KYKVdsDU+p3p5l2zcl4KPlXaiMVvi9mln9Y/0982u/s1ehTOB
 wlmNSrIKM7Cqv/FKKa41AwAA
X-CMS-MailID: 20200831125809eucas1p2b8b064cf3e210acd67e44508eba8fa4b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200829142551eucas1p2ec0cbc64a41dd474bec130555d285d66
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142551eucas1p2ec0cbc64a41dd474bec130555d285d66
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142551eucas1p2ec0cbc64a41dd474bec130555d285d66@eucas1p2.samsung.com>
 <20200829142501.31478-7-krzk@kernel.org>
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
> "gpios" property is deprecated.  Update the Exynos5433 DTS to fix
> dtbs_checks warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'sda-gpios' is a required property
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'scl-gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
