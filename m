Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69135416D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 13:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E455716DF;
	Mon,  5 Apr 2021 13:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E455716DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617621042;
	bh=iEGxMYOtXD9Syfd0srpjxvGkR8dUbYMMQyKHacBzUGg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INtjLvOxgWQRYf48K8xO01XXJXkP6K6IEPtl+LSkYABx0aKh81DPCjmd+WCZ4dZ/6
	 fjWmJZi9pfm8l+4vABlrHgFhtdVz76UZNRS4oAg0Z1/bKLFVe8H9+murHbvfCE8CV2
	 ZfYv87/ObpsXaAxyQWpgMlPhGVWSB30x1xYL3M6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72589F80169;
	Mon,  5 Apr 2021 13:09:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 778C7F8016A; Mon,  5 Apr 2021 13:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 371EBF80164
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 13:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371EBF80164
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=amd.com header.i=@amd.com header.b="0epg20Hu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b784qMXnFJKDEOYH3CDx57v5D9DqCBDpcwAj+aFkMrdBJ/VrnlXv4ZYnqp8h03UZWKJyzl4XLfSmlPZ//zKwuySuKhoib5foM8GwRBqPUY3XeO4XivYQZM+dRxANPzIdUrVd2JhqhUHOeBbsYxT1ssyUuHBwUc3lBMjbvn40OHTs5IKdQNwYn9dBEFJvyRm+j8Ruwut7cTcr1n4xfVYKCqqin3m1RsQYG5daky4SeMXHNCQOBm/zPilROYslcyNAYMm/McLTxNlNCwutsEgsQUvO7dimsC/FFrkSqDinwvEpAd4DhpAtQ64v2R83iqpQ9Mw6t0lV6fpv1Ttma2NPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5mAq0ftgjECUYrGxp6GN5vYqJ+BCZQ9mChqhe7ZpMY=;
 b=GoehpyyQOD0rmgQY1744eY/wyoWLdStMoAOG2UMkgSBhl0FMlipUOI0EULf7COu2jEAT6p/gsUOR02POD6OHej5PDUyLkOUdLAfmN9Fc4qwxDw+v2kC3jOIbgpFnNbj9oDx2PsrTVmBNG8GrLxIkWn79BA2wCfEDrxzJ6FfyzfwSnEChStFJL4jzJjGY2+uT/Vy2Oa9snjefrd5sHVAyT/wATBnuDRqO94c+m2uBOMrsmkD5+w5j3FkpNsjeNxo/gFLRfGiPeB+/gBjmm6p9GUoh7zKwf7mtJI4KQdKWa421wd7isHZ9HhBEWuRbX9q5xQjWxJyTtQ6Vv3fOPltiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5mAq0ftgjECUYrGxp6GN5vYqJ+BCZQ9mChqhe7ZpMY=;
 b=0epg20Hu1Cp+bldulBVH3EbY4jwnUd9lZHRCxuY0vKTOkyqhC3zSjpWdUhi42thEwYHCxo+EuaYBPaS5Ucr2hAsfip5spsbvwdeRLwO82oCooWrBetH/WumXxhMUf5ej/QTRZb/RI28w/6vM5Lfu/uVIG+ig7WN3JXlIkuFlY0Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4361.namprd12.prod.outlook.com
 (2603:10b6:303:5a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Mon, 5 Apr
 2021 11:08:58 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 11:08:58 +0000
Subject: Re: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
 <82817878-a30d-2b0c-07f8-48bcca3ebc80@linux.intel.com>
 <a55c7a75-22ab-31fc-81b3-ed8fa24027f4@amd.com>
 <20210330153534.GF4976@sirena.org.uk>
 <cd0d87e0-caa5-b671-9c91-1c5f35c2f017@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <972d38d8-39c8-66d7-292d-37c1f0e027bd@amd.com>
Date: Mon, 5 Apr 2021 16:56:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <cd0d87e0-caa5-b671-9c91-1c5f35c2f017@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::7) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Mon, 5 Apr 2021 11:08:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2780d0b8-c8aa-40df-dc69-08d8f823358c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB436163482BE06BD229804B6A97779@MW3PR12MB4361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxwxzcRngWlqoSCLyvEPC+4qSXZ4bxzzRwCX4G57HmNr8Z48Dw7zImOovQ/ziaqeM41pJUMGplJPqHJf5DgUyOB3GHK4s+9xz0/CGjxTHmlzVpcMjnKMXStRqHXWmiOFbOBFpNaIZ1q0MhUcTcCGtc2kvc3LEXF/7cf4Wu3fiDOxNLwZMCIZ3fF87jbPUKokLMdXT/numxVpOWNESbSoKomUOuL5c8j2f/rsBXcvmRCR7mKLk38Leu3QT7aIMIsBWZGCbMlukidbc1rl1CJMzmLKCbQyjfWV/SZ4lMhoL4JwXmgUaNGfyYIDuOWNnT9HLpuLAS46tIgEgDGmc1oLrecxN+NSAgf+Radx03uAyNMGFbZe70GZz0mrLfHzKmgxwU756s41yZvZvJ7Sexni5+ykXlcgRxdRYoaI0U7fu2VB6x48Yo7FzoB+ZkXlWxnmwr5M8dOX4jNVFK0oAzL9YDuEhIwa2RDgb5zRdHCTfvJmQdeR3FbQRNJdHqnXjrHVeyd7Yu4rCj23lcmg1ggOZajHPNrs6myxmsMQa3xkn6Ju3leStrND5BrugxY1C407yUV772Im9h6AbI4vzoSu2DSeLrEp7H5d4+VgyTHFpM9gMoRYg1luVjxgZcIJ4C0azdgyzFfEsYlmo10ezOOF2rOZh/fyqyR+0HUd0Y4r50ahGxpXawx49x8rsvr5eNE950+A1Sp/wAsljMX4TEAEzgY8LQi/nE/2YCUFoNA3w6Ybg3TKu6nEiZjHODJaGGY1aIr4zZdfb4K90U4ACVjiIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(31686004)(38100700001)(8676002)(2616005)(16526019)(8936002)(316002)(52116002)(6666004)(110136005)(5660300002)(7416002)(86362001)(31696002)(186003)(54906003)(4326008)(66476007)(66556008)(6486002)(478600001)(66946007)(53546011)(956004)(36756003)(2906002)(16576012)(26005)(42413003)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?cdVltmO8isHGPCQXK6cEllHYDzo3boDEyPR4Oh3yoBacZYSJMF+4zi3A?=
 =?Windows-1252?Q?9GScRYaAe4eF1HI4N5S/KFVTQYu+/UCcLmcsg95ekQEe3g8xELnAkJ7n?=
 =?Windows-1252?Q?oINddutIOGpcsSHVZeDCvkQ7LtGFL1ykkIX0NWmVhJPt5eJFTtXSUknB?=
 =?Windows-1252?Q?/MUHvJk0jUlVKt0PtuVWgdXm8ekSR1n9pBqO95mib1TN/uG7XjrzTebd?=
 =?Windows-1252?Q?VLvO556f1xYQsjN7ovd6oeNHd2adxQ5dLK+zX0mhL440oCRofrK9n+Xi?=
 =?Windows-1252?Q?ExQy4bGWgkVaVWISVee2kYuQQkT3uD90UiqG1kC8R6Q4B1PoTqH30TCA?=
 =?Windows-1252?Q?aqDdRyzVA0BTD7jOqS2E0aDobULdcSSDTS1T/EjP5rolYO4hgxR25Lgg?=
 =?Windows-1252?Q?98IOYoWitnVuJeSF2pod7PtOq/pAohfB2LRDYaWYRt7GQp4XPzFpnPHh?=
 =?Windows-1252?Q?3OSAJngPtvqneafsMNIK+2c1bp0mDHb1i/k2IeDtVxLmaLo49kFL67vM?=
 =?Windows-1252?Q?/qeDnHIj+4PATftVyZ8mMdi3NzQsVv1xFju7wMj2Eybq9PXq45XMigYn?=
 =?Windows-1252?Q?SBK7XBXP5j6/fzNd7KM8pUwLaaHsfC1hJ4mU3rfGkgQqc9ECR3njSNPJ?=
 =?Windows-1252?Q?apeBWQSTLfgPO5WSXoDJdHD3lRjWE/McWzXpVLSA29wwzBvTY7d4cL9o?=
 =?Windows-1252?Q?Ti6KwE0yJ+EJhBLG/m7ZWEKErJMLbHGelGjO5yoQHm6Dp9fQCiPItvdw?=
 =?Windows-1252?Q?DjuV/Y+Nbs5C/1xnCS7eG2Oe4Ca1CxPa83JE2XOnmxTnate858UauqSo?=
 =?Windows-1252?Q?++H1+FWxjB5P7MTOcoP6K3Febkb/l07VIypyh/zUrrNS2UYXKz8cecg1?=
 =?Windows-1252?Q?rDmK8VIZ/YjOGXJiP73cAal5+Ndl4MCGmhEV75qU3D8TiNPE1mxn+A5v?=
 =?Windows-1252?Q?CzBmYyVZ53fAOo3xu7KNAJ8F8Hk6r3QbaDBJQNb+ju7/OKzI4bjkGCGU?=
 =?Windows-1252?Q?v5SvNp+odRPaKD2+eJIRCkBJi4xZoOtRpXjGKENoMQUXuzXhrtQjIwQL?=
 =?Windows-1252?Q?q2nt/MB7qSD1HKZ1a04yIH2yOZBjgEbpgwJvankuMt47pBrO+5i0Nklw?=
 =?Windows-1252?Q?YEtJLU40xL95W/qqHtirdxkv30kYeCyhAGBBKKzizFZo3Sno7ti1zjOz?=
 =?Windows-1252?Q?dMYuAdrgzuV2HI6/IDbEfZC123XXeS6v26uclg+oZ65a+LyL0kYwYQnT?=
 =?Windows-1252?Q?jCQJdTzOBIirsjKg1g1xqc9nmgIKtce0nqALhc4bYw6tjz+qa9pvn7+K?=
 =?Windows-1252?Q?/aYShoKXp3INB3ZWTQuWANLns5pZppfrHlyXID1TTUn6oXuN1ow0/0Hn?=
 =?Windows-1252?Q?FLOl7wOe73cvbqERn7kbpXt3MrhO4Umed6ApFPvvjRqLuJ28Xxt4TMnN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2780d0b8-c8aa-40df-dc69-08d8f823358c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 11:08:58.2471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/iXvqzFKW0jp+deJbXbOT/8Gr8DsqDxIx6bQKoUpQGztyI8InpL4eQNAHli+gG1sxOaWKFjjRrB1ZwA7g92FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Tzung-Bi Shih <tzungbi@google.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander.Deucher@amd.com, shumingf@realtek.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 flove@realtek.com, Akshu Agrawal <akshu.agrawal@amd.com>
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



On 3/30/21 9:57 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/30/21 10:35 AM, Mark Brown wrote:
>> On Tue, Mar 30, 2021 at 09:12:11PM +0530, Mukunda,Vijendar wrote:
>>> On 3/30/21 7:52 PM, Pierre-Louis Bossart wrote:
>>
>>>>>    static const struct acpi_device_id acp3x_audio_acpi_match[] = {
>>>>>        { "AMDI5682", (unsigned long)&acp3x_5682},
>>>>>        { "AMDI1015", (unsigned long)&acp3x_1015},
>>>>> +    { "AMDP1015", (unsigned long)&acp3x_1015p},
>>
>>>> This isn't a valid ACPI ID. AMDP does not exist in
>>
>> ...
>>
>>>> There was a similar issue with Intel platforms using this part, we had
>>>> to use a different HID.
>>
>>> Is it okay if i use "AMDI1016" for ALC1015P?
>>
>> That's valid, though obviously you might regret that later on if someone
>> releases a CODEC with a 1016 name (equally well ACPI being what it is
>> there's no good options for naming).
> 
> wish granted, the 1016 already exists :-)
> you may want to align with what we did for Intel and use the same HID: 
> RTL1015

As per RTK team inputs, "RTL1015" ACPI HID is in use for RT1015p codec 
driver.
RTK team suggested us to use "RTL1015A" as ACPI HID.
Let us know, if we can use "RTL1015A" as an ACPI HID?

-
Vijendar


