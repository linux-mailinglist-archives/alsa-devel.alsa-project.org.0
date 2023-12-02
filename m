Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3024A801AFE
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Dec 2023 07:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CFE584B;
	Sat,  2 Dec 2023 07:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CFE584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701498174;
	bh=Mc8MHQ3zp545bR/mweRwLq9gSDJF0zNktC+HmeGykm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PES5mMuHTAwkwVIqi0AzO8UlVCgzfgTdtHIl/d2d4NB1g+GOw8tjz0dc4nwQKn9er
	 dE05zlW8u/LkC8jC1tjWthvwu2v72/sMvbrNsJ9XZJzCJ2Uo34odvsIkqJ+MqE587s
	 b5DVH/9kN7gmiECKNiAnmvnOiXfsFpCJxqDHwveA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64BEF8057F; Sat,  2 Dec 2023 07:22:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08200F80578;
	Sat,  2 Dec 2023 07:22:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBDB2F8016E; Sat,  2 Dec 2023 07:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23AFCF800AC
	for <alsa-devel@alsa-project.org>; Sat,  2 Dec 2023 07:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AFCF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CpOLlZC/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfnHSnG9bD+e1mSyFhrNSW0zam207b92VQjOQKJQ0RJw/OstiPm1dz0Lmj9GaVzbWux1heI/YX7qtgnXJhdKXgkQ0Kckj9GBrbQ7OcSYEm7i6/kG7zT5RHsIivFSJ1zxRBWtMaTcg8hwCsq1ks6Y2i5cdqlq0djVBWtyoPCbYY9YZgVtBftbfO+DeTH91jndAze5xlSzkhhOYudCgY1IF34nEaiYws6VsGSTqcyfczyegqhe2qgxeKTw9R1JgR21jnns/owIHKlhJ3yxqgeUJOmzeZidPL2T7EbtLsMkfmZOoVpUwYzYPhraPB18zI2Z1SDiC8j7dgyts4w20ftA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/s8u3pMGHSfcEdRbFUjtO+ZvEeDkoFweVLcB5A6m5M=;
 b=czHTJs4K35oKqE5UKzjXXhxTTBmbVj1mlVP/IRZfX54/opmSR3C5n5GyGIgFRrAgSckP/TTRzdQTwj1qqgodItVnx8wL22udfzeLFeHi/IkJi2cgfMzJfBCN5SA6hdD52ljoqjQ8x8k2f2MT19sKtcodRCjKAz9qKbxRN+g3BN8Zy7X/uSdPCr0MxQ4UiociVjExnSoe2zbjGnoCjHisEKmFvH2TztSbKA27fQg/6ib13KlU2o5iabol5rn7u+4LCrJby+vNaqJO1W0liNR5am1+JpuAZo9XTkiC5g8QGSSCkDF1mBXaQN8/LphzmUqnwkLvzDT+pGpMqGru5a+yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/s8u3pMGHSfcEdRbFUjtO+ZvEeDkoFweVLcB5A6m5M=;
 b=CpOLlZC/aF+xxf1zk7UUW8xIzsiXxlhoQJN75iwu+T/REdrwAxsNb3Q1LfauNdeL8K9gV8XJhmDVORc71tqU+5YPYohrrL9EpKvU5c/2HkQt4+m5h+avsN0/vtDmgXaVN+INkrYc2kC6/fwRljJne/k99ApMgMB7YETIvO/7JUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Sat, 2 Dec
 2023 06:17:04 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6%4]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 06:17:04 +0000
Message-ID: <a7afa229-e0af-405e-9241-36633ee4622b@amd.com>
Date: Sat, 2 Dec 2023 11:46:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: drop bus freq calculation and set
 'max_clk_freq'
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
References: <20231129130449.9892-1-vkoul@kernel.org>
 <30e6b8d3-6369-4c23-a4fa-f70cc01acd7e@amd.com> <ZWrKwU90SLFtMMRO@matsya>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZWrKwU90SLFtMMRO@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::31) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: ba72e8a4-617c-4b89-b9e7-08dbf2fe4d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MdFkdFIVVI/T6eC+okiWjn2twY2LM+OyVSDl1/t9bPb/3CQe+icgu/h6bEAZOJPsyd9OiKW7DnehFFbZEmh5L0tm8aRRVAiyCbqh7yVic5CyaeZYFtlHL4LxDMbAZXEkx14FbmHcbjm0oH4zK6DgxoaTgcDWxox5Ef2IaNWimxxyyEyhkAdWqJpkYUnqEgPNjVvs4w5fOiUIIvpa0cRtaTwpzhrcFuEDDETMdSPjXDvksGohMimRwOMgtkYJ6rBMX+1wVYHVIkq5/obr5Q6G0pEO5ubpFk4SqPlRwh6Ii//SkD2sBRygRLH79zM7e0S2i6EknnfOKYIWuk8/Xj68UgIchFsHOtKkAcfqhlJHQyVqaz/pVO0NXVcQZz05BEpvSIaDEEuLaTyJMMeBP/S2dowfa4itOrHlHN7/rZyrDfcnPmgW3k0uLdzI1JrrKCVOXbLRPEWzxPENM6o/9YsEFk6v4hsxyM7Q6gIDrSXmTdgQVGCXxEpBXjOfF8hFGCKFoLYyCeQyWYrFSi7C2crcEKV88ydk0qSrr482lRYizVWe6GX2U4MY71Ihs2JzH6N8BFCQ5uCQSmO6gix8s+Cznh7qgs7rbUdoYLlHGXefxfZRexmx7hPGUhgU8k9RGhcmmcTEIX7y/GVSw5AktiBEBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6512007)(6666004)(2616005)(6506007)(53546011)(66556008)(316002)(66946007)(66476007)(6916009)(54906003)(31686004)(83380400001)(26005)(8676002)(4326008)(38100700002)(6486002)(478600001)(8936002)(4744005)(2906002)(41300700001)(5660300002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sk5Bd3VSaXpLa1VoZUx0Rm5yTGZsVHhyQUZCcnJMY3Fndm1zajV1ZW5rUjRU?=
 =?utf-8?B?b2pRR0ZMdDc0eVkwSzdaSHhlWWxzNjBacjFqWExnUTJMdjhKQS9TbGRKcVhI?=
 =?utf-8?B?M1V3ZysvNW15bHkycDhsdWNIa0RQaU0zbTBEOSt3bkdkOGJoMDF4MTlqM2hr?=
 =?utf-8?B?aC9KK05BeFpaQWZUSWFrQVJxM1FZQ2Q0V2FnanF6OVpFbzRFb0JRS0F0Z1gv?=
 =?utf-8?B?L2dhaE5zbFNnL0R6WjRWUlpZN0ttMGJRL0tOMkkyYTg3ampWL21EUThzLzM2?=
 =?utf-8?B?c2lYbTBmaUptL0NTSEhGWTE1UFJPejdPZ1doOTJrYTJOc3Nva2FxcDNjbkly?=
 =?utf-8?B?ekM0VTM2eGdkbmNYQ2huVjB2Yk4zNjF3V0FKeitXTlNQaGhpeVU5VnlSczFy?=
 =?utf-8?B?S3lJOFRDekg4MDA0SU53djhnN1dvWldsTlJhNUprMElKekFCbThzdXpHQVFN?=
 =?utf-8?B?VDBIejlKWlFOYkdHWTZuRGNzUXNzcTB5blpDZ1VwdWVJWnppMURsdkNWNjNs?=
 =?utf-8?B?OWJIMHorLzI4d1Y0WGt4YXRtUnJCZTdoZGI5cjZ2TWhRc0FteEUzT3g4UUUw?=
 =?utf-8?B?c3YrU0dQN0RJOENsZndLV0NVY2ZIL1VwV3VJUHFGS1lBYk96RVkwbWpkNG9w?=
 =?utf-8?B?TTNhM2w2T1NSYUZVRXplQktDZS9pZDhmMzVzbUgzVHhvVTZ6U0Y3Mk9CLzgw?=
 =?utf-8?B?MG14NGdZUTFoRWs2RnZpNks0Z0kwTFVoWHQ5ZDVmTHlSWWd1VVkrSWpyaGE4?=
 =?utf-8?B?SzFpclJQdkRyWFFqbkFEcHVKSW1UNTlVczB2SHJRdHdnZ2piUC9VRXNoNDhW?=
 =?utf-8?B?djM3YTdtUEZHNm9VTEUySTJ6MUJFZks1cUo1dm9LV2NEVUQvakM2R3BTQTB6?=
 =?utf-8?B?NE5QUDR5Q0dJZHpJZ2pmR2ZWdk5vZmRJTTVjbVU3dE9KMTR1Y2NCbWFjVlQ1?=
 =?utf-8?B?ZVNFd2VoNVNUMEVnTlU2N01PWXhlamxzWW9QejhJL29BVmwrdE9ST2ZpbFVS?=
 =?utf-8?B?K1lYNXRzcUZKaCtNRVVUcFpkL1MrNk1qZGc1NXF3cnJwbVU4TWNDcGd2K0hq?=
 =?utf-8?B?b3E3ZDJhVnJWbytkVnZ3UUFiWHdsbncxZDN1MnRVbnFwZVhNMXRKM3VOeG9M?=
 =?utf-8?B?UTc1b3VxZUkwZGFaaHFtUXdEQ2lxdmlzWFMyRENjelNGUG1UQ0thdGNmbThz?=
 =?utf-8?B?dndCdjREVTBYTkFKYzNJeDRJRDBOQzhEcTJXQjhmMzE5VCtqaEtUcVhoVHJO?=
 =?utf-8?B?NnNqSm9vTnphWkx2Vi9KOFRIZVBqVEM1eFRQeHFZUjZORHBMTEExYzVXZUhX?=
 =?utf-8?B?azBEN1hzNVB3RndtQmNSblcrQktFa1JreGdXL05VLzZCNHZneFNXRTV2Umh5?=
 =?utf-8?B?cmczMzRPdm1MdU13aEwwaFlWUXJuMDl1ZW0xWlljc1o2bTIvblFjcGZJNmEx?=
 =?utf-8?B?NG1WUjdabXdlT2FlN1RJY3NiUVlaSW1UcmlSQnJROWxuRXZ2Z1dnaHhsM1Fr?=
 =?utf-8?B?N3AyTGlKSWpRd21odkxDVXUzc005SkgrNmVTcE5hWERQQkM0amRJRUFmb0w0?=
 =?utf-8?B?RFU1dGtJRUNjazJ3ZjdkY05KajZzZzBkVTlPT2s3QzFybk0vN3QvODFmR0Jv?=
 =?utf-8?B?VlpBaE1OV2tEaHNxVFM3NDg2UlZqaHA2c2xaUmpnRkMvQ2RFcEF6ZEF0VkRv?=
 =?utf-8?B?b3VhZWNSRStQMEhsaldqVy8yT0VRNXlJczdqcitZUWhXSW5hUWxneUlNVW9F?=
 =?utf-8?B?RzlUbDZSK1VKTURqa1lIRWJrOFZQempTUTJxM0diNGV2cFRZVzdWUTZ3aUk2?=
 =?utf-8?B?dUhGdloyMTF0eVBsc2I1TWtHeUd5bHowd2hzbit0LzJPZDBjUEFvQU11WUR6?=
 =?utf-8?B?SVR1SVQ0anFSWFZFWmZwUEhSVm1oQ1B1Z0twOXVoWThES3I0cUhaL1FPYUhL?=
 =?utf-8?B?bnlPQzZ0aXJSczBwa1JZWURUcm5KRklFOU9xd0dVUjVMTjMzc2ZQTFJHeXps?=
 =?utf-8?B?UjNHSUVMcHN5OG5OdXA0aTZhY2g2V1pvR2RYcGYvZ0huVWpTQ0RDbnh3bm0r?=
 =?utf-8?B?OHptOW9TNXFoUGNnVk95cjdEYld0WlVZWHBIODBPTVlhS0ZVanJqRWticENJ?=
 =?utf-8?Q?xjiBDB+iEvKJzOMkJqbXjP8T5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba72e8a4-617c-4b89-b9e7-08dbf2fe4d56
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 06:17:04.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1D8p6dSaegDkgndpzWSWbO3g/uydWMf/M9I7JbDHzJfd5Z0ShTy3oGetipmio51r8V16UNk/qSK4EX0JgrjOqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
Message-ID-Hash: 4EMZUTWZNOIHJI2UKGLFC7HJIKK3ADXI
X-Message-ID-Hash: 4EMZUTWZNOIHJI2UKGLFC7HJIKK3ADXI
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EMZUTWZNOIHJI2UKGLFC7HJIKK3ADXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/12/23 11:42, Vinod Koul wrote:
> On 01-12-23, 11:16, Mukunda,Vijendar wrote:
>> On 29/11/23 18:34, Vinod Koul wrote:
>>> max_dr_freq and curr_dr_freq is calculated and set in
>>> sdw_bus_master_add(). Setting in the driver is reduanant, so drop that.
>>> Set max_clk_freq instead.
>> LGTM
Verified on AMD platforms.

Tested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Right way would be add a proper tag like 
> Reviewed-by: Foo bar <foo@bar.com>
>
> or better to test the patch and update with
> Tested-by: Foo bar <foo@bar.com> #on xyz target
>

