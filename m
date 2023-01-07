Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D369660CB3
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 07:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE961557A;
	Sat,  7 Jan 2023 07:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE961557A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673074774;
	bh=NydKQXBhr3YLEhfzlB86x4qLVkjgWeQ8QhvIKtfHwps=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=voWk7GkybURUPFGmZi4UbAE7kiIdFDnSFnFPaqfGf8jVpkarmJfLzDeo5TjLPLWdU
	 44gXTCwclq8kaOqTlapEVIIMwLc6mLEFaiOjgxOynkkYCr+39ZEmkXYbHdGm+1GH8O
	 MYkUqKvnzUIBLt6wDYMhOzsJ8P89mHsm61ZhlFJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD60F804AE;
	Sat,  7 Jan 2023 07:58:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B573F804AD; Sat,  7 Jan 2023 07:58:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C6CF8027B
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 07:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C6CF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dZEJLFui
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvOQd+lMV1z6EpctncxyrXnEmU6eTdYynkcHaoQUI8oqxK5fxMAq2SztJwM8wA9og2kDrbgq2R0MWqfH8JC4djLmM1ITXjXVCDdRB3949skfbZPorKmoU76BvDw2e8g9BcsoKwAXz9QocQJWezMN/9JMGZk06CR2dKNa9sMQPQr0kb5pzN3K86GaRJt48/6Ri5oONNHvBHKiQhfFxHJ3RdW6p6o2vWgkTOyAZVSmFpQRauYNZ/e9oZTYDUC/XgpF/tlQWxSXkHfjhxKAWwutKfbuTEzjfHVnw3KbqI0lUzgh5nKQh3X760LKAX8KyvrclbkcYuGo3OxNJDeZo5lthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYJfMSVP9p+xnohCe9auCFn2UPbtMOr8w2uWm+A6cTE=;
 b=cBDC2849fbJjxzUuc6mKMj/n/y2mL+66vUyY1GZZqx5lY3sYZdQcUcgPF7fFiDDSQlZ/IbF83tML/3GGN29Si0hXWTwCzoF7GJxHg4ONlPe7/uiwVCH/WpEMVTh6BgmmfvmdjVuUwSe/FuDGjj+buEuFD7d4CAg8/ZwSUVkKBUaba1SNDMEUq1H8yHucQCR/wdMeNcPP8tX6feXifV8arRcKOLvnk4oce4hPmlOrIBhUhlJ9JllWZPe/I2Gvz/8VsTuKyBE5o6pcItiMdQh4bHMHX3P0iiz1Nx+3x3o08knJvbenjTMLfL6/BieQj7O4/FeDWxcsj9avynYapFCt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYJfMSVP9p+xnohCe9auCFn2UPbtMOr8w2uWm+A6cTE=;
 b=dZEJLFui+ikntotjF/DwJpOLE+i/lWG1jvFzFDXZ44pdjiFqdj3dCfz9REaYBeWrFuuzR9k7LfqcEpt3xxOeYXf659fDL2xkrM3+9btZ6DD7piApoZCW9f5BHwUY9sW/eBGfQfILCB5IDKhnVdmvgYyIlVNCiWTYDeAZwwGmHpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18)
 by BL1PR12MB5350.namprd12.prod.outlook.com (2603:10b6:208:31d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sat, 7 Jan
 2023 06:58:20 +0000
Received: from DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::b828:7c21:5e7c:5416]) by DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::b828:7c21:5e7c:5416%9]) with mapi id 15.20.5944.019; Sat, 7 Jan 2023
 06:58:20 +0000
Subject: Re: [RFC] Sound support for Huawei line of AMD laptops using ACP and
 ES8336 codec
To: Marian Postevca <posteuca@mutex.one>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <871qo7fqjp.fsf@mutex.one>
From: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>
Message-ID: <598ca0a8-8aef-a030-7060-f76ba4700bbf@amd.com>
Date: Sat, 7 Jan 2023 12:28:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <871qo7fqjp.fsf@mutex.one>
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::15) To DM6PR12MB4171.namprd12.prod.outlook.com
 (2603:10b6:5:21f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4171:EE_|BL1PR12MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b909c8-45f6-41a2-e4b7-08daf07c8f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pH03aeHvkcPLc+szeABQJEtHvGVsdzWu0ktBqV+RjR4o/DbfFUmTU5w8BfzrxadDDq9jQYD8S3kVjSb+IljlNVYY0X5+RCysRs77I0yXG52ffVhQXdo3phnHkpwypf+KJ4h08ybc++OvvNHja9+bCKu6Cl4qv8t//QHovyWHYO6Te+GpLlZeUcVI83f9tlkdskoqKQfPjrWbe3t+ASXQqknu6iFEA0NKcpEYb7ZpN6XBBt2TaV/sRI/4jwMRfIsCtgtOWs3ka9/Pwy7xmeWiePC0Llo7k/vQblN1oOr52ZjBdgZQBaKe1TPO/GPNF4NEWpyUbhI1VuHID6lhx6gUY3xDruQFWrR2YXNYB80ql4Dst+Zec/WGY+xEU2HNLgEHRRoRa2mA4BgSk+TetezdKvQvPWz/bb85I0lK9qagQRBXq30ccX4kho/T6yR+u4xS63R5az87KKINuJq39KQwZbHe9RhuDo5DxxjhASGyBbliDgTDf/JLc7VVzlitcvrjSAEUjpxOvVr6JsbJOKUv6BEfvYQkqM2wttfWvc2Dvg4fjXV0LQ4fjfKQVzGxs5nO/Qq1oGhRTXyh0kFNK+vMwcuKHcI4OHDlg2HuZQr3LyEv3CXp3cZGC7EWgL16euMIc3QnxU+zZYVxtxcnGP5w0PP0qhokGfiFYTbBPBSQq3+ryj4lzd5N9i3ykRiHGMuLJwFZaMixXAUCM11+ThxIYEEAnrHHphlIJOwKB1u6fv6SJqs1jFL+AXMCm0qJw1NV71+T8xkyLSQF+m/wGAxGmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4171.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199015)(83380400001)(53546011)(186003)(6512007)(26005)(6506007)(33964004)(86362001)(36756003)(31696002)(2616005)(38100700002)(166002)(4326008)(31686004)(8676002)(41300700001)(6666004)(2906002)(5660300002)(8936002)(6486002)(966005)(478600001)(19627235002)(66556008)(316002)(66946007)(66476007)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFRFY0NXYXpzRksrei92UFE0L090MGswVVZtdWJraGhvZ3IwRHZDbGZpc2Fv?=
 =?utf-8?B?Z0ZlOENNbTVmNlpQbVF3UkZSRnVNZ2o4SnVIb2cyYTdkaTNwSmxnZVdzN0hu?=
 =?utf-8?B?eUdrYVJ3VjZpVWRmR0xUVU0wRFBQaTBoYTdIWks4L3BzQ1ZCYklUeDZwZlZM?=
 =?utf-8?B?NWJ1YzZpb053MkM5UGVRVFZTSWl2V0hoKzVWUkRqY082L2Ficm1XT0ZrenNm?=
 =?utf-8?B?aGdtbTVVVTdOWlFva0srRGw3S0cxcmkycS9seWlMTzU3RVdXVWVUNjFNNU1R?=
 =?utf-8?B?dGtreTEvRDJYa1gwR2FFWWF6dXRXOWxjcmROVEl3OFprTy9Ec1VHWEhPNUxl?=
 =?utf-8?B?V0hrQlJOamJ2SXFrNXk5QUVhL09JVUxiZk9PVGdxbGF1M3BSbHgwSmNaK0pp?=
 =?utf-8?B?MnQ4RS9IOHIxZ0ZOK0NtTHBPNU5KNldQR1lzWUFzc1I2NmRjYjlkWHE4QXVQ?=
 =?utf-8?B?djZzRWtsRXBWbGIrMFo2N1F2K1Uvd0hGNmI0U0NRbDJsU3hGa1V3VmthRTh2?=
 =?utf-8?B?VWhIVjJwcnExUnJoQldTOXM3REQwQ29JV2FhTGZDUEdQNUtWQjZ5YnZORjYx?=
 =?utf-8?B?RTBzY2F6dDR5WUovMFQ0SVF1WTZWU0VvN3pmbXU4Y1lKSkprdCtCMnZ5VjRZ?=
 =?utf-8?B?aXl5UkxIaVFGQ01nRUFDcFFYM09BWGN6UWFpVTA4WjQ0ZVZGSmpUZUpFUE4v?=
 =?utf-8?B?QVcreFRxdXJTaHRxbGdwaW5GWXh2dTd0Q2NhYi9SRkEwczIrQ0FEZXNLc0tE?=
 =?utf-8?B?Z0Z5dXhTYWR2QUtYN3JMbXV6aVdpdlNqVnEyTFNrU3ZtNzlrVUJiSlhIZzUy?=
 =?utf-8?B?Z2ZIdklCVUhoWjhpK3V6TG1sNGFRdXdHQWlkWkovakhHdkJXOTAwb05GS2VH?=
 =?utf-8?B?cGtFdjlGL1BkaHRUeVQ5aUxRbEp1TXF6Y2ZKMnc0cEJWM0RFa2hkMlZqRTh1?=
 =?utf-8?B?ZmRYNUZOU01mc3E5eHpicFI5VjdrVExuSTYzaW5TV3N2SWdWTkNZaTBWZ0dD?=
 =?utf-8?B?VXRPQ2RCOVBlaXBreC9IQ0lnOFJ0Tzl2VWxhbmIxWmxtZWRJYUJvQ0Z0YXll?=
 =?utf-8?B?T2JueDF5V2FaNnFjeU5TTnpaMGh6K0tRWEw3TGFHMU9aMTZQN0hhS0hRc1JL?=
 =?utf-8?B?aGhiRzdOSHNudTZNYW1CRVpOTU9tQTE5OUZBbVY2d3pCcHIyUzZCMTkxb0M4?=
 =?utf-8?B?ZExuZGt0cmRKeWF3U2VMSHNDRGJkTGpoWlA1RnRaMVMxb3ZYMWF4RTQrODlC?=
 =?utf-8?B?VlplckdDMHNrUHdRNE9uNzVFaTZqNUxaV1RMVWozMXFpd0JkM0dLVlRtM0VN?=
 =?utf-8?B?MHoyUjM5WVhpdmk3dzhoTTV4bjRNMmNncWFWY1ZiTm5YMFlUdlY1dFBVVlZ5?=
 =?utf-8?B?dUNyNlpOVFlCakNGdVRDeXlhQlY3SkVrRURpVGFneURUQUJWdlpjdSt2K1Vm?=
 =?utf-8?B?R1FydDUzN2o2YTFyOW1BRnE1dTBGb2pVR3J2T2lLR3lkUFBad1ZTaTBBZXZ5?=
 =?utf-8?B?KzN6MmlKUGcxMFpvaEVhbXoyVlpMYk1ya0JPZm1nbHAxbHk3MlVxcXBtclZT?=
 =?utf-8?B?UzlIRGs1Y3Nrem95SFJDanY0Q2g5WGlNb1MyQUNwS2xRUGx3UTRMVzBjQlBx?=
 =?utf-8?B?SkhTRWhPdS9wZXBsN05meHFhNTRQUG5HelE1M1htT1lyRU5rNTFJcW1KMEtw?=
 =?utf-8?B?aE9vU1NNNUlxaThoTkl5UjJMZ04rK3duVXNrZUs0UVM0Rndma2VhWGN5WVJj?=
 =?utf-8?B?RlN4aGlWVTlNTHFDb25ZU2ZMemdIRm1BOW5qSXlVRzZjZnJZSFhFd0dQdEJP?=
 =?utf-8?B?bnpUSk1TaGVETlN0UmZNWDdmc200eSt5MGZXRUtCM1ptaXQ0a0RoWHhVeDJn?=
 =?utf-8?B?UjNqdENKYTFTZXErR29TN01EVVZVQTlHUkpqc0QxSVZscnQ2c3J0ZVoxOURG?=
 =?utf-8?B?UklFZW9VS2pRS2hDSVloZjlXcUNtWjZKOCs5OW1PanVpUng3N2RYUWUvWk8z?=
 =?utf-8?B?WlA3b3k1KzFScEVHZHRiRGdtZHo3TC9rVDYvSWFJQytwajU3NlpqOElMZGxt?=
 =?utf-8?B?bWQ2RmlGRnhoMUl3MHJmK3RMYk1PUE9tU1hOVUJFSEQ5WDZlUUZFa1dLc2Ev?=
 =?utf-8?Q?lRpNg2u7uumF4x4OGuX6PHHoH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b909c8-45f6-41a2-e4b7-08daf07c8f74
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2023 06:58:20.0853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSFwYZlwWpF1IEpDd6u/dDuiQmV/QOXOeToBKNSlimZXSk0ONtba9pPFR6iQJAe/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5350
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
 Mark Brown <broonie@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 syed sabakareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Marian,

Thanks for the query.

On 1/7/2023 12:17 AM, Marian Postevca wrote:
> I have a Huawei Matebook 14 AMD 2021 laptop for which the sound isn't
> supported on Linux. On further investigation in Windows and ACPI tables
> I could determine that this particular SKU has an ES8336 codec connected
> to the CPU ACP module.
> The CPU of my laptop is an AMD Ryzen 5 5500U which seems to be codenamed
> Lucienne and is a derivation of the Renoir family.
> Acording to lspci the ACP is revision 1:
>
> 03:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2] (rev 01)
> 	Subsystem: Device [1e83:3e4d]
> 	Kernel driver in use: snd_rn_pci_acp3x
> 	Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
> 	snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x,
> 	snd_sof_amd_renoir
>
> I have written a machine driver for this platform and managed to make
> the sound and internal microphone work. I am looking to integrate this
> support but there are some issues with the current implementation of ACP
> support.
>
> As far as I can tell there are 4 directions I could take to add support:
>
> 1. A standalone machine driver in sound/soc/amd that uses the platform
>    drivers from sound/soc/amd/raven/
>
> 2. An embedded driver in sound/soc/amd/acp/acp-legacy-mach.c
>
> 3. A standalone machine driver in sound/soc/amd that uses the platform
>    drivers from sound/soc/amd/renoir
>
> 4. Use the SOF infrastructure
>
> Now as far as I can tell, all of these directions have issues:
>
> 1. The pci driver from sound/soc/amd/raven/pci-acp3x.c doesn't support Lucienne
>     since it blocks rev 1 devices in :
>
>     /* Raven device detection */
>     if (pci->revision != 0x00)
>         return -ENODEV;
>
>     This is the approach I took and just changed the check to add support
>     for rev 1.
>     The sound and internal microphone worked ok and I didn't encounter any
>     issues with it. Of course I don't know the internals of ACP and
>     don't know what are the differences between rev 0 and rev 1.


Not recommended

>
> 2. This approach could work but I would need to change the structure
>     acp_card_drvdata and struct snd_soc_dapm_widget acp_widgets,
>     to add proper support for jack handling (and maybe some other
>     modifications).
>     This driver seems to support rev 1 (in sound/soc/amd/acp/acp-pci.c):
>
>     switch (pci->revision) {
> 	case 0x01:
> 		chip->name = "acp_asoc_renoir";
> 		chip->acp_rev = ACP3X_DEV;
> 		break;
>
>     Also from the module description it seems that these drivers are
>     meant only for chromebook support.


Recommended. Please add below code

	{
		.flags  =  FLAG_AMD_LEGACY,
		.device  =  ACP_PCI_DEV_ID,
		.dmi_table  =  (const  struct  dmi_system_id  [])  {
			{
				.matches  =  {
					DMI_MATCH(DMI_SYS_VENDOR,  ""),///change accordingly DMI_MATCH(DMI_PRODUCT_NAME, ""),///change 
accordingly
  },
			},


at 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/amd/acp-config.c#n50

As you said add the   structure static struct acp_card_drvdata and also 
add the required dai_link of codec.



>
> 3. This seems like it would the best approach in theory, but the problem
>     is that the drivers inside only seem to add support for DMIC.
>
> 4. I tried to use SOF early when I started tinkering, but I always got a
>     timeout during init phase when loading the renoir firmware.

Could you please send  the error, we will check and let you know what is 
missing.


>
> So the reason for this email is to get some idea, on how to best add
> support for these laptops.
