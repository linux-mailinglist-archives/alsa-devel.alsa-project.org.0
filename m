Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2927F906
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 07:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C401870;
	Thu,  1 Oct 2020 07:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C401870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601529964;
	bh=f4EkXnyJ6/YTP6RxuPAreWWSS34RqYGQVsThjCv57/g=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKnsV/kBg9CZ9l7cfYcnqGwpEqTgGtBiQZ0vleO5HfU2PrTem8azwoh+QhnPTfWdj
	 cKS8Rd0mEXfK0UVrggkw+5ZLCbGq/HzQerpP8XC2TDj1TbvNc3o7RRSmgYXsTwBEYX
	 /sXtmJ9st4+463lXAzqBUXNyNoD9eOO+TaVHu2H4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDDFF8020C;
	Thu,  1 Oct 2020 07:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84290F801F5; Thu,  1 Oct 2020 07:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1868F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 07:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1868F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Dy2uhS3e"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201001052409euoutp01eb8bdfc2551a3e06ddd018323569ec52~5xunFYs6n3157731577euoutp01L
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 05:24:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201001052409euoutp01eb8bdfc2551a3e06ddd018323569ec52~5xunFYs6n3157731577euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601529849;
 bh=vb1kX9vBVDW2+OuimI7qx5yygSqjvKXJbNal7aMvej4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Dy2uhS3e4lj+3vOrZU6EKXrBFs+GjweR8cDGsfL4weqxvi0upTyMIT7CsuuPlQIfY
 DVKY6Bbo2VnMts5RIoM5yuFoUex2myPnKqzyDzIMUgj5F37K2N1+6ZbpA9js6P06Z0
 1L7/6TBrXnZqJvofP8hydX52HEbbKAgi9Z49BUfw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201001052409eucas1p24edd7ebd28cdee6b533d9ee1e7dc2a1c~5xumxJ8e11899918999eucas1p29;
 Thu,  1 Oct 2020 05:24:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9F.3C.06456.9F7657F5; Thu,  1
 Oct 2020 06:24:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201001052408eucas1p1fcf208211a0e0be381008fc238256283~5xumMDFO10470704707eucas1p1Q;
 Thu,  1 Oct 2020 05:24:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201001052408eusmtrp26d7150ab7bd1aef55925e1db698d166b~5xumLfYgR2422824228eusmtrp2V;
 Thu,  1 Oct 2020 05:24:08 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-e2-5f7567f98431
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 78.7A.06017.8F7657F5; Thu,  1
 Oct 2020 06:24:08 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201001052408eusmtip1dc5ba86c777468218db1efec6a801c01~5xul6A5my2211922119eusmtip1W;
 Thu,  1 Oct 2020 05:24:08 +0000 (GMT)
Subject: Re: [PATCH] ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <039e0591-c1f6-8728-1b0f-846e919d1ba6@samsung.com>
Date: Thu, 1 Oct 2020 07:24:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOd2f6aXxBp8ei1tcuXiIyWLqwyds
 Fq8O72J0YPbY8LmJzWPTqk42j29nJrIEMEdx2aSk5mSWpRbp2yVwZexaupK54BlnxZwT89ka
 GNs4uhg5OSQETCT+f1zD1MXIxSEksIJRYvaLa1DOF0aJ309aWSCcz4wSm1vns8C0TN3+mB0i
 sZxR4sKytVDOe0aJdV3z2EGqhAXcJTa8OMrcxcjBISIQLXH9tB1ImFlAR6LvxCdmEJtNwFCi
 620XG4jNK2AnMXnJUTCbRUBF4vGME2DLRAXiJI6desQCUSMocXLmEzCbU8BWonHVB3aImfIS
 29/OYYawxSVuPZkP9oKEwH82if/LH7FBXO0i8WH1PChbWOLV8S3sELaMxP+dMA3NjBIPz0F8
 IyHQwyhxuWkGI0SVtcSdc7/YQL5hFtCUWL9LHyLsKHHt+SR2kLCEAJ/EjbeCEEfwSUzaNp0Z
 Iswr0dEmBFGtJjHr+Dq4tQcvXGKewKg0C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsmJda
 rlecmFtcmpeul5yfu4kRmEpO/zv+aQfj10tJhxgFOBiVeHgn5JXEC7EmlhVX5h5ilOBgVhLh
 dTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxhbz
 2ZPvzPCS9nlxmktwd2qS9dElsXpxx8O9M8Ktr9p427CvM1/Sp7zroGJ7Sipzn5jcJdP3+Qmt
 k6t2P09a9amno4T3469+Vt1/PEfZT7m2vGTOM3q5S6nBdMeNE3MyvQp1fqVXB68/0b3h8qdP
 jJub1X9bdOVE/Z71SFUiLHw196eDFt18SizFGYmGWsxFxYkA1R/ALiEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7o/0kvjDWZNNrS4cvEQk8XUh0/Y
 LF4d3sXowOyx4XMTm8emVZ1sHt/OTGQJYI7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQy9i1dCVzwTPOijkn5rM1MLZxdDFyckgImEhM3f6YvYuR
 i0NIYCmjREffK3aIhIzEyWkNrBC2sMSfa11sEEVvGSXmLdsHlhAWcJfY8OIoM4gtIhAtMXnZ
 fzYQm1lAR6LvxCdmiIYJjBKv+y6DTWUTMJToetsFVsQrYCcxeclRMJtFQEXi8YwTLCC2qECc
 xJmeF1A1ghInZz4Bi3MK2Eo0rvrADrHATGLe5ofMELa8xPa3c6BscYlbT+YzTWAUmoWkfRaS
 lllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMHq2Hfu5ZQdj17vgQ4wCHIxK
 PLwT8krihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cDI
 BuoxNDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAGN7UuGRBrempz5ZM
 xS5ZP0w+8136e+J93YmewFfmaXPLrjdPWn3PbHnBsocGvXfuT1l9Z1Xx2gZNuw+vYgpmvDSZ
 Zrj2+Jn+KZ9e7+zvqQrk29zpH7XuNEvfbcmEw94siWcK+jbbPmWfbPxxm6wO+5OufYe+aDpE
 9xtPcOGYKySf59Mpv+zvOSWW4oxEQy3mouJEADFqexi0AgAA
X-CMS-MailID: 20201001052408eucas1p1fcf208211a0e0be381008fc238256283
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201001050743eucas1p16f018e6dc7a7f5100453b5eb3ee7a691
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201001050743eucas1p16f018e6dc7a7f5100453b5eb3ee7a691
References: <CGME20201001050743eucas1p16f018e6dc7a7f5100453b5eb3ee7a691@eucas1p1.samsung.com>
 <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi

On 01.10.2020 07:07, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit 140a4532cdb8c ("ASoC: soc-pcm: add soc_pcm_clean() and call it
> from soc_pcm_open/close()") switched to use soc_pcm_clean() at
> soc_pcm_open().
>
> But it removed "return 0", and missing "ret = 0",
> because of it, it always return -EINVAL eventhough no error.
> This patch adds missing "ret = 0" for success case.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This fixed my issue. Thanks!

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   sound/soc/soc-pcm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 9d3460c19353..03fc9119151c 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -796,6 +796,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
>   		 runtime->hw.rate_max);
>   dynamic:
>   	snd_soc_runtime_activate(rtd, substream->stream);
> +	ret = 0;
>   err:
>   	mutex_unlock(&rtd->card->pcm_mutex);
>   pm_err:

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

