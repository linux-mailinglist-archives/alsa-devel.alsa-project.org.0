Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274EA345CB6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 12:25:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B858C165E;
	Tue, 23 Mar 2021 12:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B858C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616498709;
	bh=FmoSd/5ZzoPjBzPKUHTm4aLC4nX4JSyJ61i7yNUYMMo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/S1WVDGLRuIi9XSERgJ3SFPJTBXln3/oK5CD5u7XF205bFjqsNY3XYyd+1xVODhd
	 2Lnv9+K7RHKeLV8jocoZQqS5SK4L8t7H79APbCbhRCagdYNc7+uW+cWZ6A2jx+H7cY
	 FfTHYa2NYjNSTjuH+XJgy8iK0CLk+kn6/7KgvB/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B401F80268;
	Tue, 23 Mar 2021 12:23:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B08C1F8025F; Tue, 23 Mar 2021 12:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D331CF800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 12:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D331CF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Ze9zMNVU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvJLlCuziTKOzF5EsOuVzIiLRBAUSaWE2Ag5TwOQMXm8FLNxxkDeuJb3Sjpk8mzdkxNxm+Q0Ser7riiwJLFEm7CTMhvom3yveYDPmXqtSduoxz9NX6Jb7kNVw7jumHWOZNO52f0a8Za0HCSaKdp6jL85PNS8ZhxUAaklv2GZcloRJxJx8gV+aspiM0uZ2DvtBjLe3uFA2EZHK0v7UVMwFKpsGhNwsxKfE7tWv69e2UYYNBcevLo8q6YckV31d4h7TkEOazCwvMWsIE8MFMukBQZfUWP4jsFogbgfU/Dn0PgeSYvCWULjyS8EnqmGE0Fe8u0cJoaCaM2eOBAacYtuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeoJFg0+82PG8xsuK+OahYA9NmAnP+f8iN11li5zcYg=;
 b=IkNSpg13R+OCS+y7QVxTchlFs5QnK5zoCXz9pwp33Cj5shdNGP/8P0dXoiuLyPp+4+8w0O+DRHZ4Q6faezrLsDien5wBO4ZmHwiSh6pjeskWj/7iDjqFUQ2aeLTN5htS3enWS7a/pPdNb/iXlJRUPYBc0OgcY/kW1fXubLi1Zxc204nWyL0kxuWPERVJ5DmE0XJolvawUb23FV9Mt5pKaLU83hCawgKEXhiTPizWesnSpPZ2aaK/gmNGIUhxtvuQmfC2Uolls2lGwJtBtro12uCU3s95ghIaqAQcrmYPKynluPcYFc21g7dbwlBF3Yirz+iswnjhyshFZXJyhe3EHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeoJFg0+82PG8xsuK+OahYA9NmAnP+f8iN11li5zcYg=;
 b=Ze9zMNVUtlPE5wuu1Kz31sLNONTd6CZ+R6kpvN/DfJMROwfzCr/klhW7/vhVRJH8MDplg65iEeHIYB75Lr5ZFl2VipkViezFIwAJo0fKBamWC2EqPqDOPkGByp9PbtIBWnii+64xkDviNYd9x5I0OmUsu1njWEvYqKFHICvVXHw=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Tue, 23 Mar
 2021 11:23:18 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 11:23:18 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: tiwai@suse.de, alsa-devel@alsa-project.org
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
Message-ID: <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com>
Date: Tue, 23 Mar 2021 07:23:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6]
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6]
 (2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6) by
 YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 11:23:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae3b3ad2-97e7-47d5-5809-08d8edee0f2f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2751AE389FC2B36ECA090CCAEA649@SN6PR12MB2751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEzME9Z0uEvoSmIsit+KE+R46lCyEC4jz+6jxBr9RuVlcuh5t5jwZiYekOOEN28joHJWcCMqjCnHESf78dhEMmcctYlL4DhPAHeahPMg9sdfj9VeJaNZmKugaYHfqBR3zJjACQvWodQUmwxyWq7IfVPXHQjNlFvwwRkgvR6NF7aIUCttBtpEEHqEj0FtIeSbNdgGUllQI3TuBNzVhOXjr21RS5irn2otXiVAVlN7FumliNVqrkNKQttF260dfT345mTte0SWbj2MWymHTxXr4UhQNkGXtDHZCSNtBBV8ku8txby0J11VmaHa3HGlc9HJ3f2xgiw7wU2xpotSkM3T8CjwPvUGxCnanf6eP6LluQsHe+4ea2zvUJCQrBD0G8GTENHrpUVNeod/EVHlNqn+5LQRdq8DP74ACFvXhlP4vbc54QK6cOxp9suh3n9q2Jmi/duJxVvcl5lfSwl5Xamx9wtngg5Rl/GEG9OOdI14+gA0VWMcr2XByye9Wz/pcuRiJpGLuhHvCp6uXTw3KO05kv8eMnutrxDdWQ/5wfsO8lRTUR5jpVla2fuqbxyX/O3TFqIG6AfQCkUnjzSmrwqgaWjii0rKEwz/0Jyql4jDkbQp/Hpq1gTqLKwp8uB/naYW7OpAJvFhEFB+Payli5Ac0RVqhU6XoZR6RlO4YWl3PVMP+2lpzXA3FPKLsXCtnjQApo39/fWanXu+71XZ7ATrbnCPHYI9ZEyVT14Oa+/GBujxU64ZD7l1KgkvB+iEsIwaBTQlKqHs78Rgvpt6MZcwU5D14P3kLv7zC4jp4zGooEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(83380400001)(4326008)(2616005)(478600001)(5660300002)(66946007)(53546011)(6486002)(44832011)(2906002)(31696002)(186003)(16526019)(31686004)(66476007)(8936002)(66556008)(38100700001)(54906003)(316002)(86362001)(36756003)(966005)(8676002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGp0ckN5WjY5aHNXTXhMYWg0SHMyRXc1UXd0S1p2UktGU0VlVGh1VkFCSEdn?=
 =?utf-8?B?bVRTdFBxZGF5aEg3cndLRzc4dTlkWlJacUsxSXZ2dlJ6aEJaUnJVeHV5a2Rn?=
 =?utf-8?B?aVMxY2poQ0pIZXViTGhEK2tPMFNFdUN1VnFrVXN6dlg2MitoakpxTlRwNysw?=
 =?utf-8?B?Mnk3Z1J3MG9tSUFNNWhqeDlPeGwyN0RvTUhPNDQ0Y3RRYURrVkl1ci84ZmZp?=
 =?utf-8?B?K3RYdUhSaDZMZFgrNWJvU1NkR2huTThGVTBQdFlWRzhYQTQzdXBYK0JHWDdZ?=
 =?utf-8?B?SUVURm51aExVT284RjdObVNFR2xqRUUySkkxVE82cHExNW1GQVMzWHkwVXcz?=
 =?utf-8?B?SGk4Y0FmdHdPUzBoMHQ2YUxxc0RaUU9PZ0hLeXFFcXRuMkNYcjdkeXpYVHFj?=
 =?utf-8?B?YSs4V2x3aW90NDRkUWVPczZaVlJqODdleExndHQ3WDJwMWEzSGhzTzk5bXIy?=
 =?utf-8?B?Q3JwUVVZZ0xsRjFtWnVpay9xcWhQQldYVXJDb1pUR2tjYkhHRXJkSVkxVFRY?=
 =?utf-8?B?SGlCL3J1c2cwaGdoL3ZyRkh5L3VWU2pwYjVmck1ZcHNNM1lnOEdRMnRFTXJ4?=
 =?utf-8?B?MTRnNVpuTjhGbXBrM2NsYWdSWi92bWJEcmlxWkFTVjFGODNYRUNHRjM2R2tG?=
 =?utf-8?B?TUUzR1RiNC9wMmJRTXhSWnU3TjFtNDNmbUJHN1VDMlpYZHRsNzJmcXUzWlEv?=
 =?utf-8?B?bWlobmlxTEFTUzZYNDRoUmRybDN0WkN6OW1nRFZCOHR0WGdpSElzdm4wbXlE?=
 =?utf-8?B?TGgyRWUxZmVVZlJnS29EM0hBQzFoZC9mM1BLZ2dVQlErUGZjSndMNGZybVBs?=
 =?utf-8?B?WGpzY0pTOWtLRStJdWlKYjNHdVVpYkl4RUcvUGVPUm9Ob1QycmRJQ3pNWEFp?=
 =?utf-8?B?TkVhTkpGak5vZ3ArQ1FseEdMd200ZnA2c2NYeUUyd0RxbUpIdUlJeGF3eE92?=
 =?utf-8?B?R0VwNjFhT3dGSDZpdVFidHYxd2IzaTA2bDM0L3llazFzRVpKU24vcnVOcmI2?=
 =?utf-8?B?N0lMckxCWVdpbUs3ZjJxemx1QW9UL1dGMXU0VmJ3T2dQMG1KOTFjOVV0UzJr?=
 =?utf-8?B?dm9PTEFvUmp4am5nMkZXTUlrYStJVVArTmhqbU5neUxEeEtvb0JMSkZQZWxB?=
 =?utf-8?B?WHRJcGIzZXBaMStSUE1qb3Foc1pPamlwNkZQTzFUVGZncVlkQXd0UFVqWWxT?=
 =?utf-8?B?ald2bHRJd2ZCZ3dFSWJBWUxIcDlwdWlNdEhZT3hQMEFVZTNwbzdmWnQ1WE1u?=
 =?utf-8?B?U0RrOEdESVFEUmdrZ2R1TDkwYkVRcHk1NFFoTjdkR0dCdU03Mzh3TkRxT3No?=
 =?utf-8?B?aHI5V01mY3hhVW1JNEt6aWJYTlJ5Zk1nTW1NamVQRFEwZXVITktLRlJpakww?=
 =?utf-8?B?NTRaWDVwcER4c0p3cFY2SWE5VVA1bEsrV0NYUll6Um11bUJrQStndVRaR3NT?=
 =?utf-8?B?b3EwR0d2YWJVczYwK2J3dDZjb0hKNWZodkRBZUtsSnVTc1MvU25jNkhoeGRU?=
 =?utf-8?B?L1RFdlJaVENQaWY5bXd6OVFraE1kc2M5N3B6aVZWYjBuS1RINVBIL3NzUm53?=
 =?utf-8?B?aVdlSzU5L3h1TE1oYWZMVzFBdVJKUlF3Qk0zbFI3My80eERYbnlOc1BnWlBh?=
 =?utf-8?B?T2NXK0dHb2hEemd1eFkyRWhaRUUxcjE2M2trS255VEczUmVEMGw5OFpjYVZ6?=
 =?utf-8?B?amdqV0VGRlRvWk9FMUFmTGxsV296QnQ0R1M3Q1pJMEhIRExKUnp3UkZKZzdF?=
 =?utf-8?B?OUtpV01UT2R5Q0l4WnE5NnJ1NStzVVdSVWpyUTl3elM3bmlFZkV4K3E4SG1O?=
 =?utf-8?B?VUxMZjhRMjRsb2tIUjdDanhVYWFMNkR3Z0IyaDkveDArWDNOc1JDeGpja3pQ?=
 =?utf-8?Q?i/XQsP1AvxRi0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3b3ad2-97e7-47d5-5809-08d8edee0f2f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 11:23:18.7554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qduidIssDiM4ecDfM1ABEeex2rKfBV5fyRHDvBiCp+97NoafM7u94D534SPJN2w7O3SD0KHiQliyXb6mZOOBzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
Cc: "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
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

Just an update, i found the issue which was actually to wake up the HW
before doing stop/restart (using pm_runtime_get_sync), also handled
protecting from concurrent snd_pcm_ioctls accessing the registers
while the BAR is unmapped. Can go through BAR move while aplay is
running now.

Once again, would be happy for any comments on the code - 
https://cgit.freedesktop.org/~agrodzov/linux/log/?h=yadro/pcie_hotplug/movable_bars_v9.1 


Andrey

On 2021-03-19 5:22 p.m., Andrey Grodzovsky wrote:
> Hi, I am working on adding AMD related drivers support for PCIe BARs 
> move feature developed by Sergei 
> (https://linuxplumbersconf.org/event/7/contributions/847/attachments/584/1035/lpc2020_sergmir.pdf). 
> 
> His feature is still not upstream, all his code and mine on top can be 
> seen here - 
> https://cgit.freedesktop.org/~agrodzov/linux/log/?h=yadro/pcie_hotplug/movable_bars_v9.1 
> 
> I did basic implementation fro amdgpu driver and now I am doing the same 
> for snd_hda_intel to support our on GPU Azalia audio chips. This 
> relevant commit is here - 
> https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=yadro/pcie_hotplug/movable_bars_v9.1&id=7ec0f60633e898cb941cebb3cd18aae1374fc365 
> 
> Any driver that wants to support movable BARs needs to implement 
> rescan_prepare, rescan_done and bar_fixed callbacks where rescan_prepare 
> needs to stop HW/SW and unamp all MMIO mappings and rescan_done needs to 
> ioremap the BAR from it's new MMIO location and restart HW/SW.
> 
> I am able currently to trigger BARs move by sysfs using 
> "/sys/bus/pci/rescan" and the driver will go through the sequence I 
> described above without hangs. Problem is that after this when i try to 
> use mplayer I am getting following errors:
> 
> andrey@andrey-test:~$ sudo mplayer -ao alsa:device=hw=0.3 
> Downloads/file_example_MP3_5MG.mp3
> MPlayer 1.3.0 (Debian), built with gcc-9 (C) 2000-2016 MPlayer Team
> do_connect: could not connect to socket
> connect: No such file or directory
> Failed to open LIRC support. You will not be able to use your remote 
> control.
> 
> Playing Downloads/file_example_MP3_5MG.mp3.
> libavformat version 58.29.100 (external)
> Audio only file format detected.
> Load subtitles in Downloads/
> ==========================================================================
> Opening audio decoder: [mpg123] MPEG 1.0/2.0/2.5 layers I, II, III
> AUDIO: 44100 Hz, 2 ch, s16le, 320.0 kbit/22.68% (ratio: 40000->176400)
> Selected audio codec: [mpg123] afm: mpg123 (MPEG 1.0/2.0/2.5 layers I, 
> II, III)
> ==========================================================================
> AO: [alsa] 44100Hz 2ch s16le (2 bytes per sample)
> Video: no video
> Starting playback...
> A:   0.1 (00.0) of 132.0 (02:12.0) ??,?%
> Audio device got stuck!
> 
> and in dmesg I see
> [  365.355518] snd_hda_codec_hdmi hdaudioC0D0: Unable to sync register 
> 0x2f0d00. -5
> 
> Also I see 296.619014] snd_hda_intel 0000:0a:00.1: CORB reset timeout#2, 
> CORBRP = 65535 error during the rescan_done callback execution
> 
> I know it has to do with the move of BAR's MMIO address because when i
> disallow BAR migration by returning true from bar_fixed callback I have 
> no such errors and mplayer works fine.
> 
> I enabled MMIO trace and didn't see that post BAR move there is a wrong 
> MMIO access - all of them are from the new MMIO base offset - 0xfcd80000 
> (trace attached including mmio trace and dmesg)
> 
> I would be happy for any idea on this and any comment on the correctness 
> of my sequence in the code
> 
> Andrey
