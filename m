Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 121E221CCC7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 03:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5761669;
	Mon, 13 Jul 2020 03:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5761669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594603120;
	bh=OMENNFKoKH5/BY1aIEnvxRPNNGt5O1qDyOUPCMbxHoM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDT5epMaF6Uo2qHE2nQcUO5E707ROc3E916PNt7ktACF6wB4ZDGqLStQF5A5VgfEe
	 vZvkORlZpoqIXZswBmM/CZ4jYJ1cd9x54sI/EG4WvNmV/rltxcOeghK8bdyt8Y3quQ
	 IAPnbdDw8rz0Uk4NLuxSaKttAAqZqou4KDqMlxRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F35BF800E5;
	Mon, 13 Jul 2020 03:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8BFF8021D; Mon, 13 Jul 2020 03:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C451AF80116
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 03:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C451AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qMk5iC49"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0sRBJxy2uBAubkomYwxwZVI9YqlU6n3eoHoKEHLp+aX+NZu8TtgPjhg1sGnrm6hF9dRGJsHLpTYf0Jjw/Vlr8Kv94FuPJEZTYYaBF9f3jjuIBRSxT2DPLYN4VMTGXuP5dBshidI/FhZmgN1DJfesqLZ5z/TxbK+KmW9oajr7U5sj/eZIEjPVlDDfCkZlB6tKfuEaFPQkkd34abo4zyal97MGpLcvJ2ez+BJAWcePWhqJ5V+/DvMqtRrbUS15lPZ+BOxyMyI+QdDOTeejjXGvUS4KnXTzuV7OHmqYFGtyiuALYpCnmki7c0hftUbB3cfoBo9Z39rbvtzAm1BMvwhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpDrshVHXqNAA06mJqpKdST8NgabgdfvCB6qbi01dHI=;
 b=PrmKNDr6j7QwGmsC9XmxOeGRPxD9eKlxOHgGY6vDWRaM8Ydw59ZVuiHBt4DN1c7Bo8het4cuVzlXc4ISZs8ddEQflfqPOPvEItQDtnIg8g30R73o3QRaqBDA+XSME93a/h4rgP8bkB49T2Ws/Yz4u6Uafy8AL0dH4sWfJ7I3cNGyrvG/Z8HPHeGMFsZ5MG+DJKweWCC9AwSuHzbrjlA2gn69qpiGWlkN/WwvWH7RT150LAOfVfywdrPB4vn000heRFomHBgKkd1fDF4ViBj/V8yENgy7FZKnEoT0Uj0fgrFCj7GKg0v3Hmba7c4VTaMN9p9g0wZA0xoSXEKahvw80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpDrshVHXqNAA06mJqpKdST8NgabgdfvCB6qbi01dHI=;
 b=qMk5iC49UkhwDs3cDe8IAeqWzZl0INoEukJk3Xeg1DKbol5mhuCTq6+EeOiwPo8XyNPNIp8d0KY0XYQvdwyqmuR6v6gt9HlYV4Kxrwh/4INkAickN+psr6F0s7kL8rZ0/RsIbi1GXnzl4/G9a7ibAyJfRUJu30p13ZZMimCwGT0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1599.namprd12.prod.outlook.com (2603:10b6:301:10::12)
 by MW2PR12MB2523.namprd12.prod.outlook.com (2603:10b6:907:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 01:16:40 +0000
Received: from MWHPR12MB1599.namprd12.prod.outlook.com
 ([fe80::25b9:83b0:4b17:2c63]) by MWHPR12MB1599.namprd12.prod.outlook.com
 ([fe80::25b9:83b0:4b17:2c63%12]) with mapi id 15.20.3174.025; Mon, 13 Jul
 2020 01:16:40 +0000
Subject: Re: [PATCH] ASoC: rt5682: Add fmw property to get name of mclk
To: Mark Brown <broonie@kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>
References: <20200707100825.24792-1-akshu.agrawal@amd.com>
 <20200707103053.GF4870@sirena.org.uk>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <a2cf09b4-5f49-ba74-060f-bec9a49d21a6@amd.com>
Date: Mon, 13 Jul 2020 06:46:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200707103053.GF4870@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN1PR0101CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::22) To MWHPR12MB1599.namprd12.prod.outlook.com
 (2603:10b6:301:10::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.32.35] (165.204.159.242) by
 PN1PR0101CA0012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Mon, 13 Jul 2020 01:16:37 +0000
X-Originating-IP: [165.204.159.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25408979-4206-43f3-b3c5-08d826ca657b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25230F5E97CE571E0303B864F8600@MW2PR12MB2523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fJ2Gt1sBxkgeM7qRjZnwVj5rsghPESa+b9qCs/mHiocx9yhfMohqxjj9tIcaXiXUOozllHe2hw13PA5KPHQPGm8Zmvc8gYG0/Y+XbfmPMwn2DCCr7yYhvU2IwGrpvTC46U5EwUPjtnFGJPpYAKxviFkc4UJJTNFEZNRD51Sv/ORIYps/uhGWEz3bi/+bT7iFA2EDUQxswe09+nu5RhTPMgNL4ONRIIBqE83SFhHsPuQINTwZjLTtxRuPtKH1adAHM4rTVC6cT7eYmQlBR9EKtKGX6Z5WCeEymCMj5Y1qCIOasZnXjJieSHwL1fY7gi5RoL7W8SvT1bPGxOCMeO2JaqOyZ8yYTcg7/aq6egvSKO6Y46YTZGfqZx3bzIE/GYQs0EwqQ6UPrSV0Og+esKYjFY0XfUcBvWVn8GpGgmoOEl8qZF7HfdPw/bhrx5RYlcBRO/SMYuTN52N2GGu5svgwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(316002)(5660300002)(52116002)(31696002)(966005)(186003)(16526019)(2906002)(26005)(53546011)(478600001)(36756003)(6636002)(66556008)(66476007)(6486002)(956004)(4326008)(66946007)(2616005)(4744005)(6666004)(83380400001)(31686004)(8936002)(16576012)(110136005)(8676002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZUCYnmpM4FKn+lyoWADz77KNHRpUqucm4j2jrO7EKpEUgLJH5+m1J+oqe1aV8SpNuR17uuLXJo17WB7ZkXhoc+JJbCs+t+ISdsM4Wl8qK4um81PKJ5Sffi1WndzA99+YFtAOD8d93USFOQudTD00d+tbzoWyGLIW0lBzLdLkW9GIL/TwLQwOVthsTcqhosS0d10H0KajoufswyCO0+UkWPBhGSSNi2jCmRPIuomHEEFKwGmCbeJzWxIdLNYeAa6YQdTzDRA7t+gm4lh/UwA7gjw2HSnvEf4GtX5BsnsASlObv+gVYkFFv2rgMqmr8r8AY2wnbh6GTFuTu/2D9YAzDYPO4X1pLyFDNfhPJbRgE5Q32HtSh4nTPOAaCergsuZF9e3LDkMDx/+vQNnc0P80TRU1E6p4VsFVVccnE2WkmN4TWwHZavQXB5ME1+MOZryyy5JzHo+GFfhlVVcFQ7RJ7qIU0TohnuYLP4TCkoTMNPc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25408979-4206-43f3-b3c5-08d826ca657b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 01:16:40.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkbt+3nxlmteEWi7bf+CAWtXjg+EXViD3EOV+vgd97DSn1lLIICvknwuy9gWvdmetg2kIJLc+RF7zuUHzMLv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2523
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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


On 7/7/2020 4:00 PM, Mark Brown wrote:
> On Tue, Jul 07, 2020 at 03:38:25PM +0530, Akshu Agrawal wrote:
>> Non-dts based systems can use ACPI DSDT to pass on the mclk.
>> Thus add fmw property mclk-name to get the name of the system clk
>> and link it to rt5682 mclk.
> ACPI doesn't support clocks at all, you need to add a clock binding to
> ACPI first.  The idiomatic way to do this would be to have board
> specific quirks.

clk binding is present for AMD ST platform and using the same.

With recent submitted patches I am making them generic for all AMD 
platforms.

Please refer patches:

https://patchwork.kernel.org/patch/11658505/

https://patchwork.kernel.org/patch/11658507/

Thanks,

Akshu

>
>> +	device_property_read_string(dev, "realtek,mclk-name", &rt5682->pdata.mclk_name);
>> +
> No, this is not at all OK - you're adding this via a device property
> which means that this will show up in the DT bindings too.
