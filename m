Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D966B8A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 06:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C97E13D0;
	Tue, 14 Mar 2023 06:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C97E13D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678770931;
	bh=jP6YRDS6cQYj61YHOEo9f0D3TFaOO3bO7HfuUTnIZiM=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Op4Pr80RMuYb1EHXFvaD9ImNyaTUtXlayJsZZdKhuXS+1eWtlc0p9A7ACaB9T4MOU
	 kmuz5U4ZErN2qTVCh/vrMNtAB2uxUJoMJhrk1/TKaF7k+CDzd6UPlcSFijllMynCrN
	 Sd9CKGh8wKWhf0hBZrSWlitBL0N7cJ7WjGgIN6Ro=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6531F8032D;
	Tue, 14 Mar 2023 06:14:30 +0100 (CET)
Date: Tue, 14 Mar 2023 10:46:56 +0530
Subject: Re: [PATCH V7 0/8] Add SoundWire support for AMD platforms
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
 <462d1c55-dc74-dbe0-b705-e5705631484b@linux.intel.com>
In-Reply-To: <462d1c55-dc74-dbe0-b705-e5705631484b@linux.intel.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2YYF5U2VM2OXTJENLDJ6FV3INJHGXSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167877086259.26.10167559519313379412@mailman-core.alsa-project.org>
From: "Mukunda,Vijendar via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 vinod.koul@linaro.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2FC0F80423; Tue, 14 Mar 2023 06:13:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9778DF800C9
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 06:13:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9778DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Urb68CpS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZB0DRJKCYoS0g5Dn2rfpEhOUNaoaUWA3U7FKtQj23Ix1QllKpTbEJ81yMYSJMsf6Recyjtjhbpq7G/K0xBAgw4MCHoxhmDo03TjGlbIfIOffviH1VbsMwiQGUTTBUXaqqiJ8KhM0FYFdqxD+7CJf9CfqGGfWOZl8k2f4RiDqPPLZ4DzKu8Q9W7GinpF7Rwj6E3HyJ6eCHvjV+WADyqNS+t2TUWrnUrAAAEhwqj8fPX1NoXwzj2fX3xsdhsa10ARP8PYti09LB2hAKsa0Tzu+8/BSRFEjTp0u9WoF8yGMpc9o4XXbCwgX8lax4l0FwJozboFLvFohkOYh5NoAuwzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iFHOqKdisi+Tq4PPnwPG2f3YZOcc9AVU18QUdWLbGs=;
 b=ZHUHP0l4W0Ity5HnsYggH5S/CT2Wvu3Yl6Aw0OW02hPXDokiZCiWAct4ObdzV76iig8EbBKDgE8ugVgBN8sZENZB/qM+UYe4im/osUsXCOD6jmekY862AT6ST+Kzg//mQP6YboK0t4yi0i2h5QfJQGDHR7Zr1VPs4qyNFWQ3jIcFK5vpiX/GKhgKmzr4jHR8WrI62RjwJmsoQ+uZHBEa5uK7qp5yDtaleEW1IIqupHA0xmEn3ga3nEA1MCH7MuvHEfOoiRVly8EWmEPHwDEAHdiPnyMcUHKRqFZXfK2l5ft6pwYK/hNSSHx7Mav1gMVU5k8iNUIqDUFO9sDOyysBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iFHOqKdisi+Tq4PPnwPG2f3YZOcc9AVU18QUdWLbGs=;
 b=Urb68CpSQrllFZhlwEbFd32zQT7jKo3CKvflKnE84Gsfn/XgAdliwIjkbvrjB9775zdgdf90F1Dr67kSqXluIou1/5ziFy9kSTwpIT88ek3RzRph2SPaZVIL/vsonZRmeX8t2FqR4KX4npua3kadvpKKnLspdfa0PIhVkpmYL0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 05:13:08 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 05:13:08 +0000
Message-ID: <6e035c86-829f-5620-df87-fd7fd72d7e88@amd.com>
Date: Tue, 14 Mar 2023 10:46:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V7 0/8] Add SoundWire support for AMD platforms
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
 <462d1c55-dc74-dbe0-b705-e5705631484b@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <462d1c55-dc74-dbe0-b705-e5705631484b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BN9PR12MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8244fd-84f3-48e7-1cdb-08db244acca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N0GvIuAFsD5P3XAA1wqc02eVigeSjTaZhCQEWa1O5e7AQGm1FII2J7SxCcyJxPM8Bpgtn0LJoede9TaHmRUMYJlc2JM5JIegvfYNZjecBM9GsmK4ku6H+ztcwk6bqeSN7Q7RFhJgXRF/iLOL/md126mJK6vWxV5nrriNQ2H9AAGdj+i2X0FwOgkcLMieq/zUHVFHMlRBYlQm+tilwezYcvmcTP1dmknWPYbUZrllCOE8qMVT4XCK0j+U29kYMhdBT+QRKwq2VF6bezwjpUX4q+uOvss50dlrIh0Yiya8FFcqyUoXqfhF1WaY/HOy34wyYoxUKT6nxZ+orWGWhf8zFWDeJhujASQrdF+JR9gv5zglatsK1pgg9TVf3zn8VkIR7unWkre32FlKxs2rXwnySXIGmqCyBQfPZjp47kZ9udEsOj0ajNnFbthJ4oRYTO+P2t1SA+eeDfwmjxJXirQ3kfB34FleklwtfIUYC9g7ZCKPzJtZ2U6jIgHqG0oPy4dndZ99IyvIE5FPv5zoKvk4oLxV6c633hflIs+6t3eMcEt0go+uO5WTUzKA6z1bmWBz/Pg6L9RP+lx+kMe870SajIG2dTs+PKp8XKfQd7WQYhXhKMi6HcPIe/Ho594Gxxmom9xGCMyLCnbJl4cslaEj2KU5MU6EFvv8P4SCVovtsIie/qOo44o1o22cd4KABnphLWbQNuc6A/wsRrnN02bPvSqiS2sBWkr1lPsxVQcbCp0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199018)(6486002)(53546011)(2906002)(31686004)(83380400001)(6666004)(36756003)(26005)(5660300002)(6506007)(4744005)(8936002)(186003)(8676002)(6512007)(86362001)(41300700001)(31696002)(2616005)(66556008)(4326008)(66946007)(66476007)(478600001)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1FFbEs5TGxZR3BaVVc2RVptdlpSc1l5aEJ5MHlvbkczZExERjV6TWxEWjRi?=
 =?utf-8?B?dlhwenc2L3hzL090cHpuVDk3TzFSS21jcFR2Y2hSWjF0aVBtWjRhVWpSd3My?=
 =?utf-8?B?OXFZQW94RnFMeGFjdzVQaEVFZDJBQ1gxSlBRcThlWFB2ZEFYdm9rUk1ZN2dq?=
 =?utf-8?B?YXNDQnRkS2kxcUEwemwxekVTRmR1clVjYmVGTDIwY2JsNnFLd2RLUFE5bFVG?=
 =?utf-8?B?QS81K0c0TkdjQzZ0b0l0OWRKWHNhb2lTZGxtNFZ5QU5KdEpRWkVWTitsek01?=
 =?utf-8?B?THRSeEpOQUQzeUxHS1NTSGtMYU5pS3VOeDBUQ0JGSFZDWXdwK2dKVXplRXJ3?=
 =?utf-8?B?cGs2Z0sybFVBNUI1RmcrSmVEbzhsaFJNWVRnckZFR3BRODRRanZZMVVLNG1Q?=
 =?utf-8?B?RC8xNmdZTVpkUWw3YUV1emlMQ3pjNThjNmpzajRHK0hJU05HT1JTTW04b1Er?=
 =?utf-8?B?UkZ5dnZ0TkNtMEY0MnVxRVhjTytXNFVyT2MzUXZHOWJCTGNOeTUyS1AxMjVr?=
 =?utf-8?B?NUVXc1hzc09JZ05IQ0RkYTZ5MnA3UlBKeVY3cVdzQXdCMGVwL1JSTnF6dWRE?=
 =?utf-8?B?SnlUb3pyS0hvMWIrNnFPK1daVC9VWmk2SVhsUkQ5d3RDRitHTmVGQTZkcXcw?=
 =?utf-8?B?WkszbWZhSHFONWhqVjRJUnN5a1pISkVtMEUxdGFrQjBVN2JpMnA0cjdESUph?=
 =?utf-8?B?b1RjRWIraGN3b0dvaEJ6RjV0MkNBaEtRTXZiY3BGdFM2NUFxMFQxbXcrN2xi?=
 =?utf-8?B?V0lCZkE1OFFSN2t2V3hIb0ZvbVo2THFrZUxlbHV4WlBKZDFZU3JYRVY4cTRE?=
 =?utf-8?B?T1V4S0RHL2Q3Vyt1NytNWi9JNFNIbnVjY3NGUWZwOHAxSkdGWEJ0Uk5raFEx?=
 =?utf-8?B?WThLdmFyNmpTQVVQZDRrU0tzNTJoRW5QcU9Zbks1LzdtbVhFL3ZUaHBhRWdT?=
 =?utf-8?B?QzZWTi9od0pyS2ZTa056eW50cWg1MVJtUFE4OCs5TjIyRjdNK3UwSEp3SjNK?=
 =?utf-8?B?VktVM24vRUQ0YlM3SHRtU2w4em8xL2wrcmVPWkNqYnlHOFozZ1VDa0hlcFNP?=
 =?utf-8?B?VDVSUUQweWhyUHdTTGJRdGRRTXNrU1NJc2hIOE5odFllanNjYlV3K0dWaHRK?=
 =?utf-8?B?bVVQUFIrRmUycENCSVpadThXMFpFYVZ0MTFGS3Y4a2JpaHVnY2x6T01IZGRv?=
 =?utf-8?B?bFZlMllYaWthaEJVUjhvbVI3dVpVbzJJUDl5UDhhR2I3UnNGaEI0dXNSVStT?=
 =?utf-8?B?V2VvVHBlS2lNQWQwMjM3ZzZqVXJiS1BSbGxiUyt3eEpobldnWEYycFE5RVMx?=
 =?utf-8?B?VFFWbDIvQ1o1b2NIc2k3NGFzT08rejFIOGl4R3ZWSlpRdkp5RFNOcUdITVcv?=
 =?utf-8?B?UGZ3VGdTWXdsdFRacE93bms5ZXgwbHdSRlZ1bjQyRzYrb0ZrTWdWeDU1NDVG?=
 =?utf-8?B?VFBOeWdXbmwrZC8xTXBTajNIL2c1bUFBUCs0Z1BITWdaVkV4UE10M011NGZV?=
 =?utf-8?B?T3lOZzRsYWRFd3FIbmRMSkVJT1U5Tng3RlNrWHhIMjVDdmlDZmJDVEhYVHhz?=
 =?utf-8?B?OHlYTlIzdzcwNno4NlpDdVpaQ3NrRzBPemowNi9rK1BCUnJzaXNrV3JZZ3Rq?=
 =?utf-8?B?Smw4aFBtNm0rdkdkblBySHF5bTArZnJWYnlNQXpOd0FzdTV5R1R1cUtTQUpm?=
 =?utf-8?B?aVBXSStVSkhBamNtWWdjSVQzS0lIdzlycHBpRklKNWp3REpGK0h4blFBcXdj?=
 =?utf-8?B?UFpzKy8wb0ptNFd2Nk5nYnpmN040Qnl6OEF4akNwVVVmNi9EZldBYmdrS0c5?=
 =?utf-8?B?VzhIY1k3V2VjZjQvSmpxa3lENkxRTUUzMi9UUENjRWFnaS9VMXBweDRiWTgy?=
 =?utf-8?B?YkpqaGxrT3NWdFVkVVdISjFIMmFrV3JiTFdDaVBJTjhZRGNHRDA2SkNsSkJJ?=
 =?utf-8?B?NDBEb1pyVVFOZ2daNVIzREozaU1NdjBhWDhPd09iWlE2emIwY2JyZW5USG1L?=
 =?utf-8?B?UjJuN1dGOTlQY2FUSVVzazRORG5FN091YlhqUnNBMEZod1EwT0diM2syZllw?=
 =?utf-8?B?eGpQOGQvVnJScUlnUEV6U3RiVUxka0N6dGZGc0lVMWNhSGMzdVoya1EyQm83?=
 =?utf-8?Q?PJlZqL/L3i8dSrUFvGC0v5jzV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c8244fd-84f3-48e7-1cdb-08db244acca0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 05:13:08.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ogfe+mFNFQIKWJONKeHSIO1NDTBLDsE3hiswoXrKkvuC5EuiHtjxvTD8UoSTVWWGc03g8D71mEAZJD4gCk0uNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132
Message-ID-Hash: R2YYF5U2VM2OXTJENLDJ6FV3INJHGXSO
X-Message-ID-Hash: R2YYF5U2VM2OXTJENLDJ6FV3INJHGXSO
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 vinod.koul@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2YYF5U2VM2OXTJENLDJ6FV3INJHGXSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/03/23 22:24, Pierre-Louis Bossart wrote:
>
> On 3/10/23 10:25, Vijendar Mukunda wrote:
>> ACP IP(v6.x) block has two SoundWire manager instance support.
>> This patchset adds support for AMD SoundWire manager driver.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> I provided my Reviewed-by tag for all 8 patches, all feedback was taken
> into account and the code looks good to me at this point. This was a
> productive interaction, much appreciated.
Thanks Bossart for valuable review comments.

@vkoul: Please have a look and let us know if you have any review comments.
We need to push ASoC patch series for upstream review, which is dependent on
soundwire patch series.
>

