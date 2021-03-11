Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57E3375BE
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:31:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED5C1891;
	Thu, 11 Mar 2021 15:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED5C1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615473082;
	bh=N254gFXH05jJVQ98oqr6gErlZmn+UCqCDUhLaSC0LHE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8XRIUI59/4RLvi0ekoR70usEi48z1MDYalzD6RKetLM6vZ02QocGGK1kOGAE+SSU
	 +PlgJu9VrrrJ+RxtD92z7+g4k/byEoTDaUpa2qcTICdBEO3Fxv5vyJgBr6bpcghqIX
	 9WcBLkbAxbXj8YvLcKVgfRPkEiPEAE1UmBMqEKL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB1CF80275;
	Thu, 11 Mar 2021 15:30:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DEF1F80275; Thu, 11 Mar 2021 15:30:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2054.outbound.protection.outlook.com [40.107.102.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F638F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F638F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="d6jSJ7Gj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADmAWSJhVuPMqwallmZBWUm6doWDX62Q8CWnnoyRXfz1WSGwoto7YQaHCLSkeG8VScZQtJeCU+IkynrpC8mxv40arUd1MPSkdOP/n+5g8nFQoHYPcFloRbY9gS/8mtEWcmzjpQjJTWwyY2gGtZdOy8Xp4jyGymdPXjG6uuPvzVqdVGeiZYdnwSJcx/iGPXxMD+ZJuo2RcOouL+Dq3vGzMlsuG0G3MY7nHYDTcb8PZozuJadubb11/WgzJIqk2Wme1oOXMRgzMkRmhVc8J87pYdaDiZsEZHZwvW00XUNyESHBoU4tWThFj8WD9OCqEktfkTvJ7/YCQG/7gc0JSlD2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRGOKDT+07Q+fR+VGqpEQfHVgYbicxDHj6uaVDi5pnM=;
 b=CUQpZDPMAw6Sqo2/OD4PQoFoa9vI8XAMUrXkbKGxy70NDvDct0YwxmWBfTu7Ka8oTGrVgPcEpVJ5R42CxqUYXITR2M+UZcPbqJw1IYp4j+7aSVl1qnfrVBkHv/W7llpw0/WyOdDBY+UGG7PTHKS7N2bAMnPBL0mOcfRC0HNfHbeYSCkJ5MYmB9ogKvG/xynrBQ5FKBJs9Ds247th0nnljioJhJSY9KCdSKzuYR+Op72/FTyD5FkMDHo1gtxZ3HR3tpBir/cOh9sjd6SackRAKwi/WnovG4hLOEH2H/NR3n5PL0EHCBCpgvCSd6gqJ9A6Om7AEQTjuGKhZ5r+rwXzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRGOKDT+07Q+fR+VGqpEQfHVgYbicxDHj6uaVDi5pnM=;
 b=d6jSJ7GjqTn2QFJMYhhNrY7lCp2C/uD/DDqynWYCfhROlNs2Da0/9cGC4e/Q5oobk5lEQGRE8F+MGMDSrNvZomGw5DCZGhjL7Ggl0Kr3XmjQRirAYryUIQarVcW/Ajm7l14IUW4ovsC+bTXOQlHN9Gx+44q8vQRjvMTnoQChUfmrMmd3VJdtrR9R8m8iyyb7cVNRkPEHxK8c235OSznZJ7gNCf3eGcHw3oNdlRkIkHF0bIKmp8Qdnhbb4BPMluD3xQGrlGVbNRcbUP/mbgWgqbvL9fDS43qF7s0SK9CeCKVoXxvAb3rXSOhjtyCinY8xCCldMT5hLH1QumE+/jZadA==
Received: from MW4PR03CA0342.namprd03.prod.outlook.com (2603:10b6:303:dc::17)
 by BYAPR12MB3045.namprd12.prod.outlook.com (2603:10b6:a03:ac::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Thu, 11 Mar
 2021 14:30:06 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::52) by MW4PR03CA0342.outlook.office365.com
 (2603:10b6:303:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 14:30:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Thu, 11 Mar 2021 14:30:06 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Mar
 2021 14:30:02 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Michael Walle <michael@walle.cc>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
 <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
 <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <36c37df5-dffb-9168-d92f-4b3e482602fa@nvidia.com>
Date: Thu, 11 Mar 2021 19:59:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df94c9ed-03ae-4ea2-e490-08d8e49a2ab1
X-MS-TrafficTypeDiagnostic: BYAPR12MB3045:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3045F02587DC979CF5DE62A5A7909@BYAPR12MB3045.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbwdNGeuNBraUQgM07PCAQ2wc2eqyXKn59iRnLIx/J1wBavNZtvDEovVNt9KPB4Jrzm6xP1cTce1JVXmUvdPjAGz23vJRL6QFjQwZ9pEqb5a7NB1pIc3T5dj8UtIPw9w3MSI3h9SsA3lYusVJchkwW0dauQbYiOo19hCQwTHKPUiipssIrGoI/bim5tqyji5Aw9c3VYbWf2M158sax/1mpdGEWCF59lhBCKGXpxYyA7zGjsb+lJwcpdZrdLQNeFsnIKcmrAc1MQ9huLLYIjZ3EUz4axQyjJ0NoS+O2Olq98MvkSKEak53hvZ7JIDvE5BO9oBu8+yC7ABZuo1WEF0yDlj1fgkfgxsCbEnzF6MBWXJaCGjSw5UJy58tNMQGaYcZxTzgtA3nK8q/1Tu6PV6bOJRZ5CGm7Oebkitk85tPYk2DTARCNrjMufl7bpEUcnR5fdZov1jYXukhlXC8lygxDZs2Xw+/4eSml8eQpmQmldqpgkQN3fyZjnA1sw1DwSQJndSolWW2stgE1yV0LdR6KpZBDTp1qnvro7Jaw2ty0mEohdnrzHhXEh2BLJNGa+aYp/MI+gNs0ljfBSXibNkLgAuCG1mZoPFKO54bflxTmX3b12vDCozk5DUDCtq+9lLYUOp5JMvOWTiCtGbXBzFiyGobSOp3RYaWriNoPqT3OdjMswodHo5NIyIDK389S6gj4HRlFGolqSYd1boyGRmB7oigRiGohHr7pMVowK/8KnHsvWPZ0P9j7Kdb0zJQR+5gpyQnusjDZbWiMKkkbASx4B7iFKBZ0OXab6Rq/iSDH8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(36840700001)(70586007)(70206006)(6916009)(83380400001)(53546011)(966005)(36906005)(36756003)(2906002)(16526019)(6666004)(31686004)(5660300002)(186003)(16576012)(478600001)(47076005)(426003)(336012)(82310400003)(8676002)(2616005)(54906003)(31696002)(7636003)(8936002)(26005)(34070700002)(4326008)(36860700001)(356005)(82740400003)(316002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 14:30:06.4123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df94c9ed-03ae-4ea2-e490-08d8e49a2ab1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3045
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



On 3/11/2021 4:46 PM, Michael Walle wrote:
> Am 2021-03-11 12:05, schrieb Sameer Pujar:
>
>> It would work and initially I had similar patch, see [0] and related
>> series. Suggestion is to always use "clocks" property with devices
>> only.
>
> I see. But again, I don't think it is correct to change the clock of
> the codec by default. What happens if this is for example a
> compatible = "fixed-clock"?

The codec rate won't be changed unless a corresponding "*mclk-fs" is 
provided.

>
> As you pointed out in the referred thread [0]. simple-audio-card has
> that clock and judging from the code it is exactly for this reason:
> to either change/enable it or not.
>


> With this patch you'll switch that to "always change it". Therefore,
> shouldn't there be a dt flag to indicate wheter simple-audio-card/graph
> should be in charge of the codecs clock input?

As mentioned above, it does not change always. Requires "*mclk-fs" to do so.

May be below could be a possible alternative?
- Re-order if-else of clock parsing.

    if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
        // Since you are fixing rate already via "assigned-clocks" this 
may be a duplication. OR
        // "assigned-clocks" can be parsed to understand if a fixed rate 
is expected.

        simple_dai->sysclk = val;
    } else {
        // fetch MCLK clock from device and setup sysclk
        // a. If "*mclk-fs" is given and "clocks" is found, the rate 
would be updated.
        // b. If "*mclk-fs" is not mentioned and "clocks" is found, then 
simple-card utils won't touch rate. It will just do clock enable/disable.
    }

>
> And its fetching just the first clock, doesn't it? What happens if a
> codec has two clock inputs?

Yes, it would have been more descriptive if it were specifically looking 
for clock "mclk". I think the original assumption was codec takes one 
input clock (MCLK) and uses it for sysclk.

>
> -michael
>
> [0]
> https://patchwork.kernel.org/project/alsa-devel/patch/1611944866-29373-4-git-send-email-spujar@nvidia.com/ 
>

