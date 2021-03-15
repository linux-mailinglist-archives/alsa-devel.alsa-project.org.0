Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C633C0AB
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 16:59:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B531792;
	Mon, 15 Mar 2021 16:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B531792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615823982;
	bh=t6xln9RocxPVJkF7rFwfOeM4/nFLvCz90J9wzE3tS7s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EULh4ALaa0sHAvZED2KT+oQoj4MgvQ3FXpMNymPS+FYAD5NDmi0Lo+/1s4iAL2kSc
	 dD5ay/oZ5AEzCas11+k0uNQTA7mbC9u7OMgj2wIvV6O2ONocmwSKDXacIkZWD4P//8
	 Wi8721/lly6QYr6EnmeNWyW2np/+OgEWP0KsDG+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B87D5F80100;
	Mon, 15 Mar 2021 16:58:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2955BF80171; Mon, 15 Mar 2021 16:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06736F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 16:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06736F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jCV/tZ7p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0lKEPZJK6q0tUFd9FRtASCTYacuGt2Bz5Jb78IYivSSZvaFsRy8PqHQZYLzSjDQkPcDHtfoByP56qtgIwc625TQoQEVt+GK+xzZm7ZznWCli7cIm7+BJLvS+33yTybSuTEM+CuirXth26sqmyZN7d3WJfLAVaNdrkKeEg2TnwInkPSFAGXU/S+H5yaAHuIFkkblxsIBYDTE+YM1M1QRD7x0LgcmC19lN8RfILo8YlqJmLRi0R+cuLno8EsW1YoHnfGc4JmBifRDeCcu/qoUiV2h9geVV+D9ieMdajMcZ/Zm2EqpmqQ7mk/XxunonIqf1GJku+tqATZOFlKbbIT9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk7dOSHf8cKl0cJHfZFgC8msYSsQIJH0vkApDiuhluA=;
 b=cYDRTmJSMwyv0X2Os0SWjhTFNxOp+A3JKmxlYAyLPhuz0wNTS/C4oKZiVGvf6tUw4nXVlBxlaZ4BoUpWtKA37RBZYwTCzOIrVTFyvQaEc7qGLIAvZwCQvaCzIvQZCFb5eEbcPdSYDx4B4viETqzbXSxUO/IIpM2g+hKuad3QVxXasQfCqQzSBk+b7jJC2jejoYuvr/qfZyMSI/6O2AGHgsTNVC31SFB2w2o39M4GiVTww6arldCvrtgYQTeG08ugbWs9zTc5Mj1qcu3pvyQLdsB+1o+JxLMFXKuRNdudRBhz/dv4UrCOIg4nrsJHZFJjRzP/ZpuZmCA7YvFfuUKwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk7dOSHf8cKl0cJHfZFgC8msYSsQIJH0vkApDiuhluA=;
 b=jCV/tZ7pXarFqqpejpcasKPL/DXSIa9Qvr5bXFn9VUjqVI3jYyCtEXiUkgP55IsiVkXMU0wRtMyr84U+HRwuWjUccgk7FWspcbHp33t3lC0uuWoNDu0ZN9X9dijjx+ZD43lSqcDGt1v2TS15C1asUm4bMi8vbnRd6vCFolxiHrGd4M5xuSG15+hzIP0bJosSvbIcTHdtYCCzelqXui3UbTKtDuJbO+TmosjUEYfAwA9DTNcCL3QjXvvXEO3w5s0PgtKQdoPhHYLr3nZOuEcmbiYWmloQtAX/2ud+AyhmjEATKMYVSVS5drJthzc1XdtV7NiD7STtr2/xMuNp/xVC2w==
Received: from DM6PR13CA0065.namprd13.prod.outlook.com (2603:10b6:5:134::42)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 15:58:03 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::55) by DM6PR13CA0065.outlook.office365.com
 (2603:10b6:5:134::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 15:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 15:58:01 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 15:57:57 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Michael Walle <michael@walle.cc>
References: <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
 <8cdf1cfa971945792b509a687a4de735@walle.cc>
 <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
 <33a5c89d15ca04ad75f9993bd5d22cb9@walle.cc>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <99d5d684-54a2-9010-890c-632cdde83030@nvidia.com>
Date: Mon, 15 Mar 2021 21:27:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <33a5c89d15ca04ad75f9993bd5d22cb9@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d3a792-5e8a-45a9-3335-08d8e7cb1c9b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3790D0B42A14FA74C877F767A76C9@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGjknnWK1MgXv6/jBQNOKu12YoFZbtnp4X8evqayyPiVEUWevNQQMK1HwKqUVT97086T4S0jMQsuGCZTkR8AbZ/7h+OA2Wz9ZwolnIQC9kltazwx3zD92bJ3EVU1kCpPZpwwgyuvoQ95TvTzGblvbn/qMwDpYTz29wuUInZ4mM6aZuwEZL5pg/s7HYrcTuYr2MwHLdTx4Yyr4vo5iZ0+Gprm9tOsbYzTL65YpEx4z9x6/U71SsZUQ4LoYMBlU/yki7txCH8UdKtYe62yFy4e6hvIwKHkPlhe0YWKp6M1EoY2XxXZrOYwduQ7MeXOysHAWDpctd2tpqb7kEfyBAxG+LluDIfA7412seFeNvPLoCsqFKoqsAl2dldxHBB4V+1zMDYnx/ICdDQpDDyWMrEwjsv49tfxLAoVw5WTV5t9xrPPentMaJfisWuwBaM9t0zLDU6HMHfJaIo36V8kaxO1/xdkQK3ubkZNX54BPkTN0tNZNTpXDKeTZDnL+lmiG/Kn6GWSK54Dsm+mT7X6Lg6tkGwhp9gdhdVgbhLFVERF/a/2iTG9f+vDi8Lhc7Qep0r6wfKC8tP0XW9jEMOUi4QSOfxIqwTfoWeTRjPL7egf1NYa6TyGR10DVsx6BRblDxjaDUSmwyOXgPG/47ERu7hEhCGZqEokZEgrzkULU/wYZy9KN56ML6d2mBb02a+3H+OTUjV2fzgsAV2+FjzZJKm+j4AMYHK5X2gKRk+spN1fCE4=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(4326008)(356005)(6916009)(83380400001)(36756003)(186003)(16526019)(36906005)(70586007)(16576012)(316002)(7636003)(53546011)(2616005)(70206006)(6666004)(82740400003)(36860700001)(31696002)(26005)(8936002)(478600001)(82310400003)(34020700004)(8676002)(336012)(86362001)(426003)(47076005)(31686004)(2906002)(5660300002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:58:01.6106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d3a792-5e8a-45a9-3335-08d8e7cb1c9b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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



On 3/15/2021 9:03 PM, Michael Walle wrote:
> Am 2021-03-15 16:19, schrieb Sameer Pujar:
>> On 3/15/2021 5:35 PM, Michael Walle wrote:
>>> Am 2021-03-12 14:46, schrieb Mark Brown:
>>>> On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:
>>>>
>>>>> The card calls set_sysclk(), which eventually ends up in the codec.
>>>>> The codec therefore, could figure out if it needs to configure the
>>>>> clock or if it can use its internal FLL.
>>>>> Is that what you mean?
>>>>
>>>> Yes.
>>>>
>>>>> But the set_sysclk() of the codec isn't even called, because the
>>>>> card itself already tries to call clk_set_rate() on the Codec's
>>>>> MCLK,
>>>>> which returns with an error [0].
>>>>
>>>> OK, so I think we need to push this down a level so that the clock
>>>> setting is implemented by the core/CODEC rather than by simple-card,
>>>> with the helpers being something the CODEC can opt out of.
>>>
>>> Sameer, it looks like the proper fix should be to add the clock
>>> support to your codec.
>>
>> I agree that complicated clock relationships should be handled within
>> the codec itself, however MCLK rate setting depends on "mclk-fs"
>> factor and this property is specified as part of
>> simple-card/audio-graph-card codec subnode. Right now codec, in
>> general, does not have a way to know this. The set_sysclk() callback
>> takes rate argument and not the factor.
>
> Why would you need the factor?

Sorry, you are right. I misread the flow. Fixed rates can use 
"assigned-clocks" binding and runtime updates can depend on "mclk-fs". 
No additional property is required for codec. Something like below 
should help.

>
> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index 67f0ab817135..7fd41f51f856 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
> @@ -3426,12 +3426,18 @@ static int rt5659_set_component_sysclk(struct
> snd_soc_component *component, int
>  {
>         struct rt5659_priv *rt5659 =
> snd_soc_component_get_drvdata(component);
>         unsigned int reg_val = 0;
> +       int ret;
>
>         if (freq == rt5659->sysclk && clk_id == rt5659->sysclk_src)
>                 return 0;
>
>         switch (clk_id) {
>         case RT5659_SCLK_S_MCLK:
> +               ret = clk_set_rate(rt5659->mclk, freq);
> +               if (ret)
> +                       return ret;
>                 reg_val |= RT5659_SCLK_SRC_MCLK;
>                 break;
>         case RT5659_SCLK_S_PLL1:
