Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6D4EA939
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 10:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6086A174B;
	Tue, 29 Mar 2022 10:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6086A174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648542550;
	bh=KocFMN4CjY0MC4xnZixUbhNTH/mz4Ia3szl1v7wl0KA=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6JtHPY26Y+wSJec6OpfJdVt7r54jh/6xOUXjro00UuSAJH/BKlgTTTFAyzyfYoKq
	 EjO/vdKYx/txrugX5pJsEr/KIpDIosrV6Z5Mqs9pI1OZJRM3UPLiTpq9lHRCmEc/MQ
	 Ta/LCFiWBXy/6xgO4HjR5alEgxOYeD5U2GTpNC/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50837F80121;
	Tue, 29 Mar 2022 10:28:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81F56F80121; Tue, 29 Mar 2022 10:28:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55121F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 10:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55121F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Aa9mDk+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9zKJIXgqi3YHvjXs/0Kbfv7RobfOHbycSfQ3gpMv8Si2jWBE+rDOtqGaMF3fN9pkns4j93ccpvbrVFpnDxYrZZWFdWJUQ6ra2dMly6CCcTAt+yidwfvEvkWMdVuZVVOK9QKkGfruNubUlItOMuI1uIayT98xelRNrYcJVaEyAEWeMQDRxt0t41jaDbr7xsAFu75ixwv9EC0gxTsCepfutZK2y7xl4Q8d+vBcscvwt0njQ0vaePUTIqykN/PqUK2ZfDnrl5vBJ9PPN16IaiZyZMTYrpyrtAnA3NKWWKT8RoDN3hLQB8ayZH9EeWvTXrcI/P4sNJjY9OYlT+XVCnwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ObCeU3/QTW3KgIeewZvvcO1klxfU++Zewoy826gvcw=;
 b=EtRu5YDEFBaHDi7WbFjFI6L5DK8lMI/CS2zcsq7y3LauqCHTOLl8hCq9RqY4ektEQ+8JnlB2A6ZrOXefRXropQqiOfbMUUWa4dw7gfXAzMoeN1cXlQPQ+UsW8aJdTiFTtXcGulXCKp3z01n9pBwMNty0w0bMUrJUGucpSbmj8D3XjbpGohBO6Yc0dWBUpNDWwmNDjk7v81ep5f6L+U3YBJamacUZjF8x4E4V9O7JfQzjQ8sKOQ33F1QZp8FGgzuXb2KPL6EEQmcwO/X7fPg9vQhELOiZPH49zEKHFESmoIDP+GMteIgJnOCAeGIAPo9arBFChUEsrUcomJV1USZT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ObCeU3/QTW3KgIeewZvvcO1klxfU++Zewoy826gvcw=;
 b=Aa9mDk+75QJq47J5L83BcoG3tFQzRC78UsBBOeInDFXMps43LNb3VkGpVoMNegoYM5d/J7vMLjh8HJ9bwc3g1UE7sIvEjhvqN7INeXkhp3WRNwu3YQnSe8kENSB6KHPIJTxug9FQGxdIfUvmppXwv2Ae4DV+YZ6MvPAti9fwWzS3+G7F3dySp5uCaApi9OfQ1QakfbKhRdXfOc5r36Jr/O79gqyYuD5chzwpuuIJttnd5pKUAFOqARoi3BSPX8vb18V3czP4eiBcdpPz420qYut7qadw7dCKrSwjVp4HuopkecYh+L7YMvgafAe411h6KdP8gsTMGhjkr5hkGYlr8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM5PR12MB1579.namprd12.prod.outlook.com (2603:10b6:4:c::21) by
 DM6PR12MB4796.namprd12.prod.outlook.com (2603:10b6:5:16a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.16; Tue, 29 Mar 2022 08:27:46 +0000
Received: from DM5PR12MB1579.namprd12.prod.outlook.com
 ([fe80::55b6:14a1:6fa5:3955]) by DM5PR12MB1579.namprd12.prod.outlook.com
 ([fe80::55b6:14a1:6fa5:3955%11]) with mapi id 15.20.5102.023; Tue, 29 Mar
 2022 08:27:46 +0000
Message-ID: <59fbbae1-c454-e40d-12fd-7b86b459d2ad@nvidia.com>
Date: Tue, 29 Mar 2022 13:57:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RFC PATCH v2 3/6] ASoC: dt-bindings: Extend clock bindings of
 rt5659
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-4-git-send-email-spujar@nvidia.com>
 <da414b44-1bec-5918-84f5-9dfff2009f41@kernel.org>
 <53d77f33-27e8-3446-d758-3e545eea2db4@nvidia.com>
 <5e4e11b5-02b8-e03e-2924-c9f2882921be@kernel.org>
 <fbd9cbfe-d653-d6d2-e55c-fb80527bea13@nvidia.com>
 <a06f24af-ea9a-c787-ed09-438c019c63ca@kernel.org>
Content-Language: en-US
In-Reply-To: <a06f24af-ea9a-c787-ed09-438c019c63ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To DM5PR12MB1579.namprd12.prod.outlook.com
 (2603:10b6:4:c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3403dfc-3f9d-471e-ec17-08da115e0098
X-MS-TrafficTypeDiagnostic: DM6PR12MB4796:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47962493173EBD36DF3AF00BA71E9@DM6PR12MB4796.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qF/YBkOoI2oCN/yhVC44Vhw4iZNC94DhT2BiXzRgyUb1D4sBMHT8wzQqGSRGtbPi6PRuRTy/74C2X5r/Lvu+hBYhJWHJrnN+pXys5OcOycLiVkddGPNOcylwu8+OW25VXGMPfde0yZn6fb80oPg5assz252XgphenjhbHBLyFK/iku/831kOCaoZq5a/wu/vesUBJfEW7JpmpPFE4sDTQ9im8EsZuBBQ9uRpqqoVJsl3faYa6BQxE5BjmA/XMqwH43cBdp+KAz5Brnj9HP2xMAS8KfNwtHjdH9UTP6DmdpFdNQFTLmvWcg3jj6zCM5YDMER3HDss209lW1MKqmGZ6R8Tsd8wYELAWQp/a16jrRZGwYdV+wlJWJh5MBIJqgN7pE1WRMhfD9uOLJ9iqLOTvutmLJFNYL6AHqFnYKkyEmnMYBrAD5k3augkInLJw6KqotB/nPhr1xIwStrFnm4gPSKFZfAxn7r21xxT9rlpPpIQlx4pQU8fuDM12QaeriLddedg4WHu4W+U1Lo9/+bVM0PxkWMv/EmeSG/O1f+86haURuZsAI+ZdC0byvZ51b+RzMUL9c0fcd8Eftu14qmqTa11XHoYzrf5fZH3VETBKbXEBdY8+eR7qEZ2PKE6sHDBbyrJtFjT8Y4aeafHjWtwpqIazoB/undse3Szx2+6bbUXj5FmxqAbUQPEsYODgkQMvvF9EnU9nWk0GNfP+BQI3zkj8Nnl5N4+zbO7OQT/LaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1579.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(38100700002)(508600001)(83380400001)(53546011)(6666004)(6506007)(2616005)(6512007)(26005)(186003)(6486002)(8936002)(2906002)(7416002)(8676002)(66946007)(66556008)(66476007)(36756003)(4326008)(5660300002)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy9NdHNYME5kSWZRMFpYUjdsakVwbElOUVlxWTNZYmdobVZ5Zjl2T1IwVU0r?=
 =?utf-8?B?WnY5Zm5xdnFjWlEwczdJVGJOWXJ3d0kxdUNZVXJjdzZQVUdlYXZncUpIK0FO?=
 =?utf-8?B?dDdvMFEzd2xkOU1XQ01CM3Q5SkdKelFLc3NOL0FOUzYwU0NoaXAyditrcytM?=
 =?utf-8?B?dFB3d1BmRC9tV0RhK0tqUTRNdmw1RnlnYkhjelMvOVRoMFBjM25xYy9NanRy?=
 =?utf-8?B?RnczajRPQzhITEpVSktGWkptamlqNUJ6S0NDSmtOREhteFl1LzhhUlp5THdx?=
 =?utf-8?B?VWM1SzJWTThibnFDMDA5S05FSHBrbWtjbUY1S09ZR0R3TUVuQWJGbzdha3NP?=
 =?utf-8?B?dzVKbWg5Qmw4VlhoaFRGKzNUYTlRUTdsOWQzNFE3QTJxQXJQMlNKazRLbEFK?=
 =?utf-8?B?b2k4OUR0c0RRT20xT0I3Mk5RSGFsL09SQWZwd09vN29NRTB4NXBsQklOeit2?=
 =?utf-8?B?eXZqT1VvQUo2d0lmUmg5QWYvMUFjZXplVzJPbHpKQUVjWlRYeW5XaEQwdS9R?=
 =?utf-8?B?L1pLNmRSdFE0SUtDUmd3b1U5OGRrdFZjQ0dsa1NCQlpOUTlKdUQvcFNsMms1?=
 =?utf-8?B?ampxTzM5R21Va1RSaEo0VlEzNk11OVVvN2Zwb3NJU0s1WG5NTGdqSit4dzIx?=
 =?utf-8?B?dzJURFNrRWZQMFdFRVV4NWlGeC9OK0RQbWxUWE0wdVJOd0U2RFZ3RzFtTkRm?=
 =?utf-8?B?dTFROW50aTZxUHFFVEhqTjREWEdzd1hEQXg5b2JzME9pdDV5VktIcE1OaFk0?=
 =?utf-8?B?TUNoYjFWdWQwK0tJamlBblprTjhWbzJvM1FnbS9YVG1jUjJzbk1mdzFXaDZk?=
 =?utf-8?B?OGZxTTFLZGt3MXdwRFVQMUY1Zmdtcmx6TklTQTFPWktMcnU5ZVJYSGZjZFpy?=
 =?utf-8?B?anBsK2ZJY2hJVlgrQjk3bFpMZW9jeWt0MVJsUk8wM01jbC9TMXY3NVlnQ1Q0?=
 =?utf-8?B?bld6WldFSVBpWmZIWWVSMktDTnZqeXpFT3N3czgxY1A0Uk1kUktYWC9pdDhO?=
 =?utf-8?B?WWI4Nmo0R05VaE8wellLOURmbndCSElFYTdPOGptL0ZTYlMxdEpxeVZtRTFx?=
 =?utf-8?B?Lys3ZUJjUjg2dmdYYllTbEJldU9yUllxRVc4UnMvODd4djVTWVpVNHAxYUZL?=
 =?utf-8?B?TncrZzR5eWtlWm5zOU4vRjVRQStIVVUrNnZNRkg2d1hPQjBpL3hQZHhDVXNm?=
 =?utf-8?B?U2wwNzROWEtyd3pBU1dLMTBzdGhyL3NwbWY5UlpsZEs5Qll4Szk4bFptM3FD?=
 =?utf-8?B?bXdLcUVxMXhNY0xibFArRXRDajNja01vUE8rdjk4SEI2Zkh3dC9UcnJBR2pN?=
 =?utf-8?B?STZhN1M3cTlhSzNsS0RtenBhbnZveTZ2MnFTQmRjZUFGVkdRTlBzT2x6N2M3?=
 =?utf-8?B?NldvR1ZCY1dBZE5uWURFS0VUTDlma0NVM1ZYcnRHZVpibDc3MlY3UFQralZE?=
 =?utf-8?B?VnRwODhtaGNmNHROS0dzeUU5V1pSbWVCdmFlZEx2Vjg2bGJTQ0lGUkJuTjF5?=
 =?utf-8?B?NlU3Uk4veDVhS2tmaW5jSjBJUHM2Zko4MVNreThPSXRuUUR2NHBSY2ErcDUx?=
 =?utf-8?B?bm9BbjAvS1p0a25pelV1R0RKdWt5eTdFaDVxZ3Q1ejM5RTRPdmFqR0pIUmli?=
 =?utf-8?B?U2RLbmcvT0pnNXc2TXNxMkFYSVRUajhmL2oxT0RoZWNzeS9BZm94ZEJXaGJV?=
 =?utf-8?B?d0hYb003bE85cUoyU2pPMzdkcE1CbVE1Y3VRRk1Pdmh3WXRhTFFHWXhPZUlV?=
 =?utf-8?B?NjczVWt5My96bW9NL0I0Q0dxTTZhcm1ES0ttN0I3OWUrZFU0UnRBdGJGdCsw?=
 =?utf-8?B?YnNzQ2FYQVVCQ3lPU1JzcHU5ZjM3cnExb3JjbGVTQUgyR1ZnR3lRM01vcmd1?=
 =?utf-8?B?NG9MS1oxb0UwZzZQSjZtdHkwR1BjTTF5UForWmdrdDVpd001ZGxkK3FnSjNV?=
 =?utf-8?B?Q2VkQlVvVDVkM0JRVnE3VTZyWVp0REYrMHRLUUM1QmxacTI0K05wTCtoMVBI?=
 =?utf-8?B?RGs1bnJpUkRKV250SlAwNTh2NHJIKzRSUGd0L3lJTUJkVkMzRS9QTS9pS3Yz?=
 =?utf-8?B?NTVielNMM0NCSUlTd0Y4UzVtY2I4VDNoREkvTkdIUEpKOG81bFI3Nk42QkJr?=
 =?utf-8?B?ZjN0VGw3aEtkRm1yVFA0S015eVlzVzFvS0FKT3F5K2NodU4veEhDdHdXM2pF?=
 =?utf-8?B?YkxMZlk0S1BaQW1PeS85MCtnb3puZytqTWVKLy9WZDhJbW8yM2RHMnBkQURI?=
 =?utf-8?B?ejBHMjhXTFV5dll3SDZMYUdsV2ZhaHdDNG0yT0FkcTdqZERmMjFISzZmVjla?=
 =?utf-8?B?TEVpL2h3TzJzRjNONWhnYkFsM1huZUMwUkhhN0lubHdIdVNrWlMzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3403dfc-3f9d-471e-ec17-08da115e0098
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1579.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:27:46.5028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rngT66t7eS+/SKjH6/g9jbKuuMO4MVzAIgIVf2g53DYgaAxGTLY1Jf5fme4K8ufPGLE4rySU1fu7WQxCR4Nkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4796
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


On 28-03-2022 18:58, Krzysztof Kozlowski wrote:
> On 28/03/2022 15:19, Sameer Pujar wrote:
>> On 28-03-2022 13:37, Krzysztof Kozlowski wrote:
>>> On 28/03/2022 09:58, Sameer Pujar wrote:
>>>> On 28-03-2022 12:36, Krzysztof Kozlowski wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On 28/03/2022 08:14, Sameer Pujar wrote:
>>>>>> The rt5658 or rt5659 CODEC system clock (SYSCLK) can be derived from
>>>>>> various clock sources. For example it can be derived either from master
>>>>>> clock (MCLK) or by internal PLL. The internal PLL again can take input
>>>>>> clock references from bit clocks (BCLKs) and MCLK. To enable a flexible
>>>>>> clocking configuration the DT binding is extended here.
>>>>>>
>>>>>> It makes use of standard clock bindings and sets up the clock relation
>>>>>> via DT.
>>>>>>
>>>>>> Signed-off-by: Sameer Pujar<spujar@nvidia.com>
>>>>>> Cc: Oder Chiou<oder_chiou@realtek.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/sound/realtek,rt5659.yaml  | 53 ++++++++++++++++++++--
>>>>>>     1 file changed, 49 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>>> index b0485b8..0c2f3cb 100644
>>>>>> --- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>>> @@ -29,12 +29,28 @@ properties:
>>>>>>         maxItems: 1
>>>>>>
>>>>>>       clocks:
>>>>>> -    items:
>>>>>> -      - description: Master clock (MCLK) to the CODEC
>>>>>> +    description: |
>>>>>> +      CODEC can receive multiple clock inputs like Master
>>>>>> +      clock (MCLK), I2S bit clocks (BCLK1, BCLK2, BCLK3,
>>>>>> +      BCLK4). The CODEC SYSCLK can be generated from MCLK
>>>>>> +      or internal PLL. In turn PLL can reference from MCLK
>>>>>> +      and BCLKs.
>>>>>>
>>>>>>       clock-names:
>>>>>> -    items:
>>>>>> -      - const: mclk
>>>>>> +    description: |
>>>>>> +      The clock names can be combination of following:
>>>>>> +        "mclk"        : Master clock
>>>>>> +        "pll_ref"     : Reference to CODEC PLL clock
>>>>>> +        "sysclk"      : CODEC SYSCLK
>>>>>> +        "^bclk[1-4]$" : Bit clocks to CODEC
>>>>> No, that does not look correct. You allow anything as clock input (even
>>>>> 20 clocks, different names, any order). That's not how DT schema should
>>>>> work and that's not how hardware looks like.
>>>>> Usually the clock inputs are always there which also you mentioned in
>>>>> description - "multiple clock inputs". All these clocks should be
>>>>> expected, unless really the wires (physical wires) can be left disconnected.
>>>> The CODEC can receive multiple clocks but all the input clocks need not
>>>> be present or connected always. If a specific configuration is needed
>>>> and platform supports such an input, then all these inputs can be added.
>>>> I don't know how to define this detail in the schema. If I make all of
>>>> them expected, then binding check throws errors. If I were to list all
>>>> the possible combinations, the list is going to be big (not sure if this
>>>> would be OK?).
>>> Thanks for explanation. Please differentiate between these two:
>>> 1. clock inputs connected, but unused (not needed for driver or for
>>> particular use case),
>>> 2. clock inputs really not connected.
>>>
>>> For the 1. above, such clock inputs should still be listed in the
>>> bindings and DTS. For the 2. above, such clocks should actually not be
>>> there.
>> Thank you for the suggestion.
>>
>>> How to achieve this depends on number of your combinations. IOW,
>>> how many clocks are physically optional.
>>   From CODEC point of view all these clock inputs are possible and a
>> platform may choose to connect a subset of it depending on the
>> application. The binding is expected to support all such cases. To
>> support all possibilities, the total combinations can be very big (100+).
>>
>>> For some small number of
>>> variations this can be:
>>> oneOf:
>>>    - const: mclk
>>>    - items:
>>>      - const: mclk
>>>      - enum:
>>>          - bclk1
>>>          - bclk2
>>>          - bclk3
>>>          - bclk4
>>>    - items:
>>>      - const: mclk
>>>      - const: pll_ref
>>>      - enum:
>>>          - bclk1
>>>          - bclk2
>>>          - bclk3
>>>          - bclk4
>>>
>>> For a total flexibility that any clock input can be disconnected, this
>>> should be a list of enums I guess (with minItems). However please find
>>> the clocks always connected and include them if possible in a fixed way
>>> (like this oneOf above).
>> May be I can list the most commonly required combinations like below and
>> extend it whenever there is a need for specific combination?
> Yes, this would work. Relaxing such constraints is possible.

Thanks. I will update this in next revision.

