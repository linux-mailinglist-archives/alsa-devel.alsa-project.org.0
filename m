Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 383AB20D030
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 18:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC35166C;
	Mon, 29 Jun 2020 18:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC35166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593448488;
	bh=xhfLp9vm0c7W0uKqA5ym++QMdqxoXyKu0WW/mhMvjFs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZDiPcdDv6XXGLicg++IaRLoFAM5BdgY+TKZA/oFw13ZRdoK/3gb0ol91cbI06Zjl
	 dYiTsSb/018oiqB+oydmd9B4/It1ckpRUsNLl44BEEuNN/uZ0mYjkVrzZFmUepytlp
	 H4xxdxonZpuFuQo3HPGJVsCdrJIxT1WX5abLPYeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1B8F8021D;
	Mon, 29 Jun 2020 18:32:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9A42F8022B; Mon, 29 Jun 2020 18:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98604F8021D
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 18:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98604F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="E0bgnTS+"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efa17410007>; Mon, 29 Jun 2020 09:30:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 09:32:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 09:32:35 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 16:32:27 +0000
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
Date: Mon, 29 Jun 2020 22:02:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593448257; bh=eCgPnGs+t6mTlUrWspHqn3L6WbSBOIjW+yMMr1FqO98=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=E0bgnTS+65jRjYEbGCuLpuR8gnCRlXvUMWJ2XzgjkKSHqUAwlVCdS3CdarJxGka2x
 rZypFMDFhq/5cquU2SjBDGBdPh2TqT7kW8VSprjIMw8ygVZwG25ubKqG/zx28oIpGp
 348TCN+unvZvTVBjQOq5FQVNc64tKcaZ6NEWgYtPNLRs9KI+9QASfgOwbEjPNkLVSJ
 oGIonuFPpJ707Pn1RIsg3J0E6d6y46o1olkiB3HI4dA1r3VED4YwLcUFVsjhcYkGl6
 rut7emaQHbqsyf7lbuhlsTX1riPozhD/6r8hqdRq8cSZjZEcbt8Svte7nsuTbV8OFl
 mPk5sQEZYA+hA==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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



On 6/29/2020 6:35 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> CPU/Codec in DPCM DAI links are connected as CPU<->Dummy and Dummy<->Codec.
>> Though mostly CPU won't use/require 'mclk-fs' property, looping over
>> 'np' (current child node in a DAI link) can help in cases where multiple
>> Codecs are defined. This further helps to get rid of 'codec' argument
>> from simple_dai_link_of_dpcm() function, which gets called for DPCM links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
>> index 39cdc71..02d6295 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -107,7 +107,9 @@ static void simple_parse_mclk_fs(struct device_node *top,
>>        snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>>        of_property_read_u32(node,      prop, &props->mclk_fs);
>>        of_property_read_u32(cpu,       prop, &props->mclk_fs);
>> -     of_property_read_u32(codec,     prop, &props->mclk_fs);
>> +
>> +     if (cpu != codec)
>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
> Maybe we want to have "cpu" in simple_dai_link_of_dpcm() side
> without using magical code in simple_parse_mclk_fs() side ?

Are you suggesting if we should simplify simple_parse_mclk_fs() by 
either passing 'cpu' or 'codec'?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

