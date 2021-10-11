Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52A428BDF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 13:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 472101674;
	Mon, 11 Oct 2021 13:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 472101674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633951404;
	bh=i1Wi6NEY6NU1mPL7s6rpWhGeABlKP0W4nJG+i+GqOMQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7BknlQwsnuUDiCejn6V2hEgOK6wqy0uL/CwpiDdfsJHtZ/+azer2s+TPDw+7sUXI
	 m3R/Cze6r95T7WvDpMwjAmWNluVZElcxClEKxU7ltnk+s3RdEb5d3xrJXRN6dz/VAC
	 2GMgfKyrjTrcxAEb/8EFdg0hCnkB1UQAYQBOxcxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B88F80104;
	Mon, 11 Oct 2021 13:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F9A3F80269; Mon, 11 Oct 2021 13:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5BF3F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 13:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BF3F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="1aU1qRgv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlWhmo5k6mjb7jhJ9zhDOZ8tgDZ5b5yikhDS2xIFvZxhaRIv1CQ11zkc2ZID1srtQeDV0eJvH8chYfUTvjEpYhVL91yUMrsVHKZsYSNy1J6ieTBCdMMzS+2Grb0RV0fs0bZMqwttGvWOi5Ogxklz1oxv31WsT4T1Av5lBvfiaGl0h1qpdozO/4YSNPxYpGpBXtUJ5hEIRTfiydKTfAy9ljHtzM/ObixjTJUTIq4IUzK6jtwo8Pb+RjGTkqHYA/iLrJjr+F7LGC5uEMRAgUoKX/AlUfOa3ZUXUv0HcLN0Ct1Vel7oX7tHTK9bucpJ3yzfTcSZDJRCQtTWFe7nOBPTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY96PG7RicVSM8rDIzAHUm114WC8UM1GoYjQSEyW9fE=;
 b=nUDt+QX61hES05LPzD4SWbT/hnqzPkKvQMln3PtYTlkIfXQhsnfp83p1uiR3pJ5NcJox6CkAWfGMk/kkqwwHwuzF2k9TeKiPuwAmOSdHqnraArZV4CH0bNVYn1fHONJs8LFIowZNu/I5dj/OYAMZFH+jSW/z6wAIov/1En72p8E0qSALGrUuIvZYHFLQMN7kmVYlTJQm4DkiDmQAkybGBmlcOiw8TQ66O0seC9ZFOB/sFMwte0UHaQkPzkOPU55GXHceV8xDhmHGoAgqr/YvjePOw4nWgXoIVASCs+GRH6h8xEVqHZwHfI8VG5O0inJUEQz9YwXTLleIEA2ib1uPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY96PG7RicVSM8rDIzAHUm114WC8UM1GoYjQSEyW9fE=;
 b=1aU1qRgv7I7iTPZweKO/76J2Iib7cUiqCxRVemijzjpa8cVzIl0LjF59Sv9S7C/VV0ZRupaQxCmbkTgYQS3vepLKOAkAs/4+Wtbo4mAnVV7rzM31madwjF4OaguAyiHOWcev7LdYuh9ig8YwSagP4XgGCzqm+VVcEZ74Ykl5x3M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 11:21:57 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3%9]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:21:56 +0000
Subject: Re: [PATCH 03/13] ASoC: amd: add acp6x init/de-init functions
To: "Gong, Richard" <richard.gong@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
 <20211011055621.13240-4-Vijendar.Mukunda@amd.com>
 <32f0e33d-0f9b-f27d-2fa8-63b493c2d9aa@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <f40c17a4-409f-1c39-5271-f19a6591ae56@amd.com>
Date: Mon, 11 Oct 2021 17:10:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <32f0e33d-0f9b-f27d-2fa8-63b493c2d9aa@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::12) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:97::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20 via Frontend Transport; Mon, 11 Oct 2021 11:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb12c2bb-41d1-47ee-41a3-08d98ca955ab
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1849828E07E2FC37F040BFCB97B59@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zS+TrUFPWLnKAqs1FazHlsiEsI6Sw3eobQUZdDb5PIV3WXn+stCtswfKQWSpOe4DJqpDJvSL4RRzJCO89wGQqLv1b8kEG5GJYb2kGxQJ3qIRV55W1PeoI16UdvIxv2dJDB1GCLdol9gbsm6r0D5C2nUx6HUsX+NE67M8ifKaqyvd6yIrnIhtaK10S3qg1glwHf+wvtNbGXcYssxNLCysX2+eOf/AoH9M6WevU0ZPiE2XnqFUENmNH3qHAnoAZuUB5aKPoGgiH4Cui2B/etGMM9H9KslGiMC2g9V8dpqiSe/WXl2wPi4KcmxiY4ana5eOk+OKthTCcW7QYu8n/+7axzOY3uFrdGB+3XMgyc4kkbq+43z8+c3N5SZMh3G01JIncj5C/I1FHKTKAkD/rkQqhM45WHp/RxiO37cphQxWH722QDaBYg7r0qUwgkH+UL8+IzLREH7PmhVGLZT42rEXN8CA6/ysudcOhd+xe5c9ZCdaygt0Ufp4ttdpNLKL9BEehiYgVd+adsJMSCt0Vn09baXi3o43o8xBBl66CpYcEzhql9riup08zYDs/7dxUc9yJzq30AYo/HqLG9GfC3oTzHThVC5P7GndHhU55Vs4duQ8fVmwMXDYuFP3RYAGi+MdEKAmH9DtLIwywNgmtrcz03KEapMnqOjFBod+E0YdflIs3DFqrD8rn/ULBTw2QO6eteJfhnW6EefxCqKarykZ/Lur4toCB0+mNlO6xyt0u3InXfKhA4r+thejORER2CYSHQwn4ejNyUcWIFgzSjLWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(31686004)(86362001)(66946007)(31696002)(2616005)(956004)(36756003)(2906002)(53546011)(186003)(4326008)(6486002)(8676002)(508600001)(5660300002)(8936002)(26005)(316002)(54906003)(110136005)(16576012)(6666004)(38100700002)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWozamVMMklmaWtyeXA1MG1GaEZVeHVXLzl5M1hxOU5IcU5qNitFN2VTbmZS?=
 =?utf-8?B?RU9SY0lnY0Vtb1RaWE81bksxTDBpbFFkWHFhWmhXTUlnMk82V0cwMno2ZEI0?=
 =?utf-8?B?SHFFVHFCaTFBMHNMV2pORC9YdlY0d21KYjlwSTYwalk3ZXpoYlE5VDB6VFMz?=
 =?utf-8?B?aXZuY1VNS3c2NEs5RU9INHQycGpLamxLOWdEWE16S0tTbmE4bExoNlBJakp1?=
 =?utf-8?B?SW52T3VhQktmdDN0TTJOdzMwMmlLSlBGL1RiLzdWZjIvYUJwL3NkRFQ1K3Fk?=
 =?utf-8?B?ZlFYQkRvQ0pZeVZLY1FNNlZtM1JtMVo2SjdwOU9nM2c4T1dld01FSXBJQlFL?=
 =?utf-8?B?amxaOWpiOUd0SmN6U3hkVStZbzNiUXA5T1pNYVpsUlVzeHQzdmMrYzMzMG1i?=
 =?utf-8?B?LzhqeVRIOXhYK2MyeU5qaFNFazR2eEQxMGhiSHBxWjN3TDVNTHBPdERuSTV1?=
 =?utf-8?B?MmY4K0JoY1JkcjE3bVBTV2ZVcU00QW5aZVFZMGZ6cnVkZS9oL3N2U2R0bGdy?=
 =?utf-8?B?d2N6T1lnOFl2NVlETjFqem1ieHBtd2VtelRkT2VqTTJNdThJbVNpMkZ4Tm1N?=
 =?utf-8?B?US9FT0tXekJnQU9hSWNjcDZ5VXR5RFNmcW5ocFc4Wnk0YUFzejF5RDlrdHdP?=
 =?utf-8?B?d0MweGJEUmlwZlZQRWh6d3FvUEFKTlZjVDJUeUtGbzBNdFNtMEVzSWlHQkYz?=
 =?utf-8?B?WUdSYVI2ODdZcE44T09rZkZXRzJmMFhzMDA0eHFJR2ZYVVdDOC9GZ2hwQm5N?=
 =?utf-8?B?azhxbVBPa3BUa29rNW1jUGJEb1ZycDl5YzJ5V1pZSDg4a3VDb3p4b1Z0MmxP?=
 =?utf-8?B?YnlVekRwNzRFM2NoUDRMQ3Ird1VGdE0xMUZ3d2ZVSURTanQ3c0FEMStVdUdQ?=
 =?utf-8?B?bHRhd1JIamVjdUlhTmlUN2k2Yzhia3BHcFVXU2pSQm1aZ0pzYlAzTXNTZ0k2?=
 =?utf-8?B?cDdQSENuMGZpTnZWa0F0dzM4Y2ZsMUNHZ3FsWGNTVC95TGlVRncxS2ZzVldi?=
 =?utf-8?B?Sm5vRXh4cllGNnR4NEZZQURwZkEwR25kaExMZXF4aDFPb0hITEUzdFE1MzFq?=
 =?utf-8?B?aGVRcTRlMy9JR2txMVFWdHg0Vm5SQTNSNTk1M2Jmd3dwQkpEdWNTaEk0VHVs?=
 =?utf-8?B?TmRkUW9SVzhhYmhHbWlMTXA1SWlTdGQycjFueVJwT2d5amNzdWgwbDhacnpE?=
 =?utf-8?B?Z01qVmV5R0hLTFFwc3RWbnp4RHQyNkFlazI1MU9HVlhIM2x4QzFxTW41dllv?=
 =?utf-8?B?bk1kVVFGY0FWT2VwbnhrbXEzeUE3MlFLZHUzMDFLRkJSUlVtR3VSejFFMUp4?=
 =?utf-8?B?Z0dzQVhiNStvc25ISzg3RXN3MHF5d2VCa2NjWDRqZERxM3BPaUluQTBRN1Qx?=
 =?utf-8?B?aDRWOUJzWk5rZEFkcWt6N1hHbTYxcHI3NzFNUmM0UHA5aE82bGdxZU1RUnhT?=
 =?utf-8?B?ME5ENUxXRkI5T3dtdFFMMVBYWnRhb3M3OFFNU2dVWjVQK1hadHo3OEIreVhv?=
 =?utf-8?B?ZGlMOWdnL005bGJsTkk1UWtZY3BpZnd3TVVEc3pkamljektkQTBlanlmSkVU?=
 =?utf-8?B?MFJub0VISzRXRGpOclhsU0NHZ252YnhqamNsd2tiK1FaR2lBZ3RuQVphVXFX?=
 =?utf-8?B?UzlzME4yYUx3a2xlZ2tWbnBZa09JRHdiczFyemYvWXRrYnMvSkp6cUZvdHkv?=
 =?utf-8?B?L0RaUjJKNC9OaTRqMFZ2eDZyd0NGRlFCRldOOTBDcHlZaGpRUGc4MDhHL1JD?=
 =?utf-8?Q?RXvZVqKwGWj6PztRPyQ0OEcDes61J2IE7ml9Wyf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb12c2bb-41d1-47ee-41a3-08d98ca955ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:21:56.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UynnvQ54VFxbkOlJmBFd3hDBiJnJ4MhGq0bMEHryTKsArzj3td9k6RUcJGOggxa+GO7zhfW/Rd536T88ZkzaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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

On 10/11/21 4:36 PM, Gong, Richard wrote:
> 
> On 10/11/2021 12:56 AM, Vijendar Mukunda wrote:
>> Add Yellow Carp platform ACP6x PCI driver init/deinit functions.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/yc/acp6x.h     |  12 ++++
>>   sound/soc/amd/yc/pci-acp6x.c | 109 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 121 insertions(+)
>>
>> diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
>> index 62a05db5e34c..76e9e860e9bb 100644
>> --- a/sound/soc/amd/yc/acp6x.h
>> +++ b/sound/soc/amd/yc/acp6x.h
>> @@ -10,6 +10,18 @@
>>   #define ACP_DEVICE_ID 0x15E2
>>   #define ACP6x_PHY_BASE_ADDRESS 0x1240000
>>   +#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK    0x00010001
>> +#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
>> +#define ACP_PGFSM_CNTL_POWER_OFF_MASK    0
>> +#define ACP_PGFSM_STATUS_MASK        3
>> +#define ACP_POWERED_ON            0
>> +#define ACP_POWER_ON_IN_PROGRESS    1
>> +#define ACP_POWERED_OFF            2
>> +#define ACP_POWER_OFF_IN_PROGRESS    3
>> +
>> +#define ACP_ERROR_MASK 0x20000000
>> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>> +
>>   static inline u32 acp6x_readl(void __iomem *base_addr)
>>   {
>>       return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
>> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
>> index 2965e8b00314..56fd7cdbc442 100644
>> --- a/sound/soc/amd/yc/pci-acp6x.c
>> +++ b/sound/soc/amd/yc/pci-acp6x.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/module.h>
>>   #include <linux/io.h>
>> +#include <linux/delay.h>
>>     #include "acp6x.h"
>>   @@ -14,6 +15,103 @@ struct acp6x_dev_data {
>>       void __iomem *acp6x_base;
>>   };
>>   +static int acp6x_power_on(void __iomem *acp_base)
>> +{
>> +    u32 val;
>> +    int timeout;
>> +
>> +    val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
>> +
>> +    if (val == 0)
> s/val == 0/!val
Will fix it and post the new version.
>> +        return val;
>> +
>> +    if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
>> +        acp6x_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base +
>> ACP_PGFSM_CONTROL);
>> +    timeout = 0;
>> +    while (++timeout < 500) {
>> +        val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
>> +        if (!val)
>> +            return 0;
>> +        udelay(1);
>> +    }
>> +    return -ETIMEDOUT;
>> +}
>> +
>> +static int acp6x_reset(void __iomem *acp_base)
>> +{
>> +    u32 val;
>> +    int timeout;
>> +
>> +    acp6x_writel(1, acp_base + ACP_SOFT_RESET);
>> +    timeout = 0;
>> +    while (++timeout < 500) {
>> +        val = acp6x_readl(acp_base + ACP_SOFT_RESET);
>> +        if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
>> +            break;
>> +        cpu_relax();
>> +    }
>> +    acp6x_writel(0, acp_base + ACP_SOFT_RESET);
>> +    timeout = 0;
>> +    while (++timeout < 500) {
>> +        val = acp6x_readl(acp_base + ACP_SOFT_RESET);
>> +        if (!val)
>> +            return 0;
>> +        cpu_relax();
>> +    }
>> +    return -ETIMEDOUT;
>> +}
>> +
>> +static void acp6x_enable_interrupts(void __iomem *acp_base)
>> +{
>> +    acp6x_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static void acp6x_disable_interrupts(void __iomem *acp_base)
>> +{
>> +    acp6x_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
>> +             ACP_EXTERNAL_INTR_STAT);
>> +    acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
>> +    acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static int acp6x_init(void __iomem *acp_base)
>> +{
>> +    int ret;
>> +
>> +    /* power on */
>> +    ret = acp6x_power_on(acp_base);
>> +    if (ret) {
>> +        pr_err("ACP power on failed\n");
>> +        return ret;
>> +    }
>> +    acp6x_writel(0x01, acp_base + ACP_CONTROL);
>> +    /* Reset */
>> +    ret = acp6x_reset(acp_base);
>> +    if (ret) {
>> +        pr_err("ACP reset failed\n");
>> +        return ret;
>> +    }
>> +    acp6x_writel(0x03, acp_base + ACP_CLKMUX_SEL);
>> +    acp6x_enable_interrupts(acp_base);
>> +    return 0;
>> +}
>> +
>> +static int acp6x_deinit(void __iomem *acp_base)
>> +{
>> +    int ret;
>> +
>> +    acp6x_disable_interrupts(acp_base);
>> +    /* Reset */
>> +    ret = acp6x_reset(acp_base);
>> +    if (ret) {
>> +        pr_err("ACP reset failed\n");
>> +        return ret;
>> +    }
>> +    acp6x_writel(0x00, acp_base + ACP_CLKMUX_SEL);
>> +    acp6x_writel(0x00, acp_base + ACP_CONTROL);
>> +    return 0;
>> +}
>> +
>>   static int snd_acp6x_probe(struct pci_dev *pci,
>>                  const struct pci_device_id *pci_id)
>>   {
>> @@ -52,6 +150,10 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>>       }
>>       pci_set_master(pci);
>>       pci_set_drvdata(pci, adata);
>> +    ret = acp6x_init(adata->acp6x_base);
>> +    if (ret)
>> +        goto release_regions;
>> +
>>       return 0;
>>   release_regions:
>>       pci_release_regions(pci);
>> @@ -63,6 +165,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>>     static void snd_acp6x_remove(struct pci_dev *pci)
>>   {
>> +    struct acp6x_dev_data *adata;
>> +    int ret;
>> +
>> +    adata = pci_get_drvdata(pci);
>> +    ret = acp6x_deinit(adata->acp6x_base);
>> +    if (ret)
>> +        dev_err(&pci->dev, "ACP de-init failed\n");
>>       pci_release_regions(pci);
>>       pci_disable_device(pci);
>>   }

