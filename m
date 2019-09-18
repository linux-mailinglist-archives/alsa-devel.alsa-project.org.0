Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19393B5FC7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 11:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A85167D;
	Wed, 18 Sep 2019 11:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A85167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568797487;
	bh=kbH2KtiY9/26O8aLLpE5RoLzBOGQuPI1NEjQp8SxP/U=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsCpAYrfjv7QHD7/f6u4PV22bkLgQkEtBOJq7YYh0tSqePQMd4K/Chp4zXzx8meqS
	 6iOBkKExv+1NWJbAqMrIh+pqdff+lD7Ee8B3JD8m0vsSRvaofZL/aG+0L9GjpRpxB1
	 M1v5oZEFV87+0V4BdAf817FXzAmbBkwX5QfvBAF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD436F804FF;
	Wed, 18 Sep 2019 11:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA58F805F7; Wed, 18 Sep 2019 11:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 206C4F800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 11:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 206C4F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="AbdHYOjy"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d81f2cc0000>; Wed, 18 Sep 2019 02:03:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 02:03:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 02:03:02 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:03:02 +0000
Received: from [10.21.132.148] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:03:00 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-6-ben.dooks@codethink.co.uk>
 <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
Message-ID: <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
Date: Wed, 18 Sep 2019 10:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568797388; bh=5gjzsaQ5RVPyzWZQSS2jSAST2YzuhSRPnPOTYftoFIs=;
 h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=AbdHYOjyiAwpLVWh3rZHvh49mz1oCan6GRLhuIlPRWAmeJG8xUQ+36ApcA3doPLe6
 Sb0Lkq17q9qFrT5/ikLNycJqs10uZUYDMoXhVHjHtJKNmOWf/81SPl/HtUuNGpZ5Wt
 b8pPSQmVZPtq+zuEmZsRQ0qcIeSoVgVc9cM2yZ0UJFqRTS8cWWmni8VHLH9EIcpY/l
 aJmMcT2V6coAsuILCnyyrda9tUUstzifo8zjrw3Z9Bvg5GoVBCYoQ773It+ohAQ5WY
 ldy0JNpYaa/98TzjzigR9bHeOcWrvZMKTlDw8kyyI9OCg+soSD4YXYvj3N47uR8fyg
 lPp381JHLrpZg==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH 5/8] ASoC: tegra: set edge mode for TDM
	correctly
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


On 18/09/2019 09:54, Jon Hunter wrote:
> 
> On 17/09/2019 19:12, Ben Dooks wrote:
>> In TDM, use the negative edge to drive data and the positive edge to sample
>> data.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
>> index 4222839b63bd..d75ce12fe177 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>  	}
>>  
>>  	pm_runtime_get_sync(dai->dev);
>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
>> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>>  	pm_runtime_put(dai->dev);
> 
> I would rather set this in the case statement above where the format is
> parsed and again drop this 'is_tdm' variable.

Actually, this should be implemented as shown in the following ...

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=ee482f27ed2e4710e5e7446918887f8f8ef31285;hb=a960d522a5486aee27605f890034869c4f49d94a#l362

Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
