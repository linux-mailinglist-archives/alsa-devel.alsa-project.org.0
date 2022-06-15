Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2BD54C0DA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 06:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F41916A0;
	Wed, 15 Jun 2022 06:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F41916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655268446;
	bh=nLZ+CFUl6cSMGF9wyIRQ9speND0lmq0bqDfQEhHGDNE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dc1t5tVq5Mw1XeIngp7iYDl6keSgcreSMrxcvW/Gr0XSeLMnGeeROJK7YFx+OTcpT
	 KfZ46ThtH2gnS1OP2EnMyb4+hFDJj6PeA2JyRlwvwe4aOm0jRLz7MCDPBHZngOrlu0
	 UJBRPosczLyxxjjV0jPVvCfTA4Zmssif9Mmhi0fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434A0F8016C;
	Wed, 15 Jun 2022 06:46:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2E9F80162; Wed, 15 Jun 2022 06:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90537F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 06:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90537F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qPKHXMsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx1UgXKyYjm0GOIKAZFhZCOZUwYtCeiDHJ1i2JXYcIbNFqMZAfesaw2Y9xlAwtl33i0YLCkq4yvb4hLv+uE0cO5YfDlc1tB+jG26yqtGMVYZRp0q9VA9UAd2KWYRFsSGg17mwO+evrz4lwrz/Leo96USxPL7Lu4/9iijEFKiYx2KbuDeM3ksjMpWPt9spT+hHUfexviRMwdJofMmO/zWg9aHvEA5luJ/ZlSh8H4xS1h5G+m5DSo8OtAi0HwlJ+jGvPX7Vh6crcgxorhvd5Imu+PO6Z6DebkeRZBOwG9tjR07/ryPOxGXbWKbQ7+tHbqgynnSism0POQmlfZRl9bHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYwAMI3PQZI50mAOaprxQxdVqekj2vo36/b66JK4Lag=;
 b=KclTsUeI7mdiS3EASauGhoN0s4DEjVeKdtT9T7chmcApzFDCaeRTfK5+Cq86D2kkpjqKTEc7BRPXtCnn/6XkLE2oJwpRVLIYs0ft7Y9BxML2AR58+3LSp+ywOtebcwZcNO6wHXG/mzKIFdpwSdZFFno4EXTGDopehkYyGNzhseTKdCYprTSr3QOhGUS5HZOCqEYTfxgKW88wZkBkXAosZKyJgtouhq0bHBEAEQXgiYTR7qT/6L1XydYb+QdwDeuRpZ2vQwjcGm5oVdqRD9+c4rqiw+e+xylbJsh2miH0WrohI7Io0adOZ1ce//rb/w7Q6d0bJUqZOr1JUK4bjg9BUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYwAMI3PQZI50mAOaprxQxdVqekj2vo36/b66JK4Lag=;
 b=qPKHXMsB+8lnYtjkVCAQlxqDtuF2YVlCYxfK6PFHqpJtwy9ApP+Qi7e+BbNNDeUH8eEtlSKQcgMAt9f902bU1ZxHNrumW7t+6Fvyn9r77BS+I8LHxFwa9FnKBiJcvDc4tOmKsP5F30JrlnmO8toJ1epPjOQbp3iG/jL9AnCPBh3pnXa7SmdaatjZhqlbYRKamK/EItTPzHBPcLUFGvyrZy5RE/tX+9fj0A378GG1uIp7C/BrzWs7QGHyrUMldrgvLwIhbd8idF/V3IWcN0Lo0jvyLGQWmqR32AfH6bLqvMpCuKJgMmeURPeW+oHemDozzBXscN1ACBYrJF1gtC9utA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 04:46:12 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::16b:eff7:847b:19e7]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::16b:eff7:847b:19e7%10]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 04:46:12 +0000
Message-ID: <9ea19540-aff0-258a-2927-6a32c9fa41c9@nvidia.com>
Date: Wed, 15 Jun 2022 10:16:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] ASoC: tegra: Add Tegra210 based OPE driver
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YqdFcPETMQGZm9AK@kili>
 <8553b100-efd6-cd6f-f57b-671fe830a577@nvidia.com>
 <20220614060927.GG2168@kadam>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <20220614060927.GG2168@kadam>
X-ClientProxiedBy: MA1PR0101CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::32) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb099f08-f429-491b-77e1-08da4e89f925
X-MS-TrafficTypeDiagnostic: DS0PR12MB6631:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB6631D2BEF61011FFE2C97E6CA7AD9@DS0PR12MB6631.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCDKaU42+ajfGAOo/X2R7ssItaVBgORUbSM7ZdWbhH/3BrhDHGJ9EKYO7jpXLivhv8g6vOhTc9oFJWqs/Q940T9I5uP40FB7uDGCVgSvymjL61NE9T6dMYOAVnHTEYF3sE18Q5NINnStkP7pK9kthv0fVVu7Us4LlpB38B1w1QDE0sd4o+iAwg7+2cRMXlT08olmBfvU0fxTZHGtII3z9GhQMKNwV4xcreXJvdEAWkYcM9G2X3HCq8r93X7AU/oiBUNHk+fXnzSVdLPmEtA6T/1idQdghnYwyFzsR5vguwFJhX8R1rDorWAz3nllmKVo6vamg9rbILd5qFVwazY6yRat+7arCFWlTMEwopVt7IfLgqNE/iUGIaGjj4j3Ek6sALti2jkL91WTJO6d3Rz9RUQViOkNAKPa/UYaxhhpLfyqK7fdbCOBukoD8lLIA3ub8uG5biBZSLcOlxlI0EYlQ60yC2JyOjASn8j0Od7K9FANHv4vtcVOFfH7+yTz3LOAOJysrRmNns0C5NHfVQqbFzZLsre+G2Ayq75HvsKCqLEpDNSkNIbTMeOK5HsdQ0X8+he/6ShNFpt1O9IYHKgvqTNkBZSrp6cJWBB/3RPCj81Fx17cfKohssGQmEEoLSGldFmSl1r7qT7kwebbMiXiGE5+sIwz8uNZiVym+suEkOCNECjtQ0uAl4Lgj9134EQGowNCdh82Fc2+yXMdKLtkdbmUylmuMt+JyU3EZKRGyP8QdT/rGP5ye6r3PnU03cj0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(2616005)(26005)(66946007)(2906002)(36756003)(66556008)(66476007)(4326008)(33964004)(31696002)(6506007)(6512007)(5660300002)(8936002)(53546011)(6486002)(6666004)(508600001)(86362001)(31686004)(316002)(38100700002)(8676002)(6916009)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRjMUhodmF6UDNyc1FuYkxCY0FxelNkMDZPUHpPbmx0WDVrcmRQYTVyS1VL?=
 =?utf-8?B?RmFvZEF1VGdUV0cvd3Mzclk1anBXWUtPYktrcC8yOE5pMTdNOUhjZXpWNm9H?=
 =?utf-8?B?VUR1M2pIaHdKMmNXSVNrM1RhN3c0ODF1MFk5WE1ZTjRXQkZVc3NPQ2dTVElp?=
 =?utf-8?B?S0NOTm0xRUtHSWpXMTJZbHEvMURMQU4ydXFNbGU0dG96YmlnTGdNVmZrOWda?=
 =?utf-8?B?czAyU1hEOU9DWEw5b3JodGpzY0g1dVBPY0htYXVkQnpuSVJ5Q3g4L3BxYThI?=
 =?utf-8?B?b1dxUm9WS1ZvRDFTcDZBUU1kaTN6dENHOVVZZ1Irb3d5Y0ZndWJYMWhlM0Uz?=
 =?utf-8?B?SmZjZjdpbHhZc2N0TjRiamtpQzJ1YkRKS0NrbjRYZGNHaDg1LzlEdW5iZEZ2?=
 =?utf-8?B?Myt2am5MZmZUWUhrRWJ3WWFvYWVzZ2RCZW41OWo0azFvMWE1S0dXWWVyVmc4?=
 =?utf-8?B?VUJqRXdycVJ6Yy9WWGIrdjF1KzZVK2tkTGpDNEwxWHc0Nm9vRklQc0J6MmJj?=
 =?utf-8?B?QTVGRnB4YWN5eDR2SW0yRWUybWlSRHgvcFJ4WGtER0U5cG5hTkQvSUFQcWVG?=
 =?utf-8?B?MTN4T2ZFd1dydDQ0cGJLUGJiUjZGaWdneEY1QjBwV0YrNmY2ZWVFVXVzeUk4?=
 =?utf-8?B?VGpFNGZsVE92N2hpMGdrQ2R6bFZSdkgyZHJxdlc1M3RLMzd5czlDUzk4Rlkr?=
 =?utf-8?B?dndxcHIvejVrSUdaUGl2R1hGTUdXWmRiN0ZpSGVscGdvQ3pNVkQ5SExXQjdV?=
 =?utf-8?B?azBaaVg4akpZajdsZTFKcXZXeUdQNm1KU2d6L2szVFZ2cUlyNGhzUXZJS2NU?=
 =?utf-8?B?Q2RXc2ZNSDVNdG9kMXNacHFUNy94dHpNb3RpQXJIMWxvMHE3UWJ2Yy9XN3F1?=
 =?utf-8?B?MjZ5S0ZLb2oyUGJ4all2SzdzWVhuTzJSczI5K3krSmNoa2Vodllya0ExTHRv?=
 =?utf-8?B?Y0R3dTluUkF4bXZLdmUzMnk4N1NUa3BaZ2lUTFd0Um16QnlORzJEMHlKRXV6?=
 =?utf-8?B?QTk2anFqTXl6NGlqYWdxcnc3TWF6SDgwMGxkczFFUHRYRjNSY29IWnVNNHJS?=
 =?utf-8?B?bllycFdUYnFnSVhsMUpTUmJMaGFJRWM2Y3ZwTGhzN3FnWDFqOEl1S2p0Situ?=
 =?utf-8?B?RDN0MFRhR1FkRzdxLzliK0JNN1UyeFc3dEFtSmg2akl0a0k4R3g0LzU4ZG5S?=
 =?utf-8?B?b216QzZoYitwNGZNOFZab2QvdmVSV240cFpEbSszbDNsdXNTMmZXUW5kYXpM?=
 =?utf-8?B?dzBob0pMYWhMMTg4RmNOeDBhQm5xaWlwQ0kzWDg1MDNMNmp5TW44dkE5VkRL?=
 =?utf-8?B?YUtKd0xCYlpzNHlFRm01MU01bTRQZEQ0VndQbXdEQlg4ZHRrUjArMVlOWG9Q?=
 =?utf-8?B?MFplWGZRWXg0b1NxR3FsRFZVM1FtL2p1OFgxWjZjbmppaENlZllIVnJoVU9m?=
 =?utf-8?B?c2ZPcm9pZWx0Y3hZQUpiekcyTDg1ZWprM1plS0grbW1hcE85eW5zK1FyUW0v?=
 =?utf-8?B?aWZCdmpPMVEvSmRManUyN2JwSDdwRVJzNlNBY3Q1eWhNS2tjQnVCUlZYSUVu?=
 =?utf-8?B?alVKbytsMCtOV2t3aldBUzFLVVgwOFpmTGRFUCt5R1IzOW5haG4ydEhhSy9a?=
 =?utf-8?B?YVg0MUlWa244QVg1Ujl5a3gvZ1MwcXVpdjYrUUVqRGtScHlXRlo3SVIrYjYz?=
 =?utf-8?B?dlhhWkZSd1p3VlNrTkVMeXBIZDVvVmJkdCtiVGxsWXFSMmd5M3lLK2hFeVYz?=
 =?utf-8?B?OE1oUGIzdXF2NXpxS1FBakNIbmd0R3JOZGdxQzJHMnQ1ZDltS1hWSEJvd1FW?=
 =?utf-8?B?a2RYSEs0OXNrTDNqaEthU0VSamlsYUVwNXUvS1BVdElXekFVcHpiYk1WSDVu?=
 =?utf-8?B?SEhnYVcwSjJSalRHVU1sM29xZUNEa3BFd0ltcTVoY3ZZNG9LbEg5RTZoMEsy?=
 =?utf-8?B?bXNYYWFTNWRBU0dRa2liL0JSWDVHeVNMNTF2UzdLN0p6WlJqNmNkT08rODVw?=
 =?utf-8?B?eGU2b0ZVV2ZMd1FuanJqOFZDOE5uVktoVm1hZ3lmNmxObUNMVThha3Z3Ujhr?=
 =?utf-8?B?MGg2WnpXdjBCRVRKTGluT1BTdWlPQ3VhWVlWS0Q1YzhKVHd0dEZ2NEYzQVBw?=
 =?utf-8?B?dGhNYVlmNjlmQXYxajVHNVZoMmNSTVZNSFVsdFVnaVVhYzJvU21TTlJ5b1Ax?=
 =?utf-8?B?VXVnV3RNTWlGWkM3RDBGWjNaUFdVTXZZT1NMWXdjR2RBelkyREtJNDJsYUtG?=
 =?utf-8?B?cmxoOG5nYmgyOUd1MWZkY09IL1hyaWNZRDAxU2Jseldka1lyNERoQndUbU9I?=
 =?utf-8?B?YzJtL1RRSDlLaEpESlJTNGx6eGpsZlRObDhJSmVRV0w4bHRkSFdaUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb099f08-f429-491b-77e1-08da4e89f925
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 04:46:12.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvFLT4k9aU4Da7mLl0QK6h4Nul3WqMf8xQ7WS1MRI2o3M1T/qJVa95S0ufD4ndxEDtB/qm2gKuVrsG2LKKmfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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


On 14-06-2022 11:39, Dan Carpenter wrote:
>>> Hello Sameer Pujar,
>>>
>>> The patch 7358a803c778: "ASoC: tegra: Add Tegra210 based OPE driver"
>>> from Jun 3, 2022, leads to the following Smatch static checker
>>> warning:
>>>
>>>           sound/soc/tegra/tegra210_mbdrc.c:778 tegra210_mbdrc_hw_params()
>>>           warn: bitwise AND condition is false here
>>>
>>> sound/soc/tegra/tegra210_mbdrc.c
>>>       769 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
>>>       770 {
>>>       771         struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
>>>       772         const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
>>>       773         u32 val = 0;
>>>       774         unsigned int i;
>>>       775
>>>       776         regmap_read(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG, &val);
>>>       777
>>> --> 778         if (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS)
>>>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS is zero so this can't be true.
>>>
>>> #define TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS            (0 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)
>>>
>>> The common false positive with this warning is that the macro is
>>> something which depends on the .config and in that case I just add it
>>> to the list in smatch_data/kernel.unconstant_macros.  But in this case
>>> the macro is just always zero...  Is there a plan to make it
>>> configurable or something?
>> Thanks Dan for reporting this. The device is actually configurable. I will
>> provide a patch to fix above condition.
> What I meant by configurable is:
>
> #ifdef CONFIG_FOO
> #define MASK 0x30
> #else
> #define MASK 0
> #endif
>
> Smatch works on the preprocessed source so it doesn't see that there
> are two definitions of MASK.

By configurable I meant, the device (OPE in this case) supports 
different configurations driven by user space control settings. Above if 
condition (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS) is wrong, instead 
proper mask needs to be used. I have sent a patch to fix this now.
