Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095F34649C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 17:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28CD1676;
	Tue, 23 Mar 2021 17:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28CD1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616516004;
	bh=XDRvjvwMhYefd3mTQfx6t33yM/wnuiUVj7T+/p0Qqn8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1CafitHU5h1Ccl1sjzKOyjqvXcfatycr0whjZYBWabLrQdRlNc5USqrVBv4fF+xG
	 rXjaHVGhXDsf4sjzfba/gkCHi30WCJ2qXn6mN38xOkl+Yq+qtrYtffHjLnDfEIfGxj
	 ZVkBkwjkuUFwhZZvCWNxW4jkPNshb/a5y+wsGhn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E23F80268;
	Tue, 23 Mar 2021 17:11:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90345F8025F; Tue, 23 Mar 2021 17:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01AAF80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 17:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01AAF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Uproc+e3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1E+DY1SXymLjdoRCJB+gIp9n7865QCSEuT8dYKtzIjKtePjbqh51BMhCw5Hwy5aQWyn6jtkydR8BoZp9mWge9qi+vPEY7KFfROJbrMPQFwaa40GefkcTWhsOvNR3xxWIgeJ3arxSnehbOwI4OKzgedFz48gVClnFuHHL0T2Pg1Ww9DbSLopHOTp3TK3sskjdHnkiHoLGQKC0ZVle7LuAquDfyRybZ0qPnM9DPF1oPcXD28mAbZNlsaGa9841PoPqDIIRnO78hIGRgLLmx9Jzm3eZ7emWvQbY1TEXGxLoEtAlf8VPUux6wxm+RdXeQXvK8kUNvAtQiDYJaKTeghFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RPfJTjAzA0cRZ5fHZT+Fgm24eFiv9sluERyuViCvtU=;
 b=h4XpLpo8uE8m2Qn9BMnEKz1CqIrfJzGf9XZHdeNm7U+VPP5h0tkmkMlFe6vptuPsQU4YAMEm3Sz7pWIrjvPsamXhjN4a/m1iVzpebMZhyOIF6hVIUk9ITyjXGavnxaVDosbjpquqg+G0OpKhuK2ii2Iw58QsIEIkG6SXkKy6FV24/Uq09I1ilZ4CBqMKmvqerGJQzFlO37Ejtam3TJ1+gnDdoLrzhRF+SUzD4qrwiCFoBFnV5jAa8XSCDZbNLmB+EyzlcPu5HN0mpIlfZZaGMnjrdzW1i5KUdVAgNAKdP+NK/xP/2Ef8LpvRR9EQd5NQn3YgdWNHL7i+iQ+a0vRWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RPfJTjAzA0cRZ5fHZT+Fgm24eFiv9sluERyuViCvtU=;
 b=Uproc+e3idBBwvRZLYWjuRYsydpqIHOO+l8mBYmkvEFU/dqK6v5eegp3RNVm6MWNNJjMebwrYpqeW345i1J3KRLXf5Mlv//Ke4dvSVTqVXVg//lyWCTdBConVjCoMHHEjbdHtoImDudN3VHUF0GxWqvQpSW9fxVjCtqfiyEZWWo=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Tue, 23 Mar
 2021 16:11:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 16:11:24 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com>
Date: Tue, 23 Mar 2021 12:11:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5him5hc443.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [199.7.157.19]
X-ClientProxiedBy: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.228.108] (199.7.157.19) by
 YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 16:11:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94d1fc41-5ba8-4262-6df8-08d8ee164dfa
X-MS-TrafficTypeDiagnostic: SA0PR12MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB459182BF2D7A2AB368F9CAE1EA649@SA0PR12MB4591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hosMi4RKsy6skSDSkjMOS1HLVdJhKaMGTFFU6hKCUUoRcKUe4vDQ0S9E6y4vrBZMo6y9dRCaxlhz0c3Efac3N+E7iMoSfbtlARigyvoXCgh4DVBQzSRdGp560pjYETMe6Ej0NZ+w7PcEYkKpR2pUma4qG0xSVHiafJL64+fE32qAL5tkdEwIm3YNzPMeQHXmX/x1qFFn2omBBJVcorh9WavQbDVPaIJOAg+/H16DzKjqfGLPX3cNLtTavWxLw6ELZa9YveIFcfJQ9MAGmdIruRtPYkmWofjPv8tSFWI/BOqGpHjLksPUDCk+MeYC4Py3p3flcIMFe3JeXTZr4df8ns/6TywWxX3RtVGwW4EXfYezDBh45u+RhvAw85TUVTsULB+VIn4pTHX+V+Fm762mHTFOZ08T+oHEqPiItMgF2jc7/14FfvQwsJU7/CDwowln2JxLWyIJ8Yn3kp1Ivv6xdQNqFTCCfm8kMIGr4/v4KKBhWn67kY7IZDDjXFMKNzuYfGgG1fgvVIkd7pkg2iDdwpWh3+xwwhGHXnF9ZvsKMq07cKhCv9vXdPe6VdkDm/lBVQGoZTOD7ENPm12OSInt+TNE9QOgWxQH+CoHUKjLSKhCZxkaoB0GDJ+iTExSFDpZxs56Ny+U2cUk2vyJX8OjH/ZIziWAe8yu++y2zRxeC2ccHur2zmXk9zEKuwQq/T+Zq8PUFthWRbYVEykCPFpHIGHPilCywY5IEpGZa1FODuQNO4mGux2iYGbGB8465cREa3mVULCNeBOjpwRpskt72JlJPX/kLst1E4tYB7Nr9d0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(66556008)(16526019)(186003)(53546011)(52116002)(6486002)(2616005)(66946007)(956004)(36756003)(31686004)(83380400001)(4326008)(26005)(86362001)(44832011)(16576012)(45080400002)(966005)(5660300002)(66476007)(478600001)(2906002)(8676002)(54906003)(6916009)(31696002)(8936002)(316002)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUwxVVg0aHZKeHN4U2VyQzVrREl2eHJLdSs4WFpkcHBBczYwUmo3YXVrVHVs?=
 =?utf-8?B?Qi92ZWRVZGdiUjRXUDRhcWNoNTVUaVpnTWl5NHY4QjJqTFhOWitGbWNBWlk4?=
 =?utf-8?B?ZGlhSlB1MzlLbWVnSVVvbGZDb3dNS3ZBSWRYTmNVMWFDSG55ZFdSS0V4ZzFG?=
 =?utf-8?B?NmU1bWNQOUhYc3BxSHRNVkVzaitOeXNDd2tkTmhRMmpoNXFwc2QxQm8reVlM?=
 =?utf-8?B?eG9BOWVnVysvVnBxbVVhNVl1eTBhS0ROUDQzMzFlQmV4S3dOYXZDV2xqZjUz?=
 =?utf-8?B?MFdhOU9yd21JRVY2cDBHWjI3a3FaSUx5RDJWVDBhVDRZckFzWXFLT1NZeUpk?=
 =?utf-8?B?SlJTcHVDSVFIMVd0MDRQQmhuT3lORys0ejFKY0IvYmdreFpTa0tpUnBDcnR0?=
 =?utf-8?B?c3IvSUxLMnRYRnN2cGszWTY1R1NkTlRYTFJpWlkrZEpDWlZPa0FhWnBJN3hm?=
 =?utf-8?B?czlmZW1ueFpnL3kwYVBYU296S3VrbFBabk5sTG1FWVpzeFVPNmpzNWFOT084?=
 =?utf-8?B?TUF1bWp2L2ZPcDRuQ3lvUS9xdktoWEtLQnlxQSsyT2hkbWJQRlNsY0VEVHRL?=
 =?utf-8?B?STN2dDU0Vm0rZDY3RGxPQlJieU1qVit4RFNLTHcxWHdFNDltVjMvK29vZEVB?=
 =?utf-8?B?Q3dvNWlsNkZYMXdkdy9IeEdyUlkxVVRGVTdRNUpTc1dSQWhFTk1vcDNmdzJ3?=
 =?utf-8?B?eHVqSjBLamZLYkl2aEUyZ1BzRnZUMyt4SlE2aUlBdFlSM1hxVzRlWGdVODhr?=
 =?utf-8?B?ekxFZ0x2L1Q5U1o5dkI0NTBrZkNYR2ZRUUpDZkVBczY0aU93RHNVSVFGQ3R4?=
 =?utf-8?B?WDNBRHZWNDRqTXp1OUxDQ2hFRC9KWW95YzZGWDV5ZU1tRStkQVJTSFJjYkxL?=
 =?utf-8?B?c3BwQm9IdUh6dUplNUoyUUV2U3JlWkFpSFV5d0VkSTNYWU5OY2wxQ05WRExl?=
 =?utf-8?B?SjRXdnZaemVXVTRQZjBNcmFhU2ZHZkZxT2xwdnZXd2h3NDEzK2xudWhhcCtt?=
 =?utf-8?B?RlFRRXg2UlU5anplaElUV2o0Q3h1Y0NhaEdOclM0c0hXN0JLUHBnV1czYS9l?=
 =?utf-8?B?UG8rL0hRZ0xTQzZteEdtNWsvbk1KTlowOWpla3BiVWgzMWFGQU8wbFBNbE1x?=
 =?utf-8?B?M3hkTVI2a0hUaVlxeEFBZ2xLMTJDN2pIcDBJemZZWk1OeUo5dmhPYWdsd2R5?=
 =?utf-8?B?TzVPUFVMVS9kMGJuNzcvYUNncWxaU2RHN0ZjN0QrZmxUemk1bkRjRWRULzFG?=
 =?utf-8?B?NWQwV0JCTDkrWUdxMyt6ckpEMkgyK1kwZ05vQ0k3aHNhaHQwcnFNRkpkeTQy?=
 =?utf-8?B?R1ZKUG5XdVNNME9lVTZBSzJQcU0vL2ZSK3RJVnVpL2M2cE1YUnBoejc4cGJL?=
 =?utf-8?B?UTl5OTVrUGhLR1liN3FGWUgraE0xUGQ0Q3Z3RGt1K0hRb1JWUGZOMzBqV0Z0?=
 =?utf-8?B?QW4zQnptOFRTWnpFd1UwM2pXU3o0T1dkKzhFQSttb21mVlR6QUNkREJUbEk5?=
 =?utf-8?B?QUp3TndEU093Z3VrT2NvUW5RQ29FSXZDZ0lZWHkxSGdSY3p0VE1hSlIrN0VF?=
 =?utf-8?B?bmdyMnp5UWVvMzI0ajlBTmlMdmJZOGJlRWswVGswZ0ZjM2txVitrM1ppZGti?=
 =?utf-8?B?bXhLajB4UlNQQUxWSzA4RmkyV0hDT0Y0eGE1YVpDaTVtS1F2NjFabnhPVTcz?=
 =?utf-8?B?SUNjU2I3cmZiVzNJY3ZpZjhkRFMycUxZeGZ4Tm5pQlBUTlVCTCtUenRxV2VW?=
 =?utf-8?Q?Txtfpbp02NUFXaKVZmMh6/lQe5QqU4UXS2Q86uS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d1fc41-5ba8-4262-6df8-08d8ee164dfa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:11:23.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyUmjvTenpzMR4ao6ydvgf80D2RprT0TFY8biivQ2ftwcnvv3AlV4bRzXpOrTZoUqyWoqV7Gz9V0wuQNgfE8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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



On 2021-03-23 10:54 a.m., Takashi Iwai wrote:
> On Tue, 23 Mar 2021 15:22:01 +0100,
> Andrey Grodzovsky wrote:
>>
>>
>>
>> On 2021-03-23 7:39 a.m., Takashi Iwai wrote:
>>> On Tue, 23 Mar 2021 12:23:16 +0100,
>>> Andrey Grodzovsky wrote:
>>>>
>>>> Just an update, i found the issue which was actually to wake up the HW
>>>> before doing stop/restart (using pm_runtime_get_sync), also handled
>>>> protecting from concurrent snd_pcm_ioctls accessing the registers
>>>> while the BAR is unmapped. Can go through BAR move while aplay is
>>>> running now.
>>>>
>>>> Once again, would be happy for any comments on the code -
>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C047e560ff3994f24656c08d8ee0b9497%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521081583290130%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Egfb346Qsxvdk33o1HhuBJihwbZRc8EZa9aJPzQ3Prk%3D&amp;reserved=0
>>>
>>> Hrm, this kind of change is a bit scary; we have some mechanism to
>>> stop the HD-audio hardware operation (e.g. for loading the DSP for
>>> CA0132 codec), but it's pretty hackish and error-prone.
>>
>> At least I didn't have issue with HW stopping, the problem is with
>> unampping hdac_bus->remap_addr - as long as it's not iorampped
>> back no code besides the PCI BAR move should run at all as any register
>> access from this address will cause fatal page fault. I took care
>> of most of the IOCTls i think, the interrupts are disabled in azx_stop_chip
>> but I am probably still missing some stuff like some background work
>> items or other IOCTls code path.
> 
> Are the all running processes stopped before entering rescan_prepare
> callback?  Otherwise, e.g. a process accessing PCM stream via mmap can
> run without ioctl and this may trigger the PCM period elapsed
> eventually.  

Is any of them remaps the BAR into user process VMA ? The only two I see
in the sound subsystem doing remapping are are had_pcm_mmap and 
snd_pcm_lib_default_mmap
and both of them remap dma buffers which are in system memory and not
MMIO space and  hence should not be impacted by the BAR move.
Or maybe I didn't get your concern correctly ? Why there would be a
problem to access the stream otherwise during the BAR move ?

Similarly, a control interface may issue the verb that is
> processed via CORB/RIRB, too.  So what you need to cover is not only
> about PCM.

Can you point me to the code path for this - is this through another
type of IOCTL or interrupt handlers ?


> 
>>> Do we really need the BAR remap while operating the sound streaming?
>>> That is, can't we simply refuse the remap if it's in operation?
>>> If it can be refused, we may avoid a big locking or such.
>>
>> Problem here is that this feature is for the sake of hot-plug of a
>> device, this supposed to give enough MMIO space to place all the BARs
>> of newly plugging in device. Refusing to move BARs because there is some
>> app using the sound card on the background might then lead to failure of
>> plugging in the new device and this doesn't sound as a reasonable
>> behavior to me. Also note that the lock's impact is minimal as it's
>> read side lock only in the IOCTLs an so as long as hot plug not
>> taking place it has no impact.
> 
> But a hot-plugged device can't have any running files, no?
> So at which timing is the BAR movement _must_ happen?

No, the devices this code is written for are those already in the
system before the new device is plugged in, the new device needs enough
free MMIO space for his own BARs and so this features enables existing
devices to allow the PCI core to move their BARs within the  physical 
address space such that enough free space will be available inside
the MMIO window allocated for the new device's upstream PCI bridge.

> 
> And, even if we need some synchronization, the current lock
> implementation looks fragile to me.  We likely overlook something when
> trying to cover each branch code path.
> 
> Basically it needs to wait until all running processes via PCM or
> control API are released.

This approach brings a couple of hard questions -

How we make them stop at once - they might run for long time, you
suggest something like invalidate all their mmaps and on next page
fault return SIGBUS to terminate them ? Then I need also to know they 
actually are done - should I wait for their device file instance 
release? What if they don't access any mmapped are for a long time ?
Sending SIGKILL explicitly ? But do I have the task id's of all of them ?

We had those scenarios discussed during my initial work on GPU hot 
unplug and came to a conclusssion that trying to wait for current
processes to die is not a good approach - see the this respone I got at 
the time for example - 
https://lists.freedesktop.org/archives/dri-devel/2020-May/265467.html

Andrey

   We have a mechanism to block the new opens
> like snd_hda_lock_devices().  We'll need an additional stuff to wait
> until all opened devices are released there, and this requires some
> help in the core code, I suppose.
> (Actually this hackish lock_devices/unlock_devices should have been in
>   the core stuff from the beginning...)
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Andrey
>>
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>>
>>>>
>>>> Andrey
>>>>
>>>> On 2021-03-19 5:22 p.m., Andrey Grodzovsky wrote:
>>>>> Hi, I am working on adding AMD related drivers support for PCIe BARs
>>>>> move feature developed by Sergei
>>>>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flinuxplumbersconf.org%2Fevent%2F7%2Fcontributions%2F847%2Fattachments%2F584%2F1035%2Flpc2020_sergmir.pdf&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C047e560ff3994f24656c08d8ee0b9497%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521081583290130%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7n2pk2fzcltX4UxdLnDlqZxIqtG2G6922XiDkJIVMeA%3D&amp;reserved=0).
>>>>>
>>>>> His feature is still not upstream, all his code and mine on top can
>>>>> be seen here -
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C047e560ff3994f24656c08d8ee0b9497%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521081583290130%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Egfb346Qsxvdk33o1HhuBJihwbZRc8EZa9aJPzQ3Prk%3D&amp;reserved=0
>>>>>
>>>>> I did basic implementation fro amdgpu driver and now I am doing the
>>>>> same for snd_hda_intel to support our on GPU Azalia audio
>>>>> chips. This relevant commit is here -
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1%26id%3D7ec0f60633e898cb941cebb3cd18aae1374fc365&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C047e560ff3994f24656c08d8ee0b9497%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521081583290130%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=o5Iv8aTSOyj3m32oA4Dp4k1y%2BZxFTStYMl%2F4ogS9OtA%3D&amp;reserved=0
>>>>>
>>>>> Any driver that wants to support movable BARs needs to implement
>>>>> rescan_prepare, rescan_done and bar_fixed callbacks where
>>>>> rescan_prepare needs to stop HW/SW and unamp all MMIO mappings and
>>>>> rescan_done needs to ioremap the BAR from it's new MMIO location and
>>>>> restart HW/SW.
>>>>>
>>>>> I am able currently to trigger BARs move by sysfs using
>>>>> "/sys/bus/pci/rescan" and the driver will go through the sequence I
>>>>> described above without hangs. Problem is that after this when i try
>>>>> to use mplayer I am getting following errors:
>>>>>
>>>>> andrey@andrey-test:~$ sudo mplayer -ao alsa:device=hw=0.3
>>>>> Downloads/file_example_MP3_5MG.mp3
>>>>> MPlayer 1.3.0 (Debian), built with gcc-9 (C) 2000-2016 MPlayer Team
>>>>> do_connect: could not connect to socket
>>>>> connect: No such file or directory
>>>>> Failed to open LIRC support. You will not be able to use your remote
>>>>> control.
>>>>>
>>>>> Playing Downloads/file_example_MP3_5MG.mp3.
>>>>> libavformat version 58.29.100 (external)
>>>>> Audio only file format detected.
>>>>> Load subtitles in Downloads/
>>>>> ==========================================================================
>>>>> Opening audio decoder: [mpg123] MPEG 1.0/2.0/2.5 layers I, II, III
>>>>> AUDIO: 44100 Hz, 2 ch, s16le, 320.0 kbit/22.68% (ratio: 40000->176400)
>>>>> Selected audio codec: [mpg123] afm: mpg123 (MPEG 1.0/2.0/2.5 layers
>>>>> I, II, III)
>>>>> ==========================================================================
>>>>> AO: [alsa] 44100Hz 2ch s16le (2 bytes per sample)
>>>>> Video: no video
>>>>> Starting playback...
>>>>> A:   0.1 (00.0) of 132.0 (02:12.0) ??,?%
>>>>> Audio device got stuck!
>>>>>
>>>>> and in dmesg I see
>>>>> [  365.355518] snd_hda_codec_hdmi hdaudioC0D0: Unable to sync
>>>>> register 0x2f0d00. -5
>>>>>
>>>>> Also I see 296.619014] snd_hda_intel 0000:0a:00.1: CORB reset
>>>>> timeout#2, CORBRP = 65535 error during the rescan_done callback
>>>>> execution
>>>>>
>>>>> I know it has to do with the move of BAR's MMIO address because when i
>>>>> disallow BAR migration by returning true from bar_fixed callback I
>>>>> have no such errors and mplayer works fine.
>>>>>
>>>>> I enabled MMIO trace and didn't see that post BAR move there is a
>>>>> wrong MMIO access - all of them are from the new MMIO base offset -
>>>>> 0xfcd80000 (trace attached including mmio trace and dmesg)
>>>>>
>>>>> I would be happy for any idea on this and any comment on the
>>>>> correctness of my sequence in the code
>>>>>
>>>>> Andrey
>>>>
>>
