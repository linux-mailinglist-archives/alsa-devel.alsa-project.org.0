Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462FA34D2FC
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 16:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9731685;
	Mon, 29 Mar 2021 16:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9731685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617029970;
	bh=pN7n6clDoiBfHitWmVIU3HYMrsnUjB8wWnmfLTR8Tqw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHvTAezibW+xHd+LcFOcTquYZHexEm03vyYOeHYySesXbyLtu0l2pHb0v0po1IgMi
	 6iMK9QoVxpxkq4dm5F4J/1GM+6x9UsDoAa+SwZb/xMOLMElTU52/z8R/VEowULSeyL
	 h3WPKchE63ebTFSm1OiDAF8AlyRHHRju4i1id7uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8154F80141;
	Mon, 29 Mar 2021 16:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30364F8015A; Mon, 29 Mar 2021 16:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE5F3F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 16:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE5F3F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="5RYB59O1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awrGKZpEbKOr1hTuE7ye0weANqewMJ8Syk08lRCAkJy3oODpoLiKiTBFAdriE/9SFoaMMHe+GjljH44rj+JBRdtgpeQyi7jXR0OlCGL8wOsdbVCmbrpYczcE2bw0JbEuKrta+SbPsbnQn4mDsYrtrxr9Ioh3EV84RYxsk7UVVmoIV0tUIagshjuCm3ajfk2AgTukAOrcbSMHOLHbi+qBkvsVikQA2ZDDkS17/FwwPMuoYh6GadU/CL+5r4ywr+jv0ei9as/49PfZkMcYb8YDc1BZ3E1cP4lnpGyaZki6RLoMe1g2K9az+zaVLbGrcuM/R2ku2/rOFCVaZnudC/SQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trgx3TfvH9bM1lQWVCHYaUcOV/I6WyBMFAk6ITJioKQ=;
 b=OG4BhbMPikDBwf1M7wj6gFo254qQcdGbx/hEM39GV6IChupOvWuv6ukhG6z8x3ARCjBJOwagVIgrlndOsHcD4d4GPYqPaoY5AwKtwffuCzCRg7FobKoQuYqZJvTfwZwQ3jgNlAvoG//8Lt27T8/h4eLOO1A9pHDQq6HP5cPHS07bIJBSJhKRIELApIAMlnRYHeYBzZhT6o+UdeoQvJF1ei8BPQwcY6KtZQ6GAvAWPZyq7gww4xDvlMzlJLxpgWstxUnt6VHvDvzezWVZue5lrKgmx993SVZ/vf/27Ryl2e7KQf3aqId3ly4+GFG45X3VUHYNlX2UpBxr6g1OgWwx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trgx3TfvH9bM1lQWVCHYaUcOV/I6WyBMFAk6ITJioKQ=;
 b=5RYB59O16106SezjGSDepmkiII+Ds4K8cuHUhe5VEZBMOCS0IBQN0TAglvdDcA8b1DCHrDU5u3smDKplfg8DYa2GXhsBmHIOoiLcPKWggSWPe8TqlXSnBKCm0cHvHKhDReilzZKHBsJYiwvqWNhn2KuIS0c44WgWja44Ji1G3fU=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 14:57:30 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 14:57:30 +0000
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
 <65039cab-5561-aa9c-f270-8fa968a78f42@amd.com> <s5h5z1foh2q.wl-tiwai@suse.de>
 <cc6da2bc-268d-b9e9-a609-cb29276f24a8@amd.com> <s5hwntvkx2c.wl-tiwai@suse.de>
 <7788be67-e78f-4738-0ffe-27d4717c6f58@amd.com> <s5htuoxj9ig.wl-tiwai@suse.de>
 <b479fa68-186f-249d-3e32-bfa9c83422d5@amd.com> <s5hpmzihv1h.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <4fb0fc69-8ec6-4560-fe32-6672c24b331d@amd.com>
Date: Mon, 29 Mar 2021 10:57:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5hpmzihv1h.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6]
X-ClientProxiedBy: YT1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::34)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6]
 (2607:fea8:3edf:49b0:bf15:ec51:a1c2:5ab6) by
 YT1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Mon, 29 Mar 2021 14:57:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f9da23d-dfc9-4ebf-5c6a-08d8f2c2f99d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4398B03D682F4C1EF0B9F381EA7E9@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEhK1100rk3BMA26a9Y1wAxZxwJshpUjrwW4kSBLbYW/oqivJUdWWfy0NOJ7RnEQn+2u2Jx4Gdf6cQGVjFZSH/LcJKTWcIzp5LQ4W4/qTkW91DkEM2FWqSJfezdd7fx96OjOLavWzfY9o91F/9vA9tspnZQbsRdUKilsnnO5Y/mNGYSOkvkYj3paAN1YOONGpIWx0P6EjZ31Ol5+KvcYb/E9wBzoGUY9MSoojCC4t8205gr5z3RAwASkYyHyt9ovwfcH9bNoYnEnaN7hctUuwnlyeqxehl9hh3kMhsn3ocFYGR1X7EmTOzRkRq+BTz9k+8YfKUi/5D0WxzbfQ/cTuojE9nwTf510VUokdiHD8VYR5UFrEQyy87tuyxydItKNfb72H0wJ/LSmo2UgPqzXcUXqukxHLTL0YkvAOQ9ioARkwiGJcorheBsEauMqC5HDg++XZIYIwZG2VsnLY6qTFh4QeEc4uJ8IPuYGhDMeA74r42Jr4TrcU4Dex5CkzjsNMMCsELSFOY3PMcpwCoYHA9y3gno6rNP7G0qeFFu5xK0WCv4V1V1OpiImGntMAi//0xAx6uLJYvKEKyK0UyY2vmPweBW8NDEgivmpDYVU8J5ppyuL5R1TPG4C/A6qyB+m7So0h379nMA2t8NUnxFQ8WMgMqZ+BccBj9O+uofGUs0szJ5ZMo0DE4Q9VmNw34XbXdi6Gl0AYL5a14PhDuIGBcnPTqdv/FbloMC4oygC/RkSOfXJebtydp9Ynf/ygImXPEt/DlScU2FFCH1NCNefhDZf3Q4VWfD8PEkgwijz3YU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(16526019)(6486002)(54906003)(36756003)(316002)(53546011)(66476007)(66946007)(31696002)(186003)(8676002)(966005)(86362001)(31686004)(38100700001)(5660300002)(8936002)(44832011)(83380400001)(2616005)(478600001)(2906002)(66556008)(4326008)(6916009)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmlhMGdTMTdYenY4a1dMbDBqZmd0SHovWEpuSHpZT09QbGVrNmxrR3Z2QW1M?=
 =?utf-8?B?ck9aQWljUldFSU9NV0gzbXZ4WDQxaUdPRDY5M1Zod0RueWh5TWFsZnVmNDA1?=
 =?utf-8?B?eUo2NXJCS1hTMi8wblRpZmxCV1RrRjVYRjZjbk1QbkNxTjZvZkR3ZCszbWNU?=
 =?utf-8?B?ak4yUWg2MXBTcENoUnRlYWxTOGQ3S2FVZy9PaTZQd1J6QVc4TXprNUp1ZXcv?=
 =?utf-8?B?TGhrMS9wT3JsUk9hUGNVVndwRUZyK1VmYk5mQVVFNFY4SEM2djdjaUY3bC8w?=
 =?utf-8?B?Q3piUVFycmt5NE1ucFBFeFNCUFRONDFXeXFocFVjd0xBL2VlQ3BYc0pJQkFQ?=
 =?utf-8?B?aE5OVDhsSTdaY2hpQ3hrMWJOZS9rNEpkNTZrNHd1RElzdUhTWDJsRWliTXhy?=
 =?utf-8?B?d2Z6bTFZZTdlc1I3RTVSQ21qRWJkOGNxMCtjazc5NUpJRmlaVW1ZVW4xSzRj?=
 =?utf-8?B?QWtnb0Vnb3VjS29RRnBFNG9WUCtzaEljU1A5YkhXVGlnT0dVUlB3VmdYaXZY?=
 =?utf-8?B?NjQxVFEzSm9UdzdocGIxM2JJajhGbCtpbENFdC9kbC9YdWRxSzdxeW40ekNI?=
 =?utf-8?B?QlNCVUwyMHBrUEZ3ajdncWZKd1gxVzNDZERXQ3hsUkVmbkxMOUtIbTU1WkNh?=
 =?utf-8?B?UzMySGhETUhaSlpaVWdheWp6WEhoQnpDTWpZcG5aZlNENElVYmlyZVVQRFZO?=
 =?utf-8?B?S2FRMlRoSzFOWFp6M2ZMVkVQdHNZci9yM2FzNkQ1OUliMU5yN0FqSGZ6bjFy?=
 =?utf-8?B?NWdKdTRZYWt2dG9Fa1k4SzNiMHpHTC9DemxaZ1hJSUd3SDBDYzc1cjc1UEIz?=
 =?utf-8?B?VlBHOWd1citvaENhUXhtSXh5R3JPR0ZEbG9TSHo3Vzh6KzdYYlg0dkZ3VFVX?=
 =?utf-8?B?eTUxK3QwcXRpWFIweXJUblY5MDRaMFc3VnVoUHlqN0pPNlBqQVg4SVdZVmZI?=
 =?utf-8?B?a3k5LzJJSU8zOC9NcVVURFlTdUFnMi9uNy9LRUl3NFF3SVdBMlE0RTFWYXJN?=
 =?utf-8?B?NmZqNWVyaDI5N1Zod1VSUU5lSk12WGNlczZOVEk3MUhXMlB3cjM0UjhPZDJv?=
 =?utf-8?B?N2ZCeEJOSStXVTdZOEFsakkrNDJBcGttbEZLa1ozUG02VUg5Y1lNMUVNM1Mv?=
 =?utf-8?B?ZGIvSDI2MlJqV01sOVJrSWM5SWF4QVJWRnJUOGw0SVl6N2RNVmNQVFF1ZlFS?=
 =?utf-8?B?OTVSYmROVjc3NkZwcFNGOHJNRU5iNjZhMTNYRVRDQU5ab0dyUHNvRVM5MHNT?=
 =?utf-8?B?aVlTbEhuVFhldzBQVnY1UE5QeTZJd1ZJdXhyMmNUOWorMEc4SHVlcXpwbkVp?=
 =?utf-8?B?T3llYjFjQjNTRVI5TTZjc0tLYkREMTZtckJ1emRBdjVVbUo4OWlIMXhPQW51?=
 =?utf-8?B?NThNTWk0QXgweW1RTnNaU09mb21DeVlURWZCSk5xSXNXKyttWWJOcTZ5dUND?=
 =?utf-8?B?VVE4dU9yc1dENjhXUDJWSzdHam9vL04ydXRVZzd6RzNTUjNFMmZzS3NwbVBk?=
 =?utf-8?B?UUlPY2F3cTVYR1FsNi9kY3JqOU5XbXIrNmtGa1F5dW9sR1lnR0ZWWHhJTFpq?=
 =?utf-8?B?LzN3SVVTeVk0ajdMSHFXZjhVKy85LzIyaHNnUTUyYmhTMk1ueU9aVkhZbm11?=
 =?utf-8?B?YTVkbjZjRmlsLzBlZUhWbGVBejFmM0FOMWJIRHZrMzlqNUd2M0YrejNyTmll?=
 =?utf-8?B?M1VKYUlvUEZDa1VKbEJZR1JWSkxLbm1YczRrS1FzQVJoeXp2VW9lZnZLQmlu?=
 =?utf-8?B?MGIycGVFQmtWejRyL24wUUJhR2x0eHEvZDB5TE96UUN6MTZpSndCNjJweE4r?=
 =?utf-8?B?MEFWUnB2OG9INTRac1Bxd0dEU3VFYUV3U09PT29qenhrWUpFY0dIcFk3c2xU?=
 =?utf-8?Q?7yu76zaCv5VcZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9da23d-dfc9-4ebf-5c6a-08d8f2c2f99d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 14:57:29.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7SJAfg9AGjQ9OYyp8k0qcVANAzF2UXNuYu2Y4QRudtn0gSAWAjiGl3E+e+Eyt1uNq7JV/+Pa/Vub1BhX4HvKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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

Yea, better give me final version now as I might forget later.

I keep my work here - 
https://cgit.freedesktop.org/~agrodzov/linux/log/?h=yadro/pcie_hotplug/movable_bars_v9.1
It's a clone of Segei's original branch here 
https://github.com/YADRO-KNS/linux/commits/yadro/pcie_hotplug/movable_bars_v9.1
+ My amdgpu work and your ALSA work on top, once I finish the USB part
and resolve a few issues I still observe with AMDGPU
i will ask Sergei to merge everything to his branch and
form there I guess he will move on to submit another RFC.

Andrey


On 2021-03-29 10:52 a.m., Takashi Iwai wrote:
> On Mon, 29 Mar 2021 16:47:04 +0200,
> Andrey Grodzovsky wrote:
>>
>> Tested and Looks good.
>>
>> Thanks a lot for ur help! I will be moving now to work
>> on USB driver as this is another on CARD controller
>> we need to take care of.
> 
> OK, let me know if you need the final version some time later.
> The last (main) patch has no description, and I corrected a few minor
> things from the previous patch set.
> 
> Or, if you can give some branch I can put those patches on the top, I
> can keep it in my tree, too.
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Andrey
>>
>> On 2021-03-27 4:17 a.m., Takashi Iwai wrote:
>>> On Fri, 26 Mar 2021 22:27:26 +0100,
>>> Andrey Grodzovsky wrote:
>>>>
>>>> Attached.
>>>
>>> Thanks.  I found that there are a few other places that may enter the
>>> hardware access and might need the power_state blocking similarly.
>>>
>>> The patch set below is a refreshed one including those.
>>>
>>>
>>> Takashi
>>>
>>
