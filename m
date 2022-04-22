Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9250B958
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8CC17EE;
	Fri, 22 Apr 2022 15:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8CC17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635980;
	bh=f5a6/c8ZTTNTGEixwoR7cJbpIPP4WPc+1cT5RCseOf0=;
	h=Date:To:References:Subject:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg5lvNyqeAgXrg2oqgJBWey43cmUmI/prk6o/0Ft1blYMxxGuAYIgmagWK6O1f1e5
	 KuIWY8fQHrpGp5G5SXNzL+CY2U6AGn87m3WhQLIpZ1FMPBjzYEOfPcy6HpwRJYWEa8
	 L06EYpJsHKzcQABE9vxuvmESEmm5KPWJsIs67h3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D67C0F80CBB;
	Fri, 22 Apr 2022 15:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D5F5F80125; Fri, 22 Apr 2022 13:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,GB_FREEMAIL_DISPTO,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn0831.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F3D9F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3D9F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="eGQAkagP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0KRPBzgmhBLcuERKDw7ClHzpxfO6Rz3sfBfjeNFkTMK2QvupC1KmpQykxONWnH6AC3IwJmZiClmNFTJL9Sw9Ms1x4MWB1W0cMsRFMvLF6JTVE9LjjHnayDp6cNUt9B9HDrzm0TrEWiWBtxcduRtROZXxutAtOiQdn5XsP+JVViSCNppqb8v3SCDJnjIx8A7c7L5A8qDgAZ6kJymHIDwNJbvQV9tjf7zNeCx4ssy8GfHSzV/s/cH71LPcSWTr1FYEV5iSzvPyErzJNQ6WDxOD/Y/U39bxMhPFDd6WTvltP1guXJFOKxP9VVAy8pDpIxz0TziU+R0WYVRfJQoeWgTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5a6/c8ZTTNTGEixwoR7cJbpIPP4WPc+1cT5RCseOf0=;
 b=S58JnGO3gL4o/N+LIDi3Gd6HO/qrlv3a74cdjX/oiJyxEOkBZ8L05lXUfPC+mklMHFOMu3oCxQqpii3Y8AX1zHCSFhmTVtzXE8TLwWRBAPUIiqp/lpzLIhdAgd5ddw9NIe/YNBp5jSn8TBOb4XTGBmiqO8nGQIllDAtT3OV9Dv/z1uL2LBCCDVwR03F/e2vZdK83D3Yo3ptVRQIQNs1HvioGTeDT125lz1CxF3ZdPZMeUpOP9tHXCkR5utgJp1pncgsrpXOX0NoNi2k+/GGMJyU3uGrL9a6RUb88I/H7Ojg5ul5yg60pUHQQDfE9vWEw9VH4QBhvyHJpNsaJDM+ecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5a6/c8ZTTNTGEixwoR7cJbpIPP4WPc+1cT5RCseOf0=;
 b=eGQAkagP+iy/Ns2asrrtGr03ZBjI9fkT5DndiJD+EdiYAobdeRoPLDYe0jyDe8gbEyYD02+IONmvBnI13OkyrhX3Cup0otMDoSaFW5u8T8B/eDi2j9NFKHjMs+JC4JpdWI4JBeEzZ8gVSi+3RUhskrRTEG9YJxKuLP4OmH9UyZ3vGv0AmSKq9TTGApPBBDS9qNIF74gVFc/Pd8S7Xni+Z/tkSil4tsFwIbA8vC/A0wqk/3fHXRI7wRt2cIxcY0CorCyH4drZf6PZl28/sk43QG9e2jAaxEobwTZPiP7lWG61chVBI4PVBljtHuBcY0ihhNlR732V62HP8Yr0OcKU1Q==
Received: from PA4P191MB1502.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:10a::22)
 by AM9P191MB1366.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:1f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 11:39:30 +0000
Received: from PA4P191MB1502.EURP191.PROD.OUTLOOK.COM
 ([fe80::61b4:dddc:b33b:bf57]) by PA4P191MB1502.EURP191.PROD.OUTLOOK.COM
 ([fe80::61b4:dddc:b33b:bf57%5]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:39:30 +0000
Message-ID: <PA4P191MB1502A15E592796A2BF2A1F3C9EF79@PA4P191MB1502.EURP191.PROD.OUTLOOK.COM>
Date: Fri, 22 Apr 2022 13:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
To: tiwai@suse.de
References: <20210111081611.12790-1-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Always apply the hw constraints for
 implicit fb sync
Content-Language: en-US
From: marco <mom482@hotmail.com>
In-Reply-To: <20210111081611.12790-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [3BNEiXHxlAyYit2FAmaRMQyJ03GUKYrL]
X-ClientProxiedBy: PR0P264CA0235.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::31) To PA4P191MB1502.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:10a::22)
X-Microsoft-Original-Message-ID: <6472c416-a1c4-386b-1927-bf01a8d23d44@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac121989-55cf-46db-a56a-08da2454c31e
X-MS-TrafficTypeDiagnostic: AM9P191MB1366:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: av4Wytg2Ixo1qpzTL088q/ckl7nZ0J/wTOGi+N2qfx+EPRfzLzQVU6LKuBxlLAQirC28aTdnTYOkli9nQl+zEtrNuxVF3EsXJbGESOHlrEtW2DWThb9QofhmQjLkSqBqmKmAG2u5BLf8Ectu2qm4DMaNkRzKur1SDC3SFmPp+BnmQOJZ8RNnAYnG8nuRfUohbnRkCcsd/Td3JIJk/g6fJxOm2d0hUZXX5vZSl6LxVhD++V7B8cKv490J/+BhV8P1zX1FCvm5kL1gHdUZ4RRKeqPV34pS2ZYs0jzsX7L8aPzidt9znTJMUejVEIjh4eChJIMD0n/IXiVazqyobnz/C7CCobGabt9CdxvlqjtBMsaYW/s+awSRrfat2oMvsvKO9WFVC3lF3D5xVUcc+tNPINyah1ts/j9p/U9fT9brdi2sxHQUlOL3e4cZGS9Sm2cdwDhcY0zft0C/YFWiLoMcKnR2ihDOWL+4GScCI76rNl4UWHGSWLjNWswOqB3zsvetCF6SQEmmwmF4bllS1UN7uOiSu1s1gUV3j3R2ExgfMK5t4YAbFXtU5qnzMspMygscEa5lr0qsYHvMAdVStNYv2ZQovmrSw0rbAJinQFDQnB8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2JyclFvSTlmRUw0amRuZ1pBZkhCbW9SMUNYUUhMNFRGb3JZeUFQUW1sekNS?=
 =?utf-8?B?MmRRaFVYanpURFQrVVVKMnZlcWUwT1MrYVlLSWFoTnhXOUNubng3N3ZhTG91?=
 =?utf-8?B?WVNKNjNYY0lsVUNNY2pxL21NZkFUTUk1dVdvMUVIaGg2NEt4d1M4QXhzaGJk?=
 =?utf-8?B?ZUhESTdOSFV3SU1nWFFocVBqbU80ZE1uaFpmOEVROFcyOTkxMkNIOERvdlA5?=
 =?utf-8?B?QitmYkNTRFJNMlZGSVpxcXEwN0dUWHdodlRXTmt2UDlHSWV6TkJ6eit1UDFG?=
 =?utf-8?B?TDkwYmk1VW1DOTYyWkptOVI4WDlCclg0T1RLRitmRmRLelJXK0QrbzZ2Z0dk?=
 =?utf-8?B?VE9CdHRyN0h0a1hvT1FHejBsUmZtZk1VZCsxYnBXemJaNHFwaXFYa3dWUmFG?=
 =?utf-8?B?dytiMmxXVkF0c3c3anhQQWJBUDFsUlUwOXllY25wUEk5QzhWTXNmZ3lXb2Iy?=
 =?utf-8?B?b3hpZFNobTVMazFlaEM2WnhDc0dVbkJHdzFncy9LS2NkOEdRSDJEdDQ2eWFS?=
 =?utf-8?B?NDJyOGQ2SmdXN0cyTVJZS1JxT1BMREdWWE5WeGZrTVlvRzBzNTJ2cDlMd1M0?=
 =?utf-8?B?UXVuTC9tQWxPY01za2kvQlRiNUhFS1ZIazQzZjhLc2svQmhIS2RVUjM3Qjdv?=
 =?utf-8?B?Tzc0RDREK1R6NldOK0MrMmozY0ZtUFVMUEpWUkVJd2NHNjQxUklOVGpsZ2Iw?=
 =?utf-8?B?QVh1YnFaL3N1VHFtS08zc1h3RTVFVjc2eGFBRmNkYjVMVjFqSmgwN05vcmpt?=
 =?utf-8?B?N21oUDZGSnFEZDJIOHBoRTA5N0orcmIxcXNuK0hFbU4wdUxNaldhdFJ3RHd0?=
 =?utf-8?B?UEhzcFAwbWovRkxHTGZoRGhlcmJXbHhrRXIrTlhJaDJWMFVEcWx5bmo4dG1l?=
 =?utf-8?B?Q0QxMTZiaTcxR0tQL0dPeXduUXJ6U2pXTGoxOUtVSVB2RmFscjVxYURHcU1h?=
 =?utf-8?B?YmowUmpsOWlZRGxuL09ncVV2YWQrTHozMlhibUFxVFdKakxmNWJDLzlmcmVr?=
 =?utf-8?B?V0g5MDBMTGlNM0FacVVoVW90bDZPRWdoUWNyczJaMG9RZ2ZMVXNOOTI5VGl5?=
 =?utf-8?B?L0taSTNFTWo1VGY5blJZUzQxL3RqZnNwR3hMeXlMNVBHOWZ5K0VqTWhWMDFt?=
 =?utf-8?B?ZkdrZWhoN0pyQ0FSU0s0aTM3M3FSVEF4ajM3ZmRIKzFrM09PVkFlQythTXhD?=
 =?utf-8?B?SW1iM2dCdTJYUS9qMVhFdzdlcmZMMUZYcTM4eG1XMGhqUElobGdHNVdnamhI?=
 =?utf-8?B?STl5NDNEUDBMemllUHBYMmFLVXkyMnFQRjluYTczcXF2eGZGb04wKzZWMUZN?=
 =?utf-8?B?ZEhwVmNUVVJMTzU4VnVodVB4akJIbHg2U2VpN3Q5WDBzVUh4L05DT29NNFdS?=
 =?utf-8?B?UUhhWnZMSGZ5c05SMGtPYTF2TUFhbkN0L3FUVVN5bDZHanE1QUtoNkxuRVd6?=
 =?utf-8?B?Z1pEY2JKMjNkZSthK1lzRXp0VVA3ZmF5OXRYWFozb000OFhhYzEzRGVvNnpY?=
 =?utf-8?B?aVNvaHpQTHNCbzlkakVWN29jOUNaV0tROUV2MXVWTWFNVTcvYjQ1U2ZwZWZD?=
 =?utf-8?B?eEg5WGdWaVMxMTBQb1ZyNE45bVZKaVZWaThBc2ptdkg2TzVTcDNNNTBUN0Vx?=
 =?utf-8?B?eS9YR0E5ZnNWekF0dkQzSFlWQlozMUZ6UzhvTGZzYjlSR0ZMY0VCY3BCUFRv?=
 =?utf-8?B?QnNHZlNpa09VdUxFS2owbVIyQmhDNEptSHhCdlpmWSt5bFl4Y2RGaHR4S3Nn?=
 =?utf-8?B?MjNoZW5SdEtHRHhzcW9iYkY0cDkxRVM5MURETlpTN1VYTWtWeHB3QU4ybmNP?=
 =?utf-8?B?ckhLUHMwTWg0YU5KMDNLYlM5YjdGOGptUDVKQnR5MWVZZTI2T2ZUdDhUM011?=
 =?utf-8?B?NlRZTkF2b2RTQjJySDdUNXlaa1BvTUUvaEZCbEFDeTFKTEk5RHJhOUx5UkU1?=
 =?utf-8?Q?/hLQqN4pNao=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-50200.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ac121989-55cf-46db-a56a-08da2454c31e
X-MS-Exchange-CrossTenant-AuthSource: PA4P191MB1502.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:39:30.2326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P191MB1366
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: alsa-devel@alsa-project.org, dylan_robinson@motu.com,
 kamilner@superlative.org
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

Hi,

This patch introduces the lock of the sample rate which doesn't follow my configuration of switching the sample rate to a multiple of the audio playing. Moreover it feels that the playing speed isn't accurate (slightly accelerated) when playing an audio file which has a non multiple of the locked sample rate.

Similar bug as https://bugzilla.redhat.com/show_bug.cgi?id=1930199

For information, upgrading from pulseaudio 13 to 15 has the effect of achieving the speakers balance at 100% volume only. If I lower the volume, it kills one side.

My soundcard is a usb Audient id14.

Could you point me to the right place to post the bug if not relevant here, or/and give me instructions how to revert the patch for a recent 5.17x kernel.

Thanks,

Marco
