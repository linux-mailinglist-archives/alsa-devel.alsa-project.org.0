Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B48252BA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 12:24:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4659DEA0;
	Fri,  5 Jan 2024 12:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4659DEA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704453895;
	bh=xyJt0NbOVb//EF8aTLBX2zjiHqMstoFHvmUKKTA0h2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nH4Y4N0ZzFZaRyIwoz5WG6pYpPOjcIhH0iEPQxxQ5DVR0FnUhhN5GxZs1rWvYeWqh
	 3INwnX6gB9wlVpw52KyJpN+1II8IjvoHFn/r4LSmU9LYRECYwZ2o61meZN0qiM+s5b
	 M4pfAAgn4E5sG//zmXolG5sB66t/jwC6vo3Z1wlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F00FF8057C; Fri,  5 Jan 2024 12:24:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D04F80496;
	Fri,  5 Jan 2024 12:24:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6A0EF804B0; Fri,  5 Jan 2024 12:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AF30F80086
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 12:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF30F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=gDrAvNh1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkSaA6KJXTEJGZXwHVBMwUrrKoycqZgBXaHQqDKxrY7WyPvreyxTGnzVXkSVcQzyVwrW7Z5HjKTY+vzGUg1w5s+oKf7p+joof58KfXsfuNzd1b2k6Nuim2xNT/3NWGYFh7mESqGsIcZd4oylf/p53zaz+kOzlZd6QqJebOuNR7TBeIGWPn2VosapJ1cJ9N8IKf+DrHmahK1lq0sPdhb6cuqYdlOS9vaKvvLR3mDJsiXU8VjynEbXOxaMo/vMFkZEr7aqaprtrZEoJBVwmlH5aKZ1Xr2T86NJPUMrtCOV3dk2v1lppkY0VUmyEOfyWZSOX9yUhiaO2ZgxLyJn9PkNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQHWQTRy5r2/GwauXCXvTQk5Mui9tLiGcvEdABNgQ00=;
 b=aF7tIWVjd3Tv+EFOtDXtl2JWA450cxeep6MB5RHajX4cwyGUvIslLoOK/8VoezTjmGdvjxOv35+3PVrZrEiAKPjQ2GgAy4drZmgmtuiIB3KQTt5qoYruPHqJ/EbzsxCUDssDVoAqdDlm6fwrvQy3aV5/HPKysRb0guKTGSQp76HFBuEWPJZhOQplr0KV2CRukNmFrXdJUTuoZTo97/g6tE5ZnHnEXLDGEob1KjA9465MwjLnoUewkOwmWGZPsL39X76acfoHTUEXdiIVL3rZhtt0qtIUWhCfSTctWx23E6P1VsGTH+pvaTeCpdLi/J9sEw1B1SFgDU4gKUHL6Ai5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQHWQTRy5r2/GwauXCXvTQk5Mui9tLiGcvEdABNgQ00=;
 b=gDrAvNh1U7kQYlIQooPov9RZUL7fxEySfEiv8sWmbsGx06URmGz+8wjfcNUCMkjkKbMeV0212kPDtmbOdT0TDmQTcICryClUHNcR9jc83U7SvkCzyeky5F0NlFE7Dn7jVAtC6WiClWtOet3/sMMAcZ3T55AIqEv7IaWE7JAZpsch4PcUFcLdGm+E6MZx+XlDR3Sxp5TkCAYY3uQWmnKFb2TMVQydqk2qSyCFE+heFm6eKDSaut2ht+A3zd6SwquqM6zn2BQePei1zN7G9A1KIgS/WKi5nd6pudXFd7oWWdEkiPrWKUc+vOhqqMKs5KZmNGC+KFPK4AMhoQqlOPs7Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by CH3PR12MB8581.namprd12.prod.outlook.com (2603:10b6:610:15d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 11:19:55 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 11:19:55 +0000
Message-ID: <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
Date: Fri, 5 Jan 2024 16:49:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <ZZe5sTNz005Tt4jk@orome.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:EE_|CH3PR12MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 8243135c-9fb8-4adf-2545-08dc0de03e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RbUz6Ek4ymqNzSPHyMrwKK+aNQ3yukRib6dVrM+D8Nao76MpCJ8t7WLBusq8RyL2hZXFW6eqZJke1393sIJqOM6Dl1BLrCP+AIyyZfEpOese50WoHsmBzXA89VzQkqShvq4p4WKfp8SGkZla2oXAzNftnVsfYWCrDQJwxHqz5qigmcWw33oPjmBVsSpox87VVYTe1BYVkEKFu5CEYeeIh+qs3j8dSbjm5JBaP8nJVQ8hYUEAZh/f5bD28DDTG5KCb0iRqq9wodIi4qDsM0JmraFdCFy1vs4BBmxCZe5DgupMXGBDuTF7MyEuWRdA2FjWs/Vs1kl82MEJBAz6RxAU3vWVWYPtGGimz2PqpKjVByDFSYBrDJDlA7g3yNDCjhWFTfz+zMB535SyGfLdLnD/x8+CuWyDMcke3hMOTZ7vk9M8UYZuGnnW85vTXmvndmebwqme/YqfmHOhUduWs5OBDzrp61ER6nogKT7wQCwGp+WzxJxkLpa1+2Hk5Hi6hCehZsTWD9epm+B1LcYI4a6vOrXC6/HmgTOWRS3jt3P8Rwd64HDd13okikZ1Ny0+iFdvSl6WkgqKBCuy5Nya2dKji3NXtZ+ubzuCJ+lIB+o+suWqCZlEk/qshAAo77odw7unjYYnwLd3Rmr9d4Nc/HJYrIosW3dfHmwMY4BHSA0z8rhz4j71XKgDX81lGt1GkQAM9z08iPvCUHM0J4dwNK5UKF9jZyQlyxX/XWyLWRYfSTI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3205.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(2013699003)(2616005)(53546011)(26005)(478600001)(6506007)(6486002)(6512007)(6666004)(83380400001)(2906002)(41300700001)(66476007)(66556008)(66946007)(54906003)(316002)(8936002)(8676002)(4326008)(5660300002)(6916009)(38100700002)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzIyQ2JIbXBlRjhYN2Vhcld2enRZN0Zqb3FsUWk1K25KbE1uYytMOThWRyti?=
 =?utf-8?B?TkpheGJ6cWpGZXU1RDl0bTNuOFN2UmlZTGdvM0RRQzh2Vng0TExEZngzaVZo?=
 =?utf-8?B?WXVmazBsdGpmSDdMQnJ1V2RqU0Zyb2RHTWFRVjdzczloMVNXd1dGNTJzNUxa?=
 =?utf-8?B?aFBtcnRuMURTMGNRVDdJNHh2UFU3RDdWZ0t3OU1wcGNlWWQzRnVQRDVBUDh6?=
 =?utf-8?B?TEFxZ2dQMU4yc3pGWXArb0VmZjFvQllSMlFTTDVtMVU4cEdRUXNjNXYvWSth?=
 =?utf-8?B?RWRScDdKendiSW9hY1p4Szg2Vk9ERVZ6VVRWdVg1N1hGRUhBWEJrSXVTNkRn?=
 =?utf-8?B?M25PdG4vMHBlcFpmTG5qSXAwZ0R0bm10b3RWZi9SUGNmR1BETjdMSm5YR3ZF?=
 =?utf-8?B?QmtuWmljSE5HdmU4bmkyb3FYaE9hd0gzZnJlS2ZiU0pUYmNqbHNTcHhhcS9G?=
 =?utf-8?B?MlpBeDNPQ05SSFJxUWZDWms1TnFQSDlYdnB4K09NRGNYaDhUTU9QbEVBdFBP?=
 =?utf-8?B?UmVocm8vMEJCV2NGeHdzQ2RUcGJtL0xOVERkL3VWaEZwanUyK0VMcno3VFQ3?=
 =?utf-8?B?eTdhbnFWS1k5Mk5CbVlVZUhNbUVhMlM1WDkxVEI2V3FzL1VXSkFXNHc5YXlD?=
 =?utf-8?B?U2tiWTRmbEcvcG8zei9lMGYweWtZdlhMeDdnSEphQjVpVjFPWFJRT2pUN3JV?=
 =?utf-8?B?QU80d29lSXhleTY0UnNQSHVremJBSmlWM0kweEJIb3c0NWFDdDN3cDFmVTMw?=
 =?utf-8?B?enV3bzlnUHlSOVpwZzZnYUhwakZaZW5DTk1zdFo2YTB0QkZubTdCTTdRY0Nk?=
 =?utf-8?B?WkpFNWxLRkJ2bzRyb0Z6UUR2M2F6Z1ZBRE11OHlJa1krUHNXN1FpaitGdkY2?=
 =?utf-8?B?QTRVUDdYekdNbm9YN0xzMEtFQXlNRWxtVDRDRlV0aUwramdvZzNGeG9OZ2lD?=
 =?utf-8?B?UUtEMWFyMkM3ZUg3S2w3QW9pM3c3cHI4bXczRXJ4bENBdVdHbXRHdzZyakZa?=
 =?utf-8?B?UXhnVm1ZRFJhNmxMT1NrYWZtT3l0UlVpSWU5Z05iRFdFbnFyeFQ3YTdxek1h?=
 =?utf-8?B?ck1hVkhCZmFhVEphSnkvNlJiWVdkZkpQTTV5cWJYTjRzNzVEMi81YWdDSkxi?=
 =?utf-8?B?TWtyYW9YeUdRVVE4dnVDenFuUnA2dDE4M3k0V2xEdkdyOHhDdzRGZm1mdWlJ?=
 =?utf-8?B?U1FOV2lKSHBuZGZNR21pM2VHQi9NM3hoM3lxY0tiQUJEUTBrQmlCY1ZXTTU1?=
 =?utf-8?B?a2lhV2kvRGREbjBYREZObVpvSXBPU1FnTklYQ2JtSUdzUzhZN040RlZ0SXY0?=
 =?utf-8?B?Tkw4YVYxc2RQdmo0TzlObzlmZUlZVmhPVC9kVldya04zTG5MTldxQjNrZVRi?=
 =?utf-8?B?OVJ1YU1vSjJDaUNUNmJWVWVuZ2RGTXNucXVzQndReGcvTUZsb3RJTXkrcFlv?=
 =?utf-8?B?aDA1THpuWnk2SlBBZjRDeTd4UlQwODl2VE9JdlF3RlY4RFJPSTFkTnV2NDZ3?=
 =?utf-8?B?T3orT3c0NjZDRzQ0SVE4NS9aVzArVmQ4K0xhNG1LNVdOU0tMYUVJa1dpZXJv?=
 =?utf-8?B?OWh4emVibTg4VmhQWnQ0NWp4dkZmM2hxT2dYT1NvYUZDNUFSdWxQU0Y2Mk5D?=
 =?utf-8?B?aHViUDgyWDlRN3luajJIQ2paTlJxSWE5bEx6RHBtUndDWUNZWWh4UlZJL0p3?=
 =?utf-8?B?VFJrWTJDN1FHZE16M21kN2NhRHBUeWdwVlJLZ0lBYVJocDFPNzlObnZOdFo4?=
 =?utf-8?B?azd0U0U5VlhvWUt0YThoeTk1R2tKMkcxaGh6RndRRFRDZVZaSXV0aTYrb3hT?=
 =?utf-8?B?MElUdG9HUXEvVG84dnFQRndzMHVhTGJRU2ZOYTdMT0drOGwwVXBzSk9FaXFu?=
 =?utf-8?B?Qzl6dmxBcnNRMmNOSVZTSWlJTHJ4ZGZ1WDl4VnFsaWJjSWh5RE03VjZnaHBr?=
 =?utf-8?B?UWJ6TmY0MytRQ1Y5Zm9saDlGQmd5bk5xZHBQUm9BT0tCc1JEb0MvcWl2T2ZB?=
 =?utf-8?B?Z3J6Q3ZvME9lY3VtNHEwOE5qeTF5Vkxsb2pLS2pCdzVTeVZ2VTMwcUFnVGZh?=
 =?utf-8?B?aUwzcExXZ2xGYm5xT005ZzdMM0VTR2o5ZGYwaEZqemlOcVRMVlVlaVdHblNO?=
 =?utf-8?Q?onS4EFJ5pRBFyvOuMVK2GeeDp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8243135c-9fb8-4adf-2545-08dc0de03e40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 11:19:55.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AskYfOBGY5YvlsKoJmqNITtl/50BMQRRDsy8/YXHqcsh3EeeG1gY2FMGhUYHCYBaYawFcguQI9E7s07NjkBd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8581
Message-ID-Hash: QXJBACSNZWAWGIKAG5AHMPZR6UK2NOYQ
X-Message-ID-Hash: QXJBACSNZWAWGIKAG5AHMPZR6UK2NOYQ
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXJBACSNZWAWGIKAG5AHMPZR6UK2NOYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05-01-2024 13:41, Thierry Reding wrote:
> On Fri, Jan 05, 2024 at 10:24:18AM +0530, Sameer Pujar wrote:
>>
>> On 04-01-2024 22:52, Mark Brown wrote:
>>> On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
>>>> On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
>>>>>                 /-----> codec1 endpoint
>>>>>                /
>>>>> CPU endpoint \
>>>>>                 \-----> codec2 endpoint
>>>> Can you describe the use-case? Is there a need to switch between codec1
>>>> and codec2 endpoints or do they receive the same data in parallel all
>>>> the time?
>>>> Could this perhaps be described by adding multiple CPU ports with one
>>>> endpoint each?
>>> Don't know about the specific use case that Sameer is looking at but to
>>> me this looks like a surround sound setup where multiple stereo (or
>>> mono) DACs are wired in parallel, either with a TDM setup or with
>>> multiple data lines.  There's multiple CODECs all taking input from a
>>> single host controller.
>> Yes, it is a TDM use case where the same clock and data line is shared with
>> multiple CODECs. Each CODEC is expected to pickup data based on the allotted
>> TDM slot.
>>
>> It is possible to create multiple CPU dummy endpoints and use these in DT
>> binding for each CODEC. I am not sure if this is the best way right now.
>> There are few things to note here with dummy endpoints. First, it leads to
>> bit of duplication of endpoint DAIs and DAI links for these. Please note
>> that host controller pins are actually shared with external CODECs. So
>> shouldn't DT provide a way to represent this connection? Second, ASoC
>> provides a way to represent multiple CODECs on a single DAI link in the
>> driver and my concern is to understand if present binding can be extended to
>> represent this scenario. Third, one of the user wanted to connect 6 CODECs
>> and that is the maximum request I have seen so far. I can expose additional
>> dummy CPU DAIs keeping this maximum request in mind, but not sure if users
>> would like to extend it further. The concern I have is, how can we make this
>> easily extendible and simpler to use?
>>
>> With custom DT bindings it may be simpler to resolve this, but Tegra audio
>> presently relies on standard graph remote-endpoints binding. So I guess
>> diverging from this may not be preferable?
> This seems like a legitimate use-case for the graph bindings, but
> perhaps one that nobody has run into yet. It might be worth looking into
> extending the bindings to account for this.
>
> I think there are two pieces for this. On one hand we have the DTC that
> complains, which I think is what you were seeing. It's a bit tricky to
> update because it checks for bidirectionality of the endpoints, which is
> trivial to do with 1:1 but more complicated with 1:N relationships. I've
> done some prototyping but not sure if my test DT is exactly what you
> need. Can you send a snippet of what your DT looks like to test the DTC
> changes against?

This is the snippet I was trying to test:

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi 
b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
index eb79e80..22a97e2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
@@ -13,7 +13,8 @@
                                                 port@1 {
                                                         endpoint {
dai-format = "i2s";
- remote-endpoint = <&rt5640_ep>;
+ remote-endpoint = <&rt5640_ep>,
+ <&rt5640_ep2>;
                                                         };
                                                 };
                                         };
@@ -53,10 +54,14 @@
                                 sound-name-prefix = "CVB-RT";

                                 port {
-                                       rt5640_ep: endpoint {
+                                       rt5640_ep: endpoint@0 {
                                                 remote-endpoint = 
<&i2s1_dap>;
                                                 mclk-fs = <256>;
                                         };
+
+                                       rt5640_ep2: endpoint@1 {
+                                               remote-endpoint = 
<&i2s1_dap>;
+                                       };
                                 };
                         };
                 };


>
> The other part is the DT schema which currently restricts the
> remote-endpoint property to be a single phandle. We would want
> phandle-array in this case with an updated description. Something like
> this:
>
> --- >8 ---
> diff --git a/dtschema/schemas/graph.yaml b/dtschema/schemas/graph.yaml
> index bca450514640..1459b88b9b77 100644
> --- a/dtschema/schemas/graph.yaml
> +++ b/dtschema/schemas/graph.yaml
> @@ -42,8 +42,9 @@ $defs:
>   
>         remote-endpoint:
>           description: |
> -          phandle to an 'endpoint' subnode of a remote device node.
> -        $ref: /schemas/types.yaml#/definitions/phandle
> +          A list of phandles to 'endpoint' subnodes of one or more remote
> +          device node.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>   
>     port-base:
>       type: object
> --- >8 ---
>
> Thierry

