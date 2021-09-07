Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E524024DE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 10:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BFCA1729;
	Tue,  7 Sep 2021 10:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BFCA1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631002050;
	bh=ntUUhs2lO9Kg5x6vApyFUqTB0EJgvo/WO/D8bt9ho74=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXfGW8o5AypjoKhKRW4fQG8LtQ2B0QDAxS93M7zloKIl+CJEvwL79P1jy4VIXILIL
	 SuFnFuNBjeE/eJ9fFE4CtbzIkWcXs7xiSH5K5aAY/2nx0l540UztJGLkqncmCkPsqD
	 4XsPnLCGwKMwJUkJLbB/8rHxAr/1CfwvUjZhR2Fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54886F800C7;
	Tue,  7 Sep 2021 10:06:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98324F80224; Tue,  7 Sep 2021 10:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35E61F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 10:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35E61F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="LYGC4AUH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6vQeZ6nWc8x0H0+NeaibY5ZPb5g83gWKWrqSCVTYZxKSOjESGTiLTVauhSuhxqwawH/tFUK5xcnJ+JmiVZpFUFpKhcdYkQ3WYPDMObe1DumSyCfzkLeLg70q70yD54gBI4Wt8bNx0BKISFlN3vJpsXB8UBExyLIX7hOb8tjuvo9dAxBJ5aDhlmGTk/y9E/46JYYXOdmzuAYAzDYqvLNGtkn8l53Da+1UWm/GRJiSLqg0pSdFBJoS7S8bBKgiOjXqMhz3C1sDhKxcc0O16638z1O1c85G7D9S4JAAhO77J+vsjI4LqTy5LCRmxisRSwjRzVYakhMAfjI1LJu1snlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EwkkCv1u8VWOlfHNGI8ML43dNARIBdV/NR3vuQhlM3k=;
 b=GYZclPpDoI/zVyqui1xKneIMJ5nSESlBJAC0HlcI4JMXOGD6tHx7n4LjEMxPGN4koaRGxzotXujHkorgHtxLGBMn/7pT9ql6cLmIaK93NkgUgMdni/9lNEt/rB7RnSt5puEZvp0vikuO5DT4e/CLqWK5h0NXtWLaK8o0pexOOeUSxd/QOLYUzSkAQF+5PyHrZsby/9/Dz+qHVXmydNrekdPZZYVMVJ+iDm4wgNow1SSSsyioFGZUun7hVGF00LLNQP+o5jigp76M7/pHIaQ+8HiIivCgY9id71JVj1eNR9G0pOaANa2gUkjVKyhMfTqwtUcK0q1IoEPFFIfqb1uotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwkkCv1u8VWOlfHNGI8ML43dNARIBdV/NR3vuQhlM3k=;
 b=LYGC4AUHiyyZusW5C/XEqzEqUhDQR1sZFopuETDWSEDKk3KQdESPWBAlAg8ZEAai5jidz7wr41DMKqPqkreLaAKAWlBv0tKc2+6q/6PPw5CgNaRXcseUDYu2LuGGQq0MGc2Gks510gP+ECH+E5jHnv8VAZTN0pX0CrSNpFrl/fZXOaAYG91P/974Bh5/KofLaEKmpuxV17/Ne/Z/W0f5UCiqOhquRLhtrqVggbxTJNA4SS4RhY8SezpgFO6jWgT0mESG5M5/Ry51JVpm20T1YRwxlNeck6Nu3+ljLT4Xv+SSykdijAjp16CdvwKjKGK/tNLOwVkjltGQzYYVu7q7qQ==
Received: from DM5PR16CA0045.namprd16.prod.outlook.com (2603:10b6:4:15::31) by
 BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 08:06:02 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::d1) by DM5PR16CA0045.outlook.office365.com
 (2603:10b6:4:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 08:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 08:06:02 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 01:06:01 -0700
Received: from [10.25.97.165] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 08:05:56 +0000
From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
To: Mark Brown <broonie@kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
Message-ID: <7b248062-9a62-524c-4c96-295685e211b1@nvidia.com>
Date: Tue, 7 Sep 2021 13:35:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903181326.GP4932@sirena.org.uk>
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a105a18-5919-4469-4582-08d971d6559e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53334089EDE8B155612B52E8A7D39@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iHmNu82bI+1xlnHQzpFjmh16EQImVrm8IAWHkwS3AoofscdMUwrluV9rBrrzkm0dNBDZqNvEwjwsJQpHfwPpvk5KVPdpOXP4tALTTenonybc5sKQlpX5TVHrI268bU+i3y68EWGyAn+3T4fQEvAVVwwlSiP6Q1JvKul5rKbIKP90eEhU2W4TIX6RXG3Ui666LPDpLEt/Bqtk7ch9LzIZsem8Db85LKL2e/M+RsIqsXOOt7sFLm2mznk/BH1J0jJqKjgAUKUNx8yGf04KUouIxdMRiLhqCfXvEyNp41TZS6oaCX9luJAG00JJzDQzxS5VsI46hQw60aqUZMQTwtcrwIL6o7dvNg6u36CiaApXwrNeM+mWFe8mKxt1uruxUzI1uTmDqkXPTueicw7+q2HMVcHzM+ufRW0d3m8LRYjvbWSONv5DuqTdZBaljXDy3OBd8PldC7QaTuEWz+PNJGPNafW/wmRjqnwaztjwcbjDgALtGZR1Fr+PMjyWYWD2FMTcp4hYQmZ8cWdeMIPZabNLIhYcCztJehvAYDsr4EsK4HmSU3OFJ3payij5urSF0MWL/yaPgSQo+B1HR7/7cpTynXWjchxJF/LMGRywXPtJ7Lpv41j6EP+bvAXFq676JYmri60o0EQWLwV4wNTDM4SkOhuD4dpbINp8xPRk5+reHpsc5il5MkPlu++M/8Z44+6+4DaA+YHG3ON9stSPy6Spklfh6aM1go5n46sq0fPQUs=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(8676002)(31696002)(82310400003)(36860700001)(86362001)(6916009)(16526019)(31686004)(186003)(2906002)(7416002)(336012)(8936002)(426003)(36756003)(478600001)(26005)(5660300002)(356005)(83380400001)(53546011)(82740400003)(16576012)(70586007)(70206006)(316002)(54906003)(7636003)(6666004)(4326008)(2616005)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:06:02.1162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a105a18-5919-4469-4582-08d971d6559e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
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

Hi Mark,

Thank you for review.

On 9/3/2021 11:43 PM, Mark Brown wrote:
> On Fri, Aug 27, 2021 at 03:03:52PM +0530, Sameer Pujar wrote:
>> The Master Volume Control (MVC) provides gain or attenuation to a digital
>> signal path. It can be used in input or output signal path for per-stream
>> volume control or it can be used as master volume control. The MVC block
>> has one input and one output. The input digital stream can be mono or
>> multi-channel (up to 7.1 channels) stream. An independent mute control is
>> also included in the MVC block.
> Looks like it's also got a little bit of other DSP in there (a simple
> EQ?).  Not that it really matters.

MVC does not have EQ block. In fact it is part of another processing 
module, the driver for which is not part of this series.

>> +	if (reg == TEGRA210_MVC_CTRL) {
>> +		u32 val;
>> +		u8 mute_mask;
>> +	} else {
>> +		u8 chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
>> +		s32 val = mvc->volume[chan];
> It's not clear to me why we're using the same callbacks for the volume
> and mute settings - there's no shared code on the read path and only a
> tiny bit on the write path.

The volume switch trigger is common in put(). The get() is probably 
influenced from the put() and common function is maintained. If it makes 
more clear I will separate these out.

>> +	err |= regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
>> +			TEGRA210_MVC_VOLUME_SWITCH_MASK,
>> +			TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
>> +
>> +end:
>> +	pm_runtime_put(cmpnt->dev);
>> +	return err;
>> +}
> _put() should return 0 if there's no change or 1 for a change.

done

>> +	/* SW reset */
>> +	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);
> What about all the cached values in the regmap, won't they get out of
> sync?  Especially things like volume and mute, it looks like the mute
> just gets written directly to the regmap and not otherwise saved.

1. I think original idea was to disable MVC (forcefully) before new 
configurations are applied and eventually it gets enabled via DAPM path. 
DAPM path handles disable also, but sometimes MVC may get stuck in 
enable state (due to a previous usage) when all the data in pipeline is 
not processed. My understanding is that reset is restricted to this 
alone. The volume/mute registers seem not to be affected by reset. 
However I will confirm with HW about the reset behavior and affected 
register map. Thanks for pointing this.

2. The mute is part of volatile register and volume is not. If the 
system is muted and any volume settings are made, the system is unmuted 
automatically. For this reason mute is always read from HW. For volume 
it is saved for local computation.
