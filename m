Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C06E5D94
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100A9E71;
	Tue, 18 Apr 2023 11:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100A9E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681810740;
	bh=6fFk6+DvN0MsCswfoL0C6hUF7VLCVgb7dYUfhS8v2r0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NAhxdomN0F43rjL+7+5JWvJOcS4T55P/qEPR9lcAcpilDl03X6zH1pFrTBRrwJvDE
	 +z6VkTZ+wy5ve1m9axmHZKISytE7xa9PNvKcY+Seol1lFP9g79Hxl52o6czsow4+oJ
	 Co5/uDm3Pjr9zqkD6XzULZkp1U/TEhJPluusEmq8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE7FF800F8;
	Tue, 18 Apr 2023 11:38:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A0D9F80155; Tue, 18 Apr 2023 11:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05BA1F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BA1F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=kKfvwQEG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFEL/4AGxRapJwmd0bp2xmoCWDoAGxOKBCqlSXQx6ChNFKcnbicelXS5mAwB7cIvj4btUj46zF8FaT43u6S3dX94/EuGI4d83+eboSEgjfvJc7nZCF0y1Zywl1rErxC0IVorrMRbdYTF9zSl9YCPcMitYYumiUhw26lu/WBWdUQIpBUh7FgUAGAT/Xc6qRr8PG/qDsngecquLCf0X+Gbd2DJNcQLuOd09WJabGxaEoQx1DMaksxr2D5wba1CPh0txnwnXh+wyrH8ZGOBerUFGEGyolqD/NnKybzkVXK5v0gvxHFpivtu2+Z+1wwxVSx8RED+q3UmZB+TblvjclVvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrQz6V20M+D7SNM+0kZV+fbfh2ogq5MiJF/Luqqj2e4=;
 b=AeXBN9yiCAKVYG6ROK5sku6AlT6r6s+alCFvc17g8G7EX5s7zGhW+fupq7ZxwPtaZbc7ENXO5BtZreJVJi9l3r36seU633PwMkpFp1e3qjw3aLu6K5zVci7h7Yq3/Hfbjx64aPTHSTljLr0WFh8ZkSZ3NEXNPCPB8YrJDJOAzjqh6AAZg7t3NNi3H/XpHEKn6r+8RjAGs0Af3zKeYQ6DI9Kww+gMfRZoyHpycuKQJXACwaZ1ZpFB5pjmAwAmpLfHEwdXf7bEdYvKJW+GhVDTxscrXNKEIqtZbsah0kFqk0LlPAYClVKTSP3Tirp95MmHVWRHiQeN8hJ49lMh+kmm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrQz6V20M+D7SNM+0kZV+fbfh2ogq5MiJF/Luqqj2e4=;
 b=kKfvwQEGyZyA6hpbszmxAyf8t7Pv+ZIiRe3rofhsyT0lm6t7PqhtXtYHcdAS/d+NaHIklt9KayWjWPL5shrlxEnNd5+cCX9hlN87FR8UegBf2NnkHQhlbmFEm1OyVcsfD+t4jryIwDTE4WoPWDb9qPRBcRa4cBbueqDwF6niHGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SI2PR03MB5515.apcprd03.prod.outlook.com (2603:1096:4:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:37:47 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:37:46 +0000
Message-ID: <dd951ed7-9eb6-3e92-9855-9b123a2b0b96@nuvoton.com>
Date: Tue, 18 Apr 2023 17:37:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
 <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
 <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
 <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
 <054c3a85-9e29-490f-91ee-42912cef1767@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <054c3a85-9e29-490f-91ee-42912cef1767@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SI2PR03MB5515:EE_
X-MS-Office365-Filtering-Correlation-Id: de8830ff-9463-4615-2077-08db3ff0911e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	anewjF056ZiPXEf9r6PFTXVZCFtC2WX70QVOUrA3WF7kWpRsAEMpsbRiJVjSAzR5B589rh8ejNiWEYZpcVPhrpmfLoZZHxiilZq5BjvL6pau6Dwk0y1PGyV+KAiBXcx/SxzJuctXnVN4C5kuQ0gLUra0UyhrmYhte45+YJw0OUX2RclpnZi1VlTNRMTOPMh6WzjpygCFg2/13ZvM6DGwWSN9HhaGCTXTR+gwChcQo/ExthfCGR6Q69XrhmhMcX9IHjI9h7K+t0UIreS6qF9ny3xaXxZdslxtz9InU1zbdSwSJ7BARNGUCyfFeNDFxpFuO3ar1ZabsypvYsFEf7sg/SYLrv8EK45C4FiXJ6ThIyygNcVu4RqjyLY01CEIzDyk5H1KZ+S0VDy8iRFDWTYcCBnExyeiSzUfu/hQgXYmLkiv2GjLF0C6XrOjrMrmxEmcugDtbxUpi9eS9LLDSYDHIB8jvKk4iXt5seWaZzZwM5X1w4FZHYfSLKNhxsMYtTfhBXz8wYR6tdazBpdQDG523gAkCKXuotreV90kDjNHroif99U8rT/9ZuPUdPEE/az8FbjRbzNJIOTISgglKy+39Vgtx2Ff/ajzHv3CjEZR5ustTPw7kyHih4xhZFsPC4bE9d1Z30xlL6LmtykxM9QO/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6666004)(6486002)(478600001)(86362001)(31696002)(110136005)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(53546011)(186003)(38100700002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(8936002)(5660300002)(8676002)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnYrTTVNMFB4Ykh5cTh3MjYveTBTTTY1MWwvSC94Ti9jVCtXQTllcjM2bnJU?=
 =?utf-8?B?TFg2ZlBnb2VTdmNCaGg4TXlOQWFJUGhFRHhRK2IxZWltNFJVZVlxWUcyM0xE?=
 =?utf-8?B?Slc3SVhaWGsrdDN1bnBmUzBKZ2orcXJQdnRSMHZvNTkvL0x0eloxbXhXek5M?=
 =?utf-8?B?NjFsWWRaY2ZyaG9DeERzUHk3Smh1a0w5Vmh2Y2VzWk1TbHMzWVc3bmd1d2xU?=
 =?utf-8?B?TWdJTmhtWVdOdkxPWWRNRjJIdkhwWW1WTmd0aHM5dGo4S3BLSFkweENxZ29m?=
 =?utf-8?B?UDcrTlc2VDFGNlJGanVPOEd0QTdaaGgvL0ZmQk1wS0FRMGZQdDEzRHVTRkVo?=
 =?utf-8?B?aUFpSDdUOGRIaG5qcGRpZXNBTlJIQzk3TElhU1VVNGxieWdjZXppSUFvcW5B?=
 =?utf-8?B?cWZHN05KaGtSekM2KzM0OVYxOW9FdThoc3BHSit0eFJDRjh1eDBXU0tpalo1?=
 =?utf-8?B?bzZ0aDl5Ymp4Zm5qV0xqcUJBMUxVMUpXRmx3NEQwWGxCSEZTQjJQTS9RSUs4?=
 =?utf-8?B?M3p0NnMwZ0lGQUJ3d2hCcERNRWtTbGZwbVdiTDdrci82eENpNDJ2U0xzdk9Z?=
 =?utf-8?B?SzhTM0w2ckExL2JUMkJMNFl6eVlQQXB0ejZSTGpsMEdjQUkwbWRaemhYeFoz?=
 =?utf-8?B?ajRBR1U1MVNyMkJwblFCbEpNUmNMMGhLUEpTcWJpUllOQUtJaG03eUJuY1dy?=
 =?utf-8?B?K21oYWR5MzZ3NXd5NFF0bFZncWJ5ckZOMlBmd21YOXdTaDQ3emllYm4zMElL?=
 =?utf-8?B?YTlBRnorNHp2ZXhJSGRxeFIzVzlvVmtSVGwwaGdDcGRmUW1Wd3pxNmY0b0xs?=
 =?utf-8?B?bjNseFloRlhFWjNxTHJMc1Fjcnc3dlYwWnFNK1RIdGJVcnZsYVNOY1JRT2Q0?=
 =?utf-8?B?Y2VDeDYvNE90TGNNaVJ2Q01VUXBzWHdENEJQYnpxU2pUVDRXUkk4aTg1Qjky?=
 =?utf-8?B?UHpoUk8rZC9lUHl1V2NQdjFRL1ZOYkRMOXZiZzdPZEpuWGR5dGFkZkFRRGRm?=
 =?utf-8?B?aitSUFVwTWxQVlpjcTMvcE1Pbm9XUFVZU1h0U2pqR1VLZXZ1cEJnOEJuTkZ0?=
 =?utf-8?B?bHFpVkxvemR1ejZGbFZHUW40TzRYMERqczNRTCs4eHhEbzZOWjNTTHpleERW?=
 =?utf-8?B?dmxSUGRzMThrQkpyYzVBOUwzcmtSamRZczhOQVdFL0NtVUh0K3pNMzY2dXdP?=
 =?utf-8?B?eEFDanJKUFROaktBU3QybzZEWnRXZldlUW8zb1FuTG5JbFh0Z200dmJSdkFs?=
 =?utf-8?B?bWs2YXIvUEFROFJjM25EcVRGV1lmeTVZaG9Jd0k2cXYvWTZsQll1WW4wQmlk?=
 =?utf-8?B?NzFNWlRMTGwxQVh6WVhNWkdQVnhJcXhrV1Byb1BSd2Z1Ym1lZHpTWFpVUS9W?=
 =?utf-8?B?eHZ2SUFpZFdQekxCTGd4bFZvakdFMm5OazZQWUZGYzFROHpNRWtCK1c4dXVY?=
 =?utf-8?B?ZkJoR3EvcHZiaTkzYXkrUEJqZGxoRC9WR3YzS2VBdDlMMFZaQndQbGh5VW9q?=
 =?utf-8?B?NWVpclVpVngxT1gzTGprOG9GVzRrN1FRUGJpK2pDK0FxZGZFRER2V1JUejAr?=
 =?utf-8?B?UFpFVlVkWGFJVXNtU0hYbzNDUVBUdmtmeVBmdzRTeTlxOWk0Uko2T1UvNG10?=
 =?utf-8?B?NHVVMFRHU1FJejU2bXV0OFNZdWdRM1JDdWlpMG9HS1d2RkZQOW5uTE41cnk1?=
 =?utf-8?B?amVIdUYxS1VhL3ViNDdscmw5dTE0WkZsbTRwbW1SNFNiNmhrdE5VYkhHR3FF?=
 =?utf-8?B?a1ZYQnl3U2RNQzVCOXhlcGFoY1Bpa2xISW03Wkg2WWN0UnlTeTlzT0RuWXZZ?=
 =?utf-8?B?MlNqZzlwb240T05kcm5adEVlUlU2U0RiRXFNNnBlcFZ5T3FNNHpwbGdvaTRK?=
 =?utf-8?B?aWZiWldFbkRpVStEMnJHNTJSc29QeHdPZkNEblBXczlwMGdmdmFsd1NBOWlQ?=
 =?utf-8?B?Q1h4L1J0VXNUMmNJOWdzQSsxbXcrZVh0RWdMRUREbnZubno5eUQ2amlDU3BL?=
 =?utf-8?B?WVkvcVdQRHBCVHFqNWs1TTVFTjdnK0NjSFVjaGF1VjRWZnp6UzNUQjhON2Zu?=
 =?utf-8?B?ejMzSGp3ck9qT0JYUmlROTdkT25VYjArVTVsZk5VQnVnbmY5TVBKelYzNXJV?=
 =?utf-8?Q?nxpuUcioL4pyjZ9ucGriCdqca?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de8830ff-9463-4615-2077-08db3ff0911e
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:37:46.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PptkMWY/2JHZM4N3MHp+kO0Ka5G0UR33/t2lhWCeFscZahmQv51jALRV0CrD4YDtoVZoXgBu3b1ZOaOyjSTeww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5515
Message-ID-Hash: T7E6QZEDPJT4CMEBSB3UAOKTA5VF2FMK
X-Message-ID-Hash: T7E6QZEDPJT4CMEBSB3UAOKTA5VF2FMK
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, WTLI@nuvoton.com,
 ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7E6QZEDPJT4CMEBSB3UAOKTA5VF2FMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 4/15/2023 12:38 AM, Mark Brown wrote:
> On Fri, Apr 14, 2023 at 03:58:06PM +0200, Krzysztof Kozlowski wrote:
>> On 14/04/2023 15:46, Mark Brown wrote:
>>> That seems disproportionate for such a trivial change.
>> What is the difference between:
>> 1. Adding 2 or 3 new properties to TXT file without converting the file
>> to DT Schema,
>> 2. Adding 1 property in 2022 Sep. Then adding one more property now.
>> Then adding another property in 3 months.
>> I don't see.
> Me either, but I also don't see an issue with this situation.  If
> someone wants to convert to schema they'll get round to it, meanwhile
> the code isn't held up by that process.
>
>> Every time the excuse is the same - it is just one property, so let's
>> add it. Since this is second property, after we started enforcing DT
>> schema, I don't think my request is disproportionate.
>> I think my request is reasonable.
> The schema conversion patches are very often disproportionately hard
> work, there's a lot of poorly communicated rules beyond whatever the
> tools actually check for.

Thanks to the comments from Krzysztof Kozlowski and Mark.

We will plan to gradually convert all txt files of codec driver of
Nuvoton to yaml format.

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
