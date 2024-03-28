Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC788FEF2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 13:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47DB2C84;
	Thu, 28 Mar 2024 13:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47DB2C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711628795;
	bh=Ub5iX4RYrg5JLHBwqVvujnoEKTZ9VbDRuroE9b+Ktcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nyTIbTAfyDrZuL0yUfo1K1vfcBAPC9vVEllW7xlE9dK2MHl8MeyzuEYc6PJfxgrLm
	 HU0f3NG5oA7P6uzTSarXcEQNbOHEm/d2s7Yi7uCu72fEjbqGT0aNs8DVCAH2Q4n8TU
	 paEP1VWCYkiZckjpFUOs5RkQEv3meC4rxJVluWBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B38BFF80571; Thu, 28 Mar 2024 13:26:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAC2F8057A;
	Thu, 28 Mar 2024 13:26:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E01AF8025F; Thu, 28 Mar 2024 13:24:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC17BF80074
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 13:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC17BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cHEQYfbr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Quv8LDU7QK+IVQrBwGsc4tm1EsyUmQFIejaV0aBfBfWSy3MQ8a/9U2pCHI4G+JoBWTvrLgwXLeddjboxHtZLYc0LHhKgPwz3b6WYdJBFTwHl1FYu4IGuvauU7c83Cj6CSaFXQfR9mbfPLx1zQzjU+vpsCGLcBTXvspAxLtDqm396xPpm2RpG06YBnSVa9sa7h/Ke9T4QzRqZkNQhYqYGgKKpyhGaert5ZKk9W73cNrmsC8Dx/oMz/cgUBQHx7VLr+ev48EIE5Felp7n82KirHRgLuem9fzRY+uBC8JDwajLs3FcEC84a9FoyK/eqlJs/bzLn8QfttFks4KmrQmTycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CabcTAMDAWxQkb/peH/RUA93pPSAMrirNtb2d/6HLFM=;
 b=PbVZfU9mCNOximYVUyAtJ2+kqho25Qup85Jp1j2Eb9Hu5yCop4eOxaHzJcHRc4MJPgEuytGilqwL2tQtIZQgIFGAzxoegbtrROnRaXYe8mGzubd80Mdu2B14Vb53z5iz0QEqAFs3LcYEm9OLMh9eP9RsGb+y/1ePoBXNaFRuNzR1PcmRKe/dQGBLd/Qnq9lOQHDV3oaXZJL4yZ4EaBs72AbbeS+/LVaznRUK1GIj4FThl0Z9JUEw5JSOCLPycSSBOxx7sd0dy+NPZIwJII6MQDxHSIwbXjVoLswF2DTBtem0z2xHqR/CaqB4WjzgBXYcLLgYpNfE9GhSilJu3eadcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CabcTAMDAWxQkb/peH/RUA93pPSAMrirNtb2d/6HLFM=;
 b=cHEQYfbrL1WvuFp8pS+VWUReXkdnBpm/jBgGaIdooCxddKXBRoKaM6wAYPtBDUaHmKt6QLqdPlWpvqAFB0uJeu49R8jgcUDWxKEO9Swj69EV5RLAVTZDA/GISunPv8MsYioPB1XAB7edMJvJlWTI7FUdoQQPvoUvVJ8n0aeIffU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38; Thu, 28 Mar
 2024 12:24:06 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 12:24:06 +0000
Message-ID: <c503a3ce-cb7a-4211-a15c-9a4ece8d1b6f@amd.com>
Date: Thu, 28 Mar 2024 17:53:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Soundwire: clean up sysfs group creation
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <2024013025-spoiling-exact-ad20@gregkh> <ZbpFTyW9UCZdCs_v@matsya>
 <2024032742-armless-cage-7c6c@gregkh> <ZgQWNjZ9EfhU5A9X@matsya>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZgQWNjZ9EfhU5A9X@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 878cdfae-8261-43a6-b996-08dc4f21f5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0qq/ynmQU9OVkoKdcuo3IKzOGCSXDcpt3JgwtIsHJz3dlBND8vqhaAlVzL4X99xwQPxTPOLbafBbYWmjqDq1fBkV0f8nSUQZ1kl3mvIIJV4g1JtPafCl83JJMEYcOnnTVi8i0i9GhOMgIVmyKwdwjQgwLFOU+a1z8uHnn/6XE8pSwLssVnIkoS0cX/u8l3YdIcmTSHkBz3w9sT1t2l0/JuiL5yORCxomTHa8O2c4VV3Tr8XKQ4c82GtStiwLvgJBHjjxl3hf/dZoHoJXJTpfRl8lqtXenO1V+Cfop9MT4v7NjI+COA1l9NJnUvb8zaWKm0W7qEyRvhXfrwPzf8zza4YCKz3OYpytaqz0WwJKHbwXM6ClaAv0aSC7xlLuA9HzmD4LrjWWrZAzftkwm+1QzwiQoZZuJoeHL1NSTxmbmeMCJpRHZ5kd7juef45H23DMWcIZsPqk4cQFxQOj8MZxcLhgxCu/ROaEFtNPwo1I1ufjE3Zt13a9iR64opI4XPoB76kPFnqHKTfjNKGYPjQ3fp6dUeErgSfSi8z1sN//BmCjrv6qWqUo6K7uwrHND4pns8tsQXKjO3j1qWF+tibYNlxndXhtKttSNfAez2b/Djg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlJwTkpZUHZEejQ1c2R6dDFiZDFra0ZZbDVEeHlXYlF1d29ValBSSjBDWXJ1?=
 =?utf-8?B?dUowQjFBcXhib2Npb3JzRWhBRGV6dFkwVFNkNVYrS3NZamZ6SGhDV0c4Zkg2?=
 =?utf-8?B?NFVLQlZ5K1pwV0RmVDQ2TUh3amM3SVpoeTVuMmFiOWU3Z0VmeCt0MStxRUN1?=
 =?utf-8?B?dzRFYnVYMGYycGNYS083akV6cE9RRG9xZkFTZVo1VXY4NlR4cGNEVVdKd1la?=
 =?utf-8?B?MlNESGZaM01HWXQwTmNleXJNRU53Mk1wcTBXd3lURzQrWnEvRVY3LzFuKytW?=
 =?utf-8?B?RDVZclAvOVZDQ21kRGJiY1pkNER6Sk02UmdqWmdqeUZYQkgxTC9yVmV6SjlO?=
 =?utf-8?B?SE95ZG5Idkc2ekJiZlZUWUVwQnJneldzaGRoMTl5Uno3VWFxQS9oY1VIQ0FH?=
 =?utf-8?B?aVVyakcvOGd1b2dnWHRNMVd4VGhxa2paaUN6NFpSQTR6Z0pHWk1rV3Yxdmln?=
 =?utf-8?B?UGJKMCtGandUNFdaNWNHNmxNV1FBajZadjE1QzZVeEsrdGtzQ0FkU3lIbUxo?=
 =?utf-8?B?UGZHdzRSNkhwRm80eEhMK20xbGZMZDZ0cVlhY0wwcEFUMDZlN3YvUUQxdEVD?=
 =?utf-8?B?L1Zmd2xqQ1UySC9SeTZ4N0xPRnNlQVlPMUVJZnJkV09RTVF0WlU2bHpZQTBM?=
 =?utf-8?B?WUhhVGhqOFQzdkI3bUpDeGdVS1BRYWJqN1ZtV3VQTlJybC84K3Z0Yytxd1k1?=
 =?utf-8?B?T2c5a0x0NytKNXFYcWdTNlljRFJYSVU4UGk0NmFabGNldUNyeWRwei82SU13?=
 =?utf-8?B?RXlJTjJKWUlCL3VRdDJrM0xDR3h3VUpQemt3OXBOMmpZMkV4SlFOUDlVTkUw?=
 =?utf-8?B?S2MxNTZrY0JXckprM256ZVBCUElSL0t1aDBzQUduNlR0RWpVRHhUWW9qOFMw?=
 =?utf-8?B?cWk0cHZGcWp0bmlLWUlwOWxkc1daT1Bsb3Jib2ZZME1qSSs1clpsUTd4czBr?=
 =?utf-8?B?eGVmMnNIVXFibXhCeEZaNmV0eWwzRG5OaHJ1TWdDRWJZdTVDK2N2Ukd1M0hu?=
 =?utf-8?B?TFBncFpSbzdQenpXOGJOcVFqREQvekdYUzNOQU9YSXUvaWpkcEx3OXRCTDNP?=
 =?utf-8?B?dDVxbEY1ckZzenpMaTlWd0ZlUW9tTW1GTHVHT01Qemt6QVl3QkgzdktQR1RB?=
 =?utf-8?B?ZFVMNVdFbkFwMmVJdEhZUjIzS24ybW8wVUh0TS9Hb2dkaWcwVzlKdWJDbzlR?=
 =?utf-8?B?allHbVllUEhxZVZScC9zbU90dHdoZjRXTDNVYVlHdUV2UGlWdVFOU3h5RUpW?=
 =?utf-8?B?b2Y2Szdza0d1OGU1ZzkvVW9pVS8rbk95NVVuVTlUa0YxdVFpeThuM0tXR3Zw?=
 =?utf-8?B?bThNWWlRVHRLUDlhMVNqK1VpRWdjNkN1Tk91cWhmck03ZktqeDRTWWU2R2lE?=
 =?utf-8?B?QldJZHQ1OUJLV3dWOTVKYjdqUHdHSnBNRmZVSmRGZmw3bTd1RDRjTG1RSTFB?=
 =?utf-8?B?YkdiZG5LblY2RTFLMDkvZ2Ftbm9xTFd6eVJkZllzNWtoVExDVUx4a0dmTk13?=
 =?utf-8?B?QitZZ0dOeENyOUI5Y2JEN3BhcnYyQm0vU1BSNDVwdlZYOG1XK1JvYkJrcDdm?=
 =?utf-8?B?TUxMYUkyUjBldXVKV0pLN29UN2pxYXkxVW1kMG9jZmZtRFdhWXNuSlZqcmpV?=
 =?utf-8?B?eFhLV3BjeS9oRWpKQ1pLK1RZcitnMXVjaXFhT3hwZXprZjdIMEkyM04vRm8r?=
 =?utf-8?B?U3ZjcHJpenRRMXljQ2ZJYnlmQ3dwZ2NWK1lZZXBsOEladjNDdUpBQmZMSDcv?=
 =?utf-8?B?TlpQMlhzVW53ZWZOL0JwM3NDbHFaZkxuNU1EaWNYVnpBdlJTems1VlJXVVJn?=
 =?utf-8?B?Q1ZzRUNEYVMrdUJHMks0WjR5eEhGbzN1TXR4WC9vUUxsdGJLSkMwRnpGOUxk?=
 =?utf-8?B?cC9iQ2VCcGFtR0hOUTVnalRGd0Q3SXR3dlpXMTJCV0FqVjd0ZEJ3Y2VHQlZW?=
 =?utf-8?B?c0xjV2R4WmkyY09PRFBWOGYwVXhBbCtwbmVWZlQ1NVE5VGYzSXBGck9nRjNz?=
 =?utf-8?B?aW9PZXRKSmFrcUFiZTdFRmJ6VmlXZDVoUWJmMkRGaTJueWo1d2NMeloyZ3Ju?=
 =?utf-8?B?bUViSU1NTDBiQkFyMWt0NjNBSzE5bmhKK1YzQm1WTnpIY1pwZkFrK3NzVHk3?=
 =?utf-8?Q?8zYeQolS/IOi2uDlF4aP2k/D4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 878cdfae-8261-43a6-b996-08dc4f21f5f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 12:24:06.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uCD+hDZtduQvRLqS7X815RDc0XWyx+G/FToynQJA+voRPZbkLEdmALCYVQNA1ZUps1kScAEuqEynTsanL4lT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
Message-ID-Hash: NB6NKSWQQHD262JP4YTOHLCE7PSYJ4JW
X-Message-ID-Hash: NB6NKSWQQHD262JP4YTOHLCE7PSYJ4JW
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NB6NKSWQQHD262JP4YTOHLCE7PSYJ4JW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/03/24 18:21, Vinod Koul wrote:
> On 27-03-24, 09:13, Greg Kroah-Hartman wrote:
>> On Wed, Jan 31, 2024 at 06:34:15PM +0530, Vinod Koul wrote:
>>> On 30-01-24, 10:46, Greg Kroah-Hartman wrote:
>>>> Note, this is a redone version of a very old series I wrote back in
>>>> 2022:
>>>> 	https://lore.kernel.org/r/20220824135951.3604059-1-gregkh@linuxfoundation.org
>>>> but everyone has forgotten about it now, and I've reworked it, so I'm
>>>> considering it a "new" version, and not v2.
>>>>
>>>> Here's a series that adds the functionality to the driver core to hide
>>>> entire attribute groups, in a much saner way than we have attempted in
>>>> the past (i.e. dynamically figuring it out.)  Many thanks to Dan for
>>>> this patch.  I'll also be taking this into my driver-core branch and
>>>> creating a stable tag for anyone else to pull from to get it into their
>>>> trees, as I think it will want to be in many for this development cycle.
>>>>
>>>> After the driver core change, there's cleanups to the soundwire core for
>>>> how the attribute groups are created, to remove the "manual" creation of
>>>> them, and allow the driver core to create them correctly, as needed,
>>>> when needed, which makes things much smaller for the soundwire code to
>>>> manage.
>>> The series lgtm, having the core handle these would be good. I will wait
>>> couple of days for people to test this and give a t-b and apply.
>>> I hope it is okay if patch1 goes thru sdw tree?
>> patch 1 is now in Linus's tree, so the remaining ones can go through the
>> your tree now if you want.  Or I can resend them if needed, just let me
>> know.
> Great, I was about to ask about this. If there is no conflicts I can
> pick this series (looking at folks for giving me a t-b)
Applied this patch series on top of soundwire git tree and validated SoundWire
stack on AMD platform using command line alsa utils. All use cases are working
fine. Tested-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

>

