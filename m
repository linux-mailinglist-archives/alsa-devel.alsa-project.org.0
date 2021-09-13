Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EF4083AC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 07:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11871657;
	Mon, 13 Sep 2021 07:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11871657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631509447;
	bh=mLVewL6eYwXHe4bpKQhG1j2IfGfJbGC9oInx+uEWL5U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NpdhhW7K6tfFrQa054SGPXeWmCiizMVK6KeBpxAqeMQdciCmeEYu416ZCr8sU7xzU
	 GtE8CfGy1VjdCLpSS18caZp07/0WtoVknQtkoEJPOCa66PldgZW39xMkp8uj6zA7WJ
	 I9iE/aPeehegdsMmVUoMHuxofogKI0CiGW35Jhtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE99F80227;
	Mon, 13 Sep 2021 07:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F42F8027C; Mon, 13 Sep 2021 07:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE66F80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 07:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE66F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Q40473Gk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhYUfZeWaZZ9OIzRlfQS3uiv0VzXEm3W+wY17hkj0Hz8Uhq7VicrN2xdyYZyKoNEzF2nJlIOCI+rj8xWno9ZI4lq/fwijdwyrci4n2MHWRFVBB4VkgWc2TuBijTsKhuGCvJ8PASwC6QV5KxIsd9eAHs87qySpDSKfOp+decmsttJbps6n+BX4V68WLbrEGCYUjRCR/LHz2RGcib40MUtuNgrX2Oo2sxrMlmwIqSTS6H5ZoCog5++npOyKDHhKGTfkDgA2PoUqWxhaThd8pF1dGDYxsNYU2d5O6/9H38RKEP4TRfHO6dP4GKeJ5FqNAqzUpcJ6tQk5hDU0KDobNbixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8bsnHulDG67+Xhr69TMM37KB9/sK5C/UilWvd2Iq8Og=;
 b=i3EQURYx8NwTIn/sd2MvyIabUX/y4ZT4fMEzKxIAmjwQBYrZM2y8VaMS1sv4LBAwweIy5xn7IiqFaSHgyh+w53ROA7GwaEH/+w2zwd//P3/wF4/UndDUY+YApdngri9Ysf5ZkjxNFmNnEGQjWs+JBSahX/uressoiKxm9XY/rFkkdNwfBNW6RvWwoncSJcgYaAtdwjPrN+Z0Vy3z20VFPdNiOecdIsOiYPyI9HxmXJaYePxMBePnOmQEcU+JGKl/2i0H4zR18MAwP0MEwjjZDYVY4lsz1tJ64iKTDX/c1fI1ASK8EhSvmIMrFELvpOpj2lPAlHQrkRcOwuXXaQsa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bsnHulDG67+Xhr69TMM37KB9/sK5C/UilWvd2Iq8Og=;
 b=Q40473GkzwotlIWnEejeKGuIu/uNdCOF8+DO8asbV01Ebm4kOevTXvSFBeY9wFz4x2If/LChPkjZEbluLvlGw/rJKQjbSZMWec5ph3sroIAwcKSWpiw6dzOM+zdZYoxXjIMDDO6oVHtMTVWRaI7xBCh1LKEHGH0uzpJnZfjS6anIFGZ/zCPAG1Qocm5TtVF5YCcBlke8Z9tABeEtevkB7XJ2JBaJ0xafCElCJeoqEG8gwQJ8G/WCJS0I88Xosjg+E+TFplyFzow1lvKNY/SqQlysajiqCwa8XPA7IfBmNSz86y82usCBNMq/JbC/VRjkR0yIqQBuy+VmsCuj3CNyfg==
Received: from CO2PR04CA0053.namprd04.prod.outlook.com (2603:10b6:102:1::21)
 by BY5PR12MB3697.namprd12.prod.outlook.com (2603:10b6:a03:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 05:02:40 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::90) by CO2PR04CA0053.outlook.office365.com
 (2603:10b6:102:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 05:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 05:02:40 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 05:02:39 +0000
Received: from [10.25.97.151] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 05:02:35 +0000
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
To: Mark Brown <broonie@kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <29c785d0-cc70-7cce-c205-77059c11e0e1@nvidia.com>
Date: Mon, 13 Sep 2021 10:32:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903181326.GP4932@sirena.org.uk>
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d3b323-8cce-4884-cd00-08d97673b66d
X-MS-TrafficTypeDiagnostic: BY5PR12MB3697:
X-Microsoft-Antispam-PRVS: <BY5PR12MB36970D7F285CD3D89A501BCEA7D99@BY5PR12MB3697.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7a+Z23z/zz2vIT5LaBgBbEI64qobs2tMbcNoIYHaFb1ISN4gLAMf+KRYzHZERjEhr10BvLT0420sGwkBxUajERTMceHa/oU2e9kq9mw8vr2ECl/aEF7amqp10CKYe7qlzgBm3YOuUUP2glqhGXjVczLtKXi+nIwszYl176kehapqu6vMFMMOiLAMBC5hgkkOmE62xnQwoeODSzusWuIe3Ka+ORcRb5cRAkPgkUBHArFfpMJp6RPVie8PWFB9mGsIrCSYPZt9zDOs6uTcrkFlPQ9hBg/ZGspVLSWTMz+xNqTxF5kM12jdx4Gyo1pXOcKfPSFmEH9DraV2clbmdDKV/cNp2wONUHR5Z3CzhwIRWvCiDlsbP3zud4cZGoBzd20eUz5KxeZm66WGoQhcrER9spFMNhL4H6WPWssD8O6OC0y7PoQzCXwBJs7AvfkeGuTob3WVQIvaI36/IU7cSLGRgp894217nQfh9lLvENjoBcbe+f8SBDx2b9N4D05TyR0eoXi7bbMm/SC9eh6QJj45p3LB2RtZuvKecDV+aW3a1AvxeJYOZiyj+icinLvNHybukssUGGbEHBBF3KhZXXV32hcsS3+TVmegCBirOsXCOfXkuSJm+Sf2FPlM3GTEjcdGkUyU6qxwatT7mYnNMxwJG6yFxls59B+5h5qqlKZL5SUvSxUGhZQkIGl0k8Gn3c59w9JNncR0fl9CsOoyL2v58ai6Ilhtm96WR/X6dwgIHk=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(8936002)(7416002)(6916009)(186003)(426003)(26005)(70586007)(82310400003)(54906003)(36906005)(316002)(4326008)(31696002)(6666004)(16576012)(70206006)(47076005)(7636003)(5660300002)(8676002)(31686004)(356005)(83380400001)(36860700001)(82740400003)(2906002)(36756003)(336012)(86362001)(2616005)(478600001)(16526019)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 05:02:40.2452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d3b323-8cce-4884-cd00-08d97673b66d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3697
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



On 9/3/2021 11:43 PM, Mark Brown wrote:
>> +	err |= regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
>> +			TEGRA210_MVC_VOLUME_SWITCH_MASK,
>> +			TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
>> +
>> +end:
>> +	pm_runtime_put(cmpnt->dev);
>> +	return err;
>> +}
> _put() should return 0 if there's no change or 1 for a change.
>
So this means, no need to return any error value and just return 0 in 
such cases?
