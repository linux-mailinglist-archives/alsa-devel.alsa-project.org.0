Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610CD70D33A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 07:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD422200;
	Tue, 23 May 2023 07:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD422200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684820323;
	bh=ClL5vg5Nf/ot9uPEMfRg92XiAEcaNpprdSK5fvcbx+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WR+mEQW19onfQcOPDyZtIM1mM23aO/FSZIqRL+rbcGcFAVBxP79nYtwVClUqpHdlT
	 Z4ftvblRwGI+kEIcy7AkzikMwT2N+6Yame7GtWnr2h3ZoNlqapsaaUWxn/iGm1r4AJ
	 y5l8txZKcJ1WuuLpbIoPu68y2x3FpBlJY7TKSxl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11246F80249; Tue, 23 May 2023 07:37:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6573F80249;
	Tue, 23 May 2023 07:37:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E94C1F8024E; Tue, 23 May 2023 07:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B8DF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 07:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B8DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2ZBoeZ76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/u5rGBdryGGgnySWSYzjovPNPb0MFw2P83r6Jv0gszrW8NjThJpV3kHXgWA8vCUcW8b5iyDnopFSPJqcEav5lVaoIDHJ1uukU5rLK0TN4uEjTaERMe8zJRREC8e4jJ1Ooj1qbrVFlDdHYs2OZwRTbeyq03jv8vvNNLd9qJXJFFizfcUtojJbimVSXGKKO7SXqqAdJoJT0e8p30L4lrnD2TQWPYY80GPUtVazTaaG+8NXknRW9RXE8CpEq5oYFougFsArWryoZ/6M8VkbRMzuRtLLbU+on+6RUaN/pl1SjVMlKuf9Yp4sF1F0BoGzYr1eCtuAJkMvn0MJKfGjkhXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vma6AW2V+CdjI1cZUuA1Jq+cL8JFTRHRWjoblzZpNOw=;
 b=UcSv2VHtlmDQUgPctQAzBTTTgOsCy/yXNObOWIREiNkKKwbwn4dvqNYma2wKg16uOUcThNEHf9mIs82R0Qm6iA2s5ljtV3mHER329yHPQQooBbOPdyAIqzmV8CIaAsccvKWDwwvsOyadLqbQMmr3oa/KDlmrZI5RhkgsKaS8H9vw/LqoyksIww/Y/oWv93nZkHWKi0IViXeAyZA6KQarM7TG+EXcHmYsL0spacRkNtCM1A0P7NzRD4Jlzwy5xcNCZ6iMrTp225vOyV38D9EkAGk8DqddlunIb/tbkR93Nb6uGmdo5CUbEF7+5cCNB0I1XUPxInLqYNQHZ92hV3abEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vma6AW2V+CdjI1cZUuA1Jq+cL8JFTRHRWjoblzZpNOw=;
 b=2ZBoeZ76Geb0cVWKgWPAPShf4/aQKGqUd1axmL2cpRfbzFJy/QtBFAyryEQnwa+UoWH3egN9k5AokImDEAuMDIjtUvwQosWTwk83JFcz4qjfGXGg1BAyeCTEZH3XBOM6CWdHeQwVil4JTgXIEaQ1HzgmFxdSMKupk+isbFBZrb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 23 May
 2023 05:36:53 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::7c50:6c99:76d:f952]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::7c50:6c99:76d:f952%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 05:36:53 +0000
Message-ID: <f0fb9e18-4c75-52f2-a192-3aa5b15b2a9d@amd.com>
Date: Tue, 23 May 2023 11:11:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-5-Vijendar.Mukunda@amd.com>
 <42774a4f-ae1e-7d25-6b01-67f5af8400a4@linux.intel.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <42774a4f-ae1e-7d25-6b01-67f5af8400a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::28) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ce3345-8ea9-4eb7-df4b-08db5b4fb679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ctHlx7tf64unTnKHj5NZ0lEWqJxGxxacV0LHB+AkvRPN9Ywnj0ytSlvpiZbD/whn5Rbz6ssH4VMqBVg/qhuBAlNZrfx/WWdxE58y1aEk4WjV2RUpZP8PiJNTB/lYm0rL0YbJwceVPWwyXbp5DwDIdTKPH2AxZlEYm9QxAVhULBNXG0NQ27AA/Xb2RLdMYMAbUDhnCHcBcsQCrqi9kIuHi089MYPzlmPDiTZCNwVkpUGDCK6iq6VUSp8DD75ZWcN3X3Rd/is23jBZNHDapx03fpFK7uEWGkhJaSI+EHYd9L/x88HcxL2AyymY1Wnf4bsvzrcRPOcWFfqJv9i7/a3+P8jh/GKB+6PtkP+vCp/l5kg9TUq45DkYjPzq9EJH6E7WuCn/vmil/eAjfQizHsprwOyh5QUn9S2k2au0xWPeII840RoKLA4w390m0bwC2QrE53mgjKrsTOGMQX4PAIH0BAbaTSA1yCNmCSqIxHee2BZ6TAUySuE7sjnxzGYToMzIeWtT9dTVRm23fDmr4fy2Tq9TSv1oxRPBYnry8rUfiQfVjY+D9QNBlIK9Rx195U67EU1s5OJcDAoNbP00EZPsLl59Etr2gGgltmzatrA4rxfzjn88dGpP7q+xKUjhoLuzcu4TRfZ8J0ro/gwNVnFHrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(6666004)(478600001)(31686004)(86362001)(316002)(54906003)(41300700001)(66946007)(66476007)(66556008)(4326008)(2906002)(6486002)(38100700002)(8676002)(8936002)(5660300002)(36756003)(2616005)(31696002)(53546011)(26005)(186003)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0E3NzNWSVoxbVc4aFd4U0VIb0NHY1Vyc0d1dWluNklJNG9nbU9ocDV4STd5?=
 =?utf-8?B?UjdseGVVUjhhWjZnU0ltbG5mYzdLSUVOOTlTODBITGxsMzlnNXJCeUVYcTVs?=
 =?utf-8?B?c3hNeE5sa25JMlhqc05KMmpXd1RpdFcwVE1POUtCSUJpME80RlpYc09CVXRv?=
 =?utf-8?B?RGtnbkp3YXpPQ1RjMnB4YjBEdk8xak42b2IrUFVrME5BY0pQcmJFYUxYdzhJ?=
 =?utf-8?B?UUFDTm5HV2g2YWFCOTdlZFR4RXI5VmYvRTB2aXFWbXFlWmJReSt2WU5qTDRx?=
 =?utf-8?B?ME53MXUza05aMFpIbXFlSVkwajNmVjQ0RkJwU0xha3JLMTR3RWdhWTNNTDRl?=
 =?utf-8?B?WEdFWkZ4MHZwbDFNNk8xZnI0Q3hFTmlSaS92WTF2L1NrbHNTYzg5NThzZnl0?=
 =?utf-8?B?S3NNUy9xeUNsTWdWYlprOUlUNFN3dzRKaDBoUS91MWxWNkdGRkdUMnc5b0dX?=
 =?utf-8?B?aDR6Rko4QVBZTXphaFNGMFlpZkRNUWRpWmlINjd4cDJxSnhlL0VKYmxKbmRt?=
 =?utf-8?B?Q3Z4L2FMQnp1YWpZMXIrVzVpWlIzKzZBa3pORzhmZlhJZDZlMEZ0b1hHV0FP?=
 =?utf-8?B?ZlBVVkZkZzVyNHI2ZmFWR05XK2JGbTdZeWpTTjNzbUsyWFFPK2tXTi9BZTdS?=
 =?utf-8?B?bkVxY3ZYQ1VPZ0hFcjZua1F5S0lLaHhzQ3lYWFdhdnlXcWRrUGJyQXhabGhs?=
 =?utf-8?B?bDRZcXBPQXhsdktKaWVUMDhqclFyRWE1b1p4eUFTMHJiSXFaZkNmelQ4RUlC?=
 =?utf-8?B?NW55c2Y0aWhraVM2cU9WN3NzS1JLelpzQ1czMmtRSlRVREw4djEzTG5zeVFJ?=
 =?utf-8?B?Vkw0cjZEYllYNk5UK3ROcEpXU0lJekl4Tk4zcThzMG1MQ3dST0t2VjEzMCs2?=
 =?utf-8?B?cC9vWVhXN1dFdTIxV3dEVU9WRDJHMlVDMmhNR2NUR01UVCtBbFZTUm1vMGxN?=
 =?utf-8?B?UzFjdFpIUTBiV3BEMGZoa3RYb2lzb0lFa3ZMdVpUdWttR3F6V21nR211dXdB?=
 =?utf-8?B?QmtLbjg0dFE3ZVNzaGtiYzJGdDBlZzA0R1J6eUdSbTV5b3ZDczNmaUxsNFN5?=
 =?utf-8?B?VjVmdlNOSElqUXFkUUVTUHZicFl2Yy81dG1WOEdQclJRV2RBaCtEei95TEhP?=
 =?utf-8?B?d0dkL1h5ZUdZNGlrcTV1bjRFTkZpc0dOMGZxT1BEVURvRVR1eDd6ZXdsR3dn?=
 =?utf-8?B?RGc1SGZSOGVkc0NMVXdSQWFFZmM4T0F1L1VrZkNwWGJvdEZmZHRXV1VUc1FI?=
 =?utf-8?B?WmtxZE12aG1QMklvK2dlL1dqbUE5VUFna3hscUNLRVRnZTl3c0RzcHZQelBR?=
 =?utf-8?B?WktxMTdGWGxwL0hoOSt4RVR0UmNyRWI0MThYaEZKaWtqNmI3YVR5STZqTklv?=
 =?utf-8?B?MlB1ekRoa2RYbmx1QW8wWDRVRCswckxhRDhTYjlHNHVxeXl2Wm1odGtxWnJP?=
 =?utf-8?B?eU9VNnVJeFh0N3dJSU5zSklacWhsYUNKbE5mc05QK2g1dFZKUC9Kam9ndzc0?=
 =?utf-8?B?dFlva0pvZ21DZmRiYy9lNk9FelAxaWlYY2JiUkN1bFhsOW5OdHQzc3lLWHNW?=
 =?utf-8?B?Yll6M0h4WnpyTWtaMVhDWVN5M2hxSVVyWmlrclpmMHJlZTNFUmlXQUlUZVI5?=
 =?utf-8?B?enhJWTA5d1IwWTkwTlRKajk5RVhTdXgzdW5jNThpL2FZZ2FIdGptQXRTaUE0?=
 =?utf-8?B?T1lscnZKUVlydm90RGpubXg3eWlUclhrRTB3U3A2c3hwbWtUaWJoVDlRazZp?=
 =?utf-8?B?ejRFbGN0UXFHNmY4QVQvOVZMZmF6ZXFLZUptOTdoUEMwYys4Vlg4aWNtUUZ0?=
 =?utf-8?B?RWRCMTJlNEwxNGZZNnFYd3FkRlhDMXpYNkxkanc0Q016YXI5MHd6TE5FMnpV?=
 =?utf-8?B?aWhYcDJFMU5ULzBpY2lrbjZzTFlMK0tneHlLa0VtdHdnUkdRZ21odyt4bHky?=
 =?utf-8?B?bXl3OHJTV2NOSW5FUkJGUldlUGc3anJ1VCtGK1R6TFJQM280cEpBeFVzTVpl?=
 =?utf-8?B?ZldjdUtnRHBGZlNMZ1VGTENFa1k0WHZjdTZQZWNZRjUrdnE5M1hLQVUzT1Aw?=
 =?utf-8?B?SVFHOFpuaE9qaWtZYjFHUVh6NExLOU9adnJaenRXRnJ3aE1wZmpqY1d3R3Zi?=
 =?utf-8?Q?ZVO2yc6MYZcJPjaX8/YvpieH5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55ce3345-8ea9-4eb7-df4b-08db5b4fb679
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 05:36:52.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dzwxeoKCLCRC92l0y4U6Deucixxm2cm0VJCJ9KBXOLUHCk3E8225V0uVTAOFEW7/5spX/fzAboCfrZ2t9C1KZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
Message-ID-Hash: 3ASO6QT6QHSSBMXKYUWO2DCGATM6S2RY
X-Message-ID-Hash: 3ASO6QT6QHSSBMXKYUWO2DCGATM6S2RY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ASO6QT6QHSSBMXKYUWO2DCGATM6S2RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/05/23 22:09, Pierre-Louis Bossart wrote:
>> +union acp_sdw_dma_count {
>> +	struct {
>> +	u32 low;
>> +	u32 high;
>> +	} bcount;
> indentation seems off?
will fix it.
>> +	u64 bytescount;
>> +};
>> +
>> +struct sdw_dma_ring_buf_reg {
>> +	u32 reg_dma_size;
>> +	u32 reg_fifo_addr;
>> +	u32 reg_fifo_size;
>> +	u32 reg_ring_buf_size;
>> +	u32 reg_ring_buf_addr;
>> +	u32 water_mark_size_reg;
>> +	u32 pos_low_reg;
>> +	u32 pos_high_reg;
>>  };
>> \
>> +static void acp63_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
>> +			     u32 stream_id)
>> +{
>> +	u16 page_idx;
>> +	u32 low, high, val;
>> +	u32 sdw_dma_pte_offset;
>> +	dma_addr_t addr;
>> +
>> +	addr = stream->dma_addr;
>> +	sdw_dma_pte_offset = SDW_PTE_OFFSET(stream->instance);
>> +	val = sdw_dma_pte_offset + (stream_id * 256);
> what is this 256 magic value? use a defined or << 8 ?
This value is used to map to 32-page addresses in scratch memory PTE mapping.
Will use macro for it.
>> +
>> +	/* Group Enable */
>> +	writel(ACP_SDW_SRAM_PTE_OFFSET | BIT(31), acp_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_2);
>> +	writel(PAGE_SIZE_4K_ENABLE, acp_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2);
>> +	for (page_idx = 0; page_idx < stream->num_pages; page_idx++) {
>> +		/* Load the low address of page int ACP SRAM through SRBM */
>> +		low = lower_32_bits(addr);
>> +		high = upper_32_bits(addr);
>> +
>> +		writel(low, acp_base + ACP_SCRATCH_REG_0 + val);
>> +		high |= BIT(31);
>> +		writel(high, acp_base + ACP_SCRATCH_REG_0 + val + 4);
>> +		val += 8;
>> +		addr += PAGE_SIZE;
>> +	}
>> +	writel(0x1, acp_base + ACPAXI2AXI_ATU_CTRL);
>> +}

