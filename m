Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50A4053BE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 15:05:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1D416B3;
	Thu,  9 Sep 2021 15:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1D416B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631192719;
	bh=CRAAciv8V7smBh7WQPXspbFjIgz+Uzh18hnviC7BdNI=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGV65WLapCr3Kb84tjYxrqylZH+w/HjnTpocmMWQQ0Mle8B2PUmvsczj2iqHsZpFc
	 kalErgTSO8TD7nCno0Oq3N9ErH3zpK/H3in1rs29BPuSOnIqs9Se7hSCTNVCgqreTk
	 xre7KJ/kjzvzJU90N3kGY2fphMBxaR4oVwTcGPdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 789F1F80253;
	Thu,  9 Sep 2021 15:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73E45F80224; Thu,  9 Sep 2021 15:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E725F80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 15:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E725F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="LX1AQkvE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDxHbFLA5eF7ZfpsqgMgsML//P7DXOa0GgXyaCOxwBMpMhJVenCda5Sgm3wEdteZ1m5EWh2nY3/vqeeFkcDKBQC2GOLBEBy9eOYOLyBT8bVTGMCOHFH8jB6KTyhSHTN0/NHL4lRov/ww/JLrt2dfoovjMPh3voYXiazC/g9Qs9E7ZU0IoXTSzHctnxDn9cQ/Zr0ursmT8ZPkV5n1XozAccntAwCb/qMfMYaBgdVNvpneNHlvr0AehPLHCLFcEyXuDIDvXcPh3IQJ5fBxGWWU5BW3BRF3Hd58HBfeXx3FLddkFlJWGgHnoS4reyWX0XeJUO9lm8Ha/bYNwgSPPMoYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PJ3N9WrVBM1BkgZQmPpyqiu9LVzXwsNFwfHfuOcnCaA=;
 b=G/ZHGkw6FnZzMtbdJSe2P1HLfCb8xbQyIsPRCPNs5M6MvdGkQZv9t1/18GDpXZWjPXbMONkH8e+9+7vhu42zWqJZ31DeuOoAYwk5T1L9b/U0C5eK1eLPD5l8YGHAEEga1k0k4OSQhSTDIPAUVpJxUi6CNh4PaJzd9UvclC0JRrbwtxDROJNVI6e/rCYwfQCvPHtpGk0SjRTMXv2OlzbQlp6RIhjqYtr8a36v0YLf7PRujNJLFB1GP2Ub/5QFRfp7x6obHYUriV+b8m1Did1ZyYV+dhxXUn2nNZWCkKoRSODaVBYsOnA+IA1jVcC+cs5eDoNCPDVR72YnKKiixiaOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ3N9WrVBM1BkgZQmPpyqiu9LVzXwsNFwfHfuOcnCaA=;
 b=LX1AQkvElQs3b8oto3usSwOGYWF519CdcW3i/dei5eECn0GuG/YQKhjINZ/j+LrDqDtw+lGOrvNK3R6/iGNP8lohnwBvh9wP8mw1p9ghcCguHuIfOYlDSrzVHn8YxEJZyyNmdkBYJ+kJ2XOsTXLqhZWTfBZT4j9YMoqVV2k3XsN3pg4Xr2rZlS4C9b7iFT9E0t6DAkMeBHCXtxecatUQhyPM4WKUk4boNYuBh5ncnD2cqzbcKkjyrigshylTd8cxkTq3fxORt5ja8jAwu8EqTHNC//sVP1kWilhRn1Mp22l7nqObcx2mXOqcAcxluqp1XOmc4ZkxwXPs8qMMmpN6Gw==
Received: from DS7PR03CA0185.namprd03.prod.outlook.com (2603:10b6:5:3b6::10)
 by CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 13:03:48 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::fb) by DS7PR03CA0185.outlook.office365.com
 (2603:10b6:5:3b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 13:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 13:03:48 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Sep
 2021 13:03:40 +0000
Received: from [10.25.97.165] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Sep
 2021 13:03:35 +0000
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
From: Sameer Pujar <spujar@nvidia.com>
To: Mark Brown <broonie@kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
 <7b248062-9a62-524c-4c96-295685e211b1@nvidia.com>
Message-ID: <86fc49a3-4cac-78c7-2c0c-eaee8e49d387@nvidia.com>
Date: Thu, 9 Sep 2021 18:33:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7b248062-9a62-524c-4c96-295685e211b1@nvidia.com>
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53cc165c-597b-404a-5d53-08d973924373
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5427B6EE59EBCB2F2C0E485EA7D59@CO6PR12MB5427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tX4VfZflG7Dzn/Qogw4MmrkDuHdvFoeRtpb2qmMYAevd8upUiTM/AYrFyxuKGspmc/zmwLyIbpBg1DXUWvw/2r+7aGQCYPu+Yb4nckgZwVG+HLKgywb+440Em3DGB+kxakTGB/zIBk1/Eor9vbZZZ17DWGjIvrNCOQCflmllRNPDRxtYek79nnRFBDnWpWYava1HVClFXW1FThVQRFckefl70vvsAnoGjGEkscbl5vDd+1ps6zx5Z2I6y2nuFSnvGLJSmyRcJPt2W2HOb0aAUk1BbBUWDYKY+I+L6d14irdlEY6vd9WPPEvw+OmweqJAKXGB61T0PwO8jy7tIiyDO/oEJTDCid5bhFvDP2TPGNgfVySbrxP51ac02T68rhzPLGvwnYJ4nIYYhoezfc10mdupg/wRIjxP1jPTQlHYMKvPf++7TWAC+u6TN7ppbotOhXTVAQmYkrQabXMJU9umFMPdG1F29innfmxgB+zVol+7OhvmyVddbIRzhoN1rThBqc150XaznrSLqU2VDa1Njkd220Y/2rvIj+6THSZNEpCOkX+JQcAhIdok+h0dbhSGjlqXoI5wrq/g4bbeqmcPhkXCxZkAYcmtrNfaQsF6gsLotzvSRZl34KPFt2ktv3m/2Leu8ZJiTa5IbridXWenBjL4MdFPIrdS2KdCQD/hLPEChqKtR3ssB5oYN02dD9cLBv+pFeRVKNfOAQUmaaU0vZMnsA1tW6RbSseUpadj1ss=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(7416002)(86362001)(82310400003)(426003)(478600001)(83380400001)(36906005)(316002)(2616005)(47076005)(336012)(7636003)(31696002)(31686004)(36860700001)(356005)(5660300002)(26005)(82740400003)(16576012)(4326008)(8936002)(8676002)(186003)(54906003)(70586007)(2906002)(16526019)(70206006)(36756003)(6916009)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 13:03:48.2390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cc165c-597b-404a-5d53-08d973924373
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, sharadg@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org
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



On 9/7/2021 1:35 PM, Sameer Pujar wrote:
> On 9/3/2021 11:43 PM, Mark Brown wrote:
>> On Fri, Aug 27, 2021 at 03:03:52PM +0530, Sameer Pujar wrote:
>
>>> +	/* SW reset */
>>> +	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);
>> What about all the cached values in the regmap, won't they get out of
>> sync?  Especially things like volume and mute, it looks like the mute
>> just gets written directly to the regmap and not otherwise saved.
>
> 1. I think original idea was to disable MVC (forcefully) before new 
> configurations are applied and eventually it gets enabled via DAPM 
> path. DAPM path handles disable also, but sometimes MVC may get stuck 
> in enable state (due to a previous usage) when all the data in 
> pipeline is not processed. My understanding is that reset is 
> restricted to this alone. The volume/mute registers seem not to be 
> affected by reset. However I will confirm with HW about the reset 
> behavior and affected register map. Thanks for pointing this.
>

I confirmed the behavior with HW folk here. The reset above clears all 
FSM, flushes flow control of FIFO and resets the state registers. It 
also brings module back to disabled state (without flushing the data in 
the pipe). There is no impact on the register cache, as state registers 
are anyway volatile and module disable is applicable only when it was 
hung in previous usage. Otherwise DAPM would disable the module during 
session close.
