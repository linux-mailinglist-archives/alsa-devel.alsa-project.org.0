Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9244990C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 17:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95091658;
	Mon,  8 Nov 2021 17:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95091658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636387508;
	bh=zi67YM5qJUP/i32A7st8HeQemqyJpI3bB+uJNKuXRK0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tr0Pp3GbSoIX1m4Jp8PeMe4wsZRfhjevS3VsxxfRLC1qo031lTtWoMhRVvrOKCsAQ
	 wIrt/cT8NLcs00KpY1deM1dmzG0+WDn1n1qM6bRkv1hHj4r4X0grvvSeW6KV9YbCMW
	 lO+G8ZfTXoBX54aAcgfU4Y4iZWDmWUGLAx4jf6Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EBA0F801D8;
	Mon,  8 Nov 2021 17:03:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD0C7F8049E; Mon,  8 Nov 2021 17:03:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD4F9F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 17:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD4F9F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qcB/8CWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTOY3o/rSMKcOAuLEchPpdRdyhj/V37Xb9fWQT5A6Ors2t+PInlF5PIEb4tWSDLAXPHtdg6WJRtLjFZtgUluP0F6wPCzqoGSBxG+J7QXufIZYGLYkQuI/Up3T23mtSGRobGgOc/blp51YwzuqbW7H7BuBbt8bJFxCu58PF/2Ex0kAdiDxTh45qr9xuTxyU4f75yjKKIOprg3Jm5UxCK862WOz11J4FtG8urjURTGf/2vsa5hdXQiwADLrbuzV1TMJbkigDqPm4gCU9yq1btcd6h6JKs8NLBUmehJxe9GGdRiBiPg4VIyamwDHkh7F3qZKNrIkZ9bf7sbO5+3QxgUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdrYN8ZSaU9GY89OfU+n5ZPvieEQK9V7YevR8cWlj08=;
 b=iQkrp0Hhx/+tG9qIbgvBJS01Vi5TEBYA0B94ho4CvCEMFUiZm3OnX/Cvmm3cvuEHPe36l7q2YQ51DOndlzUyCheRA9CjDCHl2E8qNZJZgpEgQF2g4gBQSsPCGUdN//r0/29Qm7JwWcsGZjwAQcq/FPE8rmPT/qeR2W+QDGmhKTVvFDehOjsxq4qi8yEagb8WzDLterF+9iyyu7765gZC0TsSVyJWZPJVzarZIOuZnbtiOmUaxm8fqoijJzRHi3cpbPQ05F2mhdcFSVTwxJDggRz3kdrZLdMATn3TIO1SMsSiysNRg+TYdCnw5AgAyajCo4qprEkgzJ0/wo+RrXrX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdrYN8ZSaU9GY89OfU+n5ZPvieEQK9V7YevR8cWlj08=;
 b=qcB/8CWiuofOfLYrjfbfgXQ5HU55X8bbZOoj00XO2QrTLOK/pGilGV4pawlyXY/pQeRJSUppY4HH5ya+/jQM1HoF/V4C2IxtSbYKrSP3nJMVHcX1EI0F2kUFxMkFooA6KiPygDTm+TxuhgnmovRiU7sY/VH/xINM5nkMfKMgV84IVzO7yH44gHtSXg4EiPiCtPnRv+OK82w2Q3jVOHgJwFrYCBGgX2HOTFeSCZfo4GEMxLms7uhfGVmM1T5FgOHbLIghlxZWKa8LQEMFhc4GH/SW/9oBWenVbm/9uCpTNJDeFbZtdXm+6Hhfg2gX1qOGtBlV5P/5hlMYLQiBkWshXA==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=nvidia.com; 
Received: from BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 by BL1PR12MB5302.namprd12.prod.outlook.com (2603:10b6:208:31d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 16:03:38 +0000
Received: from BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878]) by BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878%3]) with mapi id 15.20.4669.013; Mon, 8 Nov 2021
 16:03:38 +0000
Subject: Re: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
 <1635947547-24391-2-git-send-email-spujar@nvidia.com>
 <s5ha6ilmiiv.wl-tiwai@suse.de>
 <0e2d89ca-84e3-9427-5ce1-c0224d4db089@perex.cz>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <d27bf513-6f16-5ad6-59cb-79fad5cc951c@nvidia.com>
Date: Mon, 8 Nov 2021 21:33:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <0e2d89ca-84e3-9427-5ce1-c0224d4db089@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MA1PR0101CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::30) To BL1PR12MB5317.namprd12.prod.outlook.com
 (2603:10b6:208:31f::17)
MIME-Version: 1.0
Received: from [10.25.97.218] (202.164.25.5) by
 MA1PR0101CA0044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 16:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53766302-41f6-4b39-8b7f-08d9a2d15392
X-MS-TrafficTypeDiagnostic: BL1PR12MB5302:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53029E7BC3D58C829261DCA1A7919@BL1PR12MB5302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Ps90anzUJz0ITH3WzV6XX1ZJFHsmG31xiMTd7uA92Sl6wvhijgH1n0T0T5oegycF5SmSxOenkFFamnhqU3Lp3DwMld9uTETJ+qyxErUxJXaSpVoJ89vxmJe8eC8E/GUy4r03A9Qo5cZDbfcXsrKvCRBJ6ixm6FdceG4rZrWuRy4KGw+SG0NUZb4dTXm7kuzKWbiJpj4GDWTNFI8RaurCzQ1Ya58XG4Ez694yzIFMfJC5lPqxSCn43jREaw3UeIt/xmdTTWOcZ4U3QIDDXq+fbiIeGqXcEIIov9I9KkFmv4qP3CSyMPFLJuEmKI4xEZCBUCjDQWGEr3FPEqdc6yD2Gr7/l5Xs0T/2XJofvpqg8i2vRpVUi+TGJ+nN3+izIurbnBc0I0hauMPRyK6khZi/kgGM1P45O03veR85tL48QzkYcucKaeL+AxFv/zKeZjcsnJyM86OimfwJg798aSgXFjKyvniYcSSD+SzBcrGxFykn1vPhlN2xp170+ISNKJ1nakyozJBJjtcAA8qfqyd3xvNZrKTaUdhLjx8aa5pzguNnunqX2MbXmalhQ/zAt/9w4rqnAr1Zn/mjIHmbGAW/+fDeQNPNJpkFCwTBjqJgD0rAm049W2x79zVTDKjUFaI3AnqosEDSQvOY+Tk5DSQxETSEaS7QJ3nqfdkHN0dtlCh2b0Upt3fSIX50phddCeIdo7XHqGUlAHlVrsp4YJXkSkCK61zM6whf3/ZVV7np+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5317.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(66946007)(38100700002)(66556008)(66476007)(4326008)(16576012)(6486002)(86362001)(316002)(2906002)(83380400001)(956004)(110136005)(31686004)(2616005)(8676002)(186003)(8936002)(5660300002)(53546011)(26005)(36756003)(6666004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2srMmNvSy9UelI2UzN4VTdPd3NTUFhndk1WZGZsM2Z6WXVYbzdBWmUzNkVq?=
 =?utf-8?B?QUtXUzZnakRET1prTG1IVnNicmt3Z3NselNXWExFNUJ3eXhCenZnN2FPNExV?=
 =?utf-8?B?R21UYkpncGhEYVRDUi9QeHFhbDRzNDdMWVhzRWJrdmloeGtPVnpZSllkbkc4?=
 =?utf-8?B?eXI1UUFPM1g1dERBU05wdmFNMUhPRUYwL2V5K1Z3OEFPZ0VVcjdLMTYzaStT?=
 =?utf-8?B?TVZpWmJFbHVaVlJBRFloVzdrYVVZQ0pGUFVCeE10bmRvdXJvdTUrL3djbVVI?=
 =?utf-8?B?WVdtb3pJTmg3bzJWTWV6bUI1ZU9RdDdnSGc0RTRVZWFkU1Zzam9OS09MLzgz?=
 =?utf-8?B?M0xxMUlWZUk0b1RGdGMrSVdVWER6QStVS2JMQlVUS0phVkh3UVZzVi9JUmlU?=
 =?utf-8?B?OGJvazl2d1hMRVZBUE0rUmtWK3VEVXByZDVQZ1MzQTl4ODBwNitNZzJiL0lS?=
 =?utf-8?B?NDJCRUs0R29VM0RGY3VaNkh4Z1NCSTRzaitsbWZMVTZmVytoMzFpM09XN3pp?=
 =?utf-8?B?c0J6di9YMk1NNlJZTDRQK29SYUJ3MDJXY1BxL3dEWGZaWTNBL2V0TVBKS1BO?=
 =?utf-8?B?SlZibFNXZ2VCNWpwRUpJRmxiU3BYYUsxb05oSFNLeEw5aVFmNFlMTktqczNi?=
 =?utf-8?B?WllMc0pPM1haVnRaT3B6cC9XTE1FMzlmeDJ0YWhJYnh5alVUNzh5MmprQ0V5?=
 =?utf-8?B?dnhEWjNJSFZQbVhuVlZwVUFHTUZ6UHZ5RVgxaUY1WWRHT1NnRkVLMGpWNnhs?=
 =?utf-8?B?V2t4R0pFRXdNZVV6M1AzOHFvTk4vR3lTOC82N24zV05xdDhQYzlXT1Rzbjdj?=
 =?utf-8?B?ZDA5LzlMc3UzZmFXNDVIa2dTL2t6OWtBc25IRGdvSEo2NWpMOGQ3Z3ZsWW9B?=
 =?utf-8?B?eC9yN0NLTXNOYWZXOEQxaE1RcWYrSUd4Qy9HTGg2bFU1VlZ5enVrVVBRdlNW?=
 =?utf-8?B?MUpKZjBjMlV1NXIxQzQ1YzlmcXBoTTgzZHFaRWZFa3ZTaHBLYlgwMzcxMjJu?=
 =?utf-8?B?Sml0UjBBTm1DaEttSXF0WUtKYXVxcVJXaS9TVWVKejVBaXBCcU9nN3A5OS84?=
 =?utf-8?B?YldXTzU4L0xlaFhzMUFVc2N1ZGVUU213SWJqbnB0cS9wSnNIbGJHR0xIVlV0?=
 =?utf-8?B?MW9tNTB1dTNxcy80MjJ4TS9qZ2RtanVraFR5dWNoNTMxa0JObGpvcXBjSWFT?=
 =?utf-8?B?MlI0eDhnd1ZENiswQmRCQllxOUd2cDRGYU54aktOdC9qWUQyRzZ1SVA4dW9Z?=
 =?utf-8?B?WU1hMVBZQUw4Zzkyc1pMa0h1ZG0vOVJEczFVREVwOXJwaHg4VFpBOWQ2ZjU4?=
 =?utf-8?B?LzdWTFlza2NsOUY3YkhOTitmL1h3OWtlT3krQTNyaGdONk03UFBmUFBYMjkz?=
 =?utf-8?B?VnlEb29sTEQ1Y2M2Z1U4anhjb09OZktZTmhvK25KMG9wclc0SkI1OUZVbzA4?=
 =?utf-8?B?ZjU3SlhXdFoyOVlLM3B4emdlTzVRV1MxMEdmdTF4enFsYTZEelZydERoUC9H?=
 =?utf-8?B?NUFCTHVzUnJ4alVTLzBwMm0ydzIwRitGbEFrUW53d0hCSU1OSEFORWtyUDAv?=
 =?utf-8?B?cVF6aU85Q0RYN0JyQ050bERTUVNIdFpjUFVSQlI1YUN2dmZTZG40NW5oUW9E?=
 =?utf-8?B?dVRmV09wM1kyaUlsclVSYjJSWHpTZG5SVVBiSFBnR2JKSXB1d1RBRzZ3MHBT?=
 =?utf-8?B?SDNMajNoTmViREZUZytxb3FDaE5waVFHbjZ0SXJlcXRZcGo2YWRBRVZQK3Q2?=
 =?utf-8?B?WW13b09EQzU4TFNEVTZGdmFIK1BGalhJRHlyMXU4THdSMno4bmNnSTNUc2Qr?=
 =?utf-8?B?eUVob0YwTTN3dUFzTWZCbzdobllJQzlvcTk3NXhVSm80WGRSS0VOV0I1YllT?=
 =?utf-8?B?cXM4eFNSWitJV1JTMndqd0k2VklmeGdmSGlCYjNmWHBWOVcwdEs4VHYyV29O?=
 =?utf-8?B?akdURWE1anhITjlwNjE3L2NYaTFRY1UwdGhzYmZPa0VtMXJDbFFvclFwZW54?=
 =?utf-8?B?VWIrNFJFRyt2cXBORmhUYmlTOHJsRjRhemdlZDl4U09DYWREZkJ4ekVaOW1p?=
 =?utf-8?B?RkZyeE9sUzZobWRLVmRWcUFyejVDNTJsam1WcFZJek9sT0F4L2V3YW01b244?=
 =?utf-8?B?M1k4SUFRY3psbmdCTXprNUF0RTZlcXhvM09PQmNxc3l0bW8ybjFPOG5xRzdF?=
 =?utf-8?Q?eTo5sEeLcOTgaYhwS1Wo/OQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53766302-41f6-4b39-8b7f-08d9a2d15392
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 16:03:38.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +77ZJGhrwFlwUXMgf7jGID1EhA9Elm/oQ+6fndxmIV+0U0tut3jNpiS+1LpT2AQmTNg5ryngGNWo1bwx7as7pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5302
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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



On 11/3/2021 10:55 PM, Jaroslav Kysela wrote:
> On 03. 11. 21 15:16, Takashi Iwai wrote:
>> On Wed, 03 Nov 2021 14:52:17 +0100,
>> Sameer Pujar wrote:
>>>
>>> The kcontrol put callback is expected to return 1 when there is change
>>> in HW or when the update is acknowledged by driver. This would ensure
>>> that change notifications are sent to subscribed applications. Update
>>> the ADMAIF driver accordingly
>>>
>>> Fixes: f74028e159bb ("ASoC: tegra: Add Tegra210 based ADMAIF driver")
>>> Suggested-by: Jaroslav Kysela <perex@perex.cz>
>>> Suggested-by: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> ---
>>>   sound/soc/tegra/tegra210_admaif.c | 23 ++++++++++++++++++-----
>>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra210_admaif.c 
>>> b/sound/soc/tegra/tegra210_admaif.c
>>> index bcccdf3..dc71075 100644
>>> --- a/sound/soc/tegra/tegra210_admaif.c
>>> +++ b/sound/soc/tegra/tegra210_admaif.c
>>> @@ -452,16 +452,29 @@ static int tegra_admaif_put_control(struct 
>>> snd_kcontrol *kcontrol,
>>>      struct tegra_admaif *admaif = 
>>> snd_soc_component_get_drvdata(cmpnt);
>>>      int value = ucontrol->value.integer.value[0];
>>>
>>> -    if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
>>> +    if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
>>> +            if (admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] == 
>>> value)
>>> +                    return 0;
>>> +
>>> admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
>>> -    else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
>>> +    } else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
>>> +            if (admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] == 
>>> value)
>>> +                    return 0;
>>> +
>>> admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
>>> -    else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
>>> +    } else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
>>> +            if (admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] == 
>>> value)
>>> +                    return 0;
>>> +
>>> admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
>>> -    else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
>>> +    } else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
>>> +            if (admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] == 
>>> value)
>>> +                    return 0;
>>> +
>>> admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
>>> +    }
>>>
>>> -    return 0;
>>> +    return 1;
>>
>> Hrm, that looks too redundant.  The similar checks are seen in the get
>> part, so we may have a better helper function to reduce the string
>> checks, something like below.
>

Thanks Takashi for your inputs. This would make the get/put callbacks 
simpler. But in some cases, for few controls additional handling is 
required (tegra210_i2s.c driver for example). In such cases additional 
checks would be required if the callback is common.

> While proposing such cleanups, I would create separate get/put 
> callbacks for
> all four ops instead using strstr(). The callbacks may put the common 
> code to
> one function. It may reduce the code size (and the text segment size).

With separate callbacks, the string checks can be removed. However for 
most of the controls, the common part is minimal. So there would be 
multiple independent small functions depending on the number of controls 
and the local variables are duplicated that many times. Would there be 
any concern on the space these local variables take? One pair of 
callbacks for a control may look like this.

static int kctl_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
                                     struct snd_ctl_elem_value *ucontrol)
{
         struct snd_soc_component *cmpnt = 
snd_soc_kcontrol_component(kcontrol);
         struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
         struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);

         ucontrol->value.integer.value[0] =
admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];

         return 0;
}

static int kctl_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
                                     struct snd_ctl_elem_value *ucontrol)
{
         struct snd_soc_component *cmpnt = 
snd_soc_kcontrol_component(kcontrol);
         struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
         struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
         int value = ucontrol->value.integer.value[0];

         if (value == admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg])
                 return 0;

         admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;

         return 1;
}


Looks like having separate callbacks make it look more cleaner. If this 
appears fine, I can send next revision.

