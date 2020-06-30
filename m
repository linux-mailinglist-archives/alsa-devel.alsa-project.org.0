Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E720F021
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 10:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B3B7845;
	Tue, 30 Jun 2020 10:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B3B7845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593504332;
	bh=TxP20BERYvygj3oxEU69F+wciZGscZHtRG0lLeUXHSw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WW0WPB30j9XEbwjvYoWFdoPTKAvWkhK4Sy7886ANyveReprbuvzDSSVtVFxJ6rmAO
	 04lKkwP9eRr2oXJoEmghWidKBGM8S9ES11pCkTGiQ8CWHOl2xzd3Z7k2P6T+BzkWyD
	 e/aFstjnt8vuV2In6wYxpnRy6XBjtkZB41qBAR+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35397F8022D;
	Tue, 30 Jun 2020 10:03:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B79C6F801F2; Tue, 30 Jun 2020 10:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91ED5F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 10:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91ED5F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WQUwIr+W"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efaf1a90002>; Tue, 30 Jun 2020 01:02:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 01:03:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 01:03:39 -0700
Received: from [10.25.97.62] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 08:03:31 +0000
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
Date: Tue, 30 Jun 2020 13:33:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593504169; bh=DnKjNwH/guC7EJEpkXLjFlHpxsWMMzSc4XkpFzGQbAg=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=WQUwIr+WF/GGwacJzN7rnd4pRjFlBamjWeqTONoPBOOZYgq7blpSZ87MHNdErkG/V
 Bo5un9TEvghvrPYJtlgg/3/67mIK7K7OuME2UgysIJBrQsLscV7rPe5qsImS52vi+l
 tBtyNEId8MOyf5+oALW7p+QzyXv+QJXTIyVzbhzhl3PV7l6YaQqkhjgk3lnk4FEvP2
 Hwh38kn4IjXhwdJaI/HKbUZjmGQYG/YPm71jdjU6NGptDUih2eCD6TgFWKc6IhKRkX
 G1nr50EASreeu9otzItyG9V/VzGXnbHR6oGij3dXYjDlW+ElcrOlMWu8e+AzFJ1YZa
 d+zK2Z3ASZHUA==
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



On 6/30/2020 11:37 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> PCM devices are created for dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement pcm_construct()
>> and pcm_destruct() callbacks. Based on this, current patch exposes
>> a helper function to identify such components and populate 'no_pcm'
>> flag for DPCM DAI link.
>>
>> This helps to have BE<->BE component links where PCM devices need
>> not be created for CPU components involved in the links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> +bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
>> +{
>> +     struct snd_soc_component *component;
>> +     struct snd_soc_dai *dai;
>> +
>> +     for_each_component(component) {
>> +             if (!component->driver)
>> +                     continue;
>> +
>> +             for_each_component_dais(component, dai) {
>> +                     if (!dai->name || !dlc->dai_name)
>> +                             continue;
>> +
>> +                     if (strcmp(dai->name, dlc->dai_name))
>> +                             continue;
>> +
>> +                     if (component->driver->pcm_construct)
>> +                             return true;
>> +             }
>> +     }
>> +
>> +     return false;
>> +}
> At least my CPU driver doesn't use component:pcm_construct
> but is using DAI:pcm_new for some reasons.
> I'm not sure checking DAI:pcm here is enough, or not...

OK. If adding DAI:pcm_new above here is not sufficient, then a flag can 
be used to describe FE component? or is there a better alternative?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

