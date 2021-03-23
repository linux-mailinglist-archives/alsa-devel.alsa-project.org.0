Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F75346166
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 15:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04181669;
	Tue, 23 Mar 2021 15:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04181669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616509444;
	bh=VEnnixKRxSp/7xcUTWm35FVARiuxBUcWs6mGqoWtHEI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwGwA7yQunPTfFQhVFwg9iKAREhe+4kqznwJBN67xwlrrIq803gZyCngsxdD3o/4M
	 OvzTnjpKjTl9hpYa9rBo00I+38of/t8MCUumHS03RG3OfPkDRzfO4z2MT9ejw3ofIQ
	 G+p/W0+RNhh0Jayww85NUyWONJ8G9XzCVDwcf8jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B52FF8025F;
	Tue, 23 Mar 2021 15:22:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 773BFF80257; Tue, 23 Mar 2021 15:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B372F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 15:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B372F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="s0Hi24Tq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZfXjdCPX8iVFHoV5WRuHI1+ryks4edXcsC/4Vi+16zekof39Fppm7eC72QJ9RFKqnbEFfSKzUtM15rB2nKbJVYMBDh/HAgE6iJ8mZhkU7O7V4kh4DWWwmG6M2h96uF/8Az5XFTJulqPXmVjBFAifWYTR04iuOZ34epRWCdpYssks/XGouT03JMC7ArGJ8uJKuc1Qyh4SABIr6ZSyt7tvwf8xNF4UHFl5hj48q339XQJMeH330Ab9u2BbhorW3+qjxMn0jK70VzoJXScpD2GJpktm/W739xatZaJjgvtoN2utxWNMjuM8MJi+2hzzmNJk8W1LtXWJrnm0mMWzhtHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raAvtO/Ey6zd+OYiLQYmpQe8N6kQv7kG4Qk5ja9Bd24=;
 b=f2KXKoxSaOcvEnEMtG/KdBH8yEACPSyHUOqoezluSzWMBOWlbYZ6/A/wAzqQNRzEGYDmkA4MQs4PH4my0cs2J1DsMybRXVOWDZa+QUE7MtNYQwBKhVOVf7TACeo7QdboobfP1SrqcH9iOC46igf+BwopMqoun0ZrBvyHVtyA2LGdQX+nTa01AMYvhKfsrIuHjaUEkf1iQ2n+0tWBKBtNKv8PwxZLz0nEV8pUL0hf9nVgVTiHlRhDLLD0krpvuVJprmf5spaErPBmNKwnSTQJlWSPnIlTwkHUK3mkrqxTk6087FQGLkbpTeLx0y2SqeAb7LQJ8Lo98+tOvEi8L24/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raAvtO/Ey6zd+OYiLQYmpQe8N6kQv7kG4Qk5ja9Bd24=;
 b=s0Hi24Tq6vhguDyJRe6YrJcBpsqYDN0v4RooKLVZ7pdxQeHPM4wNwXrqvNP50adUW+5XL1YxDavjWSKqe9p3ZIomGEd7nPpz2aN94zpeIiUg79s8CtlGxdTHa9S7S1gHPKTQ8bgVdB/xUJLJ8sDDjM56Z2/aqiEePSQqiox7TNc=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2701.namprd12.prod.outlook.com (2603:10b6:805:6f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Tue, 23 Mar
 2021 14:22:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 14:22:04 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com>
Date: Tue, 23 Mar 2021 10:22:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5hwntyaylg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6]
X-ClientProxiedBy: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6]
 (2607:fea8:3edf:49b0:dc0a:b3ab:a018:1fe6) by
 YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 14:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49bb984d-5846-4509-967d-08d8ee07080d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2701:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27012B3FCBD0C3133F420D15EA649@SN6PR12MB2701.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vK/nQ5xCfuWO6TQR/5LFQeA3fgfXrBLnj2Ba2yxqcPM9k8jzmNUyCDu1h18VT3Lhap3Guhtlky/CGPc8OQFAz7jWU28lecS80M9lhaQ96yDKhpk/8RLzDgNYjjYrelIqHGcKHzNTIQKTK2Vh/wXPQ4H1I7B8d1qElsO+fjDxpU6cbnGyxaSsih/wrQDIDwIJ5DpkmCAeZqqf6IaJ3Nvh+4sX0XgK478PudkCokVFM+9ARD6eEpY42MiHFbvTzVfb5s5f9f4QfL6LNuGC5Rv0LCab7qdK9ONU0itscsBVk1lPzpwgu11yy+apJt2T1Whl5CTpxuhMbA5TGY/hF2ZpvbApnYR8zokWJalDRK9sPjLv3e/vPY3PsFrfbDGPN1wkrICQx6giytRAIuk2w9Mq1BQGeWPNX5I8CSlOTMArOAne2bEiwT10sFOmbtpYGIYvNBeB7Q4Ah9B56Iflc3R0Ol/lIXuhBT/oy/snB1aBXgfcV8DbtrjGCr03lhFtPrn71g4NOBlyXAHcRi1uuuQ8VyvAThGFEko8zPKXgkMoPhBGIv+WCGkIp3SmmQNct/Gn05CRzAGxTzKa31SYFFoTYWJ8qMz9uqvYbVlayssu+AwAWwbE3NELqfuz3xumUDGqFtQvZuo8w/VEAiBlRAnjDJq0Do9dusvxVrvjdKVn2oYwKd+cz0oC/qJ2UKdSb0d8QJSBjycsrX3o6GPYxn3BOEHNLGi7j26rgjCwRJbKDAtGqVXQZ+whIQdM3/a9lusjAIx7jELf6UFj4iu79SgXjOZMOU8519c7FPW0sZH7PKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(31696002)(966005)(83380400001)(6486002)(31686004)(38100700001)(52116002)(478600001)(45080400002)(86362001)(6916009)(186003)(54906003)(316002)(16526019)(53546011)(2616005)(2906002)(36756003)(8936002)(66476007)(66556008)(44832011)(66946007)(8676002)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0lJVnBXa0VtaGE0ZWZraGFWRzR5L3IvV3ZDeDh2WlE2VnVRTDlwZWFWM3ps?=
 =?utf-8?B?V2MwMTZhSy8rS0hneStWNE5CYjRxbHZFYkVrMnREVXdET2E2a1E3a21pK0tZ?=
 =?utf-8?B?ZFRXUzNaaXBOWkJ2dkI5T05kY3JOeXFwVUtrYUtDUTMwMW1xWGdHb2xhdDM2?=
 =?utf-8?B?Q013MzNTWFhpSUh6emloYUttSWpjZzlaeTdhMXV0M1VmaFJONVhzQkx2N0l1?=
 =?utf-8?B?U2hCcjZoSmxMSHlwMGdsblhiajFib2R1amNhSnU1Wi80cTA0eU0zNkVBS0hn?=
 =?utf-8?B?RlZnQTdiaStjNXdSQ215SXh5eXRZRDVjcUVBaWVZTW1DZmpWQnRCb3pWVlBB?=
 =?utf-8?B?YUMvV1UxNnFpNFRqbmhaWFdianIwUnJrNHdWMk82M1lMQVBmako3c3dpM3Q3?=
 =?utf-8?B?T3lLYU42YnJoVW5CZmIzQm81aGZ5a21oT1ZIenliZlI3bDhlOVBSSWhWdm9V?=
 =?utf-8?B?T2JQSVZiVldxdnVtU1JHVUVUUG1rbDJoNU9pVVJzeUh5bzFUOFFpRUhRRm02?=
 =?utf-8?B?UlBUZE1OZlJXSkpORDhjMCtadzhnUDFuUGNQRmlSdUxhd2lNNVlPL0E2dXZV?=
 =?utf-8?B?dXR4SldVejR1Q2MzWnJ3LzcxaDVvZ1hRTktsd24xOFVPUGtMYXdxKzVNNGh0?=
 =?utf-8?B?ZUZLaDRxcHIvWVpOR2hwRlpmcHNhZGJySHZtc3N2eFBpdS9ZZlQxYk0yUFJ6?=
 =?utf-8?B?bTluclJOa1BIRVdoanI4WXBZUFFxTk4vODgzTmxEUFNuS01pUUdLTStFU1h6?=
 =?utf-8?B?R1FmeHh6U252STlZT0dLY3pKNHBseVJVYWhOTzE0TTcxR0wyU3RvdGh3cjdi?=
 =?utf-8?B?M0xIcXJEdnRwNDhaWUEzOGNzUE9QYzBPVEtaeHp5bVNaSkVEZVlUQU1jMDJo?=
 =?utf-8?B?MjJKSG9vM3c3RUd5MCtMZ2xZb0dic1hwWVJnbDVtYVhlMnZNM0ZybFdmdVZi?=
 =?utf-8?B?ZjYzWVNBZmpqZUUwS0dvT2xuNnVFYlBIMStVc2lyMlVSTnRBc0dET2tYNkZi?=
 =?utf-8?B?QlUvMUJhWEt3NjJwZHVqMTdQNzVsSlZRZTlGclRZb09xazk5ZTRiVy9aTE9j?=
 =?utf-8?B?TSsybzNzMm4rMm9WSm1nTzdYL1MzMlNEN1FXZGFiSXdudDE4T1dCT1RHSmJq?=
 =?utf-8?B?NS9jRnJOSHVXR2F3WWJkV1NNU3lyZXRyWUx5cWVMbmVveDVkZlFjdDNzWXNh?=
 =?utf-8?B?OC9rQnB1dlIrcDVhcGk0cFlhOGRvOURER2R5R21LMVpQWmI5USt4K0RZOG1U?=
 =?utf-8?B?V1NQUW5VNGFOanhIa1U3Y21nN3c3ajJxdlJpdjR3OGpibDRUZlRFaHFlZVUx?=
 =?utf-8?B?TzdzVk9hQ0h3L0VLNGdacmlHTFM3TksxaTFjRE56SVNjY2NnaHNDY2lEOUVn?=
 =?utf-8?B?WVZ5eW9UVXh6bnZIdkduVzNsUjJTeDNHTk1yYU1rMytZa3BXRFBjVXRvcXRB?=
 =?utf-8?B?ODdKWnAwMU5VK0RCSmZRSittYytZME9sc0NvbnFSQ2xJQmRmMUVXYnRGQzcy?=
 =?utf-8?B?dHhhMTlRTndUN01Qc2djK3VZWkE5SjZVcGJjVFRYWWRJS2JHeW5VUjJOV3hW?=
 =?utf-8?B?MVNnYmFUY3U5UkpkUkZ3NGZITzYzNEdoRjgvenM2T2FNeDFBbTUxN0pjQUVq?=
 =?utf-8?B?N3YzcDBQQU5IWkpVaU5IQlhpR3hlSzJqdnpGNHVReVN2SytuMCs5RWhWdlR1?=
 =?utf-8?B?aWZqU2IrTjlXREN4YmlVMVpzV0VpTEg3d050ZVpDQ3ZGbVlSQkkwcnlHcDR3?=
 =?utf-8?B?Y0syWmhGaUR6K1l3TmFtdnF5QnZia0hlT3hzZU5lVjFjcjJlUzBsOXova2lC?=
 =?utf-8?B?MUhhYVBSSHdKUC8vczcrSExsUXNrQW81WDVkWHhiVXJ0Vys4QWFoTzZFSy9y?=
 =?utf-8?Q?NGO5DYGBjDXTI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bb984d-5846-4509-967d-08d8ee07080d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 14:22:04.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQF7gxc/TgXyTXEVh5Hn9PhVpBpOTxkr2EMdq9vsxdDrK2k5TSsHavc4KNpEJGf1kdZC+8aL1HOd0k8l3jB8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2701
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



On 2021-03-23 7:39 a.m., Takashi Iwai wrote:
> On Tue, 23 Mar 2021 12:23:16 +0100,
> Andrey Grodzovsky wrote:
>>
>> Just an update, i found the issue which was actually to wake up the HW
>> before doing stop/restart (using pm_runtime_get_sync), also handled
>> protecting from concurrent snd_pcm_ioctls accessing the registers
>> while the BAR is unmapped. Can go through BAR move while aplay is
>> running now.
>>
>> Once again, would be happy for any comments on the code -
>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C600bb8a982f54a2674d508d8edf045ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637520963652402231%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QKlK45vaajKVF%2FXhLIWMhN%2FhGxTIMG%2FG0Y8xNC37LPw%3D&amp;reserved=0
> 
> Hrm, this kind of change is a bit scary; we have some mechanism to
> stop the HD-audio hardware operation (e.g. for loading the DSP for
> CA0132 codec), but it's pretty hackish and error-prone.

At least I didn't have issue with HW stopping, the problem is with
unampping hdac_bus->remap_addr - as long as it's not iorampped
back no code besides the PCI BAR move should run at all as any register
access from this address will cause fatal page fault. I took care
of most of the IOCTls i think, the interrupts are disabled in azx_stop_chip
but I am probably still missing some stuff like some background work
items or other IOCTls code path.

> 
> Do we really need the BAR remap while operating the sound streaming?
> That is, can't we simply refuse the remap if it's in operation?
> If it can be refused, we may avoid a big locking or such.

Problem here is that this feature is for the sake of hot-plug of a 
device, this supposed to give enough MMIO space to place all the BARs
of newly plugging in device. Refusing to move BARs because there is some
app using the sound card on the background might then lead to failure of
plugging in the new device and this doesn't sound as a reasonable
behavior to me. Also note that the lock's impact is minimal as it's
read side lock only in the IOCTLs an so as long as hot plug not
taking place it has no impact.

Andrey

> 
> 
> thanks,
> 
> Takashi
> 
>>
>>
>> Andrey
>>
>> On 2021-03-19 5:22 p.m., Andrey Grodzovsky wrote:
>>> Hi, I am working on adding AMD related drivers support for PCIe BARs
>>> move feature developed by Sergei
>>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flinuxplumbersconf.org%2Fevent%2F7%2Fcontributions%2F847%2Fattachments%2F584%2F1035%2Flpc2020_sergmir.pdf&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C600bb8a982f54a2674d508d8edf045ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637520963652402231%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fegwYaNiLmfZWWmuaYXU5gcJsJ%2BwcEwry4FoI1eyiK8%3D&amp;reserved=0).
>>>
>>> His feature is still not upstream, all his code and mine on top can
>>> be seen here -
>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C600bb8a982f54a2674d508d8edf045ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637520963652402231%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QKlK45vaajKVF%2FXhLIWMhN%2FhGxTIMG%2FG0Y8xNC37LPw%3D&amp;reserved=0
>>>
>>> I did basic implementation fro amdgpu driver and now I am doing the
>>> same for snd_hda_intel to support our on GPU Azalia audio
>>> chips. This relevant commit is here -
>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1%26id%3D7ec0f60633e898cb941cebb3cd18aae1374fc365&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C600bb8a982f54a2674d508d8edf045ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637520963652402231%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=pk8qVsTWuGLpE5js1oVx8swM8zK2Jh3uJwuTWJ7ixlM%3D&amp;reserved=0
>>>
>>> Any driver that wants to support movable BARs needs to implement
>>> rescan_prepare, rescan_done and bar_fixed callbacks where
>>> rescan_prepare needs to stop HW/SW and unamp all MMIO mappings and
>>> rescan_done needs to ioremap the BAR from it's new MMIO location and
>>> restart HW/SW.
>>>
>>> I am able currently to trigger BARs move by sysfs using
>>> "/sys/bus/pci/rescan" and the driver will go through the sequence I
>>> described above without hangs. Problem is that after this when i try
>>> to use mplayer I am getting following errors:
>>>
>>> andrey@andrey-test:~$ sudo mplayer -ao alsa:device=hw=0.3
>>> Downloads/file_example_MP3_5MG.mp3
>>> MPlayer 1.3.0 (Debian), built with gcc-9 (C) 2000-2016 MPlayer Team
>>> do_connect: could not connect to socket
>>> connect: No such file or directory
>>> Failed to open LIRC support. You will not be able to use your remote
>>> control.
>>>
>>> Playing Downloads/file_example_MP3_5MG.mp3.
>>> libavformat version 58.29.100 (external)
>>> Audio only file format detected.
>>> Load subtitles in Downloads/
>>> ==========================================================================
>>> Opening audio decoder: [mpg123] MPEG 1.0/2.0/2.5 layers I, II, III
>>> AUDIO: 44100 Hz, 2 ch, s16le, 320.0 kbit/22.68% (ratio: 40000->176400)
>>> Selected audio codec: [mpg123] afm: mpg123 (MPEG 1.0/2.0/2.5 layers
>>> I, II, III)
>>> ==========================================================================
>>> AO: [alsa] 44100Hz 2ch s16le (2 bytes per sample)
>>> Video: no video
>>> Starting playback...
>>> A:   0.1 (00.0) of 132.0 (02:12.0) ??,?%
>>> Audio device got stuck!
>>>
>>> and in dmesg I see
>>> [  365.355518] snd_hda_codec_hdmi hdaudioC0D0: Unable to sync
>>> register 0x2f0d00. -5
>>>
>>> Also I see 296.619014] snd_hda_intel 0000:0a:00.1: CORB reset
>>> timeout#2, CORBRP = 65535 error during the rescan_done callback
>>> execution
>>>
>>> I know it has to do with the move of BAR's MMIO address because when i
>>> disallow BAR migration by returning true from bar_fixed callback I
>>> have no such errors and mplayer works fine.
>>>
>>> I enabled MMIO trace and didn't see that post BAR move there is a
>>> wrong MMIO access - all of them are from the new MMIO base offset -
>>> 0xfcd80000 (trace attached including mmio trace and dmesg)
>>>
>>> I would be happy for any idea on this and any comment on the
>>> correctness of my sequence in the code
>>>
>>> Andrey
>>
