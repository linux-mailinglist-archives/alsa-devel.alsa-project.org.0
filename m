Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002423A3D9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 14:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A681166C;
	Mon,  3 Aug 2020 14:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A681166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596456532;
	bh=Vipf3DwvNG8OKpD+nZt8DI9D90lu7KhIt0M5Dz3sXmc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGDzgzpY9xEnwfXFGRNwq4b7A7cofN7hf9romT8C2VSVpqJRK5aActz7fIbLM9hcx
	 K3qg+7iFe8K0PVc3CNY4fwkCZwigFhT9OducRKe23DRwE/aXPuFPBw7zTH9ChyxhBX
	 71SLt6rFdbUanULvIaJpRfNWCMu5HkshBTIhxv6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8256AF801F7;
	Mon,  3 Aug 2020 14:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D0C9F80218; Mon,  3 Aug 2020 14:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 780E6F800BD
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 14:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780E6F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qB3L+FIn"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f27fd860000>; Mon, 03 Aug 2020 05:05:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Aug 2020 05:07:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 05:07:03 -0700
Received: from [10.25.96.161] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 12:06:55 +0000
Subject: Re: [PATCH 09/10] arm64: tegra: Audio graph header for Tegra210
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-10-git-send-email-spujar@nvidia.com>
 <871rl72gjb.wl-kuninori.morimoto.gx@renesas.com>
 <b5484f5d-6ed4-e04b-3e62-8f4f3893ed67@nvidia.com>
 <87pn8qzt6n.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6a84b5f8-3e9c-96e4-c8f8-ec95ff5e42ac@nvidia.com>
Date: Mon, 3 Aug 2020 17:36:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87pn8qzt6n.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596456326; bh=O17RBFs0E+MM0oeqpF+ZH5SzEfjMCHt248amEuAzj9c=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=qB3L+FInzKYByqbBGHPxzkO0x8F6IjpXhXmBoQ05KQ3cM/RUYKsqeVCA2r8EnWGUu
 ARTnwguioC5a73RO4UcCnSCwsy6Wi6F4Szt7/KlG1FEkQ1h9upp7+4gns2+xyfDU45
 Exg+vyrjpzzaOq/zgSCYZltBaR1IjU8iCrPTR7iXLPd04RJzaqMEzIJuakc/zPtExU
 dKiTaALqOf7Vsa3CynVZ09UVmMYJ48uuknvjNENqDKUF5iA/3dRGlae0mk2q2x+c0b
 QwHLJcSl0hbzfXAKamvjUV23qf54aUZ7wik1sklR/AQghO4eHjX/FKPZNeo+GlFmuv
 9PNtQyL4EObMA==
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


On 7/20/2020 10:21 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>> +&tegra_admaif {
>>>> +     admaif_port: port {
>>>> +             admaif0: endpoint@0 {
>>>> +                     remote-endpoint = <&xbar_admaif0>;
>>>> +             };
>>>> +             admaif1: endpoint@1 {
>>>> +                     remote-endpoint = <&xbar_admaif1>;
>>>> +             };
>>> (snip)
>>>> +             admaif8: endpoint@8 {
>>>> +                     remote-endpoint = <&xbar_admaif8>;
>>>> +             };
>>>> +             admaif9: endpoint@9 {
>>>> +                     remote-endpoint = <&xbar_admaif9>;
>>>> +             };
>>>> +     };
>>>> +};
>>> I'm not familiar with your system, so, one question.
>>> Does this ADMAIF has total 10 interface which is used in the same time ?
>>> or select one of 10 connections when use ?
>> One ore more ADMAIF interfaces can be used simultaneously. In fact all
>> of them can be used at the same time.
> Ah, sorry my questoin was not correct.
> I want to clarify was that below.
>
> In my understanding,
> if your system has 10 interfaces,
> you need to create 10 ports, not 10 endpoints.
> If your system has 1 interface, but is connected from 10
> devices, it has 1 port 10 endpoints.

OK, I see your point. I will work on re-organizing ports/endpoints and 
once tested will publish V2 for current series. Thanks for inputs.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
