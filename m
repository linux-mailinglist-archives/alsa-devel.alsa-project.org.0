Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C940839D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 06:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DEE01657;
	Mon, 13 Sep 2021 06:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DEE01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631508997;
	bh=aeTGy1TKC1Zbul4S6pQLmavVTCs2i6MpCh774Bt6ko4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ft+zHfD/9+pJpWjq6f9BqlnStBvVz59fM+OXJVte9vRg1hYre6FfbEN63GLAQECJF
	 IDHqYH0VnYhiOklomnMJVQfE0xL7QL4T+e1N2uFsS4b26CLCkBLM4aeivJHH36Dc/b
	 4UiJGSDUdB/tiu5YOfdPVYjRgNGITTkAtaf/Iafc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E79EDF802E8;
	Mon, 13 Sep 2021 06:55:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA128F8027C; Mon, 13 Sep 2021 06:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FF08F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 06:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF08F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="IGv31YJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy2VPLB6FMTdx8dc7aVJqVHLul7hULGYP5xxeXpR7tSlotU3Xdk52OsEnrqy/gGhYuASKa2BjCmY2ksNkWT/CzCDcSpPrQmckC8AGRlNSdOfI6Q+E2V9pyr9Utqi6urz1CPLUXEk2OP/Bb9Pa7yOjiI6qnDd43Jq+FJmdgUgSIidVotsjkYbYd03LfeA0GUaRYVrGkg/Ec7Mh0fT4E10Cz0ap7FK4hC0Vz2tc+CLHde0GW37RlrQE1/GWE/32Bh9qW/ctx58TlKKEn/uPP890Q+KobbCF2n5TfatM3kWtI+JZMIg+y9yYfjuqEBNhpZTbF73KhZYD9sQUmj/1W4VdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1uG5LNc46PsuuH8L7k6CddmpnR1smdHQAVVGZjCc9ig=;
 b=Nch8BFO/OuOjnOIaabpehU+PDO7kLFuYoXCQS0Fq/oI1fpN63o35amJkMD6iKvB9PVOHf2n2ZXJE5WlTVpudPV3Fnr9ix1j76FnZ5lly04KQ5Wre3wTL6Zn574aKqzvkkNB1ktJuQ7NK2mOcHfTuyJfx3oncnAnAp0OzWH+EXGuR1/J8y1pW4uX/+CMQ95GdZIJw52mdIz5j/jEUyz74TuySgERhbmNI9o6ROH062UU2Oi95meNtkaXEM4te7DlbM5qWoa5B5AFAFeIYMzGXHi24BMSNvkl2oZhJDG4jfLuR4I6p0XAmJpHzgFNKWMjg8BPM4Lqvky1A0Kg9kB6tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uG5LNc46PsuuH8L7k6CddmpnR1smdHQAVVGZjCc9ig=;
 b=IGv31YJxqlDLC96BbY/GhlM98Y7rFzjRoiGbdzG1Zy9sjvjNCK6OdY02MSY68cXJv0XNcj20ChIVRiT59B7KaTcsxtMTQvrnvvGAMSVLp9/zfVQoUWUU9DikMDVLhrwGnMRkIx9vkJsSirwrvNMNVM9CN8Z6VgJmK5K8dJGrtonv+NdRx92X6vcnzTwi6/ydaEsYYkBU6FMxk9SseJ9NQpk4op45MZxRo+BppGWod6h+BZm9cPWL+OT+1+4ze9cniUdEygEL4mZdl0jFBzL7dihorVJOuwynn0/TZuuZoRcvSVrP3Akvtdx2Pr0l60mBVqByVFA+h5i1SZveDbWMyQ==
Received: from DM5PR06CA0072.namprd06.prod.outlook.com (2603:10b6:3:37::34) by
 BN6PR12MB1313.namprd12.prod.outlook.com (2603:10b6:404:18::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15; Mon, 13 Sep 2021 04:55:10 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::31) by DM5PR06CA0072.outlook.office365.com
 (2603:10b6:3:37::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 04:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 04:55:09 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 21:55:03 -0700
Received: from [10.25.97.151] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 04:54:58 +0000
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
To: Mark Brown <broonie@kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
 <7b248062-9a62-524c-4c96-295685e211b1@nvidia.com>
 <86fc49a3-4cac-78c7-2c0c-eaee8e49d387@nvidia.com>
 <20210909142033.GD5176@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <06da8bb8-a065-0bd8-1386-dab55f50fb5a@nvidia.com>
Date: Mon, 13 Sep 2021 10:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210909142033.GD5176@sirena.org.uk>
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de3294a1-5270-418d-f6c7-08d97672a9e7
X-MS-TrafficTypeDiagnostic: BN6PR12MB1313:
X-Microsoft-Antispam-PRVS: <BN6PR12MB131300C6FBBBA735D9A1C171A7D99@BN6PR12MB1313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWkSTQXk16T9isH7URsrIDHIvWdFlMi6ODDiL1JJLw6QXrTR5TYClZGWyq2wbXqehmFdoyvbFUAdQFxoAknkJhRLm3UFZSYNDhsok1+/fyRdBOUQM5iZo7lF4Y2D+hZwjYmUOdl4KnFMmuSgeL8yn9T5yRgmjkl4sqoo1ZLCAjYeG4gpip1jVtvxfT65QqZZiGnjX5gvKW+cax7jYORlgwmmqrkprNsdXEVBlJRNMBSifvz1jrrzZgM6P2HSpZbC9UGMkW1Dvqc72YYu6lSDdBLWLUOSnw7cNdEw1SCBQ+gfm9Ro/wOwq8IAoph3Uk5Miqi13JuoMNRLIcu9vlPtNIZl0LuliYmBr3LbDQkCJI4IB/zOOC2w920eLyBQHdUevBNfGmJSzFkNmmLdJEhr12UxvT/GuhrDDnq9VU/psFHR56CB6wg2OhspLvYy7+WvAkZJtHJ5FJ+iy55pNdc5q1kweOm9OgeNx8yaVzPDojZoP3V3fQnpP8fuNe2AAlJv9qbE6RN/7+CQCmev7PRKgApPLe5o8ZsC83xjkhrkH86OQFSejxgSofUpQRR6MdZbIAgiHfOhN4cwzrzuT1A21Bce2u+IsHq+NYTu1cj4KA55+ts76Jjg1I178rVofW7uPNmb7GNOc3o9IxyiC+SeS5BojA3wtGlMeRoA+4De7Duxp6KxMgVzQA9fbOvcCXX1OXVB/pYUz6erDeGATw9tmQR/OuHyeB9eHZhV9iEbEo8=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(36840700001)(46966006)(16526019)(478600001)(47076005)(31686004)(36860700001)(70586007)(2906002)(36756003)(336012)(186003)(16576012)(6916009)(356005)(82740400003)(426003)(8676002)(31696002)(8936002)(53546011)(83380400001)(7636003)(26005)(70206006)(82310400003)(54906003)(316002)(2616005)(7416002)(6666004)(4326008)(86362001)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 04:55:09.7397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de3294a1-5270-418d-f6c7-08d97672a9e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1313
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



On 9/9/2021 7:50 PM, Mark Brown wrote:
> On Thu, Sep 09, 2021 at 06:33:33PM +0530, Sameer Pujar wrote:
>> On 9/7/2021 1:35 PM, Sameer Pujar wrote:
>>> On 9/3/2021 11:43 PM, Mark Brown wrote:
>>>> On Fri, Aug 27, 2021 at 03:03:52PM +0530, Sameer Pujar wrote:
>>>>> +	/* SW reset */
>>>>> +	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);
>>>> What about all the cached values in the regmap, won't they get out of
>>>> sync?  Especially things like volume and mute, it looks like the mute
>>>> just gets written directly to the regmap and not otherwise saved.
>>> 1. I think original idea was to disable MVC (forcefully) before new
>>> configurations are applied and eventually it gets enabled via DAPM path.
>>> DAPM path handles disable also, but sometimes MVC may get stuck in
>>> enable state (due to a previous usage) when all the data in pipeline is
>>> not processed. My understanding is that reset is restricted to this
>>> alone. The volume/mute registers seem not to be affected by reset.
>>> However I will confirm with HW about the reset behavior and affected
>>> register map. Thanks for pointing this.
>> I confirmed the behavior with HW folk here. The reset above clears all FSM,
>> flushes flow control of FIFO and resets the state registers. It also brings
>> module back to disabled state (without flushing the data in the pipe). There
>> is no impact on the register cache, as state registers are anyway volatile
>> and module disable is applicable only when it was hung in previous usage.
>> Otherwise DAPM would disable the module during session close.
> This needs to be*much*  clearer in the code, it looks like a bug at the
> minute.  It's very surprising that some of the registers wouldn't be
> affected by a reset.

I will put additional comments to make it more clear and tag it as a 
'soft reset' instead of 'reset' as HW spec defines it.
