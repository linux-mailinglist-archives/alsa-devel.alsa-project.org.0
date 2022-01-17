Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC0490767
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 12:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC631698;
	Mon, 17 Jan 2022 12:51:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC631698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642420317;
	bh=aPRkNneXribx/Aftjl9J9iObUtpVoaYtKx49sOTXxLs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lv9s4tKK1WCaMghTkX0Q3d0eA4QwhTuy9UIspuFsEAYcDq6BjSypQYTwAoDoLG7Np
	 Fx/q2EbbR9RgNbIiAsYXsAIv7bbEDeqGs7CFzSb3597L+iLsAPc2XCmKOgfBcs6vnC
	 miWVwUQPTDD92jVqOaJkE36loT8O0G8bNkcpULsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02438F80254;
	Mon, 17 Jan 2022 12:50:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABF5F80100; Mon, 17 Jan 2022 12:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9153FF80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 12:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9153FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="w0MRGAku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqVZft3KQhdtFPzUJZG7eMJX2CY+wEh1eA97lc/Ln/EQs8XbP9YP1PRCp2ub1e9+fzj3ju7dyBYMbLL+oAp4afmkwL5v4JiPBk3b9hwcH4vm1OFNPirpoAD4M4WpxlHokaWVX3SjZXDODpdzY1YZkv3wMp2HAz4wnp0Jrsq/H0yTz+Xxt5pW6xX8Z70ZAjEuOL/Kjty6HkSOzJZ48iPjJEoboPLjQkGNoc6oe/w3hiPxJimOlgp0dKQBuZxa6ZshXVFWxtNC4FJRLAKio2bAvvylalMr6c+rkXeTKuE4xICFb9+1iUwtuPfnjYLr2RmTM3cYiR4vfUc7P4wt30orxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdxach2RwNKsAtJAun78H8b9MbGs7i+sSowxVn2/NL0=;
 b=oJDDFH6oAn9qPHFz5yG1hfvaCPuiuqoXOfiQZgED41EWzW20iRhEnCRSAhNMp/lu3ceEbGTe92QvCup6WR+j8Y/NopxybQ3LbTsSCfgIDsL6n/gqc14w+ZItPKQuN1dSgiU8Ts8Ic+zaF96oPLMFLzRAvIFeM53gaWA6utvaD/KajmrfcrbF8RcA42TMmDKWAYcoPGckHDB87cPcPUsl+qRXZerOh8PjDGPbxme0qae6zpiyGKl3+I7yLMP0K74eauuSJHMV3VWVNu57oyz/GqzXhnPwgT7gC6WnXOdRQsZZfgWeH7bHPIsmCYapgEt5iPPwk3Ng32aroaxQejLb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdxach2RwNKsAtJAun78H8b9MbGs7i+sSowxVn2/NL0=;
 b=w0MRGAku9z1+0a0UCOp2zwzUyZGQHm1roYFi8z1tH/vD/D3/vmzN6S0uehfSPXr3WZIZedBQLGulfyn+7n3qDZEriXkW3Oiosyw85nMjKkQ42cAHNAWYYn/Vb/WCbOKEVXjKS1QMYvPhEYsrBHlGAzUPS2yJceyRPUJr9XReKA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM5PR12MB1211.namprd12.prod.outlook.com (2603:10b6:3:79::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Mon, 17 Jan 2022 11:50:39 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::2437:1c64:765e:2fb6]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::2437:1c64:765e:2fb6%5]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 11:50:39 +0000
Message-ID: <85efbeec-6a63-9f34-d13a-2bdad327097f@amd.com>
Date: Mon, 17 Jan 2022 17:20:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Add ACP init()/deinit() callback
 for Renoir.
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
 <20220113163348.434108-5-AjitKumar.Pandey@amd.com>
 <e815d582-bd7d-6ec0-05ca-97d633ef9e13@linux.intel.com>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <e815d582-bd7d-6ec0-05ca-97d633ef9e13@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::17) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89a81b2a-a1a7-42a1-4ff1-08d9d9af9508
X-MS-TrafficTypeDiagnostic: DM5PR12MB1211:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1211FEFE69CDD1C42357957B82579@DM5PR12MB1211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3IyHDI8TmK5tGU8le0utoQH0fMkY027R0ymZO977BbQeh1avRe5vU8IamhAUhDInZ0cqMUnMfCkI+9uSZ24cI9cIeIVnezEoyomHgau7eeBCyrjPIjANxicCYSuuidH+1xYMhZs7qxMllzzHy2rCHQs1MROgbB2T51HHi5KNbdPxHsgoQNiQygH9AGnCgbTflp0PrwnQctQQLTdacd5IcYZrFKXFFKQXAzLmZP+o+5lYbc5z2MLfnzds4UNOp4vNbhk4zBEC2I6faL/7q3/XireL3ybXOIyfOnKnfLRvEyZoahMmJYujiBpuUBuX/J6CbFammo2hb2CPa5jO9tkhYvRreDUSQvgqaTy+t0cYS/sVWRdmbUwkH2si44DX7FeIrox0+/JtqQH3RWmOF/1XQ3NCdVy1902vQ4LPQS6+9fRteoucAhF0TlYscaMVVZ20d1NVWpbmzUi84y6EsucfC3+ZD23/R0ylVuWzsefREatbPY4lRBi+kRm6eOH0CozERJwVamxj8XLTi3jWbIDGDggUyoKruw/Ab35fZoeW9pwXjXOlzZuIvxvJPdd2baADKdexKn1RlfjiG9XVVsgqAWILNE6Nw+AH79YPAaJQLG+D/OhMkMWwZ0SOMJS5130dJ1PC1yi2MI/KxX10D+JVW6CLhjMoRL5BFrWSSZSJ10dmz+79XCSzJFAEmyytKGpJ/DcrKgOgbfHEJTXKYgYJJfuQTKnHcrufzj031aF+LY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(2616005)(6512007)(53546011)(86362001)(6506007)(5660300002)(186003)(26005)(4326008)(31696002)(36756003)(6486002)(38100700002)(2906002)(83380400001)(66946007)(54906003)(316002)(8676002)(6666004)(8936002)(31686004)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cy9YZXNoZFNPZlFXMFhMdlhvRXpXRmozKy91WjROdWxFeTYxU2JkU0NXZnAw?=
 =?utf-8?B?OGp6TC9YbjRoZC9uODJtUmlYb2JsdG4rNzNheUdsTmsybkUzQy9MWnVOL21p?=
 =?utf-8?B?Z0tZWTJlQXE3b0JFYmFhcWpwZTZnQjBUYmlCVHdhN2JxK3BXMExHZnpyeXZh?=
 =?utf-8?B?UnlQYk9HbzNjZ2JUdlN6NEpHL2JVTGlkMGFRaHRmZ0ZERW9rOTlZOEkyamlI?=
 =?utf-8?B?MFBNb1FHbld6RGFpbzU3UEd1bkxPWnV6bHF6VWxrZEk5OS9YTld2Vmw3dUFY?=
 =?utf-8?B?SDdwVkh6UGFRd3lKN0N1TG12VkNYUW1kMW8zc2s3VWJPaFArWmhScThha20x?=
 =?utf-8?B?N2ptYys5eWxnS3NrVzR4bE1yOUhPQlhGWm9lc0d6VmZ5L0I5cjdFc29LdHN3?=
 =?utf-8?B?M0xZNlVNVjJUM1IrUTVjbkZvUkZSRFZGOFI4TmF2alNZcW0rblh4Qks3Q09W?=
 =?utf-8?B?Z1B4NjFZdkNHMUNQZHAzOTVMbnBKOVhuN2ZjbjJtS3UyNkRBaVhiK2xWZTU1?=
 =?utf-8?B?c3hvcEd5cHhHNlo5TVZ1QmxMN3VOL3NlMGtEaXZBRHovN0N6ZmxMYlE2S0tu?=
 =?utf-8?B?KzhydWtHM1pQeHB0Y3h2MXlKZ0ZyZDNLMFZaRlh5TnZ5citzUWtmRjJidENk?=
 =?utf-8?B?cU5yamtlemR4ZnBXWVFYeXlJYkgxQndOR085TExUdS96VU5LK1pvd0NobVlP?=
 =?utf-8?B?OXlQMTRmbGVqUWhyWVVWdFF6NDJHZnNWOC9sMUJrMGpiTDV4Qk1lNFlUdm41?=
 =?utf-8?B?THBHUUFyeGFvMlpuSlJrQ3dtSWtSNDJSM3dZQUhVU2xPSkJpcDVNb29iNnNa?=
 =?utf-8?B?aWhrYTRLYk1BMjZnWGJKTWR1aVZLWGcxcnp6eW0vTTBqdDVxQjJiNEVEYmpw?=
 =?utf-8?B?SHNtNDgxNWdGR1FwNTkxZ0FUYytvaHJUaVZoTHQ3eXRtZXRiQ0N1VkJOMFFZ?=
 =?utf-8?B?YStac3VQaXVkOE4vTE10L1R4OXZCZmJCV290MW9MaXNENTlQUEIvQXhIMlNW?=
 =?utf-8?B?TmFGUG1XQlc1ZklkL0xWTmkvUFhuTFRDU1ZxUkxCZ1VDRmZwNXJVU1lWUDFj?=
 =?utf-8?B?RkRFRkd6aVo3TUpZVGFRWkV5YW1iRUpaRGI4Rmx5a0xUcjBIRk5EZk81bjBr?=
 =?utf-8?B?aXdleFYwTElCcTFGb213dzRJNS9jMkpyWjUxUmV1U0RmMXZEcE5rQzZxT2FW?=
 =?utf-8?B?UGdHcHp1dER6R0lEaHY1SWdQK2xKSVFaSmxYREpTZUYwazJaYkF5NVBkbGdU?=
 =?utf-8?B?clJqOGtHWXd2dkxvUy80bG9OSE0zWE5Xb1RXYTIxSktmc2JWRlFIeFJtUlJH?=
 =?utf-8?B?MnRlR2lhL1BacUp5bzhBc3A3VGIrVWdBYmRjcDVUejBTazZQZ3NsU08xeHJq?=
 =?utf-8?B?Q2RTVTdwcHVTenRBaWRhR3NHSW1QbGxvNnhrYkdpNTFDTlNzckEyd0g5akNa?=
 =?utf-8?B?Z0pGL3FDN1BBOEVtTTgxcUp6YmFHQzhaSGVFNnhkN1p5STB2dm5lL0NWYXk3?=
 =?utf-8?B?eml6YUVTVlJXRWFiTko0bzNkV1RmRGNaNlRZcE5sR2loS09CZklNaTFuNE5W?=
 =?utf-8?B?SHBOVWRLamZLQTA3dGFDZmlLaFNkZStmdTd6NlBucUNnSWoydnNUczVpTHY5?=
 =?utf-8?B?WWZ4YWU1Q1lmckVlTWI0OFpVR3NSUmdHWmZJVmxOOUpUczUrK1hkNFZMS1R1?=
 =?utf-8?B?YUdlL1N4emg5VkpicGI5cVppSU42bjVad2wrQ0N0cWZZMUM3VnB4eU1TR0pF?=
 =?utf-8?B?M3F1b05ncDEvdGt6WGdGSm52YmZkazJWVlRndmsvdVhFZlpkWUorSXBJSGJa?=
 =?utf-8?B?R216eTcvOFVzZHBqc0xUZTVpSGpKSktsVWxUZUNhemRtKzJtS0U3Q0ZaWVpF?=
 =?utf-8?B?Y25IU3RsZGJ5QWFDRkx3a041ZHk0eXNCdzh0d3lHQndjY2dTUHV2ZzNZTS9S?=
 =?utf-8?B?TTJWaVNqM1h6em9acnc4TFAzempKQVNFaFZNdkRzdlZOMzRtRXF4SlpxU0Jn?=
 =?utf-8?B?MU5ab2JseDQzaUx6TTZVOFpWMityR0dGTkNPWS94eTdsNFc1clBEL2pyanhY?=
 =?utf-8?B?VlZyN01aQnQ5cFJ1WGRSRnZRNUlSeWRUTGR6cnNlcFZLaVZkUHN3cThyeTlo?=
 =?utf-8?B?c05NWHpZV0RFTUxlUmIyd0NXcnY0MzEzaTBub1hBcDJXanUyQTZheS9pcW9B?=
 =?utf-8?Q?W5IXfptQJbvEreNU6JjNVYw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a81b2a-a1a7-42a1-4ff1-08d9d9af9508
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:50:39.5808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6qYPui/lf0dQqIpJT610RfDfPB9VlcHFt8daZxzj+hr03DkOwiyPRN3hwvbmymzWcVVlWDhxPOmYJlBzMFRnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1211
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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



On 1/14/2022 2:31 PM, Amadeusz Sławiński wrote:
> [CAUTION: External Email]
> 
> On 1/13/2022 5:33 PM, Ajit Kumar Pandey wrote:
>> ACP hardware has PGFSM control registers that can be configured to
>> power On/Off the ACP IP block. Add acp init()/de_init() callbacks
>> in renoir platform driver probe()/remove() respectively to power
>> on and off ACP IP block on ACP3X device.
>>
>> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>> ---
>>   sound/soc/amd/acp/acp-renoir.c       | 170 +++++++++++++++++++++++++++
>>   sound/soc/amd/acp/chip_offset_byte.h |   6 +
>>   2 files changed, 176 insertions(+)
>>
>> diff --git a/sound/soc/amd/acp/acp-renoir.c 
>> b/sound/soc/amd/acp/acp-renoir.c
>> index 770a57a0677b..a29f910f25d1 100644
>> --- a/sound/soc/amd/acp/acp-renoir.c
>> +++ b/sound/soc/amd/acp/acp-renoir.c
>> @@ -25,6 +25,19 @@
>>
>>   #define DRV_NAME "acp_asoc_renoir"
>>
>> +#define ACP_SOFT_RST_DONE_MASK       0x00010001
>> +
>> +#define ACP_PWR_ON_MASK              0x01
>> +#define ACP_PWR_OFF_MASK     0x00
>> +#define ACP_PGFSM_STAT_MASK  0x03
>> +#define ACP_POWERED_ON               0x00
>> +#define ACP_PWR_ON_IN_PROGRESS       0x01
>> +#define ACP_POWERED_OFF              0x02
>> +
>> +
>> +#define ACP_ERROR_MASK 0x20000000
>> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>> +
>>   static struct snd_soc_acpi_codecs amp_rt1019 = {
>>       .num_codecs = 1,
>>       .codecs = {"10EC1019"}
>> @@ -112,11 +125,154 @@ static struct snd_soc_dai_driver 
>> acp_renoir_dai[] = {
>>   },
>>   };
>>
>> +static int acp3x_power_on(void __iomem *base)
>> +{
>> +     u32 val;
>> +     int timeout = 0;
>> +
>> +     val = readl(base + ACP_PGFSM_STATUS);
>> +
>> +     if (val == ACP_POWERED_ON)
>> +             return 0;
>> +
>> +     if ((val & ACP_PGFSM_STAT_MASK) != ACP_PWR_ON_IN_PROGRESS)
>> +             writel(ACP_PWR_ON_MASK, base + ACP_PGFSM_CONTROL);
>> +
>> +     while (++timeout < 500) {
>> +             val = readl(base + ACP_PGFSM_STATUS);
>> +             if (!val)
>> +                     return 0;
>> +             udelay(1);
>> +     }
> 
> Can this while loop perhaps be replaced with readl_poll_timeout?
> Similarly for cases below?
> 
>> +
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static int acp3x_power_off(void __iomem *base)
>> +{
>> +     u32 val;
>> +     int timeout = 0;
>> +
>> +     writel(ACP_PWR_OFF_MASK, base + ACP_PGFSM_CONTROL);
>> +
>> +     while (++timeout < 500) {
>> +             val = readl(base + ACP_PGFSM_STATUS);
>> +             if ((val & ACP_PGFSM_STAT_MASK) == ACP_POWERED_OFF)
>> +                     return 0;
>> +             udelay(1);
>> +     }
>> +
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static int acp3x_reset(void __iomem *base)
>> +{
>> +     u32 val;
>> +     int timeout = 0;
>> +
>> +     writel(1, base + ACP_SOFT_RESET);
>> +
>> +     while (++timeout < 500) {
>> +             val = readl(base + ACP_SOFT_RESET);
>> +             if (val & ACP_SOFT_RST_DONE_MASK)
>> +                     break;
>> +             cpu_relax();
>> +     }
>> +
>> +     writel(0, base + ACP_SOFT_RESET);
>> +
>> +     timeout = 0;
>> +     while (++timeout < 500) {
>> +             val = readl(base + ACP_SOFT_RESET);
>> +             if (!val)
>> +                     return 0;
>> +             cpu_relax();
>> +     }
>> +
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static void acp3x_enable_interrupts(void __iomem *base)
>> +{
>> +     u32 ext_intr_ctrl;
>> +
>> +     writel(0x01, base + ACP_EXTERNAL_INTR_ENB);
>> +     ext_intr_ctrl = readl(base + ACP_EXTERNAL_INTR_CNTL);
>> +     ext_intr_ctrl |= ACP_ERROR_MASK;
>> +     writel(ext_intr_ctrl, base + ACP_EXTERNAL_INTR_CNTL);
>> +}
>> +
>> +static void acp3x_disable_interrupts(void __iomem *base)
>> +{
>> +     writel(ACP_EXT_INTR_STAT_CLEAR_MASK, base + 
>> ACP_EXTERNAL_INTR_STAT);
>> +     writel(0x00, base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static int rn_acp_init(void __iomem *base)
>> +{
>> +     int ret;
>> +
>> +     /* power on */
>> +     ret = acp3x_power_on(base);
>> +     if (ret)
>> +             return ret;
>> +
>> +     writel(0x01, base + ACP_CONTROL);
>> +
>> +     /* Reset */
>> +     ret = acp3x_reset(base);
>> +     if (ret)
>> +             return ret;
>> +
>> +     acp3x_enable_interrupts(base);
>> +
>> +     return 0;
>> +}
>> +
>> +static int rn_acp_deinit(void __iomem *base)
>> +{
>> +     int ret = 0;
>> +
>> +     acp3x_disable_interrupts(base);
>> +
>> +     /* Reset */
>> +     ret = acp3x_reset(base);
>> +     if (ret)
>> +             return ret;
>> +
>> +     writel(0x00, base + ACP_CONTROL);
>> +
>> +     /* power off */
>> +     ret = acp3x_power_off(base);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>>   static int renoir_audio_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> +     struct acp_chip_info *chip;
>>       struct acp_dev_data *adata;
>>       struct resource *res;
>> +     int ret;
>> +
>> +     chip = dev_get_platdata(&pdev->dev);
>> +     if (!chip || !chip->base) {
>> +             dev_err(&pdev->dev, "ACP chip data is NULL\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     if (chip->acp_rev != ACP3X_DEV) {
>> +             dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", 
>> chip->acp_rev);
>> +             return -ENODEV;
>> +     }
>> +
>> +     ret = rn_acp_init(chip->base);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "ACP Init failed\n");
>> +             return -EINVAL;
>> +     }
>>
>>       adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
>>       if (!adata)
>> @@ -155,6 +311,20 @@ static int renoir_audio_probe(struct 
>> platform_device *pdev)
>>   static int renoir_audio_remove(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> +     struct acp_chip_info *chip;
>> +     int ret;
>> +
>> +     chip = dev_get_platdata(&pdev->dev);
>> +     if (!chip || !chip->base) {
>> +             dev_err(&pdev->dev, "ACP chip data is NULL\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     ret = rn_acp_deinit(chip->base);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "ACP de-init Failed\n");
>> +             return -EINVAL;
>> +     }
>>
>>       acp_platform_unregister(dev);
>>       return 0;
>> diff --git a/sound/soc/amd/acp/chip_offset_byte.h 
>> b/sound/soc/amd/acp/chip_offset_byte.h
>> index e38589a142e9..88f6fa597cd6 100644
>> --- a/sound/soc/amd/acp/chip_offset_byte.h
>> +++ b/sound/soc/amd/acp/chip_offset_byte.h
>> @@ -14,6 +14,12 @@
>>   #define ACPAXI2AXI_ATU_CTRL                           0xC40
>>   #define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0xC20
>>   #define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0xC24
>> +
>> +#define ACP_PGFSM_CONTROL                    0x141C
>> +#define ACP_PGFSM_STATUS                        0x1420
>> +#define ACP_SOFT_RESET                          0x1000
>> +#define ACP_CONTROL                             0x1004
>> +
>>   #define ACP_EXTERNAL_INTR_ENB                         0x1800
>>   #define ACP_EXTERNAL_INTR_CNTL                        0x1804
>>   #define ACP_EXTERNAL_INTR_STAT                        0x1808
> 
ok will improvise this in next patch chain
