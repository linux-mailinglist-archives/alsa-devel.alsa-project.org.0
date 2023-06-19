Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B852E734C5D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 09:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC8382C;
	Mon, 19 Jun 2023 09:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC8382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687159723;
	bh=nbRGU9oYOV3+Z0f7g6G6qeANDIUfTthCr11b9/Prgoc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cXD2uyuFlUpgs95EKiXg/xI3BHcZa4iT1d6ncfMzZ8PytPUDj+db3z6pBuFnzrApT
	 S1iyhTGOUqN8VfnxW+2ZAvIawppd2GG0MXo9lZvQ2i9w2gkNV0n51q9c6zxxPHezSQ
	 tKldNvMh81UxgWwDVr/HIg246ItuEwX5c5V3oxW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6B92F8052D; Mon, 19 Jun 2023 09:27:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C2FF80132;
	Mon, 19 Jun 2023 09:27:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82F9AF80217; Mon, 19 Jun 2023 09:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE880F800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 09:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE880F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pIVnVK1D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3isfH5SG4pnKqQ1B8yHSGu0HhZlMyo/O2jWDhAObFNxq38ncR0d4nW6XRBb8bHgZcrT5UmYSqvOAaM5L7peGTGvtPRErRWGMHCHN5fobaxB1g/C5PMEM2pNilSzFMwthW9wB8lScaiqFfoPbZ5gADO43vdfJF4yGelBDmhjwALLuaJrQ5LvT+S3Urpb/WYA3X/DijWEcakbPnMru3pV8VjHTI7FxhgW9gLKvOsyt1sKUlCpieHyx+yeNN0I7viMfkRwy3N4FYGLbf2Yh4F7MCZ+lqwMtIxfjLxcA+glljMf02/A7MUiY/COmOWeHWq9K8+P3lgH0iWGZ0Z91mD72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOuZ/aJ2E0WXj6FD4WdHuxR7N56ZnqMNfN3X10EIfME=;
 b=nxezMSaq/uE9UA+eaxOrGzBFfNQvimFgZVZ5YbvrwTOIIKDLMdODkeE2wQ42uCuXKf99tjWnPT7R1sqhgk2V92ipAvKzCAmNC90yDy5UM9HBuzbVnl/npVo4z2z9DiNxwvbm814ZmC8X39SgYOXko16GDsiq2VwTm6jbGoXSIcoIS4FV3IsSmZUt/s/1jVTLnchWZ/0r8iCDU+DlCi55vOH3D5RKch5CiMzGTGEfv9jh3rRfEs7OXR/AzQlv7d0E0MJlpSM4JhFdmHxKKoHEpHxVOVibufeqUE34joAkHTkzPkng5iuI0OTYzJOoN6j7Cja1uZ3IDeYgTwLA4EQ6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOuZ/aJ2E0WXj6FD4WdHuxR7N56ZnqMNfN3X10EIfME=;
 b=pIVnVK1D2cT8UfDf/xROYyTmYXkHrhuU4ts1GPmnvjIJ4qAlaXYqKSq9Pl8gtH1iJ3jetbIbyADB/Kb7y82CKwJqy/rWTGVQKk7+tbCkSVsE3BYwgQSRmDZzcLVTzESh2YTlDC+kcQE8EVxDnllUcdywqbCLiFWopKzuBHEPMsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 07:27:07 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 07:27:07 +0000
Message-ID: <5cd37a0f-0eb5-ead4-1e3c-b64f3c82c88b@amd.com>
Date: Mon, 19 Jun 2023 13:01:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V4 0/9] ASoC: amd: ps: add SoundWire support
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <5a397996-beb6-90ec-979c-22c4bfd7dcf3@amd.com>
In-Reply-To: <5a397996-beb6-90ec-979c-22c4bfd7dcf3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: e5670611-f326-44fa-83f7-08db70969638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CWJwblXGQDFc7zrr52LT3yRMnC/RqRpG12Vjqmo0PmaFqoYGuidYYKJW9BmnFjyv1z7byY23iRVjY3wvPBxDPasI7dsvO67j2zO5zxT8QM7AiRFHpAakqw20iGmtD5QXI3z0xbWX6HWlyet7GsGhqa4NLxETEBlFrx7F9VblnKZozVsPoDfUBTY9F00zNPTfI9F1J2V5WCZwOsnBmALQiYjIp64WA7dl3rKJldn7kcjICFYf2lHsVm2fVRmLnzJgoY0wClI/7+eWSJRjE0UhzzERKvYCiYYZsR3U/+IXTwtbgJYUbtmNh4Z2+GPVlyF7mzklQVenG+OV9ak9oKMa63sfhpV6BjO2S/W3gQGBlrTIpbCACcaxIr6Eg1VBOpC9NKTDaYrdYj7CaPOh3+6cesPFZk2Hg5dbJWXCeH467nSI9oZydCK1F1HT92QXQ4nq8Kyet9j3cLdcvf3Ku1BHQwlGQGNQJ17HftRouQlEeOZyJC+i/Xd9GugaVY6IgWP47p/1Bwd2Hqe6XCPVWi0oiDFCRmYuSzXJJ0ybra/Rxh18GN5gp9nKWOtJlIKSy3SOFu+vRc9NkTt/7+nySD4bVGgc72GbNp8DLcQrEO7/4XqXok9RjkkR7LdHcclnWTQ8ABHMy9zrduYAOc4jolwVVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(186003)(6512007)(26005)(53546011)(6506007)(2616005)(83380400001)(38100700002)(478600001)(4326008)(41300700001)(66556008)(66476007)(6916009)(66946007)(31686004)(36756003)(8676002)(316002)(8936002)(31696002)(6486002)(86362001)(6666004)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkcrNnJTZ0NMbVBxNzZYNFgyVFdZLzhXbXdDU1BIUzhJYk5EdUs3RysvUE5N?=
 =?utf-8?B?RkVQL28vZlRaM3Z3SlArZ1ZlV25zUSsrU2pSQ29vMHFyYUpJWlZlLzQyalkx?=
 =?utf-8?B?WEowS2gxYkh5MTI1aGM5azNISnIvaDdDR3pXbUNUdWN6c2tjNDd0Zys2ZWxk?=
 =?utf-8?B?RkdTSGRlc1RodnZRckFNVkxrRzE1a1p2QW5xVVdNWU8vWU15eE1hVGk0RnFs?=
 =?utf-8?B?ODI3SGl6OFZqRHVhKzFseFU1N0M2dW9HUkVyTHlsWFlTTkMyWDZGcmc0dWRV?=
 =?utf-8?B?VlJPRGxodGFubnAwVlVCcEZBSUN3SWZoZ3REOWlNMHNwajI2UVhYQUZDcWNE?=
 =?utf-8?B?bTJjcXZLVVVldjlHL3hnV3RVT3lGeTRBYlJ6emZTeCt4T1dPS3poWEtyU1Yy?=
 =?utf-8?B?Nm1VSEg1K0VZN3g0MWZZMWdjcDg5UnN1dys1WExNNERVeE1zdEV5MjEvWmRT?=
 =?utf-8?B?Vks1ZFNrdkphaWFWNjEyYWhSUmJDWjllM296eS9xc2NnV1ZlVVUwNUlWd3B0?=
 =?utf-8?B?bkFOZWtKMUhoeEhBaU90OWs0bDVJOExkUnlTdXZRU0FiWTE2ajMzY1FmZWcv?=
 =?utf-8?B?MGNqbi9nZTBzTE9VRnVnTFFibkdheUlGRElVT0xKcEwwNTZpQWZxSUk5RVpx?=
 =?utf-8?B?R3p3WmR2S2pqZWRhMmVVVFVweWMrRVFGYThXdWthYVRGdFhXNEh5bmZYMHlQ?=
 =?utf-8?B?c1o1Tm1IR3BBbzZYNWg1T29kZ21Wb0NJNHpCdlFVdjJiU05uNHdrRTRIeCsx?=
 =?utf-8?B?SElNcytjVkZlZWxndndxdEFMTlM1V0I2QXZUVTBkdUpLOExVYzJxa2tpMCtJ?=
 =?utf-8?B?ZnMyeXBGZlpEcEpDYmJKQVZ2dE9DdVFVb3BVRzMzZFBJb05kTjdHczc2ZERE?=
 =?utf-8?B?VW1XSTZXMmZjbEN6a09KVDhpUGpmbkkxdHBiT3lJUGlLc2M3RXhCVGFPaVVw?=
 =?utf-8?B?REpjcGpPdm5NK3VzeVZybTRORW1Nakp6STZ3R3orbmRac205UEdXL0h1SXRN?=
 =?utf-8?B?RmpTSzNYeGZjbUNVN2ovS2dtN2R3b1hYVmdEZzJ1dG9pOFVuTjVxN0t1OHpC?=
 =?utf-8?B?enowUmdKWjRjS05GYk0wbUlxZktndjR2LzRBVFlpRTNkdGJyQjJzd0g2Ni9X?=
 =?utf-8?B?ZW9qRGpGcWl3SlQyVEE2bVRVMXFHVUtwVzZNdTFDQ04xRnZRUXFBSDRpaDhS?=
 =?utf-8?B?cVozQUZQeGdGTndPYlBNN0s1R3hxVlpubVYvU3cwQ3V5TUhsY0E0ZStUYU0y?=
 =?utf-8?B?bmpyQ05BbFFXcXNKU3JNOFNLU0lpTCtEWmsvOExqZSthMVoxVmdydUpIcnBj?=
 =?utf-8?B?V0k5N05seHJ0RjV5UTFNQzBxZHpqcHF5dWl2ZEE1SGhRTHlmYW5qaWVUZENp?=
 =?utf-8?B?Nmp4dFd1a1VlU2VQRUo0L3krb3BSTmZ3YTloTjNkVngraTZWUFZxWWZ5THJ0?=
 =?utf-8?B?VFN1R0pUeXB0Z08vaUlmQlFNYWNwdUdHTSs5dW55TXZoYTZLVFY4bGRsb0JV?=
 =?utf-8?B?dFdnMEUzSGJLcHVYSXd0cXRGQkJmRTlLdEtaRHpSTVhYNm9HaWtjYTFmUW15?=
 =?utf-8?B?T1FoeGFtYUNwK1FhYSt4MTNlQ3NBRGIrc0xBZ1Jqa2htSHFIWXVQRjRHbHZn?=
 =?utf-8?B?VmljOTJRZDNtcmpFaXZZRm1OUG9aNmd0THpKV0pxaENrQ3Y4aTcyRzI0R3Jr?=
 =?utf-8?B?MjNVckt3ODZiMjZ2WjNtTjdIVDJnWWh4Ulhhc1F1cUo2THZ4SEpJRHpxWU9S?=
 =?utf-8?B?b21BN0doSG9PbDB6ejk5WUZnOGYwcDMzRnErdG41bkw2U1JwazB3Z0FMRkQ2?=
 =?utf-8?B?UFJRdUJ4R3IrUFBxc3V0QlpSTW1NeSswQnF2T05LUWxPNERiSDV3QnhocXZz?=
 =?utf-8?B?OG5IN3A2WVRyWGl4OEdoa0phYSt4NVdtVW9zR0hBR1VPdWI1WVp1UWFjMnl5?=
 =?utf-8?B?S09NMlFyNExBUzBHbGdLMXRqN1A5UytKcDMxSWVGLzFoMGVSeG9HVlNETkVH?=
 =?utf-8?B?REhpZ204b3dsWVdvNmpWaEQxT3UwTGJTZE5UVWFrbUhWdGcyM2FhYkxqSHU0?=
 =?utf-8?B?dzlVUDN3YVRaNXNZUmRGZzVidXFhZUViZG56bHNKZUVXakRiOVNXTlc4SVg0?=
 =?utf-8?Q?oJQvxdxSrnI30KniiOvAnbQHp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5670611-f326-44fa-83f7-08db70969638
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:27:07.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hRYQhGDhnNvgZDhsP9jsOpEIVCRkvikpdP2CjtVW0npMYpKCvMq77XCvfUmYVCBGTbwmVr7T9QzNX8+7yP9Kxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156
Message-ID-Hash: Y74YKLOBDZQTSZULAY523F65TD2Q2JRZ
X-Message-ID-Hash: Y74YKLOBDZQTSZULAY523F65TD2Q2JRZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y74YKLOBDZQTSZULAY523F65TD2Q2JRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/06/23 11:02, Mukunda,Vijendar wrote:
> On 12/06/23 15:28, Vijendar Mukunda wrote:
>> This patch series add support for
>> 	- Platform device creation for SoundWire Manager instances and
>> 	  PDM controller.
>> 	- SoundWire DMA driver.
>> 	- Interrupt handling for SoundWire manager related interrupts,
>> 	  SoundWire DMA interrupts and ACP error interrupts.
>> 	- ACP PCI driver PM ops modification with respect to SoundWire
>> 	  Power modes.
>>
>> Changes since v3:
>> 	- use pdev_config instead of pdev_mask in the code.
>> 	- define platform device configuration macros rather than enums
>> 	- add comments for MIPI DisCo version
>> 	- refactor SoundWire DMA start/stop sequence using single
>> 	  function
>> 	- refactor "acp_reset" flag related functionality.
>>
>> Changes since v2:
>> 	- add comments in irq handler.
>> 	- remove workqueue for SoundWire DMA interrupts and use thread
>> 	  implementation for DMA interrupt handling.
>> 	- add error checks in sdw_amd_scan_controller()
>> 	- remove passing "acp_lock" as platform resource for SoundWire DMA driver
>> 	  and PDM driver.
>> 	- retrieve "acp_lock" reference from parent driver directly and
>> 	  use the reference in SoundWire DMA driver.
>> 	- add handling for acp pci driver probe even when no ACP PDM or
>> 	  SoundWire manager platform devices created.
>> 	- Fix indentation for acp_sdw_dma_count structure variables.
>> 	- Use macro instead of hard coded values for FIFO offset and PTE offset.
>> 	- Change pm_runtime enable sequence in SoundWire DMA driver
>> 	  probe function.
>> 	- Refactor system level resume callback in SoundWire DMA
>>
>> Changes since v1:
>> 	- update "soundwire" as "SoundWire" in code.
>> 	- add comments for platform device mask and platform device
>> 	  count
>> 	- remove unused variables in acp pci driver private data
>> 	  structure
>> 	- refactor dma enable register structures in SoundWire DMA driver
>> 	- add TODO comments in IRQ handler
>> 	- update IRQ mask values using bit macros
>> 	- Fix build error reported in Makefile
>> 	- rename "sdw_dma_stream_instance" structure name as "acp_sdw_dma_stream"
> @Mark: We have provided replies for upstream review comments for V4 patch set.
> We are going to push as supplement patches for minor fixes.
> Should I resend the patch series?
@Bossart: If you don't have further comments, could you please provide
reviewed-by tag for this patch series?
>>  
>> Vijendar Mukunda (9):
>>   ASoC: amd: ps: create platform devices based on acp config
>>   ASoC: amd: ps: handle SoundWire interrupts in acp pci driver
>>   ASoC: amd: ps: add SoundWire dma driver
>>   ASoC: amd: ps: add SoundWire dma driver dma ops
>>   ASoC: amd: ps: add support for SoundWire DMA interrupts
>>   ASoC: amd: ps: add pm ops support for SoundWire dma driver
>>   ASoC: amd: ps: enable SoundWire dma driver build
>>   ASoC: amd: update comments in Kconfig file
>>   ASoC: amd: ps: add acp_reset flag check in acp pci driver pm ops.
>>
>>  sound/soc/amd/Kconfig         |   3 +-
>>  sound/soc/amd/ps/Makefile     |   2 +
>>  sound/soc/amd/ps/acp63.h      | 172 ++++++++++-
>>  sound/soc/amd/ps/pci-ps.c     | 419 +++++++++++++++++++++++--
>>  sound/soc/amd/ps/ps-sdw-dma.c | 555 ++++++++++++++++++++++++++++++++++
>>  5 files changed, 1115 insertions(+), 36 deletions(-)
>>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
>>

