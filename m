Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E078823A3C9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 14:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8793A1665;
	Mon,  3 Aug 2020 14:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8793A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596456339;
	bh=iXO8glWr2zhMSeg635ETmCi3QUYJP7l7xfJeIO+/fOI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kilZvy2Kf6bM6t6/m1Z4USU5GCGeKbMFkYYBS5DfCGKFSUg3DJIJdVmkDYCnyb+XZ
	 g94xb7gdjLnrbq8vEIzxOcQSWazSmvFbAPeOYw/5IVX7njmlZtIpE9Ed1XzxWLPFYA
	 XWjF3Gs4Iyfc69uICis3xSKLtbKeg9bePVbpvapA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79040F80259;
	Mon,  3 Aug 2020 14:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D51BBF80249; Mon,  3 Aug 2020 14:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14128F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 14:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14128F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="JzDHWYN5"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f27fcfd0002>; Mon, 03 Aug 2020 05:03:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Aug 2020 05:03:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 05:03:22 -0700
Received: from [10.25.96.161] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 12:02:04 +0000
Subject: Re: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple
 endpoints
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-4-git-send-email-spujar@nvidia.com>
 <87365n2i2z.wl-kuninori.morimoto.gx@renesas.com>
 <870feaf2-3aa2-dbb8-f883-9b6cfcb36d82@nvidia.com>
 <87o8oazs5a.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c3df2601-7b01-1880-790c-658a50fbca31@nvidia.com>
Date: Mon, 3 Aug 2020 17:32:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8oazs5a.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596456189; bh=O2ZsugzO8H52yaoEOi95oGcqyHBPMBe8xC47X2C3qKw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=JzDHWYN5PjPUbG1Aw90Z7OXdXilf7uR2/t0Va7reEfIuYW6g/i8iGV0NRWbsvui3C
 CzATlG9CpyBuCM99pLu8cbWd6YWuDv5cRGt9dnndvu954qBnJoMbbdffvvn8t37PhZ
 RnD5PdHEgYWk3eVXztq2w5eeCfdg6gCXA1A3RBBR9vHhwsxpOQP9YNVKr5mJ3+snur
 h7vjJCwomgy5E7x7HxbpYC3ZD5SvAuHhnnWS/F6LFwssc48VUQ0HIVgqrmHxp0LPP5
 UKZLvhJMa75f6+Z+AatO7+ZtSzHBJ6BYzbGrM4gznpcpgZNivFi6MwV4fSjaeOSYgA
 FV4fC8ti9no2A==
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


On 7/20/2020 10:43 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
>>>> index 1e20562..b1903f9 100644
>>>> --- a/sound/soc/generic/audio-graph-card.c
>>>> +++ b/sound/soc/generic/audio-graph-card.c
>>>> @@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
>>>>    static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>>>                                   struct device_node *cpu_ep,
>>>>                                   struct device_node *codec_ep,
>>>> -                               struct link_info *li,
>>>> -                               int dup_codec)
>>>> +                               struct link_info *li)
>>> This patch breaks DPCM connection which is used for MIXer
>> Could you please elaborate a bit more as to what is broken with this?
>> The problem I am trying to solve here is to have multiple endpoints
>> for Codec port.
> For example MIXer, it is like below.
> If you removes "dup_codec", it breaks MIXer and/or TDM split mode.
>
>          CPU0  ---+---- DAI
>                   |
>          CPU1  ---+
>
>          cpu {
>                  ports {
>                          port@0 {
>                                  cpu_0: endpoint {
>                                          remote-endpoint = <&codec_0>;
>                                  };
>                          };
>                          port@1 {
>                                  cpu_1: endpoint {
>                                          remote-endpoint = <&codec_1>;
>                                  };
>                          };
>                  };
>          };
>
>          codec {
>                  port {
>                          codec_0: endpoint {
>                                  remote-endpoint = <&cpu_0>;
>                          };
>                          codec_1: endpoint {
>                                  remote-endpoint = <&cpu_1>;
>                          };
>                  }
>          };

Thanks Kuninori for explaining above and for giving a background in an 
'off-list' thread. I will re-work on the patch by limiting the changes 
to specific flag so that it does not affect any other user.

> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
