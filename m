Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797A677D1E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 14:55:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0333217;
	Mon, 23 Jan 2023 14:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0333217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674482107;
	bh=ObuprgRICx3rfHPvf4xiK9ew7Q8zVmZLL0wXGvCJq2Y=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f4EkVH6ya718sM57lMqhPJPSH/hNqHlw2zct8aKjkqDUN28bEIR95PM010gLNaiYI
	 0pSlTDThiCjEA398R/HwbcO10jEEB+b4aGK6zRXpMGeG2ZE4ZGVhM5T6dWfursp3hM
	 sNkKgKy/ZUe8DFBrfrqYLQavFRzq+NpPFqA7PGHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C5FF804F3;
	Mon, 23 Jan 2023 14:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47484F804C2; Mon, 23 Jan 2023 14:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on2040.outbound.protection.outlook.com [40.107.12.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08458F801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08458F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector1 header.b=1taRwo9f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IClKQCduY/O2BBmIiZvbPWRV/4TXB8v5eOVB53KYpw11UB2POEow4TGfFWPQK0D3kfyEo20Fr8vOAKd/g0kGNpVJ6D6XD6JIPk95PsSAjFjHKlTXSkVAKJ4RELRo2Q2+AhsWVDYX7I3sOu5VGvxjagBIulCHH0nVqaNI9WTLIV610pra7/9PAorfnudp8xtpylvoKvOnnFFv5qLK4IljBjXja6vifr1574JFT/zk4m/VkDaknwQ//bium9b+2r+LI8EwMMcXgOwMNzjSSQLYJCdbP5P0gUXXMwr//yrCNdwQCZlhm80n5l3WAw+SUBdNIfpDdE9rU0PEYU4cqLJUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObuprgRICx3rfHPvf4xiK9ew7Q8zVmZLL0wXGvCJq2Y=;
 b=WCrj8BUpBC+pkfWPEXOuLZ3isUQLwCXGF8u4dyJUdSezoftUXhahCU4uxej7vXXSqB2JdwiXGSUgmBOxZrctIbOkvGTqz7I30j1yM78irZV+h5hO+llQxXJWT70UcTemVG+8aofmfdK6LL+/JBcOmGGSEifYmbe5VTIOgp4JvIpw2BAmrylYcDKgUfrL/796+TIJBRptFx3/jZ+BCR9Zo/Jm0dDdjcf1Ve9jxrV/BYmsSfSHRdpsMsafnyYYNtlMEesfmpijuohCPO6WVBG8XuX6k9d270HaKw0mRs1Uz5GnSQ2FqWgIB+kdG2WayBJnuF7xTQVPOKaYKlJ610dZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObuprgRICx3rfHPvf4xiK9ew7Q8zVmZLL0wXGvCJq2Y=;
 b=1taRwo9fqZ+Gh7mohuQssfzALAR3sUcw6hEVfUnRkuLiM7Tua5A6ppxmWiLFBvPWkdd5X4NrwgMJn7kcq6+GrO0PL15HUMCqP2p8z6h2vUjAD70x24DfZyiiBQgeJJ4JYov0tw0Kh94L/dh9R5zSHO2p7VdxCeiY0qbhDBcS3rrD4+U+bP8v1tD8h3UQc0vBAGnYDmTpUS/vwKScBvEVfVFi7/G+tkXTT4GobCSZLdj35xkjob60g5nmkrzwThL2fMxAi1jO11vXlg7r7QDlLN+7B60yI9bh/Ll4LO0S8oWuGdlfpccvgTSxjtI0Mt67omu8z2lAJz7GLywcniiIqg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2494.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 13:53:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:53:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add support for the Renesas
 IDT821034 codec
Thread-Topic: [PATCH v2 2/3] ASoC: codecs: Add support for the Renesas
 IDT821034 codec
Thread-Index: AQHZLLSvyotuf1YmL0q52bZzrUxZsa6rpj6AgAARhICAACY+gIAAEgiAgAADhYCAAAgjAIAADykA
Date: Mon, 23 Jan 2023 13:53:54 +0000
Message-ID: <e7c35648-d6d3-fea5-f9b1-0dd36e21c1ee@csgroup.eu>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
 <20230120095036.514639-3-herve.codina@bootlin.com>
 <d51b826b-e71f-393c-586b-6a1ca953f26f@csgroup.eu>
 <20230123095631.4aba35d6@bootlin.com>
 <eb20dc66-f564-ed7e-8873-65621e5970de@csgroup.eu>
 <20230123131755.1f5702be@bootlin.com>
 <79b35117-98aa-dc7c-2a27-805cd4ac2c71@csgroup.eu>
 <20230123135938.1855d6a8@bootlin.com>
In-Reply-To: <20230123135938.1855d6a8@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2494:EE_
x-ms-office365-filtering-correlation-id: f0a38327-df80-4a87-9875-08dafd494429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Q494hys3vJMC0wwUWw4CjfX1GA4y6WaP2s9tzUMCzPFfwIpc164Ntonuc4pPh1CBmbe+Zlt81RZfCu0nRE4VayjSWJ+OQnQhbOzNXLtmmPvuE+GHXRbCMVA1dk1lWAIigFjxu6dwvTflqK9D78dunQ+nRoq1iKCRQisO6uq6DSPssvyxdgZW7cyohnSufEC1jlFvDvaCOI7uTDmW5x0DCJApTWfb4UuheyIs3dONDZ5oC5E8HgcKP/CtoY62Kog+TYxAVazug5pYKGUaVlmZ5GEefH/k83qHE6aCS7DI844N/uNrI+xdMlYB2koneGigfRuL+x0c3Ti/X0aUazBpWh+enlrXA7QdSEyY+ixQB7LC4oYM2Iwh7XYJN6BhKJMuhLLsYWiC8EX+nw+IHzbE3kKGRAB65TGIqhtBnBiAyAAoRkh9WmNMMuomoc8sWf/ekH9f3rrCyub7td0my2gH4f5PZxACIv1kNEc5XVI0bcTvrUs+4HMRza6vVhT3+0lgGnUYygRN0Z9wO8V5nvo86Bw9ILHQr3E6MpIdYLSoGbtJs0bwwkkoZnokMY2+PXvTKBD0zYjpWyXI62PzEb55jBpWoM4LRTBJd3fnqQ5NStNeD3iNpWCh5QSr4SztC1366qAq7hYoTHyDH3z+BOmlzNI4UE5v/X/aYO+XxgW1sDpc+TVlQusxs0wUx7Rd9nekgJ9t8fLyHP4Kgkl9PSMIBIv8PX7b+lG0plLTMn7hvj89pB5kbOs+UQYYrs+JAneHcDV3fSJTqXbBHN4mSDIYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39850400004)(346002)(396003)(136003)(451199015)(316002)(36756003)(6506007)(558084003)(38100700002)(122000001)(54906003)(41300700001)(2616005)(38070700005)(31696002)(2906002)(6512007)(186003)(26005)(76116006)(66946007)(66556008)(8676002)(7416002)(44832011)(4326008)(86362001)(64756008)(91956017)(5660300002)(8936002)(66446008)(66476007)(31686004)(6916009)(71200400001)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aCsybUNuNVhaUkgvSnVQUmZnblUwNUtZQ0plS0RURlVFVzhLOWQ4cGlscmJk?=
 =?utf-8?B?MytwdVlnNnJUaENtakh2TDg4RVc4QVRlNXNyTnExZFMwODNiVHlnNXBUVXZ0?=
 =?utf-8?B?UHZSUVE4cVJCRlBTQTJkalVxbksySHU4NE5XeEF2L1htd2pyZ0p6bXhTU1d4?=
 =?utf-8?B?V0FYbmNXS3cwV1ZGNysrbjBCWEFXTHUyRFFwQXUvajZ6d1hOT2MvZzNxYm1Q?=
 =?utf-8?B?d0tLaXRjUi9abzBDQ1ZNU2N1K2tOaWdhR0ZmT3J1YlAwdmhNb0tVTzJYNlFI?=
 =?utf-8?B?TGFMS1NXckwxUFdoZklQZEVDUVVnWHZ0OGthWEpSOEZlK3dtMWpWNTVPR05G?=
 =?utf-8?B?SXdhZk0yWWNpM0ordkhkZFdKRXc3dmlUVTc4eDhKZzQvU3pvUk8rd2NUNUpt?=
 =?utf-8?B?K0gxOEtUcXNuTC8rN2VJRkN4T3FPZlZwdTVvak9PcTdHbVdXeks2NU5IREVw?=
 =?utf-8?B?VmRpajZjeVRmMXgvMmYrMytYK3JJcXNVcW1xSUl5RWtVZ21laDZIelNoaGI3?=
 =?utf-8?B?OEFQalg2aFVFSjIxUXZvOXZOTzhaTzRpQ1BIeUlBNlRJTXFxWG9DTjFoRXNC?=
 =?utf-8?B?eSsvQURiclA0ZXhkUEowVUlIZHB2MGtmSDRqWFBvbVBkVGdsMW0wKzk1NTZN?=
 =?utf-8?B?dVVsK2pnODcwWWVFei94QWxDUk84RTlUTEpxMDc3N0RJR0NxT0MyRzZseFJ2?=
 =?utf-8?B?OUE3RW9DNHAzUElYTnVOOGhKZUNvTy9Rc2hDTnFuQXVkMG5nV3hnOVRndWNy?=
 =?utf-8?B?M0hkNjZ6dDZtS1ZvRDBQaysxYVFobS9SZ1hZQ2dhTU1FM1dRRHUzVzRMMmlu?=
 =?utf-8?B?eEF4UVl2WFdvc1VwSEhRaHdYdFV1NTBIaEMreUZtMWpORXN1eWxvRnoyN0M5?=
 =?utf-8?B?YXpob3U4TWZ5UHdtT29SdUVrTmlYNFZIODNyTms4TW5nMi82OFEvSko4SExM?=
 =?utf-8?B?ZzVTS01hTlBTQ3hIMWNCSEZyUTZQd3hmbzU5aTBCVit1RVgyVzY0K2xBcnZO?=
 =?utf-8?B?bTZ6MW1UdHpNWWxjcFhOK3BIZnYwdzIrSktrOG5KbFVBRSt6TC8yWVI2TGc4?=
 =?utf-8?B?TnNkeUdoWkZaRHFxNHJHamtsaFQrZVZMd0h6a0UwN1kvWW1Da2gxeHVjbTgv?=
 =?utf-8?B?VWdIUFdpaG5RelZkNkt2VHVRYU1WeGhId1J5OG5oZ0M0RjhoTmZPTExmMURi?=
 =?utf-8?B?cVUvNnZVOWVaT0JKdUxHc2VUc2lZVXBvOXE2SGJvSmVSN0RBdlZtQXBmTEY2?=
 =?utf-8?B?SzJseHZkdzNCTlJZaTdkNjdtdlp0QzRyZVJzSjNWM1plMFRkTFY5bUc5SkYv?=
 =?utf-8?B?RTBtQzlaSE5oc3g4aVA2ZDJ5eCtWTVhGVlRNdkl6cEhPdGpMbXRHZjUxYkox?=
 =?utf-8?B?ZElpWFNoNWUwVGtEaXg2dlpKSnkrSWxqcTF6dk9PZk1iWkNYaHhWdHdwR05I?=
 =?utf-8?B?cHpWZUQrSWxGaTFBeVJWa0xkV3lvbzczR1l1aVFwQlRjZjBYK0htSzRBWUJ1?=
 =?utf-8?B?aFRCYms2VXVscEtNcjA2RXN3ay95VnRjODZpTEQxRTJHZEszUVdKaDAvWE9h?=
 =?utf-8?B?c0Ura0tuL2dtQ0lJUXUyZE92WlZ2N0VEUnlEb3NlRzVDZTl4L2tkZk1uUWxW?=
 =?utf-8?B?QnFEcGtWaDdmYjdMODJhTjlKNVlpUEdEeVgrWFBWV2xtRkJhLytJb01wald1?=
 =?utf-8?B?Q00xaEd3WDV3U05KWmkxNnRVTjFhNkUrNXRmQ2orREIydklSWXNxL01jNEVa?=
 =?utf-8?B?SzFOYVlXU3ArZ1RBNGFSNE9Sbk0ySDFUcFNodnMxWUtPcWRiQ1NjaWhldWli?=
 =?utf-8?B?Uk9iT0NGUUtkYlFrWHhhekhJd3AzTGYzT3NzeGR6RXhMZHZ0dk5mdG5GbjZm?=
 =?utf-8?B?LytrbTFoQlNjYnZkMEE5U3hxbXpOSWR6MExBVm9ib1dKUWl3OXUyOTZhY0pS?=
 =?utf-8?B?YkFFbFdnUmx3ak5Qalo5YTFtNU5sQk4xbHphR0Zubm5OemFyMWIrSU94K3Br?=
 =?utf-8?B?RmJwL1RnS0FhMEtJVi9QZklxbzR6V01KTWl2S2x6cXVSQ241ZnJtVm9UTE5i?=
 =?utf-8?B?NGk5THphdFV1ZWpnN0pHbG1iaXRqUWRuWWlpNUdoUDhWcmtUK2Fqb0F1eFhJ?=
 =?utf-8?B?bGsvc0o5T1RqbURhOUpremY3dmcwdTVYdzBQMzRWRXE5c3h1U3U1L0p2NDNG?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <114560F6CA0B314CA7778BFD52729C1F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a38327-df80-4a87-9875-08dafd494429
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 13:53:54.4206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osgA915114TtSYX6bgUby/7dyiYDEYCfvbTu47A7YAZ57asKyGAOnE4tzUmVW9gWXAM/YwK/yzyfZxXYe/mg+h0ZxVDLC9QuOQZWrghjpN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2494
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiANCj4gV2VsbCwgbWF5YmUgdGhpcyB2ZXJzaW9uID8NCj4gDQo+IHN0YXRpYyBpbnQgaWR0ODIx
MDM0X3NwaV9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiB7DQo+IAkuLi4NCj4gDQo+
IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfR1BJT0xJQikpDQo+ICAgCQlyZXR1cm4gaWR0ODIxMDM0
X2dwaW9faW5pdChpZHQ4MjEwMzQpOw0KPiANCj4gCXJldHVybiAwOw0KPiB9DQo+IA0KDQoNClll
cyB0aGF0J3MgZmluZSBmb3IgbWUuDQoNCkNocmlzdG9waGUNCg==
