Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B3347CE9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64EC2168C;
	Wed, 24 Mar 2021 16:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64EC2168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616600688;
	bh=/5/C2jirc0XZTrLvHiCPiTKHu4NbF2PB2vpa1DBV3oQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Us/G/tD6uqX8svEWEbL7d2Zk91D1BLwMDZVDcLSTlrHm3fTidmRmbgKVDtD9Tr/4D
	 GenyRd5xj1RYr+GoWwJvNBMXBotL7tn2rc0AA1M0iyRNrhldbg9uwxV72ZUo3n3uR3
	 qjv6bP0AtDa0ZmphhiU9VE/9JrDajfxDr1d//cBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD335F801D5;
	Wed, 24 Mar 2021 16:43:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB913F8016B; Wed, 24 Mar 2021 16:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A60CFF80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60CFF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="gFH13EnS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GESCooSqE49kVDnrHMpsY6Aiwo1pRJ0896+bSmvGtlS2Qlzj/rk4p8Fyb/l3jCYR/Mr/XmH6z5zy9q29hBD6BT2ZLJR0Hd7TJoEymo5XDLQXg4GlUA68YCkZV5/nMTMx/vg5w8WxbqyzXkWK8GYenwDDP7WoW2xMOH+sbD52ZnwbwDKfbCRHZOE8tZlFvUIhS87UuSKxlzXuE3CHl5iRgXN+Fk3IawOzqFVPTe3O01TliDqs2ZtNVdDUA2hlBWO65NmV8rNfSrqSoR7Ky6y2pEo/wD9f3oaNwdV/OUwEu2fAwc8uOf2XW+HAa/mo2YUcEjmHt/pNujYFLd1PCAyheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewGccEPWfaPhZiyXS6NUb2IINFU7TaS0ozwyjYCOXkY=;
 b=jWGgmyARHbsb1ryiG2rWyAqEUlamAQOPm95gRFhH41sBC95Go6VrzHCI/fOEgNinliGhY1PDyiE+Jwefk6BsX8T/vrfu+hiUn87XvLnaF83iVE45JPh1EX3ZmxIuWwpTMZV+q6+IdfbJt5Sgx9TU4MBAfeIerjEsQSDLZ7gvBG07HcZR4ZI/gjusPLPvVZaOS4SP/e/n8POt9Xlh8sEX2qmc/7mVTTt7FTs/tDesBOX9IAhUNtnYyeEfRoKDVP6XUTn5o16lxkPEsa+IYPrV+P+Hg27Ar5mA3bWrba/EZ3E69PHnZvwXtT1zgWJsxvMCNbwwSJwr+LaIa0vf45JnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewGccEPWfaPhZiyXS6NUb2IINFU7TaS0ozwyjYCOXkY=;
 b=gFH13EnSPw1NnNkoEF4MBVxQgnVCsdXfOu65Z1Qi8JA5A5+Q+ul2gsWxxwLQUwAvOTFaNqwRu1bqQVIVcVUqrcnIneF0tei1eM/hTknelWSAidmQ7S4Si/gsLp+HIuUC8xactyT/f/pQBVPeHbz7AFk+m9VSsSQ2IFWtQnZqUok=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Wed, 24 Mar
 2021 15:43:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Wed, 24 Mar 2021
 15:43:04 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
 <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com> <s5h8s6dbyr1.wl-tiwai@suse.de>
 <9758cd4c-1246-a4ab-74eb-0e060248a00b@amd.com> <s5h35wlbwye.wl-tiwai@suse.de>
 <06b2dae2-a5ea-0cc8-891f-2aaff64ae260@amd.com> <s5hv99gan2r.wl-tiwai@suse.de>
 <d9bc41d7-bbad-24e3-6ad3-90e6dd8466c4@amd.com> <s5heeg4oak7.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f97a59cb-869e-3e0f-305d-6d4a673f49c3@amd.com>
Date: Wed, 24 Mar 2021 11:43:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5heeg4oak7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
 (2607:fea8:3edf:49b0:3504:b347:a847:5b6b) by
 YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 15:43:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2afc0bde-cae0-436d-9b81-08d8eedb8366
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446278DB7000A69A31CD8A52EA639@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bXlzluG6TNudN3Modp87IeC7L+Bk1RC6epDrb8oeb8H1OZKFah8c1vvkygQ+YOENBISoGWHhBwNPT8H5KoxhrotR7B8swIltFnFRGWzj9OPAdZsRiOXFaLSxEXPP01uEQXO1V4Mk3dSWnPlV7kKxRsonjfcjT1cXcLwoy+4uhKxhs/EX3HvP2+Ifq1GixyvzVdc7JjRX3clbSw4DpBNqcmK2X6IzgrmkjN6t7hLsRheuG1mHMMHiOzUVWGi3USdS4bdggBK/2Wd1T5fnqGsr6Iw6Ce+8eiKCkJpOsv0N6EBZ2B/+QW9zwq/QeaL3SvXmbUidMgHzDPz7ZN5KHW99ZpXz/vOxPJpZpNi9A1PA5DXlAPY42G5lgYmbPnjtP3CUR5f9uj/5zMxQakKmGslf0COm116hgtfiWcxmZhkbBgtFMYiBdo+3gEfWtv9TuqD81t3gvqyxmD/CIjjZdSdaGruI4OHtnVjM+dxBlJNMOVenTLoW1wVXHIyT8QWEV7MW9MJLXNmAOy14YaewUJladAd1nlJ1qGLgoE1XdIBY1B6phyPQAGYxKEv11/N0MGk13J6JWDAtbOC6FTnRuRs3jXdfLp1eRdBD7ZgyQXBy66tljJEQCxANGo3gyN3JcqkFMXRLmfw/1sjuDfuSKK+4KAyKH9qjpGsU2aJw9U3zuHs4g5DkBt/Z47WuSZ5WSkpOe9COf+qYbRq0vrpXeYeMZ1hccw3RpDWZS/BG8uFij9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(5660300002)(31696002)(6486002)(31686004)(16526019)(52116002)(478600001)(44832011)(316002)(8676002)(186003)(36756003)(2616005)(4326008)(86362001)(8936002)(54906003)(83380400001)(66946007)(2906002)(66476007)(53546011)(6916009)(66556008)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?di9KcllRcU1EZy92N0JEbkY5VkNwL2NUeSt4alcxQnVYSDhjYUNydFE2Ylp5?=
 =?utf-8?B?MFBZSm5oaVM0d2ZtS0EzWEtDSXpMY3pzL3ZMZlFqOWVSNHVuSDE4MDhzMUEw?=
 =?utf-8?B?UXdNbmdKVStISjdGRlZWOEthQmZqYnRxeXpBYXg3aU15NGZzZHc4Q2EzeFVt?=
 =?utf-8?B?NThmckZxVlFnd2k0Y1VVT0JFcHN4WE1lV29ZV1N6VlZHSmhjRFlJUktBT2xr?=
 =?utf-8?B?bHhGdjVwZ3grd2lWQUdzam11aTBSZm9TQVpiSWVoYkJ3NDFqQlFqU2pjOWVj?=
 =?utf-8?B?WGJiRTlxYnNtR2tsMUZjd3NCNjI3MmpuZnk2QVN2bXB4S2hVdVZWWVpxZ095?=
 =?utf-8?B?RXU0bjVUV00xUi9QRHBjUnphNXBGSGw2WWJMN29FMnQ4a0R1VDdOVDhYV3FJ?=
 =?utf-8?B?UUxEQ0tubVZhY0tVMWtPUGVxTkd5cWt0MXA3WFVhaFR1ZFlNblYwSHQ3Y1dE?=
 =?utf-8?B?OGNPK2JCNFJaTHVvbGNMQVpHdWJGdmNMMHFNeTRlcE5pYkpRSGk2YkpEdVVz?=
 =?utf-8?B?L2U5SndQeDJ4MkdJMVZ6V1JIcW1MVU1Vdm1PMnZiODMrRW0wNndpeFZOYkhU?=
 =?utf-8?B?dVYyL1QyQ2Ezd2crMC9QZTNuQThyVUtpMDlCeHdxVHhRdkZaZ01mQW1ncFhM?=
 =?utf-8?B?NWwvMnUyZ0txNHpaYnZkV2J6MEF6YW5odDZEL3JuTWFidHZOaGVUd2V5dlBu?=
 =?utf-8?B?a20wK1JFRXd3Z1ZaYVg5TTVTWW5VeWkwdzFMSUFTUDRmdFA0Zmk3QkdYNUxB?=
 =?utf-8?B?K2orNituWnZ6aHFDUkRvQWpzdzVnWjUxdW0rSDVNRHE1OXJVeVlMZzVuKzdQ?=
 =?utf-8?B?bWNnd0FNN3l3ZXhPQkpxbm5EbzdmdUVPNlVwWUNrMHprUENHMzJXWXZQSkFY?=
 =?utf-8?B?VzNrNFVqaGxUbnlGMVJpeVoxbGIwZmZOdHlISXQ5M3NZNzlWTmxlbmpFam5m?=
 =?utf-8?B?eWd0a0NBdkt1anRUVWtRUWRWRWlJRGZNZ3dTamZsUis1ZlBYbU50UXNqaExG?=
 =?utf-8?B?U1lwMWlMblVGT0tiNWRTcFF6NTFUb054YkwvTU5pNnJTMnNDU3pLVXdJNDha?=
 =?utf-8?B?N3hleVljU1NDMGp5U1BlMlNyRUV2dlA1OGp0amJnbDFmelNGaFFJZHFyZ0NY?=
 =?utf-8?B?Qmc5SVI1Z3RmWXNDYnZmcmQ5dEZXeDhBb09xa0ZZd1Z5UkNpNjM1eXdyalB2?=
 =?utf-8?B?NWJOUEJhNVozamdjRFNFeDlyNTFhZWk0d0VMMmphaklweHVZdk5EQlU1UG1S?=
 =?utf-8?B?TC9sSGlHdTE4Y0dzSGRXTXVreE5hTFFleEpTaGlPTWI4UThXaWxnZFVKZmFB?=
 =?utf-8?B?eWEwaFJVd2hodWhGc0ZxZ2FFanBpbzUyaGZmT1IwdnZyNkRNMkpzNmIrRkFn?=
 =?utf-8?B?V1YyRGZtMkRWSytNY2MxVzYrM2s1Zm1FVjByTVY3dDhvbmZZTTdJOGZPNWdL?=
 =?utf-8?B?SEhMM2owZCtSbjZMd3lBRkRZR3hXZGRDL1VJR1lCRU54alJ3dFZXS3BoNkZU?=
 =?utf-8?B?dFlIYUMrQlRaYTJMakVUdmp6d1dFQnlvNGU4RnhMR3puVnlCcDRXd0FTTjJK?=
 =?utf-8?B?T2s2Qno4OGVtSkNLUW13Y2ZKT2h2U0c2S21vSHM2YVJjZVFWd3FDZVhNNGJy?=
 =?utf-8?B?UUJxOXRzR3M0dVVuSlYyMHUyQ0Znc1V1VjFaRUZ3Y1FJOElnZUlscVpWQXN6?=
 =?utf-8?B?dENRYXhCVXA4UTBJTHora0lZcmRvdmRWSnRJZHFza29zeHU0NC9WVmlzMllM?=
 =?utf-8?B?RDFKWVBkcG9JN0l4Y3laUnZldHR0UlgvT2d4dldVazZkVE50c0lncWMycGNr?=
 =?utf-8?B?cGZNeGg3UE9lOFZzSlpRemRCcS9kbVZZOVliRmVaZDdXckpUZDJ3OC9YUDQ5?=
 =?utf-8?Q?5DejJWegF3pS3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc0bde-cae0-436d-9b81-08d8eedb8366
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:43:04.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iExdIA7N74HBMR1xe8wwKmd0gSAX85zqU+i8TRX4GY6b3elcUzzpGadIJL67Tq6gjoNKXJkJnY8Aqigh6NhZYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
Cc: "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 alsa-devel@alsa-project.org,
 Sergei Miroshnichenko <s.miroshnichenko@yadro.com>,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
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

I merged the patches, since it looks like my branch
is older I didn't have chip->init_failed member and
also seems there was a typo on ur side as there
is no flush_work_sync, only flush_work which waits
synchronously anyway.

Everything works fine when testing with maplyer running concurrently
to PCI rescan cycle.

Can you be more specific what are those get/put calls,
I am thinking about some waitqueue to wait on in rescan_prepare
after setting snd_hdac_bus_freeze,
on wakeup it checks that a counter dropped back to zero.
Not sure on which entity to hang this counter ?

Andrey

On 2021-03-24 11:06 a.m., Takashi Iwai wrote:
> On Wed, 24 Mar 2021 15:53:33 +0100,
> Andrey Grodzovsky wrote:
>>
>> Appreciate you investing the effort in helping on this.
>> I will start to merge it now as it doesn't apply cleanly on my branch.
>>
>> If I understand correctly your main HW access prevention mechanism during
>> the PCI prepare-rescan period is by bailing out on IOCTLs with the check
>> of power state == SNDRV_CTL_POWER_D0 or waiting when a user process closes
>> it's device file descriptor in patches 2 and 5. For command submission
>> prevention you use the freeze flag from patch 6.
>> If I haven't missed anything I don't see how those all protect when
>> new device is plugged while any of those operations are already in
>> flight. What prevents concurrent HW access from an IOCTL already
>> running
>> and HW suspend and MMIO unampping in rescan_preapre which starts after
>> IOCTL began ?
> 
> The call of snd_pcm_suspend_all() is the key.  That puts all PCM
> streams in the stopped and suspended state.  And the codec devices as
> well as the controller device will be put into the suspended state.
> So, for the PCM side, this should be fine with it, I guess.
> 
> However, after sending the patches, I noticed that they won't suffice
> for the pending control calls.  For the control get/put callbacks that
> have been pending before setting the power_state=D3hot, they would
> still kick off the runtime PM and bad things may happen.  Due to that,
> the bus.frozen flag won't work reliably, I'm afraid.
> 
> So, in that part, we need the code to sync the execution of the
> pending get/put calls in addition.  Maybe refcounting the control
> ioctls that are involved with get/put calls
> (SNDRV_CTL_IOCTL_ELEM_READ, _WRITE, maybe with _TLV_READ, too) and
> wait for those ioctls finishing before actually starting the codec
> suspend procedure.
> 
> 
> Takashi
> 
