Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2B2D31BC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:08:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24D516E1;
	Tue,  8 Dec 2020 19:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24D516E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607450939;
	bh=XCycTBv8hY9LZh6opz5uNweTc9jFUYeYoYeubeqxEB0=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D12PDXr9E+PT0425/qGUEzHJQdPqjOub9lUCPRFF91mNHgS+SCzfJKj0C0Jnan6Zy
	 0L9Ziy10p1clo/8j/1C0McU/IuC7eLGEuGMs+HpKW9JVFuZ8PqqKSu9sQfKx/fXl4f
	 LuxPE7ubaAWgmzuKBN0X6qmoIEThx6YJI8AMGtZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F79F80130;
	Tue,  8 Dec 2020 19:07:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E7CF80130; Tue,  8 Dec 2020 19:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8212F8019D
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8212F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="AXDNOj64"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY8K5Ij6mX+So5Q6sf758qUNCoaBEvcLBDnVbBVtnX8IGKbs1w75YyKpIbrChQ8ygY6kolRroTpvclo4Bz9PSLnriPffACZNQbntFqCwHP8j+UrILQJy3E2Hqn1/QO5sfOBFwFkLVToWNv/Tzzc9wQm0H79CpEC7jP3UqQ0ZBjPPrYVFOmAhU2M2+fzLeQj8V/mmtBGi3NtRTGP5zIttmG0CpSfoq9EaoVsJ3hDOTZ0K1sjjPoheoGHlbWFDHdkOFs6MNGyue26zosuYGjxuCxQRUVffJZU1AAzXPjtYjkfldpwaw2GnT91J/zp/BeIx73xMO66RAv9GyFs7gbQwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iUZDrM/YvY6JSqFoq21+bsYlxQZIGqLeOQOxHErjKQ=;
 b=bXz/UZsZG4W+XadcjyQtZebwCOFs6TYc1Bg2xyZ4frfbDOc8FtrWySxAlVxTbiYIAvdNUzzGILHhoLLo3ETSQoxIlDbnFmiX+NphwkTqoBHi0v+Rpt8GYqHal46IqC4fBQ6tFzf+633SGRWN2iEmUIp2D2alviLmAQyUPyj3HrJpD3sFkNjRZZ/XaZgdy1yxxsVOKhQDEMLxj/l2n6Xk+QtvKuDpew4gLBs5DjflF/H/jdLL0Q5LHfBj+Hk8QpCl8d0xfW5YMmqq7qpaS2Sk8YrynQBQ7u2s6t1h5ukH4oZTrW+/YVFex9ChiiXrJqHo3+C+I4df9OtgGf6MFkTNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iUZDrM/YvY6JSqFoq21+bsYlxQZIGqLeOQOxHErjKQ=;
 b=AXDNOj64Cqb8AlHMfWTeOTIaxhufMB2aVDDCmwPCA2CYDPlHcwnCRPG1+46wip4/9DyUB1x46VAVj6v24krO83J8mEVKozvv4HkA7BWzNMWMFi587I/lnV5qaNr4M7/j79XFVx3LhYhaT0j5ZtvYqUZP0RZmKqJFsG/H3bfFzn0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MW2PR12MB2521.namprd12.prod.outlook.com (2603:10b6:907:8::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 18:07:15 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 18:07:15 +0000
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de> <20201208174002.GH6686@sirena.org.uk>
 <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com> <s5htuswuqng.wl-tiwai@suse.de>
 <2c48dcdb-e8c8-ca2e-e004-4e63887788c5@amd.com>
Message-ID: <098fa0b7-5493-f3e5-afd5-8296d4300590@amd.com>
Date: Tue, 8 Dec 2020 23:53:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2c48dcdb-e8c8-ca2e-e004-4e63887788c5@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MAXPR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MAXPR01CA0076.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 18:07:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33336f11-4609-408f-f66b-08d89ba4180f
X-MS-TrafficTypeDiagnostic: MW2PR12MB2521:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2521BDB377B44EB004F91A5997CD0@MW2PR12MB2521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEPwQ1QvvZ7pvUPkX3tXNJ9Q3rCnHb8pbfvnWdqIirgTewpgnT5taB4pHNpbHhtRV97K9imE9uI6zx06CzPsbhZRGkGB4rYfCcosBk4mlemnabl0SCo08scZPK6nF/F33cPgO+SaR5GnqFXr2YClLZm18IubPN7pRs+/SyvXptIpjSPmTRZxb6nzyIxXpD/FzxGxs0WKChUKNnhytSud9wLu+X9X3mObUVaiIDZhp0XJHlBonkhQh18HkCLgSKt73Rhcji5KrfV+FQ+7bUKhgHmGH0bdgT6a+IOI7a7o2y3KxjCLcgR21OOThI69MGFkZ69bwbhqza2kuMwfpL58peMxas1XBXFaCJO/0D6DqY73lnSYR9x5wt43YpY6UxK12PRQwA5XkZhBZWK1HwyhehlTisNErGpAG/z5HiOjbqSAoVfYBEAf6n3R7aweZjw6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(36756003)(54906003)(16526019)(66556008)(16576012)(6486002)(52116002)(6916009)(956004)(508600001)(2906002)(6666004)(66476007)(34490700003)(66946007)(53546011)(4326008)(8676002)(5660300002)(186003)(2616005)(86362001)(31686004)(26005)(8936002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0k0bXJCMklObHBrUXpVMVNNbDMvcCt4SG9mZHZWbFRvaFJ5NFdBSG02UHVp?=
 =?utf-8?B?anFnM2JKTWlXbWVRZ1oyRkI4bWV0MzVxSjh6TnRoVFowdmZJZnh4ZHdCa1pU?=
 =?utf-8?B?SStGeTZHTEJDUkhwdDNHTkt5R2J5ODMxZE9CQldOc1BEU25PZ0Zmb2JIRDQr?=
 =?utf-8?B?bG1TYnhDcXV4K2JCZXpRbVpzb2UvYzE5b3o0TFZ5ZW8zdEJOeHNzblZmcGFt?=
 =?utf-8?B?b2RCSUlLUSsxNFU4b0I3SHhpQkppRUlrZEdiZmpTU0s5NVBmQUFmWW81d2xO?=
 =?utf-8?B?cHdsOXpIVjN2TjRvWEJ5em8yU2owQ1VpOThkbEk4U1dLM21nS0R4UGlhQXJv?=
 =?utf-8?B?dWpFVEdiUlUzbUdiZlBRN1JHWEdybXZyWlBGMjlUZkkyc0VmbWpuamxwQTFK?=
 =?utf-8?B?Z3E0MlF2Nms2L3NlcEFMQVh1eFJOSTRnT210R202azczRk4wVXY3NmtJRWlG?=
 =?utf-8?B?dkdCbGJVN01UWWZJb3p1dmlBZGtMbU03N0pBRjNiWkt5bldIeGZMVHlkRmlH?=
 =?utf-8?B?aWFpSS9ocHN0UDFjVkhTTzlFQzBEVk5zUHIzYzlId2EwZGoyVEZTNytxZVBs?=
 =?utf-8?B?Q2tXVWQ4RE9PeDQ1OTJJZGNmbVJudVJ2d3ZkT1p2NnBha29rL2NsRENHUjdL?=
 =?utf-8?B?eUdlWlRmOXYySDkranY1MEw0TDFZeTNvSzNBalhheFYxY2dMUzZsSjdrUkFq?=
 =?utf-8?B?bDF0R05tMitkZ1lSVGRSM0FHcnI3YjZUWVdCV2xmQTFaMHE2OHdWK2d4bVRD?=
 =?utf-8?B?T1hONmVzcitDU2xlUXhqZVNsZlEvT0xydU9OblVRNU9qQmxCVHhGZ1VsTndS?=
 =?utf-8?B?RlFwd3Y4eG1DQ05UZHB2MGRrYXk0UTFyTi9WNGN3N2VWU1dQc1I1c1RlWXdp?=
 =?utf-8?B?OUhIcWJsbXBETzJLMk9rZCtHTHhvUWRSaERiOFhhUnFrZkg3dmF2Y3pvdFJ5?=
 =?utf-8?B?OWNtakJwd01kZTZRN0I4MUdybEpBSmkxb1YxckdwMnpNVWFiTjh3YlFSbWFQ?=
 =?utf-8?B?dUdiTUVFZVNLY0NxUGtvcXQyb1JZK1JqcUk5YVhFQmdYbTZEZ2xaN09jNTda?=
 =?utf-8?B?bEJmOTZYMkJSZlcxTVhaOXJEdGNlSHBlV2czbmRxTHhnSGpLU0s3TlhiY2oz?=
 =?utf-8?B?Qm5lRFd3Yi9BTDdDVzNjQUZqNTdzWHRnaUx5U3FMNUoydzRFbnlGeUo4MVBP?=
 =?utf-8?B?VVVvUVdDV1Z3dERXdmwwOEoxTXRjMVFwbG0vZ3p4SDNGMkN6UkZldEdSekJU?=
 =?utf-8?B?OXUvVnlnZ3NWRC9kME84Z3Jsb0FKNktKV2pMZmwrOVJOM3gybExDclp4WU82?=
 =?utf-8?Q?X0naOdLgBoR3vI0lbnnriA29Hkyla93HEI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 18:07:15.3016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 33336f11-4609-408f-f66b-08d89ba4180f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaPPrDPOv3rCLan+vkI+FKbXYemzE+M7SsewAp5S5tqSQ9/0Y9DtGoF/wC/EQmpyfQXNKzDDiPZYX2myXDhK/w==
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



On 08/12/20 11:51 pm, Mukunda,Vijendar wrote:
> 
> 
> On 08/12/20 11:27 pm, Takashi Iwai wrote:
>> On Tue, 08 Dec 2020 19:06:21 +0100,
>> Mukunda,Vijendar wrote:
>>>
>>>
>>>
>>> On 08/12/20 11:10 pm, Mark Brown wrote:
>>>> On Tue, Dec 08, 2020 at 05:24:32PM +0100, Takashi Iwai wrote:
>>>>
>>>>> BTW, both Raven and Reonir drivers point to the very same PCI ID,
>>>>> and both drivers will be probed for this machine (and both to be
>>>>> skipped).
>>>>
>>>> Ugh, that's not good.  It's not even super obvious from the code that
>>>> this is happening.  Seems like it should be one core driver which
>>>> instantiates the components for Raven and Reonir as appropriate, the 
>>>> PCI
>>>> driver is pretty thin at present anyway.
>>>>
>>>
>>> Raven and Renoir has same PCI ID but both platforms have different
>>> revision ID. Raven platform revision id is 0x00 where as for Renoir it
>>> is 0x01.
>>
>> But your drivers don't check the revision ID, as far as I see?
>>
>> The linux PCI driver doesn't distinguish the revision id at the
>> matching time, unfortunately.
>>
>>
>> Takashi
>>
> Apart from Revision ID difference, There are few hardware differences
> specific to ACP IP.
> ACP IP hardware versions are different for Raven and Renoir.
> Unfortunately we don't have specific logic to distinguish ACP hardware 
> versions for Raven and Renoir.
> 
But build wise both Raven and Renoir uses different Kconfig options.

