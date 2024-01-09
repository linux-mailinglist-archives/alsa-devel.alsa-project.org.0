Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06220828501
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC77D84A;
	Tue,  9 Jan 2024 12:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC77D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704799653;
	bh=nArpcTO6smH6PFPwqrfo99vh7Ndu2X+waQPbf/JUr80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BR/f6EHtKzIFrWwaxpG+N0CXxOkthcSnEYkxoGAlBgsf6/kC6JZe7QUNA1U79YvOC
	 f4D8yqiYBzLceGjVh/Q8ocJz05oZmIXLTrGQLZYtebBEMgBStIDgbgjP6fldMJZzFi
	 oPvxgxIth9TNYJebRYpEuxlrBoO0gjjD4i1o5hwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F05EF8057C; Tue,  9 Jan 2024 12:27:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A3E9F80587;
	Tue,  9 Jan 2024 12:27:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DA6F80254; Tue,  9 Jan 2024 12:26:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 731BEF80246
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 12:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 731BEF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=eNoxIbuq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/kgAYt+W1QDS2Gf2T0JaXaJ8FNqF6XgYBvRgcjRq8NKNT4xlEfZZ+Rh0vWmihVLB35ugSAhjOG759Ca1iHQT5nzeGY5UdGu7HRzDYMK1w3VTWY8N9S5w0Oc1JryycfuUYqPkl+S7MTB/CPvjOaTX21i8u4e1un11NEfVqyON1/eKvUAwiaK2VGmkujryIX7AlO/1fDQGvfvXR3EfOhD75iNeEyk8NXPxAMPR+8rEezeWYSZtyYA59Y0apAvcMR3QMM5lygTqGLUYBxCYn3V1qizYwa6qPVYSEuuNqiUQF6oVOt7jaKeAx+44zF+sfBzeEapR1vKJh3jeFQebUb2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9EkNixiQtm99BrORsulFt6keDiiaISwFnbPOYnLPlk=;
 b=ORx9S2+pFkRUEjv+CNsWNmcOtvK8grYZ6TDIeWhVaVv0Ywq22vISQPyP70qrCeH7GzvKtJ2kPgdJb+gRb/MULEeStILKSrekVST1kn3X3bjnlvE7F65U5kl38+2E6ix5iS6JNJQ7deOHzCsMBF8VQ+DdPZk/9ZRRsD3BE4x9ZS6SZO2Y730BqDtMuAc2pRkoDJmTHYIz8u1JgMmBTNicfAjHetINe2/oPS76/6jTSBQAzxWj4RMypNjSGCyqA2cwZJMNbecQhMNVJzf90ikJMIokQ/r0/YEHK07+v2j/QRuHyYC+QWrVLr8Nbd+GxQkrecGov5l50jWGrFJ4a0j0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9EkNixiQtm99BrORsulFt6keDiiaISwFnbPOYnLPlk=;
 b=eNoxIbuqU+c631d4LEpv6ic54W+eFnaxSABfOH0gYO5Sk6VY9/cDrVxUw7jPhWcu17PwkiWdMFj+eZiIl4E1QFcFytTlAjCm6Mzuw4pD7lRft8oD4/q93XNpXqbnQ8VM6Um+9Qn0yTPu9Mk+zokom5ePIw9Jo3hTSYAPd5kpmEm9orwso5pmgASTlA2a4qLPvR5qYYJuWaP2oy0YWC5pPfeiQrgTFNzcuVsYTng3rMwM+q5lL3HgzZrkf9db2PGkZmKOdFGPN3zC9Y/V392rcVMZwiFC2KrzJ6U8z64Z8wLR/AlLLR9/fs4/g40+/aQwa8YJ4LoRylSON61o97YM1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 9 Jan
 2024 11:26:49 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:26:49 +0000
Message-ID: <93b846e2-3c16-44cd-bc09-b7114e7ce42a@nvidia.com>
Date: Tue, 9 Jan 2024 16:56:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
 <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
 <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 387e3f3f-c2a0-4655-a305-08dc1105df27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3b2hvLRUZqODqGN1ttnxXbp4N5og2E/BjpiZza4dhxzKcPPJaGtBXWUy6Fa5Zk5VVX4JF2GM8jjVsCeags6SAWfrrQ3yVwICKynAA+t0aLlPBw9j1UXYt9YNBcVIY5PiaXwrh2YwlQM+jNJz3SK5v/FEm08Y/OIDvtWmDiJCWmAL3prr7/XexHLPrD4N27Lt1S/PvJTesMEISMUcbq5K0e3YstQYrtu/ZEzJCnV9ALqqgzL9MHCo76R/0s1GW/CXuvFlk7hKloFYMmExcQWFwQ+KU0+yKRzfLeYdqlj7Yo0VMwAdbfuCSEroM3prio+lxWDfIk55L8aMotptv1hfR14jkjBasp1KHoN3F7RwKZyk8aGRVkfgD3o0I2snMlmXQ3BqnAc3mqZi1i8S/hulZZkz2ECBnDF/T2W8ZCMif0Zc1Xr0tMekWoGLoqHlbkXDGidUb39f7gEYbKZkfbZVFsqTgYNYh8XR9tV0BVTYzCsksyeZOwRAipAokELlX+UU0Bq37kY0u1g56syZ4ZL9+VtJT/PesTm6JaQ2SbSWOIAzYXYoG30y4Vm575lC10hnjrIu7G/rp5BFAsd3kD2MYDOFFtOS8lsVqQU6OTudPN2744nSj1iyK3EqgZlXUuLqnHmAv7CTqpkFugkoK3XqbM220UUI1o2SWgT6AknajbL0nHpCEpN4It/ubgujuBmy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(2906002)(478600001)(6666004)(5660300002)(2013699003)(4326008)(41300700001)(66556008)(66946007)(66476007)(6916009)(36756003)(54906003)(316002)(8936002)(6486002)(2616005)(6512007)(31696002)(6506007)(53546011)(33964004)(8676002)(86362001)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzMxODVzUUJxZkZ1bW9vZVdmb1VweE1XUHIzREl6N1VQZXZuL2RSd0V2emN2?=
 =?utf-8?B?Rzc0b0tJTmlaMFA4Ti9oTjJkSUNtc250MHY4T3ZNUEZpY0lFSExEeW9GNitH?=
 =?utf-8?B?WERHZXJiZlE5Zk8zazAwa2V2cW9TOURTQnFGYi9tMVJ4cUtqcVZ4NXRMc1lB?=
 =?utf-8?B?K2JTSEpNenV3aVVCQ2dtY0c4RElQUTZhNC84ajY0NjMrSGhhb3FUNkJFZmJv?=
 =?utf-8?B?dEQvT1MrUmRtalpLd2F3M0h3YVBqdzJoVTJDSnJ2M3JGWHo3Y2pPYVA0M25R?=
 =?utf-8?B?M3NFcld4bnd3Q1Jwb2dRUExMcXVVMTRZRUFaT3ltWUhqd2lnbHJFYWRFb21C?=
 =?utf-8?B?Zk9SY3hVZzR2Q3oyL0wyRUZtblJmN1JtcGlrSCtFZG9LYkE2ZEdkQ0h5eXpR?=
 =?utf-8?B?MmJSc01PQWJSOFZuR2lwWDlEalpxU3ZBWXRiSENmQ3dtL2dGZ1AxTDZBUjF3?=
 =?utf-8?B?VE5rZ2ZBcG1PSFM2eTdBdzJQc2oxUHdPOUFDZzU4WGIxTHZRRXB6TFNEVlc3?=
 =?utf-8?B?UVZEQkd5L05PcTE1S24wZndHbUpYQXVkZjU0d1BEbUdYYUtnM3BwVmkvQzY4?=
 =?utf-8?B?bldBTmxQSmJVaUJWRWVVVkU2d0V4RytVRlQvTVRPT3JLYmtkckpXR3JyMThR?=
 =?utf-8?B?dzVzdTZVTVhFV25ZK0VNUm5tVllrK1p5UnAzWmxlcTlVaHNNd3Q5OFVyODF6?=
 =?utf-8?B?WWhHVUlRd09wRGc0b0lPYWtIZ1VGQTBWRVo2WEx3Q3dVeWNFT0IydlpkeFB4?=
 =?utf-8?B?TGVNSzk2UjVVakF2bDQyaUJrVnZkUUE2VDNiSHdWU09RQTczb2J6QnJERlhV?=
 =?utf-8?B?cXNRaVFNaFlQcHpzczlhRjZnTUh2bkVuaXpKb0taenBRNGpZcVBXRFpyakZ2?=
 =?utf-8?B?dVpSWnNhWTN3VEt3UTdZc0dITzBKdi9CQVBTT1hlcGR5NjNFODNjR2Yvc2FZ?=
 =?utf-8?B?RS9tNGNKQk9JTk1hbDF4VHB4SnpjbnU4NU55ZmpkeWtGUTlWZ2Y2eUlLZ0dD?=
 =?utf-8?B?NDJXclU4NkQwY2xyTUg0TWVTT3pMYklXcFZjL0ZhMW9aekdsV1FKUGQvUVEy?=
 =?utf-8?B?TWRTK2g5VWtwcVZ5U2VCUGIvS2puMDljNmhnL0o1TzJQRk1keGZFTDh5c3ZJ?=
 =?utf-8?B?a2Y0OTFVeVR1c3h1ZGR0VytiVGxHWHFmbDI4ODBlOWN3UnRuU3BTQlphNUdE?=
 =?utf-8?B?cW52endlbFVrSzdtSE1mRTlncHU2SFZEOFpnamRqSXpkL0Iyc0NScmFuZm5n?=
 =?utf-8?B?YzFFaWdoVFd2dXNNK0xYd0M5dTRqVFlZWTUwQmE1L2VSbnR3akNjOE9GTnp3?=
 =?utf-8?B?VzhlbWlBUmluN1kwUlB0L1BkeXdUc0NmQmhKQ3dsaGZnZ1gyWjIwQkhmOU5D?=
 =?utf-8?B?R1BaSVV3ZDFpRTZ0TThxb3o1bVNBNHJJNGdxUGYxSG0xTFpIMlV0OXFLeis4?=
 =?utf-8?B?UUNpSExVMFZqcnNtcFcxOUNpM0IwZDNWZTllcHlNQjd3cUlFejZqTUdCVHdE?=
 =?utf-8?B?ZExPMlRHOEQ4V3ZDRlBLTTlTYWwydGhFSmljSDdIb2VsVWFYaXlPc3FLOGNv?=
 =?utf-8?B?Qy8xY0Y3QzlRc1g4ck1zZWFyU3Q2azA3ZkJIYU5LOXJLUDBWVUhCdVREQTVS?=
 =?utf-8?B?WkxvTXdPNjF6VDVVczB3REtYUStUektCZnlUakRmRGxaZlRCWW1VYzVKVUVj?=
 =?utf-8?B?V3ZYQTlmZTZIcUczeko5cmRmR1pNaGJlbGs1My9WVW1NU3VTWVFxcFRkUjlx?=
 =?utf-8?B?d1R1R3F2eEgwUWkrZ0lRQlJkakFPYUJGejZuNDArSy9RaWV0aW9nQkJwZjFZ?=
 =?utf-8?B?UlVCRmtDcTBVekI1d3RmUjFnMUpERmlNc1hzMnNHQ3I5dnpxbXZtblVha0d1?=
 =?utf-8?B?c0VTZVVmSVNQZlZnWlkyS0RXcHI2T2JjcjYxcGxqejR2VERtZTlSbkY2UUNh?=
 =?utf-8?B?Q1RKdUxyNUFnVTUwNUZueU5LUHlDZ05uK3hhUHV0RnE0Vm1ZUERCQnlkUElW?=
 =?utf-8?B?Vi9wVURQVitzZzd4UUJ4dVU5WHZjZHpIc0VFd1BuM25Pbm9zY21XRTFWcHMw?=
 =?utf-8?B?ZEpRYjV0OTZTa2FxVC9zVW5RM3pmSzYxVEdRalhLbjkyWkNUV0x6SXI3YWV1?=
 =?utf-8?Q?+eNE2/FjlrfEg1yvzbNmeMbOP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 387e3f3f-c2a0-4655-a305-08dc1105df27
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:26:49.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6pfd8j4u9j4n0bhzRyNBafVllOuhqF1qUDztZM6ZzgAUIkLl7vU1pZpU/oC8NlP8r1jGgYDkzehGWozcJDO3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
Message-ID-Hash: G2ME6VTNLHSKQORFGWDIOFITZGRHJRWQ
X-Message-ID-Hash: G2ME6VTNLHSKQORFGWDIOFITZGRHJRWQ
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2ME6VTNLHSKQORFGWDIOFITZGRHJRWQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCk9uIDA5LTAxLTIwMjQgMDc6NDcsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOg0KPj4gICAg
ICAgICAgICAgICAgLy0tLS0tPiBjb2RlYzEgZW5kcG9pbnQNCj4+ICAgICAgICAgICAgICAgLw0K
Pj4gQ1BVIGVuZHBvaW50IFwNCj4+ICAgICAgICAgICAgICAgIFwtLS0tLT4gY29kZWMyIGVuZHBv
aW50DQo+IEl0IHNvdW5kcyAiU2luZ2xlIENQVSAtIE11bHQgQ29kZWMiIGNvbm5lY3Rpb24sIGFu
ZCBpZiBteSB1bmRlcnN0YW5kaW5nDQo+IHdhcyBjb3JyZWN0LCBjdXJyZW50IEFTb0MgaXMgbm90
IHN1cHBvcnRpbmcgaXQgc28gZmFyLg0KDQpZZXMsIHRoaXMgaXMgYSB0eXBpY2FsIFRETSB1c2Ug
Y2FzZS4NCl9fc29jX3BjbV9od19wYXJhbXMoKSBjYWxsIGluIHNvYy1wY20uYyBsb29wcyBvdmVy
IGFsbCBDT0RFQ3MgZm9yIGEgDQpnaXZlbiBydGQuIFNvIGlzIHRoZXJlIHNvbWV0aGluZyBlbHNl
IHlvdSBhcmUgcmVmZXJyaW5nIHRvIHdoaWNoIG1ha2VzIA0KQVNvQyBjb3JlIGRvZXNuJ3Qgd29y
az8NCg0KPiBCdXQgZHVtbXkgQ1BVIHdpdGggTXVsdGktQ1BVL0NvZGVjIGNvbm5lY3Rpb24gaGVs
cHMgeW91ID8NCj4gSSdtIG5vdCAxMDAlIHN1cmUgdGhvdWdoLi4uDQo+IFNlZQ0KPiAgICAgICAg
ICAke0xJTlVYfS9zb3VuZC9zb2MvZ2VuZXJpYy9hdWRpby1ncmFwaC1jYXJkMi1jdXN0b20tc2Ft
cGxlLmR0c2kNCj4NCj4gRFQgbG9va3MgbGlrZQ0KPg0KPiAgICAgICAgICBbTXVsdGktQ1BVL0Nv
ZGVjXQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICArLSsNCj4g
ICAgICAgICAgICAgICAgICBjcHUgICA8LS18IHw8LUAtLS0tLS0tLS0+fCB8LT4gY29kZWMxDQo+
ICAgICAgICAgICAgICAgICAgZHVtbXkgPC0tfCB8ICAgICAgICAgICAgIHwgfC0+IGNvZGVjMg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICArLSsNCj4NCj4gVXNl
IE11bHRpLUNQVS9Db2RlYyBjb25uZWN0aW9uIHdpdGggZHVtbXkuDQo+DQo+ICAgICAgICAgIGF1
ZGlvLWdyYXBoLWNhcmQyIHsNCj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF1ZGlv
LWdyYXBoLWNhcmQyIjsNCj4gICAgICAgICAgICAgICAgICBsaW5rcyA9IDwmbWNwdT47DQo+DQo+
ICAgICAgICAgICAgICAgICAgbXVsdGkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgcG9y
dHNAMCB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBbTXVsdGktQ1BVXSAqLw0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWNwdTogICBwb3J0QDAgeyBtY3B1MF9lcDogZW5kcG9p
bnQgeyByZW1vdGUtZW5kcG9pbnQgPSA8Jm1jb2RlYzBfZXA+OyB9OyB9Ow0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDEgeyBtY3B1MV9lcDogZW5kcG9pbnQgeyByZW1v
dGUtZW5kcG9pbnQgPSA8JmNwdV9lcD47ICAgICB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwb3J0QDIgeyBtY3B1Ml9lcDogZW5kcG9pbnQgeyByZW1vdGUtZW5kcG9p
bnQgPSA8JmR1bW15X2VwPjsgICB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfTsN
Cj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFtNdWx0aS1Db2RlY10gKi8NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIHBvcnRzQDEgew0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwb3J0QDAgeyBtY29kZWMwX2VwOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2lu
dCA9IDwmbWNwdTBfZXA+OyAgfTsgfTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9ydEAxIHsgbWNvZGVjMV9lcDogZW5kcG9pbnQgeyByZW1vdGUtZW5kcG9pbnQgPSA8JmNv
ZGVjMV9lcD47IH07IH07DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRA
MiB7IG1jb2RlYzJfZXA6IGVuZHBvaW50IHsgcmVtb3RlLWVuZHBvaW50ID0gPCZjb2RlYzJfZXA+
OyB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICAgICAgICAg
ICB9Ow0KPiAgICAgICAgICB9Ow0KPg0KPiAgICAgICAgICB0ZXN0X2NwdSB7DQo+ICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJ0ZXN0LWNwdSI7DQo+ICAgICAgICAgICAgICAgICAgcG9y
dCB7IGR1bW15X2VwOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2ludCA9IDwmbWNwdTJfZXA+OyB9
OyB9Ow0KPiAgICAgICAgICB9Ow0KDQpJIGxvb2tlZCBhdCB0aGUgMTpOIChTZW1pLU11bHRpKSBl
eGFtcGxlIGluIHRoZSByZWZlcmVuY2VzIHlvdSBzaGFyZWQuIA0KU2VlbXMgbGlrZSB0aGlzIGlz
IGJyb2tlbiBpbnRvIG11bHRpcGxlIDE6MSBsaW5rcy4gSXMgdGhpcyBjb3JyZWN0IA0KdW5kZXJz
dGFuZGluZz8NCg0KQWxzbyB0aGUgYmluZGluZyBwcm9wZXJ0aWVzIG9mICJhdWRpby1ncmFwaC1j
YXJkMiIgc2VlbSB0byBiZSBkaWZmZXJlbnQgDQpmcm9tICJhdWRpby1ncmFwaC1jYXJkIi4gSSBh
bSBsb29raW5nIGF0IGEgc2ltcGxlciBleHRlbnNpb24gb2YgZXhpc3RpbmcgDQpiaW5kaW5ncyBm
b3IgVGVncmEgYXVkaW8gd2l0aG91dCBoYXZpbmcgdG8gcmUtd3JpdGUgdGhlIHdob2xlIGJpbmRp
bmdzLiANCklmICJyZW1vdGUtZW5kcG9pbnQiIGNhbiB0YWtlIHBoYW5kbGUgYXJyYXkgaXQgd291
bGQgYmUgc2ltcGxlciBmcm9tIERUIA0KcG9pbnQgb2Ygdmlldy4=
