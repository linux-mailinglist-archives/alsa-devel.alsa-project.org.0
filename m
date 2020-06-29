Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBC20CFFE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 18:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7BE851;
	Mon, 29 Jun 2020 18:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7BE851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593446931;
	bh=WsQreeHfpraMxoXyLlY+ZeICFp4JJfg6ZYr+6v0qcyw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbYb8KqEqivvLjzyiWI5rurB5u92efzNjn/xYOl76bPvs5ft0qXlQr8Zpe6CXWJKH
	 T+6/YxlN7Y7xTZOFHmaUnFlgM5yh8fHaIEAO7qN+j2fBqKvbGoe9lHsFodzAJpk2VP
	 C3rejnuXrPzm27x91VF4Eibz01mrKsXd+ELHJ9Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F88AF8021D;
	Mon, 29 Jun 2020 18:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A447F80217; Mon, 29 Jun 2020 18:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409AAF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 18:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409AAF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="YxD+5OgS"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efa11730000>; Mon, 29 Jun 2020 09:06:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 09:07:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jun 2020 09:07:00 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 16:06:52 +0000
Subject: Re: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of
 DPCM DAI link
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-11-git-send-email-spujar@nvidia.com>
 <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6e27daa5-331e-968b-4027-2e30aeb7d382@nvidia.com>
Date: Mon, 29 Jun 2020 21:36:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593446771; bh=OVksQmxd9G7WSmyyiVs/lX28qBaAZhOMfFyNIVXyrec=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language;
 b=YxD+5OgSffkhRcRxCwHZzEnQHlby9SxFMJo9S0KJMZKJckwG9hyjYqXZ/aXbDugKv
 0Igk7lHL3l2XDUyZoT6z9HLh61gudp9Vr405dHjjj7VxQScuaiE4CGBGgBwWVL80FY
 ZKUszHmXpuqKqNz3K5iX/KR8sz9jogyKn0dbn9TO3398OZNbQ4aATeGHeHEQ/suA29
 DmqWIHVS3CZkjxBUUbrLrsF8XsgWr1uqjQhDpXOiOW3BnidSLTlrT4ZdKusKyMIT5E
 sve6aF5gYT9zq4lPLsnILYgllF/z+novshq6f3/wKvyyH/0fqQIkkSQ8K0LaZlcgvV
 RDDxpzbxDPMQA==
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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



On 6/29/2020 6:26 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>   simple-audio-card,dai-link@xxx {
>>       format = "i2s";
>>       bitclock-master=<&cpu1>;
>>       frame-master=<&cpu1>;
>>
>>       cpu1: cpu@0 {
>>           ...
>>       };
>>
>>       codec@0 {
>>           ...
>>       };
>>
>>       ...
>>   };
>>
>> In above case CPU is expected to be configured as a master and Codec as
>> a slave device. But both CPU/Codec are being configured as slave devices.
>> This happens because asoc_simple_parse_daifmt() uses Codec reference and
>> sets up the 'dai_link->dai_fmt' accordingly while parsing both CPU and
>> Codec.
> I'm sorry but I don't 100% understand about this case...
> asoc_simple_parse_daifmt() should work in this case
>
> The reason why it needs codec node is that
> SND_SOC_DAIFMT_CBx_CFx are "Codec" base Master/Slave.

Currently soc-core has following code snippet,

/snd_soc_runtime_set_dai_fmt() {//
//     ...//
//
//     if (cpu_dai->component->driver->non_legacy_dai_naming)//
//         fmt = inv_dai_fmt;//
//
//     ...//
// }/

Above flips polarity for 'cpu_dai' if 'non_legacy_dai_naming' flag is set.

1. Hence example mentioned in the commit message does not work if my 
'cpu_dai' driver does not have this flag set.

2. While it is true that we consider reference of 'Codec' mode for 
simple CPU<->Codec DAI links, for DPCM this does not seem flexible. For 
DPCM links CPU and Codec are not directly connected (CPU<->Dummy or 
Dummy<->Codec). Please consider, for example, if the DAI link has 
multiple CPU/Codecs. Which 'Codec' reference needs to be considered? 
Isn't it better if we explicitly mention which DAI we want to operate as 
'Master'?

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

