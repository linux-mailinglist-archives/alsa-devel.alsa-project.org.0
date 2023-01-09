Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5346626FC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 14:27:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B0CC6A6;
	Mon,  9 Jan 2023 14:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B0CC6A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673270862;
	bh=fe9dHrEkHzsPGEBZXjjai8mowtioFKyHh4TVGIX7Ubg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UPmN3tGLEQ7n+TtiiFY0cp+YC/RSuTc0BusqxBPBhaD8d0+q5Jypa0dfCMSPHTPzb
	 rr7/DCV5G6R+udhgUhGO7HcDrdRnFkKnV2S2hz1Vc/i9fZhevIDcpMTj8fCZuBSVtj
	 BlHa1AGJ8Pkt9PqUSHAMKBFRTC+Prrjpgcupnioc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FFFF803DC;
	Mon,  9 Jan 2023 14:26:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CF7F8030F; Mon,  9 Jan 2023 14:26:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A74FCF80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 14:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74FCF80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ohdb8s1c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2ORRmSTTwbkLQVM/OOnBK+dxT3E2R3M3paA2a37kpCJKDqqbPzj/IEHreKgJFaGRvS8Wcr5P5ixTNDtSWe7zcWkVeijYV6Bxukou5PiJyI0DxkReAK22HqcCgq4sFdekFutgA/52kquWocSv0ETtN6LWsjOKti8zAe2kQS1zrMvXa3r9ze6H1jXV3eqeGpFk9pNMcbde/Ssuk5r7haAT+3jKV4Ti8TM746hV4nNr0sAn7p0b/bFVAhwnn7jw/ijCqnNo9VZJ5SnTSZRX9rhu/q5zu+g/D9KOj80HNRhwiapdRUo6ZDmwBX+SW16DGeaC9kz0hPFhupiGDL8nBHPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8bw3C3eMy8ILTsTbuP90y3Ub/stVhtJ1qGAc6BAPb8=;
 b=ObMXV/9Q+vITQWu1ke06NGrf2fAdxGh3JYI+SSCU0eDxsyXos86Kl1wb0DpSOas7vN2aWEiNZFZkb8IE2z15kkekJOac7+qJELW7o7Gk1AU1sZSjenUpk8ghYT0q7h4Xy/3K6SBMkWWPIc9YL/Ke0cCtGXIg/sbBQjMBl1o49qLJm5785pDR6wMCBsAVVZqr8CdhQYxcwaKKO7HX/v6O3aSW4wul+Q/0kh4S78subBarihWZ55GqEvIsd0GyRaM0ydYE8JG17zz6q0DJ50SksroI6mDVNz2W6U/aDxAAlZbMid3kh1O/BlYhU3cd/gXNk04CVSuS3CAI+lnxdhE8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8bw3C3eMy8ILTsTbuP90y3Ub/stVhtJ1qGAc6BAPb8=;
 b=ohdb8s1cup8tmj6JvAwtAVip1JFLeAmRoRUtkpRuPKINkY0irVewYZDS0w4UITUwnduR5faDah5lSsG7LV0mcKYrykXDCJwQRcmAx61fnPWB6kWcKwfZF1attf98YRqH69DCzHUXl4EtJuIIUnGksS2gDURphIPkfoaMZyCck5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:26:36 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::6437:4a32:ae0e:65a9]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::6437:4a32:ae0e:65a9%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:26:36 +0000
Message-ID: <54b2f33d-ed2c-2f0b-3ee2-f4d1f05781bc@amd.com>
Date: Mon, 9 Jan 2023 18:51:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
 <6ebdd688-a1e5-f687-2842-b5005fdd89db@amd.com>
 <Y7wO64ZkCeUPWVB6@sirena.org.uk>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <Y7wO64ZkCeUPWVB6@sirena.org.uk>
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|MN2PR12MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: 4086d570-ed3d-4117-2d0b-08daf245219a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9CURTZPQfNOjMksrdfdj9Xg5ZFgmcWxEiUQrgtAFPVerabDM2OL+gIoZoTrvcJAASdcxbNGXxtHq6BBhlLlyYIotlN6Rxwx/jbDULv9y0BJOpzr5Nptr+h4cV24MKP3OuB2Vjc6T1qwYV7i02ThHFl4CV3VbrCngX5em56R7PkxyxprLyq4UO3sfYcSxoSwk1xXzXYRGGIF4BjlqAnHx8topvbnSBhegccH4znihVJds7ym3rrcT7JZyO4xdevj2Vjj0fkpOwuQFXnDNaERKuzL0EfLN5eH+PFdyVJjepjwv7wv+Y9hKVV0z5s2H9wk05QGlhGuQ9rMPrefyH9phxpPQib6Cj0O9TAvRYdeKTRRMKdEn03TtiyutXTVUavieM9DQYMMIMHUGNQwno9GX6RpmxL+kHGy7/czrU+Yyru8IbuvfQ5tBjZtmYhzdwWO2JVx0Kc5ytViiRDcC6MHlIdsfS4CjllAC0Zx6JYORmUKcf+SThcSro0y9UIVoMoZeG0vbkq2PE7yFX0PfGk77AA+71HpQPUZee6W8Y4GnYLMnzUX66DYtwx+6WtU122fcXByBEPi21ArsxLLRE3CB/GMrG9n8bCnpEnvt35ufu5seSqL1Ow/OnQRTq/CZQpju7UVsrrjg/QWJrYdgcVGwelWsfsi7MYS1n9KQ6UMnHMTXGe2PilByL+nW2h+EeCgGZVu/r9cqmKdzrB9W/7UidAt87MmodtssdM+ipjO87g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3661.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(316002)(5660300002)(26005)(6512007)(186003)(6486002)(478600001)(2616005)(31696002)(41300700001)(6916009)(54906003)(4326008)(66556008)(66946007)(66476007)(8676002)(8936002)(36756003)(6666004)(31686004)(53546011)(6506007)(33964004)(38100700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0h0Mmt1aDVUMDZKbFRGMTJibW5ycmdjZnp1NVlIeDUxMUpVYlpxdWZLa3RN?=
 =?utf-8?B?b1BmZmtIYWNWSVFPR1N4UVFJWEZnekdHcUZoeG9mZkxrSzFxWWpWbEU0d2J0?=
 =?utf-8?B?RXJSTVBGOGhOQ3ZORW1lcitIeW8yV3I5UG80V2hQOVJ3ckVzeHlSWkZCSm1Q?=
 =?utf-8?B?WVpVMDc4cXRObTc4czRvOVZ2MWlRVWcvbk1hektKTGJBT2lJQTRzemVBMndZ?=
 =?utf-8?B?OTgvV0QrUWhvNDBoT2dKK293UmY5OGtHNUF2aVBDNjhUMGF5d1JuZk9BNXJl?=
 =?utf-8?B?Y3hFWHZmTzVpbm1VS3ZPajJteldtWFpLTk5nNXhKQW5EbTVGTUJDOEwwVEdj?=
 =?utf-8?B?d3lBNlMrbGxlZ0tTN2N4dDhETmJ1azZNa0p0NWxDTlNHKzQzYnk0ZFVLbVdw?=
 =?utf-8?B?RjFuSjBzVXY2MEVsS3FFLzB1a0M1R2FhZE1oR2FxT1cyNGdaRWVCQWY0VTFE?=
 =?utf-8?B?a1o1cjVFTzVwcjl1SmNLQjU2enJpYjRPOCt5TWlJUHVuMzEvUUJiZXVWeUVJ?=
 =?utf-8?B?K04yNmVuQy9pdWgxay9uQjN6WFpCMHhlbW85d1pFSVMreENTZmlGb0oyUGtn?=
 =?utf-8?B?SWZKWkorUXVINngwSDA1NlNZMms0TXMvWnZyVUVDTVFpcHVMdXZxT1MzTGw2?=
 =?utf-8?B?NXBuYSs5S2hJaDhkdkRSc1ZBWTF3ZXprM0lZVW0rOER2dHRoclZWOUY4a1Zm?=
 =?utf-8?B?ci96dTBZOG5GanI2Vmd5d2ZZNE5uSU9jOUYvWjc4dlJLU1JVZkdWYUdOZFQy?=
 =?utf-8?B?QndkTlpWYnFTTjRCc1dMMThCekprUjIwMmoyWWQrVmdTNEZ6SytCTklZTVZv?=
 =?utf-8?B?ZGcyVXh0MWJZTUlxNDhKY1QydGVwbUVCbTl6NFZySzBvUDdBN0pNWVhWSnlU?=
 =?utf-8?B?cDZiMWFkditHVXdyVWtacGNDV3YybUNFalVpTVl1bjVheVlrT244KzlXMzhl?=
 =?utf-8?B?dnQ3Q25aTnNMUFd6Wms1NnM2M0c0VjlUTHNYZXdSSkRHMXkrajl5Nll5VVRo?=
 =?utf-8?B?c0lMTDlCSE5EeFZWU0dlTXFnM3V3aENya0J3bVZPeWlZcWhzUSttdzAzTW5u?=
 =?utf-8?B?K21UNlNNREhQaC9GaHdzODhmWTk4cFArT0JCOXdFRHhpTkhka2RtU1BzU2lZ?=
 =?utf-8?B?OHRtMWNSOGh2ZmdZeCtsQWFyZGtjdk1JUUNTT09zU2o5L05sK1BWZUkzY1NS?=
 =?utf-8?B?SU0zN2w2VDdMN1M4OTNJTXVFalVyY3Yya2JWWmtnY25kdFp4RDN0VFpLd2xp?=
 =?utf-8?B?ZjJ2dy82VjR2c3AvZ1VKeWY1VjdWTHQ0T2tJZHFqU0tFYjdLY2YvbVdNK2JS?=
 =?utf-8?B?QXhDVlA5RkFMUkVINEpQYkNIejJyeC84Rk8wWmo0Uk9oUUhCaUJqK1FFYVc4?=
 =?utf-8?B?eWtCeFQ1QnVjQ1BKVzFFRmpudThZUC9HT1h6U3UxNS92eWZkU2VTaGM0aWlV?=
 =?utf-8?B?bDg3V2FuMXpZOC83azQ4YU01ekZLR2RrbHN0YkJOK0t4OXpHRGJlNCtWWnFx?=
 =?utf-8?B?em1vRFd2U2hvUHdOWXZtSjVmaHBJdy80RlVBUUVZQlZZeWNNVjhuTnhDaC9y?=
 =?utf-8?B?K1BFbnczYjJiZXB6bjVuRUROc21yVFdkZkFxUmx6Z0YyUWNXQVlXZCsvdUZ5?=
 =?utf-8?B?N3daSHR1UlhWenluUG9BNTNkbDlTYmI1cjBra2QvRVIwajBYQ09TNnRRVHNV?=
 =?utf-8?B?Vk5ZTjBscHA5YkxDSmdxSVFUbXRyS2ovL3ZPRUxqUlZQM1d2VkppRzRNd0Rh?=
 =?utf-8?B?cE9ncTd5cWpKK013dzc5Z2x4Z05hcXhhSjVQOVRqUXlFRVBBT3pWVXNiQzRj?=
 =?utf-8?B?NVByeXFmU1N0Zld5MEZPRDI5SEFSQmdFMFRWeEpsbEs5Ni9FdkNvd1UvUm9q?=
 =?utf-8?B?Qm9IYXRGY2xsbGIzYTNLZytZUUV2VE1TQU11bGhjOXlneTduN05TZmVORERj?=
 =?utf-8?B?WHgxYm95VUtNbVV2Sy84TmdIY0g5U050VGZKSkZaOEJkNENZV2NvNWwzeXUw?=
 =?utf-8?B?VGIyUWwwellKa0NwZWltWTY5TVlWd2hpNWJQZktOS0FPbjUyUldJZ1hlS1ZZ?=
 =?utf-8?B?RzdtMDEwZE1tMWZZSjhCWmtHS1YvZm03QTNvMFV5K0JFakFZUnNRY0l3Uk1I?=
 =?utf-8?Q?QvaJjkRv5C3DGVrTgT07f8anz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086d570-ed3d-4117-2d0b-08daf245219a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:26:36.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/ePVGTLWbMekwKZSvmJMs3ZX82q3lY2HjPtbDEAqkBXSyUHrDrt9p+v/3J7JvLXzmgtjIl1PPDOaEaksdq9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Syed.SabaKareem@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 1/9/23 18:26, Mark Brown wrote:
> On Mon, Jan 09, 2023 at 05:00:11PM +0530, syed saba kareem wrote:
>
>>> Suggested-by: Vijendar Mukunda<Vijendar.Mukunda@amd.com>
>>> Signed-off-by: Nathan Chancellor<nathan@kernel.org>
>> Reviewed-by : Syed Saba Kareem<syed.sabakareem@amd.com>
> Note that if you use a different name (here you've got capital letters
> on the words in your name) or misformat the line (you've got an extra
> space before the colon and are missing one before the email address)
> then the tooling won't pick up your tags.

corrected.

Reviewed-by: Syed Saba Kareem<Syed.SabaKareem@amd.com>
