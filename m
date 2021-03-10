Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4443340C5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 15:52:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7631767;
	Wed, 10 Mar 2021 15:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7631767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615387958;
	bh=5qBFGZqmmW+xZz6f8UfaPsi7Bqzhypbu/VQF6QUy7eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PwWjhTbBqXyjRTZvw5hZxx0VsAfpVibDoRoeO5MShOnSB0pWYcC9j7xMObVeHBPD/
	 wz25l7tsyRoGVyA80O04ZMfwni0Bw+5FCLTCWM3dWI6bBMW7ZYJhPpbji9LYGvt9LE
	 R+wgRbabprO/r88HL2TTA1fppLR79R3IBPpAXEBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82408F801ED;
	Wed, 10 Mar 2021 15:51:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD0BF801D8; Wed, 10 Mar 2021 15:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EC41F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 15:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC41F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="BBAwa28d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Et07DDwtd9XPyKhUqmD83W692MC1utvR/AlQnmdiv8Gdt2Ypglmh6QxACPZS88kXs7WhktcpCoOujfXjahSGYHkwvVX3yNY5YzG/64wHLKxaaTaDtRwnj6enO4/XeUvzTtZLg1gQNHtZaCLt/jfWnXl6Vji5HNl136r4KXLDM+qSJDbXDLn5bTQ4+hBeZ5yW6mknBiW+4mDsqHrmWkN7Picsjc0Xnc2/sHXE/nlHQB8M4sw4jMRLT4n83ltYHQwuMPC+fEGE7qAA71U+b3htJXdEnB7q0k4tQmFFAJExB7MxUIvQpo/6k48czQQXhkCJTORk5F3uUMjEd9CIyeTk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXiwr7l4iFiRma4AefIehobNe8qxW+GZjKiCROxJ5dM=;
 b=hm9M7sha3O0N6H++2LIgZ+PxeST1dAl1ymO2CXu2ny0hJ1NWvPIRejT6sVrOtkgyJg9uiC/JqUo60yZ3n/y+4l6SsLjn8mDfuzFiQopRY1PNmPMBaTdZhH4FVOwM/gjBoiX50+Q9oL5KAgmZ2PgZKkei8xmJbWV0oChQCcdXOcUmyZtY+4m3/zF80xF18Oy6Tbsa5El6g7X4XnvB0zoE6eM49UqBF19RxLdccNhuOWoMlMqcswqc/FyOIfFjrmE3hNNNLKABUaG+QN7OGQeL6sMeW7E3L+5oHfg9399rfUDUcOCsQU4Q9JSco8ygN4mBembLXfrBfTTSfrcG03Rsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXiwr7l4iFiRma4AefIehobNe8qxW+GZjKiCROxJ5dM=;
 b=BBAwa28dRzKKkDnBEFRuWOCo7Ch1hXUkX/t/OCyutxBJM7rPO5b0M9QpYdrGnSNhvOQnvCrZIaDWpawx99S9g8CBwos6A5cK/WQ5GtcTB56KuTtbjiPDaMFwRjwFPwr9nFvgzz3WJYadK+eL1SZ7IYkXBQo93R6QFWV+w0Q+GxWbOQHXwgHmjgmVvB58wzhznVVQKjK6oQR6PGiTCN5iMfMW7iyT23/XjD0YD+HJGbG6JFPxrHgx0c+49VBROuV+0Qg52KLYyTbtEKr8a90BXuCAB1ToHIiVeCqHlo5cYueJO1h3m/1hk5Tzyt+LaqgnvxekF4HKCVTDNwk72aXwcg==
Received: from MWHPR13CA0039.namprd13.prod.outlook.com (2603:10b6:300:95::25)
 by SN6PR12MB2768.namprd12.prod.outlook.com (2603:10b6:805:72::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Wed, 10 Mar
 2021 14:50:35 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:95:cafe::4f) by MWHPR13CA0039.outlook.office365.com
 (2603:10b6:300:95::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Wed, 10 Mar 2021 14:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 10 Mar 2021 14:50:35 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar
 2021 14:50:31 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Michael Walle <michael@walle.cc>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
Date: Wed, 10 Mar 2021 20:20:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5372d8f-6484-4c31-e810-08d8e3d3dcb0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2768E151A3A7A4A25683A759A7919@SN6PR12MB2768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NlectuRSbAp9Ow14l4/izqo+qI7lSV2wCnOGcdfZvMwwRlC3gL7sQT/hY70ozxHJp10bPhru5z6OzbQbUrMNUqs7Hh56buHWzo9bcU5cgFfArOkbJyIbJGINtlF4MfSOzRKzUwwDMWgz7dNxiuuQ0GqjTc+fltYqxhlQLzMurau05KDqdmtL52Ndqi1muJcT9U7jyErU6jMO1TpNghMLofHmAytSpuT2L7e+wxpWAXOq6a3ebmismgTWc1G6/R+tpLULLWw5ERagQnNJTkgmozWPpCjMEkTsoE7ZzQ+tlVfe7GSpenDwTu1iWcwIfRMdZMMcrQ3wgiTD9XWZSVxf2gTc6YhnbALe1WbitdW2+kb8zEanlP681iXfpAyBuIGea0J3yYdtdcW7JyZtzm4sfGKV4dd/Cnp/yX8UPU1/wvzh4YFzwn3fzkaSA41vda0vO0w2VeYoNcudp04HMPO9Nw42Q7UM2wqXRFgNlHfyj+cCd0TS6JkdFwoVJLnghDRiU1lX17En6tIUkhNlHBUTKo0zzw7BVd4nv65pT8OD9b13K6FJJckFQZRkH5xbynrfaKmske0lB7Ax+E5CydtjYzfhnel42r/kX45pmcn6AU+wVtXZD8bAJUsUhHyt340rzjMBzhxNSo+CV0rQpip2Gf/1sU18e0kQ9YOncG7GzxR959n47q0SqZ0+lto5MDJkHvphJTvjRxJU40wFRgpJotNkA4qHZowBo9cWWM8Y6QmA1/y8y/sEJOL9fj1M5Av1
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(36860700001)(4326008)(70586007)(70206006)(53546011)(2616005)(2906002)(86362001)(478600001)(5660300002)(6916009)(6666004)(316002)(8676002)(26005)(186003)(8936002)(16526019)(36756003)(82310400003)(34020700004)(16576012)(356005)(31696002)(36906005)(7636003)(47076005)(82740400003)(83380400001)(426003)(54906003)(336012)(31686004)(21314003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 14:50:35.1951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5372d8f-6484-4c31-e810-08d8e3d3dcb0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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



On 3/10/2021 4:00 AM, Michael Walle wrote:
> Am 2021-03-09 17:27, schrieb Sameer Pujar:
>> On 3/9/2021 8:11 PM, Michael Walle wrote:
>>>> If "clocks = <&xxx>" is specified from the CPU or Codec component
>>>> device node, the clock is not getting enabled. Thus audio playback
>>>> or capture fails.
>>>>
>>>> Fix this by populating "simple_dai->clk" field when clocks property
>>>> is specified from device node as well. Also tidy up by re-organising
>>>> conditional statements of parsing logic.
>>>>
>>>> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add
>>>> asoc_simple_card_parse_clk()")
>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>
>>> This actually breaks sound on my board
>>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
>>> The codec on this board (wm8904) has a fixed clock input (only
>>> distinct
>>> frequencies are supported) and uses the FLL of the codec to generate
>>> the
>>> desired sample rate.
>>>
>>> It seems that after this patch the clock rate of the codecs clock
>>> (rather
>>> than the FLL) is tried to be changed. Which fails, because it doesn't
>>> support arbitrary frequencies.
>>
>> Yes, after the given change the clock will be updated if "*mclk-fs"
>> property is specified.
>>
>> DT you mentioned has property "simple-audio-card,mclk-fs = <256>",
>> which means you need a clock that is a function of sample rate. But as
>> per above you want a fixed clock for MCLK. I think if you drop this
>> property, the clock updates won't happen. Earlier for your case, this
>> property was not used at all because the clock handle was not
>> populated.
>
> You mean to drop the mclk-fs property? I can't do that because I
> actually need a frequency of 256 * sample rate. But that doesn't
> necessarily need to be the MCLK, because the codec itself has a
> FLL/PLL which can be used to generate any frequency for a given
> MCLK. So that is a valid scenario. See also commit 13409d27cb39
> ("ASoC: wm8904: configure sysclk/FLL automatically").
>

If I read this correctly below is the configuration you need,
SoC -> MCLK(fixed rate) -> PLL(wm8904) -> PLL output (256 * fs) -> sysclk

 From the doc simple-card.txt, "simple-audio-card,mclk-fs" is a scaling 
factor for MCLK and hence I am not sure if it is correct to have 
"*mclk-fs" property when MCLK is fixed. In simple cases, codec sysclk 
direclty depends on MCLK and set_sysclk() callback helps. Your case 
requires PLL configuration and set_pll() may be a better alternative. 
However simple-card does not offer this yet. But even if this is added, 
there should be a way to suggest PLL output requirement as a function of 
sample rate.


