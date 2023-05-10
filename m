Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E56FDA20
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 10:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6FA9104D;
	Wed, 10 May 2023 10:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6FA9104D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683708956;
	bh=1FnzFdf4vkKkqDKm3XfoswjtBye/8Gi2bw+5ucY3/4A=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VAMAoCyuEZirUQOZ+VZGHl7GGZVr4UUDye0BG3ukv3w/dXRjXe/tPmTYfILIL88AK
	 FIW9JvtN2h0HInwNBIHK3kcwN9jFnndXCkqobGAuaE88KrwJuncg9aUnrpVtZQGc3A
	 C0BAPcLxsOLFhKBt0gzrEkBldL2Ec4J/rEJZFoUg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F517F80310;
	Wed, 10 May 2023 10:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C9DAF8032D; Wed, 10 May 2023 10:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEB30F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 10:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB30F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=XSoOG5ZD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COEa9hb6gcybQeoZdUX1pHlBSNfaftPkt+7EM6iHIshpo8lWJ8z6yrZPf+hX4dq3F6tyBZb+FMEIZucFoMrI9pImPfQFJGgIiNCRy4PkiB3BUsk3fXFRppaQXghsB5+0OvJ+iePan2Zi3YpVpWbrn5CdsP9i4VEUxKkmOQZjkQWYA8gv4/a8sKYCbYk9pZ0xfBsxbH33LzTEZnF1AbebR19MhQ9iilWM5g0P6fnXA//MRaZfSS45+Tvy12mQ+Ia/jyXmJgILwgjNg7G9mWpTC39RgubyYFiseP131Yj/tXwtbzdBQqaY3YOQwVDzNDNvv7o/x6OQOZvmQgBbofYmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7GHK0wSYbJI6HCTAmIYUd8HzuAZ/DYUj7Zl0e+o22I=;
 b=h0s+6z8JqQxR/ClmOZdUVsVojZPYf+KjqMQhl+qxRf0kzapXbndn6OW+1rIYe39PubpKTPo7QmRUaZfy/IutBDiMSdCiNxHxCzdf6ar9zZAM9ed5VjIyKnFNTEmE0hcIdWPg/uZduUCiZ6c+yFpR4wL0kxh7+RPPIV5FtZNtDLr/4q39EYUFFmi+Z0LKc07MffRuMa3XJNIWivbSGqKFZZo2FGlqMb5wNP2ySnsUr32qhEMVzFNuyUy/sgRmQ7H2YSRgKuN8+vBKWe4DUeICmipUAwl5Tztd9nUPRunUb03yP48wD7e8BnMqyfkjTuWtRiJv1eJckLoyyG274rMNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7GHK0wSYbJI6HCTAmIYUd8HzuAZ/DYUj7Zl0e+o22I=;
 b=XSoOG5ZDAOhDFJLg/6j/UkYw/IMZcscgA/pg80gyn5tUtNaRY+/WBGFol8we2RN5SnXsm7FoTloCw0jsvWRDopmDZRACNK8s7cyHQSNJSFjN1n6WNxs8T5ludikg2cUrMeCjeglfOZR/NW+elSyUuKDFSo4vx7Ch9WFd9gNOeDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by TYSPR03MB7989.apcprd03.prod.outlook.com (2603:1096:400:47f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 08:54:47 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6363.031; Wed, 10 May 2023
 08:54:46 +0000
Message-ID: <f9a2536d-73e8-08d9-df0a-5df7936945a4@nuvoton.com>
Date: Wed, 10 May 2023 16:54:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20230510034409.585800-1-CTLIN0@nuvoton.com>
 <39afb004-5f28-2633-a8be-412cb5e74404@linaro.org>
 <36061fee-5491-e829-2c49-27ab81f0aa57@nuvoton.com>
 <d82491c5-12e6-abbe-5bb9-87d863454b25@linaro.org>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <d82491c5-12e6-abbe-5bb9-87d863454b25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|TYSPR03MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5a8e79-1a32-4c06-6837-08db51343463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+waT7s0O1hQ+nWh6uhvabnsZksZ2fSZe875lztNtlNDhR7ip6K9Q2ZNVRSXCjktHhpNl7bDEsPSnQa+S41eM5CcYi62wizo8rZn5cM/aHL1SriMSF/shxWOvXkJt9x8hpLGVrcfxJgGd5HkZNlDYKFiVmy6Qh3AnkyfVzA//9t6JwW1oB+P5mp2D2rm+1uiNOQKuurfdsr1toGHVAmQhh0wUQj5fTNw0waVgTiO3r4R4CAS2NeYGJGzRB5BCLEmZK6fICwDZtrBtzm8I+8d5JjFcFDn9x4QTNfgYqUhdclKuLTkwM/LWNL7jVkuGmrJFWUS+OTXuBr+2DbmH1ctnK54TyUF9TPlkW3QCTnoRCY5LYLEglHZa0EobxKiuAtRgrl4hhug+lRFKvXQyVj4heIHJGFXHiZoLY+RocsbnDEnCJd9XUjxmrbfa0grW7ovCY01hTMxdlOIYmQE0+sbF1/AQhyjDsIPdwXWHpkW0nSO1tRcUorsjjutmQ5RHRG/3HSwlRaQ6GsqAMEWrCO5NmZFySH30ZCR/s1k6hBkEju71HlambaHizkSgR+SpVc82f8yXKdLyGUO+cZTfYx8KGdkSxzzCoOl0priCmFz+4aDcxC8UKf3/O3t+VgRwF37I1y3CcClrlo//IYZNX6JVcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(38100700002)(31686004)(316002)(53546011)(83380400001)(6506007)(6512007)(41300700001)(26005)(5660300002)(31696002)(4326008)(66556008)(66946007)(8936002)(66476007)(8676002)(86362001)(186003)(478600001)(36756003)(2616005)(2906002)(6666004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejJQejlTdFpjZ0tMSXFBdFNmcW1uMWNuelBtb0hmdlpRYmo1eUVGN3MrT0Iy?=
 =?utf-8?B?aVBLQXMzWHlTNXFnVjdJdXZTazBCL2dNOEdNOFpzS3NESlViL0FQUks0TWdR?=
 =?utf-8?B?NWFwbnNneWF2VDV1NnlrQ055dWVkbFBMWkxQdDR6UTZRK2psaVVSbVdJM3Bm?=
 =?utf-8?B?amQyRlhTc1RMR3h5UlNsRWp1UVlLbFlNSnduTktLdHo4dkxEUEQ4THg0TVJV?=
 =?utf-8?B?a2NMeFJBTnBOam1rMlZ5R0EvKzVTd01YVHFjU3NQOE8ycjNhTTBuVkdlbDFM?=
 =?utf-8?B?eURCSWxVa05sMUU5K3YxcG5lZlU4blpoTFpHKzVHaS9CSkZvT25lUXA1VzNK?=
 =?utf-8?B?bXE1NEMrNU90MkxwNGxqVG1sZy9remtLL1paSGMzZlhXeHdTQ2dRWFJ4bWtC?=
 =?utf-8?B?NUkrdjBMVzBUaXJvNGI1ZWE1anQva3JFN0tvQ2tRK2RxcEZUaXRjSGFYWmJF?=
 =?utf-8?B?dWlaeDM3RnVycG9IOUxRUndoVDJqZTVSTzBuQWVxaUJpVlkvQmFpTW9GTmJJ?=
 =?utf-8?B?NTFtdjJWYWFNbGJhazN0eXNYYXNQVEh0Yld1eGFCeFQ1ekxLUVY1MkEzVUtP?=
 =?utf-8?B?QUJlOG5JblcvRVZvcUZjRkk4Z25WQ3NIaE1GaHpvbE82cXR1U3U4ZTBYUEsw?=
 =?utf-8?B?VXdTbTFmb2hsQ1VnNXBpc3FML2R5a2xyTzlTL0tiL3pRdDFDQVlKQ2hpekdE?=
 =?utf-8?B?eVRNNEZmeHdRSXRtSzFXemZ4VGtMZENrMEllM2RENDhyZVdOeCtQNE5GcW9J?=
 =?utf-8?B?NEZaSWNoRE5VbnZkVm1WYVRhcjVualhrNG42Tkl5cnl1S3ZoQjlWdDdDMWlp?=
 =?utf-8?B?VEZkOWhZRkYwUDBNd2pQU0haUnR0c1QyejV2YmNrTzh3SDZnZWNnTkd4T1hq?=
 =?utf-8?B?VmpONVhBLzFWWER3NVFXdTEyZ0p0cjlsdTh6aDN1UThYTjlPY2kyd3I3dC9w?=
 =?utf-8?B?TGxVVWljVDBBK0c5UjE4MWh2TlVMNXMzbS9oVnFDcCs2ZnRVZU1NYlZnZzVx?=
 =?utf-8?B?eWtCeDhESGRUTmFRcHc5dHVoSDlNcitmVU5pdndSbi82Si9IbW9NME9aTlhG?=
 =?utf-8?B?RzRIWU5QbGJvaHlPWkhCb056YmV4TFNMWGd5LzNUT1dzaU9zQm9tZ0hMMjN6?=
 =?utf-8?B?NXg5NHdicnVDa3g0SUN6Z3l5MEJTY0ZWa2tHbllmaVhnNVFEeDJpcjJmQnc3?=
 =?utf-8?B?S2xvcWh3M0dBNVVmb2NpcE94UWEyTHNqNngwanFJRjhuZTZ4SXg4NWxaUHpS?=
 =?utf-8?B?VCtyR1FMQndDZzlXbFpjWDk4Q3A1Z2JVWXBoS3MrNi9UNEFGYmh3YnBzVTJN?=
 =?utf-8?B?QnZPZGtaUFp4YVlpOEtxRittN3Z1V2FramdmbUZ6SSs3OEd5RVIyNHg3TzB1?=
 =?utf-8?B?NEVTRDh5WS9raUxJM0QwQ2o1YkVFblJ3cjVwVDdCWXhFWGVzNXBrT3BhTDRl?=
 =?utf-8?B?S2FVUk44SUZxK0tIMy9SMURnQVRvZ3FBM2h1RTVVM29vYnI4OUlKOWRZK0ZO?=
 =?utf-8?B?UFRtaTZLK0NuUTdNK2JKKzRLclhwVU5XdDVCdGNDMjBRMVVVa1F4cUZZaDd4?=
 =?utf-8?B?VThDRTBlTEd1M09NRDhMbnRlUlVmdmpwOWUyY0hBbDVkQmRzcmxBL295MVdp?=
 =?utf-8?B?VXcwZEdQdXhDc2I3SURYNnpoNnlUSnViWkhUWHJ2RU8xQW9IWkk0UHRObXJT?=
 =?utf-8?B?L3I2WDY0ZWVLSVZYTjJSbC9zZ3lHOGtkMkNPd1RPdDRxaTBMejZsNEgvM05E?=
 =?utf-8?B?ejM0dmRML1pnV3VkM2I2aTgydmN2VnovZzgzMjVuMFhsb2twQS94Q3dxWThm?=
 =?utf-8?B?YkpYcU9HWkt0eWM5VW91Y0pzcFEvYlgyemlVVjF5bFMwMCszS2l4b2ZYUFRy?=
 =?utf-8?B?cmVQWVRvZVMwTjFTSStUQ3FIL254U2hQQTNaQ3RZa2oxUkxLRXQ5Q3BoOUd6?=
 =?utf-8?B?cGpOZTY0eVRRTHA4VlA0NGh3V0F5bllPU1NUT0dKVUg0WjVzb0FXRDRSeCt3?=
 =?utf-8?B?cWNCbkp3TVdlZGl3V2FGcU9lRWpjR3Zuai9HZEV1T2JpQWs1TmtHZUZoTmI2?=
 =?utf-8?B?b2h6dWE1cno0Z1JKU3ZmcjMvWUJjYWcxY2hrTE5pWGFXa1d1THJ1Y0QrcllE?=
 =?utf-8?Q?fZs+ruPftjEL5GI+x8kyUlLGW?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c5a8e79-1a32-4c06-6837-08db51343463
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 08:54:46.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z4ZT9uFFn5A8ZxARWQ6NppxsKDWwmERcPSsvTY/tffJ9P8vYMCI/00g263sjXuZ4SRQQsSx/kdL/80iShUgOZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7989
Message-ID-Hash: 2USGJ44PHGVLPUO6NGZQBFHCT3IHHWBS
X-Message-ID-Hash: 2USGJ44PHGVLPUO6NGZQBFHCT3IHHWBS
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2USGJ44PHGVLPUO6NGZQBFHCT3IHHWBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/10/2023 3:48 PM, Krzysztof Kozlowski wrote:
> On 10/05/2023 09:42, AS50 CTLin0 wrote:
>> On 5/10/2023 3:19 PM, Krzysztof Kozlowski wrote:
>>> On 10/05/2023 05:44, David Lin wrote:
>>>> Convert the NAU8825 audio CODEC bindings to DT schema.
>>>>
>>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>>> ---
>>> Version your patches and provide changelog after ---.
>>>
>>> If you just send the same with the same mistakes, that's a NAK.
>> I know your meanings is to show change log from v1 to v2, but I see
>> previous patch have other missing items.
> I don't understand it. It does not matter what else is missing in
> previous patch. You always must version them and always provide changelog=
.
Noted.
>
>> Therefore, I revise it and included your comments. Anyway, I can back to
>> previous patch and re-send v2 patch with changelog.
> Paste it here (and in v3 of course).
Changes:
V1 -> V2:
   - add interrupts properties
   - add maximum to nuvoton,jack-insert-debounce and
nuvoton,jack-eject-debounce properites
   - add a enum item for nuvoton,short-key-debounce properites
   - add default value for most properites
   - add maxItems to clocks properites and mclk entries to clock-names
properites
   - refine wrong indentation from clocks and clock-names
   - refine dts example for interrupts and clocks
   - remove headset label from dts example
>
>>>>    .../devicetree/bindings/sound/nau8825.txt     | 111 --------
>>>>    .../bindings/sound/nuvoton,nau8825.yaml       | 242 +++++++++++++++=
+++
>>>>    2 files changed, 242 insertions(+), 111 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.=
txt
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,=
nau8825.yaml
>>>>
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +    i2c {
>>>> +        #address-cells =3D <1>;
>>>> +        #size-cells =3D <0>;
>>>> +        nau8825@1a {
>>> This is a friendly reminder during the review process.
>>>
>>> It seems my previous comments were not fully addressed. Maybe my
>>> feedback got lost between the quotes, maybe you just forgot to apply it=
.
>>> Please go back to the previous discussion and either implement all
>>> requested changes or keep discussing them.
>>>
>>> Thank you.
>>>
>>> Best regards,
>>> Krzysztof
>> About node item, maybe I misunderstand your meanings.
>>
>> When I change from headset: nau8825@1a to audio-codec: nau8825@1a, it
>> will have compiler error.
> That's label, not nodename. Why would even this create a compile error?

if the label is change name from headset to audio-codec, it will caused
compiler errors with the following error "FATAL ERROR: Unable to parse
input tree".

So far, I don't know why label name will caused compiler error, but it
might be caused parse error by '-'.
>
>> So I use nau8825@1a to submit.However, when I see your latest comment, I
>> seems to understand your point for node name.
>>
>> The final result will be codec@1a or audio-codec@1a, right?
> Yes.
>
> Best regards,
> Krzysztof
Thanks for your guide. I will send the v3 with the changelog.
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
