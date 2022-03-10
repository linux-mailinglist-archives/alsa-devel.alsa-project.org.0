Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA54D4BD5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 16:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295DE1E0;
	Thu, 10 Mar 2022 16:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295DE1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646924484;
	bh=1os9EgHluyr2An2wsmuWKoV2xVLgIV+OJZIgH6O/A1o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8v4yZGOI+OElF15diGdguRzCikav1+yxgb30fg4AQkUYEOjr1us1Uk+xxnc+2blY
	 lIn75S7XP+pOkSRiDX1G6g+PMTAKDGEhKlrcNDt8WJTh+iKCd7gXUQASlQ263xeoj9
	 yTNgaz93g9nmIIBwf4p7WjX4M04ghDElCRNoFP9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE3FF8015B;
	Thu, 10 Mar 2022 15:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 612BEF8013C; Thu, 10 Mar 2022 15:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9552FF8013C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 15:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9552FF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="hE0VNzk6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl+Ntez3BR4C96YH+R59cVjht52EE5lE5Nf9qP96Qm0naKY3qC2GrwhxbxD+jmQyjGeQKzIWlEbxIJRSqKjxF6s6Ao6XEPLN+vQfmLJtCE2SWg1cyZBTGVuZO3Z8zSXE5KYHWVnACbbSfbuCQECDIkQbw9/QkrMYo/UrR0dK3wHUEMq/dPKdjDR9bG3y099gfGZFRWYzRwkPhSp9YeIh/Ns5M84q9PwUo94zLc/2ksLY5sJs4CMfKERSu18qvq6nCmFz7k+0FaYpEb+bmxuMKbj7YJaXO0CFu7J+I2VdSCT+/ZDyd0FbzSc7y6KNFa/kl7ZR/Vb6PGtQBDTAYvXSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvFe9HM1KJdEPBWZgx8hOdE6m6UrjIf4ysbNyeegMZM=;
 b=hz+00BCphbVnwuJbuawH0sMQTPNF6Zp9YXGZuOEeQvN62dhdsD+RHJSyB+lFj5KlHKkt86olJZ79aVL2OmTpCM0CO2sA3yVoAy3TlbrmlnxMKGo3NtgmBmNkSe0Ajcny2JXjh65eHd1wR4AoPo0gxtl6QbweMxy+Qj8k0U9xBYDXH+klnt/3eJsBXxxmVEjhRCIPsqMKvnt+RSIIAbsuDtpkIo2B8D1G1NxmceMb/NJhlrneOJLWYnZFXhSE7nUD2RtcysZMWJAOkVrdmwYK6l5e26SIpmpVJVgvD811ib9MXdP4zxdwk+9eXksZPUNM+ZBNl8PtVhpsom2QOCCwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvFe9HM1KJdEPBWZgx8hOdE6m6UrjIf4ysbNyeegMZM=;
 b=hE0VNzk6/8ggupD8NpI7oujmvkqZdkHMq4P9YMeeTMu44eMhy9n/XGqq9gDs/TaNjO3GWEbXXbOM6k2rMYZD11lLSGCg6h4l5+GFbwmdktLGXotcrEZL0rJ/596BCvDHDWtA4Z7hszIY/RBp6kmP4wd1qXLPFGWq4NUNdKvahg9D+lMTRKr/vXsBPktp7xGiYfZMSGqkFHPJr7yH7OcfeI2frFfyKtmyqHAPCbUyU0AYXplwmUpcNjj+s/0eOaXGTotdb/+CLsKW01QdLQS8iR0QRhlOeKU8K9LBIKK/rirYYOzKNwWEprDAsbblfP/yRGzue6EchfJ4bWIyXC3g5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 14:59:37 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::a185:161d:ce15:3e07]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::a185:161d:ce15:3e07%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 14:59:36 +0000
Message-ID: <5c531e7c-58e4-2c55-57cb-85eff68b0927@nvidia.com>
Date: Thu, 10 Mar 2022 20:29:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC PATCH 2/3] ASoC: rt5659: Expose internal clock relationships
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1646912477-3160-1-git-send-email-spujar@nvidia.com>
 <1646912477-3160-3-git-send-email-spujar@nvidia.com>
 <YinruZXrpP2bu7lZ@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <YinruZXrpP2bu7lZ@sirena.org.uk>
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30f57b36-40d2-4608-1782-08da02a697d9
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0055C01A87D0FA14B6B8BD3AA70B9@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hl6dFxu29I7go0RadX0c6v4QVHGFlB5HW5J6oWZX62UTwGitiQy+SI64lVcSKBJ0GcaVwRONkYda2OyvqO4UAp7WLyJQZ5hSUDEQ6m9CeFj/Y3xaxaLCIGtLn4a64tiMhwsm4ry2t1x+r77oIZH4SrFl8AW9Du8Tt1aDBRlXCJzXGbCg+EJhbaxRy5VgxuwbNQbxenyfOE117pRwABTho4okZEH9rVq1Tc516iXxFuPP8WSxt0n41pwCDleF3LV6+4UfuvtB5zbfo58LPDPh/fV60Jo4pSduNmhjnmUhg2rcwYvwOeQHXnJJi5C/VhqU6ZCwG4/GsHjOnzmFCEyTtXLmmUo5b5S8uEn1t85bZK9UOcs6rvdhEiSltfU0Kn3M8wKpB3YqTTHmDCw06Yn85WRnRlDyMduZpzIIvkzr2qlrZqBJR2QbAHmH/vBsEjRxeBumlgDQpg1d24h0MIJmPUVHX+AcwbodtPu6+4SZGYWlcL0iLi7/VrnWAK/noTe8P0zME1ChcdQpv8fCzGsdiJSIlxXFBYyLNIsZGiz7wogYPWNbK+ThnJpOweNVGkdP7WKAnCqwU80paHktrn71NgH8glW5FneMqwMHzo1FbZGv3kWGYD2IKuzW7mHJVDpaYTAyzH1Hk9ITams0bKy23K+c9scqYLmcKBCzirNgVK17Baj1ZRi/2l9/+DPfscNh8r1P0f617Zd1WXGDZa5PoVXZdvrHrcf2C1RqUHFPNXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(316002)(66556008)(66946007)(4326008)(6916009)(66476007)(36756003)(31686004)(31696002)(86362001)(2906002)(7416002)(38100700002)(5660300002)(8936002)(53546011)(6666004)(6512007)(33964004)(6486002)(6506007)(508600001)(2616005)(26005)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBJUmxXWHhnRnFGQWtLRWlOMWZuWG11RVNRS2J6Qzc0a25RK2lzNitQMkdJ?=
 =?utf-8?B?V0JYUUh1eVdKTnJIUzhYTGFNNFBVVW52Q05wcnUyNlFmeFVCN1oxV0NaaVdk?=
 =?utf-8?B?bTFEZm1Td1ppV3czUnBEQ2J0cWQyZ0svamJGemZhTEx2UTRnTThDdnlWQ2Q1?=
 =?utf-8?B?Y0xndnRYMHl4Ly8xbjVXVGtMYmRvbXRhYXcyQ1Fvd2xqT0RZZFRDNzV2cjdV?=
 =?utf-8?B?Y09zdW84ZFJiNmFsYTRNbEN6SnpTQ0MvdWlUbTNQMFhuSWVlYnBEd0J2d0I4?=
 =?utf-8?B?aXhoYjhtSUZ1aWE0Y2VGVm5MMEJoTkIwYWd1Y3FWZmNTZGFjWktOZDZFVDgy?=
 =?utf-8?B?dVdxYkFXRGhjMUlKOUJ6ekJNQVJkd3luclZ1L2EzZHd2V2NmdGhpUDBLdDli?=
 =?utf-8?B?ZWdPcUM1Mncrc3cyWmF1dGh4TUhtZEJ3TkhCY1g3TnN6NE8zaG96VHRRa3VF?=
 =?utf-8?B?OGxDcnVqR3o4VkI5TTgvZUtwb1VQeXM5SzI5R2hEZWoxckEyeGdJd0hWYi95?=
 =?utf-8?B?cDVmSWIybWhyRTFObTBsU3JuTGRObjZqRmpiSXFFQ0tiZ1NRa093b3BBQkx1?=
 =?utf-8?B?anFPbnVlNFZORmkrSWV6Qk83bEp5VzZUTFdvMVlzcjZsOThFKzZwenlUR1J0?=
 =?utf-8?B?WU1nOHhXNks1d2NiRGM2NWNVY3ZEQmh6dVROeTFDMmN4YTQ2RmlNUTZ2eFU1?=
 =?utf-8?B?M0RuQ0VUdmcxb0xSeUtlOGN2Y3BGSmRWREdjMWJZR1BMd0ZMc1lYaTByNTFm?=
 =?utf-8?B?YllDRkp0aUNFNEMwekdsNEJ4ZnNmREVVRUE4S1VHQWI1Mm5kK21ZODI0VXdy?=
 =?utf-8?B?ZmZYWnliczhZa0VqUFZkcC81QzBEYTI3bURTVFlHZUhBVkdSV09EQmsvOVk5?=
 =?utf-8?B?N0tQRzF5ZmRXQzVyWHdWRy9FNktvdERsRzc4a2tYeXZCN1piSTc1c3U2cm5T?=
 =?utf-8?B?cisyREVjejJVc1pScnc1cXpiNlVJbUQvK0IvR2d3dHRDMk9oOE4rVWZJcDd3?=
 =?utf-8?B?TmkzcVljUmJLamZ3Qklna1Z3L2xoMzFTOEVSS3ZXTWRNcXZMdFpzRy90OXJQ?=
 =?utf-8?B?aVFzeVdEU1NTU21PeHFSUytKdzgwdldTWFFXNlZMbmRmVmpKVEx3MEx4RzNT?=
 =?utf-8?B?eDl6S1VNbEJKTWtPN1RPVzZJTHJpbXcxWjJYWWRaREV6T2UxSk9RNkVRcXk4?=
 =?utf-8?B?VHFaZUJJOGtkeFgvcklRR00xdzZ6MTYzaHA0UEhFMXg2cHFnLzZ3bjRhVXNk?=
 =?utf-8?B?SkNXZTgvajd0QURCejh0aXlYVVRRdXI0THp2NFJlMFJZMWRvUnVoTklDdFBi?=
 =?utf-8?B?TC85VlZzKzUrT1FZS09jS1VFY0x6MXM0aTdOU09wbWdYK1FLdXMxbDdXN2JJ?=
 =?utf-8?B?cWhWQ055bnBQdE9HVGhOVkFEWjkzL0JPdmg3UnlwT3NBdTRnQ3lrekpqY1FC?=
 =?utf-8?B?UEpBMGxyQmZDWnhJR2EzMXQ1YmxibWxuSTNPOWZwUmc2K05pZ0Z1TU5jbjha?=
 =?utf-8?B?NFRHOUhIdWY2SmxzZHlTTVN1eDVpTFY0OUlmMlYrTjdCUk5NTnR4ZnViU0FD?=
 =?utf-8?B?dmU1dm9vMlV0MEFvblcwQkcwTVNNL2gxNlhBNG1ZeWdSVWFwSU9JTnlkY2Fi?=
 =?utf-8?B?MUd3ejBZR3NJR2NtZ0lqaUlEcHczOG1aL1RNTWJDWWU0WTBRMDJsUGRpTGFr?=
 =?utf-8?B?cnZCancyczJ1Rm5tVG1YSTVLRnVIZ2VMUXRLS1F0NjU2SHNTcTdYeWMxN1dh?=
 =?utf-8?B?T0tFYUcwT2xDZGlpd0JoTTBINlNFbnArVHVnSUhEMzZJclFlYW5EN2h6aHBj?=
 =?utf-8?B?YVk1SGU4TjI2WFFMbS9CZ0lVZTM5czdGeHNZNldrOGhIdzR2K0huL3Y2Tjdr?=
 =?utf-8?B?V3ArL0ZGOHYraG1sVTk0SXRIT0VQWFhURkVJMWJnNzRadjdtQUdlVE1yVXBt?=
 =?utf-8?B?dFg1dzg3bzBJZG5UdVpkRTVnOEwrcFB0a0UrQldRdUQ1YkQwZ1BBL2JIS2w4?=
 =?utf-8?B?Z0g0K1N0Y3owZE42N3pKc0JSdHlib3cvcFJRM2g4cnNHZ2dRZ2dCaEJRVVY0?=
 =?utf-8?B?N21tR29QODNja0RrZmdLVW4yZi9FUGxoYlQwRHJNOENWSGd0QkpQUHErVlIz?=
 =?utf-8?B?Q1lGNnJnQ0hXTktieEphMVlKcGtsUnM4bWF0dVowamdOR0UvODM3NWt4UVBi?=
 =?utf-8?Q?cuwy/wGZA3TwwnZvyLne8bI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f57b36-40d2-4608-1782-08da02a697d9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 14:59:36.6916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CItkP7ZUWmD407DcB2/3XmCBeJbuTheLSA2YIy58PYXbmwRsPxTEdr6O1NZF2/XtoS6foHpyjqfWh5e3iYS+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: oder_chiou@realtek.com, robh@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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


On 10-03-2022 17:44, Mark Brown wrote:
>> This patch uses standard clock bindings to establish the codec clock
>> relationships. Specific configurations can be applied by DT bindings
>> from codec device node. The codec driver registers PLL and MUX clocks
>> to provide this flexibility.
> Doesn't this need a binding document update to document what clocks are
> being provided?

Yes, it would be required and I will include it in v2. In this series, I 
wanted to get some initial feedback if the idea is right.
