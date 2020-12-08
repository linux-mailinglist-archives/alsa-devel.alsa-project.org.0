Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A989B2D31B8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CD216D2;
	Tue,  8 Dec 2020 19:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CD216D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607450832;
	bh=irR3y1L3m/znBLc8QNErJ/r3WWeseShiRUvVYFMKkHI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/i73i42GDr6ebXLMOdByEHFRgsII6zhz7RzRsDqaUYk2vKdaGv1cXNxP+9aN6XPl
	 lZiVt0vjhLI10UsqY+6mT2LCFgfSsz9CBehTh9fbA42RbfNXjfP02EyByhLh9bE76A
	 0mG/dSBz7xM+cMWhpjtwqpWs1ASZo42zQIPGfR9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FCCF80218;
	Tue,  8 Dec 2020 19:05:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47738F8019D; Tue,  8 Dec 2020 19:05:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95CFEF8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95CFEF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="HfkbTYiT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HM7OVcxHHiQJMZ1Y0L8bhuWWrsgNg313f4bjBuy64OvGy1okV5NQE5X0eSXDupZLyzAHsdB2wjIShC0nCqDVBfuW7oLn7LYqiSiWbCMCdxFQoKNQOqeu+1f9P80zumw6UJFEeGmuXL3cMf9F3jNZmhFS7nAXkSjRJZh7GCJ6I3eyy9H7cPJw/LkHSdVqAisj9+C28lnOUwSm+XFlVqXBVJ5/R59gfK9mwhvFwBV8JQsBpPHsIf6AmeSQbBociV3rzu0iup036Q69VolXA4TxldoSTQCb90GKPCNX2HfQSCSNca3sMOxVfS1VPa7CtXrN199qePOBohhi0OVpl0GLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA3vR7TK+LjnGXRZnkUMuRfcVbdj++BU1hUSO70cpbI=;
 b=SGzrCMVAe7kta9uPD9AgAeXRg1LRUoGykTkW0sAj8jad9phrTfessPUaETsOKnQWnoYGH3BCy4oiJ+RmiILJS7d/W87VpihlwahmVGH/UTsDYEgZB/7VvvuhudIn1gAhsXgRIZXrZDyKxAfeDnyLQVlKyXCXy+ed73tSg7WfnzZvWi6i+zE0O3L427USPonQaOd+xnx585eIggVKTCTk+7DGMPQKB5+znHMbaNbgSV7aPKD/rlapLZbyYGV+PQXs6oN4CtG+nR667LjE4ifwbZ4jlQI7r4PMTmLOVS95Myn6Wh+bCvJxJZ9KcFKiCbtUtRRMMdUlY47JKFGY/e6RGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA3vR7TK+LjnGXRZnkUMuRfcVbdj++BU1hUSO70cpbI=;
 b=HfkbTYiTnSGejZjdbtiW7LmWBTo7QnOBNgtQ5aywPqg7HJJ3O/9bMgLuj3AyouEpsWM5aEKsINv3kAzYwfwiuQaG6mUDAdcvnsxPhaKvGl+mV8+DNKzt/bIgcSrfdRzPmfCV25CQnTP+3auegKhUgowE4M1mZZvom89LCcxWMPM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MW2PR12MB2521.namprd12.prod.outlook.com (2603:10b6:907:8::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 18:05:22 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 18:05:22 +0000
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de> <20201208174002.GH6686@sirena.org.uk>
 <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com> <s5htuswuqng.wl-tiwai@suse.de>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <2c48dcdb-e8c8-ca2e-e004-4e63887788c5@amd.com>
Date: Tue, 8 Dec 2020 23:51:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <s5htuswuqng.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MAXPR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::28) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MAXPR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 18:05:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30d1d56b-a0dd-4698-6355-08d89ba3d4bd
X-MS-TrafficTypeDiagnostic: MW2PR12MB2521:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2521A05337823240A3715D5F97CD0@MW2PR12MB2521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPHaB6UiYVjqa9vSQ0peesMgqom3RRH4KpDF7jjtK0I2tXefru/P5vk+ryfija4BJVTShg395usofY35GZXS/LX1zS0DjEK3UI6LJlZC8XnDiEtorTTsJAjbEzV8ANL+v+C7oqg0wqmR+GP9+vQIQiMwgIKshnaTAqY64O4k9oi1uTLfEETS78umrDLm52sy6E6wbcteRwJWvGbfx+0jzT3qCfza4DzPGAZLOf5C6U3RM2iXQEbB4m1YA0YV3/mjULOuUV9viCONoM/H4cAAERtvM3Sd4BMyg33i6Nq4NcR0N1l5xCm0ATGHDvhp8iW4NhvG+PxQ4BKHLg76kRwGn6CTN+y+kHhnIdsPB/n9KtuQUXLvKCaf5YjqVQBaPM9A2gNh4QQO1anKsfx8Z2YgeSKj//YtMzyl+5uOfJsJ7XnXp+Ql1cxAAD/0Ywrtq+EW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(36756003)(54906003)(16526019)(66556008)(16576012)(6486002)(52116002)(6916009)(956004)(508600001)(2906002)(6666004)(66476007)(34490700003)(66946007)(53546011)(4326008)(8676002)(5660300002)(186003)(2616005)(86362001)(31686004)(26005)(8936002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTZ1N2RuTy9pa01YbDlFMFdaNFhLamVuL1R6dnpIYlBTVHAxNnFKcVlNTTdD?=
 =?utf-8?B?RnAySEZDL0ZObzluREl0cy9sWXphbVY1dENRWlhGdHpUZE5HOTdqcnl1UFkv?=
 =?utf-8?B?QUZidkIrWmhZOG1sR09SRGFPcFpvQXE0L3Nhb040eWRkRERKajc0QVRNcHdm?=
 =?utf-8?B?aStJT2F1VFpwcWNaNS93TzZQS1JZeVZaWVZPMTZ4OExNNEl1djlaSkNiZDdF?=
 =?utf-8?B?bzNuWVZBcElEaFNFTkhGalVFV1FGa2JaV2dkc091YlVtWnJxK1VqU1pmTUhT?=
 =?utf-8?B?TG42WVQ2UTJwY2hIcVFqalc0dHN5M0FSSlpuWjlzeHVNOWI2YUgydVg3ZCtq?=
 =?utf-8?B?K0FQT3VURFVVcVF2MElENGVyOXo0Uk5wU0xyakVrTXh2bXB1N0x0Nm43bEZn?=
 =?utf-8?B?NGU0Nk5lZk04T00rUHhHTnVCZjR2NisyTGpKMkdvcENPQkdIR1R1ZW0wTWNB?=
 =?utf-8?B?ZFAvLys1bUsrZXhsTkZpMlpDZUd4Vk9GeW5xZXAwc0pvVGQvZE8zWHBOcHpy?=
 =?utf-8?B?U1d3UDlaeGQ1LzRJNURWRW5VWm9sM3pvbHAwK2pMM3B3VkROTE5VcmR6M2dy?=
 =?utf-8?B?dkFTM0paQVRPTVNBTTRXV2JGMEFuK2gxZjlUYVNHaWZtQ0lidG92QXRrU3c0?=
 =?utf-8?B?cE55OU14cThUaGdVSHJTSy81a0JrNGdxY29SVXFjK091WEJEeVVDN1RFSjMx?=
 =?utf-8?B?b2JXSkhsRTNtZlM5K2ZUc0JJSWxsRENTQWIrelR3dUp0L3o3endScmhFaEl2?=
 =?utf-8?B?S0JZRWh4RlloMU12MVA1QW1kQmNoMFpBT3NGVWpDUmN4NEJFOWZ0TUQrVXNw?=
 =?utf-8?B?NUtxY3BBcWZIU2VKOHMvcTdMY0Q1YXdQaXYvZmtsRllHdEd1enZ2c0JZVkd1?=
 =?utf-8?B?OVV2WU03ZkcwcVRiZjI5eGRRNXZOaXFLYWFkVkJ6a3hXTjRDc0pTWXBabENo?=
 =?utf-8?B?QStQS0RBTkxPamkwQXFVMmw4QTRYNzRRYUFHUFdFb2xyS1RuZHIySW82ZnND?=
 =?utf-8?B?OGVUNW1GNXBwVkVnMjNTbW00Vm80N3lWaG5LUjhRRkdESFlvanFDTDNHN1VP?=
 =?utf-8?B?ZHNhZmRiRkpyUjBwODJNWW9US2FoMkhZdUFWREVRNXlCeFFOYTZRQUlhc1Fi?=
 =?utf-8?B?K3F0YWVzVmd2ZGlycXBHeER4TldBYU1ON0hNaWhYTTlXdUJOdmxQWlY3ejJr?=
 =?utf-8?B?SE1QU0tMRGNXU2ZVSG5tNmpvUDJ3ZldBQ3g3SzViWU5JYmh5bzNJSFdObEJW?=
 =?utf-8?B?SkE0dUZPSnZyOFdTNVRzZE44MGlsb2xqSUpQNFBYUEdYYTltU0prWG1Ic3p2?=
 =?utf-8?Q?h5Gfvu291hiy3ULMmjkaiu97MXhl9hOB17?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 18:05:22.2721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d1d56b-a0dd-4698-6355-08d89ba3d4bd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NE+X6oqqYpDZ9wlrwBuKwSw+41KX0+MFSdBMg9caqvXtTwZtrq5OYqhyoR13HAj9G+pHmzlBSYcJ9XWuqz3yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2521
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, stable@kernel.org
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



On 08/12/20 11:27 pm, Takashi Iwai wrote:
> On Tue, 08 Dec 2020 19:06:21 +0100,
> Mukunda,Vijendar wrote:
>>
>>
>>
>> On 08/12/20 11:10 pm, Mark Brown wrote:
>>> On Tue, Dec 08, 2020 at 05:24:32PM +0100, Takashi Iwai wrote:
>>>
>>>> BTW, both Raven and Reonir drivers point to the very same PCI ID,
>>>> and both drivers will be probed for this machine (and both to be
>>>> skipped).
>>>
>>> Ugh, that's not good.  It's not even super obvious from the code that
>>> this is happening.  Seems like it should be one core driver which
>>> instantiates the components for Raven and Reonir as appropriate, the PCI
>>> driver is pretty thin at present anyway.
>>>
>>
>> Raven and Renoir has same PCI ID but both platforms have different
>> revision ID. Raven platform revision id is 0x00 where as for Renoir it
>> is 0x01.
> 
> But your drivers don't check the revision ID, as far as I see?
> 
> The linux PCI driver doesn't distinguish the revision id at the
> matching time, unfortunately.
> 
> 
> Takashi
>
Apart from Revision ID difference, There are few hardware differences
specific to ACP IP.
ACP IP hardware versions are different for Raven and Renoir.
Unfortunately we don't have specific logic to distinguish ACP hardware 
versions for Raven and Renoir.

