Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0420CFD0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 17:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355D0165D;
	Mon, 29 Jun 2020 17:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355D0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593445717;
	bh=knRj7XMqh6IZEBihHsYaV6rhtoQG96GFKK0ozMKuoas=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5bzoTrSakS+z+svaKsqQpsN+Ea8qsY+XuceHQebVPqj0NSN5WkA08MvfYrjI4P/V
	 4sD1G4DsLShM4ywdzWxHbHoP+1c5QIJWCKlkyd9gDXF/gV6DS6ZSsRM4wLWEL6/RW0
	 Xv9DbCxkJuKSngOqAr9CZE5bIQxMqoOhoLpXsSYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56810F80096;
	Mon, 29 Jun 2020 17:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D36FF80217; Mon, 29 Jun 2020 17:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44EF1F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 17:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44EF1F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="crlH/71/"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efa0cd20000>; Mon, 29 Jun 2020 08:46:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 08:46:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 08:46:39 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 15:46:32 +0000
Subject: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix parsing
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
 <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <5ad958bb-a736-2391-31fa-c32e13750322@nvidia.com>
Date: Mon, 29 Jun 2020 21:16:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593445587; bh=AivjTXZmlEwPaPeki/OKMhcWRIlg67pix78mVS/IG5g=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=crlH/71/oPsaD1V4+PwTZqGicdSi20WdXty8nf7RLaTpAyp6gkuO+Pa0+2UZAzrST
 M03XnZnhMY/EQUOIJHuUx8axa7TTlwsq/wr0I0DwlvAxPbiomyLkD3Lt+Q3ZTf+MED
 saUFpl/tGXzBT8KgWaQZ2pnsYOa/pcy1uyyeJ7/GQZ3xrQbbyHLxOBcG01AiG2hJEg
 ifZvRP/d7uwMOwPZ2Ny1d/IWZHl8S1ZeUiIoFqjdL2rR+bZE8v6V56Ksh4iKbn9Uu3
 4If5OLDYVnz90Z0NXsA1/ib6mXGckJEpW3czH6pOHE1LRbvTTQpOv1JZ7Ain2t82Pd
 6OoO+gowAKlnA==
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



On 6/29/2020 6:08 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
> Thank you for your patch
>
> # I guess there was ML registering magic until v3 ?
> # This is 1st time for me to get this patch series...

Until v3 the series was mostly about registering ASoC components. Based 
on the discussions in the previous series and threads, I have updated 
drivers to work with DPCM and added patches for simple-card driver to 
test complete audio path. Yes, simple-card driver patches are new and 
were not part of earlier series. Sorry if I was not clear in the cover 
letter.

Thank you for the review.
>
>> The "prefix" can be defined in DAI link node or it can be specified as
>> part of the component node itself. Currently "sound-name-prefix" defined
>> in a component is not taking effect. Actually the property is not getting
>> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
>> "prefix" is missing in DAI link Codec node.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> (snip)
>> @@ -1111,8 +1111,10 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
>>                struct snd_soc_codec_conf *map = &card->codec_conf[i];
>>
>>                if (snd_soc_is_matching_component(&map->dlc, component)) {
>> -                     component->name_prefix = map->name_prefix;
>> -                     return;
>> +                     if (map->name_prefix) {
>> +                             component->name_prefix = map->name_prefix;
>> +                             return;
>> +                     }
>>                }
>>        }
> This is nit-pick but it can be like this ?
>
>                  if (snd_soc_is_matching_component(&map->dlc, component) &&
>                      map->name_prefix) {
>                          ...
>                  }

Sounds fine. Will update.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

