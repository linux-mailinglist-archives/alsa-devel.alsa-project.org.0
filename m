Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83809662EC1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 19:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803D96EE5;
	Mon,  9 Jan 2023 19:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803D96EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673288580;
	bh=AnEGGPjD7JR8gFy9bS6s2pj5VfH7sXgJQKX2kmwu5EU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G5a4rCzX/oih+fmHso2WkQB6PGzjwq7DNldzE9wGuLhfQ3+ZocPz+CBtM9LLl5dHo
	 69pbOrEzaJxJN9cQqG5BTK1ZhozIoIt6Zj5h76Vf4V6Ze2FRPEfxUv4S2B6oTVIfqv
	 BGM7OkmNrIOoiTrxdzQIvJDo6uEGzuvgpGmQM5EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C63F80425;
	Mon,  9 Jan 2023 19:22:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7138FF803DC; Mon,  9 Jan 2023 19:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB759F8030F
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 19:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB759F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bQFlTFvF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b95q8r9PBIPX8HsuKLT9EN1wZVXnfnEdlRuSSqt06DB3EJ23s/77UlWjfXFUP2F2kQ//F/+z7lvJlre3X+QzKO7V8S2Yvkmg4Mb2pDTJrxfFMSL4CvZN883Q+x0i8ZZmmtP8q2MPqTTNf5te7Qf27ahqj5owyLvLEN85Svj/fa2dHgG2aAHjizFD4Ct+zfb8c5PXEaxKWCNSG5rtL/gmjHjbXf/FvcWvLOipeNILNm/6IuiuPWTCgOLvm7qeOxVoBUy27C9CmOBc47vroKr4ZtZhdmkiw46wB8RrJWE91ABCTNJLhINUmVo7M7cd0B4gQaxTyyNmgWFnPPqAvwbviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWYVpLti9KyB865YlSqgk9jjDGBTYaYRdZtGjvdvMPU=;
 b=d8H6B9n3yrIzh/8UuDiADOkfuXwuNM2yglfgqOkV5GeAuC+ir8MNsEFque5S+5wTaotktSuFrfd2U8aIglxupeOGQgBuX1QQa3iFaTHg1qUC/XAdftJ8pLryrEVw5PhKs/v22uynNKnP0rBK73lx9OWXhZXYGKF9ioI2QahoJ1hqqhvl7/kqcvtair8v4VPVFz1zJjfkp5qdNdwydHATlZqS+N5fQl3LQ31hLw0KWeoEAzW7WlsQu6WhMQe4ZTQUk77KmGg2uPd2K5cF5cueq+4ZjRVBM1WWW57KRnRFWAoNPEef0rSkwt6t8tIMyBiLoB4NunQvOPdqaqRw7hOxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWYVpLti9KyB865YlSqgk9jjDGBTYaYRdZtGjvdvMPU=;
 b=bQFlTFvFv/k4Ao4/DVP/iuoZ7PpyJAcbPX/5M48RylfFReYtwi3yB9XOd8zXykFq/qp0oXDtTsX7YL6sj05U99Tm75EI3nPnI2vYB9tL/UcBcmRdZG5HBobk0to8GqWtAaEyQnBgt0m1vFmYKZv7zaxU6QROBlNar9zM+VCymD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 18:21:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 18:21:53 +0000
Message-ID: <8349cf5f-1e26-f605-4404-978dbef9cee3@amd.com>
Date: Mon, 9 Jan 2023 12:21:50 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC] Sound support for Huawei line of AMD laptops using ACP and
 ES8336 codec
To: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>,
 Marian Postevca <posteuca@mutex.one>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <871qo7fqjp.fsf@mutex.one>
 <598ca0a8-8aef-a030-7060-f76ba4700bbf@amd.com>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <598ca0a8-8aef-a030-7060-f76ba4700bbf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0008.namprd05.prod.outlook.com
 (2603:10b6:803:40::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f0a64b-0c23-4cab-05bc-08daf26e61d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgeYXA3p9z81WWlVL3bkNxaHrWy6exq3ebuTfi4M8MP4r+y8i1SNuza75dzY2keguyT9o/6KGYVXm0+wdDglMbDxEaH8joxI23QdzJy1WmFZsgSKN7zdMpR5tfe9Ts6a8bN6ikOF3zVGQK59+zS4x20YY9OKiAekzgf3Nlp19eaxc9uPh7xbAqVfKwydTDDv3aImq68JbIfbJE1a9C9ybYtBUBbKKFER46HNuBppu5PLxflnrTS1mxXMesQF6UBM4ZjEtLxRhEDZ9Z56i3MFt/oLsJ8AbmIHXQgFPoofiNjDEYfvxfgEGbvGglsl6aw8GUVt2SmIrf3HDzRsA2zW8GUvBrJwhfYjAvPjGulcPYwtRAx+oadHtGtzoKOTLlXtcUGY/LGWFMQ1QCiFD2YI5lPbGY3Rq4GBeW2Gnvc84wZo/E3bObpJnLnKaUp9d0uWoPk6+7BVbeKFrXvHXmqJnt6en9wA93s1dpcquWihBtYoYazZ1l5UMpLl+GjJlG+38EU4tHRVCVvrB1PkrMbHyNzoxNMicB8UaRfy4hZiz5p3IrHor+JANV6w3RiS13Bl6HA3q8HSrLO7o3GFn8bcuhQr3sQymoeqZ8p/foK6EYMSfx+N93tJZc54exlWyu2oyjROuLhh3ouPCTU71Xjx0UoQPJzZ1t+iUL7x3iY1d5SyFk6idQ4iqXbDSu0HIiCxVNesa4YtVJdXgBHgf6L8pqpVGaO3AN4ROf/NNcgMtIpFPP7WN+dMaR+uiDP+movg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(8676002)(316002)(19627235002)(66946007)(66476007)(4326008)(66556008)(54906003)(110136005)(2906002)(5660300002)(8936002)(41300700001)(36756003)(31696002)(83380400001)(966005)(53546011)(6506007)(6486002)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkpGT2Y0Tkp2b04vbUsySG1OY0xpVW9ZNXlwRGVzd3pCZnZxc3FlVXl5RU1W?=
 =?utf-8?B?c25kTnpCK1pJdEF2V1ZqMTFXcWRFVEp4ZlZxSmhHUDRSbWF5NXFoUHAwNklh?=
 =?utf-8?B?a3NNSVdsd3RPdlFtdTQwYTN0cWZSUUdDTjJqNEFpcGV1OUhETFNpUmp1bE45?=
 =?utf-8?B?R3gyQTlTd3FmbVdDZlI2aThvY3JnaWdLc0tieVlIQUxXaW4rZmUzU0dCckdN?=
 =?utf-8?B?TG05UkJBbUI5UThPeTcwV0dlckVDYStQTzBLRzVMN0FOcFNZVE9PSHl0Rk9l?=
 =?utf-8?B?b2FhcW9IN0VlQ3UvS0wxcmxxdmdOWDV4NHVlcFNnaDlHZXBTL3R5R2g0bmFw?=
 =?utf-8?B?dXJzckI3VGNZS1M0ZWRONjhEek82ZEV0bm9CRGFueisyUCtWWHFPL3ZtU2Z3?=
 =?utf-8?B?bXpUTmJ6bDFRUksyQ0FZTzEzY1JtTEVCblBCM2U0V2RVb2FLRjFLa0d1L0pB?=
 =?utf-8?B?Vkx2Z0p5OG5IQnRZMGJxYVlpVGlROGU2aElDeXJWQmUyNFo2UU1ZOUZRU0t2?=
 =?utf-8?B?Z1lKMEtTdHJiTDNCYzkyRGJqcmluU0R0MktzRktxNStEQ0NKSXYrM1B3RVdh?=
 =?utf-8?B?d0doRDFNV3lUS0hwRmlHaEtETnVNcW9hRm5lRWlXRnViUXNTUjJZSlIzcXUz?=
 =?utf-8?B?a0dyaGpsZVVwaW5xZENZY3lsMU5lWVUraDlZUC9EeUZWa0hqUzBId20rQTVn?=
 =?utf-8?B?eWF2QUZFNEU3eXh5MXU0QzBxNnAwS2ZWOGJRc29rQUhoWUxSU0JkVmExWi83?=
 =?utf-8?B?amVncnkrU0UxMlhKOFBSaE9BbHVZeDRxRnpZWHIrYjhPVkFibG9LYmJISnk5?=
 =?utf-8?B?L01DVnIxV2QzVldxQ21lM1FmVHNQSGM5bDluN3d4amtSQjZWSWlOV21jUVhi?=
 =?utf-8?B?REpQMGdsUGJWeElFVGNKVDZvaFk4dHRqbTNWUWpsamhFRE5yRklIUUJ4dlB3?=
 =?utf-8?B?WWFtbXNBY3RsMlhsTGk4MURIOXE4Q0NEcGRydXZEUDBjdXlpU1JuWHFjZDlq?=
 =?utf-8?B?eC81YkVTaWpJZkpNY3lHMTdDOXBlR21xbE10cVZWMkt1TGpwb2ozUExFbHd5?=
 =?utf-8?B?WDYzVERXMlhOWTJ0WUg1emFkak5BMW95bHhraUpMWGE5YVpZTS9OU1FaRHBy?=
 =?utf-8?B?WGkvbnE1SlVBUS9GUEFSdjJIdE5ndC9mUVlvSUFNc09YUHArQWhlM2lJQTFT?=
 =?utf-8?B?SEc1dkREbjlCMU9OYXQvdFMycUNPZnlYNDZ1VnNBMkI5cFJoNmtjUEVjcFJn?=
 =?utf-8?B?SEwrUzdtb0dsVzVwOHdLaWNicWJUcGxnNTRuNVhJWm1MUlJvS1BGTlZRRkxo?=
 =?utf-8?B?ZjNvUnVaVkRrK2kvanBxMkVqUkhYQU0wYVNoVDFLVFV0UFcweWhqWlpORTVt?=
 =?utf-8?B?T1l6NVM4U042WGVYUVQzU1FjV05BOC9yWUloaExtT1NWbTlpSFZQM0hBTEFk?=
 =?utf-8?B?RkxQeFhadzBZT3luT1JCNmZsb0NOdUxZNVhEa25MQmZ3YlVRYmdYbnFSdi9M?=
 =?utf-8?B?RUlaaXNDV3JIb0E5TmFMTzV3ZUJzTjNrUTNNTi9xSVQxZHYzNWJHTit6emRW?=
 =?utf-8?B?RmdZd0tGNFJwMkJPMlpjNE5BYWpTSW9DYkpjVXdlanlwYWFzU0FhK3FrWStm?=
 =?utf-8?B?ejBvV1Y0THN4QXc4RnF1dUlYM05uL2FnWUFndktCN0Mxbk0zcE1GMDRaZE84?=
 =?utf-8?B?NkNuZ2dUSWNWVE5JdUVLMnZ4T2ZqUFJibVcwSmNVNEQyYVdLc003ck5XVEcx?=
 =?utf-8?B?WTlneXlNZUtvVHNMSlhWWENMRkpiQ2V2REI2RXF6eWpHQ0tpdEk2OFZPTkRM?=
 =?utf-8?B?L3JyOVI3R0psdnZzUHl1VVR2S1NIdElpcWhacFN1M1N2YXBYbEFrQ1hqZjY0?=
 =?utf-8?B?Z1BibUVqRC8rMllDVTVjK1pJaUNFaFQ5dmZrYW9kanAwMXM1MWZualVnOVVl?=
 =?utf-8?B?Z244L0ZUdzFHRk1PbnlTT2wzU2tFWlRhSlRHcE5hNklHVGlMRG0rWkFyV1Fq?=
 =?utf-8?B?ZWJJRld6ZjB0bFptMXVMRHVxckpRYTZiOWN6dlp2eUNMY3lYNHpNbTI5c253?=
 =?utf-8?B?Ym9URkhBU0RjRTFQbHJ0SVpSUjVJL2p3ZHgyb2Joc3g0MmpLbWpNRUtJY1BX?=
 =?utf-8?Q?W7LqtZQfseb/SjHDaQKg0xEb9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f0a64b-0c23-4cab-05bc-08daf26e61d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 18:21:52.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dhLi+bRMrQXqVHQu3V4dC0fzLGyDQ+O5hG5Vy/VLofhClQw31nHTR1L6czV3W/vZrgmPghRyfF85GABFObzgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, syed sabakareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/7/2023 00:58, Reddy, V sujith kumar wrote:
> Hi Marian,
> 
> Thanks for the query.
> 
> On 1/7/2023 12:17 AM, Marian Postevca wrote:
>> I have a Huawei Matebook 14 AMD 2021 laptop for which the sound isn't
>> supported on Linux. On further investigation in Windows and ACPI tables
>> I could determine that this particular SKU has an ES8336 codec connected
>> to the CPU ACP module.
>> The CPU of my laptop is an AMD Ryzen 5 5500U which seems to be codenamed
>> Lucienne and is a derivation of the Renoir family.
>> Acording to lspci the ACP is revision 1:
>>
>> 03:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2] (rev 01)
>> 	Subsystem: Device [1e83:3e4d]
>> 	Kernel driver in use: snd_rn_pci_acp3x
>> 	Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
>> 	snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x,
>> 	snd_sof_amd_renoir
>>
>> I have written a machine driver for this platform and managed to make
>> the sound and internal microphone work. I am looking to integrate this
>> support but there are some issues with the current implementation of ACP
>> support.
>>
>> As far as I can tell there are 4 directions I could take to add support:
>>
>> 1. A standalone machine driver in sound/soc/amd that uses the platform
>>    drivers from sound/soc/amd/raven/
>>
>> 2. An embedded driver in sound/soc/amd/acp/acp-legacy-mach.c
>>
>> 3. A standalone machine driver in sound/soc/amd that uses the platform
>>    drivers from sound/soc/amd/renoir
>>
>> 4. Use the SOF infrastructure
>>
>> Now as far as I can tell, all of these directions have issues:
>>
>> 1. The pci driver from sound/soc/amd/raven/pci-acp3x.c doesn't support Lucienne
>>     since it blocks rev 1 devices in :
>>
>>     /* Raven device detection */
>>     if (pci->revision != 0x00)
>>         return -ENODEV;
>>
>>     This is the approach I took and just changed the check to add support
>>     for rev 1.
>>     The sound and internal microphone worked ok and I didn't encounter any
>>     issues with it. Of course I don't know the internals of ACP and
>>     don't know what are the differences between rev 0 and rev 1.
> 
> 
> Not recommended
> 
>> 2. This approach could work but I would need to change the structure
>>     acp_card_drvdata and struct snd_soc_dapm_widget acp_widgets,
>>     to add proper support for jack handling (and maybe some other
>>     modifications).
>>     This driver seems to support rev 1 (in sound/soc/amd/acp/acp-pci.c):
>>
>>     switch (pci->revision) {
>> 	case 0x01:
>> 		chip->name = "acp_asoc_renoir";
>> 		chip->acp_rev = ACP3X_DEV;
>> 		break;
>>
>>     Also from the module description it seems that these drivers are
>>     meant only for chromebook support.
> 
> 
> Recommended. Please add below code
> 
> 	{
> 		.flags  =  FLAG_AMD_LEGACY,
> 		.device  =  ACP_PCI_DEV_ID,
> 		.dmi_table  =  (const  struct  dmi_system_id  [])  {
> 			{
> 				.matches  =  {
> 					DMI_MATCH(DMI_SYS_VENDOR,  ""),///change accordingly DMI_MATCH(DMI_PRODUCT_NAME, ""),///change 
> accordingly
>   },
> 			},
> 
> 
> at 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/amd/acp-config.c#n50
> 
> As you said add the   structure static struct acp_card_drvdata and also 
> add the required dai_link of codec.
> 
> 
> 
>> 3. This seems like it would the best approach in theory, but the problem
>>     is that the drivers inside only seem to add support for DMIC.
>>
>> 4. I tried to use SOF early when I started tinkering, but I always got a
>>     timeout during init phase when loading the renoir firmware.
> 
> Could you please send  the error, we will check and let you know what is 
> missing.

Just a guess here without seeing the error.  Is this perhaps because the 
SOF F/W binary that was loaded was not signed with signature trusted by 
the platform and the platform required validation?

SOF on AMD was first introduced for Chromebooks which don't use the same 
authority for firmware binary verification that general purpose UEFI 
notebooks would use.
