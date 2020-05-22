Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8B1DE172
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 09:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7C2187A;
	Fri, 22 May 2020 09:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7C2187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590134347;
	bh=6Be56j75bbpWP5KKOf1t4x641NChRyTdF+ABUtMsntk=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f34MuTzjbaUHU5MqDfchdRn7bHRX+38OWkPDjaEkNEDw21eUN1XbYQ7PJElPt9heQ
	 kSxZjV2uQexde7fYBGV1chxbbhUEZ7Fwu2OmAAU9IJzVithX79lUVYm4XvyxNXLeCj
	 I8mm+vQO9EIxjwZVAQeP96sZr1U7sQD6nR5HNNRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8CCF80121;
	Fri, 22 May 2020 09:57:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC55F801F9; Fri, 22 May 2020 09:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66005F80121
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 09:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66005F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="d3YYlPCn"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200522075716euoutp0192450bd4c8c33b4aee2e722ac3681131~RSqnJ4Ui-0974709747euoutp01O
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 07:57:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200522075716euoutp0192450bd4c8c33b4aee2e722ac3681131~RSqnJ4Ui-0974709747euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590134236;
 bh=QSK4VP99XJMinqlR8VyUY3k2MmIr1hx8z98ev9pZpIY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=d3YYlPCndeScCKGcr1f0Ue0qQjnnu2+Rn4Mj717TCFvgVFKBNdUdACeIiJbgR5jDn
 ioCZPSSMfenhhTCnuM+1A//lU6U3sIDQWn8WjI75IiJLPPRhBGok9PQLtnHTxBZZoF
 Rh0W8fio7CulaDcQokXshiU/P/tntB3ggx1KlGb0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200522075716eucas1p16210700c9960d257b14f5eab5c8fb831~RSqm05nKX1422014220eucas1p1o;
 Fri, 22 May 2020 07:57:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.0C.60679.CD587CE5; Fri, 22
 May 2020 08:57:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200522075715eucas1p16dc9dbea28c77537cf5ed4c07486e56f~RSqmcgXf52433324333eucas1p1M;
 Fri, 22 May 2020 07:57:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200522075715eusmtrp221f80781a5f18060f152699e97a6b9c7~RSqmbz2V11941319413eusmtrp25;
 Fri, 22 May 2020 07:57:15 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-f0-5ec785dc382f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C8.5C.08375.BD587CE5; Fri, 22
 May 2020 08:57:15 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200522075715eusmtip1540626610ab65934ccfc25737849fc6b~RSql69mOU3177031770eusmtip1P;
 Fri, 22 May 2020 07:57:15 +0000 (GMT)
Subject: Re: [PATCH RESEND 0/4] Minor WM8994 MFD/codec fixes
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c4e8ce6f-f26c-110c-610b-3a86b13a95d9@samsung.com>
Date: Fri, 22 May 2020 09:57:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200427074832.22134-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRzGeXfOzo7L2XEa/r1UMEgwyEv5YaFImsSQPgjrTlstPajlpmxq
 6SexTNMwLWU5lnnDa2mYTR2BOpsiylAnaTXJiRRGw2jeMde2o+W353n/v/f5vw+8JMbvYweQ
 aYosWqmQpQsILq4b3jSdsBSOSMPza9jC6UkDS1hlXSSE04VdSPh11YiEa9PFLKFZryWE9uV+
 tnDoZxH7DCl6Yy8gRH2aOY6oq+0RIbJ8fE+I1FoHEpV1tyGRvetIIucaNzqZTk/LoZVhMTe5
 qWMTv1CmHr+nNxeifDSFlSAPEqhIeFLW6NRckk+1IGgqNbEYs4KgaOEbzhg7gjlzL9q78mzD
 uDtoRtA+sbxrlhGsfx90Uz5UNGyt6AiX9qWk0NxQ687FqDEESz2VHNeAoCKgxFbihnhUDFR+
 aMFdGqeOwU6DwR10iJLAWMNbxDDeMFq96GRI0sPJ16nPuY4x6ij02LQYo/3g8+JL9y6ghjkw
 s9Ti5oGKh5pRMdPAB36MdHMYHQSOvj3+PgKr6TWHMY8RmAue73aOAotpi3AFYVQIdOrDmMxY
 qPjizUgvmLV5M0/wgqc6NcYc86D4IZ/JCAbNSMe/rYMTU1g5Emj29dLsK6PZV0bzf20twtuQ
 H52tkqfQqpMK+m6oSiZXZStSQpMy5F3I+aHGdkZWepF++5YBUSQSePLmk4alfLYsR5UrNyAg
 MYEvr+6gUcrnJcty82hlxg1ldjqtMqBAEhf48U7VL0n4VIosi75D05m0cm/KIj0C8hHb3i+d
 sQ0nHMBlSFy8JraetToa48qTPr27GG6P71R4tjYVigeg48rlEP+EZLn/hVnLgOTwtvWSMWBc
 Lbnavo5Fs4MbwpVazNobqdMt9HcMbeaVVs3f/h00+ce3vjRw/nRUYluUNq5m9UFsxcZS63iZ
 40X39fHtV+erM6gqLwGuSpVFHMeUKtlftCst/UwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7q3W4/HGbzZrG1x5eIhJoupD5+w
 WVxp3cRocf/rUUaLb1c6mCwu75rDZvH5/X5Wi8Nv2lkdODw2fG5i89g56y67x6ZVnWwed67t
 YfOYPuc/o0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq
 6dvZpKTmZJalFunbJehlnL7wgbFgF0vFrsutjA2Ml5i7GDk5JARMJCb/OMrSxcjFISSwlFHi
 /8sDjBAJGYmT0xpYIWxhiT/XuthAbCGBt4wS376IgNjCAjYSv75sA4uLCMRJ3OppZQYZxCxw
 llHi2OuLLBANE4Ea/oENZRMwlOh6CzGIV8BOYsqRFWA1LAKqEv8WHwKrERWIlVh9rZURokZQ
 4uTMJ0A1HBycQPULp7uBhJkFzCTmbX7IDGHLS2x/OwfKFpe49WQ+0wRGoVlIumchaZmFpGUW
 kpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAiNy27Gfm3cwXtoYfIhRgINRiYf3QfKx
 OCHWxLLiytxDjBIczEoivAv5j8YJ8aYkVlalFuXHF5XmpBYfYjQF+m0is5Rocj4wWeSVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBU6yrkuHVw+lv3+I4/s7p3
 yesrftWasMNCrDFJleP0oST7VvXUlRsnW216rf75690nrCuko6cKKraI3Oq9cmTLnZM/d36d
 nFD1dfX34tpZ2/5fef8qov7Wt5VvRTv6aiuE57bMrlVQWdF/JSxQ+r66Qi6PgSQ/77e6+a/X
 3+IJn3FFaPbzj7F5SizFGYmGWsxFxYkAA+jM694CAAA=
X-CMS-MailID: 20200522075715eucas1p16dc9dbea28c77537cf5ed4c07486e56f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485
References: <CGME20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485@eucas1p1.samsung.com>
 <20200427074832.22134-1-m.szyprowski@samsung.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hi All,

On 27.04.2020 09:48, Marek Szyprowski wrote:
> This is a resend of the minor WM8994 MFD/codec driver fixes posted in
> last days of the February 2020:
>
> https://lore.kernel.org/patchwork/project/lkml/list/?series=431296
> https://lore.kernel.org/patchwork/project/lkml/list/?series=431721
>
> I hope this time the patches will find their way to mainline.

Gentle ping. Lee: could you queue at least the first 2 patches if you 
consider the latter 2 a bit controversial?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

