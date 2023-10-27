Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 697607D9EEC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 19:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577BAAE8;
	Fri, 27 Oct 2023 19:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577BAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698428045;
	bh=uidKYrEtaUK6htJrOFFFnfE3a67t0H4mDb3uZjK/0YY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p3M51ACkBBI7ZzmLv4/e7J8tjUsbLx0/LYBXcGdoPQ24WtowHGlZqjdVDDQ9tVc0m
	 SsRqxDTN6uIFdwoPhsWi9xODVsYhmSaOXk05wjTASXM0QbkbYr4fe8WZOIFuy9Y2vG
	 eQGRzMvxU6WvWK1Y4ohEyzMv7pvO1ssNTX7tYUB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1F36F8024E; Fri, 27 Oct 2023 19:33:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F33F80165;
	Fri, 27 Oct 2023 19:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A1B7F8024E; Fri, 27 Oct 2023 19:33:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C324FF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 19:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C324FF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WlvwLzCc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRyr8XG3vabOFQbS7QJxRQCSUYhcRDWI9dhsEsfmSfJmI+rsnm2Wgo0XYDRIKDYeg8DcrJOrheqdKP7YHvU2hiF2V5zbLJkyuHo0MGl9dga6M5Y8hwMpIDv1n35TBTpOOS0qXAfYWg3BK4hlJpTW0GOfsFGnqrnaxbcGczbniU9jQyAcLNfSYxjUhPgyV462nBYNTkUCBMfz4Mmxs0WKeKF/iRj6OSyfNWiJcGghDNDlPoi8vamEKdt7yuxObRwARXrxrQyVsnr4gMLco8Yvb4hMOlPU7pH5qGheOfcPFTCqdOw4PQmOZk1h6SWYAZ+EJbk3nLoYjVecxjs4MKGkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD19nl9Q8O6h+Jive3ngdNU/Beg9G00Ud88TXfazVuU=;
 b=P+KtW4Z/cD62z5RlQ+uOK3yB14IEslsxBjC/lICUdCsMxDs9sEono9hUWb7Q+AYfq6Zdhe9oPyyWSJRGy7uvF1LYcJeQsy9NNy1Q6KOdHojSK58lGMCFBJbUkkx+Eq71gbDl9ymEIS9AwX+ht7ecvVWxNy1CVi1ESqrBKT0T/yvfhR59ckOjK5C1CP2dJ9BT8mv34sTN8hcqjFBuZPMrXOp1UEY/AvVfAKHakqN1ZEPI1iBPM+FqPWIlqbO6GGNX/YDLWpUfMixRR6uLcVjINSJDqrkl6Td2M1ittn+5UDD4cSDr8l+PXeKBeteiNHGxbenSryA3Vh541nW5vMhgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD19nl9Q8O6h+Jive3ngdNU/Beg9G00Ud88TXfazVuU=;
 b=WlvwLzCcHK1RMjsVxzCWGN8DV0FgMjoWzz/42+9YPBIT19Xp3Ma0p3P5TVrm5oxoPux/9wmrO/nprZc+78HYSNdpr5ZDfyZFKdzU3egbIHS0EUhM9VPJLdA+G7GO7kkENS4+NlEfsRH+QzjbkzJkfdyc+WEzK9PhmdSgrL/DX3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 17:32:52 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 17:32:51 +0000
Message-ID: <1f2943e2-f1f0-449d-a1f2-937bae6a0af9@amd.com>
Date: Fri, 27 Oct 2023 23:02:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ASoC: amd: acp: add machine driver support for pdm
 use case
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 arungopal.kondaveeti@amd.com, mastan.katragadda@amd.com,
 juan.martinez@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Marian Postevca <posteuca@mutex.one>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-9-Syed.SabaKareem@amd.com>
 <4d5a4c67-2f4b-4111-b98b-ef575543fa6e@kernel.org>
 <3ec97548-1f91-49d0-adfb-4f8051ca9a97@amd.com>
 <f8f8017c-4e76-4d70-918f-d7cb45186184@kernel.org>
 <c0ea139c-9861-4ea1-b547-6e3c380301b3@amd.com>
 <ZTvkCAYsrS62/82u@finisterre.sirena.org.uk>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <ZTvkCAYsrS62/82u@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: b74d4aac-f319-4c59-56b0-08dbd712bedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qZBXeaHlaToIc19KhigIDPDizO5V5bwe9eJQ2CXrZQ/bH1ptKJLBCM/w8iz06YoayRHILGl5hjdR1NZGJyLw3vagb0rMS6DZ2ZTknxRk4YYGZ2EaAmuGmOtjlhUeWRdgsY4FC2RC1jQ6ANAaYZc2twYMsOHfBz6TqqgOKuJHn0CNqaal31ijjjIAztt47NODYuCeC9sv0eJJNyltAa0tau/M343bIksTz8DH6mUZqM6W4SZWSJnnwCEzOQKm87S1gM3fL85oWhfZ2e0prdDUO9LMpsX3FImNByYEJEdtb8wKDlj7rFmgxY5NfvqqI6lM6bS/F1RMz1ViArBu1jwVIu6/4YQDgDcjeN9ICAaGnGCS6BiFzftI6Kr8JpJ61yIqmbFE1yY0YQJTmamF8j6RRJGT6sd6qP3tA9Zhk8WH6Lfh/7tgHCFt0ZBfbAZ6JexMWMRKShvXL87Ujyjt+Zeha19QyOLPLENsJ462OjAQZUwGk/2Xg49c/nl0BLVh7SAsquuqBtVgGwJIhaYjmRw85TmJIHf7JeLSkur9+PYs2hq2zIF9Zz21Ww3ltatc79mmX+A9m17cmEr28kRJOFQol+aALY6v8CshI0ZxUfDRc3+2XgL9YitDpJaGYBFiyIlPSesftcBazZf0cDKHW2NOEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(53546011)(6506007)(36756003)(6666004)(6512007)(110136005)(26005)(66556008)(31696002)(316002)(54906003)(66476007)(31686004)(6636002)(6486002)(478600001)(2616005)(38100700002)(83380400001)(66946007)(41300700001)(8936002)(8676002)(4326008)(4744005)(2906002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y25FdW9DQnBSYk5FRHhCc1Rudy96dmZHeGFuYnl0QWxsbGFrcm1hVTlGaXFN?=
 =?utf-8?B?KzloaFFqcExhSXU3OXpmbkdCSWtnYy9ScGRMYTdIUWFrQnArSnhOUUttemdn?=
 =?utf-8?B?VnNlZmxJMTlZYnF4aHdmYnVMR3pLRFd5T1BhdlpmMzY2S28wTWZKNlhJUDBl?=
 =?utf-8?B?U3hnRFFRbGdDZnl5dkROaktzcmFqZkp2SkVFSTc0b0NtaDJSRnVlbWJidzhr?=
 =?utf-8?B?UHZwdUdkNlJCZVlOZ1prZitVRG9KNWhZUThnSjNnc1F3S2hsNTRVbno0UTlS?=
 =?utf-8?B?S3FQQTJOVm5wTFg0ZVJpMzdkS0VRTzBsK1dVZEJMU2plN0VoMlRSZXYwMGpr?=
 =?utf-8?B?TkxJeTNHbXB6emxiaWFBNTd3K3pkcG9yMG1ibFNHdjk4SUlZWHoydHUwcjRK?=
 =?utf-8?B?czhIQndrZDVveW9vbkdvWUFNMk1UektXL0p4RVhkbVdrRTJ4SmVZUDd5Zjd5?=
 =?utf-8?B?a2NybjhyZ0tBcUM0bEhqWm15NisrN2VsZno5WnV6K2ZmbUlQd3VlU3NqQ0VD?=
 =?utf-8?B?MWVqQ0ZXSkhZOWZCQ0dOZXUwbGFLalNHR244YUFpNXhVY3ZJcmtORm5Kc1Jv?=
 =?utf-8?B?NmtzaGliUkJBVzBHSlkxM25ZZk5SWHZEZWJQSFNHWnJRUGNLRHJRcVJiczV6?=
 =?utf-8?B?aWxZRlE2bisrOHN3alZqY2dGS1ZjVThHd2xFVGQ0VHBvR2cxcGFJV0o4ZE8y?=
 =?utf-8?B?SWRLQ3JVMTRSdndSajVZcCtVSFBmOENhRStaTlIybEVQTlJyYTZSVWM3THpo?=
 =?utf-8?B?dWxzaHl5cWo3T0ZLcGYxM3VodmtBOG83dFhVZHd5RkVDcWNGMU1TbXo0SVZv?=
 =?utf-8?B?V3lyNzZEbm43VkxOM05rcXlGRktKLzJ4d2lwcHF4aHFtV09nN0NpVmMrL2VI?=
 =?utf-8?B?bU43VmNkQ2h6Vm00cjI0NjdJclFhb0RjUzR1dVhxd1M5Z0FFNE9RaGtOUWVN?=
 =?utf-8?B?R2JXMmVrSC92TmhSdlB1WkVWVXpibEtCdzdTWkM1b1lhU0dvN2Z2ZkRvRS90?=
 =?utf-8?B?eE83aCtDMjcyWkdBQ0R4UVA2Vm5VbDdjUk93SHJCRmhyaDcyRU5TNkhmb2F1?=
 =?utf-8?B?VkM4M2FIa2Z3WDNlYUNaWkV1WTc2eE9vZ0UwY2Vxa2NXeGw0aEFHT2VuSmtR?=
 =?utf-8?B?RVFOUU9idXc4REwrM3lRckdHaWROZXpjOWVkcDBqQ0t3VnBGZkNUbDNCQ0Vt?=
 =?utf-8?B?K0ZjQndFM3JSa213S1JTKzBrWnc5Q0RDZmV0OEdkNVVXMWY4R1JJYUROTWUw?=
 =?utf-8?B?QmJHeDZzVWpuZjJwdDhhTXlOQTRYcWVZenQ1c0ZnL2s3enBqdG00NTNZeWNa?=
 =?utf-8?B?U05QYTcyK24rVWsyay9NbVJuY2RLcXBCcHV4eTFwR2Q1djdXeGNWQ2x4eHdt?=
 =?utf-8?B?bWthMFg0YlN0cE9tMWM0bjA3Y1l1YmJXNXB4Y3lhVFVGMUNFU2NnUTlYQ2Z5?=
 =?utf-8?B?Uld2Z01ybHcycXJ5b3lxcGF6QzcvRE1FVHp6cUhMU2VSTkJEZ3E0a1V0NlBQ?=
 =?utf-8?B?bzdmS1llUGlaWGZPeGpuNU9IVVVGYVF4akNkWURETHhLK2JUeGdUVWE4Uy8z?=
 =?utf-8?B?eU5sY0ZQOXkzbllJSy92UEFnbGZ1d3lMNEMrbUFUZG04VUpBRkVaUHM1TXQ2?=
 =?utf-8?B?K2lGS21DYUdyQ2ZVaGcvcVpJQS9kZjF6V3FGTFNDSC9zOWlGc0VOMFlYL3Fl?=
 =?utf-8?B?dXFnSS9CWTdmelFGZFFydzh3VVdHVXRNVlJYcEtIelZ6ZGpnM3ZvNEVaN0Yz?=
 =?utf-8?B?OG9qenlDUnNYbitVTVVNeGN3ZExXblVsZ0FCQXN6UGhncW1HaDVYUlByRlo5?=
 =?utf-8?B?RnIzaE1peDRuTzVHa1V1blZDQVZESnBXUVcwckZiaUhJbnVVWktVeTlIcHQy?=
 =?utf-8?B?WC9FenM4YVVSZG44N0QxTVNOS0tnT3RYVVBDQkJMM1B5a2dhbnJVMnI5YTJT?=
 =?utf-8?B?djUrWUpFOFAyZDhnZ0hkcXY0eHhVWmo5SmxKdGtCc2tDc0Z0RWV0TVJzKzdW?=
 =?utf-8?B?amJ5Q0drb1JpY2o1dHN3bVZSQjduZ2xKeWNEaGtnWXRwNTFMdU5XN0lhZC9C?=
 =?utf-8?B?bk1pQmkwVU5OTGZ3SENRNmpJc093UVZ6U0ZlTWw4Mk4yV0FOdis1YlRja1hB?=
 =?utf-8?Q?wjNx2O9a5OhQW1RkJg6XF8SH+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b74d4aac-f319-4c59-56b0-08dbd712bedc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 17:32:51.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8gKeCsq00jKm2zCeZNZ5qDvc58TD1GuPi5/f6Rr133csAxDKYTAExJp5kvWM5GWAFyK4LEqvneeXZpWLKa/XZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
Message-ID-Hash: XXGS7ZQFWPTP5MDE4DOT7EUGCB5U4HWZ
X-Message-ID-Hash: XXGS7ZQFWPTP5MDE4DOT7EUGCB5U4HWZ
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXGS7ZQFWPTP5MDE4DOT7EUGCB5U4HWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 10/27/23 21:53, Mark Brown wrote:
> On Fri, Oct 27, 2023 at 10:54:47AM -0500, Mario Limonciello wrote:
>
>> What would actually go into MODULE_DEVICE_TABLE?
>> The platform devices created are contingent upon what was found during the
>> top level ACP driver probe.  You don't want all the "child" platform drivers
>> to load unless they're needed.
> You want
>
> 	MODULE_DEVICE_TABLE(platform, board_ids);
>
> which is effectively the same as all the MODULE_ALIAS items you have
> there (which can be removed).

@krzk:as Mark Brown explained we can use platform device id table

instead of MODULE_ALIAS. As effectively there is no difference between

using platform device id table and MODULE_ALIAS.

If you are still expecting us to use platform id table instead of 
MODULE_ALIAS

we will provide the changes as an incremental patch.

