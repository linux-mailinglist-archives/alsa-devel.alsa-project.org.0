Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A42356E16
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 16:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8232F1669;
	Wed,  7 Apr 2021 16:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8232F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617804216;
	bh=4f6cRXgrkUrQWtEm4NjneG9p8aRr4j7476ox4XI8Cek=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhS8ZNUKCBFjOEhqx5CXv7N4bl9TJtZeaHumQJ4ZnqzLDdcATVYmkLdUkBwizEp2o
	 WYY+ExazCcwQ1ib7+AcqQSJ4IynJEM7/Ws8DdZMeF1eHyVo552HnFaSnXW8dlEiEG8
	 S3c54ss6zVBzXHLJrsasQHJxKZ+uFdqw2i7ROpnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F29E0F8016D;
	Wed,  7 Apr 2021 16:02:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B76F8016A; Wed,  7 Apr 2021 16:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 815EBF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 16:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815EBF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="VtqUOn88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6ClcFlYbMVKOauJR/JWtsO4CDZGAbeIgNknUxFiD4ZbQ6g797vBPJawrdOxmIIeCkUJDMpPEM5fVb4YqQSEDqCnNonKuwsP0MB1tHAWqe27zUU2ZtgsXqxRXwINyvzaxtPz8c4YgBHf9Bm0GpRoEP6iiieailQeD2M4AbC2dagf6mHICPETid2wpXY6HeJawNhBtgBgfhg65orAE5ywplXo3HRferLytFkp2TluQcbKcTd3bPAEKr9CsrvvFa8lqAEWiVvRolpj/ou9XV8MNj6YgMzrJXqZwPLEIev7DTKFmfeQ2B0+g3MNoInUwWS0fwxpYClV17J7Q8lVpTaTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOOG07JYfZA9guM3Ze/Qpi3H5gWt52RrGkq7w6D2Yrk=;
 b=ldXgQD4tJYQvPZeEyo7yuXYHSdDagzHY3RS1kprbpb0iWhp0w6Jyl7Lk8bmzngY5itgcPBMC1tJPNT6CQPHfGPWg/ZIPNjySam/hhS1vVCUNgZRXdkNsEJteQOPvmXM6KiQFo9zkJFm0bkXfGG7hbACmcIpPYM6UMptq4xEclCDmeMVlXhMM3hvQDud8Yvl26zYyIB5hzspBxtH5qh04hnozsRY5AdtQnX4ckn0MJsqkpd6WY9JgRGsFqpcJGwN3WIUdwWLTfeXHWTKS630RnZnM/9UdmlZ2qJ5QRUso9sJGFpkRi1c+hwrJsMNpIe4yo6hJvwPdsZQnSMz6P8ED1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOOG07JYfZA9guM3Ze/Qpi3H5gWt52RrGkq7w6D2Yrk=;
 b=VtqUOn88rn4YsLXsXJltJDDXXAtvbu8YJeG9X9OUt9bYmVkoayxrSPJ12hKpnZRpp7l0UmDC7bDT9UYLpqpbAWbOXv2feFCOyz1OGzJqZbs0GPAiHvWl1L6mdxDKGa7C1dstFp/QRMDCPn0OIler+wSV++W87d2BGN9PyKigvRc3kF+j090XqKmcNoBg4RfjKg6USzcmNmn4bE4ZXfC6e4EXqfhCLjackp8n4LCntdkW1JKuQHGTVmUaNW+8hybUO8WzELSp45ExpB3bpn6MSB+fxs89auUawkig7G1kzJXFEzoM8Xn6J+VFIoQbOmDcfYtGh/m4wlwGp5Iqw6zGeA==
Received: from DS7PR03CA0105.namprd03.prod.outlook.com (2603:10b6:5:3b7::20)
 by DM6PR12MB3931.namprd12.prod.outlook.com (2603:10b6:5:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 14:01:57 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::ce) by DS7PR03CA0105.outlook.office365.com
 (2603:10b6:5:3b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 14:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 14:01:57 +0000
Received: from [10.25.97.195] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 14:01:54 +0000
Subject: Re: [PATCH] ASoC: simple-card: fix possible uninitialized single_cpu
 local variable
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
References: <20210407092027.60769-1-krzysztof.kozlowski@canonical.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <d27f9314-8848-987a-7588-a1454ecae4ad@nvidia.com>
Date: Wed, 7 Apr 2021 19:31:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210407092027.60769-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 353a8315-75ed-4e8e-7880-08d8f9cdb526
X-MS-TrafficTypeDiagnostic: DM6PR12MB3931:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3931A240AE82A2A9F34F3509A7759@DM6PR12MB3931.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1XHmCrEvLssgP2OsAjVt6C9/gM/jmxDtK8piq2cppezzRGikF3BhN8MNvCAEmX42jfMrzCkKU+0/8v7/yVoFSrNN47j63oR7qqTw/oju+ExIzi6+PSpbyLWFQnkmWCRcGmK2Be9OAKEGEMQnq24nZn0dEPuXaWz+UDzol8jko0UQDaWcqOJFh69M1u+5bsiS3fNPhxEevkTTBZAdV5gaMrp/RZj1PGAlaIQLImND40tnsJL4mtP2CUlt+HfQjLeskqJe5yqnChNNjmTNt3sCQ025msBCXLg/LKVZLcqF+6dZ1a/zkIrX/2t/vjtoxTfuaOSW4qECfnAypsV4fKz6rNqw5Y6CPfUmzw2KHYy++7eikYRfuayBictjl2ITfUcFT00UVRZFGxPHNtsj77yjSbKAgWSrBQujlfALzTDDvqPjoEUp2Xs54OtSJ/BPbNONB2SaL3r6ZsSMe4Va+AP4gGjWj7w1P0Tc35b0jfSOExzrLhWP9SYahQbXrBSjmoHVh5ZbU/Xsi2KsEK1/jYVNmSDOBXF+QexLLafi5w+grevlgaURTB0cIGo3BS4Wyet3itDneh5EmQShHfxBGWm7VTritgM9K8+f21Sbl36Tj4xLOfPi59hU1FQmIzpytZZdSNPbZtR5v8c/SbSbHoXTIl2tCsQfVvLgpQG9ZJl0FI325JVdmdf42E4cMkKjOrmj
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(70586007)(6666004)(8936002)(36906005)(82740400003)(36860700001)(31686004)(26005)(316002)(16576012)(16526019)(70206006)(110136005)(8676002)(336012)(356005)(2906002)(2616005)(186003)(7636003)(478600001)(426003)(4744005)(31696002)(4326008)(86362001)(5660300002)(82310400003)(53546011)(83380400001)(36756003)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 14:01:57.4695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 353a8315-75ed-4e8e-7880-08d8f9cdb526
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3931
Cc: Colin King <colin.king@canonical.com>
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



On 4/7/2021 2:50 PM, Krzysztof Kozlowski wrote:
> The 'single_cpu' local variable is assigned by asoc_simple_parse_dai()
> and later used in a asoc_simple_canonicalize_cpu() call, assuming the
> entire function did not exit on errors.
>
> However the first function returns 0 if passed device_node is NULL,
> thus leaving the variable uninitialized and reporting success.
>
> Addresses-Coverity: Uninitialized scalar variable
> Fixes: 8f7f298a3337 ("ASoC: simple-card-utils: separate asoc_simple_card_parse_dai()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   sound/soc/generic/audio-graph-card.c | 2 +-
>   sound/soc/generic/simple-card.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Sameer Pujar <spujar@nvidia.com>
