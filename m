Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F642746C99
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 11:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B218847;
	Tue,  4 Jul 2023 10:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B218847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688461229;
	bh=BOR6lLConShfcU1QysG0wq0I+M9kr2E8psJShvNphm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jesz3mnYvCbBe2kWDZDC1xMmBaOGG3uFeOJE+WAf36tC9B3j7PhE7wBqAfro8ji99
	 q8M3/d5+cDCjMYyJcTMgBRyXNY0GyQXSwFQ1dFy9uoxe3n/woQMFqQ35jZIEuA2cOd
	 LigTq8cexy/KNxLjPq65fnidB0UjnU/rmmmYjTI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AAB6F80125; Tue,  4 Jul 2023 10:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 564DFF80552;
	Tue,  4 Jul 2023 10:59:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02232F80553; Tue,  4 Jul 2023 10:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20FDBF80535
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20FDBF80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WBbb+GVP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhewZ4/KuD4YIgVAnMvm/djIraxEb4DmkEnLuEF8yPgycxNoWpu7dZqt1t+nyiCwIS6Q721j2SraDm5ys6KH0fWrDy12DppdncOqa1flfVWR30RzJ2G8EnrfmiDr4v2YFXed6lyOOYDZjuDCCPi0Az84PDqIcj9SZIzPwpGCEgv78QK1hrCrHCT10VBrKpBDowkhtaPeEbS1F58o0/q4c1MQMkNIOXeQRq70dyOcaLMH4cgajCdcl2tT1cH6tWBYnfymQv4EmLSeDmhOx9QdRzBzDtTotY2e+ZYj3kPlWWumclbJYDkpkNdGGKNirwiv7H8+9Mj7ODic6G0DTclLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9cMjIbwhHfFun4lf+GPjoeCXO2MSgqzeoxUeT+Diak=;
 b=ZhrY2mrs+f67TPA93cfW1m5TOY9TVoTpplUd8ZYwkBbOBxQ+l8ZBlZs786VodIIQB42SrKeUvkg0ngb6dnSYTkMwSvEDkG+w8I0Vkp3Bm5Ti+VZzL9Ss17WyrvPmyQhet0hC47LUGNUX4w8TMsUysNYv/SNhOTGhOCszGtmO37n1uKz3ZxzvG7AzfedW8y1uxCMsFDDuxh0FoKuNqa4FZAP3SnxubIOit6WdzWAKTNzdk1pM/Rkzr1idsjWEyjANzLe/kCweRVS7YQ0+fpOj+rmOKIsM1PkAEyJIR30GJSQJWqKgsIxkcyoiiP6UBn7QrvldUwUxS+Jq2mrmLm/9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9cMjIbwhHfFun4lf+GPjoeCXO2MSgqzeoxUeT+Diak=;
 b=WBbb+GVPP08E8q5lKYncJiormuzt9Q/OQADWqY19Iu2dtoBb4Q9eGJJTZgCW5Ow7X4l4pG7ywEZzn/OFKCPOXodmM4oFST8sdCHtVisjhaQJTjKsRTQoFw5IUfz3AxoPCld/8ihmxWX+FAksIyVroKNFtZVkaYC5BYfGOv3Z4j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 08:59:12 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 08:59:12 +0000
Message-ID: <c5add7b8-0170-a223-5216-2e9cf2869f04@amd.com>
Date: Tue, 4 Jul 2023 14:33:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
 <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
 <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
 <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
 <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
 <7c8b7cc9-125e-e97e-2a42-046a025d4e94@amd.com>
 <7e6faede-af5c-c251-d6eb-cc3590b36337@linux.intel.com>
 <abb4376e-15d3-6211-5024-03caf29c7a3f@amd.com>
 <ff732d09-b620-cdfd-d055-da116b99223c@linux.intel.com>
 <c932e7c8-74f8-71f1-e35f-98e1a852bd71@amd.com>
 <55d3da8d-a4d6-3bde-0635-0ae7fb3f32ca@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <55d3da8d-a4d6-3bde-0635-0ae7fb3f32ca@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::9) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fbaebb-1ba7-4de0-1215-08db7c6cef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	40YLwsCc/MpdmKjtH+G37t4hmCMSn2xz0V45UvS4Em8vBmDbeemJdqujRgsaUJy/jSwHh2mszg4u+wjOAv6gvl2FTaAU6GO5VRlu77Bd9WdXfh3aKOrxqwWQBJbJ4pCxbwLEgPB011nzh2wxi45P/NJSKqFhX9IoGU8CbMMZaP5ISJhZAlK6huEyvnEJtMvR/sYBlhTZud9dspzltWj8IcOU+aykPnde47ycocBVxEV6ZHC/Bxdq0Jrx7SX1OkO8JZaI3YEOdRBUkcqs2H9C7/l/LkB/Vs7DFd5SFOGnghyaw3OoEFXdBCdY2ojctCfmOtXtN3SZ8kdZW2XSwmnWbx+W9ZtPBzTs1aI9Ccv2weMS0wQ2Bwqvy9/IBWpWnaO/NzRppPAMA9sHWRGTO55plPqFhua0/E66alOpf59/00pES0nA69GbAZnn8d+TiSIIFi2hgKKNWC7R4FwtyFsz3iTyFBR/gq9izcR9uADb/qkCyLaypWxATdOS+ypkOD9I1LP78I8W+iBuZawm1KVtJAfqA1wLTIXzfvBOlJ0mw/cVAmR1Z/v91G5o52q61SSD1u13Cb0w9+HZgtUO86AIucO78123wPs/Kh4e3S8FTBSWyI7os/K75NrKi4FoREpai5nz7MTM9JyrxnJ5M3y4dQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(7416002)(31686004)(4326008)(66556008)(66946007)(36756003)(316002)(2906002)(478600001)(66476007)(8936002)(8676002)(5660300002)(66899021)(86362001)(41300700001)(31696002)(6512007)(110136005)(54906003)(6666004)(38100700002)(6486002)(6506007)(53546011)(186003)(26005)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3FaZDBhS3VENC9FdHpUVEhYUGNFc0ZNZ1VEcWFrNFBtRlFmMWZtVC94aFNx?=
 =?utf-8?B?L2t1ZkJiQ2llUzllNDVtck15YjBPcUZib0FMU0Jtck5lNmN1b2g4aHVNSStD?=
 =?utf-8?B?OUR1NFRVeHRWa1RiNGV1aDg3dFRQNUNHK1V6MTR3TXJQV0lldml1cTNMN2hs?=
 =?utf-8?B?UDEyTUZJSVlQbm45cjlyRVZORkNNanNrZUdSOVB4cUgyK25IMGxVRzhBNmcv?=
 =?utf-8?B?NDY1N0lqVmEySXM1T1BVTzlBK0VXb2RIRE94RnN4SXpETmxUajFFTmRXaXha?=
 =?utf-8?B?ZW8ya1ltZk1sMHEwQWE0THo0Qm1BOHVTR1JTQlA4cERKdWkxZHgvVXp0M2Rl?=
 =?utf-8?B?cHhlUEcvWW1VQWVGQnpISC96NTh0VkF4bGhxSlhUalRPSWdEUWFES2t3MTlt?=
 =?utf-8?B?OGtramtZcUpWRnQ2TWRQUUJrUE5HMnV0N0loWTllS29EV0pUOTFCYy9PWTMz?=
 =?utf-8?B?WjF3SWtLblVOeDNSZ1VTbi82QUtORndPUzlwUXZRM013QlZ5WXZyenB4L0pH?=
 =?utf-8?B?bFNEelYyRnFuUk53bXduZnBTMXFZTnUzMm96YldTTkpvVld5dzRpa21NM0pk?=
 =?utf-8?B?TTEvSVl0WnNVMS9URUFDdk5mem1kVWxqQjMrUjhyUnExYVBTL1huUEVXS1Nl?=
 =?utf-8?B?WEloTW1vdWt6Y3pvK3J5dDNCY1huNXRTWXo2Mm9iZXJpSVRmUUpwV1ErUFBw?=
 =?utf-8?B?bE9vUU51dFpYQnd5R2Vsc2k3dGY5QUF2Nm1hc1ovRE9GeW5zekhhM0xROTZ4?=
 =?utf-8?B?eG5nNXNWNlNYT3hnc1lKTzNSbUxnSXhuZldRS21vZktFSURsaG9pRkVFWitW?=
 =?utf-8?B?SlFrblpIYnYzQmhVWDJuT0IzN05Bb0ZTaVJXVzY0NzY4ZEVjY0ZPTE1Uakxy?=
 =?utf-8?B?cFhJdzMxSXR2MGg3TVRNVXN1cHBjRjl5enNyNkM3Y0VQbEdoc2greGVUY2NK?=
 =?utf-8?B?VmhPOUwyc21BS2RxdnFEdk1RZ2xDZ0QxM2Z2SjBsTVhQaWlsdDVsU0VtQUdN?=
 =?utf-8?B?TW5qYmhBVktBSlhZdGVOMmZhbmg0MUZHeUIwVWh5N2VBMEROZHVvUWplL0c5?=
 =?utf-8?B?VW1OSWcxc3dmWU5jK09XR2dUTEVTU2psYXUwTyt1N3R3c3pYQWNIci9pMHcz?=
 =?utf-8?B?OFNRTVRpTUQwWjVlUWpFTm4vZXQxeWpWNDdRZy9wek4wMk0yUFVjcFNtTnJE?=
 =?utf-8?B?SW80dUVRWlY3Z2J6Q1FxMTFVOHBHNERVWjlUNElDRGJzL0JJTDdQUmVIajFI?=
 =?utf-8?B?aUVWNUU4RUhac05SZE15SGI2cU5JT0tXNjkybmQ5RzBnYk5OUWEzMTMrRUxO?=
 =?utf-8?B?TXlHeVhBSFpMcUhEL3hzMGtUZ3VTcDEwMk5POXE2UW10R0JxSGYya2E3SFJS?=
 =?utf-8?B?djFnODd5a0Jua21tWE11OGFBY050Qk1YVWJJQ0ZLeGNGbHNWekRFc0JleVdN?=
 =?utf-8?B?TE5qQ0NuREhzOVoxWW9EVFZMenU2ajBIcmFZbTIvR3lhZzJlWGxiV25kRzMz?=
 =?utf-8?B?ZjlnalltdThzaXFGR2JvM05Za2poSHgvYlJ0NDVuY3NKOTdrQVNsZkdYQXB4?=
 =?utf-8?B?Zy9HYm9YYmFxdVZpUk5GUTRJdjF5Mzd5emIwUzZtbExKZlhYQytmSXFoZUk2?=
 =?utf-8?B?Z04vbzBqNmRwU0tPeEtWNko3NTRZcHI1eXV0Qm1CcjBHUjZYblZkeDRaTjhw?=
 =?utf-8?B?a2t1Vng4MDRDUWc0L091NXlWck9XbDN5Z29BYW9hbVJKUGJKbGk1RWdhZXQy?=
 =?utf-8?B?TDk2UFF1bmxJZmxKMXV0Qk1wVUg4eElUZllURDRDTndnTTFkR1lhWnJ1UTE5?=
 =?utf-8?B?WVdDTWZJR0U3cVZ3bXcyakRCek1KekZ1bWR2dFE5bVYzOElFMTNSYlh0dzJF?=
 =?utf-8?B?RkZTTFZSazVvT1lRdnBLZzFOSENYMjRCdWpBa2RUd2VmQm9md2JYV29oTE14?=
 =?utf-8?B?UDhRby9pQm5aUDRmb2l3RzdnWTV6OCtDU2EwUDdTTUNrSDRGQlpGYlV1UW1m?=
 =?utf-8?B?L1hUL0EzU3pPb2I1ZFB6aVAwRG9pelhJUHREeVh5VTIxUVJiN1VxUDhheXhB?=
 =?utf-8?B?eCtPb290YTFhdnhMU2N2by93eTM2bWsxY3daaklIbkxQeFdqd0pBaFIyMGFw?=
 =?utf-8?Q?1Ri570XlkrER/SLMPsMK94CIq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8fbaebb-1ba7-4de0-1215-08db7c6cef63
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 08:59:12.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Td9mwPt8hsYKvhBPglTV9au28WJF3rsWDWCehBq6Ljzly4mFQsppYIL3Es0eFlseq/QwNZDLcyyP6ApowrIarg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
Message-ID-Hash: SIXNZKP2KBSQTUEOSHBZF3FBVE3CS62K
X-Message-ID-Hash: SIXNZKP2KBSQTUEOSHBZF3FBVE3CS62K
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIXNZKP2KBSQTUEOSHBZF3FBVE3CS62K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/07/23 13:57, Pierre-Louis Bossart wrote:
>
> On 7/4/23 09:37, Mukunda,Vijendar wrote:
>> On 04/07/23 12:41, Pierre-Louis Bossart wrote:
>>> On 7/4/23 08:36, Mukunda,Vijendar wrote:
>>>> On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>>>>> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>>>>>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>>>>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>>>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>>>>>> system suspension.
>>>>>>>>>>>>
>>>>>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>>>>>> in the .prepare stage.
>>>>>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>>>>>
>>>>>>>>>>> Hi Vijendar,
>>>>>>>>>>> Do you have any comments?
>>>>>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>>>>>> 1) Bus reset mode
>>>>>>>>>> 2) Clock Stop Mode
>>>>>>>>>>
>>>>>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>>>>>
>>>>>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>>>>>> suspend is invoked.
>>>>>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>>>>>> SoundWire manager device is in D3 state.
>>>>>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>>>>>> restart the system even when it's in lower-power mode.
>>>>>>>>>
>>>>>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>>>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>>>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>>>>>> to unattached state.
>>>>>>>> We have cross-checked ClockStopMode0 description in spec.
>>>>>>>> It doesn't specify about peripheral device state as Unattached.
>>>>>>>> We are referring here "ClockStopMode0" only.
>>>>>>> No I was describing the difference between the 'Bus reset mode' and the
>>>>>>> 'clock stop mode' on the manager side.
>>>>>>>
>>>>>>> There's also nothing in the spec preventing the manager from doing a
>>>>>>> reset at any time, including after exiting the clock mode0 stop.
>>>>>>>
>>>>>>>
>>>>>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>>>>>> and re-enumeration is required.
>>>>>> If continuous parity errors/bus clash conditions are reported over the link,
>>>>>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>>>>>> Both the scenarios are asynchronous.
>>>>>>  
>>>>>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>>>>>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>>>>>> and restore the clock when D0 call is invoked for our platforms.
>>>>> The problem is that 'D3' can be used for two separate scenarios
>>>>> - S0/D3: that's pm_runtime suspend
>>>>> - Sx/D4: that's system suspend
>>>>> It's very unclear what the benefit of clock stop mode would be for the
>>>>> latter case.
>>>>>
>>>> We are pointing system level suspend scenario only.
>>>>
>>>> We have already SoundWire Power off mode - ClockStop Mode will be
>>>> applied followed by bus reset and SoundWire manager will be disabled.
>>>> On parent side, ACP soft reset will be applied and ACP parent driver can
>>>> wake for PME events for Soundwire manager.
>>>>
>>>> Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
>>>> For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
>>>> on SoundWire manager side.
>>>>
>>>> Having said that, below are power modes we want to support on our side.
>>>>
>>>> 1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
>>>> disabled during suspend callbacks.
>>>> 2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
>>>> the clock when resume sequence is invoked (even in case of system level suspend also)
>>>> 3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
>>>> runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
>>>> will re-enumerate all peripheral devices over the links.
>>>> 4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
>>>> Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.
>>>>
>>>> We expect if someone wants to go with only ClockStop mode, peripheral side also required
>>>> support should be enabled.
>>> I am not following any of this. You wrote both
>>>
>>> "
>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>> SoundWire manager device is in D3 state.
>>> "
>>>
>>> and
>>>
>>> "
>>> Parent device(ACP) will be powered off. ACP can wake up for in band
>>> wake-up events.
>>> "
>>>
>>> I can't figure out how you deal with wake-ups and when exactly you
>>> expect jack detection to be functional.
>> Both power modes (case 2 & case 4) are different.
>> The current patch series is targeted to address JD events during system level
>> suspend/resume scenario, when ClockStop Power mode is selected.i.e case 2
>> as mentioned above. We're not expecting bus reset during system level resume in
>> this power mode.
>> As SDCA interrrupts are not enabled on peripheral side during system level resume,
>> No JD events are reported.
>>
>> Test scenario will be let system level supend gets invoked. During suspend, plug/un-plug jack.
>> During system level resume, JD status should be reported correctly.
> This is completely different to the definition of 'clock stop mode'.
> What you want is to make sure the status is reported correctly when the
> system resume, not to resume the system using the clock stop exit
> mechanism at the initiative of the peripheral.
No.  What we want to convey here is in system level resume for SoundWire manager,
clock stop exit sequence will be invoked.
After clock stop exit sequence completed, we expect JD alert should be reported if there is any
JD event during Sx/D4 state.
As SDCA interrupts are disabled previously when system level suspend
is invoked on peripheral side, even after finishing clock stop exit sequence, we are
no longer observing Jack alerts as SDCA interrupts are disabled.

The current discussion revolves around avoiding bus reset and just enabling SDCA interrupts
when system level resume sequence is invoked on peripheral side for ClockStop Mode0.


> I think we are using 'clock stop' with different meanings. Stopping the
> clock in the traditional electrical engineering sense is different to
> the MIPI-defined clock stop, where manager and peripheral agrees on when
> the clock will stop and how to restart.


