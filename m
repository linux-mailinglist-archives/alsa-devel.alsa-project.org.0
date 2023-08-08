Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E57738E6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 10:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0775DF8;
	Tue,  8 Aug 2023 10:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0775DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691482269;
	bh=cZ38uhVo38tMGdWH0IoEKmk4cSm+JBV0irKecum/qpQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=szjbnyzD/3eEE9at5Euk590pmLpEhKCffGH40bMJEogWdVOGVZZ/bi/9S47U8AAT8
	 rbdH1dBEaIAiEUrnlUeDVnN4T63gV6GSDpH0J3Stzh6p1EspZmS82cB2dQ4rkm21JW
	 p5BGEebx6xNqX73bnAJZlypBCK5Np8E/kkcqmXo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63F0BF8053B; Tue,  8 Aug 2023 10:10:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE93EF8053B;
	Tue,  8 Aug 2023 10:10:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82E21F80551; Tue,  8 Aug 2023 10:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD821F80534
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 10:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD821F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector2 header.b=RZ7TSOTr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvWZ6Q0QeAwBLDgzwL2AMpum4xQ/MuJTJy5yAGWMlU9jaMsr3rmFYCgvurILRw1zgdJBV5zpCgEjizzG4nzAlr/bqVDeYbdaWSK4SReOpAX1dzhP7gbeCHL1Hhbld+g4WPrzTD9RJVCICQZUHVO5k4LmryNaZvQLQktwjB/5O/6YEaxcE/ET+FuXyJ+RQjXVBpcAIaud+3bEKsOUyUsiQfC1c0f6mGbL80pPresA19T8v/1o9w1itOw9bPxpZFE0c6NilQXzICnBhss0buzojc/5M1czYrQIQKBP2CjFZaV3UmDod7NIJNGUGYRkNR5fyQK+5s1YXxw6b0nzrNqz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ38uhVo38tMGdWH0IoEKmk4cSm+JBV0irKecum/qpQ=;
 b=j8kSNnqw6CE0n6GN2UyiHcbRdhHUatBzx3pJ1mAjywDdQONF3V9TQlC5yf5JIcBWQ+NI0LsuHCZDa0UJPF9FPooHsr7F7a5pr/bkOYAqdbFP/u5xuNx69kjt2eJLUgjqDfcJYw2yeqmj/GwRFU/tt9rbRnRb2nrXNKTjquFFZ+lKwJDok/5dCYhshVP7wopTsE79466qie9eLS5RON+D46wV5DtCfPzpbXPRTsn1bcXS+IbA1luONfrzk9JFJpeB3XerjuHqSOQ2qQCgzvs3Pi0Wnqm1Hi7KTsiclbbZofI8irT170qpKc9b/SCpW3qxpaCXxhtim/eXm0oZz2RK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ38uhVo38tMGdWH0IoEKmk4cSm+JBV0irKecum/qpQ=;
 b=RZ7TSOTrA4Wy21hcw+iEBuREyyY3EsO+4cZHGXPshZV0zCVoG+I4O4cMFPhPm6qqwiZLkTkjLcX+EBZqQswcef9gifumM+vox7i4hhbATheLu3IbnUkZsT5QOmL5xyLkJbd6eCNV4mBq5X2BSndJZmF/BChuIK+eRelqwXTK4gDv8eG4qPfdN9GCxY2f2YbANWc6/BkbYQ5b1fO2HDzirx2HCEe+9k4+7IwLoqbGvH5MiqqPS5LnyF9NNcAc0Tk/TOjvccMTNcdwJaPGhbPQSFZF59LhCq74tr/3iwTmQ8RK9Z6tgJMHhwbFu4vJ9FzhjoQPPhbiQj08bp7QmxxuoQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3396.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:10:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:10:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 17/28] soc: fsl: cpm1: qmc: Remove timeslots handling
 from setup_chan()
Thread-Topic: [PATCH v2 17/28] soc: fsl: cpm1: qmc: Remove timeslots handling
 from setup_chan()
Thread-Index: AQHZv9JdLkKDWlS61kaT9uvzHKhprK/gH9sA
Date: Tue, 8 Aug 2023 08:10:10 +0000
Message-ID: <70c4e68b-702a-73b4-2e3d-217253304f64@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-18-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-18-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3396:EE_
x-ms-office365-filtering-correlation-id: 550eb0d7-4001-497e-b928-08db97e6e2e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rPOnpKojXIKxiImzUvNCUCZd4lc6OcUtQxJGpkpqoRng0TxDk0bPbES7rttsWuQqRWPffqwBlUD0k7mRM/hYcC5TGDjo8PmGUUYKsUzGlZPwAgXhR/PeUGte0jVTmyfHZeAa72XdTaReOIzfxQt1xy6vJuiN6513xsVHtRdm0ZwNKjxq8ZvE9Zf1wBf6jbrfhIEfy82bPH6pzIpvE+6eK6s4KrTbZ7GoyqzshWxgg2/qCx/PlfAg2VH6fejqqUPkQdAci7F5zESqFYBPoUFZfExUKSeKRgZWQc3mvgbja33UzPzOogyI41YLb2PVOAMkAOtCKBjv94fpEdm7HNjvmLAbcPb8GXyFfkD/5fRv6TCFMVjSZI0dDgVpNOKX4SSL9np2GO8r3IxqEAWlHz7pH1+saqKVlKWnmOrWkrg0O9QgLS1HFikVBfQXKzKS4FhC75ntLgr5gC2S/lCHUe9b75sKjtnZu0FRuhXgQkRUVHzaSbyKcg6MYMzwxXBc4I/U+noA+eH9akZmKflRx+MTVa2sHlPGl1VcmVaFHwPs5e7FKLBsT1o1w7XJX57A8HTcy33KXiVMLLcSyF2zYO8N269SuOTj9gjb8w1fKMYfD03r9FJldNhDVGJ+N7KnR8p3w1CNyd1ArM+QW8JKb5OQuFCYAjs59ODyJyVrSRRuSLbYaY8L8mM5NQmEKAWVRKSSSjSJFVaEtOsdyZRTBqgM7HrtRf2nanCh5EyZn4r7RA7FD1YWMHd6fPPsoCPKKliLLx4G5IUVC61O+v8Jy+RY1w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(366004)(90021799007)(1800799003)(186006)(451199021)(90011799007)(38070700005)(41300700001)(26005)(2906002)(31686004)(44832011)(83380400001)(5660300002)(7406005)(7416002)(8936002)(8676002)(2616005)(478600001)(316002)(921005)(31696002)(110136005)(91956017)(54906003)(76116006)(6506007)(6486002)(66476007)(64756008)(66446008)(66556008)(38100700002)(71200400001)(66946007)(86362001)(122000001)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2xsMTNZNzBubnhpOHN0eGFJZzJlRFhSWjkvbFZpWVByRS9aUndLd0RlRkdZ?=
 =?utf-8?B?Q21wVEUzQytJOGxDOWlURTNhS2RqZ0N2a2lIQ3d6VnRIUll2UWxsNGh2RG1U?=
 =?utf-8?B?TkE1NHorbmRtZUVxTTFyaTJVdS83bkdpS3h3RDg0emU3RGxKQ3JBV2ZGako0?=
 =?utf-8?B?SGdZRHNaa3BpTmc2TURtTEhUTkRWMGZHQkJiU1FOdUFUSU0vdDgrQnhiczUz?=
 =?utf-8?B?dGhlYkRxZlBNWXB4dWVIYm5BWDZmcjY4a1pSU0xMajFsQVB0Y2ZzK084VCtm?=
 =?utf-8?B?WEl3L29odEVBV2IzdUM3L3dYcWlGY0xwdEM0R25pYndDaDA5ME1SVHFhTjRT?=
 =?utf-8?B?OTRIZ1dkblRWTHoyMzlTWWsrQjFyeWpvRGlPZ2VyaW5mYWFOaWZQenZDNjhC?=
 =?utf-8?B?cFNCazVNUXJnTWpPb2ZaQUxqZzhrYlY2elcxUWpzdHJ5QXRFSytTZXRvWWtU?=
 =?utf-8?B?eG5Vd0x5SHVDa0xVM3hFdFlVdlh6Yi9pdURmWWhkVVdmK2ZKQWJYZlU4ekFw?=
 =?utf-8?B?amdlYzNhRWNnRFNmWnYzOGRwcW9yVnJ4ZUNLTllPWTVSbnFCKzR5cDcwRDhT?=
 =?utf-8?B?bHpwYTY3MHBqV204a3VGdHh3YlhRSHBKRzVmVjhCRWZtVE9JT205cFo1VEs5?=
 =?utf-8?B?VzNQM1BHZGZJUUxhL1l4aDk4UERES08zb1U4SGd1RHIzYnZQNldEU3Voek02?=
 =?utf-8?B?Q1AxeXowLzVHMTVua2V6d2pwdThBdW5qZGtFam5nYXZmaTRkWE1CcnJXZWVo?=
 =?utf-8?B?RzR0a3BOdWdCU3ZvZTQ1eGM3R3RpaWI4SmJiNndqWTltNGE4VlVjV2w0VDhQ?=
 =?utf-8?B?ZFhITVI2MVFKS3diZW8vNUZrODdOZzEwNnFwSUlnNGlaYlZIZTkvY2IzSWhj?=
 =?utf-8?B?dVlDbkdscmVHVGtOaE9EUldQeVlnYllNdUljZFgxdHRmSFNleCsyeUUvenJL?=
 =?utf-8?B?VHYwajRhNUpvKzdleXFIQ1ZiYnJrbEpWU1VjbTBjcVpvajNHZko2SXREU29w?=
 =?utf-8?B?bVdUS3huSWttT28zN1dWM0p5VUV4NlY3TEtGVU96TXd6aEdTOVo4WGp5QXJF?=
 =?utf-8?B?R0ZhanZnWHNmbnpqVlEyMmh4V3lBc0ZuVEdBYXFScFJ4QzBoMDhKTkJ6Y1hO?=
 =?utf-8?B?K2YyNm5xWFJGWVBSRVJ0SnZNbmJVTkZsNGJlUUhPc3FJKzU1Z0ZaN2hwbW9x?=
 =?utf-8?B?cWFTRTNIcHN0NDlxV1dYNlRsU3hXNmFsaTRtbk9ST0hoYWxaZEZXTWc1RjJx?=
 =?utf-8?B?N3FjN2M5ZGJ6QUNOL1ZoaGhDNWUwNSthY1JyRlc0b2JGWS9CcHlDRlhsTW5K?=
 =?utf-8?B?eGtuOVB3bENUV3ZDbUN3Rm1QTTBTUlZxblQ0Rm8wVXA4SUtWWjlrakVMNG5k?=
 =?utf-8?B?VHZFTURrMEtLS290YldudDVENk9Hdzg5Z2xjNk5jc1AwOUl3ZW03QTlpbEN0?=
 =?utf-8?B?dmU2TEo0SUtKVFVCanZxL2p1eU9GRGlHaGxtZ0FrMU9nZElVRGtpdjN2Z3VI?=
 =?utf-8?B?WURTR1pINTdKNVREUFBVWHUwMXdIdGVCOTNEK001cmh3cW5hSTl4eG9GcS95?=
 =?utf-8?B?cEJVTStUeUZaZGh6c3p3QkhwVS9mK2VmTDJpYnRFTFlsNFM3QThHOGRueU8w?=
 =?utf-8?B?Zm1GWFZ4Z2Q2RzNBVHRuNk9sdDU0ai9UNEk1c211eE5uMENzMTFPWVVoZmkw?=
 =?utf-8?B?ZGJoN0Z2Q1JERVR3NVJjaHBKeFh6U1JjNGZOc0hIQU40V09IT0pHdUpTaDNU?=
 =?utf-8?B?UVF4a2ZzU1hQWTQrczFwR01RY2VETkl5dTREY1FGa21MNzJ5eGViaFdtbThR?=
 =?utf-8?B?RUtwb0RPeDBrNTZsanQ4RHhtVnVqOThtZ2dVbDVsb1RXUzZ3NEJ5aUw1TVk4?=
 =?utf-8?B?UHNGM2hVejJaUWptaHJYbW9SSmVXWldWVnlabkQ5d0RXOEZSK0VKTFY2Ni9F?=
 =?utf-8?B?bUt5NlJka1JqM1NmaE9ZOGlCNDJwTVYvVzlEdFRuSUVxdVo2dzMzZ2hxZ3BT?=
 =?utf-8?B?cDI0dXY0NWQ3YmFITXZKZWFCcHRFVlF6dHFRbWRZc0c3ZE95R0Rpb2lXNW85?=
 =?utf-8?B?Z2FBZGlmU0NUb3NUZkxNRnpWQkVqeFJ1ZlBmNldtdVJ1ZVdFVndXOWxKNyty?=
 =?utf-8?Q?Yzg7HZJ8K8sYlHqI6j1SxIYaY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <496746966C7E9D45882A1F52381E9456@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 550eb0d7-4001-497e-b928-08db97e6e2e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:10:10.8045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 /+Kq7ZD8TwK3gIZ7OvNyie2847GEhOTmpUTst3NlV6lInLGxSBeMff4ipjdK9QyziM/SNiqU2eKNbO7JmgtjMDdDrgC6Lk3Ne13ESQsgXLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3396
Message-ID-Hash: P74KIKGVVILSLQFV772DLTRHENVVRVYQ
X-Message-ID-Hash: P74KIKGVVILSLQFV772DLTRHENVVRVYQ
X-MailFrom: christophe.leroy@csgroup.eu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aW1lc2xvdHMgc2V0dGluZyBpcyBkb25lIGF0IGNoYW5uZWwgc3RhcnQoKSBhbmQgc3RvcCgpLg0K
PiBUaGVyZSBpcyBubyBtb3JlIG5lZWQgdG8gZG8gdGhhdCBkdXJpbmcgc2V0dXBfY2hhbigpLg0K
PiANCj4gU2ltcGx5IHJlbW92ZSB0aW1lc2xvdCBzZXR0aW5nIGZyb20gc2V0dXBfY2hhbigpLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5j
b20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNz
Z3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jIHwgMjggLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgYi9kcml2
ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gaW5kZXggMjU4YTM0NjQxNTUxLi5iMTg4M2I5ZDJiYWUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysgYi9kcml2ZXJz
L3NvYy9mc2wvcWUvcW1jLmMNCj4gQEAgLTcyMywzMCArNzIzLDYgQEAgc3RhdGljIGludCBxbWNf
Y2hhbl9zZXR1cF90c2Ffcngoc3RydWN0IHFtY19jaGFuICpjaGFuLCBib29sIGVuYWJsZSkNCj4g
ICAJcmV0dXJuIHFtY19jaGFuX3NldHVwX3RzYV8zMnJ4KGNoYW4sICZpbmZvLCBlbmFibGUpOw0K
PiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBfdHNhKHN0cnVjdCBxbWNf
Y2hhbiAqY2hhbiwgYm9vbCBlbmFibGUpDQo+IC17DQo+IC0Jc3RydWN0IHRzYV9zZXJpYWxfaW5m
byBpbmZvOw0KPiAtCWludCByZXQ7DQo+IC0NCj4gLQkvKiBSZXRyaWV2ZSBpbmZvIGZyb20gdGhl
IFRTQSByZWxhdGVkIHNlcmlhbCAqLw0KPiAtCXJldCA9IHRzYV9zZXJpYWxfZ2V0X2luZm8oY2hh
bi0+cW1jLT50c2Ffc2VyaWFsLCAmaW5mbyk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJl
dDsNCj4gLQ0KPiAtCS8qDQo+IC0JICogU2V0dXAgb25lIGNvbW1vbiA2NCBlbnRyaWVzIHRhYmxl
IG9yIHR3byAzMiBlbnRyaWVzIChvbmUgZm9yIFR4DQo+IC0JICogYW5kIG9uZSBmb3IgVHgpIGFj
Y29yZGluZyB0byBhc3NpZ25lZCBUUyBudW1iZXJzLg0KPiAtCSAqLw0KPiAtCWlmIChjaGFuLT5x
bWMtPmlzX3RzYV82NHJ4dHgpDQo+IC0JCXJldHVybiBxbWNfY2hhbl9zZXR1cF90c2FfNjRyeHR4
KGNoYW4sICZpbmZvLCBlbmFibGUpOw0KPiAtDQo+IC0JcmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNh
XzMycngoY2hhbiwgJmluZm8sIGVuYWJsZSk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJl
dDsNCj4gLQ0KPiAtCXJldHVybiBxbWNfY2hhbl9zZXR1cF90c2FfMzJ0eChjaGFuLCAmaW5mbywg
ZW5hYmxlKTsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBpbnQgcW1jX2NoYW5fY29tbWFuZChzdHJ1
Y3QgcW1jX2NoYW4gKmNoYW4sIHU4IHFtY19vcGNvZGUpDQo+ICAgew0KPiAgIAlyZXR1cm4gY3Bt
X2NvbW1hbmQoY2hhbi0+aWQgPDwgMiwgKHFtY19vcGNvZGUgPDwgNCkgfCAweDBFKTsNCj4gQEAg
LTEzMjMsMTAgKzEyOTksNiBAQCBzdGF0aWMgaW50IHFtY19zZXR1cF9jaGFuKHN0cnVjdCBxbWMg
KnFtYywgc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIA0KPiAgIAljaGFuLT5xbWMgPSBxbWM7
DQo+ICAgDQo+IC0JcmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNhKGNoYW4sIHRydWUpOw0KPiAtCWlm
IChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+IC0NCj4gICAJLyogU2V0IGNoYW5uZWwgc3BlY2lm
aWMgcGFyYW1ldGVyIGJhc2UgYWRkcmVzcyAqLw0KPiAgIAljaGFuLT5zX3BhcmFtID0gcW1jLT5k
cHJhbSArIChjaGFuLT5pZCAqIDY0KTsNCj4gICAJLyogMTYgYmQgcGVyIGNoYW5uZWwgKDggcngg
YW5kIDggdHgpICovDQo=
