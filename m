Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061369DE3E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 11:54:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D64E8B;
	Tue, 21 Feb 2023 11:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D64E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676976843;
	bh=fZ7y5XemyF7yzoJMAI/C3fFpZMm0LO4go+Npv2pU+RI=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZLvSZ7vYI+sobCqhJOPlONIlt80Myibqsu8uMAAQcTjjusJQtrG+wfamNCGgERSXu
	 inrJOJoiXaxVDZlXUuG+M+foSE9sBa0eU0+0TslFZXANVFMorywvAqHLNhnw0EtavZ
	 DPSxah+58gQigT8JXfLYFJl3iH/qf4UVDRRoMZo4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1A9F8025A;
	Tue, 21 Feb 2023 11:53:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C58BF800B6; Tue, 21 Feb 2023 11:53:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C50DF800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 11:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C50DF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=2BeGNtBW;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=QrVwWv+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676976783; x=1708512783;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fZ7y5XemyF7yzoJMAI/C3fFpZMm0LO4go+Npv2pU+RI=;
  b=2BeGNtBWjw0JxmEVbOC3njtIE9MuQlVFw4u1CYrJVA8mCph8jOrSsbIF
   wGjSL3FKSiVbmOVdhAI9KxRXY7i5w4LxLT5Vi649Jj1z3sc/IIzJfVq3t
   qUsyCIYsQcGmHSDM42pmgmumdGg7eWe23OvLAj336TW0RNRezxDjZef61
   vrCixY4Efz000J52tBdxGBmlfi4tCaOHyJe2nvJswNbKgLJbukKhyjEib
   AToJoFZVPSd9bkBx0Cg4EZUKF/hXYyugTv3dTXpois1mp7dH1Y6UYvAfC
   74MNK9tNACnMYV6XLptC6K+h1hwFWxyydDuL3C58V88FlxCMSKMwv5RXx
   g==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400";
   d="scan'208";a="201871025"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Feb 2023 03:52:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 03:52:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 03:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W767L1w8qii8pCVNE256tyzjyW6aIvHzpTrMMiJX1zvOMwczotILIbcS/cX2Erf600r2Y2sGCPHNvWXohp1FlTnkSJF9NjlR/VUlebGhyYWt05NBmRaeyoorLZsUeeqQE9B/8ThIo3AINber22cO9B+Fx6/ga58EMJHKHudRCHTqSfug70s+c6Q+wuCzgwdKjocwyFfVcMn2RjJ227eP0cCeMDZQZZd/A0Hpe+gR49B3spVDeQ1+v+WKSGBwic5G3B7e4jNlSCVVZ0qKRg8iWD6riHB1moftQn5a0pBNzHDEITPpJvmIXgTfIfXCffpcz0S/xDMXDaDU9Y4T9wgVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ7y5XemyF7yzoJMAI/C3fFpZMm0LO4go+Npv2pU+RI=;
 b=aXuBGGXvAlRJU8cfWknqEoJ+dd5rQ0VJNv0KzF3uhkLY16b8C5NcgSK5K0/0N5fJan2OYXqtWs3YXSLKgYztPi8c+JCWrH2fm7LY8GS4Zk6Hi6FEwrikyRoW/cW5A5YSZ2Ek6qpxGIMo9OMtsiWTQQFxiJNwOyKEjhYMQByaydCjUIAXbV0u14RrG05pr8rWgLuxcZS93cI4FO5WJBW5VEFILi1OxRVNchbLhvBP/DIAxzlHX5g2tNmQca3AiL1RrKGOKu0nRmVjG1qsfdHedJ45qYyAV0gfXZ3N5VpvrtPKr+1H+7Asem99vQP09BXf8+NkiZWg9bXn6YDY1D3pOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ7y5XemyF7yzoJMAI/C3fFpZMm0LO4go+Npv2pU+RI=;
 b=QrVwWv+8HU/kmrxlUIlgpIyyjejee9o+qDQxO1hZ7KTAIBwjaX/BjnLPhWNJryrQmZoQWb3GV80+Am5KL2zbL+fNbCSliT5iED1JZDgk6ZBHGOPFPbM+be2ma0wk3Xn0QvKqd17SoQohBiY7RT/zeiA77AzG6GeomBQ6//y1D4w=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Tue, 21 Feb
 2023 10:52:54 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 10:52:54 +0000
From: <Claudiu.Beznea@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Thread-Topic: [PATCH v2 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Thread-Index: AQHZReKmzNyvhlRVF0GU5Ploz2+6Sg==
Date: Tue, 21 Feb 2023 10:52:54 +0000
Message-ID: <d607c1b6-712e-5c8b-8cd6-86673f4b354d@microchip.com>
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
 <20230217124151.236216-3-claudiu.beznea@microchip.com>
 <20230220225601.GA545317-robh@kernel.org>
 <69c4eccd-9d81-ac0b-802a-8e4e0d57589a@microchip.com>
 <cbe2e397-7044-277d-08a8-93010de339ad@linaro.org>
In-Reply-To: <cbe2e397-7044-277d-08a8-93010de339ad@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB5100:EE_
x-ms-office365-filtering-correlation-id: 0110fd31-ba51-47a2-2d26-08db13f9c8e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qS9WRBMdGnhASIso1uYtfTPqz1FKEfOiy4K3IlV3KtSG06gkgBxZdWBheAIXrRs67aE+FAovoueOLoWGL2EBTEb9J21CdnPIUnGwNKSo8N+ZhNtqpBQ2PwFcc0Oosoi2B7QeRRKlcq8K+IGJsvM1T+L2735jZ/x7MOWoHHwyCmc8AjIsXTlJZ65xIz5dx7fZbl0HNJDB5twAm+LUiooOp79X0B2CJ7q/V9pzgt9AyjAHmdse9b2RBTWZWRWRnC/9UbyQLLXYiOS82yMFxOgdNlkZZdTw2s7g1aIGKlyEysMHfw6IFtNZs1JLR2Xgbl91rTDEWircPVtVwUvl/QSPqfoQ/33BtR8q04raj7m0zgpG/rUDbTQvqlNKLA70/4uL08scPYQSRC8xPuailpe29g/QZ/47lToGl2PBNlu9YTOVA6KYishEAY8rf/RM0k2oY6Zgu/aTG7NFbuOzsz70kOTvkkdwrxCMHxjZONVc0s31FuYPxLRCw/CX8t08S3WrRPzSCombjj6j8PTDMLqfTZo4NElNkwEU4zCtF0JqY8/Ugrl8npVS/qL0NwMLXAXakTFstag5bBhr/XtF06YbMqXq0tgYXgsOgMCoprExzGhzkndOBKmZ794205fxZuOPz4QUgJbUEXRbPSwAmMmdm+ygFDh4J1UijDR0NUt3L78ct7laJhnDcRxM+nNNzvwTbVmBCJGOPEKOfsPPxA325jsazvzfd8WJRSyDPypJO8R2cLM/QdZGz6Xxg/rVvnRm1UqVKY+XW2zHPYMCZWWyFA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199018)(31686004)(83380400001)(2906002)(2616005)(4326008)(64756008)(66946007)(71200400001)(91956017)(8676002)(66556008)(66446008)(6506007)(76116006)(66476007)(7416002)(26005)(186003)(6512007)(122000001)(53546011)(38100700002)(36756003)(8936002)(110136005)(86362001)(478600001)(41300700001)(6486002)(54906003)(31696002)(5660300002)(316002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnpLS1c2S0V6L0t2NUE4Qk5JRUpvckU4Q2JxSzhJYVpvaWJJNURISlZJVEt3?=
 =?utf-8?B?ZSsvNXUzVlU0WUVhOFVpeGg1MDZqTmxoR1FVUWdrYWxOOS9kdDZEQnFFK0Vu?=
 =?utf-8?B?RlVQQ25zc01YQlV0d21tYnR1U2xzT2hoR1I4c0pYVkE0bjVCcG5lbjBjL0g4?=
 =?utf-8?B?bDFNYWlyWFBZcFQ0MHVwVEtxMUxmdEFpckpKcklZRHdOcEFpRXg4VnUwdjli?=
 =?utf-8?B?RHkrenZtOFVCVDdVS2JwTnVTSGxVenhjM3NFbDh3YTk5WDV6UkJkOTlGUEFz?=
 =?utf-8?B?VmxlOXk5SUR6bnZ3MjJqMVlTSnd6ODVmV2tyUGs4TWtrUEJRWFRyNEtZWDQz?=
 =?utf-8?B?TVhVb25lenJtYVB0WXE1VDZ2VmdRS0ZXLy9VQkJHK0NBc051RXQwSlZrZ2hM?=
 =?utf-8?B?T1dzeXNvU0duSk4yZ1BDbEdjRWJjNk1uUVk0WGh5S2tYVExLdjV6RTk1MXVR?=
 =?utf-8?B?Ym5Mc2NqejcvR3ZuL1hNbHpzQmd0bHkycEFUTVdVWHZuWVl0T0lpMUNvSGxX?=
 =?utf-8?B?WVg0alFrd2F2ZWNSQlkzRnRzUDBrWjZiRFpwN0lyVjZzWlFudzIvQ3hZcmN1?=
 =?utf-8?B?MXlOWEtobUY4VjNjNFhCZ1IvbzVyU05VRHNhSzR4U0JlYUFtV2N1KzhNbUt2?=
 =?utf-8?B?bW9aY1QySFZDcVFEZ3prTDdxbytvdUw5MGJkZUtOdmQ4WmcyREduOTJud0Nq?=
 =?utf-8?B?VHhrUHdXNC94SmhNVU9VWnQyRHZyQkVrb001NlBMaXROVjM1UUlnaXFIeSs2?=
 =?utf-8?B?ZG9qRU82NVZtMUdYWFRLcEZxbWxLbCtPQ0dyY04wcWpxaHNDYW5Ja0xSUkp1?=
 =?utf-8?B?TVJjeS8vQU9pMjdxaTRrcHJBaFFySDEzdHNwTlpSeTB3K3BFY2lNaFhXRysr?=
 =?utf-8?B?eDhiRlV0TDJyb2luQXg5czN6RkliUi9jZGttR0c4SlliOHJJcFlEd2NaVG5U?=
 =?utf-8?B?RXByNnpWVEZOVDRjKzZmWWJnYm1qdUF1WWdFSndCQWd4blFuQVAyQ0Vibk03?=
 =?utf-8?B?RW9TMlBLTUZzQlkxZDBHUE95OHFUZmNWZmdQaEt4Z21hZTlQNVhxSWw4cDVn?=
 =?utf-8?B?d0lTSkdyNlFwbG5XaVBXQ0RTNkF0R0Ntb3pEZXVPUHJUWWN4RDRNbjJNUTBP?=
 =?utf-8?B?WTd0MnhTQzBYRkZ2ZTFzVVo0UXhDdkhzaStqcEtzelNtNlo4ZC9QUDY5QVND?=
 =?utf-8?B?VFFpNmlBSUZkd1ArZ3RId3lkYW4yN2doNUR2cExFc3ZRaUkwS1dUN3Z1V1Yv?=
 =?utf-8?B?Uk9jajFoODFRdzdXWDNhbWlIakxDY0hwd0pEUEhEdVp6dDBuRkF6YVZLeXR6?=
 =?utf-8?B?YlAxTnhITXA2U0tRNXhHeC95ekxTdnFQUzNFU1ppNnlVK0RzQXNkU0liY1ZT?=
 =?utf-8?B?Lys5VmJ2bmtmZGdSTXBGc2VXWVY3d3VyZGh0RnUxUUd0Rkt4OWY5YzhSWm95?=
 =?utf-8?B?NHhyUW1QNmFwMVJOT3pCTDdwSG45UjRvWnZpb3VYbFpEanpOb1dTbXNhUy9w?=
 =?utf-8?B?bnZ3ZE5LR2d0WS9sUmsrR0dUK1dxTXh0d0o1ak9kS045NXB3bU42aEs2YUZz?=
 =?utf-8?B?YjhnOWRNNlhzWTg0bGlycndlbG1Lai9LOHZxVFRCS0VRbzBFZ0EwVG5DdW02?=
 =?utf-8?B?TWxxaEhxZjVSMmgvcXRjQW96amUvYTNhTE5mSTUvM0l1RTFUM1VMcnhBNG9Y?=
 =?utf-8?B?STNTanZPL3RyM0VMVVY2TDBiUUtPa3RDNFZNZ1RCcGFVZnBmZDlwbjhBSnZ0?=
 =?utf-8?B?SnNncENrc2RvaTVWa3U1TksvbWxaWWUyUis2elFlNXp0Nzl4QStpaW9JK1Qv?=
 =?utf-8?B?Z2hpbEFEWEFSQWE2WERYZ2JRYTVhbHk3OWFjU1JrVzUvOHZNOEFnM1NIay9F?=
 =?utf-8?B?dHlIVXo4MHEvWlBYUmFIWDNSS3pKTFRYcjd2d1N2ajJnZUNiQ3gvK0orZGNy?=
 =?utf-8?B?bGk0WW9uVGZNZHJHT3RoNzRWdWE0NmJvYmdGZzRXQ0pkSEIrTjJOUm85dk03?=
 =?utf-8?B?cHFqRzlXUHFMMWNxcXBoeDdGR0V0S3p4bGQzVXorNTA4Z2FBdnZhYjFrMS9z?=
 =?utf-8?B?ZVUyS1lXbTlYSkxXTlc3OXh2bzY5QTg5bjI1K20yQkt2VFEyWkltWTl0dWd4?=
 =?utf-8?B?UUVFcU1ZQWFPL0JhazdhL0FjbThNMzNtY1hPMkNOVXhXWm50NG1oMmtYcFo5?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B225F61FD33BFD49AF16A37ABC20A3F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0110fd31-ba51-47a2-2d26-08db13f9c8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 10:52:54.0941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 aB1jr1Z2/uQM6qPXswCtPnLIQOBuJNXdR5kdj+5bl1QCw3zBlIAPakwjTvjvJSYYME9jv5kZwl8PLMxUy96nLozzzvd+qzvr/sYt9fPAjpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
Message-ID-Hash: P6VUGKM3FHQXTLXUVETKXQAFPJBU75A6
X-Message-ID-Hash: P6VUGKM3FHQXTLXUVETKXQAFPJBU75A6
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6VUGKM3FHQXTLXUVETKXQAFPJBU75A6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjEuMDIuMjAyMyAxMToyMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAyMS8wMi8yMDIzIDA5OjEwLCBD
bGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMjEuMDIuMjAyMyAwMDo1
NiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+Pj4NCj4+PiBPbiBGcmksIEZlYiAxNywgMjAyMyBhdCAwMjo0MTo1MFBNICswMjAwLCBD
bGF1ZGl1IEJlem5lYSB3cm90ZToNCj4+Pj4gQWRkIG1pY3JvY2hpcCxzdGFydHVwLWRlbGF5LXVz
IGJpbmRpbmcgdG8gbGV0IFBETUMgdXNlcnMgdG8gc3BlY2lmeQ0KPj4+PiBzdGFydHVwIGRlbGF5
Lg0KPj4+DQo+Pj4gVGhlIGRpZmYgdGVsbHMgbWUgYWxsIHRoaXMuIFdoeSBkb2VzIHRoaXMgbmVl
ZCB0byBiZSBwZXIgcGxhdGZvcm0/DQo+Pg0KPj4gUERNQyBjYW4gd29yayB3aXRoIGRpZmZlcmVu
dCBraW5kIG9mIG1pY3JvcGhvbmVzLCB0aHVzIGRpZmZlcmVudCBib2FyZHMNCj4+IGNvdWxkIGhh
dmUgZGlmZmVyZW50IG1pY3JvcGhvbmVzLiBEZXBlbmRpbmcgb24gbWljcm9waG9uZSB0eXBlIHRo
ZSBQRE1DDQo+PiB3b3VsZCBuZWVkIHRvIHdhaXQgbG9uZ2VyIG9yIHNob3J0ZXIgcGVyaW9kIHRo
YW4gdGhlIGRlZmF1bHQgY2hvc2VuIHBlcmlvZA0KPj4gdG8gZmlsdGVyIHVud2FudGVkIG5vaXNl
LiBUaHVzIHRoZSBuZWVkIG9mIGhhdmluZyB0aGlzIHNwZWNpZmllZCB0aG91Z2gNCj4+IGRldmlj
ZSB0cmVlLiBXb3VsZCB5b3UgcHJlZmVyIHRvIGhhdmUgdGhpcyBpbiBjb21taXQgbWVzc2FnZT8N
Cj4gDQo+IEkgYmVsaWV2ZSB5b3UgYWxzbyBoYWQgZXhwbGFpbiBpdCB0byBtZSwgdGh1cyBhcyB5
b3UgY2FuIHNlZSBoYXZpbmcgaXQNCj4gaW4gY29tbWl0IG1zZyB3b3VsZCBzcGFyZSB5b3UgdHdv
IHF1ZXN0aW9ucy4uLg0KDQpSaWdodCwgSSdsbCBhZGQgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4N
Cg0KVGhhbmsgeW91LA0KQ2xhdWRpdQ0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KPiANCg0K
