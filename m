Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B644620EC99
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 06:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 588EE1614;
	Tue, 30 Jun 2020 06:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 588EE1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593491122;
	bh=M1FO4a0Tadp+MsltkJpbMA0ZclSKLzOagjOf7BgpGfo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsdqdCLSosozPCYlPjFSIpBmgEWSM/wErLz2n4DvatWyWHVZCJTWFn0gha2qrFy4o
	 VPXsXck0y5fNBcZrjeTHLfX0APoSw26vAkGudw2Eh4CYxxM7BHPUUihxXev//g9okW
	 QA+duqnePtYYLxgxzYw1lIzD6SmaLOarVtsmOq9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4F9F80135;
	Tue, 30 Jun 2020 06:23:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3959F801F2; Tue, 30 Jun 2020 06:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56F71F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 06:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F71F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="KFm94Zmr"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efabe350000>; Mon, 29 Jun 2020 21:23:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 21:23:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jun 2020 21:23:30 -0700
Received: from [10.25.97.62] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 04:23:18 +0000
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
Date: Tue, 30 Jun 2020 09:53:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593490997; bh=xVHyFfHPIidSHxN7yApdQRi+VKW3raOMRhZ20mnwvN4=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=KFm94Zmr8NEsE0RETSGuSmaByfCg6wQZQ5B9ZQDnzCQLjQR47nz6Uu1oDaKdoO/2b
 VIhoKXkfm/7tkDLATqIY46lQdGsfW2SX6xf0TDadHdTm/V8aTiPk4RTwTQJ9x+DdR1
 50DyqvT9T99B8v2q6tb118gXFQWQpcLpuUQffQJCiuB/0yw4sNOFdLnKDUzhpQmZlx
 2uTGWtqXkTP7oPoU2uEJ3F7RsWcpr1qnUViW0y+bqdPRsqzJjzvc9ioyck6ohD2efP
 gNp8+dxrcTxfXVWUR3Nw6h9IQm69+n7DeOzwSyfImNECN81CQvK5cesL+5YbXt3kP5
 Y8Mg3BWuc7aXg==
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



On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>>         snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>>>>         of_property_read_u32(node,      prop, &props->mclk_fs);
>>>>         of_property_read_u32(cpu,       prop, &props->mclk_fs);
>>>> -     of_property_read_u32(codec,     prop, &props->mclk_fs);
>>>> +
>>>> +     if (cpu != codec)
>>>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
>>> Maybe we want to have "cpu" in simple_dai_link_of_dpcm() side
>>> without using magical code in simple_parse_mclk_fs() side ?
>> Are you suggesting if we should simplify simple_parse_mclk_fs() by
>> either passing 'cpu' or 'codec'?
> Oops, sorry I was misunderstand.
>
> But I still not 100% understand what do you want to do here.
> Maybe 50% is my English skill, but in your code
>
> (C)             of_property_read_u32(cpu,       prop, &props->mclk_fs);
>          -       of_property_read_u32(codec,     prop, &props->mclk_fs);
>          +
>          +       if (cpu != codec)
> (B)     +               of_property_read_u32(codec, prop, &props->mclk_fs);
>
> and
>
>          -       simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
> (A)     +       simple_parse_mclk_fs(top, np, np, dai_props, prefix);
>
> Because of (A), cpu = codec = np in simple_parse_mclk_fs().
> Do we have chance to call (B) ?
> And it still have read_u32(cpu, ...) at (C),
> this means all np will read mclk_fs anyway ?
> For me, if you don't want/need mclk_fs, don't set it on DT
> is the best answer, but am I misunderstanding ?
Sorry if I was not clear before.

My goal was to get rid of 'codec' argument from DPCM function 
simple_dai_link_of_dpcm(). Patches 10/23, 11/23 are preparations for 
12/23 to have multiple Codec support.

simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and 
simple_dai_link_of(). To make the same API work for both the cases, I 
had to use (A) in DPCM function. Now (B) does not get used for 
simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().

If it is simpler I will just avoid 'cpu != codec' check and keep the 
function simple_parse_mclk_fs() as it is.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

