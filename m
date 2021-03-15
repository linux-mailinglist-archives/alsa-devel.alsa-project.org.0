Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5B33C3BA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:12:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B22518A4;
	Mon, 15 Mar 2021 18:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B22518A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615828376;
	bh=iGu8nV2+pJONbNsrLoKJWcCLR53IYpJPhqznMUUVndo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQMGBDIakV8KKndtJjGW/mLXMqynrF7bZt5tC3wTZrhSmeQjlYdB1THDMBEupYhzH
	 TrzGBpEh6EG5RlB6PGl5mN2Ul9frja7y1XG5UZILy605msb24dGhx1rpCeicB3q2J0
	 mQRekelI9Ixc6+NdHNCFZkm560Kz7UI5lqI1fYjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C26C1F8013F;
	Mon, 15 Mar 2021 18:11:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3578EF80171; Mon, 15 Mar 2021 18:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E5E2F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 18:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E5E2F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="A3RrCRo4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlKTtEhOY7kbKV92dfUMNqdN38iljcCABuSz32jSzTDnz50+U0MBanQsvxXz6jL4J6ClMy14UkclO+cpa80rKf1iPonPfxBc3OyY0rd8KJwEUQ0V+KGFn6EfNqq5It5y0z1zfZSPLh/zM8PxZj8O7716jK3Sjcsedx2AKFoLM+FaTqHhR6DLesXbr75iEZltfrUnFtpYDZrSlP2/c/Z/aubhNgKepoJMx+2+ZVHEdGNDXzIz3bTUgvqmQZlq3+ul8iSmw7pLslKKVhg42pP3XOR0RvPTjp9TZmE1WMQxy5LnQawhy4OBu7MAusXpB9OgxtKbIdG1H0RNogyYHmVuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGu8nV2+pJONbNsrLoKJWcCLR53IYpJPhqznMUUVndo=;
 b=gT7K2SC9GuDu3k4Y1/kipL/AiOI4y7cUkLzxGkHdg4FMMelG40ImiqIHAuyC85N4wgeqHkcYqxmnw0kDxAxrdhnTUwSOGKncMlPy7Rtf3MZfX+hc4Sd2wZlgoP2nNy+7I0/MY/3ijQCEB8AuiuxbOJGx45f4eftvD8thnSUVKP4uR9nHZlyAZS97G7MWG4yII2YxodEYDG5/Nj4kl2Ux/gMlPrjWnAE1bNwgOGodR/nqHMMAVVJYXBD6HloZcj6uM6MqvVCAK9hHlUGRi65gY58uHPKTbuA37FMXfz7M/3wfYq8sQzVI38TWjJKwpBzwcXyJSPvPsc4de1tSygbu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGu8nV2+pJONbNsrLoKJWcCLR53IYpJPhqznMUUVndo=;
 b=A3RrCRo4eqwtEfTT8Z59MfkIO+30Ll9b8pwLrIQq18wpgDRnkTJbwbk8gAsNrLDtgN8L5k+PrwqbPTkmkW9qMCyBLmtKHNu785NfAjkHPH+/a5G37fBwkwdN0vqVrRowKlPqv4x2NBJVE3Q7am9XQ1D9BPWBad3s2GG4andNOgTuOx3s4fWBFkgcVvYFmWdXIKN4mIUmiXkqB5FTjrCaNrfvL53QBPRDxZ6dj8vZQD/SqwEay8gw1vYzKbhEhYFZUTu+YBcwW3rYiYmZB/jLsBU403wJMFcukK4AwbnrolrfoRSaljVOnFMyFAjcDm+Qn4/T2pXf+Yn/OM/mbqgRgw==
Received: from MW4PR03CA0114.namprd03.prod.outlook.com (2603:10b6:303:b7::29)
 by DM6PR12MB3754.namprd12.prod.outlook.com (2603:10b6:5:1c4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 17:11:15 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::68) by MW4PR03CA0114.outlook.office365.com
 (2603:10b6:303:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 17:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 17:11:13 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:10:43 +0000
Subject: Re: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Mark Brown <broonie@kernel.org>
References: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
 <8cdf1cfa971945792b509a687a4de735@walle.cc>
 <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
 <20210315153925.GC4595@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3b3c5aea-60bc-d7bd-9ae6-5e890782b2e8@nvidia.com>
Date: Mon, 15 Mar 2021 22:40:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210315153925.GC4595@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10ef49a-00fb-4757-c617-08d8e7d55697
X-MS-TrafficTypeDiagnostic: DM6PR12MB3754:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3754D3CF701DC65AD13670BFA76C9@DM6PR12MB3754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VIynl7zJZRwHYRAcuMV+amfO9g3vnPg0O5atVYYb/3nHaUwNbglQU0ZIGjMgLm2SPEs9QMK8L+EWnp44tM6cnb3vxY0uatXkUn61EP7WoR3YWYSBaHyS0bXCfDhN54JxgEm4RWJ569LWmEwkvzlc9y3XGo3l8YDeKO5eVSOIwndnwjyLq6fKxGA5cdv2goQOmNOp7JmJBG8WiFREXzfyUxTrS1bWCbaYxphKUiKILYAxvT068xPZ88LMgbJZzMEGNN+Hj68p6xhMzRpU3iDy2n17J8TMk0D2mAH4Hg0eRbPtkaM1HsY4C3+tWvKO0si8HhCeGbVpIO77hyXKsKYiqcw+WxvJRn6JZJzbPlbwnM92/hY3bTSgOKHw96GzxAxB0+XdwzjJ4CvxunthDBzR6jo9TtnbanoWNzH4Mv3bwKdgf1tQ/RbDgbrruJ4qkgMQ0Zw2xD5HfYDFch5MKTmPBsB7u3TjqqNr/HEdduuIyvK2bsrRkxYMSHiSSc5Kof2xuvMFAzWSJMCZojgOb4zOU0dvq2XGoD8Xa23R8G0ca59b923HsOsnDWW46T/ptvxvOyrCNLjY5gtURM/LC7TZC+T+QWkNh+wFR1TQkxmopie3j0UuWzOWtoW55VwwSMcJh007BuVCO0Gv99uzsynGuCaMPo/17MmHoVJrTobcfHp7Sfyh0OvGEqaB5igbOUBPX22WOGFVhCdQzOkJmJlgTV+cGBb/3fxU/WEzd5n1JHQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(16576012)(356005)(7636003)(34020700004)(316002)(31686004)(36860700001)(82310400003)(2906002)(36906005)(5660300002)(83380400001)(8936002)(47076005)(36756003)(82740400003)(54906003)(2616005)(8676002)(6916009)(16526019)(426003)(4326008)(26005)(86362001)(70586007)(186003)(70206006)(336012)(31696002)(4744005)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:11:13.8263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d10ef49a-00fb-4757-c617-08d8e7d55697
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3754
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 Michael Walle <michael@walle.cc>, thierry.reding@gmail.com,
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

>> Yes this is a problem, unfortunately I missed checking some of the
>> simple-card examples. I wonder we should be specifically looking for "mclk"
>> clock here.
> That would definitely help mitigate the problem but I really think it's
> cleaner and safer to just push this down to set_sysclk().

Understand now. I will push patches based on this. Thanks for the details.
