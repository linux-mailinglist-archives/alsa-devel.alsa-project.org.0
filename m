Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4534840E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 22:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44EE166B;
	Wed, 24 Mar 2021 22:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44EE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616622317;
	bh=zIz2q0DqnPtXNvCShK4zOFR8kzA+WeqKExqdowiFRhE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHx5pIa2IHKXAkW2Ba0/QEdlOJZBeiaWAiK62GnRNSwDjyk+nZloT6FaherWS4nZi
	 QYHuUCiAA2Ng+qTeSZ2J3gx2XGhYxOSrgpJmpwtQlUTFnZ0A686n1BBL5MW++BrQvQ
	 lzOwFCdcNPefCq1t8e0oKF4nIXe6XphJ3Ff9rXmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28219F801D5;
	Wed, 24 Mar 2021 22:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A442F8016B; Wed, 24 Mar 2021 22:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BAB4F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 22:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAB4F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="fwIVK0N2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDm9HizP9CDcB67uMrjaJR0YMjOiHNUToJWu4T+D90RmJv479P1TdPWu0id8p+vHL80Zb1DGP5tzNqOdPwCVrqsjstYz3HC2o1zc5odEtSYB1o6wjBdYIvKwW5oMbf46YHFQ1ss6sAhR2CnIPzMsWt/J9QDyHYxIWUCL7BQV/Uk2aEzM4LUqnu7y+qYLrt10GDgfyWKUTI7iwJq2MPHTf4/6wJIZkyG+XeTz6H4gzmnbRIjTMPkQ/0tQfwE/FIHw9kNh+j5YTmL1rgHeG3PufXfgK+QTc4UHkbKCKvxuqmW+q0IzMxyrUCVwQg9xrQUlBRypjSctAhcKYq7ZNGx/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMa0LoDuWjO7YpHz7GbYCsOlQLmLl6NK/K39DNJANBI=;
 b=SAUiRYQaobhg9tEbjeN0YV5O0ChgXrK34tdkKpgUvQ4hF8rW/Ni6Ws7Ub0tKPlgeDPq67Didqre9haGU9YsUXkNDVnNyVQnmXITyB5JpJVf/d9lAH+Wst2eOUi/0I10ABSGddeiWnGU/+2Gg5NKdO+yqdLAMlUkOqHbHUi0jsNsJ/Z23Xx/n5MO8sDzt8G9cdap3S8ypneWQz3/laifARuC4H0kTZtuSls2tMJvBiY9W+aG2G/ElYlVv920Aj2EzHsOeiwFRngOKAcy+dm/lgnpCjIcfcl+DYIrqqFC3qfhXFOi88SJMBn9o4v0NC3kEWS34Sk9ywMUAtc+Ii19ulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMa0LoDuWjO7YpHz7GbYCsOlQLmLl6NK/K39DNJANBI=;
 b=fwIVK0N2NIz4IeADwE5lsg0dvG6JLVfc4AV3wP4SfEKtIZO/71gWBiRuh99dG88/IbUpMmfUekpYWiZR4QeksJ4aXJNtZrrhL7CIJKmt1aU/FSATdvGgYwolu3g07zV69oJtBB+SlHDIl0HbqGhSAvN/ikOvrxVJPfwq5G8Lji4=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 21:43:26 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Wed, 24 Mar 2021
 21:43:26 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
 <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com> <s5h8s6dbyr1.wl-tiwai@suse.de>
 <9758cd4c-1246-a4ab-74eb-0e060248a00b@amd.com> <s5h35wlbwye.wl-tiwai@suse.de>
 <06b2dae2-a5ea-0cc8-891f-2aaff64ae260@amd.com> <s5hv99gan2r.wl-tiwai@suse.de>
 <d9bc41d7-bbad-24e3-6ad3-90e6dd8466c4@amd.com> <s5heeg4oak7.wl-tiwai@suse.de>
 <f97a59cb-869e-3e0f-305d-6d4a673f49c3@amd.com> <s5h8s6cnva3.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <65039cab-5561-aa9c-f270-8fa968a78f42@amd.com>
Date: Wed, 24 Mar 2021 17:43:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5h8s6cnva3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:ac47:51a5:7666:f058]
X-ClientProxiedBy: YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::22) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:ac47:51a5:7666:f058]
 (2607:fea8:3edf:49b0:ac47:51a5:7666:f058) by
 YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 21:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ec0dee5-d790-4d78-1a72-08d8ef0ddb42
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43999C8D7DCD8347ACC2B234EA639@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIIH2fxAs2HiqoJSvMpfPf6A1pvK+CXrEPiZthFJ411RmL/hi62+PV2e2umj7No2tkDD1EPcQ3hrnlcFQJvhWoPQk81C8XtgRuHZX/Mc9OSrlFOcYTpiYJiu9qLDKYEjGO8XuhY1tPiKzJw40U7gt54zAgfl8aA57my9bUiOGIA1eMWvJ7EjhPmIUGMZLrbvWjSdMuIiGM7zCye+zxh2WgtHUlN7Qh3T/2MqPvurJzQ4/CgmwOq6LKScDGAYHoIt/ngmDntVWJKdbPOvFEilomZ5wS/OR8XGwxDk0I4NyoUSV+tmIr9r1pYXzuik5Yw2ffhpqarP75Yvyqd3kTCmWmFdqAesaESmMYbZslP3sOZZqFmH6uwA18T2P/zSLJQLDmDBy/jvaaCd965DOy1PrIBsRXeruEZ77KnymkMLSdJ2F1sZge5wZZCTBsFQpe3MRtC31+Cn+8ktCXte234V0Gvok/EW44rniHan5JJhr0s0/nq6t3i3+h1oRXlnHw5hyslcEilYKwqIahZd2e6L3TKp1ygBcZKQMWwrh5xogINj1DsHAN/LvFwjtD4K81bdW66LMz6CbzuIsepXL3MvNwkTc4KYgKMJL3Qky1/RQdVUNCMpNsWWROjXsKJEySPcdTZRleHMyj61rKiFt90K2Kgu13814gN+4vMJOFIsnLciF3I0Wh3ZNmEKjeKeXKWQZk0MS2YcKIOcEhojsoCUCvonrpipJVRYlJxoyhfzOgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(478600001)(186003)(54906003)(38100700001)(316002)(16526019)(31686004)(53546011)(2906002)(52116002)(6486002)(83380400001)(66946007)(6916009)(66476007)(8676002)(66556008)(8936002)(4326008)(36756003)(5660300002)(2616005)(44832011)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?z8AMJRS8qc4rO3yBMp6RStU6wzPNMHChcKucMr6oHhdnFieY4+9COStx?=
 =?Windows-1252?Q?UmyUivg1pJXULs4U94Ye3ZickCuanezYPNhddTH4pJGpqKXBk3SeuwSY?=
 =?Windows-1252?Q?Yj2pA9gALdvbeHly8c4iqv9hHkwth07oSOe1G/mvxbef6JZnDXg+rbEZ?=
 =?Windows-1252?Q?NN8el1kSZGx86n5QbHfbSIogV2FNnsdwQV/jIvTvyNXsfVC9Tg4JizYS?=
 =?Windows-1252?Q?WHo+AyQ4NPZW5W8pI7W2ZSTCzUnFjHur32tccYt/2+jlI4YlD40TM+2n?=
 =?Windows-1252?Q?BGyOBm6Bec7TT6giyE0NJE6OpT9e2vfsEtClXQf9Nk0JZXwqKCwn1z2D?=
 =?Windows-1252?Q?bVct64/hoSk/OXDK0KUD4kGh4nckQxYfxhi4HorS6BiSAdGS6dspd4Sx?=
 =?Windows-1252?Q?7UhOZQihpwfTOJKsOyyXtwbeV++9lI/6JdlVOXkpCMU8nDpXjvIererI?=
 =?Windows-1252?Q?RrQA4O1+BvU4s1rifVxHR8K1hfgacXWjSng7L1Pk7ppGnJScFTe3qRM9?=
 =?Windows-1252?Q?UT3HUPmTAfEl629cu4Mo7Wixu0PrW02iOGGGHODZfxGMVubs4fjJxfk6?=
 =?Windows-1252?Q?trzKKGOuBw2ncV0aItawZoiwCf+DTkNkL8mT4AWztvYfjttqKO1uGv20?=
 =?Windows-1252?Q?oCZGk/XBYo1/mbtu9O0wRT/NVJqiYDHc09sm70U09K+t52MCx8ZM8Wy8?=
 =?Windows-1252?Q?B1oit5o+1byFp2PQpBm9UDWojzankC4Rs3VZTtBgmvQzWDfwr719QP5k?=
 =?Windows-1252?Q?5d5scfpGXvf7yAKR/buEEDGijV7SKeU6Y0y+u6jmWSFD13iUYSen3Mak?=
 =?Windows-1252?Q?DEkbLsFKz8fQYNs2wb5QLEfxhGaeNF7fy9f5S7fxjtN+1977LX8LK8Db?=
 =?Windows-1252?Q?fQVgXHMS1DGOQPVXU5QhYxFTs++68/puVYkSZIOxDx9Y83z4+vXhNyZc?=
 =?Windows-1252?Q?iGyPdJd2kqx0ayJQpfCtZGkvXhHoNu93y7xrvLAEg+YUwPRqgV3S+blg?=
 =?Windows-1252?Q?vzodQscuPfysjKWdhDnAY4K1dTI46dVLllXpQ/EHgz4CHrBtb0rUu0yt?=
 =?Windows-1252?Q?sHZHIxiqd6e8oc+KtWsnCD/1/BswOsflwArwhBnffnfnJM+XJQ3QZ7K1?=
 =?Windows-1252?Q?jF9qOGP+R1Bc6wVTFvF+WYUJjmgqikjheIRKf3xv6UTwWg9qMywt3yl2?=
 =?Windows-1252?Q?s96gy2asi9ystbHvjKN+LuTcz0KjXZieZSXfsuwLhJCe3VYJJNo50lyd?=
 =?Windows-1252?Q?h4kZjMMOAiKk9kRAZQCJVudpKXcyqZYF/8X1zw6u+v6RNYilbZh/LvN9?=
 =?Windows-1252?Q?gJxAVcLmHelJzCYUSF2z/C4HBWKoVb9uAkfdHS38NJmW+u4pEav7jmMI?=
 =?Windows-1252?Q?hbsAcZMtzZC3zJtR5M2LF8rxFVQfshfEefry5UuwjZ/V29csj836XptC?=
 =?Windows-1252?Q?1quAmp9SOXnOCQ02ilJK/WPbDVuyLjqwxkwES+O/T6bAp35gUsYGM3Q9?=
 =?Windows-1252?Q?9xsnyU5A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec0dee5-d790-4d78-1a72-08d8ef0ddb42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 21:43:26.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/KgsuXmXCFp1wkZom+KD5PDO5JPJYK1ZiFampdkb/ksU17UMJcVvtgbu5VFvWIu9dSAo5tLdHgICx7/naXg6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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

Few comments -

1) Why we don't use snd_power_wait_and_ref in patch 3 in the common 
handler ?
Don't we want the PCI rescan sequence to 'wait for' any in flight
taks that might be accessing registers and not only read/write/tlv 
accesses ?

2) Possible deadlock -
In azx_rescan_prepare - you put the card into SNDRV_CTL_POWER_D3hot
first and then 'wait for' all in flight tasks with the refcount.
The in flight tasks on the other hand, using snd_power_wait_and_ref,
may have already bumped up the refcount and now 'wait for' the card
to go into SNDRV_CTL_POWER_D0 which can't happen since PCI rescan
waits for the refocunt to drop to 0 before proceeding.

Instead of snd_power_wait_and_ref can't we just call snd_power_ref
in common IOCTL before checking for power_state != SNDRV_CTL_POWER_D0 ?
Or is it because you don't want to fail IOCTLs ?

Andrey


On 2021-03-24 4:36 p.m., Takashi Iwai wrote:
> On Wed, 24 Mar 2021 16:43:02 +0100,
> Andrey Grodzovsky wrote:
>>
>> I merged the patches, since it looks like my branch
>> is older I didn't have chip->init_failed member and
>> also seems there was a typo on ur side as there
>> is no flush_work_sync, only flush_work which waits
>> synchronously anyway.
> 
> Ah that must be some typos I forgot to refresh.
> 
>> Everything works fine when testing with maplyer running concurrently
>> to PCI rescan cycle.
>>
>> Can you be more specific what are those get/put calls,
>> I am thinking about some waitqueue to wait on in rescan_prepare
>> after setting snd_hdac_bus_freeze,
>> on wakeup it checks that a counter dropped back to zero.
>> Not sure on which entity to hang this counter ?
> 
> It's something like the patch 6 in the v2 series below.
> At this time, I dropped snd_hdac_bus_freeze() as this is basically
> useless.
> 
> Maybe this is no optimal implementation and we might improve a bit,
> but I guess you get an idea from that.
> 
> Also I added ifdef CONFIG_PM in the last patch as it obviously depends
> on it.  It could be put in Kconfig somehow, too, but a simple ifdef
> should suffice.
> 
> 
> Takashi
> 
