Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95F734B5C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 07:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD17822;
	Mon, 19 Jun 2023 07:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD17822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687152740;
	bh=h1tJULF7boGJBUR9P8ywmRlRhtWW7EeTmexN+K7LQmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mWnPBTHi6gBTEb6L0UZtxwUvt4iPY/jKsGI/Bt7Dz/hxck+I5MHwxQpLWbhEDWpN0
	 eLk9Y5Q6gYyhQAcYWIh1Ehi1YpuQmyLugZg8bV5xbnRUhijihrLvgduESSeGSl8odj
	 aWXLZX+3ZAkq4DnT6GuH+MvAWmiH6cmFfvD9rGOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03008F80529; Mon, 19 Jun 2023 07:31:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BA9F80132;
	Mon, 19 Jun 2023 07:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CC05F80217; Mon, 19 Jun 2023 07:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1C2AF80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 07:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C2AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Rp2GyqGP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxoBYDPu5/KI10kRcsdY3sAsFp82OMKyunbRZGEk0lexrQKKj5CwjorvhNlHPiKC+N0EP6SUBb6n5xSPeFmYXK12p9QRXvgi71awSAPXIhz7hGMLrPqeF1pKpA/Ap1gTJiu0CgukdbhzrKlSRdIaf9n1Y1E6Y4Kj8dX2By3oQjhuW6IyCHokFvh1hs4dU19S/YMXoNRwfHMTejzINY0cUsBb3j0zbH74Bc9mI3v3NZDsrhRgREzWVPgKL79+BlvSCs96YUefIz642fgeyakxE1tlr1in7uhBixV2Ap3Rpo0ppu2hJbWGjDhvQyBH+yCZnoEyk+yeK/ZTTsB/fw8aKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcI58/eSQb5J+t2tbonV1v9rm/RuQrC7z/pByxUMJLw=;
 b=kdXPzGbwE2kCdlae+Zgcu+fnphSQDRUUxofs2LqU3nsBfhR5U9Znr+Ikum93UNhXLpm/RJPqjGx4EDAB6+wo6bwjmDaUwluoxI+xFecDRX1wrtRq1pa7R9hyKsIHGiK6Fj6IIcRlnwe40YWs6j1uQUgsskGVjTGl8XNwMy63peATxgUYFzXInBDJ6c41NMVATZPYh8c6whKYm6pvZVfmecJHtisxpxwM2ahdnzazTB2S2uUF5kABI4WvC+VG2V2yYtj51wtD4H3poYQudqXBneBVf66t4g/IfVimP3gz4PFDfI/3G8AnPYLHgY54SG1jMYnXnjB4au1kFqMfqnwgPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcI58/eSQb5J+t2tbonV1v9rm/RuQrC7z/pByxUMJLw=;
 b=Rp2GyqGP4gZ95IdjmiELh23vd/BBd/iW9Ij0/u21KBFeRME5myTEZiaurXOepXz3k5e5v2hPnyuvmHa7q5VjeRX4oQKe5CHX/jZBP/9OlwJWbilgvSuAPLLvu+qrlVJ3PrLseHZ7t2KJDPlyrZB19WyW9A9j+NtL/po3djOGMjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 05:28:18 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 05:28:18 +0000
Message-ID: <5a397996-beb6-90ec-979c-22c4bfd7dcf3@amd.com>
Date: Mon, 19 Jun 2023 11:02:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V4 0/9] ASoC: amd: ps: add SoundWire support
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 mario.limonciello@amd.com
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 7024279f-3558-405a-1ddd-08db7085fd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5CWNG3RAGPIwmBKwFZjdVl2dOPasZthV0tgRtIihiJmlfGDKS7JJn8ZWYcg1VYPVInuJmZwgvKf0HBelal2Blv/cXeiwOXfTkSes6VpsPT7RLgHXx/eJ4p4QaKpyEZRSlqL+MJHgVd2EUcYSKglg93IAygCZHGZCZ5mv9JMxdkPKmor77KVmHds6RGMc3UTBD4fzovb8bqq2vuV5qZA0OBydNd0JTnLue38/lJhzfoiVj/ce2udxBPkANRO3ycCb+6FGavR3Hk5FSXCyY3nTj6hsqBT3DuZq1EVJ9EByxrpzgnPTnsohNxrfYAW6ITLCKFajvm9spe65BOwoeuhl/h+IedotGSRVAgjYMTePiTv4yiPfE2ZTfe28WSx6pcLL8QAZNCRcivdthTYbyQ5jjQriOecQsp8/JynraUVWHX4IYVxJowJdfZjexN7FSqEYG0evUe2dBxgo2oHCDbwwlX0FwwDWmbQaw64zd/0dzyl/lK9eQTq/er1oV8lzavbTVw0Cu4Bh0u/Q++ropWzcwDYRMWeihqOJ58Z3byt77+q1+dfcJmQuwPKQxzzYY9dn1O1YIUlUbjvnhu8i3JYr62ORqThAjYkpoyDjewTBkww5prVjF/bVdJ1LspDAkhvGU+MdmrvrSb3vVpxpOYULQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(31696002)(478600001)(2906002)(6666004)(6486002)(2616005)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(5660300002)(38100700002)(316002)(6916009)(4326008)(83380400001)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mi9CZ0JnazkwU2VWaXU0TThWQTNKa0dyNm5taUFHWWxKdHQyQWNtZWZQVTlJ?=
 =?utf-8?B?N2J6NmI4Y25CUmp2NEhpaTgxMTZkNTRSY3NtQ0FrOTlmaEZlWTBoTUhraXFW?=
 =?utf-8?B?ZkR1Y1o1Zmw0SUFMMVpOejUvN1ZuODR1M1lqbFFDSjlrVkZtZDFvNXNsZmk5?=
 =?utf-8?B?VDh0TW52cExJMS9NNDhMV0N0TnN6Y3BxYlcrNmpjTDJtQmw1R0hqa0VDdzhk?=
 =?utf-8?B?Sk9iUkRkaWZGUnFMRVBTMWV2RUtoUHBiMG1GaHJYL0NuVkU4Z1BnN2lJVE8r?=
 =?utf-8?B?Qzg4N21OOTRrSmtHYTRtQzFxMWxEVnJ5SkhRZGNwdlhHenFFTXd0WkxpUmsv?=
 =?utf-8?B?U0h3d3l0Mk93RnJZTUhtUmR0dVdlVisvMmVmUE0rdmZtU25wckdsbytsdHdJ?=
 =?utf-8?B?cXkrUDBXVDZUU2RQaGZOczQ4REZxem9nTlhzNTNUNVBJcmpCK1grMGdPa2NH?=
 =?utf-8?B?Y0JzN3dNU2szWlE1aVh5NmlTMDdWQjREWUpka1dFRGxHTGgvTUZSczlxNmRj?=
 =?utf-8?B?Q1dxdVI0VTBsY0JVSkZZWjBUNGliOFBqTjlUb2hoOVZCcWU5bHcvOE4zc1px?=
 =?utf-8?B?dlRlbjdzRnVNTW9ZTzdvd1pjaUFtczVzZFhZVU4yR2FiSmZjR0ErOTA2QzVt?=
 =?utf-8?B?Y2c4c3lSTjVaOVpBMjFpQXNsajNnbG54VDFuSjh6WStqVWJ6M3NyOXUwZlhk?=
 =?utf-8?B?ZUtTd2JnOXNNcXZzWmRzWWc2UHM5RUJwcUdpYkZKaHA2ZmJZUVNaK1NLZEVj?=
 =?utf-8?B?aXhJL2xsN3RhQWdVcnpSV24yTE53eVFJellGRjYwTFZUL0ZEMGtrK1FURnYv?=
 =?utf-8?B?akxXaW0vb1hKZ09iNFJZdk1LemJEa3lTRkRTbjVUTFNMT2RnbG1MMll3YVdk?=
 =?utf-8?B?d3h6aWZEY0Nud2FyQTU2TEkvYWk3dFdOdWpXUmNBdSsvd3BNa0VjQ2t2bmNG?=
 =?utf-8?B?REMzS0hqNGdLVWdMUVYzLzdtdGlrWER2YmpnZXNOc29kVmhGTFF3cUY0V2NV?=
 =?utf-8?B?RGdqajJjZEpOTS96bGdEWHVDWGRFNEJLT3Bwei94dHVGYnBubFFNYTlaYkdW?=
 =?utf-8?B?UjExcXlpMnhXSkVvK2l5eUtuRjBmMjlybDFzUGprbFFOVVgyS21iNi9zQmVC?=
 =?utf-8?B?TEY2YWhWUmNQOEd3dzhIWTBkeG0rTWRMMnZzd2JMb0xsL3cwOU1mTUtBMEtw?=
 =?utf-8?B?V3JrWmZzcmlNblVNMTFpdnpZSmU4WHcydklYWU80KzFHam1hT09tZWl3dCsv?=
 =?utf-8?B?a3NWdnJqaE8zVXQ3bmxjQ2dOWDl2Z0RBRERjTTljS0lSdksya2doRW12T3JN?=
 =?utf-8?B?MldrM0FrVkVIRDAxWnJJVS9oVlk1ZVFHc2s1Y0FrTmZVN0xrNVdhNWtZRE5V?=
 =?utf-8?B?VzU2OW5yN2dDMFN4amxTODhsSytxS2xrcXFnN1NLWnJpaGtRa2s4d29ZOHBh?=
 =?utf-8?B?MitMWEN0YlJSWTdJMWEvWERPTkgraitMR0RIYmtibGNDSEF0emdPR0VTZDhs?=
 =?utf-8?B?Wk43L01BMTMwa29DYkFqODhHamRONGMzNTFaeVN0UHAzSVZ5K0FDU2Uyc0Ju?=
 =?utf-8?B?ZHl3cFg4UWVScVo4eUpXZ3QwSkwvMjNLS2xvaXM2cmxON2xtQ2xMc2VzWndw?=
 =?utf-8?B?cGZrN3Z1NHMvSnVnVlhkVGdNaTZ6WkMyMkYvVk9pZjgwUlhMbjNPT3c2MG5l?=
 =?utf-8?B?SjNaRzAzb0o1UXB1eTh2c01IV0JrK1BXRTVQRno2c3RYdllOdXIrdGFsMmFO?=
 =?utf-8?B?bFY1Z2o3M0dnNkpOVzZlMzR3TnUvMzlYZHVVMEV6WDZQZ1pOd0N4ZU41UkMw?=
 =?utf-8?B?aGJoUFJRTVVvbXd5VDNPMW8velAvMmlyV1lISVBqeC9McUs1MC9CMnNGODFU?=
 =?utf-8?B?SEMxZmRGNDJzc2VaOHlUQ1cvK1BzVlpOVEw5L3YyUmVnOG1qbThoSFY3ampE?=
 =?utf-8?B?dkJUNlVtcEYvRTl3OWxmMlJhaE52YVUyK1FyOHRqL3ZXMDhadVM5K3JaNjhz?=
 =?utf-8?B?NU9laXd6d1lnNWVQbUNGK1FkTVNnaUVqNk5iZG9QaXlsSDAycjk5ZThNUjdQ?=
 =?utf-8?B?Um1iazlYVXI2RWdIZ3dCMVQ4L3hQMUlLallkRVVOWTdROUI3MUQ4KzZQek5T?=
 =?utf-8?Q?ZZgDwhqnrkThP/I5peX/AVc9h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7024279f-3558-405a-1ddd-08db7085fd01
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 05:28:18.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rgpImVXJ5F743YPZQqmYPpW1pQmdHdCLJwKlmga3Mqi6vdyqWwEPBmF2LHfzvChuI0aflk4/NXUtW5nas5JBHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483
Message-ID-Hash: TBIQH67AL4FX65AWXL5UBNC5A4YCESYA
X-Message-ID-Hash: TBIQH67AL4FX65AWXL5UBNC5A4YCESYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBIQH67AL4FX65AWXL5UBNC5A4YCESYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/23 15:28, Vijendar Mukunda wrote:
> This patch series add support for
> 	- Platform device creation for SoundWire Manager instances and
> 	  PDM controller.
> 	- SoundWire DMA driver.
> 	- Interrupt handling for SoundWire manager related interrupts,
> 	  SoundWire DMA interrupts and ACP error interrupts.
> 	- ACP PCI driver PM ops modification with respect to SoundWire
> 	  Power modes.
>
> Changes since v3:
> 	- use pdev_config instead of pdev_mask in the code.
> 	- define platform device configuration macros rather than enums
> 	- add comments for MIPI DisCo version
> 	- refactor SoundWire DMA start/stop sequence using single
> 	  function
> 	- refactor "acp_reset" flag related functionality.
>
> Changes since v2:
> 	- add comments in irq handler.
> 	- remove workqueue for SoundWire DMA interrupts and use thread
> 	  implementation for DMA interrupt handling.
> 	- add error checks in sdw_amd_scan_controller()
> 	- remove passing "acp_lock" as platform resource for SoundWire DMA driver
> 	  and PDM driver.
> 	- retrieve "acp_lock" reference from parent driver directly and
> 	  use the reference in SoundWire DMA driver.
> 	- add handling for acp pci driver probe even when no ACP PDM or
> 	  SoundWire manager platform devices created.
> 	- Fix indentation for acp_sdw_dma_count structure variables.
> 	- Use macro instead of hard coded values for FIFO offset and PTE offset.
> 	- Change pm_runtime enable sequence in SoundWire DMA driver
> 	  probe function.
> 	- Refactor system level resume callback in SoundWire DMA
>
> Changes since v1:
> 	- update "soundwire" as "SoundWire" in code.
> 	- add comments for platform device mask and platform device
> 	  count
> 	- remove unused variables in acp pci driver private data
> 	  structure
> 	- refactor dma enable register structures in SoundWire DMA driver
> 	- add TODO comments in IRQ handler
> 	- update IRQ mask values using bit macros
> 	- Fix build error reported in Makefile
> 	- rename "sdw_dma_stream_instance" structure name as "acp_sdw_dma_stream"
@Mark: We have provided replies for upstream review comments for V4 patch set.
We are going to push as supplement patches for minor fixes.
Should I resend the patch series?
>  
> Vijendar Mukunda (9):
>   ASoC: amd: ps: create platform devices based on acp config
>   ASoC: amd: ps: handle SoundWire interrupts in acp pci driver
>   ASoC: amd: ps: add SoundWire dma driver
>   ASoC: amd: ps: add SoundWire dma driver dma ops
>   ASoC: amd: ps: add support for SoundWire DMA interrupts
>   ASoC: amd: ps: add pm ops support for SoundWire dma driver
>   ASoC: amd: ps: enable SoundWire dma driver build
>   ASoC: amd: update comments in Kconfig file
>   ASoC: amd: ps: add acp_reset flag check in acp pci driver pm ops.
>
>  sound/soc/amd/Kconfig         |   3 +-
>  sound/soc/amd/ps/Makefile     |   2 +
>  sound/soc/amd/ps/acp63.h      | 172 ++++++++++-
>  sound/soc/amd/ps/pci-ps.c     | 419 +++++++++++++++++++++++--
>  sound/soc/amd/ps/ps-sdw-dma.c | 555 ++++++++++++++++++++++++++++++++++
>  5 files changed, 1115 insertions(+), 36 deletions(-)
>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
>

