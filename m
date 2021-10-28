Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F243DC9E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 10:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C9116C1;
	Thu, 28 Oct 2021 10:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C9116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635408214;
	bh=LUGdIuKkF9FUQxpcpjrbrk6fZwLLiGwem5vTx02UO6s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+sa8y0bVN5SQ4ifHPuaMhr+EXmBfn5oTfUoSt10oRlY3hWRTgOfOb32f11tnYN8L
	 qeb6ErHiP8SUxp10gePk2ATeDyz/lkXw14Q3AvbLKvaCVdhtxzT9eB/Y1wpqVvZ1YK
	 So1CGgzwg+esl2PJCkgVKdJSYkNIw+Nu+DruCz9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E662F802C8;
	Thu, 28 Oct 2021 10:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DB92F802E7; Thu, 28 Oct 2021 10:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320059.outbound.protection.outlook.com [40.107.132.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE677F8014E
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 10:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE677F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="NQ1oRrAx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRMGMPO2ZjIa0YtDDgoJle9XJIYkxTxE7EeNCdp+9FLO+vEIkiODWOPdBFp2R53SSuBAcNMsWH06YTPimnVR7xSo1Dw+bVrm4gbibXGuW44SqcF46V0aWLT+xrWYr+QRF/VlH2JRbBDObIt0mrpGbXDBXmQa2dTN0eL9LWYV8xOIdOftO85Uas1+L60OarIN2pWE9hQbUa1iO/lWoA+DeamguOKND2hUgHNcH2LUGq07Bxq/DXM3TPyzFQ8EEv8ePsfRQW9m9F78g5faB222cI143hiu0YN0x9indd10CzSEQzq01ycjsFi1pGPcejyGX0Chl0hsGqwzFBOawHMfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM8MSK9bs0hvq2pX+3o2F8eIU/soYLG0W5jsOV+q5dw=;
 b=Ux7o55qUluPPCwdtlcZZmd0vuw24hYlbU4h5e1U1QnWQd1uFULSlZdtLe+1B2KFDLCK9xlaBxAdymdPO5EOqgMps9HY+U6Y8E2QX1VPVFRSNK9ZON9ZLYYCmYN1ne0RInkmbFtQ9pZGa3fICKASSFrJiqPCGKcsZkHp4BlhwOnfQWZ8TOTB/TvYRVz+p5QxfBCjJksQqZSrdgeP7kP6nmPbD9dujp1dgYeoINkVo1Az6h8l4wAS2Fvmc7ZJPXmQHXLszfgPPslb834ilh9gH3Cpd2plLJ4FGzn05r7FB72Zq4qmrnDcuqrFCM+ABr4IL5pw/fiOk0igVOqzlsp/aCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM8MSK9bs0hvq2pX+3o2F8eIU/soYLG0W5jsOV+q5dw=;
 b=NQ1oRrAxg4EcYSN6pVcMu/tSgZAHiWeDebFUVfFjiSdqPnt9XmdX56phzOLl21YpqqZWPgWPA+QOj0QJAdqNCAKdv1B4pS7Sj71XuH1TYGukEY24KIOaPIR4p6r1bgURFV26Ht8Qyt32qT9Qw4TtMWPqyPvNg1CfSLpQCtOOzEQ=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB3554.apcprd03.prod.outlook.com (2603:1096:203:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11; Thu, 28 Oct
 2021 08:01:57 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6%3]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 08:01:57 +0000
Message-ID: <57a15bc0-b379-caeb-a70f-e111358826b9@nuvoton.com>
Date: Thu, 28 Oct 2021 16:01:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] ASoC: nau8825: add disable jack detection support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20211027025142.25898-1-CTLIN0@nuvoton.com>
 <20211027025142.25898-3-CTLIN0@nuvoton.com>
 <d581eb7a-cb61-0604-fb51-d9181d3eced3@linux.intel.com>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <d581eb7a-cb61-0604-fb51-d9181d3eced3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
Received: from [10.11.60.137] (60.250.207.217) by
 SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Thu, 28 Oct 2021 08:01:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dafe31b8-73d5-4d5a-8897-08d999e936bd
X-MS-TrafficTypeDiagnostic: HK0PR03MB3554:
X-Microsoft-Antispam-PRVS: <HK0PR03MB355431296C86FDAEF6CF1E7F8E869@HK0PR03MB3554.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InBZiyilZpc34tjDF65cun44SCwvX3zyla6EHc565ldoA/SenzRsnwxzAgjlXMMN3PvRKmnIFIgKHTpyYedxChzF97lDrtRe9sEKuxBrtLu6D1Izl2lYsyiT0BE+xO/RKxCTXwHMok2ZfJJwfBWY83ZjWMMGhM/NVyAHAVE4R/o5Ej6o8NOfvLBZZTu7lYfsqeAVs0H7Z2E06nRH5zAh10KY91GlLbyKJynJYYRouZ5SUj4JpfJM88rDfDpLkXzvIMpflyVw7sdrUdVn3I8eCdCsGdkRPBANxZoN0KubD9ek5fx0SLNaapgw1z2s8mVtLR1dDeSL8N/D4t27Hr2+d8LVH3wbnnv+CD22o8kGyksjbrhZeuYaLQFPR/rNy2h82F5ewWH9kPtLJQ8VyLaCVTuIeEp/WxMfbmbqNne5ABaUz61SN6W6J42HCOS0YbBJOZeGFte4riNzNdZDwonvtW3BnRk6LkVLWEVoSNmQfmue6iNLyTi1T2XfwMLMtCi/kaar6a3jcxYrFYT3HK77E56orGUCv6Q4Vxy1cNKbA+GpSAtBUQ0RKAJpR7eO4w+cIsgSEdbp8U+3FGi64Pputgv3oSK2dAS3DtGldoTnyJp1DZ1Fz7iNBH/07v8j58QZE1d9bHuZNDXjy5IG0jZ4t/Hns9zrXE/hGmVv42I2qYe1imGKgA953MwFTX8GprbyX6i/uQRnInTgnhupwhgkea6CtamLTYUGU1bwZQfOBVYW+9Og+ivb9f1+nR2z4OggUu4sb8XARyioMZWIfCS8bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(5660300002)(6486002)(8676002)(31696002)(16576012)(26005)(186003)(2906002)(956004)(316002)(31686004)(2616005)(66476007)(8936002)(52116002)(38350700002)(53546011)(83380400001)(66946007)(508600001)(38100700002)(36756003)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFNNW9idVdFaXpBcHo1R0lEOUN1cmdCcTBObFQ0RGR5aUpLcUIyZ252d0NP?=
 =?utf-8?B?N0lUa3ZUMnZIM0hsbldpVEZ2MGVNMU5MRzhJRlBPZFhQM3lCc29HaXh5WDNX?=
 =?utf-8?B?SUZUZHgybEFiTStUaXMxYnFwME1HWlQ3TzF2aU9oclQrRUtmcFN3Y0NKTVJM?=
 =?utf-8?B?TFl1TFZ1UVJRckphWVJLZUhrUTQ4dzRxaXR6R1ozNEFNdE1pOEFPeTVncFdt?=
 =?utf-8?B?ek9kdlNmRnhpZitqd3RyYUEzbHlKMGx3dlA5R3JkU0pJTEtlLzhDQmJCaldM?=
 =?utf-8?B?dEIrTkVnZmhTZGFwU3VZTDVJbFZkYVpMNVk2cHdJa3NPa0pRWVdsU3pLcldx?=
 =?utf-8?B?VjBIN3J6aTBJME9xVHZLWDFVVmp4K1B6cXJGSW9pWHBCakU3Y05BVTdHQjBF?=
 =?utf-8?B?c1FmT0lRQ1p6YWpmSndmTU5TVG1wek93M3RBT2toMURRbldLRDVNdUdrdDFE?=
 =?utf-8?B?dEE2TlhVekdFYUpPNEtKTXdIaDUvclVrNCt3S0NGVlptZ3RRREpGR2lKSmMv?=
 =?utf-8?B?YzZ6UmZHZy9qbU90V1ZCN0JWQnY5Vi9xN2lmOFptS2NLSkU2M2RMczBZUGVX?=
 =?utf-8?B?UXpHZ2pDWU5pU0M0ZUFmQmttZnpnczlXYWp1SnhGTFlucWFuRS9WbGpKRzhu?=
 =?utf-8?B?cUpmVTZYbXN6OGdTNi9yMVVlR2F0VG9sRzd1MUJvamVmeUlKQ3Y4YVZDekZV?=
 =?utf-8?B?cnN0d1dCWnR1NlEzT0FvSndjS1l6enBRQlZhZzRMZU9STUdZeGIzdW95dGdM?=
 =?utf-8?B?RksrYVdmQmhkWlozSGtzL29MdmROWWE3YVBlU2pwZCtrc3owbTRRUW5Ob0FR?=
 =?utf-8?B?YVkzd2xTTTY3YzNyNnFrMW1LWDMwVktXak51VDlkc0ttS0pTaFB5d0F6bUZh?=
 =?utf-8?B?WWR6cm9LYnFHb0JIUEJRZCtwN2w5eXpTbW50QzBNdWtpaVREdWZRWi9FSTMx?=
 =?utf-8?B?UUNOOHIvejFhOTVXbXh2SkFaaDBIeTI4cWNFZVJaMHlSZzRBMmFXVm5wMGY2?=
 =?utf-8?B?SVFhcUdQZE54dEQ0cmU4dk1HelRTV2JVNlJwT2lPaVFVWTBBa080SnBxVVpU?=
 =?utf-8?B?NFMySmVEa0J1YzI3U3NlU1EwV3lzZ3Z4cGRpZUxRMGxUZUt4WUJHb0twdmRS?=
 =?utf-8?B?bUg0YkZBTGVDOFBuQkQza2I5N3o3bGxuUmMyUnR2KzdMU2V5cm45TEJRZFN6?=
 =?utf-8?B?Um9XKzB6QlA2cnMzMHVKbzlOYy8yYlZPNzdHcG9OTEFDQ3d5R1ZQREtuU1Ns?=
 =?utf-8?B?UEZCcXdoYVdsL2NCRlpiQW5YU3NvMmpQUjJhaEY4OUVKbS9BUGVQYUtVNVR6?=
 =?utf-8?B?UGNjNHFpMHJKQUt4OHg5QndDUHVMZ0l1QWhJeElrRm9UTHZ2clJSVEN6Z3FK?=
 =?utf-8?B?V1kySDl0bjFldkVjM3lNM1hJTGRZVnVYNTJHaisxcldkMlJiUGZ6Ujc5WnBj?=
 =?utf-8?B?Wi9ocCt1dnZDa0tqSTF2VFVOVkFZRW1UbTR5UEx2b0NaV3dSV1JEb0ppei8y?=
 =?utf-8?B?Tlg3MklPa2RNZ0hvdDVRYjdHcWRSWU41ZTMzdW94WXV4N1dlY2crZUxNcHZ5?=
 =?utf-8?B?ekRkd2FCaUUwM3Z2bEJ1ZTZTNFdMZWhHSU5SaS9tRlJjcy90WWMxN1M3a29Q?=
 =?utf-8?B?eE11UzdZa0xFSnFoR3JRUU4wRU1qQWQ1NHBESGFycmpDNUhCdkpKYitGRUl5?=
 =?utf-8?B?OHEyd0JtMUszVUFvdkV1T3IvamQzU05xZ2ZZZ1BvaE9zQ2dXcnFXeWgrNjBL?=
 =?utf-8?B?TmhHb3pYOVJJdHVNU2c5aG4wbVVWZzZRcXprbytsaExBNWtnVWV5RjJHMjV1?=
 =?utf-8?B?dG5zdmhUOTZuVnlkVThtLzgxcXk2T3NFdGpCblN6RTd2OWNqM25SS0tSQ0Zk?=
 =?utf-8?B?ZmpVNTE1b25VcWtub0ZOTTN6ZmlBOHhTeHRTWVAvL1JCcGpnV3h3TFhicldY?=
 =?utf-8?B?TUE4YnJQVCtZdkYreFNjZld0ZEd2K0twckRnMUNkNFFUWFJtaXZYNWZTcGZR?=
 =?utf-8?B?MFpVRm5oUXdsWXZsRHBYRnU5a2huYmZxSDJETmVzNGZPSWhnZ0dTMkJac0ZD?=
 =?utf-8?B?eVlkQmhPYmlJS2pGN0ZCMitqMTI5TVlUWVJkdmNCNjFJR2FjaUo3bmUrajRa?=
 =?utf-8?B?UmQyVHo2b3ROZnUyYzhRaTVBeW1WRUMxckNOZElWK2pmUHU3NWtYTXR4NXFL?=
 =?utf-8?Q?7teEpe0B2aV5SE7YT3ocA8w=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafe31b8-73d5-4d5a-8897-08d999e936bd
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 08:01:57.5885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhC+IqQimdSrL7+I1CRtXWW5a6kn1dnCHmS26MIzgKMNheGhOA4fmRFmbAwsezshpOphn0iomgIPF1kDVvbt7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3554
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On 2021/10/27 =E4=B8=8B=E5=8D=88 10:05, Pierre-Louis Bossart wrote:
>
> On 10/26/21 9:51 PM, David Lin wrote:
>> A feature for disabling jack detection support.
>>
>> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
>>   sound/soc/codecs/nau8825.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
>> index c845f19b7c41..a356f26735bd 100644
>> --- a/sound/soc/codecs/nau8825.c
>> +++ b/sound/soc/codecs/nau8825.c
>> @@ -1434,6 +1434,13 @@ int nau8825_enable_jack_detect(struct snd_soc_com=
ponent *component,
>>
>>      nau8825->jack =3D jack;
>>
>> +    if (!nau8825->jack) {
>> +            regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
>> +                               NAU8825_HSD_AUTO_MODE | NAU8825_SPKR_DWN=
1R |
>> +                               NAU8825_SPKR_DWN1L, 0);
>> +            return 0;
>> +    }
>> +
> oh, so you've addressed my comment from the first patch but it might be
> clearer to follow the flow from other codec drivers and test the jack
> argument at a higher level, then you have an enable/disable parameter.

Yes, I understand your thinking. You consider more clearly logic and
readable for overall code.

Your suggestion make me with one target follow. I can do more plan for next=
.

>>      /* Ground HP Outputs[1:0], needed for headset auto detection
>>       * Enable Automatic Mic/Gnd switching reading on insert interrupt[6=
]
>>       */
>>
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
