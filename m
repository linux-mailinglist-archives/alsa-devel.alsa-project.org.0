Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DA355AFB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 20:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC421654;
	Tue,  6 Apr 2021 20:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC421654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617732321;
	bh=sS41In/13IqgGywWmV6H0U0jTLkuxRaraaFUYhqHnPY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwGG45x/U5UqNOF73Bz5+2LLei3HPYOt/aQ8kbRPBv9PTpestFre18P+UGgdIrL4L
	 U/7LxBuQkqYmdImjWLtTDfGjTlga6GC4oNA8Op9AcFTlpVJ95h8pBkFtpf+OgX83uy
	 d24BP06LD33eDJcUlPashPcq5uhdxjK7pZdiBASY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C304F80246;
	Tue,  6 Apr 2021 20:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B3BFF8020B; Tue,  6 Apr 2021 20:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2052.outbound.protection.outlook.com [40.107.95.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ACC7F80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 20:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACC7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=amd.com header.i=@amd.com header.b="bDjhc3+N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Mzkn9+s4O8mKjnqrq38VSKliWkLulrjAG7rDuYFf/CZDJbfQEcw8rUSipd1FdGZ0rBXDnDFHOyu6oHVQxiviw4EEs0hd6e4h6fsLbRVK5gzvw2pzmy0hiTw478v8S8YVPLHR6zfyfOMgG4TVx3QtrFFuHfkZy0/KAzi4VAjlOoPf9eDIhecgFij7ztXMhRfl1EBZ39XGT78peEzzyx4sUhXIKFq1l/3KnlhGxo7WkDD0DGT417wFfvXpOg/32PzDJV8fXpIQ/O29E2Uok1iWgthjJ57kNNrla9mxJiqcI6jCBCtVToBGYjiN3BukrgjVwqgxdy5e8oSFAkhtxgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZQ2OKDP7bOfN9eWaDecN/a8v1g6eWJBLs0WNUFGfcw=;
 b=icinkl+9T+ianidRHI2CjVnK3cp/P1kYHCDgbs3FiWaivHud5ToCXF6IxX54/qoGKvKBjlEAq2bLXTM4c4Wv6AEjd1IWcHFGlBn2mZfZ8jX4Z4taz4Z+ObOAZn1o3UD6L4qyU8xF5GvHfFpuO738Q4zEO3mtgEMnuCQcGMSbaA0zXao9xTf7dewfMH/e6B/jJ+qZx3lx5FRS3MwduUY9MLewFGwd68/qGsTvpL7suPdd9VvCTFEd+uQpf9CnKXcGNC1/sz5AuolzO9DEmZ3iMKW43JvfKXUVf9HHlf6Az+u9IB4oYX83NyiSwYB7lzOy7E4zDjBa6fkoOjLzA/3Vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZQ2OKDP7bOfN9eWaDecN/a8v1g6eWJBLs0WNUFGfcw=;
 b=bDjhc3+N0XdKuJY3Vc1Te9yZVskKqcfvlQ8ATLxEcPsU7k8m8ZZdTkYq9mCSpUDic5J23bzKWsh0OXqQt3Kro7dr89BX43k3Z8C8NBUBXSkgcL5ETz5hPqXQtsVdRDTDnHQWM1TFI8ih8DCp+JaYyZtpxjlFDtVab0x5fTikndA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1470.namprd12.prod.outlook.com
 (2603:10b6:301:f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 18:03:31 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 18:03:30 +0000
Subject: Re: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
 <82817878-a30d-2b0c-07f8-48bcca3ebc80@linux.intel.com>
 <a55c7a75-22ab-31fc-81b3-ed8fa24027f4@amd.com>
 <20210330153534.GF4976@sirena.org.uk>
 <cd0d87e0-caa5-b671-9c91-1c5f35c2f017@linux.intel.com>
 <972d38d8-39c8-66d7-292d-37c1f0e027bd@amd.com>
 <b330ca5e-1162-29c9-d846-fbfbd9db638f@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <be0f0400-d76f-5d33-2819-271d1a83cf80@amd.com>
Date: Tue, 6 Apr 2021 23:50:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b330ca5e-1162-29c9-d846-fbfbd9db638f@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::23) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 BM1PR01CA0129.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 18:03:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa77fed-d8b8-48b6-4aff-08d8f92648e1
X-MS-TrafficTypeDiagnostic: MWHPR12MB1470:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1470C0B12DF5CD24F8985FD397769@MWHPR12MB1470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpHZZs6bKs57vpGIyLuC6vi9KXu8zmvZllI6OGwzC08cYkzV9p8dzkhTP4N37KZ07+b1k/UU/lAajWvyE8ls+kmPa+cehMW8TT8AB0zbwO0/Q3VMz/Omfy14m8nC9mHn8Kgz+pWF+kYxvKeZFjfbpWNP3C37pd7juwBoh3QoSrMxpSlyIfAjdOpbFE6r7qd5hzvh5iKQmBYnY+x7dcQazQupKqRJ39p67eOKKJQMhptZqbVtHhiT7ZkrpRDDkSXFDGzuUgjAGDgBm3nUUijyNpw++WUdxeydk6NVmbTYbERc0GjZHWKmIK+pthF0Z+lXHLM9PdRKD1PL0JZY52BKE9SAcLT1CsGpeD0C6yFDv21CqAoxP0915lBykmRWcow1416dMbrK4vSnlj/UnfDG3REPVVR6zn1KkdFE4B+TW6XZgRFylkC3s5LzxUozsBp88V/qVU9Azvr4ialoiG0f1QASbB/1zqae8TBDO3UD1ByHieSFTFuRmihnap87HxBMJUSSTFaHk/eqea2K8RgUpHkS/5RcjgLDNDVgSKVLrQquRAs0c1AuZfnljhPF7FgURIJjQDQZ7zXvHIxrDIMWB4ouYQugAI5z+3WDKeXvjDtXYF7J8AKVM43fpiIUjB/MtOjZdK6HQnyWI038kOslYpLdLoWbKrLT4odlkpCe4FpmrcqYHgK25Xh+rLtsj3/U1Ra3hleBvVSstZHol5TlHDgfIF/6fFtfnDjRSnnU4chUr7Zw+LS+ZhqNat6lOE1K/NJFhFDjJTLo0OzBw0J45OCodjvwArG6FNM4FetH2/CxjkqgYH4tbo6ppgHm/GnQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(2616005)(110136005)(26005)(38100700001)(54906003)(316002)(6666004)(38350700001)(31696002)(36756003)(8936002)(66556008)(66476007)(66946007)(6486002)(2906002)(956004)(31686004)(52116002)(4326008)(186003)(16526019)(8676002)(86362001)(478600001)(7416002)(16576012)(5660300002)(53546011)(42413003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?DitzkQxqeIiGMa7ltXT55HIUXYt2gr6rEIAp/71SqJR36yT3EXEEYH4c?=
 =?Windows-1252?Q?RAEBlfm7HTICVrZS1fexETGwGi+QHlTBbMUZdGtzLcOaSQwNJP5LO2bB?=
 =?Windows-1252?Q?1udPMEh80xgz8FSkzZCd1Kc/db0QyyLhSPjLfGKKOAGuKodNHFEc0tQG?=
 =?Windows-1252?Q?lnHOV/x1tUWKH/bbeCpl6QC9oQqMRxCxMkTkH+cqnOGjFa9ywMDuArz0?=
 =?Windows-1252?Q?V4O2YIemmvOxtSkruJSZCt11nxM4BW+Yv08rMJhFG6lz7Z1UkK/Z8hsy?=
 =?Windows-1252?Q?GQz7Z42X1Yf+MUB1wrVLVf5s5pVNdlDNTOJql7DwhWoUorJKTcenZT5a?=
 =?Windows-1252?Q?6/WZjmAhnKhJRWmEHv8a5lXwJYRz4KFNIL4UBT81XJ1Tx2mxWZ4AmTdy?=
 =?Windows-1252?Q?54vJQ7D84uozVYh0yXIbeDLkcPDOLn1PBdJhbltZZScwXP54BwpsmD/m?=
 =?Windows-1252?Q?pfW6eXAvCtvFeUp4tFJ1RF90oiUld2g2FwFrpGXnEPjXuDxk7yL6CpRE?=
 =?Windows-1252?Q?RQRAYYJVxSDm3zBm8ydh7QW63kj3+CWRkhfjoSG0J0lXB64eUEaXdYA3?=
 =?Windows-1252?Q?CZQOcVcT2Ie6ngfouUpjUcnYYaWN7lbTybqQowngtGG2vrTLy8zL+KHG?=
 =?Windows-1252?Q?1LOTrCxInfClUpz3PMfT3Y90On6VkYT1aYLl0wfyb93g1ZEw+6OhDy2u?=
 =?Windows-1252?Q?cZXmQqvc7RnSTUlW6rsMp7CbaYEwcR6HUbMQw9MdZswJfPktEYCinNwj?=
 =?Windows-1252?Q?lWhOSadAO6BKFLyvPz5ci4dNo4Aunm4goWm7d/QrpQHqC8ZKrXOaR+6E?=
 =?Windows-1252?Q?Qaxbm66ufjgcTpKxMLcVoy+QPIrGYPg7XLo/jcs0HUUtnb00j7BTNtdg?=
 =?Windows-1252?Q?sbt+LLJkoDRxVmcXxfV6cDDE0zAi2cVOgQBRKjrdL02dfgQgV4Lqlgzd?=
 =?Windows-1252?Q?xNXza4TuCrnoxgdqL0TafATBZMHRh7PgKpHNNTjxwU6aKCG5VxNurit+?=
 =?Windows-1252?Q?xOPqN0m7LRFJDs+WdntDEE0OzSQKsRgj4QBcLqsSHu23QCmjB++GJPP/?=
 =?Windows-1252?Q?lC2CTlQjyaTJ9+8a+XBv43XMqTEuc64b4YjaIlNiuBswl7nSpSWtPjCQ?=
 =?Windows-1252?Q?DN+WnEvleXwuPHHfacPQvLb8xI9xpQTYX0CPcm41fsuEg6Dw9xpkb3ut?=
 =?Windows-1252?Q?mvMXDDAqxHArIkC79mtBDwRrPnmRYGpWr9AnzY3w75n0RvqVTdD6AzS2?=
 =?Windows-1252?Q?yKFSFqRjaj2oWSKkjDUNCRA/5/h4hewL445qC8KNZHbjV7qR4qlgeY7E?=
 =?Windows-1252?Q?Q1+geVQ8++ZVuxj7P8YJNDtk10Sbex2GMLWQh44rWksknudLXx+id+Bh?=
 =?Windows-1252?Q?X6T0nhJ6J9+97xlC9Bor5Kqz/3Ec3FQJ6xa9DSJSPMAwgLaTayPyIfGA?=
 =?Windows-1252?Q?ee3aC/MLo8Nj5frPCIEUXA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa77fed-d8b8-48b6-4aff-08d8f92648e1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 18:03:30.6000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+YNTtwlGY1vl++FMCHwplL1E8SkLXmhNv+B7krKTypXq4vJauzMd/IAKDjCRxXfWDnKc+bgFqWUt+140JWCkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1470
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, shumingf@realtek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Alexander.Deucher@amd.com,
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



On 4/5/21 9:54 PM, Pierre-Louis Bossart wrote:
> 
> 
>>>>>>>    static const struct acpi_device_id acp3x_audio_acpi_match[] = {
>>>>>>>        { "AMDI5682", (unsigned long)&acp3x_5682},
>>>>>>>        { "AMDI1015", (unsigned long)&acp3x_1015},
>>>>>>> +    { "AMDP1015", (unsigned long)&acp3x_1015p},
>>>>
>>>>>> This isn't a valid ACPI ID. AMDP does not exist in
>>>>
>>>> ...
>>>>
>>>>>> There was a similar issue with Intel platforms using this part, we 
>>>>>> had
>>>>>> to use a different HID.
>>>>
>>>>> Is it okay if i use "AMDI1016" for ALC1015P?
>>>>
>>>> That's valid, though obviously you might regret that later on if 
>>>> someone
>>>> releases a CODEC with a 1016 name (equally well ACPI being what it is
>>>> there's no good options for naming).
>>>
>>> wish granted, the 1016 already exists :-)
>>> you may want to align with what we did for Intel and use the same 
>>> HID: RTL1015
>>
>> As per RTK team inputs, "RTL1015" ACPI HID is in use for RT1015p codec 
>> driver.
>> RTK team suggested us to use "RTL1015A" as ACPI HID.
>> Let us know, if we can use "RTL1015A" as an ACPI HID?
> 
> Not if you want to be compliant. The part ID remains pegged to 4 hex 
> digits, no matter what the vendor ID representation is.
> 
> The only solution I can suggest is using the PCI ID 0x1002, ie.
> 
> AMDI1015 -> AMD platform with RT1015
> 10021015 -> AMD platform with RT1015p
> 
> Note that it's not only ACPI's fault, other standards also only allow 
> for 16 bits for part IDs, we'd have the same issue with SoundWire.

We will modify ACPI ID as "10021015" and upload the patch as v2 version.


