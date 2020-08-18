Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566B24802D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 10:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B7A1748;
	Tue, 18 Aug 2020 10:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B7A1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597738073;
	bh=Y2xfLPzkaFh8TxOts4BpCgZWSNlQ3Y57VOHE9x5LLbg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0Yoa5o22dc+zFZkx470NRbPggknYjcE6oG5gWd5Viz252wnLpGBBa0bIUSEnxlJf
	 4kzKatLpICYMZ0FUTJZJHOcKJwrJ/Zj1WY79JXMW8T38cSvqnqGBCdRKD+uJsTWsTL
	 XuJQmmLIWFrV0d/EefeuTX5DIPYEQK+bx9ey1yZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AF5F80279;
	Tue, 18 Aug 2020 10:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D70EF80279; Tue, 18 Aug 2020 10:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC41F80228
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 10:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC41F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="BNtp98LZ"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3b8c090001>; Tue, 18 Aug 2020 01:06:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Aug 2020 01:06:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Aug 2020 01:06:47 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Aug
 2020 08:06:41 +0000
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <1596605064-27748-4-git-send-email-spujar@nvidia.com>
 <87y2mcfzir.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <94e2c4ad-91a8-76c8-c956-8dbfdf68d1a8@nvidia.com>
Date: Tue, 18 Aug 2020 13:36:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87y2mcfzir.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597737994; bh=ZXSuf8dJcEyEX5k466eJpjxKeuZb+qrwyJvu3I6LwjU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=BNtp98LZzdUvqLCn9Us3RAOIqzAZ0wLoqExbNqAv86BlHIhfXic3cfKAN7i7HXrt1
 FmjmmAystMbcyaREzFj1OxN2ENXvZJpkbWcRf/2bNONAcIDmez9mz/KeZYe9C74k86
 nKI33jYsJGye/dIRVSTJWzZ7C3iCbdZb3QL3z7uE3Di874nnKsv13Pf7hIDHYuJhNv
 6633KjbHupZDd/aKDJ7J6/AiRKHzrO/MTn+urn4UgIW4vWrHadSh+Bq17kQCZgGS9N
 gUMhdeNGGKf4FZzZd6lLb7Ir3tjgZsaWx+kbcTBslUxLk37CLDdRcP6WEcyUyTnIWo
 mTT5zLyJu6dnw==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

Hi Kuninori,

On 8/18/2020 8:11 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> PCM devices are created for FE dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement either pcm_construct()
>> or pcm_new() at component or dai level respectively. Based on this,
>> current patch exposes a helper function to identify such components
>> and populate 'no_pcm' flag for DPCM DAI link.
>>
>> This helps to have BE<->BE component links where PCM devices need
>> not be created for CPU component involved in such links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> @@ -259,6 +270,16 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>                if (ret < 0)
>>                        goto out_put_node;
>>
>> +             /*
>> +              * In BE<->BE connections it is not required to create
>> +              * PCM devices at CPU end of the dai link and thus 'no_pcm'
>> +              * flag needs to be set. It is useful when there are many
>> +              * BE components and some of these have to be connected to
>> +              * form a valid audio path.
>> +              */
>> +             if (!soc_component_is_pcm(cpus))
>> +                     dai_link->no_pcm = 1;
>> +
> For safety, I want to judge with data->component_chaining.
>
>          if (data->component_chaining &&
>              !soc_component_is_pcm(cpus))
>                          dai_link->no_pcm = 1;

OK. I will keep the additional check. Thanks.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
