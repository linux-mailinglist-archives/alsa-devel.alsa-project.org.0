Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE23E34C428
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 08:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A7391616;
	Mon, 29 Mar 2021 08:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A7391616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617000920;
	bh=RybXvRAd4zfhG/YhDGuRsLfF7ZN7Dvut6dtzdMACL0U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImE4pZiuBgnm1IcZFUP0EOhhBfFLo6uR2RzPU59u8LefVTbSptJ36zE/ZuX07vT2m
	 UmQZyQz/RnMJzmqC4LPmd560JOgtjw2yo70wgT3E80n60OLlyWcKgzUGddyw2b10pr
	 uNsIdcvbXy9QZ4i4jBZKGX45aYUMyKHgg3exwbws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFC8F80157;
	Mon, 29 Mar 2021 08:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BDB3F8015A; Mon, 29 Mar 2021 08:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D403F800DD
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 08:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D403F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="L9dJN8Cg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzHkEcFbgqSgzGzkE3ImBRRMPumRpxy800sNoWTnuxH6nMt9K8DKdsAXAqq63RGRlSM9fEEKuScsrDNWYb7WPc/HzUzniChxOvYXlfx0N44967wGVk+UFwZfCwVjamR4ed2VbssUNuJnIkDo4Ww0Pyd89Nq7SNe0+e+5RbuHlmiU2eYoIJZSLp6GPW8YjnPqhBBy93CGwkFlUqurgNadbh6hRDEWljGp1qUSBDKi1UVYosDDEniLgRvFkizmRLMX1l3iB5NI98KG6FEWcsr7Bw5n1tz3eC9p0Mm2Mj5kp97DRv6JQTYVWPFTBFwVCNOEQ+49dSpZhVsgbv2mMjQe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNiNgxjf1T3eniHlp1Ug6ebCE12smi+S/NcN2PxuauU=;
 b=aqtnsuspl5kmQ1vJJT1HFtsrmyPR5TcpFTnasEdi5BpJD4IWntXUCeYGs7E1WMCRrsw7Z/l+uyS0x10CierAx4qkrD/CDXlyPRRzBs04pb4WBk3+vEViQ2d/kl9FEr7TMlB2cEKBojHtrrnPbM5+eCU8uycsC7ehW5zck9oBDIFwu9eHNlG2VSk9f8DeLlqxVxrPPbSQLMQu7EbyTi+sFBKtZtBmU1bSITe0zceihe6NDi+dVwqlGju0Ful9GZF95pdZ9uo/TonbmDwiHhpQmdTKt94xbA5np3CBESkEZ4+KMng6nNhSjn9pQ4TykzHtCkLTkm7AsilfdH7YaJOj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNiNgxjf1T3eniHlp1Ug6ebCE12smi+S/NcN2PxuauU=;
 b=L9dJN8CgS4XokSwF/4qFcid1766IUMHaPFNlJjNqNLynRmDJx1fwFA9q+FzHRbWz0vG/7b666lAKzzpqgvU8F7M6o6e2ZjRlMmvJFjbjmbApe4xdRnvN3YKLQcXyi+XIFqR/jhbaz4M5r8fFw7UM/jPosMDFH/KHbu6/L0oXSrNvuXw/HnWjUiQobWJBvuLNXAqzrwSsPupDaqvF4HwI9+bxyCptRiTdPt95RF/e5Bfx3cgblQLeLAKbIfFqZ9vHhQR3+mYz7Rbu3yYxhLYJbJGvqkMkaLEU+BKsJU3DSuDxQXH0imw2VOt54x8SF5Is+tS1G46iIT0ZRp10a1F1Ow==
Received: from MW4PR04CA0278.namprd04.prod.outlook.com (2603:10b6:303:89::13)
 by MWHPR1201MB0014.namprd12.prod.outlook.com (2603:10b6:300:e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 06:53:25 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::90) by MW4PR04CA0278.outlook.office365.com
 (2603:10b6:303:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Mon, 29 Mar 2021 06:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 29 Mar 2021 06:53:24 +0000
Received: from [10.25.96.165] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 06:53:21 +0000
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing
 child nodes
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20210326195003.3756394-1-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <108e9222-c5db-a541-c839-37f35e6e172e@nvidia.com>
Date: Mon, 29 Mar 2021 12:23:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e71292d-5ba2-4acf-4a21-08d8f27f599a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0014:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00140E82D03D62D833E2CB5FA77E9@MWHPR1201MB0014.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xzk3QyR789fo7SCU2uK+SwsqzYH0YoiM/k8/bUQTlXvdPPthz2ZCxe6IRlgnuav6HtcLrhtzHlRe8AZnrJnCYSQJrcBbCrilijdCwbdk9iHFbk7VU4jcLK5q8nvCthuO0EdwgAm2qMdnD/g0ar6Qtt4Fp2woyfGxBQ8vPe69NanMJ0dPF0r2qGJl8t8pBkVzVENWFELbXYpCsDFG7toIMwIFOUmHUUtBK68pMtt8WkPnJ0T56p8Z3PKfRMwZrMjXVUzawy4xm0I34bXVWzZ3M+WlMUF7bXhgrSt/4DeuWseVrBQ05xFVeMXUQCvxywwJkYOZzceKcMkOtue7yWU4VExRY27s1b/syuQCCkatANxHARkdVfXONkbqFZJEpMch0agGiB6YdA9hq0q3ahBkp/YUJptqkf8FwNUteL/jIJ6i1jBSIspMCqK7PWiiw3aQFwHG/0Hoj87OfDlt26QdE3AKiTfJUOiX8SjkIfJQlSeicCaObthsGwM6VgMqO0nFyQZLnbZuxVx4qzEfhQTLmR4LbQDbFAzNbo6BUXPG4VCKLdv+trdAfixebt+WyHnIfbdZXSdqK7rAfTlVAhNPQdjFFahlea08QNo/Lk2HCFIjXWPo3+GkqhaisZc0Gio/rSzqvqrSfkjoH37VHPLJ0Hvg5ZgpstTKm8QJP2IKNDULkgT8zIq5MJS1/anFAwomFr77CM5Pl1rjYt/N4ug1Rg9sW19OHzntYIjE7LvxlhtQNw//3t+LkqUqerjM+bEW
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(86362001)(356005)(478600001)(47076005)(36860700001)(336012)(70206006)(4744005)(5660300002)(4326008)(426003)(83380400001)(16526019)(966005)(53546011)(6666004)(82740400003)(316002)(82310400003)(26005)(31686004)(70586007)(7636003)(8936002)(2616005)(54906003)(110136005)(16576012)(2906002)(31696002)(36756003)(8676002)(186003)(36906005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:53:24.9847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e71292d-5ba2-4acf-4a21-08d8f27f599a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0014
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



On 3/27/2021 1:20 AM, Rob Herring wrote:
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
> v2:
>   - Also add 'dspk' child node
>
> This patch ideally should be applied before this series[1].
>
> [1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
> ---
>   .../bindings/sound/nvidia,tegra210-ahub.yaml     | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Acked-by: Sameer Pujar <spujar@nvidia.com>
