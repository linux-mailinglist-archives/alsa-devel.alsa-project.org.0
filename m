Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD0225674
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 06:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C09921657;
	Mon, 20 Jul 2020 06:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C09921657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595218567;
	bh=D1W/TJBSRYNLqMmfHtigTPJ5uQo12q/u7w8uTwreA3M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtYuJgvyyPWmQpnCrxsL+Y6/klDy9yVWHwfPvSiDcoBPELAUDiiUyvT+yCNG+jmKd
	 OxgtnoIChmqw9jXFf9zcMtsZC/oQFHZrUYpgJJjdYjjNbRnNL8HaTMMOOkCbiWqDLs
	 q+JmLXHYzEPxWuTzg+ZgcTJKWL7vVe9JDspjrCME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D476FF800F5;
	Mon, 20 Jul 2020 06:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BBF0F800F5; Mon, 20 Jul 2020 06:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98DD8F800C1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 06:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DD8F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="TZQQOzD1"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1519d70000>; Sun, 19 Jul 2020 21:13:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 19 Jul 2020 21:14:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 19 Jul 2020 21:14:12 -0700
Received: from [10.25.99.163] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 04:14:05 +0000
Subject: Re: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple
 endpoints
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-4-git-send-email-spujar@nvidia.com>
 <87365n2i2z.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <870feaf2-3aa2-dbb8-f883-9b6cfcb36d82@nvidia.com>
Date: Mon, 20 Jul 2020 09:44:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87365n2i2z.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595218391; bh=nx5lAIYmOjDB4BduiFhtKmLRJSU6RRYMWVlTJDi4E/g=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=TZQQOzD1ItvuulsVlIa1WUJnL2CkhNwOS7poO+6Z3JLe7mfSuyw4hSfeMpFQd21CS
 JJ3HoVHvh+iE6GRADC1p22/9vIGbMcunNC1+048hYcRz0J22zowoilNrZoxfNXZfd+
 tbchL+aGMtAZ7Ju8oaNI3XV7rEEdiOiKWRzqk3qyuYSVvvq50KxqfvzHtQ1J62rbiD
 TWW/BTWpr8Jshg0aNzRe6UvMNcB+VjYF4BrD4WdoD2HgF0cY/xmSfjRqqo2l6DtDrX
 RwD6efyaI4vgy198gRaVOn68x1Qh4jzZsjGqZs6d4/x8ERbWFQbj8P4rMUiuqasSZi
 BBgS3IvXcCZJA==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
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



On 7/20/2020 5:07 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> If a Codec port has multiple endpoints, only first endpoint gets parsed
>> and remaining are ignored. This can be fixed by removing 'dup_codec' flag
>> passed to graph_dai_link_of_dpcm() and thus it loops over all endpoints
>> of Codec. Similarly graph_count_dpcm() is updated as well.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   sound/soc/generic/audio-graph-card.c | 28 +++++++++-------------------
>>   1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
>> index 1e20562..b1903f9 100644
>> --- a/sound/soc/generic/audio-graph-card.c
>> +++ b/sound/soc/generic/audio-graph-card.c
>> @@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
>>   static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>                                  struct device_node *cpu_ep,
>>                                  struct device_node *codec_ep,
>> -                               struct link_info *li,
>> -                               int dup_codec)
>> +                               struct link_info *li)
> This patch breaks DPCM connection which is used for MIXer

Could you please elaborate a bit more as to what is broken with this? 
The problem I am trying to solve here is to have multiple endpoints for 
Codec port.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

