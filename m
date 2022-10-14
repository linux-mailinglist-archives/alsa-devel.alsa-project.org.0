Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089B5FEAAD
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 10:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82686417;
	Fri, 14 Oct 2022 10:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82686417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665736934;
	bh=/4159EjUtxwUSuxhfJxBONSgcrbRZKneio8Fh9dRMjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XacnE4WDH1WmFPqM2eLOjMYym1Hzim/YDE2nT5dasQMX8fSbnF1+4QLC3TTA4+xXg
	 zSQTshGm2y85j2yA5s4fcY9dd9burqaIm/Flliqylg2GOI+ibdShUfr0TS/+Unj48b
	 RjkMb7mhiWgqlUf7D4NwCz3tBGbizX/w/IYlGxEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB78F80240;
	Fri, 14 Oct 2022 10:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68BFF801EC; Fri, 14 Oct 2022 10:41:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2080.outbound.protection.outlook.com [40.107.117.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73DAF80115
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 10:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73DAF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="jJ5pdial"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/HT8EDHtfGi265+Vh3nAEX1sJLk/Nrzo531vY20Bq31L8Ae9p7MJkoHMFFdbX7RSGSqgC0ZALEJL+3TZ3tYslBNZHC1KDYbF2NvHCqnFuO/czJ963o1SRWFmoQbpC8LtPYJlgVoMHy9fVtHMT9rtrwdSRxuKnzLgsB7vif173lPvL6gNyjTdw7UUVDix/W3rKRd1HBke/El8LtuUD3pWBtV8qIkwvgdHx4dLVkAVPzed19tbxFZyvei3SpH4Kn61MUj6qFrXn9tJcSPPWZxnCGwy8hWMFemETJcVEDspynehe7ZuxbF7jw8g1MOOdJ3fHQq1Q/8tirSMPOL/D8vOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg0guDKVsk6FXdqz9lO8x++Vd9rEk3hJIKQIwYwI960=;
 b=bPKFZ5kQyVObuzsPCjOwzT/rXIJ34pJVVh8LgTlDgqo2Rt16u6g4YWU3SlQkMiIGEi1Ue7KiCpUEez4RVFQSYHBYNacRd7nuCIQ54/5Aik8E6bHSf4hYMBTcwjzba9oNBXQFFBJ0fXZMPjV9X5CVBY2BeZ/YWstMUHMcCSiKYJRsJyvAKFibYPk+xmUrYcqUXR92ZKb/sdCcIi27ZapE0eQw6Vcqsh2DQc0vYAE9NAqZsoBlLwh8ra07ngmOBfDckSuKE+0+DuoZEyf+dwjOlPZNjBEaDu/56BXMpzAtsaTLLoZMh0C+8Pllh0alvjnahJR5g7K+bVp4tnX0e76Vfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg0guDKVsk6FXdqz9lO8x++Vd9rEk3hJIKQIwYwI960=;
 b=jJ5pdialmg+hD5d68plIP0n/jw9m3cYJNJYBJrtKQQ6dRayzMnE21Vh7kP+6yHP2t/VWJWAIcyDPB7F/MJPVFxABBD95rGozTiJvAc7Z12mk9d47wi++o8jg9n4vvAE+FbNtre+ghaqDxI8fugdw+c2S4hmSk/Xg6ApcmNA7qiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SEZPR03MB7217.apcprd03.prod.outlook.com (2603:1096:101:ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.18; Fri, 14 Oct
 2022 08:41:04 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::ebd4:f34:d904:c405]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::ebd4:f34:d904:c405%7]) with mapi id 15.20.5709.010; Fri, 14 Oct 2022
 08:41:03 +0000
Message-ID: <48268f8a-722d-5ad8-be1e-fe87acadc764@nuvoton.com>
Date: Fri, 14 Oct 2022 16:40:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: nau8822: add spk boost and spk btl options
To: Benjamin Marty <info@benjaminmarty.ch>
References: <20220922134458.3421695-1-info@benjaminmarty.ch>
 <6fb90595-26f5-a779-7366-fa4fb9e86935@nuvoton.com>
 <CABSdY3+YjLi5jBxMHRSi-KyYuRwZYRGMBNUScDP7UNfak8Oxbw@mail.gmail.com>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <CABSdY3+YjLi5jBxMHRSi-KyYuRwZYRGMBNUScDP7UNfak8Oxbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SEZPR03MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: d95d1f97-995e-48f4-19d1-08daadbfd423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8K67qSqwYkhEzqLjcyEXnxF6um3UDDABgSKu6hd6wFPZY0FoFszjmykwDNgfs+JnL/2pYqNdLyNwFm6QYSGXrEy44KrQZhZzPO5BGRypiJWdmeiGQoK4+WNw19n4NhUi/v7l4jKirgHwHYFUFo5CLS2I1SMBCJA0YkQzoz8oxLb4OF3JxsY4WyvEkqsT/xnUWcSdcMpYvxdo5icZg8y9BOWTn2xYlcSXa716oJz6QqiF82//vQPBS/+jfCDNpFX4sj7AZqd0/VoHU1wPgLVh6IEsiWl+UFxgtt3dJy70rTVMy9Nr5bhyqqpgWKk0wvwY94dcqNKhcNnjfXAsgN+Bz0nJAIOH7N0zloJjIQAW22fPyRsYvhjNPhqjJTqc6zls5tknX++iOPFa8Vz3YqofibVsHxkg99K9FP2uD0l7vzgAiFNMZgVf8zyuDsw5l0+vE4xUopdBsfKiH2Bi1OyFsbD/5v+CqucpEzq5tI7gNmTCCQ0fiIhNN/YCF0Hfm8kN6EGua1APUCzGwJaVF8xF6BU1wFHVnto63CidHoQS41Le8DG4W/Q3C0q0OWCRq8STg4ecbxjK5gG2ET5h0/Dv5a4/JM17Zz/3WQVaqwSpz/bbOzUIVEJZ3LnHfsLy+AIgtJZvgW2PEIJ360Yyrd3JpWzHQXedfR0j66KMuYSBKHyDnRGS/stePKkLc39DHz3hAXyVHRZFIc/pT0IXbgRg1DI+hUM7gB+HC/XNTvC0CzaBXxb9pcQNly0wsZgso3kcZ+fo4WMcPp/ditRAPIUF99Gby0fsXOJg5OTonEgCV3F+xmlvpp5Dm0svXAWMpX8jJYVz+5McYW9Y0tITcw+B/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6732.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(316002)(186003)(83380400001)(38100700002)(2616005)(38350700002)(8936002)(5660300002)(86362001)(66476007)(6666004)(66946007)(41300700001)(31696002)(6506007)(6512007)(4326008)(2906002)(8676002)(66556008)(52116002)(478600001)(6916009)(26005)(6486002)(107886003)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkxFZjFiQmhOZnRrNHdRUWtDNUdneGZZdVVsZ2xMUUI1TmRSWXU4K1grTm96?=
 =?utf-8?B?WjlJbmVUQkh6MkxTSHZYNjQySU9IV3N1Zm5yMXpIZUorQWxja0dNSnlLWDRx?=
 =?utf-8?B?MCtCYnFjTktjcEVOLzlWUHY5SGgrRTg5QkR2TG5pQU1sVVFvK2cxS3Rpc01v?=
 =?utf-8?B?M2F2azBmMTVlNGZVVjNqZGtMYk1VTWhNWUUzWGdFc0dQdkEyVmhkazBwNVNJ?=
 =?utf-8?B?dWtZTVgzU3VQY3dNNk5SVDhoVkxOeTJUSGNVaHlkdSs2UFI0TURZemRhVGRi?=
 =?utf-8?B?N1pwS09JZ0JRQ0ZSKzlWaVJXdGg3bnMzY1ZJTHg2czh6bEtYT0dZUmJ2N3Zu?=
 =?utf-8?B?N0lHRTN4dmhKODhUU0JhRHhpYm5BNXZVQjVySzJzc0FENyticlNjOWNTa1dL?=
 =?utf-8?B?cEVLQW1EWFBFRytRTHdGYU1TTGFjOHFtdG50Y0grVDVGTnlmNTRQTGtjcHNv?=
 =?utf-8?B?SGVBelNpeFcwYzM3VFRkNTBaRWFQKzdWRjB6UW9yaVJqNml5eXhXTUVnOGx5?=
 =?utf-8?B?am9sWlRGUHptSCtmYmp2SnZpSENJd04vMGJHb25oU0F1VWVUaHpKNmUwUzMx?=
 =?utf-8?B?RWtVbi9OSnVWWEpiNXFBTGpLNWFLU01wTjBGMm42dm56eXFjZlg5MnFwZXF6?=
 =?utf-8?B?U1ArZ2QwUFg3Zy95ekxCVzZaRHJhaUlKZ0FPcUVoNWh4VDRDSlRLMmUxelZo?=
 =?utf-8?B?bUhMcmZMTkZVY2drSm9OZzI3bGhsa1JLRVBLOTVhUkF0aURkUDIxNS85cHNG?=
 =?utf-8?B?bTYxNzc1RVFmUzBocFFmNE56Vm11TnRxbVVkSkNWU25hdmptd1Zqd3BsVThZ?=
 =?utf-8?B?UVNYTFM0S1NzT1Byam5HZkcwREMxV0RINWFjVGRRM3JqbEt1eUh4emVXaCtj?=
 =?utf-8?B?bE9BQnR1cXNwd1hmVkR0M25zVTkzbGtER1g2TDdvMWpqNFFOTXZYbUpCU1Y1?=
 =?utf-8?B?RmJGZjczVUswWVdvWDhYVGNmdTNEajBoMEEwL0JpVXI2ai9ZM21kWHBMTTRB?=
 =?utf-8?B?RGxPS01CcUEyRVpzRnlKWjQrSEFaOVNQRE9aWHF4TDYrNFRBRW5hdjlscURp?=
 =?utf-8?B?UG5ZU1BDNWRSTmNUWWM4ZE1QMzV4cjlETTlob1dLbTFmSXVYVnIxRVltU1pN?=
 =?utf-8?B?RXZkZzhKQitHVmlNcGRKSE5jVUxmeVZJMmZhNVpmczhuT2hOTjNFQmtLN3g1?=
 =?utf-8?B?cmJJMjFXNUYvVFhFWXY1L0VDdHpLdWpwZXMrZmo3a09GanpnU3paQ3gydHVG?=
 =?utf-8?B?bHVlZzVsdWw0ZnZGcUwybjRiVUU3TG0zalNwZnAxNkpYeTRBdXNoZ0h4cFZq?=
 =?utf-8?B?bHhER2kySktWMkx0Zy9NZzMwWFFORGh6MGdTL0d1RzY2UGM2TFViaE81UzV3?=
 =?utf-8?B?RXBUN1llU1hRa0ZVekJuM0N1cTF5Qm9Qb0FuOExDZFNwUVNEYUxER1loL1gr?=
 =?utf-8?B?dnBUKzlvSEw2N2xaMmxsRFhYVTIxZlAyQmUyR1BGMFpvb0NCY21GeTlUOEpO?=
 =?utf-8?B?NVA2MjF6djhTSEJKSjRjVGozNVpLOEZtbnExMnpLcjFqRi9sK1Q3cFc1L3RF?=
 =?utf-8?B?cG9HeW1jdHJPS1hTV3B3Vi9DMGNNeXQ1V1BUeUlHV2FDWHJLQUowZms1dU1k?=
 =?utf-8?B?UDBJVXI3Wkc5YzZoWnZlNmk5c25BdkFtWEJySlh6djVjWm1HL1RpK29Xamt0?=
 =?utf-8?B?TGNvd2x4NFFyNXJVamo4MzFPeFQ1NmsyMytLeld5bUx4dm5MYnVUaWNiRE5H?=
 =?utf-8?B?UWczbzZ2TUxjSFJ5cFZkT2Fha3hCMm85eWZCRE84dVA4aFJ0d3FKL2dGbWth?=
 =?utf-8?B?K3RaUUdqb29ZQXNVTUdaZVU1ZGVXNloweTl4Q3QvS2dQWTBPQnNUY2ZwbVJk?=
 =?utf-8?B?TzR2VzFIWFFwcWZiaTFBaTJ6KzlJVHhFSEFrVlFNL0wxQ0VHT0VZMzhMcjJx?=
 =?utf-8?B?MFJzT0lSSUZWQys4QmpmZkVWaDRTbjhva08xc2NsZFd2b2JlL1BwUmlmTWsy?=
 =?utf-8?B?Y0JWaUlFcFRERHdhOCtCSjFnREFWZTlyZE9qelEyT3ZuUTYrbFFpK1VjTG9Q?=
 =?utf-8?B?VDREZGJadEpUSTltYUdQaml4TkxRaGJtWHkzUjNmYW1hWCszNjRJWjRLU2h6?=
 =?utf-8?Q?+vak/gL9/du4Q2tHbo/LZuM1J?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95d1f97-995e-48f4-19d1-08daadbfd423
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:41:03.8430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 558bUu3tZqU1Mjj5Cu2cACL9pH9t5eKQojfBPybVXabD+bHhAozA+CoQg3wGXV3MolfrOSa5hzUvbqIEK9zoSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7217
Cc: wtli@nuvoton.com, alsa-devel@alsa-project.org, kchsu0@nuvoton.com
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

On 2022/10/14 =E4=B8=8B=E5=8D=88 04:32, Benjamin Marty wrote:
> Am Fr., 14. Okt. 2022 um 10:28 Uhr schrieb AS50 CTLin0 <ctlin0@nuvoton.co=
m>:
>> On 2022/9/22 =E4=B8=8B=E5=8D=88 09:44, Benjamin Marty wrote:
>>> These two options are required to use the Speaker output on this codec
>>> to its full potential, when wiring up the Speaker in an BTL configurati=
on.
>>>
>>> The Speaker Boost flag is explained in the Datasheet on page 80.
>>> The Speaker BTL flag is explained in the Datasheet on page 78.
>>>
>>> Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
>>> ---
>>>    sound/soc/codecs/nau8822.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
>>> index 1aef281a9972..812b8254f9a0 100644
>>> --- a/sound/soc/codecs/nau8822.c
>>> +++ b/sound/soc/codecs/nau8822.c
>>> @@ -379,6 +379,12 @@ static const struct snd_kcontrol_new nau8822_snd_c=
ontrols[] =3D {
>>>                NAU8822_REG_DAC_CONTROL, 5, 1, 0),
>>>        SOC_SINGLE("ADC 128x Oversampling Switch",
>>>                NAU8822_REG_ADC_CONTROL, 5, 1, 0),
>>> +
>>> +     SOC_SINGLE("Speaker Gain Boost Control",
>>> +             NAU8822_REG_OUTPUT_CONTROL, 2, 1, 0),
>>> +
>>> +     SOC_SINGLE("Speaker BTL Configuration",
>>> +             NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),
>>>    };
>>>
>>>    /* LMAIN and RMAIN Mixer */
>> Looks good to me, thanks.
>> But please add the right maintainer Mark Brown <broonie@kernel.org> for
>> patch review.
>>
>> Acked-by: David Lin <CTLIN0@nuvoton.com>
>>
>> ________________________________
>> ________________________________
>>   The privileged confidential information contained in this email is int=
ended for use only by the addressees as indicated by the original sender of=
 this email. If you are not the addressee indicated in this email or are no=
t responsible for delivery of the email to such a person, please kindly rep=
ly to the sender indicating this fact and delete all copies of it from your=
 computer and network server immediately. Your cooperation is highly apprec=
iated. It is advised that any unauthorized use of confidential information =
of Nuvoton is strictly prohibited; and any information in this email irrele=
vant to the official business of Nuvoton shall be deemed as neither given n=
or endorsed by Nuvoton.
>>
> Thanks, how can I add someone on this existing Patch? Or should I just
> resubmit the Patch?
Yes, you need to resubmit with right maintainer. He review/apply the
patches from his inbox. :)
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
