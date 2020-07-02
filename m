Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81328212070
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 11:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0702D16E4;
	Thu,  2 Jul 2020 11:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0702D16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593683903;
	bh=0KliAdk2KDdHRlJJRKUdgwcgXxNfW4cUzqtQm1UECyg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=byQ/9hWapXFijByBDfuYwYlodeffKjYkA1l5VPFtyUtHoqa9G7kLKPRO6yEByAViX
	 5k8F0j9939gG5Gj/V97mTW2ccvI5sHLWZzkNn4arVP64irtFjPafvcVNmPcUse5IqO
	 NGUK14sVFpHWFo21hkhRLYeuPaKqrwupck7Y1NmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 469DDF80245;
	Thu,  2 Jul 2020 11:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A86F8022D; Thu,  2 Jul 2020 11:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 171CAF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 11:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 171CAF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="JaTHyCUH"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efdaeec0001>; Thu, 02 Jul 2020 02:54:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 02 Jul 2020 02:56:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 02 Jul 2020 02:56:33 -0700
Received: from [10.25.97.252] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:56:25 +0000
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
 <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
 <87d05ezqlc.wl-kuninori.morimoto.gx@renesas.com>
 <49bac9c1-093c-d353-cef3-c9c3391cc00d@nvidia.com>
 <875zb6z4fq.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c23f962a-7192-8187-39d8-18eff26e06be@nvidia.com>
Date: Thu, 2 Jul 2020 15:26:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <875zb6z4fq.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593683692; bh=dDYuyP/VcCvHIR0JuEEZXo9QqLf+pb+8/yFvb6XxP/g=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=JaTHyCUHRSSIxrMUZwHzmEP4jaeDDaUhMyF/Vq4hBT2x86Hv7lFPDY5qyddsEe6eH
 LZ/H8+3TKvgKFHq9dYpDB13s4XKRW/icwqU/QIT6fVXsih+UdkCtxRv5ZJDR5x+nsC
 6b2eoafvPpUY7C+10Q2YadI+ycqZZU4oz54ATWoHvUUoz97m2L1TN5VsEqt3GUERU3
 QdGeVvznLbqFJIo8GXJW3cK8MTkTiRVCG515/9g89c5RkUKrRwyMIqbpBe16dznfxK
 pMGfCpvO8yW5zS8U3f0nr1Ry+Aw6ZRM+toEp3OZCuTnj66iAHEx95pTDYPTVaSgL9V
 aQ0sJJXuudzOA==
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



On 7/2/2020 2:20 PM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>> I wonder component->driver->non_legacy_dai_naming can't work for you ?
>> I see currently in simple-card driver that, BE<->BE link would be
>> treated as CODEC<->CODEC link if 'non_legacy_dai_naming' flag is set
>> at both ends of BE. Do we need to set this flag for all BE?
>> However I am not sure how this will work out for a BE<->BE DPCM DAI
>> link considering the fact that I want to use chain of components and I
>> guess routing map would get complicated. Also going by the flag name
>> it was not meant to differentiate between a FE and BE?
> OK, non_legacy_dai_naming was just my quick idea.

>
> Maybe your soc_component_is_pcm() idea can work,
> but it seems a littl bit hackish for me.
> So, can you please
>
> 1) Add soc_component_is_pcm() on simple-card, not soc-core ?
>     Maybe we can move it to soc-core later,
>     but want to keep it under simple-card, so far.
>
> 2) Use it with data->component_chaining, and some comment ?
>     non component_chaining user doesn't get damage in worst case,
>     and easy to understand.
>
>          /*
>           * This is for BE<->BE connection.
>           * It needs to ...
>           * It is assumng ...
>           * Note is ...
>           */
>          if (data->component_chaining &&
>              !soc_component_is_pcm(cpus))
>                  dai_link->no_pcm = 1;
>
> 3) maybe you can reuse snd_soc_find_dai() for soc_component_is_pcm() ?
>
>          dai = snd_soc_find_dai(dlc);
>          if (dai &&
>              (dai->pcm_new || dai->component->driver->pcm_construct))
>                  return xxx

Sounds fine, I can make changes as per above points. Thanks.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

