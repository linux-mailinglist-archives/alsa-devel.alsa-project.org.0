Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00AB3476F5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 12:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638491614;
	Wed, 24 Mar 2021 12:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638491614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616584801;
	bh=hOihF10/MFvZVBEkUJuQ6npSb8ay+6rHL6sPYwaYzg0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I05wkHleyqPdW8RJkUK08H2dV2224IC970I4iwngFY6hTNhaDyjj+Kms9lTgD+4gi
	 HQPBgh9jAXFLp7AynID4sWSjwkpC1sKFfkxQ1fr2Ttbul2r6Pj2QqQhLb+KURu+rrO
	 QYy64KgESGsGkOT1jSom6EkfEgxIfMTTYl8nKizA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC3CF8012B;
	Wed, 24 Mar 2021 12:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84476F8016B; Wed, 24 Mar 2021 12:18:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA6FF8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 12:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA6FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qRyEh4/Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsgRKHYDuEzwOBxxITHZKBba8q60F8D43oBvHb5CEssW3R7B/TPayDD+oefsIQ1FZbysDrdU8Lv6QS43dS/vDPVR7l/2TgI/TpAs3QEiS3sZo7FK4oy3sKbRFANdZ0Q5nN2tnHkjAB2gKA51V0bfMHWHnmxFYrkRO3fLdHvFP/hYH8vJ2UI4f9cyAJTqHenyXP8TFl6K2EzSMNMWm0q9YeAev9VRWFg4JmyAFia88wfluWp+T2qxRc1OVdBwPjw/fiojaCIU+Jm1hBHywOdGs/y2PNdQg4TL1EAArDNheuoTcaiWzKzeteJH8bQJEWiCxNDjiUj+4UCteI1AtkmHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0QAc6Kud6+01O7KSE/Iprlyv16HyR4g+TOQFJ/+TeE=;
 b=Wp5On4BsHyq8iMn5dEM6/qdNLjiP9zjNE6HVC5DlRUmkbyg65mlXMR2ZI/23rILiNYAVFBDYrVzg3m+bJZyNG8ctSadpPhJmIlzSrTu7Q7H8uxJSDn4OhU212sNlDRLSopZgUv7knK88lhbhX7Jle5yoFe4sO22hkJ9qbA3kh/pJLUE5y1BUb3tOJi0z9IZMy5OmddpArpLAI8aTKSW0joJ4LJ2rWBpucXptR6y6MEapdONL8Rf58HIqSlkkxNHfyKghNDroipIuhs7rNYeg/B73Ew+/VWy8RxEF4NnyY6aJCNjbhABS4d3cRYfeG2KwJbMxPJxpGID5sI3mhr8VXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0QAc6Kud6+01O7KSE/Iprlyv16HyR4g+TOQFJ/+TeE=;
 b=qRyEh4/Y2K9sbhQCn5n1CtHYmjMVL79SWhcKPDYXSlCsAy4KiTbD5XeRmd0zRil++jsrU/Cwa8DXK9hz51nmBQPo8b/L/OSP4Apv4miyZbwy0UbSLlqRL3uVrnm7PxTxG2IGDd/rFzEIlQFywW/r3UjXhAn3/yMRhtldf+sr/ACJgzYbYSDBHGPoftkHMKaYfaM3hnenmeUCzHsNJxosPog8YwlB3EUS8x3yPL7WtRWgv5MPH7GER/+5LiIXcbOPlTfKzU7ZfExQihc/jRKWNB5l/GFZHFbUDQVs1PoyB7wiKvnefstqefF3QMDf6EcaknJd4PI16STiHrrsnRHg8g==
Received: from MW4PR04CA0364.namprd04.prod.outlook.com (2603:10b6:303:81::9)
 by MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 11:18:19 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::be) by MW4PR04CA0364.outlook.office365.com
 (2603:10b6:303:81::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 24 Mar 2021 11:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 11:18:18 +0000
Received: from [10.25.96.178] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar
 2021 11:18:12 +0000
Subject: Re: [PATCH] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing
 child nodes
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20210323200005.1196572-1-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6b6d57fb-8596-fa22-0a5a-9d535803d10a@nvidia.com>
Date: Wed, 24 Mar 2021 16:48:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210323200005.1196572-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42854e5b-27e3-43ac-d677-08d8eeb686f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:
X-Microsoft-Antispam-PRVS: <MN2PR12MB29412CB732ABCD1CF6CBEFFCA7639@MN2PR12MB2941.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSi8QgUlmuA6hL/IlNXAFL0VDWbPLsE98FWNTgoAMZLrVJ2w4O7FUWlR5SlrOl54xCe2as5ipOW5uNKe8Pu1Y+TNdaDbsaBnQ3gfSx8/sdePQZ6SE1gQuWbqEfmdPTl5Intfuc4zqUX60fv0MD9d24asibmwYN9bzAsN+4B9/6rzghEr1B6TxQv3yb8ZMayXNEkfPfyEOlhN+9xsXX0g5DIINJbLMzEQJ3VYB8UYIeIfPcTlx2FY/2rkbSXvNbVRedyJDcH70/9NuYNlcz04bucZ25+tLIwHTOczJnU3Lzp9VNGMAklS3pjrKcFNRUrC9DVsdkbx5V/3VbjIaequ0IuA0zLE5qD76jjB9aqDg9L7Ntv/a7TOjm7GaDpwfQh7o8pt+XtglOZoFsfxUOSf9UPPqe7ZTFSDE1TT8rxHixZW/boi1UjGEl8uPaaRzRISvYfJyb+8pcXqBEVH7DyAFj6MF9LiR3D7MtHqpHYqRC9GhxqW8jkTZC/zm4Sqc+YJcxFy6xxuOrzc4/PdF6naPBubSw9w9SwO7zRm/Axb8QGDyXOEp+Zhz+e5VkCToPTBrXWGmllCzr9BAqX0lRaQB4th2sFFKm4R80Qc0zmfFyS02ULVzfMVMYT8s3pcAs91eh70WYBZePfo12yYtNa+wbeW6UJS6K1BakQQFsFoduiH59RhagmJ0EYKSSVttHMQooY/ry3LRLlWfmWfDvJEMjZv2vqkTvIqKaoF0rYLz1eQSgbvq83mec19/gUMtYwY3NvBUOQov6+ZDOyX1cVgeCWJtxu6YrHgbfKKR8vqVhc=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(47076005)(36756003)(336012)(31686004)(4326008)(5660300002)(70206006)(426003)(8936002)(8676002)(316002)(2616005)(82310400003)(70586007)(86362001)(186003)(26005)(36860700001)(83380400001)(966005)(53546011)(478600001)(6666004)(110136005)(82740400003)(16526019)(7636003)(2906002)(356005)(54906003)(31696002)(36906005)(16576012)(21314003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 11:18:18.7516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42854e5b-27e3-43ac-d677-08d8eeb686f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2941
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Liam
 Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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



On 3/24/2021 1:30 AM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.
>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This patch ideally should be applied before this series[1].
>
> [1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
>
>   .../bindings/sound/nvidia,tegra210-ahub.yaml         | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index e568d6c7dddd..d7a5eb77ed4f 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -69,6 +69,18 @@ properties:
>           $ref: audio-graph-port.yaml#
>           unevaluatedProperties: false
>
> +patternProperties:
> +  '^i2s@[0-9a-f]+$':
> +    type: object
> +
> +  '^dmic@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-dmic.yaml#
> +
> +  '^admaif@[0-9a-f]+$':
> +    type: object
> +    $ref: nvidia,tegra210-admaif.yaml#
> +

There is "dspk@xxx" child node as well for ahub, though schema example 
does not show this. I am seeing error because of this during 
"dtbs_check". Wondering if we can add following with this patch?

+  '^dspk@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra186-dspk.yaml#


>   required:
>     - compatible
>     - reg
> --
> 2.27.0
>

