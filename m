Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076ED69F0CF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 10:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A13E8B;
	Wed, 22 Feb 2023 09:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A13E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677056442;
	bh=T2iVT66Ctn2MpJP/98zjdJyyKAE/NAVjXBcJg8aR9Nc=;
	h=Date:From:Subject:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p3OrvdKCQrJJ5Nwz2f17MpsmAeHb+tBCI5euf4vm1+001ViHk+VuXuwCpdpOUG6Hw
	 fE1nX6O9eafbPlMj6hKgoJjX6J699VSQEiHbZJBXy6qYmCWDCfZ9yfgMmT8bin9fN/
	 3LKTABMdyOQlgh0AGhT96uSVlhBZYq72cL8pkQbU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5654F8025A;
	Wed, 22 Feb 2023 09:59:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDB14F80266; Wed, 22 Feb 2023 09:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_PASS,T_SPF_HELO_TEMPERROR,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E739FF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E739FF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LeFk/Hbn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7atHhFBJ8Y6IDjdoVDW7df5Y9vc8AmxMykGggv+6v4zcuM5iVXQ4vI555O0L6jXG6lBSQ4gtrIGVw/wLYbsSVWgmhoIHqJAKGCat4iYMPHImqChnCbihKyKG0oa0bRICg9UuxnHd+M+TB+R1N2/IsjbPEpY/aNaoWXw0je3nRT3HXUQaKNWL7df1YdxsCIKDiy2EsLLOhZNGH7PSMHHm4k+M/vsX63bCPnFawwowz8paEO1+L+eeXE3BI4gKLWKb+M2em4UaZ+kgRULpT1jcQ1Oeq0YdSI31Mkg6f86GmduQ4jDTRqXfbgcF6YzPybu6D5xHOQdwKvnuObQnpHzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXGsdylW+Z1XzCtqSK0PvoQ2U7pzX7vexJyj/SBfIZQ=;
 b=mZhh8lAC1Em/1keCjTkZ8QbMubRY2kDYAG8bZb0vH7MEF17KSWAK+CRPmVp1CU5XNCrh1ao11sR5p2ovrPfw285EL7MN6uY8GT2+uegEb7hvc9EM3hmMPtE5j0AwN6TW48OA9l2+btxzSFAZ2KZYyI41oMkmxTzQb5KL2qALD6UtiWgvYlnzZ1ScU/QkEXzgu4mMqEZIenmK13pu4VUhlngeVdx/ICifvYKY0ild/BrLpnuORXpfgt227VdKI2+Hd2sqNm4oLnozUW1ODW7eXNfwn7d0RzAtHv+1FKA2FwiquMj1A7dUBm2nBT4df66UBQPwiJZs+DhH4WX7slWs3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXGsdylW+Z1XzCtqSK0PvoQ2U7pzX7vexJyj/SBfIZQ=;
 b=LeFk/Hbn7ed7KHcBG9jxQuUspKiu0EYbaVq89/0SuMK5/EbgciIDomlDr5hZWu6l+qQ2w7va0GHN8RwO41G/lRrLZSBbVhsQk50jEl/ycqPSTcu9lc/tuO/yVwNEMd19ZFkeLPKIkbQ6Gw1o0rWe6P0Hn4yCdjpvwBF/CBYOVMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 08:59:34 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866%8]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 08:59:35 +0000
Message-ID: <078dd369-1365-24fd-5b13-92e2b71fca85@amd.com>
Date: Wed, 22 Feb 2023 14:32:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH V3 5/8] soundwire: amd: add SoundWire manager interrupt
 handling
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-6-Vijendar.Mukunda@amd.com>
 <bc6aa297-0276-9e84-c775-7fe735ddaafa@linux.intel.com>
Content-Language: en-US
In-Reply-To: <bc6aa297-0276-9e84-c775-7fe735ddaafa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 05309417-0b85-47a7-768a-08db14b31e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o2JaX+Vy0A2n0CZrWKwXguEdMavAC07Y9r2kohlS0IFll1CxNxH3Wh8nHiFt+r/43B7zrD7FUHCGKe42rLI3XDowp4dfIJvqdqum39xPGP1vaYalEZkWW4xTj18prbfgoCq6iRstXCgMN5ur5F5LZQ8Kf6l9lrv9lHOwXPwtx7ghE/3qp1wPlU6LCA9K9kclbp2urqyFRxivB/pZCIvwR9RZw3mvkACATSkMqvIklefzF10H+tTzhx6syQebvAGM9SHcoynTa24WLW7KevHdu/ta6WmH72ThYomjN6iew1n7A/h0aXeaInkrNA+WXVysbnnij5msgjTD1PyTIHzTi5/E7lweKKdwOYtEa5p4nQg4ArD9ozrK/0zcorwrmykkJceUUgvoFqXr2ods5AZzJ7SQ9A8FO1NrAkIt6PzykREZjuPsgvJscIovf2ZUucPqix1P7G2DSmdk54Huf35CVrHQT/eYKECgvJPcZ3Ye46VB9GZz/7tIYH6zvtKp3Ro6qN2L1P9b+T5O54q4KgyhlmvybQgzdyZYqXrOhDepRcMCBObrKgOzggC4etHfqJj0cmUR2eSgb6vSgu0+dQuG54H8esE5kRcgY2syxTOdN8TrnfN6fre+wyPyVwCseTsXFrKl4J1GqADhlidwHvMOEbxAvklDFHFXK9j+BOeLVJ6lljZlbckPTq9Y/HD2xzeZ+9Egn3aq8GwvgzrlUuGbUM0Turx5Onj6p2pmO6QXSkk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199018)(36756003)(83380400001)(6506007)(6666004)(186003)(6512007)(53546011)(26005)(6486002)(2616005)(478600001)(31696002)(41300700001)(4326008)(8676002)(66476007)(66946007)(66556008)(86362001)(2906002)(5660300002)(8936002)(38100700002)(54906003)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnBMTHhmekthclFoRjZlL0c4UHlJZXdEbTJ3ejRmaFpSd0xxcG9OZ0lYRHBB?=
 =?utf-8?B?dzd3NEhUSW4rY2lJRS9oOUxGZWZiNTUwWDg4bVZHOVZ2anFXeE41byt3YjF0?=
 =?utf-8?B?K1F6eE5ydWs3L1VTYWdwbDZIU0dFVC9RazJ2aVJ4eHpidmJqVTVUenZBek8r?=
 =?utf-8?B?SVA3UzUwNVk3c2Vsd3lwWDRQYWx0ODFscGxCd0RXYlBJeWRsYTJRNWhoUXB2?=
 =?utf-8?B?cFF6N0QzMzAxbkd0YUZDSC9KMHRQdjhNS1ZTVHJPcUhDNVBNT1kzVy95Ymlm?=
 =?utf-8?B?QmR5Z3NPYUpmRVYxaEFJYWdxK1ROdzdKTERSUVBRcVU5cEt5QkFGY2ZSRTZS?=
 =?utf-8?B?RC9MT0hEQjhQa0tvWXNndDNTb294cEg0cTBNaXJiWlpxQ3BxVExGSWVTLzNq?=
 =?utf-8?B?UjgvUE0xZ1ZCbTFKSlNlOEovbUp4ZUUyWWpFSnk0TGZNWCtwM0tRNzJuejAv?=
 =?utf-8?B?eWY0UkNYaFk5eWpVcGRLR3dEWEh2Nm42SElHdjZqd0l6MzBpV1pqeUswckhY?=
 =?utf-8?B?cnNHVFlKRjNrZDhXVXJRRm5FN2FaSE9oOG9PcDg4bDJwREpTTThVMWNyV2Vj?=
 =?utf-8?B?dmpSdEdobEQ4bVorOUF2djVBY2JpUHBvaEVBOElHa05uSkZhSVlPMlQ1UXNy?=
 =?utf-8?B?VTFISVBUbkNNOTg0c3J5c25BUUZ1VXozaFV5VW1QQVozT0pDcDFrZGpPdWJu?=
 =?utf-8?B?aTRMaUEzSWNTRW52cVJZR1Z5RkFkT0g4eFNRbm9lVG9ldDdEbTBmR3dFL2g5?=
 =?utf-8?B?Y1I5Z0ZFdXBpS0FvUFUxcCtOWlh1cTdkWXNDaGZ2TDdBdFo3MkpZTFhKNkdx?=
 =?utf-8?B?NUwwcUVzRlpHWWlKM2IyaE0wTGpIVU45c2dmQkNPU2RUMzM3ZnJCS0VyNnBi?=
 =?utf-8?B?QitiM0Y5SU5zQWhpdkl4Si9ydXpQcDZNc1pQK3duN29aS0tLSWl4UEE1Q05s?=
 =?utf-8?B?aGR5aEFSOXdvODV6N251ZzA2emtBa0F5bllqZW80WVlzeHBDZGx1OVFMWUQ5?=
 =?utf-8?B?SU5vR2JRWlc1cU0rYXlzMm9EczZ2aUJZbDhsVkZNcWVQRlFPN3lySm52azA1?=
 =?utf-8?B?RGFyTXJiWVY5S0RyWFlWOGdRVk5RRHZhbHhkOTFlaEZIamZkcWVSSVdmL01H?=
 =?utf-8?B?TE0yeXlzSzAzQ2xiMXBnVzdVc2ZFOEd1cmVZRzhJQUJUVU9FVDVpMGlxZS90?=
 =?utf-8?B?OXJrd0tpbDRzaTNiZFd5bkpSdG5YOXAzazhWa1N6M0VuUjVzK1NJMVpoNU1n?=
 =?utf-8?B?SmR3aFgyMVdFTGFiM2Y5ZGV2QlQ3cEY1cXNWTU1zYTBkcDVrc3g2dTdGMkpn?=
 =?utf-8?B?U1RpazdjZXRVTGk0Wm92dlZIYUdQVGVlWFdYMTl3d2VQNVltOTJBSlZmVm1t?=
 =?utf-8?B?YXhQMTlFM2FQTkhPSDQwZVZWa2pRUkRPWlAxTUV0UVY0ZDVCVXRBOTBTNGlu?=
 =?utf-8?B?S0d4blAvYXFBdVJPbFMzWnpRR3FRTHJEWnNlYnluWThkUjB4cm4zWVZ6SWRi?=
 =?utf-8?B?aVhwcmc1c3hGTzFscWJ1aDNKcW0rbG50Z2NJRGdGckxCa0xZU3N6akZxckFk?=
 =?utf-8?B?ek84c2JwczA1ODd2ZmFxUTBBV1ZpMTVZN0ZMaHBzZlZTcGxEd0tYMnFkQ0dP?=
 =?utf-8?B?TVNudy91YWt6dU5EOWsySEVncElKSlhTUldyeEJNU0l2SjJiRzk5cy9YaHQy?=
 =?utf-8?B?RTB5c0hXMVNzK1dDYmpDYTFKa29BUVlPcnFneHVocGkzREpTSE1zTk1zOEhw?=
 =?utf-8?B?UCttQjA3QVJ0d3l6WS9STDFjdGdUTWlNYTQ4bTBjWDhPenc3Q2NzMnNzRjBi?=
 =?utf-8?B?ZmhsR0lZUzVLbElpa2VKam5OcU5QRTNNb3RNaVRHckNOMVlpWG8xZzF6VSti?=
 =?utf-8?B?cDdYcHN3eEFxMU9wVFhkQk15d3RGUVpRSmNPY01ZaDBzcW92OWRXaitCUi9a?=
 =?utf-8?B?V3R6VkRXb2NQNDh6WS95VUVXa3JpQXVxTDJPUmZPNWJYbTFuMmU2UlgzV2lB?=
 =?utf-8?B?RU5UT2RPakJEbllYYktHbkExRXFyanBIa1NhbmFwVHlibVZ0bVQ5ZTJ0TUxH?=
 =?utf-8?B?Mi9EZUxrUnp3YTBkWjFMRnBLUE1nM2FMYTUxVDF1eTN4YnJFQXpsRXYxSGZC?=
 =?utf-8?Q?tre39xkE+osCyNrH4BLEHPhpN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05309417-0b85-47a7-768a-08db14b31e88
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 08:59:35.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eL5rv3PVabQ1S1SYCYP+CcAPspYhIUEC5U5ltk4E3yd5qa+4vZ9PiyqKNnrMpgiNisl63ZEFPtkkbaxes2sCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
Message-ID-Hash: FH4IGW3HNJ7FQNSF4HAKHRHATMGCLQ4R
X-Message-ID-Hash: FH4IGW3HNJ7FQNSF4HAKHRHATMGCLQ4R
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FH4IGW3HNJ7FQNSF4HAKHRHATMGCLQ4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/02/23 21:35, Pierre-Louis Bossart wrote:
>> +static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
>> +{
>> +	u64 response;
>> +
>> +	mutex_lock(&amd_manager->bus.msg_lock);
>> +	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
>> +	mutex_unlock(&amd_manager->bus.msg_lock);
>> +	amd_sdw_process_ping_status(response, amd_manager);
> do you have a case where a new command could be sent after the
> mutex_unlock(), which could change the response fields?
 No. There won't be a new command which will change response fields.
We are using lock to prevent peripheral registers read/writes during
sending ping command.

This implementation is used to send ping command and read and process
peripheral status when PREQ is asserted and this function is also invoked
after peripheral enumeration sequence is completed to collect updated
peripheral status.
> In other words, should the last amd_sdw_process_ping_status() function
> be protected as well?
IMO, it's not needed.
>> +}

