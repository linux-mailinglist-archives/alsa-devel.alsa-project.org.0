Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1733BF99
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 16:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB0E1716;
	Mon, 15 Mar 2021 16:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB0E1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615821663;
	bh=XmB77LpK7zmAVhjXu2PxkxmkS8+mO2xCbDIHa901I0o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rz21yqbzGi2HEtI7R5e7l1v5KTq/+5qx2GEQLqgNLnkzs0q39flAsxRgDaykp2Z57
	 c2ucjQAcxECrAJRzoPOr47gIYlkwK+qVdTBbEKiw8YOsa2J61qI+HzeTlRSX7mBvEZ
	 aMXi65PHlk7nvAaNr6jaCZEF0KjXJGLa9i07vtvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F95F801F7;
	Mon, 15 Mar 2021 16:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A931F80171; Mon, 15 Mar 2021 16:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B951F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 16:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B951F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="NZ4/4Sy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIX98QNznGDBFeyDIOZ6OSmH639k9ov9IEdmr0/RzwehZvIzAdc3iSoJGgH+sQDtlev2OBSkbxrVZPldFnJ459ddjOHpgbdO9i3w7nQpVfhF9tRwDOaPg2PKreJDVBa3NBaYyJoowMdPsTiPMSaMgQxQV6AKXREMTUJ3KItnD5+FqVNGMCDCp13tHLASAjzG+9RKP+Vgal3lCPbbor5dI/qQV05N2S8vjMlFmI8MLwP/U6jYFVROu47Q2nawyIK8iWiTFGjm6zoCjukhoxCt3U+2J4wAuNWxzpAYpbCbhODVO+biW4c3HxotrNU7WR8/izFjBqK30zzHOiA1SxssLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9kPa4isiLSB8miGBdzM14MwF6nzrdx9VRpECM+kxaQ=;
 b=UA/thBjP+QmXh0z7h/X46Q694DAzUdD1jDy5e8hl6cQ9RhaOa0i4ocg/ZqHhNUZE8/rGnizvuq0pPIKjPBgW0U9ELGc3cSi5runCJcitQDpeWkJbe6eIxJCXryZedVcWvgnpwtGasDoHuGWVRZn0Zmt/efgn+pmFAX9mH35ovY7CFuKGuN6XWEgSRNECx78BVUhvrGh4KEWs0sy6EIb8lY1tN0wKZF3HzGMl0d8CO5X9KMF04pZtBOw9c7+Ql0RoRpYoinQOmPGIe6pwox2uL1KOplZJV0zNLirq6aKRi3lmHfZ2Vfdz8Uwj7PMmks12AeaIwbV7rjJjfbh/XI8oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9kPa4isiLSB8miGBdzM14MwF6nzrdx9VRpECM+kxaQ=;
 b=NZ4/4Sy1QdUJYon0LM3034oA+PD6MGXDti9gx0AkzkuKyb2thZ5qxa0XiTplo/zoOzYaEKNiIRFumQeQVDR3p5vIJhVvezjzmwYx8s6pGcKwVaso63C6HS61xzzaLqWi03hbIqMxeJoELbG0KnSjks8K8akeBCXMTYeiq5N6hQWnbdZtAvi0nh8dqKwfFQ0GtBKkJ5odUPo1UydY0/WjNUMqy/X56nOQtkAV1JsApeMgj9V1M8b9cjGtPVBqFiM7xhUh+k0++/3mIxwpaOqyezNaupRhRmPmyU6PU5qS8RUvgM+SWL/NjMwu6jAQcO/kdvwdFCVlRrsNfs1gexzdhQ==
Received: from MW4PR04CA0098.namprd04.prod.outlook.com (2603:10b6:303:83::13)
 by BN8PR12MB4771.namprd12.prod.outlook.com (2603:10b6:408:a5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:19:09 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::9d) by MW4PR04CA0098.outlook.office365.com
 (2603:10b6:303:83::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 15:19:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 15:19:07 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 15:19:03 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>
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
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
Date: Mon, 15 Mar 2021 20:49:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8cdf1cfa971945792b509a687a4de735@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 978b7207-e4aa-44bc-8940-08d8e7c5ad41
X-MS-TrafficTypeDiagnostic: BN8PR12MB4771:
X-Microsoft-Antispam-PRVS: <BN8PR12MB4771A8689FEC4809C63D1B72A76C9@BN8PR12MB4771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBUABiybkWxBonhgdAOdcpEF3wZg+Pzin3it1O/VdbKnYlExSS6z3j0rOpxoNbRCLmkHFpyW1Ecy0I4y7bVJjqvx31LL5upkkGRK3j9tze7xsShrrn2R1DoJgwLDq5HKkvVtHaJv6g/5aG/B0hMlwWKnAJ8AO20rn7gwnlrvXXzJy5cId3+hWWKEoBqu4nzpcXutabNS9mbJZr3g/lGd/5ntIM87LOLQfO0fG2UDBgRur5oGFqyDFXWcxMiRn4xTlkGBO1gtr06EVhDf3J+GGwhDaTLUkHYq85KOcTVuo7zSSsoHrfzFooIg+529ORObZ6FT4zbHwB0xasLawnWLxw7ghoYg+NIN9AZaC8UgsxTEf6XvC1/yuHx6Vw8HYN0nwYicazh/t3VorNp7RfXN7s8jFmOqC3PP9lRaOHlfWubkygdMK4LVdzFdVN0vK0RzoIMIbUndWs19jSaJOXeGtVT+JCNooarTfdZGnAd4yatXbUF31Cu0/uNM/F0C9iPqUvFHAVVS0C6/VirRMGJ6d+7acE6PKqYQgA6OPkYDjKUE15K4zbOIuDHc2S/bf1sghaXzP0AKTxuxkWwfPwfeTVE6issV/pmzki8c7xKvkqr5MCkGJos7r8tZpFMBG7zBBPjnSaZeAGZdquTTS0kFYom/YE+bTeXiSAd5hsFaqjQOlpVvycZlsx0DeE/wd8I0hdIUo2zYCQ7GE1ZOdDCwlMdyHEcHRs0TYF8/fiSeRf8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(110136005)(70586007)(36906005)(82310400003)(316002)(186003)(36756003)(16526019)(47076005)(54906003)(16576012)(70206006)(2906002)(86362001)(2616005)(31696002)(8936002)(4326008)(82740400003)(356005)(426003)(5660300002)(336012)(26005)(53546011)(36860700001)(478600001)(31686004)(8676002)(83380400001)(7636003)(34020700004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:19:07.3212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 978b7207-e4aa-44bc-8940-08d8e7c5ad41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4771
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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



On 3/15/2021 5:35 PM, Michael Walle wrote:
> External email: Use caution opening links or attachments
>
>
> Am 2021-03-12 14:46, schrieb Mark Brown:
>> On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:
>>
>>> The card calls set_sysclk(), which eventually ends up in the codec.
>>> The codec therefore, could figure out if it needs to configure the
>>> clock or if it can use its internal FLL.
>>> Is that what you mean?
>>
>> Yes.
>>
>>> But the set_sysclk() of the codec isn't even called, because the
>>> card itself already tries to call clk_set_rate() on the Codec's MCLK,
>>> which returns with an error [0].
>>
>> OK, so I think we need to push this down a level so that the clock
>> setting is implemented by the core/CODEC rather than by simple-card,
>> with the helpers being something the CODEC can opt out of.
>
> Sameer, it looks like the proper fix should be to add the clock
> support to your codec.

I agree that complicated clock relationships should be handled within 
the codec itself, however MCLK rate setting depends on "mclk-fs" factor 
and this property is specified as part of simple-card/audio-graph-card 
codec subnode. Right now codec, in general, does not have a way to know 
this. The set_sysclk() callback takes rate argument and not the factor. 
Moreover the same codec is used by other platform vendors too and unless 
a new DT property is added for codec, runtime MCLK update based on the 
scaling factor cannot be supported. This would mean that we will be 
having two methods to specify "mclk-fs" factor, one from 
simple-card/audio-graph-card and one from respective codec nodes, which 
does not seem ideal.

Also it does not seem consistent with the way we handle MCLK clock based 
on where it is specified.

   a) If specified in simple-card/audio-graph-card, MCLK clock 
rate/enable/disable updates are allowed.

   b) If specified in codec device node, it is not expected to touch the 
MCLK clock. This patch tried to treat it the same way as (a) does. 
Advantage of this is, all codec drivers need not explicitly handle MCLK, 
instead it is done at a central place. The platforms which use specific 
machine drivers do the same and that is why probably the codec driver 
patch was never required. It is about just setting MCLK clock as a 
factor of sample rate, whenever the factor is available. I understand 
that it is breaking your use case, but I am not sure if the usage of 
set_sysclk() is consistent. I mean, it takes the "freq" argument. Does 
it refer to MCLK rate or system-clock (sysclk) rate? MCLK and sysclk are 
not really the same when codec PLL is involved. So I would like to 
understand clearly about what "freq" argument means. Also when "mclk-fs" 
factor is specified, is it related to MCLK or sysclk? My understanding 
is that it should be strictly viewed as related to MCLK.


Does it help if a separate helper is used for audio-graph-card with 
current change and reverting the simple-card to its previous state?
Morimoto-san, does it affect any other users of audio-graph-card?

>
> I've also looked at other users of "simple-audio-card" and
> it looks like they will break too. For example,
> - arch/arm64/boot/dts/rockchip/rk3399.dtsi
>     If I'm not mistaken, this will try to set the first clock
>     of hdmi@ff940000 there, which is "iahb".
> - arch/arm/boot/dts/sun8i-a33.dtsi
>     There "&ccu CLK_BUS_CODEC" of codec@1c22e00 will be changed
>
> And it doesn't stop there, it also sets the first clock
> of the CPU endpoint, which I guess just works because .set_rate
> is a noop for the most clocks which are used there.

Yes this is a problem, unfortunately I missed checking some of the 
simple-card examples. I wonder we should be specifically looking for 
"mclk" clock here.
