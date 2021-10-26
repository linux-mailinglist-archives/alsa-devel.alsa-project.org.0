Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3E43ADE4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 10:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D3C16E0;
	Tue, 26 Oct 2021 10:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D3C16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635236445;
	bh=Q5IgTN0RNhNNPPqhfhkb/s0CBN2fIxbuZy9BBFDJ6dU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rS91WxAFOUQthQMADsJvS3kgzVOUqp3rKDxsPxYUtv5FMXexnE1qnIv22Nepu22Pz
	 sh7vNO1I5gahS8TD/E8Phi61oIrzT6W0/FmnWgZDYj2ddbiJhILlkHR1YK1Zqgyudg
	 pFzti3Ftzx45hMyJiJXhRljdKSx2bubxaXhliTi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2976F802E7;
	Tue, 26 Oct 2021 10:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD459F802C8; Tue, 26 Oct 2021 10:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO, MSGID_FROM_MTA_HEADER, NICE_REPLY_A, PRX_BODY_78,
 SPF_HELO_PASS, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310072.outbound.protection.outlook.com [40.107.131.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 091EEF8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 10:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 091EEF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="a/WdE3B3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW200lwNIgFj2paDcI0/a9AKxdg2/6GjU70iqNbscymQ8GsgJ+jl3ZtFBNQWk8v3fmh56712hT8+r1cE4bvlab46O/OMUpKZV0kUGca7WQ45ELkn1va5emue6WGxlabyJM0CbjkwvSvg4q4SgiM6j4pjpeIfCulq6pTju47kA/V9+PP49sVGbqXjy5dirnRCcLUtDoppzeqxQPwCRI20qSWLvMO6XasPWuTHHFbv26Ru0js3znSLPmuJ/ZEHuNEUGEMvYSwG9RMZzMO0PrLJEr/5O9IwXFJGZX8B2lTPYpnLQJc66+J5lbgfFKfq7Jcxmcq8caLOWnCH0NYH2XnoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knyTDpmBpnro+a7fkZit1uEamcPVsIMPUsxixsp38TY=;
 b=XQAeIJ47Scwbm/wbKIqVrgIeVwj6/Iy0IfEZSjM4jX6ovXqb2/HYCc/O8Eu+25zInKizTRXNWnwDQKDl/czgqZXF6ie2/0z3JCZH1n4eqM+A0+s0CbCrAX50hcI8tFQuLkx9je8T7Kp8EVxaVhYlqBmW++nYgEItFDiba3YkvC7AfV1NZdzR4AzaYVH/S6XVjwjDOyurCB4ljfKRbXMkbk1KumZC2DcFv0CCT20h4t6oUtDtGzJ0nTpBmrKzRITO4XyUJdYbE9XulZASJJDBI840Bf43OesGYkrdfYH0E9t9m1uH0ZSxQ4Ptkrofsza+o0jyEi3DEgilqWjSar/m6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knyTDpmBpnro+a7fkZit1uEamcPVsIMPUsxixsp38TY=;
 b=a/WdE3B3xsdvxCDFHFgl1dIyoZqRhuWFr/ZHy0VhVSKIdREk/9Lu76vv3YkubPDZLnWA58jXlZgAP5zhPMov96qN7bJ4erS/nOSqo+Sm+H16HPi/gvI3mij/rwYrVVQYBOCqdoo9V0JO/Vfx8drxa9XuXpeHOT5y4RYaTMfVW/Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK2PR03MB4387.apcprd03.prod.outlook.com (2603:1096:202:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.8; Tue, 26 Oct
 2021 08:19:16 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6%3]) with mapi id 15.20.4649.013; Tue, 26 Oct 2021
 08:19:16 +0000
Message-ID: <94e7306c-8f62-184c-a64b-a6aab2e495f5@nuvoton.com>
Date: Tue, 26 Oct 2021 16:19:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] ASoC: nau8825: add set_jack coponment support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
 <20211025113857.3860951-2-CTLIN0@nuvoton.com>
 <YXaf8GGVtH0S9oAe@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <YXaf8GGVtH0S9oAe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
Received: from [10.11.60.137] (60.250.207.217) by
 HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.11 via Frontend Transport; Tue, 26 Oct 2021 08:19:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f35cc400-969e-4190-cdbe-08d998594d15
X-MS-TrafficTypeDiagnostic: HK2PR03MB4387:
X-Microsoft-Antispam-PRVS: <HK2PR03MB438701246184DB39E3910C3D8E849@HK2PR03MB4387.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBNCEs8TyZafXm6xZuhr/WB2/zXOsFcVWXK5wzHVZvFMYLJl40YPQe3AspHhFATQ8IlSpCL6f3/tKfHw6y4FqLvvQwUX1yjFjjKQ5gxWWc8C3lXGSqG0BgMyZL/NmkXLOMKIwwpPfAUI9VsV7UgvlYHbno/S6/JdYO6Asc+Y34KaGbeWaSk38uwnx1IHXG0oWCUnCjl883HecDD9CQpQCjYvLbakGP7z2YDjxD0QOlUvomVYm+3/4qZOUpnG3VKlyPD7ZQUsbqXgIHPUmXB7iUopXFp2GBld/7Tv1ahNMGN5zn1U4U910xF9vRJE7DhHtCFpOk1bNgtOEmEUyVGaIkPRoMqvPwknS2Vb2sktQrrRqXQIkR2GssfOSnpvl8Mmtp1Cf4B/ZrXp5TqTFBvGmM59sF+Wh44MiLn1+PDbtMmOuHvY73A3gQtIa3ebb2laALyHSumrZwoqCpXqld6VKv7l7H0RPKEUJ3Sz5phuerkXCz6oSI7GXwJGFQkdJrm6D3o85aGJt7yLaFBZQ6v7E8/ZjcTV2s9x5aY7BlxTFzYz6SoLa89g4EvKzddYi+VGj9xuDAc59JT7iuDG58mji5zBVbVUD0U3wy9pqdg92yaDvaa17a1MJweLd1s38XPhf4xD6XwAbssRrC9AliCPYqQOtcruYkvpZI1MLe0Blzjf8ApHxjlLomVBCWvdlsqR+UQzLwwr9oZko5L7m/ErK0r3d/CAKfhuBaklR/4wLtLwVbWL+K0Qx3r/RgC6R4OXUD+U1JzDRr9OJcLdIksOeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(107886003)(508600001)(4326008)(26005)(31696002)(6486002)(8936002)(186003)(36756003)(66476007)(86362001)(52116002)(83380400001)(66946007)(6916009)(31686004)(38350700002)(38100700002)(2906002)(2616005)(316002)(5660300002)(66556008)(16576012)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTQwN2s1eXlDVnZyOXA1TmM3LzRiSzFYRVBHN0pabnFRRVluMlN4ZzAxUzBL?=
 =?utf-8?B?TTZMMzdGMHYxelJmSkdXTmFZb1REbUpSZVAxbE5mTCtwUkR5VVNDQmVmNVhJ?=
 =?utf-8?B?b2lWUTF4OEgwM1FwbjVmUUlQSHZ2THg4WGxHdmQwakRmbnBZSElZYW5ncXlN?=
 =?utf-8?B?RkYxcndZbnZDL2trZkVrdlFJUmUvUG1GaG8rbGlNQzRpK0RqM1dTMlovd1VE?=
 =?utf-8?B?RDhVbnRSbW9WM294RUsrZmxBbllTWUYyZlF0aWlhdmNKN29HcVZWSGpiZnF6?=
 =?utf-8?B?NU8vdVNJbk1ZL0NOdGE0UmdLNXAwNU5NbmhoeFRHSHN1cEdlSVNTR1A1VTQy?=
 =?utf-8?B?QnlPYkNHQVZnK3dzeExsS1U0Qi8vdHdKdmh1SDlISTNBTUlCS0pIc2FhS05Q?=
 =?utf-8?B?NE9FNEI1dWxmVjdLVlg2YlprSEM3aUEvT3htMUg2Uk05NlJyV0ljUDRQZnND?=
 =?utf-8?B?L1RHNEdRT2tORXorU3lmQWQ1bG04d2dNN2VPeitsVXprY3VhMXFjVGRwYlNn?=
 =?utf-8?B?SzhCeWNIeXNsbzBsME5RaGt6Sk04YklablFQRWdxUG5zWXg2dFgycHpvdGtq?=
 =?utf-8?B?Sno0czN1a0xzaEZkK3VLL1Jmdkc4OEwyeXVzVnR2T3Z5WHJabnVpTGtTQ1pK?=
 =?utf-8?B?bVpFREI3RkNmOTMrcVFDYmJQVG9ZSW5ycW5oMmFEWXVwcnRBTFZSaVNtUXdH?=
 =?utf-8?B?OWlLeU5ibFhjZnF4M00yS05JSGo5Uys0M0h3NklNalk0WmdQUWxmamYvdXQ4?=
 =?utf-8?B?cVZDUC9zR1J4K2NHVTBqWG5Pd3lrVmgwMlN6c0tEeHNiZlNBeVNZSjFlV0lv?=
 =?utf-8?B?UmRPNWdzamVxd2hSUEM5MnA2eHlaNFkxL2hVMHRrVXcvRFkwS0kvYzk4Vk44?=
 =?utf-8?B?WnY0SVRqSWtBVFlhYzY2eU9qUmI3TFlNeWgzY1IxcVRnZHBLc0lDOXU5VzhL?=
 =?utf-8?B?Y3VuMDJBK3A3ZzFpZCt1T1FRLzF0S0Ezd3dmWExpUXQramdWemdpUHdJNGY4?=
 =?utf-8?B?Q2JZTkxzLzdmK0hhRWZOSVV3cUpJWDVRODRjU2xXZ3VTMUxEd3V6NHIvT2sv?=
 =?utf-8?B?bm4rSG94a2FzMUwwTVdWcE1WYmYycmh2RmVwdDdteUJKS1J1bzlzZ3VRTWFz?=
 =?utf-8?B?YXQvRXE2WXh1cnB1bUV2RzJlenY4NWNPWU9OdVNCUzNPNDVTVkdvcHNXU29Z?=
 =?utf-8?B?QVErSENCVkxVYVZsTHBYL2t2SmdpYkc0Qk1jSGpaOEp6a2huTHBMNlVLRWxr?=
 =?utf-8?B?MmJOYjFxUUNrS05vd1V3OUZ1WFNVYUo4RXBJQTBtRld3cXVxK0xsNFRoeTl6?=
 =?utf-8?B?Y1pMT1RMTjNSYjNzaUZ6STNvaWMwWHVnalhQLy9OajZKT1NQcDRTTEh3NW40?=
 =?utf-8?B?cFVqK29ycnhZSFFGTUhQajZ6SGJteGNraWVWbGp2YkNjK1V1RitRTTFUZEQz?=
 =?utf-8?B?dGtwYmxOckxGWDlhUlRGY1lxcHlJQ2pCYWp3RTkyYS9YcmtTbUx5NkdaMUZ5?=
 =?utf-8?B?UlIxdTdFQS9GWWVFK0JLYjUzZmtQaktEMFR1cVc2QTlwbEFEdDVpblRTNmhk?=
 =?utf-8?B?ejV1dEFmWDM4bkpyMzlrc295NTdxcmZBRjBGYnZuZUl2ekFwTDVOZEtKNkZ4?=
 =?utf-8?B?akMrMWVsQmVMQzIwekxtdHVEU0tLT2FTc3E1NzVXUXM5TjdVbzljck1veEJa?=
 =?utf-8?B?MFJRZW9NR0wzYUtDd1o1aXJJRWpXUXdnMWN2Q0NoMnRManBiTjJ6clVBSzFk?=
 =?utf-8?B?QVVFeUlSeUpJR0tjQ2VUcmRVVkRLWXRzc3dMRWxLWXByU3NJdHJOanozeHEx?=
 =?utf-8?B?eW40eWlnT3pyVmwyN0hQSnJIQm16bk05Q2xaLzBxV2Y4RW1UZ1EwK2VvRHFB?=
 =?utf-8?B?VEJLbjZkY3g0MUdRcVZOa0psQUpJYUJ4Ti8zczFjSC9JdkIyb3JoNnlNOEJy?=
 =?utf-8?B?Y3dCblBqSXZlcGh1U3Vla2pldnZsbE5DLzA4TzZrdHhpUHd2ZGtLQVdzUXBV?=
 =?utf-8?B?aXh5eHZIRUhxUmdhNjU1V3lWdFFndDMrbVJhdWl4aVhUUGJlMWFMcUp2aTgw?=
 =?utf-8?B?OTJkRndLV3lTVmNKMysxeStPc25ZcXJRV2R4VUVTS2lGbE16STFERXNIK1Nw?=
 =?utf-8?B?REFOeTZ3dGsvbmRmYy9HNnB4SDBuanBtdkNSSTF0NzQ2UTI3ZTNLcS9VRkhY?=
 =?utf-8?Q?eenh5S9CWjlDTHS1mDe/IOA=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35cc400-969e-4190-cdbe-08d998594d15
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 08:19:16.3341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW1OTIuQEY4ZGP9GfhM33W2yQQQq6pEHZyBSrXUphKkTfNGNpmxMZWyaV9ce+j3q47Xy9ZeyXtznj5a26OERLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4387
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

On 2021/10/25 =E4=B8=8B=E5=8D=88 08:15, Mark Brown wrote:
> On Mon, Oct 25, 2021 at 07:38:57PM +0800, David Lin wrote:
>> Use set_jack ops to set jack for new machine drivers. Meanwhile,
>> the old machine drivers can still call previous export function
>> "nau8825_enable_jack_detect".
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
>> ---
>>   sound/soc/codecs/nau8825.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
>> index 67de0e49ccf4..e7a6bd918be3 100644
>> --- a/sound/soc/codecs/nau8825.c
>> +++ b/sound/soc/codecs/nau8825.c
>> @@ -1434,6 +1434,12 @@ int nau8825_enable_jack_detect(struct snd_soc_com=
ponent *component,
>>
>>      nau8825->jack =3D jack;
>>
>> +    if (!nau8825->jack) {
>> +            regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
>> +                               NAU8825_HSD_AUTO_MODE | NAU8825_SPKR_DWN=
1R |
>> +                               NAU8825_SPKR_DWN1L, 0);
> This looks like a separate change to support disabling jack detect which
> should be in a separate commit.
I will separate it from this patch.
>
>> +            return 0;
>> +    }
>>      /* Ground HP Outputs[1:0], needed for headset auto detection
> Should really be a blank line here.
I will fix it.
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
