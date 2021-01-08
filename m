Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC42EF4A0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 16:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8169A167D;
	Fri,  8 Jan 2021 16:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8169A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610118913;
	bh=AYesbACrULMe0GwST4avbj3BMIyw1dVGm1O90nrTveU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3rPH8chopJTFGhZ/EYKc7gbV6qFOouEcFWDfWLKc9AALzjoKqXiQlsA9BrzT9Cby
	 DLu/kmio4D6YtLlIR7pt/izjq4K4la3PbTXvKhLsVekbUotRbxH6g3p9Dw1ZSkTDYM
	 uCp0SrPqix3AEzQI6Cwz0ZKSwIMcwBSsfO1TQmX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0852AF800E9;
	Fri,  8 Jan 2021 16:13:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D42F80166; Fri,  8 Jan 2021 16:13:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F487F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 16:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F487F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="sSidw/sl"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff876950000>; Fri, 08 Jan 2021 07:13:25 -0800
Received: from [10.25.98.33] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 8 Jan
 2021 15:13:20 +0000
Subject: Re: [PATCH v2 1/2] clk: tegra30: Add hda clock default rates to clock
 driver
To: Peter Geis <pgwipeout@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Peter De
 Schrijver" <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Mohan Kumar <mkumard@nvidia.com>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-2-pgwipeout@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <ea422151-b4df-f7d3-c695-b4ebcb251307@nvidia.com>
Date: Fri, 8 Jan 2021 20:43:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210108135913.2421585-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610118805; bh=OVh5cu6AG+BPRULLnidGp+AXOyPhHTYBhMs7JavYrOc=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=sSidw/slIQ9npmyK4Om8U5bcnuD7kXNCpbqKEZuvuINwRSjfoqp54zM8HvBbDlLZ3
 jVnKVrC9VLjaeqespOieFT2Zl0CckYNHZJ3qyeX/tET9IHdBojThZnZZlGxcgYAByr
 kbpS0UpKkBZElJ51nb+5cz+is36K20nRGTg2bReJUDpu1HJI3UMh1xuuHjoem0/zom
 PaE2nfPaqfLsmDewNNpLwXgZmjotjvxrDjdOFL5/dRpwLCtdkV1imSwpac9u1i/34V
 RIEkL578uRA6bUKLHa52pfQ0S2ElfYO3L6YDTXhT5eHn/CBkEUbclYnDEQdm7gXgQE
 jqNm7LQB5vD+g==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Ion Agorria <ion@agorria.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 1/8/2021 7:29 PM, Peter Geis wrote:
> External email: Use caution opening links or attachments
>
>
> Current implementation defaults the hda clocks to clk_m. This causes hda
> to run too slow to operate correctly. Fix this by defaulting to pll_p and
> setting the frequency to the correct rate.
>
> This matches upstream t124 and downstream t30.
>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   drivers/clk/tegra/clk-tegra30.c | 2 ++
>   1 file changed, 2 insertions(+)

Acked-by: Sameer Pujar <spujar@nvidia.com>
