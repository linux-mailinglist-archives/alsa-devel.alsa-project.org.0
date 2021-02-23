Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCFF322986
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 12:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F28167A;
	Tue, 23 Feb 2021 12:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F28167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614079975;
	bh=CrHYkDhZFiITJKWso5QG5EknfvQdcnmtYmN8mH8LQBs=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9ilFwQ8aJUvYlAk0Chqe5T2iQZaYBhORMeaKX/Z9kUxO9dExhXyChlE1RWPHPPoT
	 yJxKWNpMNDSNT3CAHQjwuN6W0UwrJINo0K0/scYMwgn+q2cbq37WN3AKm1FX5/IJb1
	 RfNWOaGVHhaMWDGAhVHOq+HEubUcZKQGRKB+aPpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B63F80169;
	Tue, 23 Feb 2021 12:31:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 560CCF8016A; Tue, 23 Feb 2021 12:31:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9EC0F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 12:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9EC0F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ZIZjI3AS"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210223113049euoutp0295d4db31c8d5a6918fc578fc9a972685~mXRI65X0u1344313443euoutp02F
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:30:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210223113049euoutp0295d4db31c8d5a6918fc578fc9a972685~mXRI65X0u1344313443euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614079849;
 bh=FbfeYTssa4PzQSZpcHxpVqaSBBb+r9FZFx1rIh4NzLA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ZIZjI3ASD21f3F0hhaeCQ/+B0TXDae3C7BNKVpXV1XOzTeRNmAjFBE10zBBf32ssD
 pSXtD1eS/3P9GTytC2rS6mPFGrExv+ET7lwotN4kIsE/mSoRqezqH9m0ayRbBe8GqJ
 wZDU/1K4k6SEUHHuxdJGveVPrW5wmk3LJS0mFTAM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210223113049eucas1p158c3aa853e964392ec01daf5085c85ce~mXRIuO17S1885518855eucas1p18;
 Tue, 23 Feb 2021 11:30:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.D8.27958.867E4306; Tue, 23
 Feb 2021 11:30:48 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210223113048eucas1p2b58e3a20e927418776c0ebf82b7462e2~mXRIOO0Bl0072900729eucas1p2L;
 Tue, 23 Feb 2021 11:30:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210223113048eusmtrp139873dfd3c528e83d35b0180e74edd71~mXRINn3FL1791417914eusmtrp1Z;
 Tue, 23 Feb 2021 11:30:48 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-f5-6034e768930c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 24.94.16282.867E4306; Tue, 23
 Feb 2021 11:30:48 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210223113048eusmtip1bdcfb052e70e6ef352754b080bcde27f~mXRHt33TU1221412214eusmtip1O;
 Tue, 23 Feb 2021 11:30:47 +0000 (GMT)
Subject: Re: [PATCH 6/6] ASoC: samsung: tm2_wm5510: remove shadowing variable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1576406b-d9b8-87f2-e42c-1689517643af@samsung.com>
Date: Tue, 23 Feb 2021 12:30:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219230918.5058-7-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd2M5yYJBvsf2VhcuXiIyWLqwyds
 FufPb2C3+PX/GZPFy81vmBxYPTZ8bmLz2LSqk81j3slAj82nqwNYorhsUlJzMstSi/TtErgy
 2nomMxccYq7o3raVuYHxM1MXIyeHhICJxMfH/5lBbCGBFYwS71+6dDFyAdlfGCUaZ89nhXA+
 M0qceT2RDaZj05IrbBCJ5YwSu/sfQTkfGSVmr1/PCFIlLOAv0f9tIpgtIhAnsfzLeXYQm1nA
 R2Les3csIDabgKFE79E+sBpeATuJlpmNYDexCKhKbNj4EewmUYEkib+/bzJB1AhKnJz5BKiX
 g4NTwFNi4kJ7iJHiEreezGeCsOUltr+dwwxx6BEOiXeXOCBsF4lf7VsZIWxhiVfHt7BD2DIS
 pyf3sIDcLyHQzCjRs/s2O4QzgVHi/vEFUB3WEnfO/WIDWcwsoCmxfpc+RNhRYs+9Q+wgYQkB
 PokbbwUhbuCTmLRtOjNEmFeio00IolpF4veq6dBQl5LofvKfZQKj0iwkj81C8s0sJN/MQti7
 gJFlFaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmCCOf3v+KcdjHNffdQ7xMjEwXiIUYKD
 WUmEl+2uUYIQb0piZVVqUX58UWlOavEhRmkOFiVx3lWz18QLCaQnlqRmp6YWpBbBZJk4OKUa
 mBQSbyj49Wh8v160tm9Ctnb5IrOs3dpxe333zv8uG7QwW3/DWfvfd784eQbNC2VZmmdavzvO
 zWtLzs9Czu/n1/7o0w6YO0Hz4W13GVf7ucvaur+X7NrZ17Zg/9p3S84zTbT5GXBmWZZosOS7
 GWbJsy1FD/z0exy6sX4Df/T+y9FKC18qMB3b22psMS2EuX7vvMzQ76HpZT9V7TSM2u7qTPs+
 /Ya0kqz1vO22d3if3t3GuTGmK2Ir/6n++/l1M2aW2NWe6z784OHdYmm23/dYt15uXa18rPzb
 ufwcpykLjuzU37rBj6Pho2OGq0pUpq7wjiMiqd+dVgnwSO76nKIZs1PppKjMxoWxEzLe7fz0
 WkCJpTgj0VCLuag4EQCnhSAlnwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7oZz00SDD4fk7K4cvEQk8XUh0/Y
 LM6f38Bu8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHptPVwewROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehltPVMZi44xFzRvW0rcwPjZ6Yu
 Rk4OCQETiU1LrrB1MXJxCAksZZR42XKJtYuRAyghJTG/RQmiRljiz7UuqJr3jBK9fzawgSSE
 BXwlbrceZgGxRQTiJHYvPARmMwv4SMx79o4FouE2o8StTQ/ZQRJsAoYSvUf7GEFsXgE7iZaZ
 jWBXsAioSmzY+JEZxBYVSJJYP/0mE0SNoMTJmU9YQA7iFPCUmLjQHmK+usSfeZeYIWxxiVtP
 5jNB2PIS29/OYZ7AKDQLSfcsJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4m
 RmBMbTv2c8sOxpWvPuodYmTiYDzEKMHBrCTCy3bXKEGINyWxsiq1KD++qDQntfgQoynQOxOZ
 pUST84FRnVcSb2hmYGpoYmZpYGppZqwkzmtyZE28kEB6YklqdmpqQWoRTB8TB6dUA1NnuOa7
 Tt3AUInKi3oiSSKPZMQ9jAQ/slxST5px5fwLnWOVxq9EtdxW1GyNVNV4cpsvds8HV8MGE7uc
 w/eC0xxt+K+HRlk5izJ3GPudquzmT12cvXZ3iUJwgYH2N76ip3I/naXrNTTOSyzbG/j275v+
 uJ2rb6j/3nrqjOuEqXnTXJts7jCHHLL/yzStZFPFhXn702KDokRYmr+6SHm0/Tm4h1lhUtX5
 WFVHH9e1X/PCfzWkmH5IMXs6v8Zsskd8nox2cd0q3s9MHEn7EyZy6NkUPOFV+FQUZsTGpWsp
 x7r11K1AdcswpiumuiUmGfN3uEfwBledzD4QlLJ47QmOmFeO6fY257M3y+onnFdiKc5INNRi
 LipOBACKq9GfMgMAAA==
X-CMS-MailID: 20210223113048eucas1p2b58e3a20e927418776c0ebf82b7462e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210219230936eucas1p143e185b68d5ce77682b0385fb8f298e9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210219230936eucas1p143e185b68d5ce77682b0385fb8f298e9
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210219230936eucas1p143e185b68d5ce77682b0385fb8f298e9@eucas1p1.samsung.com>
 <20210219230918.5058-7-pierre-louis.bossart@linux.intel.com>
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

On 20.02.2021 00:09, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/tm2_wm5110.c:552:26: style: Local variable 'args'
> shadows outer variable [shadowVariable]
>   struct of_phandle_args args;

> it's not clear why there was a need for a local variable at a lower
> scope, remove it and share the same variable between scopes.

s/tm2_wm5510/tm2_wm5110

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
 
