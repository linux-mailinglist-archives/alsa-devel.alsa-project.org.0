Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778B73E09F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7E4DEE;
	Mon, 26 Jun 2023 15:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7E4DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687786037;
	bh=EqUlk1xOt7iqOeG9BjgOYrFudFDcIv+p6asblxg7iGg=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PxSlumtD/0uFByr/Jt/Vol8XoT+b6X9otL8rrc1hIRT9wdI5nsSHIQC4Md9y7pMxZ
	 Rlat2g27NA4SpqWfLhfbDTWezY2WfhzrRl6YevsA5DoECD0ZHBGSfhcVoTGyhvDK1o
	 fxeh7SWgxUihxFLZSPmlaFcfZZgsX8W0prsGPkz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE3ECF80246; Mon, 26 Jun 2023 15:26:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C08F5F80212;
	Mon, 26 Jun 2023 15:26:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E58EF80246; Mon, 26 Jun 2023 15:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CB6AF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB6AF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Gj4vRlxK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWwFb36cPqZCsjo5zFc0ZewTxHBSpqdSzT5Q6+azQMGkyT/k8BB+g3rAZp74qHwXvhX00VwyjtMcWui3UtGDAAxyl5pOpBEpCu201eJ2/vzo4cWN+TgcJwjCD7zxYhc4IrU1EgUBVDhIH1ct7trdjYhwzrpgwwbsRp+UrQF/HNaxXlpSXOpYSyl5jbtahzC06JZxnL3o9HqtvKEDsIYrL5RITcAw3EKxJg/IycE1AFbHW6BJJTVyK9kzkILlq13ALRbVuU2Ovsb7PM13YrZCp4DffSe4UfHmeq75WG21VEvPUNZ1YuBQasp11rlExcRNIujfSm3oPir+RNvhueMHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqUlk1xOt7iqOeG9BjgOYrFudFDcIv+p6asblxg7iGg=;
 b=TLwr2vnfC0+AMMot5avSqzdVDAIcaaveJiD/oC1IinInzXGMy/7QC+qwLpkC6EoDKg4QyrIhtLJFMZgY2IMaioQhQgVVxGNVamR39698LYTnZl7HoVy1njsZwP5ewlY8649QbWltYYNi8WAfbXvVHqFqsuxHF2QNTgtBAdSJ35b1l3ptBAl5/dP86Pc8yrxBMPUEYQIzC8Z6i2f3FNiC5EywV/4h9s1NpgtvXohtNByoaF3jCt5Ja403frgorzJuVuiZaCad+7wasbryyoYjxMiY8Uu/xgZqnUVOR4K65O2rybe5IubZBEmxhN9ArsRx3GqrROC025oOuwLBqOB2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqUlk1xOt7iqOeG9BjgOYrFudFDcIv+p6asblxg7iGg=;
 b=Gj4vRlxKNd78Os3Vqgqf9rkFt77roWfu14RYKqsxH1WDhan0tc6Y9GtoxDuih6yajysgcjCyZsHKvwLHQq9jjN2z8gvDEHAwwOVpaCpLEvwsbKMKHTI38/ThYFpNJgnnTU6G5RO3A5MS6lCygAsCnHCl98F6TbY3Pg7VvZATfCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 13:26:07 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 13:26:06 +0000
Message-ID: <b8af4050-85e7-6974-9c44-c26cb6962972@amd.com>
Date: Mon, 26 Jun 2023 19:00:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: broonie@kernel.org
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
Subject: Re: [BUG] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::27) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a25f79-7109-47e2-b79f-08db7648e567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	plqbp4OMNeZxHlwX88eD1SOSHdx4mQpPqqqtjq6Xd3ueSSzq1a1KNNHFSWD0PsZ9wZpn8uA/ZDysCJ9ZimI9WXvhZa8Ih0eLevFW1NI1Xh7u1iRer84JJsA0FbWXvFKd9YF4lDqex4tY6XMt2JpbyMlW56dFzvdC5jhpqkIFiJdW2o33az+Pb8Gqx4dZIIX5fR+xjdOti/4gAwAspweejnlUrQqROj1TD0maL0DNOvs+RIcKpJ4QCpdPsemK7XxtvqhvCNN8D8i5gpONFN/BZxyx8Nb7smvgGupLxhWOw48uOWVs2n0Oo4ukiTbXdM61bFyDNVmXbXdkIN888wVwVzaPZfuCliSpNuk1VtFpJuG1WeTFMrp1ptPU8Rq5UBJeYjtl3vi8vsqZv3Nj/5j+oNv3O28px8fR8IV82KJJAJZzMQ1nGLlmcZodFQOZH8r+5Q3VQg9vZU3ASRLDFzlZahsWX+Xkm5d0yPkdCs49ul0Ua581zHUh5/RmJ9n+64kUy67TU+EhKzCAzMS03Z5kiD+HaA1u+OSQp9RSUBEjJZNeH+mWMqwCSBnpcPeywZGC/juAosQUbp3XhozxNBh4+KWedOlxsXxtYpeQMZguizJEfIERGyiNWLNpw7CbzykgJ2OE7hnU8udPkK1AltPAwaQE6bR6UR+lJYLYL5XsT0g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(38100700002)(5660300002)(2616005)(6512007)(966005)(26005)(83380400001)(6506007)(186003)(4744005)(41300700001)(8936002)(2906002)(8676002)(36756003)(6666004)(6916009)(478600001)(66556008)(4326008)(66476007)(66946007)(31696002)(86362001)(316002)(6486002)(54906003)(31686004)(10126625003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1RpSk52Y3lVSkVaWTRJRFkzcFNEL2dVWTc3WWRnSzVnck10bTlCVHo1dDhk?=
 =?utf-8?B?SU94MnBWWG9zNFZFcWExcUxnWG1tUnNVdW1sN1Q3SVBWeTU0OHBEQWdPOFNB?=
 =?utf-8?B?S0p5cEllSVh4RVJFaVRTQ3owRDZyUEJsWS9yWUxFbkxGUUFzcVZBTXVRa0hH?=
 =?utf-8?B?QXQ5OVArYlRVWEpnRkpDNDhLNGZseUVjWGt5bHJDTzhZanl0ZnRwa3ZwV3BU?=
 =?utf-8?B?QXA4MXo0RTVKN1hpMjhsd3ZTYzgxVzFNTFZXQllJT3FDcWc3WGV4aU5oeFVl?=
 =?utf-8?B?QTMreUZONjB5TDJweGpab3RwQzUxSGlQY1I4WHl4U3IyTjg2ZkJvTDRHcjJn?=
 =?utf-8?B?VUhOaEpzMmpKM3RHais0L2Vod2NZZHJ4V1RnTlBKa0s2dC8zNk5QYXBjZ3Z4?=
 =?utf-8?B?bW0rbVY1UE1yQzJhSmxLZTFhSkx3RXJTQ3pYaTJmMk5Id096c3Q2TWJ4UXRZ?=
 =?utf-8?B?V3VJay9Caml4b0hUbTlZeEI4dGU0Mk5vN2dxeEN5ZWg5TlRpMVozSHQ5d1RI?=
 =?utf-8?B?Rno3bWJZMksvWjVVQU9sUndPeVdrT0FLcm1YTUJkdXNDSlZSVUMzVlk2VE5I?=
 =?utf-8?B?VkZhcFhSNTA2UUxna2hxSDBWYVpXbFVsaXowejk0bWpsNDZ1b0U0Z1RVdkx5?=
 =?utf-8?B?YmRSZ1l4bUxPeE1oL2VxZTg5VjhiMVBGRmRWNXRBSUx6cXY3OGNodlY2LzZG?=
 =?utf-8?B?YWxxODF6TXRiQWgvY1duNkVSeUhPU1YyMmZzK1RqUVRtK1hCS0kycXVTKzVV?=
 =?utf-8?B?T25oTFR5UlkwVTBPLysyMm9oL1lRWW04ZHdKbWdGVHZUaDR6Z3hwZkdHeEF4?=
 =?utf-8?B?V0U3ZDcvTHZRUVVWa0tLTUZCeXQ1MmhUY2pnY1pNZWxMdWdWamw5ay91azZW?=
 =?utf-8?B?bXhFdENBeDdMRmJteU8zditIcnUwU08xTm9MclZtOE1SYWNXVEtZU1F3cVY2?=
 =?utf-8?B?c1FmOWlqL25VUFUrZnN0aUIzZndpdTZwckRkWmc1U3NhQzNrUDR2bGhzL1Nk?=
 =?utf-8?B?bklBTDlYQVJleGVQdDFtM3J6d2JpUE5jU0o3VnBBZkZIeVNlZjdTMHZSRVE0?=
 =?utf-8?B?RHZKQVlZaXRCQjN2TGF0ZCtMZ01WbHFpWGpaTEk3YTNZZFFPS1gweW9oem1m?=
 =?utf-8?B?OWp5dWRZQTczWEVuT0hpU04vMjBYRVNkaVk0ejJBZk1hS0pzOHJGQ2E4eHNu?=
 =?utf-8?B?Y21xRXpnRHFSbHhVUktYS3lVcE1GOUIzM1dXNi9Ob1JPR1JTYXkvSnlyZ3B6?=
 =?utf-8?B?amRMOXQwMlBGTmI1S1RERStqdUdqUVM5REsxVDlKUDlRaTNZQXZzVkVyWTdE?=
 =?utf-8?B?WjVEQkRSRDQxT3RqNko4bS8vRFBGZFdEYmVzZHhTOXhhR3pTMEU3aGFIZmkx?=
 =?utf-8?B?MG01cVBDZjJJSFh3T0k4ZksyME9xdVVRZDdYdzFEeWdmQzgreDhJWEI5TXh6?=
 =?utf-8?B?MnVPbmo2T2ZXUVl4U0JKRlRRSjVoZ1ZmMk1UdTJKN3U4TCsxb1d2eU1FYlEy?=
 =?utf-8?B?bUQwVDRFL1UwdGN2dVNrQ3dHY0lYbHc5VEVxckRCd3BnTVFMT25HQWljVjht?=
 =?utf-8?B?QTJoSTI2aU5pajFTVUF1TDNPcXNhV0NtaHFPaitEajFYQTNKNUovZEE0M0NH?=
 =?utf-8?B?bmk1Z2JvMFE3M2M3RktGZitjdis2enZZelQ0a2pCQVpmQ2p4SFpWZFN0UlUw?=
 =?utf-8?B?cGhZYTQzT2d5OUkwWm9jZ0Z0UzlDdWpUVm1La0YzQ1ZhbDVwQlNiNkhlLzVK?=
 =?utf-8?B?VXF4M0RBZmd4eEJJQWNsUUJ1MGlIem9LU3pmay8rbWNaVmYrNGYyelpvUk91?=
 =?utf-8?B?bHBHdHJlbzlXOGxoaFNkMjJhcjVTNzlkbnRxMDV6TXk2QkpyKzI0d093Ukk1?=
 =?utf-8?B?NnhYYURxTGNQcnQzUnQza0hwdWpwRE05ZU9WbjRaeTNkcEJxOTlSNUVRekxp?=
 =?utf-8?B?VFVaMVpZaVJldG1VYk1QOFZRK1R6aU02WmlST2QwNUFYNHhuVi9NUTQycHFJ?=
 =?utf-8?B?bDJXMjNaT09YZ3YrNnY0QUdTbHlDb24yR01ndC9vNTRPS2Z0UloxS0hxVzA4?=
 =?utf-8?B?TUs4MFFBZi9ZaWZoYnhsRyswMHB1MCtLMW9QT0duYklxQVlPakJ4SkdJc2RQ?=
 =?utf-8?Q?2tJL9rC29dK96oc5qRGQGYa45?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9a25f79-7109-47e2-b79f-08db7648e567
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 13:26:06.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WWJJ+tYBSYX+X4SRl3wytw5FDrvsq53gZ/UV93+xF+r1JLi4xm3nQk9IyZuj4eWywlzDjC6WJt2HIFTXBfYLZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
Message-ID-Hash: BWVQWLKQL2OORDC2BBJQER3ZHNNKI4KZ
X-Message-ID-Hash: BWVQWLKQL2OORDC2BBJQER3ZHNNKI4KZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWVQWLKQL2OORDC2BBJQER3ZHNNKI4KZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

With cache type changing to maple tree for SoundWire Codec patch series, we are observing
rcu warnings with AMD SoundWire stack.

Below are the pastebin links for rcu warnings dmesg logs.

https://pastebin.com/6sadwNCw <https://pastebin.com/6sadwNCw>

https://pastebin.com/zwhfUKGf <https://pastebin.com/zwhfUKGf>

Acquiring rcu lock in between register read/writes causes context switch.

In AMD SoundWire manager xfer_msg() callback, we are using read_poll_timeout logic.
Below is the link.
https://elixir.bootlin.com/linux/v6.4-rc7/source/drivers/soundwire/amd_manager.c#L177

As per our understanding, we need to go with busy wait rather than using usleep_range()
which will be invoked by read_poll_timeout() logic.

Could you please suggest us how to fix this issue?

Thanks,
Vijendar

