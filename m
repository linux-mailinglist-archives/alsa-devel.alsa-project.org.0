Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4873E23B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 16:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF12184C;
	Mon, 26 Jun 2023 16:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF12184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687790189;
	bh=cdnm8OGU/ilXK0HVRTTXWdWge3/R/5r9y7MhX/physE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QJG++pgX46p0XW0FIoWSDM7CO+GBuX4U08CrQeVkzRzb2p3EwdCJgISg8E4lvbhiO
	 x6a45HV0kkRyb2OgrG0j4pcIj94Jep/gIjLrnxxreWf78PkYmN29/0/Vbsz1z6xBa/
	 AWbzvp2SgUViCiWqyFuCkHFsRzAxiCZK6KbjcJiE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAFE2F80246; Mon, 26 Jun 2023 16:35:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4C2F80169;
	Mon, 26 Jun 2023 16:35:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37EBBF80246; Mon, 26 Jun 2023 16:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25D1EF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 16:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D1EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=c58fDJi+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSydzsP0FdzMcyT7FmZYHn09h/LYX817Ku/qoJayQmiOwrjTjE96c+/b6fGsErviOEbrHBn4eOjQ41skeHnh4hEasnyYpkKm/OfOwZB1s/NcuLaif/Cz9dtH9HoVWn4ZCPN4BeEKFg23OG3ZjONeN0BSwHMWsduZ7qV/Q6Ru+ya4m2SPyXGCU1nAmMq+A3eAoWNLKpMl3mQIC9u6mwfk9D/YFGLQoAw0sTZxI7X6ui9VzUX1dMXpGNcoj9DLUtTshoPPocblRm7TpAb/32nNp0dEvUrcTkU4JO/ymyXy0XC+pcNjlYhhmpxliUgNptm/rbVpcg1se2xLs1sQloQx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdnm8OGU/ilXK0HVRTTXWdWge3/R/5r9y7MhX/physE=;
 b=mdxaVwOG9SkLk2S6fzyjAnBEd8X5/kXYAhK/wxnW9nPsX4MtlozGGuXSWiamhBK1D7YZdWk57bcsubfDovqI6C8qfIqBKdPNxosUhbcVYl+0ZsbJYLAGMAErzurPtysaDwhlzi5wWvu9zu4Z0IVcEwDow9YtwztEmHPSSmkaEZ/VokC2yPhS1Tp5hjmOSX4dngQ5oUtPjDoJ7mpufOTMIT2eotvW3SLvhU4WmYEszbI/Vo0Kuq0QF13PgY/f8j8y+BArLP8xb4MtjJZn1HRE+c3qCgwwRbpWYFOqTJ2l1DS2RybuqSNbtX8UK1KsXkQnng9e88r2c/TV3w7uAp1Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdnm8OGU/ilXK0HVRTTXWdWge3/R/5r9y7MhX/physE=;
 b=c58fDJi+op0tgCm8tvd6m3nb5ymKjHpCAVPS1cuifCF826GwEmaWHp9/4fyg50pspzGWcNUqd+AJJO/L70yje6Bz2QjKR9mHGr8sG/Zc1BsnLNIS3lDAhAV8xg6XkRFGJic1LFHIVznYVskmfASNodiij5G3ll8wLLxPBwwoSRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 14:35:18 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 14:35:18 +0000
Message-ID: <df864ba0-154d-512e-c0ca-434ecf1cbace@amd.com>
Date: Mon, 26 Jun 2023 20:09:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [BUG] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, oder_chiou@realtek.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@linaro.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Katragadda, Mastan" <mastan.katragadda@amd.com>,
 "kondaveeti, Arungopal" <arungopal.kondaveeti@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
 <b8af4050-85e7-6974-9c44-c26cb6962972@amd.com>
 <d305c960-afe8-49b0-8583-a3f168311cf5@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <d305c960-afe8-49b0-8583-a3f168311cf5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bacc1b-3e94-4c30-52fe-08db7652901c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wMs2y0gEhHicCUXptrjjmA8VMO8l3pIrB3/9k8VkAxB0/BVEc+QJjJUlqnRabMxdL1N6SAGPfEShnAfC7LvnYFsly8CLnjDnnPWLI+MYR6zE5/hHAvPfyfJeATcO6Q82I0o2AHiTamHiklCfQUjOMnPirYy3y4+NmA2BFiIuHkjkSXR+38g4Qhwvsn8cQK6llxH273+qI1Jh6R6qp30iT3I/1Yraf063eWEpSozTgiqltLylvowDZhflpiyQWvJfQmRs0Pwo19JgDoyd/oTp9emGMJU4tIQ1QVj4d1lQS6EqMmSXpdKCbcitAM8pX7cysQaBUOOjCvoVfHQjph7kO+TjeKKVGB9SKkc9XD49V3CK/fkc4G3FMiWwVMtXBW8k1u4hwpnNFGkfkyXXyCVWTwbr9x0JvOeDwOT+OYsaslvuAEzqkAioVwZAcdVVoGxr5mCB0Z2eWz211RHjc6xq6hXX6nUmX3luxLi8E6i1dAWWTP/s7C/s/0BRyuo2gqBAGYYy8OUZezqv/M/EdsD7v4MFgSl6rEPmZrommjM8/9Hq6dpZFl/cBQxD6LsSweyMm7KBYgS4nsIWc35XAeNXE/gKQJ5OFq1xMPXNzljSRZqvIBqmS/Y31EcIUAciYERJrgLkX9lAoE72m+Qsfun6QMj5vl1mQKGwqQZKlfePDjQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(38100700002)(83380400001)(31696002)(36756003)(31686004)(86362001)(478600001)(54906003)(2616005)(966005)(6486002)(6666004)(41300700001)(66476007)(66556008)(66946007)(316002)(8676002)(8936002)(6916009)(53546011)(26005)(4326008)(6506007)(6512007)(186003)(2906002)(4744005)(5660300002)(10126625003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUlCMk0wbHNLeG5zQmRETTJqZHRJYnBuc0gyS2xlS0EwSHd6MjhCU0tQQ1VW?=
 =?utf-8?B?cEZyOWo0Q21jYUtPand4Q2swcy9WMTZqOUthc3h2UklVYkQ0cGNWNGZRT1A5?=
 =?utf-8?B?MTFkU0hGTFpHYS96YnpMTW1GdXdVZzNsWXJ1S2d0RU8ySXFMZGhuTnpMU1RQ?=
 =?utf-8?B?bjFYd1VVQzRTWVNyTUNpd1VTN3FnbjYxOFh1bEFmb2tESTB6UHRKblNSUEN5?=
 =?utf-8?B?bzBOUGgzZll4Tmh4MEZvUy9zWnl1UVYxdDNMcGxhSitnOXh3RG5LZGpBdFR3?=
 =?utf-8?B?eXJqWHdDcUIyNkU0bldvR25pdUJobGJob2JBRFZGZnRHbTdsU2JMZE51YTlM?=
 =?utf-8?B?Q09UUE95UVVJdmljeVZyR1JITnpWNzNETWZVS1dnNkZ1eFhNdXo0cGRjL2xh?=
 =?utf-8?B?aDFwaTEzdms2c2hqeGtJM1l2N1NYTmdkaWt1MEI5S25GK0xvZ2lHK3lCcDhF?=
 =?utf-8?B?U1RVU1hoUVhuSWFLbkdWbFZQTU9GSHBtVDJ4cm5iZ3lJSElCS3VtRDJtQXVK?=
 =?utf-8?B?bXNxS3BvWVU2Q2lkc0NhWDJSS3JMWDlTMlJSVk9RQWxad3RmbVhKTkJielE4?=
 =?utf-8?B?OFptNi9XNXR1SzUvMEdVME9EcUpQZzgrcDBnUjlwNkxhOCsxMlNNREt5UjNq?=
 =?utf-8?B?Mjgwc240QUJuM0VZS1ZRQUYwL3J5U2JRTUJWbmdxMXdVYnR3bDlmZDBVYVB0?=
 =?utf-8?B?ak9EVm53bndrY25hU1BsNG02L0pQZHIyc3ZGSkZJNnM4bnd4ZVgwYVVvU0JI?=
 =?utf-8?B?b3BlWUZKaFExWGhFNjVORmU0dkFpbjVqNDUwK0Y4ODM2dTB2Z0NwSy9maE55?=
 =?utf-8?B?ZkoyOFNJSmYzSUVtVHRzUFU2VmEzMkJCRjh2dFRyM3dzVWd0eTJTbzZ2OHJn?=
 =?utf-8?B?d3lUeDRNdWUxSTRTMTA3TDQxQmVseGtERERtUkdTZ3lYVzZBNUk3VElrSzBC?=
 =?utf-8?B?T0dVSDVsbmRiWFBxTk9aZDBoVkhxcTJTeGU3R3lCQmZ4dkdlWFFpc05aUENx?=
 =?utf-8?B?emo0djNWZGxsT0Fqck5NbTBaY1ZLY0I5aG83RkVjZ3pKa0FxN2hBMlBLNFFy?=
 =?utf-8?B?bnpzc3FxRjMydDBsc0pXL1lsWm9Ncm4zcExlOFIrK3dJRi82V2pFS0dIN0px?=
 =?utf-8?B?RVZiZlFaN0pnZVlyU2xZUXRTVGRIc2Y4S0t4cDc0UGVZVVZPY3QwLzl0cUw2?=
 =?utf-8?B?MnpYaGUrUXllbVJ5MERWNThlYTV0VFc2YU9LWjdlenU2YnM2WWg2c2JUOVFP?=
 =?utf-8?B?KzRObmY2TklyMER6RERRSDJxNEVlM2drVVJMWkFvcTVXSnZ1SEh5Q0NRYUVp?=
 =?utf-8?B?WTJMMVpXbmpQL21TaUN5ZVU3RGVsaDd6U1BWQWgrVU9FT2tXYmdqNnhVMXpL?=
 =?utf-8?B?Z0ZnNzB2Szh3Ujgyc21hVmQySWVncEFkYk1yaXdUT1YvN2xhMlBQdzRmY2NK?=
 =?utf-8?B?VWdXRGo0cUllK1R6cllJcmM5VTJ5bDlFd3J6MXVsT1Y0RnJzNk4velNycCsz?=
 =?utf-8?B?N3E2WjF3TTh5RTNKUnBWVE1mdWRxcERNdG1pK2l6TURFUnByMk1wRDVkKzdU?=
 =?utf-8?B?dFN0Q1NDSHNUMUhOS3Q3ekhrdVNWVmFtV0VLaTJJNUtHR1BsaGJ1eXdKRHlo?=
 =?utf-8?B?MW8vaWpsQ2tKRitMemFKVUk3bmVSMWRXVVRmc0ZMQUh1U3k3N09DQ2ZYZStJ?=
 =?utf-8?B?VlBqTDdVYlQ4WVdSZnZWeEMvM2VkZXlIZktTUkt6TWp6Vk9hVzNGeU02cWlD?=
 =?utf-8?B?ZXhOOXhDUjBKY056R2Ztb2hiNDdZK1FLb2ZxSk94K2l1S2tMOW9mRm1WQUxn?=
 =?utf-8?B?a2o5TG44Yzdta2w2V2hBRXFVcWt3WFBzd2t2eU5XV0tvYjdLdEM1YkdJSTRN?=
 =?utf-8?B?YTRYQVEyZzVNMWxzQVI0WWVYRGV2cktRK01WdEp2WlVzazhIc1JQb2VmdDdN?=
 =?utf-8?B?cytIdG1OM1RhNVQ0TVdUTWtrdWRCb0FxK2FSalFFWlZ3T2MxcE9tUjE2NzVD?=
 =?utf-8?B?RVhuQnZoNk9uaWRuVWNITmZIS3c3aldObHBkMWhjemJsRU5uZ3JmZExxNFRN?=
 =?utf-8?B?VkdKU3M3aW1RR3NzWktXb1ZEYk93T0hudlhVY25KM3BWQSt6Rm9TUzBmbzNv?=
 =?utf-8?Q?kTRtgrs5K8FV1211CPFwkA3bj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 07bacc1b-3e94-4c30-52fe-08db7652901c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 14:35:18.3999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yrxx3HbUFtd+5Y7N29msaPY6CRnl0ZmIafbk5s6xH2XfT65QOYolglucGhizd3V24HRtL4vqEN4dp5ic5pMjHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055
Message-ID-Hash: DDHWW6EYMCIZIL2W4F7GSQ5EEBYVS2LX
X-Message-ID-Hash: DDHWW6EYMCIZIL2W4F7GSQ5EEBYVS2LX
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDHWW6EYMCIZIL2W4F7GSQ5EEBYVS2LX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/23 18:59, Mark Brown wrote:
> On Mon, Jun 26, 2023 at 07:00:31PM +0530, Mukunda,Vijendar wrote:
>
>> With cache type changing to maple tree for SoundWire Codec patch series, we are observing
>> rcu warnings with AMD SoundWire stack.
> Do you you have 0cc6578048e0980 ("regmap: maple: Drop the RCU read lock
> while syncing registers") in your tree when testing?
We have tested with ASoC tree for-next branch code.
This patch is not included in our tree while testing.

We will verify with the patch and let you know our findings.
>> Below are the pastebin links for rcu warnings dmesg logs.
>> https://pastebin.com/6sadwNCw <https://pastebin.com/6sadwNCw>
> Please include at least some of the actual warning in your emails so
> they are directly readable.

