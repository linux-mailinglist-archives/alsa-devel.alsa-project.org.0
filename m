Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F6528919
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 17:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E121654;
	Mon, 16 May 2022 17:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E121654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652715794;
	bh=wo+UShN1YZAz47AajLNOOPlOWn8J9pXXmhw9XZolc48=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+UjegIb50rvUHEJ3OgiZ9O23SE3ZZnxmq+Gw88RJ39qaPrteZzVv8iTfuXZyPb1q
	 guJ+SwnHbxz3Fo6OiInGfODkIrmd2lNkLywjjT6souOIfh+DU3MQE7wQKIKEcfzy0s
	 Z9Q0ZszjHEBDjAmCLyjaT8+Q+ZSokPrI5ZkocDTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB160F8012F;
	Mon, 16 May 2022 17:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3034F8014B; Mon, 16 May 2022 17:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70B6FF800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 17:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B6FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YfHSzFRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO42y5pHQWxvZKJmsT1I0zyXdUMpOsPJYC8HNJ7dZPltl4zVMsFuxhd0uaIePEqlMP4sLxq8gmAcDSHLjD/VQCTYHjazEoHUhAtB8OMYmhmUGv6QCp69VqsUSBR+bLJQMtrkHK0MhbzB6ytaHgAo1mW61jeKnegD+K0oQzQ4yGns5wQfoRaiFn6WPldKoz4EZdgC1wciRKS6o7LC3ET0Oan5r5pm2FDeoc/r7Ytg7FYgndFRu3ayrcGP8Gk9ggywLX0amUdrGQFeZyYD7YF50uGhYrCPxulevTOQ29+gYjKKVz+Af5TsppVuvMnMZKXawFt0c9ct+BG+Yyc/HPjYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pin6ioae8FFfU44yv/2UIjXuEFvWc7dUJ4Np/V5sptU=;
 b=EmI3lfKt+xmkIGRWhCa11wIrNVbT2dHfmnxc1MpWcLLAL/FCMbrWXwENDZ4bLM6I1mCJi3DO+B6Rdqr4RMhNYMMSAIOj68LfXnZ3uUTOuf6tE/aJzWpPjkz19BHS3dmQ5RB0qJG1QqYRQbKfEYorm0ZyW2BdE14y7ZFa/DEKJsAjlfyCeOXpB+HoM05OjvXom6l1xse5QM5x4wACL3ywZZ0nK1SEHxXu86Cz53zv95yszDB8NZIWf8lLAEvArU8+AJzAoHhJL0YWhe0KVFxBnqHpPSqDxRmR7Dmv59bldK/PW3Pj/JY/GgRe5NJcAd97G+28TcLDFsr2Cy3linjZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pin6ioae8FFfU44yv/2UIjXuEFvWc7dUJ4Np/V5sptU=;
 b=YfHSzFRzhfNzUjzLaduNAYpqDXp1XMguD/yJqudWqUIbdF0aWsb27MGFc8ytT2alsTQHFf+pcSLIW0om60qe7h/VobQ9yLekXUgGEbw2Lxi+TuLD9LzCIvWNiFiczoGtJdIekf9ZhE4YLKXMrObawcnGU2BLGiNLqB6FN7pPJjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 15:42:04 +0000
Received: from DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949]) by DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:42:04 +0000
Message-ID: <7a6f6eb2-5ac2-0a98-dcce-b777c5bbbe5f@amd.com>
Date: Mon, 16 May 2022 21:11:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] Revert "ASoC: amd: acp: Set gpio_spkr_en to None for
 max speaker amplifer in machine driver"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
 <Yn1MiX/Ie3SJg733@sirena.org.uk>
From: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>
In-Reply-To: <Yn1MiX/Ie3SJg733@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::9) To DM6PR12MB4171.namprd12.prod.outlook.com
 (2603:10b6:5:21f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcbf8942-c82b-4025-b430-08da3752a03d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4093:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB40937A8E4632E90E792427E592CF9@MN2PR12MB4093.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8khqhvc/+1OEgu/SImk+Dggk3e2lW/d6kB7qkLn7WH2h+YBriHHRRc4kZRjgepzVCtmCKSiKsR3AE8CIpAX8U2qisn78+tKjiCMrkPx3nCOwk9+q9ZA821i27rhE8ZDjmvN2qSG3u7GPLdlx0fGQvvnKkszqzPx29y4SwAQNRvuQQI/Q+C1t+xwJgjSMT6LbRc/KlX9tsjttgEoeAOk5pC0MbJp0RzigbHBneP6yI27eEV3u3xTK4tHWT/7gvAM1yExh2oX5vxyAxEohCMsV/AIUbRmRC4NPMF7+B5w3g33/11z3v5aqpBjTSrg/TrsgmhhczZ3UpiGU+PQMYti5FV5+CzSIsJpeAVypkma2j85rVLkQ/eC95bXwyg35f5hol6O/Y9XsI2m/9IOKvJs33sGUU5HpJiver38nIBT4d86LSAxWMmtvLJGnioJT7fcfj0BtUIFy8np8gML0G/3fqLjwTf0rqBnpy7ES3swMxo+HDJgWHEbPUqIEr3fBvd5+9/VsepyUed5cChzNu36nZkxfZ6Qkx0+xlk+a/TWUggHikqg4QRFDq62E87o8dTOFH+0yFrlVazUZLor0ku2oj/OQ/59YRo3OmBeDmNpMPxBPuxM3eLiYNAnWb+lO8HpBFL8ndOkxM+yOubUQ5N9WErBmnYVyzSCMg7VrsTLSawxbhUL2mQjUKc1MyMV80rcz9wFKwCkrrB+sOvzkS8awaywK4LwdxCR81k6Eb9Zcdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4171.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(31696002)(6666004)(86362001)(83380400001)(38100700002)(2906002)(66556008)(508600001)(53546011)(66946007)(66476007)(5660300002)(36756003)(8676002)(8936002)(6916009)(2616005)(186003)(316002)(31686004)(6506007)(6486002)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1lWY0Q4YjJReTNBZ0VhMXFSejBJNW9KZVdIeXBqMmN6djVmZElRYjJ4Wkx4?=
 =?utf-8?B?ZFVpc1Z3bHBGMWFDNEVFM0tXYkZVT1liYjd4dFRodzVDS1R1NE5uaEdMU3VJ?=
 =?utf-8?B?VFBmSXZPKzkrWVNrTjJkTkYxVERJMG9UcVFOZlErMnROcldXbHdPaUtyZjZB?=
 =?utf-8?B?RTdKWXptckZvcjdBaEwvZ2xGOGVFSGJ4ME9hbGk1dERjV3RqcHpyRkRQSmVy?=
 =?utf-8?B?d2xTaUlVK0JXZ1c0TXg1NC9wQjZuWXBQRXllVFRFMGxwc2M2ZHdzb0dSUkNo?=
 =?utf-8?B?VTBjbGlrN3ZMbUZFZzc3SkpkZkRBdkZFT0U3WnlhbjN5NE1CSVk4aktRSEs0?=
 =?utf-8?B?QVlxdGFsMTZUaTlRbXdaVi92SDMrL2xZeFUrbVoxV01LbWZyUXdwZUNDOWl2?=
 =?utf-8?B?TW9ySDRuMWpiZks5b2NzWHF5eEZ3eldMVExlVHpoN1pDM0xaRzdxZGtXRENW?=
 =?utf-8?B?RC9iWmRvc3BrU2J1bGM2WlN5SEQ0VnJOREhSQWllc1ordGtPTzZLQ21mTC9x?=
 =?utf-8?B?WFM0YjBGZnVoK1J6bFpkRVpDTlBucHF4S2MraGwySGt3VXlmQk9mRHdkd1V5?=
 =?utf-8?B?bm9pb0JDNVNEZVg0cmwxb21TRnprMDRsMnVRTEpwMlhJU3RLRC95NEd1SUk0?=
 =?utf-8?B?enhwRkIzb29HdWZrRHd4aGpCbXhTbDJzcnVoNUZ6c1YxVktCSmNBcEhTM25l?=
 =?utf-8?B?Q2M5TkIwQkJFUlBNSS95cTZtMnRtT3Jadm1wZXhRdFp6bVN1R0VURjZSQU04?=
 =?utf-8?B?eGlpUFZUd00xQW96aDdEbWlBRDFmTkpJRUhodU1pTEU3L3dLb2RoTG1Fa1Yx?=
 =?utf-8?B?N20rUmNaUnMrdVZVdThIYURFL0VXTDF3UUxoVzZ1dDBPdHRraG9FWERGbHdG?=
 =?utf-8?B?TzF0bmxrT0JJNXoyRlZoME0rMkQyQU5ITE9UYzNpc2c4N2w4dGY2bjQyelZp?=
 =?utf-8?B?UW1SOFFTWHVGc1ZrOVJYWmY3ckJXWGREeWw2eXZDTW13dTVWLy9iNnRSc1d0?=
 =?utf-8?B?c0Vqd3YzZTVmbDNsZFJQVU0xdVZ3aFRHbU02aDhsUHdOZHV0bDIvUG4rOUJH?=
 =?utf-8?B?bEZUY2dITjUxbzUyZkJQazBQV0J0aUdHTXVaVVVHc2ZaOVN0Mko1KzJtT1Ar?=
 =?utf-8?B?ZUpzNDVmb0F1SlJMWE9WUTlPZG4ydUoyVEZ2T05FRTRkUFRibEFqbms1NVdX?=
 =?utf-8?B?cS94bmMvNlRKLzlUQW1hVzVueWVFNWQ3QTFEaHNoYUVkaTdic0x6SEVTN3hS?=
 =?utf-8?B?NENQR0tacmlpWUtBM0IwN2FzOWNLR0lRTGJiaFE3V05XbnRRQndpRjRaUWxh?=
 =?utf-8?B?TlRZKzlocWRsWVNQQS9Ybk90TjVRUk9FckxsMFZ6K2ZTa05TaHRDVWdwaUdE?=
 =?utf-8?B?N0hwSlJtZmNGRmorbk5MaVA0NllSYTNWOEs5NEM0aU5jZzFDd3Zxb3lzOEFv?=
 =?utf-8?B?SkR6S09IbzdBRjQxQnBuK3pNbEQrRjd3T2Q3emZWVVFndjd3MzhFTGNiRVJB?=
 =?utf-8?B?SzFjQlc2QitDdmlHSkpqQklVbFJwNGtzRDByVUI0NnJKcVNLbWMrZi82all4?=
 =?utf-8?B?QW5rUitxNFNVRTZBMHBzUDZ0aEptckF4YTRUUGw3Z1ZEQWI5dGxjQ3NUMXRv?=
 =?utf-8?B?dTJzdkFBOHViK1hVdmdXWWhyL21oVDdYOUJtS3U4aDYvZzRyaytlSzlrVFFV?=
 =?utf-8?B?bVAyc2JhNUxIbHlVV3ZvVFFUb1AvUjZ1clMwQ1BFd2RQamFKZXBoTWFnVVl5?=
 =?utf-8?B?Q0V3TjNwMElFTElvRVdyKzExeVh3NUZqZEtkR1BnSXI4VUdaNTJ6Tms2TVNI?=
 =?utf-8?B?eWhvSjZJVVRmZUozc21Sd0x2VnZ4V2R1Q0d1TTJsM2Rhckpla3paOERLVzVY?=
 =?utf-8?B?N1JzTk5vNE5Ga2RrTC8yVncrWGtZUzRNWTlSdUdzcVVpRnBybFlrdm5EZzIw?=
 =?utf-8?B?SXN3a0x3c3dTSyttMkZFeVlja1FWcXFRdURJbW9HMHRYNS9leEdMQnFKcy80?=
 =?utf-8?B?L1dZRVQySGZnVklGdE1janFrM3JIWmxTcTYvK1F6bXh0d1k4a2dFeVM5dWVj?=
 =?utf-8?B?VDZZaElZaU90cGpmUVB2TjdsbDJDUFh4Z3ZicWQzaXlObzdEYmZrelIvaEpV?=
 =?utf-8?B?VytsVVVZM3prajcrVHBOc3ZzcXI5R1VkaklWdHFmR3JWblc3cENoZ1dlQ3Ba?=
 =?utf-8?B?TEVkcHdkQlN3QjBDSGxoUTZOdnZhWDFSY1Y1RmlaTmljSGtwZ2ZnMThSZHlz?=
 =?utf-8?B?T2NHUjQwU3lCOUIyRWhhdTFDb0pWc1lTV2JrbklsUW5aM2RwS1A3eDl0ZnpN?=
 =?utf-8?B?SG5BdlJZT0pjT2R3SVl5a0tnVVNOaGpYdHludVcxTFFYS0tFMjA5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbf8942-c82b-4025-b430-08da3752a03d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:42:04.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTfTUMmehMgL1cIs4IJUE+smLUpgOxy740GgDx09Y8xcA4AZw20PM5jkY/pl+lbs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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



On 5/12/22 23:36, Mark Brown wrote:
> On Thu, May 12, 2022 at 09:10:22PM +0530, V sujith kumar Reddy wrote:
>> RT1019 codec has two ways of controlling the en_spkr.
>> one way is controlling through gpio pin method the another way is through codec register update.
>>
>> Now Speaker enable/disable is controlled  through register update in BIOS.
>> So this patch reverse gpio logic, which is no longer in use.
> Surely this needs to be keyed off BIOS version otherwise we'll break
> things for systems where the user hasn't updated their BIOS?
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.


Hi Mark,

There is a mistake in commit message,Speaker enable and disable is 
controlled through rt1019 codec driver not through Bios.

Apologies for the inconvenience. We will update the commit message and 
resend.
