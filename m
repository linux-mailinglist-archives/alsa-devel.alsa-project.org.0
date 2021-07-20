Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768673D04C9
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 00:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB12F16C8;
	Wed, 21 Jul 2021 00:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB12F16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626821459;
	bh=jVb1krn7kYoK39N0L3fWI6bQ1L6FCVWMzl+M1dGayc0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6LcdnaIybq/X4Gfy/8vgutpiwS2zc2+RoT6PbdA5BHbLvy4R+f3gQU+c+/oaH1dN
	 OM3fuD7M/EtU9R6mIerqBZo71NuT1hwpgBM0qMnmrDPlRbMDv6+gfLyOITIaU7269T
	 PlWDtm5odYwFB+50Oj80peJz3UfnTToiOJrkg2fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B84F80423;
	Wed, 21 Jul 2021 00:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7CEF80169; Wed, 21 Jul 2021 00:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB1CCF80169
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 00:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1CCF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="bxV+PFsw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLRhumO6K5tF6wonSoFv2v/AMFl9PTIKDMfvv4qMhNcTpL4yfFKXR/jNMRPXlyJVCBXSrHt51oEs7aHVwoeRIeRKwaZ8NztDxULjzLKs/IPUqTDtRd2efaYNLir76NEKQweinLZ2ogEbMucR8wlQNTsiiAkijXLU+WcNfRyN29f0diWCf3EdVx2x+7/oiVKH+SGfmyI09NTBA53NMe2c+R4DneiUnRLFt94Q8HpQyNQDTZ/RildBGfaV32NSq2ltJmwJY559QctOCjQWAwLC21izSqWGR1cSNz8GWoXfxik8HzkQr3E4LfKXyg/knJjOrDJHKF4DNq8FWC0R8mC9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wokj85fNIzIFCI9UGqx23wWKoYl3K3yHyZbJcD56UlQ=;
 b=XuCSgEKsxJl81SKvkf8BCqARjgx8+PYfj7KFSwcEGNdEOCasYV2P8pqWwSAX9hyb1dWrHZQjArbHATKbkqzE5z83/s4LL5LqqRv3Wq8zkBADgdgWvCG+UiGZcK++v7zIyzzty4HjH5HvzbjyoW8BGx2r0gH4jPbzQ6myxi2mGPkp3B3bDOPJHwglBVHDUPllUQUsxSy0+XxZzVtMKmf5FkWj6N9Ct6cFjmv7OFKNBBVZDwD2g158ETeItEbJtGxu4T29yJrHDBidPzfPs/BjrVaLlgtY+oZjDXj/kIt3/evt97/Vep+OiEygV0LuOjXj9vQP4ggroe2cFNKlXWC+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wokj85fNIzIFCI9UGqx23wWKoYl3K3yHyZbJcD56UlQ=;
 b=bxV+PFswKE2JzL/JG3q07ew2V5GTIDVF99aFRhJ5Jl2p7zQyiJWnsv/0Cvj66rHbMYj25TRtNwGHHYzvk9hLul9rESFBF0EdUc6LxEeqJODMFPHiaWTnOyTfAiDsWjZ57uJE0S/+KoAsGpbWVqEgUYYNatKECYbNXy1FDWeknOo=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW2PR12MB2507.namprd12.prod.outlook.com
 (2603:10b6:907:c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 22:49:08 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.034; Tue, 20 Jul
 2021 22:49:08 +0000
Subject: Re: [PATCH v4 12/12] ASoC: amd: enable vangogh acp5x driver build
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
 <20210720163732.23003-13-Vijendar.Mukunda@amd.com>
 <76ac28ba-8965-f757-974e-1e70729207da@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <e04658e9-d3af-9416-f7bf-e91bd205dc34@amd.com>
Date: Wed, 21 Jul 2021 04:36:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <76ac28ba-8965-f757-974e-1e70729207da@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 22:49:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f56d023-fb04-460f-76c2-08d94bd0954c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB250758711A6990EEFABF5B8D97E29@MW2PR12MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAmbvuWXNDDk6T/T2galpWdtpMzQ03awE7penD8KVwI95oVeJKhYEMhkEZhKj6WU+lcDU9MJ5n2jvbY0rjjwInnL3B8EUZkxbwkOijrjheDe9TZw3bBxGZ+fXFrCutFYRIRn125ZFeSWHAU6dFNkTsFpkibUcge1iQUUApcfwAEw9p0WmYFpsi1FJU4OMFocp9jCnGl+xDeoFSAlcAuyA+4ft2m+1iMqxXqDPp4iHoDuL/jFCjR+ouC0TPW+Nvy71Ss7YbhV7a5j4tDrEpvfS8cAEv/CSk0PCFlv6lNundWv/PCULgciOWOe2IXpae/WTlnYy0iKFyA5yUDgrXNuGpjIt93Ob73h9erVmp+RISP84szyJZQ24qRlIsjl5Ms5vWfCN54RRW3XzEA7yAtDH70o4hmCHvrbtV18xgF27S7SsVy5VW6Q6AIvE0OQRujLgX1kLJqhc/5LpFJWwh/mCRGccX/ajuJ/f1iRTgMi83uMnL4jaR94qvoJSi1n2IqYH8Y8d84JNIUtVe1nXmZ5o9JV7xwvs3Ld1DwrZLFkfEkhYrEmjzC0sZLforKRHuYLzMrLPc9Bk6AJKrCGSXDD5hpNHz3wxQ8A6f4BmXzhdgUZhmACeMe0qQ0TrIhnH8B+gDEeYFtn7D6JlhCCw3KR42tcwioVJjq+X1QbkN60hX0u4EE0q2Q+SHIIFrPJW11pwMYPR50hI1hE8TLwRHqv3eqbbJvlHbir8UmU5rYZKzAXAzE9MQYLY/R5TdAC3X0OrSPs8xczLB5mYpLDF1RfTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(2616005)(956004)(6486002)(31696002)(316002)(16576012)(54906003)(66946007)(186003)(8936002)(8676002)(66556008)(53546011)(4326008)(478600001)(31686004)(6666004)(36756003)(66476007)(86362001)(38100700002)(5660300002)(26005)(2906002)(4744005)(42413003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWx1dmg2RGxvOWt0bVVCbFpZa2ZVZmlidlozbWlSZW1nMitmUjZ2VzJZT1dF?=
 =?utf-8?B?Z1pvWW0zMnZWR04rc1NHRE1oanVwTkJZdFlxbldDVVNobmk2SmpaYXZaMWNF?=
 =?utf-8?B?Q3l5QStKdmFiQVlhQU5zR3J0WlY1Vzl0QjFXTDIwUVNiN1YyOFl1U2U4Rm9p?=
 =?utf-8?B?MzRxdEo3cTFUY0lDRnk5N0NPTnZuM0l5NWpsaEQwcytjM1ZaSmhra3dKSXRN?=
 =?utf-8?B?VlFwbFk1NUQ3OWdidFR1NDlTMDBlOGN4bUlmYXB3UFIrU2tVR2ZzdmhzUWQ2?=
 =?utf-8?B?aDVGdGxaNFAvRll5Y21nd1VUVzVoSHlVeTJWSU9VNkEzdUVyeVdBeUs5ZFh2?=
 =?utf-8?B?emVqMU1UTXZhZStlRFErMnQvOWFMSVlGYS95WjhzdHlGTStZZlp4Ri9CbTB4?=
 =?utf-8?B?VmhpcUdzUG1sN01VRlNrdjN6aGFzK0pxdTNwVVp3dVNhWEVKandWNWpDUUpF?=
 =?utf-8?B?Ny9ISmNib1A3Wkp5dWlselJGcVlhcjQrM0FrMDB5VzZNVkFuVzlOcFNJWExF?=
 =?utf-8?B?ME9TZFk3aW9MWFdxMWx5L2JRTk9jNm53ZVNJMnM4SFhrRzR6Ny9KRGhrUklm?=
 =?utf-8?B?Nk5Db29ER1o1VzMrd09DSjBQcGFRMzZWUVlvSmQwQ3c2b1lXZCtYVGpOTEFF?=
 =?utf-8?B?OWM2SFdwY09iZ3lMRklhV3FoaEZDb2ZEcnJtcC9SYm5OTXp3OTIxMmJkalM1?=
 =?utf-8?B?MjI2SThUTTdCRU5aTnhmdEdvbzBlSnFwZ3NwVDZpNFEyU0xmZW1tMXlHY01h?=
 =?utf-8?B?b21JNSswQ1d3ajcyM1NsdmRyS0RieExHcml4NndXZ0FFNWt3WGpXNUNkcSt3?=
 =?utf-8?B?WldNOS9nMC9VK2VNVUJjLzUrVlFsUEZFSTAybXVxdFpEdjhNZTUyVU1lRDF4?=
 =?utf-8?B?V1d4cFcyQkMyd0FGSGZwMCs3dFlaY29CbGh5SzRoMnI0eWc0MktxQTFEZXl3?=
 =?utf-8?B?VjFrYlVUWlc0YzlTcHd5Smx4eGpLY295b0NoWmZlcWVDbkp1SStqY2xpQTJo?=
 =?utf-8?B?MGxKVEJ3cWpJTHprR0pLQzJRb0VWbGdIdjErbEdtcWJuMUxvNFp6Z0RBbkFI?=
 =?utf-8?B?cTNFUUdrNWZJRndkdnRvTEo3TjZ3RmtSYkdDTm5JNmMyRnNVYUs0dFhvdG9i?=
 =?utf-8?B?WEtCell2K005cWlxVlNXRU1TZVVvY1RJSXl6UVNPeG82VmppWFhuY1JtS3Yw?=
 =?utf-8?B?VXJtRzlmbDZZcjd5Z0czRkowYVE2UC8xMC9QeGNGV0hmV3lKNWdzNDVvVWdt?=
 =?utf-8?B?cHRsdXcrdFVuOFJOYnlMZGxMWlZUdTVXRm13TUk1OEEyQXEzYUVSOFlsRWtO?=
 =?utf-8?B?aFEzYUx4YlY1WERDQkM5MzY0aUVFQnV1d3oyNlBwTlJSYkhpTUJjODFUZHdZ?=
 =?utf-8?B?bW9QQko2TnRjOUZkaFc4aFVPVUlndmpXTHdqOFRzRUNaY3cvOTJZUkpRUVFj?=
 =?utf-8?B?YVgxS2hDUjY5YjFPM2lSWEQrcXJFVHlCQ2dVa1locERXMks4bHBGVFpRZDBW?=
 =?utf-8?B?b3JtbVpWYmczMzgvSGtFV1h5SUtjMGwrTk5BQll2eVVDbStJMHF3UkhKNTdW?=
 =?utf-8?B?NnBJcG1BQTJNLy82NXJPQVVaMFhLc0tiUUREK1VWZUxEUkZteE51cURGQTY4?=
 =?utf-8?B?UDhMcnJURUNrR3JPZEtLSEMxM3hvbkV3bUZQeWpWSTQwcENvdE5CY281Qjlq?=
 =?utf-8?B?bHZ5TnV5K0JXTlNLaHQwcW9nVDROV3dDZis2SVAwRVRFV3grZ3krN3VXUk0r?=
 =?utf-8?Q?pqf44VnMjLuM82XoRssAUpiBtjZHXTGWHcybU10?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f56d023-fb04-460f-76c2-08d94bd0954c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 22:49:08.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB10mQ12uWbclGE52zRXYYGicN/R9ZwZE6TMxzVn2WBigBxbxtpamkLq6vxfK1m7nIEvOVeMMH+W8xHTsDnVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2507
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

On 7/21/21 12:01 AM, Pierre-Louis Bossart wrote:
> 
>> +config SND_SOC_AMD_ACP5x
>> +	tristate "AMD Audio Coprocessor-v5.x I2S support"
>> +	depends on X86 && PCI
>> +	help
>> +	 This option enables ACP v5.x support on AMD platform
>> +
>> +	 By enabling this flag build will trigger for ACP PCI driver,
>> +	 ACP DMA drvier, CPU DAI driver.
> 
> typo: driver
>  
> 
Will fix it and post the new version.

