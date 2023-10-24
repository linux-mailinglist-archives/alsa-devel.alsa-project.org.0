Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F807D46B1
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 06:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619F86C1;
	Tue, 24 Oct 2023 06:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619F86C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698121202;
	bh=PFLmAnk0yG2UsYwo7858rYmPWy4qMVsyiXR6S6dGBO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ePUEqrHucMx0/RTT2LDPZgXk8msdvmbkItlAYC2N6tPGpWKvVmNhFSVqPSMRKJcU9
	 MxER3E6BYtIK+SRZTfFBsTfG/eMUWhPCwxIvk7Eurwi8kui3WEfHLrWd+AR4XYHg1H
	 c+GTuFZE7MuQnTVfPsy5vRo2cESUmsVU1fBkuIzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FDC3F8028D; Tue, 24 Oct 2023 06:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6CCF80152;
	Tue, 24 Oct 2023 06:19:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5FEFF80165; Tue, 24 Oct 2023 06:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A88A1F80152
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 06:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A88A1F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=kOA1/soa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8OoEoUmjtVyfFTt4SwkP4MfNtwfPZdjn59HWcr2RoLFrfnOIh87WeQElYSYn0mdVAisfbSlxICR8nZlHlGajxZ9II9ViEqsqNTOOmoNtAIQevbL/YOkD9JQqD5cBoYaTx3xHZ1wNDWnGvr+VCflII+ks3q+9eSreVv1J0X7jES9Wl+mmg2irO3UJ7HaiiODm2UY6AzKrwcLrv/OVgNsOR73lCvUyzDyfmBQ6BDDYJI3vg78Wx7sRITWx0N0jUQq2tKxYZ6AUBAXrdEFguIJJ3X/y5WicXxUgyB3LI5LLcaC9t389iLYt0zTDP2gHSPPZhF3xJregnjM/hDMfiavkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwlea1+JzF3oh3FUhQZjOlVj/B1GKAaMn3SA9/IkGx0=;
 b=VPyIIerJ0452XcYqZei3HAMeMSHzlZs2CplJ1Wt9YI0SBtNfUkEwsSxZmNV6YIq267ROQuUMBukUwaVCkXGHUzXjTw72NKTLeIH3zuN4wF6YikVYzz7XwzRiDdFaJQwWMnZSIT0jy4xTg3du6/RZVemEGaPUXSR5/r//Xt63bwJyj0HERnHLYypdc9ptVKxuMMl+71Mht6Z+seT1scy8UkRnzlS5qYyXcDr3glqeLSGriPojDG9vxq7LUxXIRtgF8M6TRnjAPnlHnz2MAfBdD9IWMRB1Z+6PTNbrQ4O/T2NqQE4tP41Ro3G5c2/pzsizuzxBZHVv98d8D2sQO2FxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwlea1+JzF3oh3FUhQZjOlVj/B1GKAaMn3SA9/IkGx0=;
 b=kOA1/soaJJnnUjlpFigYuLuo5zd6yB7YA+anlImTUjVXBd96G5V8SDPbpO/YqGEPlMT8IG2qMCdfivl8dYtZu6wSF/81cv0qBnIcgrZLL+SiU20+ZFFqPJu7J4lZl30qiEpcx/O9wTPrNUVspG2c/yEL5weOHGE+D7ZmtD7osCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by TYSPR03MB7307.apcprd03.prod.outlook.com (2603:1096:400:42e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 04:18:01 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::3264:5b10:85b4:81d7]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::3264:5b10:85b4:81d7%4]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 04:18:01 +0000
Message-ID: <cb3ac321-2258-fd9c-2d96-5d1fc566303c@nuvoton.com>
Date: Tue, 24 Oct 2023 12:17:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
 selection
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
References: <20231023021537.617980-1-wtli@nuvoton.com>
 <20231023-company-coziness-0b50388abfaa@spud>
From: AS50 WTLi <WTLI@nuvoton.com>
In-Reply-To: <20231023-company-coziness-0b50388abfaa@spud>
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|TYSPR03MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 83888321-3d2a-4fc0-549f-08dbd44835b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eleadfBhjKiTsYSKYOXE+2O+EicpRGzMkOs0+fL9ls95rFn/KYc8BpoF0DoBOGBx2NNa/vyN7uqZp2dHmJZKkCgo+OeNgrHjZS/wl/VWlDnIx85MGyPq5ADJa6ianUEJplThcStn5i+hFrJv1bPJzP5rQQ9QSgiqYYXGNfk8wrEng796fGdl1uD6RNLX+EynGwgBmmVGinKccms6udBjpyC001FZxjCHlSJeC3RVyhkSj6bmPHcISuex0aepV87EnpR5f3Z76fHb7KKFiRzDUjzOvoCsFuaBo5xK0DkAu+P2wQujNLK/dC3NwsTlJWkJO4r+2+5V5jPHcqrcDPTbpvLdlRTbHN+TM2U4SsPkaKc021MwjQdva4x3GKBTdCbEwXJR9TGS3B2dz2FkIwBWiUyifCES6pxUWL5B0oEZPc/C3C+/QDDJut2o/DiWobhsLLKK85kYIiUjS4RAawZGbALVSStCl7Q9kwihexX5GaFB5xPJzS2MFzzLStzHVI0/vcHOE5Pk/UuM4aaJ1RbCfEZY7c6sB2TRNWyt4lcZfGm2gqbJwoBX0sKJl8sFVRKNKsQHiKdMWJUamOvV3zVOQ6biKJ6hb9ZL1Vc3ongjuDuGX9RvQNeK4eITKIsFD0G5u53wBACyorExpj7pb+rElBNZo78+V4B3Z9cQ7rjIXVyWVIt+OvEdIKXF1Smyu1nZectz9U7/S61vPCHSwBI/CA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(83380400001)(7416002)(2906002)(4326008)(36756003)(8676002)(53546011)(2616005)(38100700002)(26005)(6666004)(8936002)(6506007)(6512007)(316002)(6916009)(478600001)(31696002)(33964004)(6486002)(5660300002)(86362001)(66556008)(41300700001)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0hSaGt3Y3hBaTNNODJOc3hRNkpjaDZ2RGxscXRjUEpFVzlCOFlzZjd0WnBU?=
 =?utf-8?B?aVVDdURSYzNTSzVxNC9TRlhES1kvNjRta3ZIZVBITXYxc1g0RUwwT2NBNG5Z?=
 =?utf-8?B?REQzc1B4Z0Jkd0RJS1kzRXRaVmVvUWdNaldqNHNGWmNSYkNFS0l0OU1oYlRZ?=
 =?utf-8?B?VkYwRGEyRktSMnFFRnorSEJzb2tvRSt1aXJITDROeXRtN29ua0I1c0JzdlRQ?=
 =?utf-8?B?d05IZlJpeUgyaWxEOEJuRTBNbGRjc1JNeVcwWDZyd2ovUWJaVGFQdjU2UEw3?=
 =?utf-8?B?UmpFblg1WkRjWmpnYWpKeklGeThFWEdvTStkQU1UYkFycW8zZEt1aW9uVjBh?=
 =?utf-8?B?aGFEN3lzUGZrYUVoNU5wYVVlUlliRjVja0dURExMR3ZLNVBJa0FUTEJ4dUNk?=
 =?utf-8?B?MnJqT0tLa1Bjc2R5SzVPcVVlVUd6LytNVEx5YUI2NDRrSDFaQWd3bitWeUk3?=
 =?utf-8?B?ZkgxdWtQempVRE5EekFLZlVZYXFNTnQ5d3pud0ZQd1ByYWJqV2IvbC9LU1Qx?=
 =?utf-8?B?SWc4OFJtVVhyMzVmN0IrOGdORzhVWmdrRVJPUTVBNUhsZDdBaE4rVEU2NXd3?=
 =?utf-8?B?RkpydXd2T3RCQ1BpQmdySTBTKzlCRThFNjU4VFFhbDE4ZHVXQ0pheEVJR2E0?=
 =?utf-8?B?SmxnVjkxeUpTNmVlcTJQZ0ZuVDY2STkyMGEzb09VdllhMi9WQlRFV3Q3cHcw?=
 =?utf-8?B?WTF6MzhsTHRQSW4vc2JRVTU5TFZqZ3JBSzM0TGJCbEVRZlRaU29QTDY2Z1Jw?=
 =?utf-8?B?TGVPTjVsWHZTc0J3SVFvZjduaDhkS2dmUkhxVUpxT1lzZjAwSXlaZG9RUmFX?=
 =?utf-8?B?K051TnJuYVNUSnRxWm1kajVkM2c5T2JQeXZuSUdHYS9MT2x6SzNFZzJYT2t6?=
 =?utf-8?B?MUpycEx4cnBYZGVMakFZSjlhdU80WWdyRzNqb1NScndJWWJtQWRodURHd1g1?=
 =?utf-8?B?ajdPV2RybkdQc0dEV1RRVFQ1Wi9NbkRqbFA5V0dyOERJQTQ3Y25rSitXSzRK?=
 =?utf-8?B?WklDZG5JK0xOS1pUcUQzY1ZzS050NG9VUmFSanpFb2VvU0dtR1BBSHh2Tndm?=
 =?utf-8?B?OFJjdUhsOUZDZXBvZkl3TWdwRGg3SURrZ3RDOS9TbEJFTm5nU3Z4N3hoeW1T?=
 =?utf-8?B?UDIvMnRkNDl3RkFTeTRFWTdyb1NnMWNJclE0U1F3N2NKV3VzZkhyMVg4Y3ht?=
 =?utf-8?B?OEdtaDA3TzRhZFIvNitkYjYwS2N5YWpDVURmMlN3K2V2b2gzUFlSckJmOTVZ?=
 =?utf-8?B?b0FzZGNtK1QyTmZJai9wRENpWU4vaHIyWE9qVnpIbFo5MUM0WWRhaldQUXk1?=
 =?utf-8?B?Y1dRS1pKcUdVQzUrSUYxYkdCaDg3VW1WMkkveVlvcHd5MkRxanoxL1hldVdL?=
 =?utf-8?B?OEQ2ZG96QXE4NU15TzZyN0syV0xsOHBjaGQrRTlVQkY0dGtWUEpjN0NYYTBq?=
 =?utf-8?B?L3ZqSWpXRFBqd09lejgyQkcrYkdaY3VEbE9LbHVyMHFpUHhRMEZTWWY2Q1Nu?=
 =?utf-8?B?ZWZGSUQ1SkNUbWpZQ2pJVVRrcVB3Z1Y0d045K2RqUnNkZTJBaUxCZ1NyRGFF?=
 =?utf-8?B?aHBGMG1sQWhVQjMxMGZlbG5yWGRVQlFmZjhBNGRrTTYvb0w1WWo0UzVnS0pR?=
 =?utf-8?B?K0s1a3RTdWYrcjF0MHBLc1JDOCtCRGpHZEd4RzU0bTFwY2NjTmFqZnM1OHhs?=
 =?utf-8?B?c2p2OG9iQzlySW51Z2xVbGdYL1lISXA3UkhhY3lCK04vTTBFTzN6NEgyVUlJ?=
 =?utf-8?B?UzNHZ1pWSTlROFlLUlRxUnphZDF1OG93TlM1djdUN0ZKa2x6ZVVMQUR5MmFj?=
 =?utf-8?B?LytPSVJscmtRa1JiSVBYSlRVcDhoQVlzdHdVZVY0MUFwd3dpZ0F6MUZkYWhO?=
 =?utf-8?B?K2VTcG5vK0tMbjJiVGcwNEF1ckx0VHUzZlhKUDQ3cHk3L2JjbzBtZ1FzTmZv?=
 =?utf-8?B?dEpUSkRpa1RwZE9tc0cxeEdydEU3VHdXcU41WXJSdWxFSjM1YUhqd2hWZ0pO?=
 =?utf-8?B?NGxkZEV0N0JpSGJUbFZuUEhrZW93ZFdzSnkwdUp0UmFPdm5mV1RUb0p1eGI3?=
 =?utf-8?B?WGpmUk4xUGM4YmhOYjJaejlBNkdMSUJDZmQ4Mmt5TVZGWUFFaWxzOHZCZDdw?=
 =?utf-8?Q?WyDskC5w9yW/r+6bvITymwwWC?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83888321-3d2a-4fc0-549f-08dbd44835b7
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 04:18:00.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nP8s/NMc9KGwH4z2bhN8YGvBMo2bwN7H3tSInGKZQxHuVvHgvXMiz5oW3dEvf6PFLeX86sQWFEC5czq1xv6NRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7307
Message-ID-Hash: 3COTUW3OF4SINCRF72ZBZNMDP3IMSM44
X-Message-ID-Hash: 3COTUW3OF4SINCRF72ZBZNMDP3IMSM44
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3COTUW3OF4SINCRF72ZBZNMDP3IMSM44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxMC8yNC8yMDIzIDEyOjU1IEFNLCBDb25vciBEb29sZXkgd3JvdGU6DQoNCkhleSwNCg0K
T24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMTA6MTU6MzZBTSArMDgwMCwgU2V2ZW4gTGVlIHdyb3Rl
Og0KDQoNCkFkZCBpbnB1dCB3aXRoIERNSUMgc2xldyByYXRlIHNlbGVjdGlvbg0KDQpTaWduZWQt
b2ZmLWJ5OiBTZXZlbiBMZWUgPHd0bGlAbnV2b3Rvbi5jb20+PG1haWx0bzp3dGxpQG51dm90b24u
Y29tPg0KLS0tDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbnV2b3RvbixuYXU4ODIx
LnlhbWwgICAgICAgICB8IDcgKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9udXZvdG9uLG5hdTg4MjEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9udXZvdG9uLG5hdTg4MjEueWFtbA0KaW5kZXggM2U1NGFiZDRjYTc0Li41ZjdmMmVl
ZDQ4MzQgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvbnV2b3RvbixuYXU4ODIxLnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9udXZvdG9uLG5hdTg4MjEueWFtbA0KQEAgLTg5LDYgKzg5LDEyIEBAIHBy
b3BlcnRpZXM6DQogICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMg0KICAgICBkZWZhdWx0OiAzMDcyMDAwDQoNCisgIG51dm90b24sZG1pYy1zbGV3LXJhdGUt
c2VsZWN0aW9uOg0KKyAgICBkZXNjcmlwdGlvbjogbnVtYmVyIGZyb20gMCB0byA3IHRoYXQgc2V0
cyBETUlDIHNsZXcgcmF0ZS4NCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyDQorICAgIG1heGltdW06IDcNCisgICAgZGVmYXVsdDogMA0KDQoNCg0KSSdk
IG11Y2ggcmF0aGVyIHRoaXMgd2FzIGFuIGVudW0gb2YgcG9zc2libGUgdmFsdWVzIGluICR1bml0
LCB0aGFuIHdoYXQNCmFwcGVhcnMgdG8gYmUgdmFsdWVzIHlvdSB3YW50IHRvIHdyaXRlIHRvIGEg
cmVnaXN0ZXIuDQoNCkNoZWVycywNCkNvbm9yLg0KDQoNCg0KDQpva2F5LCBJIHdpbGwgY2hhbmdl
IGl0IHRvIGVudW0gZGVzY3JpcHRpb24uDQoNCg0KDQoNCg0KDQoNCg0KKw0KICAgbnV2b3Rvbixs
ZWZ0LWlucHV0LXNpbmdsZS1lbmQ6DQogICAgIGRlc2NyaXB0aW9uOiBFbmFibGUgbGVmdCBpbnB1
dCB3aXRoIHNpbmdsZS1lbmRlZCBzZXR0aW5ncyBpZiBzZXQuDQogICAgICAgICBGb3IgdGhlIGhl
YWRzZXQgbWljIGFwcGxpY2F0aW9uLCB0aGUgc2luZ2xlLWVuZGVkIGNvbnRyb2wgaXMNCkBAIC0x
MjcsNiArMTMzLDcgQEAgZXhhbXBsZXM6DQogICAgICAgICAgICAgbnV2b3RvbixqYWNrLWluc2Vy
dC1kZWJvdW5jZSA9IDw3PjsNCiAgICAgICAgICAgICBudXZvdG9uLGphY2stZWplY3QtZGVib3Vu
Y2UgPSA8MD47DQogICAgICAgICAgICAgbnV2b3RvbixkbWljLWNsay10aHJlc2hvbGQgPSA8MzA3
MjAwMD47DQorICAgICAgICAgICAgbnV2b3RvbixkbWljLXNsZXctcmF0ZS1zZWxlY3Rpb249IDww
PjsNCiAgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+Ow0KICAgICAgICAgfTsNCiAg
ICAgfTsNCi0tDQoyLjI1LjENCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBvbmx5IGJ5IHRoZSBhZGRyZXNzZWVzIGFzIGlu
ZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVyIG9mIHRoaXMgZW1haWwuIElmIHlvdSBhcmUg
bm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGluIHRoaXMgZW1haWwgb3IgYXJlIG5vdCByZXNw
b25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVtYWlsIHRvIHN1Y2ggYSBwZXJzb24sIHBsZWFz
ZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBpbmRpY2F0aW5nIHRoaXMgZmFjdCBhbmQgZGVs
ZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3VyIGNvbXB1dGVyIGFuZCBuZXR3b3JrIHNlcnZl
ciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlvbiBpcyBoaWdobHkgYXBwcmVjaWF0ZWQuIEl0
IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVkIHVzZSBvZiBjb25maWRlbnRpYWwgaW5m
b3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkOyBhbmQgYW55IGluZm9y
bWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFudCB0byB0aGUgb2ZmaWNpYWwgYnVzaW5lc3Mg
b2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMgbmVpdGhlciBnaXZlbiBub3IgZW5kb3JzZWQg
YnkgTnV2b3Rvbi4NCg==
