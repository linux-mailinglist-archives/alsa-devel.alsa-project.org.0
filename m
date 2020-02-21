Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0616804C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 15:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C37216CC;
	Fri, 21 Feb 2020 15:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C37216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582295582;
	bh=bZD81CMjdU6PVXU+NW5xkhQARAhHfWh6WcnNsNietXY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D70gTi4cuYkp46XQFxJaDWkaCCgKn64JnG3Dbew9HJa6t2IPtnVzHbPsYnLYam1rm
	 5UTjtcAn2UgqxlEuyAcj6WCTekj1CWvRZTsJHWeUlQhXoVb6xezeMyIxl1NactEM/x
	 1vZi38QCyUzKlVNLo3BHV0R3wJGxFWnWXExbX1r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FBF0F80273;
	Fri, 21 Feb 2020 15:31:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01166F8025F; Fri, 21 Feb 2020 15:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8929BF80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 15:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8929BF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="goEbRFoI"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4fe9660000>; Fri, 21 Feb 2020 06:29:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 21 Feb 2020 06:31:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 06:31:11 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 14:31:07 +0000
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
To: Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
Date: Fri, 21 Feb 2020 14:31:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221130005.GD5546@sirena.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582295398; bh=Ii2FU53gxBnbRqvrbMjLj3GOVXtejYjy/v1iyuD+MP8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=goEbRFoIBBxyJcX7uUg+O3y3ialsPS2BhhIdSG+PMqy/jzg3qcJr4jSjnDUgktNhN
 0HMt1u0Cou33Sg1w5vG96Apvi3i59DVCCWQeADi8BdBRjSFldcGhf5GaoowpbRlB7B
 azp2fKoZ9qBcj1jefWii8s+8RcbMoYb+xU7R9Ar7+7GEZvg7nFo9/shcynm4qCbilI
 qhrgOd5wYI/zvViDPhH3Z2p5q+9BtUiOXig8mubW93E4mG+bgZ+x50yA7pf6I5dwoZ
 UKElyundJcSXSPGoORNjZV80p/NtA/NXJAuJ6RcnDVttOH9FCrSmo4LtzD76ANi36x
 jI7K6IoobDD8A==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


On 21/02/2020 13:00, Mark Brown wrote:
> On Thu, Feb 20, 2020 at 12:04:45PM +0530, Sameer Pujar wrote:
> 
>> +++ b/sound/soc/tegra/tegra210_dmic.c
>> @@ -0,0 +1,515 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * tegra210_dmic.c - Tegra210 DMIC driver
>> + *
>> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> 
> Please make the entire comment a C++ one so things look more
> intentional.
> 
>> +	/* Below enables all filters - DCR, LP and SC */
>> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
> 
> So this isn't the hardware default?
> 
>> +	srate = params_rate(params);
>> +	if (dmic->srate_override)
>> +		srate = dmic->srate_override;
> 
> How does this work for userspace?  If we just ignore the sample rate we
> were asked for I'd expect that the application would get upset.

Tegra has a hardware sample rate converter (though driver not yet
upstream or part of this initial series) and if using the sample-rate
converter, then the actual rate captured by the DMIC interface could be
different from the resulting sample-rate.

So we want a way to indicate to the DMIC it is capturing at rate X,
while the resulting sample-rate is Y.

I am not sure if there is a better way to do this? Ideally, the DMIC
would query the rate from the upstream MUX it is connected to, but I am
not sure if there is a way to do that. So right now it is a manual
process and the user has to configure these which are not ideal.

Cheers
Jon

-- 
nvpublic
