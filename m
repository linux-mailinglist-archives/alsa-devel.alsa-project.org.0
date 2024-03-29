Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6F8911AC
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 03:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D1F2CA4;
	Fri, 29 Mar 2024 03:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D1F2CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711679727;
	bh=OIePndvSyyprYb17dia4uTH5+8p6EuSdGwRB/xrsmY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V1CxNgdn6dk0C/+3k9tCihKprw0QOj1SG4TkixmYVhJ5yWzftNHKpDRG38zlAd4T8
	 hfB/xzLa5TqL+512js8JDo7BeaiySLR+LOu5DssUGSCieLvMW2uw+3f1AS6gl3YYYm
	 GxyIvSSBVi5YmYvHc2pW33AzZxLJRCgmNMa+WH+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F69EF805A0; Fri, 29 Mar 2024 03:34:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC896F805A9;
	Fri, 29 Mar 2024 03:34:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2507F8025F; Fri, 29 Mar 2024 03:34:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81041F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 03:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81041F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=SN24QFMi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z98HniK+wTjQbSUd6jKjO/ZPgqM6EPcTStv+XRkqOfWjw+6vAiJcumHg1U7xu1tnK0FnNKOngW0mmZ6Bl37VsNwoeERVoPpiu5K0PpYWIbxk5mg/VCaDvYLnejFSIz+oKmExAj6CtSLAR/fVKuyVrDzWuRtyMZ5GVmjjJeP4sG0k8pfAB98iRlv4jtVBtFNcjWBHFPkWnHkEw8XZBb/WtR2MkChJT2cqSo9VZuGSWjgzSvDEp/7MeNQGxFKl1CLwQ6ir8ZecoCB/3SKYcb6yr6Vd6ZfmGHc+NP3ScWbRvLjrVhL5TpUqenpEyJgo9U0rAOIjf/F4yS83NED7ME8U3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrE0fmxFheNCBGQ8Uz0ltSf+krGZM3MnDHd0IlYqHoc=;
 b=H1wMixhttSseTCluvqcpHAM2eQeuHIqcwLNYUvvtqwieBEfe+SbmVk6yOl6dCNJE5/rdk8U9aHQreGSAj57onSih2G12yAVuvXy1+d3raDgdfD+2TRfb4CL1Yp7ZTLRr5p11LhCxdg1Rjeumd1w7wVGmYWX/evS1XlrEsVf4PsJ5o4FlNh6dgNtiycCWtZkGYi/VvgVrP7e/sZ8RdKQJuHUu3d1kyHw/rjEPBVqelhZBSJa855yUsrlQ69oNXYCaycPyXYsgFNtXCai6gUykou2v5ZCUa0ww8UDmNR/wpRZ105ZMgAIp3fcqwElFhBqp96xSUYaG8YhgAwhk18Jpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrE0fmxFheNCBGQ8Uz0ltSf+krGZM3MnDHd0IlYqHoc=;
 b=SN24QFMi3ESdv8JPNP0iN9MX+Ep49FS/GcRbMCtcca+Z00AVpLiE8lTDKRv3CBZq0SWM9P1b4tEE9hvwwOL3VBgP3i7DBqz6YN04xunqJRgNWIF8kWze75nUhMm9bPsNLm/zv75riiFeZyeLKrGq9MmWqUcYqWA9y8+YWhuP/Uo=
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com (2603:1096:4:235::7) by
 SEZPR03MB7657.apcprd03.prod.outlook.com (2603:1096:101:130::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 02:34:31 +0000
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e]) by SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e%5]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 02:34:31 +0000
Message-ID: <779c7084-e4a2-4100-b9ff-f7f6a37d9039@nuvoton.com>
Date: Fri, 29 Mar 2024 10:33:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] ASoC: nau8325: new driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 YHCHuang@nuvoton.com, KCHSU0@nuvoton.com, CTLIN0@nuvoton.com,
 SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
 dardar923@gmail.com
References: <20240327075755.3410381-1-wtli@nuvoton.com>
 <20240327075755.3410381-3-wtli@nuvoton.com>
 <8278611a-a46f-4d5e-9861-67ff1084db50@sirena.org.uk>
From: WTLI <wtli@nuvoton.com>
In-Reply-To: <8278611a-a46f-4d5e-9861-67ff1084db50@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To SI6PR03MB8987.apcprd03.prod.outlook.com
 (2603:1096:4:235::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR03MB8987:EE_|SEZPR03MB7657:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bjSmlmvgdl/rlkTcZfutrgFYRui+te3Lbvojkn2R5fIl73ocCWDIlffypItp/TyZFLkPU10v5FwKcHv869S9YWpbt6DL6kwRD+9L3+2DVs8BrqRM8W4JHukoKAJlpL6PPohyE3Mdb41VqdeJUfEofYEcTv5eOFtdv/uIV0KIINI353ne8aH039uZ0VQ5JKSf2Ib10XOnE+QaWPIZnNxPBizru9SmhxCwJCYtVtm9Q5X9Q0rjsHrcBGOdUGr7LsVZUKgrOUo7qcuOqvPrKMzRxZlZpDa72PQRDtM+0p2fehG2WVAzY/YL5brbH2sILWxbTrXxX7tI/xFlthC8q1Mn9rj3PF0ffe6tSJBw4kEQtFAE0eUTfBdGIST7Tmu8guHRgD0dvmESpFtyt1Hc0TWR8QbkUGrqY9Oe1QI91lWh02OhPZy8TFDHtkzaTGjguhbx0AJa/0OK40to296zZFtIAqsqLwUJe1pAzqbDzd6T5MjGQNBu7wBPXo8LR/3C15UHQ2/MbIgbt/M1OBpyHawLqEzOXTgEKwTAYRf4er4mImqEvVvA8BYp3SMhUJ7CC4a8rySSdWHlUmDsT2++r4JAYUPdWVLWoeHpbDA+hFJk1pgb26iB0eml4VSS0yvwv0PcjaMRo7ABxP09KuguQD7NyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR03MB8987.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0pnYU1RMGdmZjFpLy9ROFNoUlZNamVlVmdQY0kwNHhySlpPN1B6cUUvMTZo?=
 =?utf-8?B?Z05TYklpK05tOGw5VWRvYUp5U0xYa3A4b2h4anRKclduU280SEVXbGZXS2M2?=
 =?utf-8?B?dG9EYTAzYVVRSm1xZTY2MzBhdXFJVDZaMnF0NC9rWWZrMHF2RGMwMEd1NVJI?=
 =?utf-8?B?cGJab3RiSldSMER0SThZQjV0bHdTVjBrR1ZoakpHTm5TL0VjWE5lb1loZW43?=
 =?utf-8?B?bzQ2aDc1KzFIckMzQ2pEUS9qQWlKQkdjbmtwNTZxTm13R0ttN0JSbTRHYml0?=
 =?utf-8?B?Y0I3Z1IxMDFtcmRSQWNxb2hGYWt6SE9wNDI2K1F0SUhKUnRmbnQrWnVZZFpH?=
 =?utf-8?B?cGlvSjVSU0txbjhvaUNaMTJiVmhaUFFVSmJlak9ESU1ESW1CMEsvT1FLWlVy?=
 =?utf-8?B?ZXVyb21hc21SSjVjalZFcE5rNTEvMjJzYnkwdDJMQm8wdTh1UmdIb3BlY0Ew?=
 =?utf-8?B?ZXk5WXpTaW9XRVZpQ3F5KzhzK0pXYisxVXNYc1ZudUVMM1VKRUk1dlJsYUhW?=
 =?utf-8?B?dmJ6QzM3UFFSYW4yNTAwa0JQdW82V284SEhtSzZ5ZHNra1NTL01BcENoclA2?=
 =?utf-8?B?a1ltTkkxRnlXdE42UWpBODZ1R1lzQUN3dkFOU3U4MWxld3pncXcvRGhOZXFT?=
 =?utf-8?B?OWNPQXdXWXhETENxQVgyWU5SQ0llY1ZSU0tyRFhIWkZFcU9QLy9YMjZKTW0z?=
 =?utf-8?B?amZCeExqLzBNSHZDM1h2K09wd2xCdTZ6ZmxrS25oVFUwM09EcUJ1YVkybUgz?=
 =?utf-8?B?Y3IxTGZwQUVYVEZJeWlYbWR0dy96c0NEWTQ4ZUdjUEFiQnJ1ekpMSDZSRFFy?=
 =?utf-8?B?dXZaS2VDZlo0NTVlWEdxTjBKdG5WMGtJQTlkTDNwbVl5SFMxYTc2ZVpvc0xr?=
 =?utf-8?B?WVErZ3RyTDVWbmdKY1ZEWHdhV2xYWjlGbUdxVVdVUGRsN2gzYUlBbm5iQUVG?=
 =?utf-8?B?VnNodlR0Zy81REp3OG1DemhQRlRob2U5ZnNmb3g2dWFnejlZREpwTCs4SUZo?=
 =?utf-8?B?V2hkRFBzMUYwbWMzSFFRVGNrdXZ3VmcvVXJCZTNZSkpPdXVibFJ5RTE5aFht?=
 =?utf-8?B?dzVqWjlsMXBUS2lodG9QR1E3Y0RhcEFaWXg1bGplU0VmeExxNEkzVllJb094?=
 =?utf-8?B?aVI5OEN6ZWhKMUtrRkZvZ0prL3g2bUJLL1hHRXhsWnhFMWhadEp4RE5TeGs3?=
 =?utf-8?B?QXU1blp2OWlPbHB2RUV0S1MyWWtBbCtQV1o0U3VSVkZrWUFMcm1CRVoxTG5L?=
 =?utf-8?B?WTJBNVFlYUp3Ukdra1lQQ3hLenRpVjRaNkN1QjRGNi8yTmtvV05oVUZ5SFAw?=
 =?utf-8?B?Vkc2MDFqZldkVFZwMFJSQkQ1YXIrU3N3amJodkgrbWNCZjFjRXQ0K1FxVGJh?=
 =?utf-8?B?R0NJU3FJNnpKMGk2Qzl3UmM0L0FEWFBnL2w3TGtHdkV3bVpKVEd0bXpLZVg3?=
 =?utf-8?B?aW02VlFJMDRnaHlGYUcvUlA0YXEzb01BVjZyNFZ6V09mblRLYkJNTENJNnBY?=
 =?utf-8?B?ejFnQTh1YUp0d2hEUjBhMW5EMVNvN2ROa0UwU24xWmhWMGEyUTlXVjlvdmhH?=
 =?utf-8?B?QllQbDN2dWZWdCs2MjlWbWVObWlHSXVQRmpQV2ZsdENEU1NLdjJJbFVuTE1m?=
 =?utf-8?B?UHI4VWtxMjBrcWllaUExVlBnNFVBbklndytjcVBkckNDQjRwSU5wQU9DR0xs?=
 =?utf-8?B?YjR6NDFKb3dxek9XbG5vR2d5b1pRUzVOUStvVnFzZ1phS1BMMTczL01PS2xs?=
 =?utf-8?B?eHlOUTFKZWo2UTlFaGdSWUhuVXdXV0JCV0hnS3VwSDVnQjhLWEhNOTlXVEpw?=
 =?utf-8?B?Ti9UT21YZURrcHBObGNERHgwdWxzTjhUMFpwZC8zWGxEL1U5b3ZoNWM5V3FV?=
 =?utf-8?B?clFLajBqcVh0VG11Wml4cG1PbjBQOHExakx4ZCtnK1NPUUorNEhwQnVvQlpB?=
 =?utf-8?B?MkFzYndDcFpnOFdnM2tKeTNKdTFBeGJhY1lubGlKMDVCU2ZSWVZ1c252K0J1?=
 =?utf-8?B?V0tpMDFOdXBTUWRqdFN3ZldNYk5pa3pUNEtuYkJCeFpKZDd3SVdSUlEraDcr?=
 =?utf-8?B?TEd6Z1pvNStLQlMzL2NKTU9aY0E3V2xpL2pyVFFJZGh2V3NFNnNtTk96a2N0?=
 =?utf-8?Q?EBAPsb/cwlZpgY5bgtRIofrdY?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0615bce6-614e-4297-7ef0-08dc4f98c330
X-MS-Exchange-CrossTenant-AuthSource: SI6PR03MB8987.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 02:34:30.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vU0bdMYtAyt5hpbk/T35QHdIHFh45XxsdK5RA0962gryjEqG3T5MTqTjMEPLIhD1X5FPM7ib34lDstZPBJb9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7657
Message-ID-Hash: UBBIZMHEOAYVGBGSEVWF23KXG2J4AI4R
X-Message-ID-Hash: UBBIZMHEOAYVGBGSEVWF23KXG2J4AI4R
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBBIZMHEOAYVGBGSEVWF23KXG2J4AI4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Mark Brown =E6=96=BC 3/28/2024 11:22 PM =E5=AF=AB=E9=81=93:
> On Wed, Mar 27, 2024 at 03:57:55PM +0800, Seven Lee wrote:
>
>> +static const char * const nau8325_dac_oversampl[] =3D {
>> +    "64", "256", "128", "", "32" };
>> +
>> +static const struct soc_enum nau8325_dac_oversampl_enum =3D
>> +    SOC_ENUM_SINGLE(NAU8325_R29_DAC_CTRL1, NAU8325_DAC_OVERSAMPLE_SFT,
>> +                    ARRAY_SIZE(nau8325_dac_oversampl),
>> +                    nau8325_dac_oversampl);
> This should really be a SOC_VALUE_ENUM so you can just hide the fourth
> value rather than having the empty (presumably invalid) option.  Please
> send an incremental patch doing this.

okay, thanks for reminding.

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
