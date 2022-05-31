Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D44538DAC
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 11:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7A11B13;
	Tue, 31 May 2022 11:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7A11B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653989138;
	bh=EbDK2/lWmxZiVhvfnk2J98NMEjiaDZnNJPUgwsT8JCk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcdzNsSZOXhhtkwIw+4xVb5alpg0Y1BNp8sNtnF1yuOCiAgxO/A0NqRBoNhyuOdmb
	 7/ZjT7Y9uMATZaf1NGV/8iLTsw5+5metf5Sbb7OSol4c9vC+1WuH/tEBBoAnrwQeKc
	 8PNdYpFaUAf+6L4Sg90Ofgus4mmu7KQK2DFABmcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC342F8019B;
	Tue, 31 May 2022 11:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EFA2F80129; Tue, 31 May 2022 11:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E3CF80129
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 11:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E3CF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="tMJHJVPU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjDTdMJc7tcqwhiLDyVcNbBaJa15GH4Kcb9nYJh2Z+fJxOHxioXB77imUCCe/Tyb5KAJP8PGpc25hIvv3A8dNDIlU+Voqr3BOgISLFsIKHSTqMFcyvUmgRziZBOG+1rkG2XhM9Le37aNn+8/oLno5+8hZJKG38ZFA8QYkb/U7MtuZWkzh+aMCV9y5dU/JduE4CsuwyLcSZQOZ7LcMnbBvIben9JzK36vFIrPp6aHTum8F8p9favoq009Mmk2CkeGixJW3zmUzHEa1hXlvnLVz9AodCPS7+hxQnzvdsyPRz0/a7cGwmMgNjgTjLGy8AOMkI73sfG2XYeE2c9C/mQOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx3sX9G8NnAF8y7o53WF1wBwfREaM7vISU77kVzSlXI=;
 b=kbYgdgNLv5G+5tMWcfjRQ7gIQhFXob/0oML3yrl4l8l1WjUUS5br+wfH4yXB+oSwHIRPVNYA9+zK/5wR3SZBvSMNynnLc7mJSrPxfCXuVrEqRdBzek9Z9O2l5hL6lFR/SqwckkQvwacCwxTw9lv0umJcA/nWls1j/xNe9XZCXvqMhweL1C01i74d7u5FQTt5X9t/YSGHc+jedijPL3mN/MqoIyCFUHmQMsZZ+BgD7jYkSQc47UM9LAeCVnNiUQCTDE11OVzmL6GwWEeej7ulfZ0VnxrN+TmCf1xAgz5f4fGvLssCRLfs+2s7va3itXYzUGDM7yCXbe93ZAIcS4UfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx3sX9G8NnAF8y7o53WF1wBwfREaM7vISU77kVzSlXI=;
 b=tMJHJVPU2qCbg7roXwbaZrk57dVrBsHn7G9z1bgKa6hIAzBID1Sf7GLo5mtor8bB96ThmweIuNY4Sdwud1dAqJnQRNKyZvTgXCzUfK+o6/PuQdjz5ej9y+6RYrCAp6pLhZ9GEDiU78n+gavrzo0w/VBc8PtSLjYw02NJOUrroIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 09:24:17 +0000
Received: from MN2PR12MB4173.namprd12.prod.outlook.com
 ([fe80::e579:54ad:42b7:b9c4]) by MN2PR12MB4173.namprd12.prod.outlook.com
 ([fe80::e579:54ad:42b7:b9c4%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:24:17 +0000
Subject: Re: [PATCH v4 2/2] ASoC: amd: acp: Add support for rt5682s and rt1019
 card with hs instance
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
 <20220525203415.2227914-3-Vsujithkumar.Reddy@amd.com>
 <01acfbad-7668-dfc6-b797-a9fa5f402a26@linux.intel.com>
From: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>
Message-ID: <1e16d1f5-b466-2f4c-561f-aecf21e35458@amd.com>
Date: Tue, 31 May 2022 14:54:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <01acfbad-7668-dfc6-b797-a9fa5f402a26@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To MN2PR12MB4173.namprd12.prod.outlook.com
 (2603:10b6:208:1d8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25beb40d-3d1f-4096-86f7-08da42e755fe
X-MS-TrafficTypeDiagnostic: CH2PR12MB4199:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4199CF28009D26A669821A1592DC9@CH2PR12MB4199.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzAQT3AHq/LKyOej5Z26At7nPjLkXZrh6M9rXDOCto6JKhUdo8SbFMOHrRdjzPEohxSLw7Xpjo+gM3qcJA3qxY0QZITcB0BbyfxcXxwZHAMnYGtT+5m/N9cHe+U4CE+c7QbvvFRhIC6pw4YtsoYEsVWeNqsd9ZTQj/GE51Z86s6g+TWAOjeBgWQWh+kbzwaOE3HnL8eov8pw55mKWQXk0dzFbUoWBFNZycaSe1IWsBwDqH0YBbMXhrVgD4xP85Ip8xrK3uiHubjhldW+4gkgRfLTpnDMBeME2xPZDxBBZPh+CxxrORRtiSTchUXUDZr4o5ODWX6FgxcI6BeQJtrY9eKR2SctIekX9bEh+jG3JMjnXg4GHuk4ayG0SJx8T+IwlP74CzANGWFCrx6LszG+vot8LQ4CyOApc9IfU5XJ0M4Qou1zdGh79nOlY9DsJFa+cKSf3KB1jI+eka7t3CYAnkxIKwJrbTm4PRdCr1nR3yEUe+T3+J/egmMsX7sEjFjXcW2afACLj0cEWQVGvypHdMC08aYCLd2Gvm8J5rOsEj7nnj+z9dbhM9PziSTlBxtPjYtBT2CPUwTIZ/r+T7K+ukUBAEaLibt1mXtrxntRnUFc4O9b6LGmuE2QNpEN6qzGXygoSAvSK6d3SnKgOGjg0bfDDG4tKVL/hFaHPmj1nfT3pCj7RyDYq/pfX8xnyppClODxB0MD2ff3gFiaCgAYvQTkcTPD8RL5QGnR9jzxD1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4173.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(66946007)(8676002)(66556008)(66476007)(86362001)(4326008)(7416002)(2616005)(186003)(6666004)(508600001)(6486002)(31696002)(26005)(6506007)(6512007)(53546011)(316002)(31686004)(2906002)(54906003)(83380400001)(36756003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJPWEgvaUYvTHRadFVSdE4wa1FSMG53UXBoMUhIZDl2cDk3TjRmSGFkSVhN?=
 =?utf-8?B?ZVhMUEFVV2VMZ2ZtMHlYVStBL0Z3elNRaXhVV0NGTkFVR2dIZW41VFlMNCtl?=
 =?utf-8?B?dDBOd25vWGtqZzYwZWtiRVJJcWVDZ0Q4U1BORmNUTGZqeTBkdndKUkZPMUpH?=
 =?utf-8?B?b0VBZURWOXVoUmhxNytFQnFkNWpYQm16ZWtlZWs4bUNXZ2JFS2NsS3lhUHpN?=
 =?utf-8?B?SEZmb2pJMTlEY3NnODA4a2hIbHV4T3JTWmNsVFh0czYrSWRZV01waXZFeFM2?=
 =?utf-8?B?aDdaQzg3djBPZTFud1RUemZyVHF4QnQ2ZFRjZExWOGdxOTVUQlJZN09rbXNB?=
 =?utf-8?B?OXFKMmJlYS80MHJwenFrQ21kRFREUTM1Zm5Teml1ZnNDcWVLeDRTVHZRQkli?=
 =?utf-8?B?YWhIV2QwZEpENkZuVGo5dEEwUVJycUp6dlhaYTl6elFFTlJGa1BuMVU5T215?=
 =?utf-8?B?Ulh3VkhDZnJKQ3FubkpxbzZ5QXJCZXFyV2Nvcmp2WXA5S3NoYW1SSVZmd0lC?=
 =?utf-8?B?R2hESDUrOEt2S08vMXBhU1dOMDJrTmJJK201OElwTzdwdG52VnZwV3RyNk9K?=
 =?utf-8?B?WlhvNlcyYTlpTGhxRTVsY045a01CUXhlS2V3Z1dabCtPcVY3TlNEUS94V1pz?=
 =?utf-8?B?TGNpMmVLSmpZZHlaMWp4clo2dzVQYXRHaHhzbEZGeHkzUklFTWR6b1JlSkJ0?=
 =?utf-8?B?RkRqZkxhVENYc3FBNWlwekFQdUtJQWNQYWk5YnFoaHowaTlNQ0xyc1FGdlUx?=
 =?utf-8?B?RUE0YjNiK2FmMlgwZEREZktKU1hYdUU0ZEdTaUNaekZOUVRkYTd2T0pCSTVu?=
 =?utf-8?B?Nlo2MHk1azNQdmZUcHByNFpYMjQ2amNYSEExTnFwYzRZUEUxWkYySGVVM0RX?=
 =?utf-8?B?eUlxbm9BOHNqU0FSWCtKOUFtWUxoUXpERkdJU210Y2xpakdqcjZhNCtsK3dO?=
 =?utf-8?B?bTA3SDl3Z212V1Y5aHhqS0d0Qk1JN3BTN08yc0Naaktzc2ZzejlqVk16THdT?=
 =?utf-8?B?MmpQRFhnR0NwV1hUZ2hzL1V4Um52eWRRemtVVHU0Mkc5RFZoVU8rZmh5VXRG?=
 =?utf-8?B?VVRzU29sdGl4L3VrOGZmYVdGZ1o1bm9oRUZEMnd1NlRiYkRwN1Z1cnUxTFYr?=
 =?utf-8?B?L1BlRUt4R1NyUzZ1N2dqdkpNZG8wZDU1L1hBT0FFOThabDlJZHBnZXBTQlRN?=
 =?utf-8?B?dHNPSmtYWUlpdVoxR0xOQ0lVTldONnY5UW5aRzQ2ZUxZdExQNVlGSFZRRDND?=
 =?utf-8?B?dWw0aHBWMWRVWTY4QzI4ZFYrM3dSS0hpNFJNeHpIdlkxdjVyUVk3RnpLRCtT?=
 =?utf-8?B?ejJGWDcyWVRZSFB3UFZ6aTZiUk1BRldQL2RsWG1VSTJOSmZUUHhjLzRFQnEz?=
 =?utf-8?B?eTIwLzlaemhVT3RrdXh0eTZ4YXVxekoyRVU1cmxlM2lRT1E2K1RhMkVLUzZr?=
 =?utf-8?B?QUxZS1B6SWVlRGdkUHdBRXprZGl6VXJRaFY4MW56akdKOVo3SzJSU1V1Qy8v?=
 =?utf-8?B?dWJRakVycEVsTkxQUFhZZGRrd3YwWjlMNjh3enZtWkF1N3d0ZXhoR2dDLzZQ?=
 =?utf-8?B?Z0tQSjVaWTdGMTBoa1k0aTBCNnBXckxQdnVWMHFndmFBWkNLaVAyYUlHcGxa?=
 =?utf-8?B?bXlTeVlNMjVKczZBRDlGNy9qYTJwMUNLZ3FZZ0tlVUtPakQvTXNreUU5VmRD?=
 =?utf-8?B?ZldMNDl2KzJ1emhrNWJnUi8rODZMc2tpaXN1TjJwU2Q3RkJIV1Y4SFpyV1Zo?=
 =?utf-8?B?SUU0bGtWOFpQQlNqdHpaVzN4QXhMd3FtUmxoR29BM2lTZk1MSVZWYjdLbWZn?=
 =?utf-8?B?Y0xjU0NMSEVqSGkydlIyQVp4VlVpQ0RON3ZiL0hiUUNNVWgyYm9SajVCTTho?=
 =?utf-8?B?SEljSmpQUU9kZW5reDk1ZVlPV1FTeGdGYnZmSWFEZnB2ZEd5ZDZjYXVBdk9h?=
 =?utf-8?B?NmNLRXJrWHQ3aUNiRjJ2dWIrUkRFU3BpVVArWHllNVA0T2IwSGRYeDN5bHp5?=
 =?utf-8?B?ZEVUdmpPSVphVVVZYVJFTGwzZVprU0ZlTnI5WUNxOUpIaDZ2MllQOTJlYkhT?=
 =?utf-8?B?dXRDeC9LSExSWWdJOTZQVm5DWWowZjYxcTI4alFFTlczY1ZJNjNBZklZZTdH?=
 =?utf-8?B?bXVQSkM0a3F3TUN2Z2FjRUlGYkV5NWE5Tk5xaVNpKzhQeVVFUnRTdW5jRlBF?=
 =?utf-8?B?elEwSEpJNjdIMnh0VjBsRDFELzZMYnNGeTFvTEZFbXUrL3psd2JaRXhneGNX?=
 =?utf-8?B?VFBRVm9RYlVhUjFkLzV1ajhVSjk2ZS9qbUFpSlhxU3loWmxnWCtGalhZTzFR?=
 =?utf-8?B?OU1mdXNNVmlWeHBtcW9RbW9SakJDSHVmV2xtYURWUmJ1aGphNTBadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25beb40d-3d1f-4096-86f7-08da42e755fe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4173.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:24:17.5531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fgBO9vc6wEJDUeIk3mnN+KmeM0kGNdw71QSqzIxRBae1bE2pk8bj5iPb1v8il5A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
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


On 5/26/2022 2:58 AM, Pierre-Louis Bossart wrote:
> [CAUTION: External Email]
>
> On 5/25/22 15:34, V sujith kumar Reddy wrote:
>> We have new platform with rt5682s as a primary codec and rt1019 as an
>> amp codec. Add machine struct to register sof audio based sound card
>> on such Chrome machine.
>>
>> Here we are configuring as a soc mclk master and codec slave.
>>
>> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
>> ---
>>   sound/soc/amd/acp-config.c          |  9 ++++
>>   sound/soc/amd/acp/acp-mach-common.c | 69 ++++++++++++++++++++++++-----
>>   sound/soc/amd/acp/acp-sof-mach.c    | 15 +++++++
>>   3 files changed, 82 insertions(+), 11 deletions(-)
>>
>> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
>> index ba9e0adacc4a..39ca48be7be9 100644
>> --- a/sound/soc/amd/acp-config.c
>> +++ b/sound/soc/amd/acp-config.c
>> @@ -147,6 +147,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
>>                .fw_filename = "sof-rmb.ri",
>>                .sof_tplg_filename = "sof-acp-rmb.tplg",
>>        },
>> +     {
>> +             .id = "RTL5682",
>> +             .drv_name = "rt5682s-hs-rt1019",
>> +             .pdata = &acp_quirk_data,
>> +             .machine_quirk = snd_soc_acpi_codec_list,
>> +             .quirk_data = &amp_rt1019,
>> +             .fw_filename = "sof-rmb.ri",
>> +             .sof_tplg_filename = "sof-acp-rmb.tplg",
>> +     },
> that means a 3rd entry with the same pair of firmware/topology files?
will change and push new patchset
>
>>        {},
>>   };
>>   EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sof_machines);
>> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
>> index a03b396d96bb..4aad3fee51cf 100644
>> --- a/sound/soc/amd/acp/acp-mach-common.c
>> +++ b/sound/soc/amd/acp/acp-mach-common.c
>> @@ -148,10 +148,15 @@ static int acp_card_hs_startup(struct snd_pcm_substream *substream)
>>        struct snd_soc_card *card = rtd->card;
>>        struct acp_card_drvdata *drvdata = card->drvdata;
>>        struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>> -     int ret;
>> +     unsigned int fmt = 0;
> fmt initialization is overridden below.
will change and push new patchset
>
>> +     int ret = 0;
> useless init...
will change and push new patchset
>
>> -     ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
>> -                                | SND_SOC_DAIFMT_CBP_CFP);
>> +     if (drvdata->soc_mclk)
>> +             fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
>> +     else
>> +             fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
>> +
>> +     ret =  snd_soc_dai_set_fmt(codec_dai, fmt);
> ... overridden here
will change and push new patchset
>
>>        if (ret < 0) {
>>                dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
>>                return ret;
