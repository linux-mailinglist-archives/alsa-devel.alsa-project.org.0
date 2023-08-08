Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BA7738E5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 10:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B61DEE;
	Tue,  8 Aug 2023 10:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B61DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691482251;
	bh=HMdu+RRbX+3V0XPMzOcjGUQD0Kr4Sg56w/TRXDE+9No=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJidU92i4mqH4pmLa5j0Af1dHgXp+qca5P1VitQzquwpi80KxL1NUyNlTxIKmfm6D
	 t5nc7agFg6XlxWSO4/1kbGXxjxe9jJVDA2R7hGCj97GnQ/YdiSB4wDxEjSgjVrXm+r
	 8/RVTjkIBAZaC4b5RHmzGSZDi6wW106ucN+a/gIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E1DF80520; Tue,  8 Aug 2023 10:10:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F75CF8016B;
	Tue,  8 Aug 2023 10:10:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F0EEF8016D; Tue,  8 Aug 2023 10:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B07FF80087
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 10:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B07FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector2 header.b=jNGM/3JJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxxCwr+VYE1lWuvc6f4TRV2v9/2I8aj8o2AX4G2grltYxIMyR09Jz+2kiU5KFTW7VvcrYsSft9/sQBxKhanWazBCa1qp5GIpliwGb2wO/KuYv6gSJqTJJGQx2SWV58UfzF2g6tdGQg+5psioSZe9SZRoU+tGF53adrq8jWu/yhJNIDxSKuoq1g5rIVQVB/gIIrW3Q8e6K18m0kG+GjOcLfuNnNAhxvo5YjpChzqczF36YuJZAWzfgpeC+RgeCPIeQ+5JJrbbcDMxcc18UA8xzXsz3x5QboibUwVxTqyyXtJW7zJNj6omufBpZsVyMUH5W7dbZR+L7QsyXu6oYb3+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMdu+RRbX+3V0XPMzOcjGUQD0Kr4Sg56w/TRXDE+9No=;
 b=cpp0VBGQ9n2LE/E8PSDvkSziey4wxA5HUI2+OepZHts9VUxqwcbuxWKFn9/SL87pC7Z/TYxJ6H8TS3nlhJX8erfqTZmuY4R691NedqTZ+wG1g4z6CeuBgD/iTejq00eIDsmOvnSJJS8SuhoRllXj7MbC3D++V//i33g+tgtXu2SGBHc8Hkl9lxp8H3zrgd3kvPaaUTMJGvuGixJUNcv0KV4XaLT3YWj5HKnZjwHRREZyE4GyNQ46qvKe73uTUrandPqYYVfqJ1suoCBjUvVdDMpB5v76YbylQN24lYIw0aLY1UVI5LRKvdcUen44c/ie+vd/MeN7d4DzugN26rtSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMdu+RRbX+3V0XPMzOcjGUQD0Kr4Sg56w/TRXDE+9No=;
 b=jNGM/3JJTNy7dcPEy0pi1t5NYG2BnDeNQK+0BNorg+UO5Yl59QhesPIpdpByLKNEgAJPE+WGBjavjEqUwiU0vrozLIBMYov45o3RM16Eryl3CK3+V5ujjhzbKveOy2dvjdwdM+od39xDLYA12Fl88yFc1v/LvSf7hGiaTMByuymmoKvwquRnaUHHu7YsXcXQZskVpUXJc6s8lV+X5PZgsHXxutR56gIkcc1b7KGNDyVxU1sK7mTRzF4OIKjzMvsg7+iWbIdrMvQVMRJyk/mf3V0ISBjry/jbN3NXU77uCx/XDZnXjS14IIoF3UvzpbKeplnVCQsV8VdKmeQNMuJLBg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:09:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:09:50 +0000
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
Subject: Re: [PATCH v2 16/28] soc: fsl: cpm1: qmc: Handle timeslot entries at
 channel start() and stop()
Thread-Topic: [PATCH v2 16/28] soc: fsl: cpm1: qmc: Handle timeslot entries at
 channel start() and stop()
Thread-Index: AQHZv9JboNB30gceiUur4YPn7ab9qK/gH8MA
Date: Tue, 8 Aug 2023 08:09:50 +0000
Message-ID: <f2a94aa0-84e3-a314-f232-1a1a47590c03@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-17-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-17-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2014:EE_
x-ms-office365-filtering-correlation-id: 17d53286-17f3-42fd-d955-08db97e6d6cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u7Rz14G7XWcMLmoJfYhDGyyyoYdspkIWAbkclVRns3PeYUmrzFESe407eTUyq9iPpD8jc798P0qwHKza0I62HEadYCWEPnYJoK1wS0vsYZbuHF7gK98P7uA6A7JVbUIKXclAQPVMmBcKQDqxdtCTAsFPRJtGnz9BhPe15hVeN0B/dLGfSBQln0BHHjV55WNZUmjH364RY8HSc552Dyq2VaYyG2NQOABgfq1R3AWnbZ4tkROk6a3qs17EvnhN2gsLHTKFEq9ghUVZ3Fuu7D0uXZCx+ozQWjBnU3kLflEq1a5iHglbNNLNMAk/rmK0wo+HzuFh+Z2Vua23B/ye+Pe0nZMXsUBiK6ox6axdugad82Wu4YdNcs+n3xS4HhrTP5YnIA2Dsy0Uf5XK2Ui9TLwJP4x/Zv7JJuYuInguu4a73DR+xwJpPVQvtOtPGLwoK+k8BuX4K/vseqsgyPgi1rNvGE2PHf4cID0OJuh18Qscm4E9a71OEW1K8/YkmQlvqe0WQDEXzp92wfRk0ry6tf1uUgo1+ozmnjwM0CxV3E4GUIN90LCRXzv/FSmy47cdu0S2pOhIrJ1EWbhA/30/a52BD+s1DKLP7OuxMh5FfuN8EmxJ6lLxeWr9IJHOaBmPuUFdoSpANX8CvBiJH387I2d0RiFkAqbi+HS/D8v65EdK1De5jeblStneyT6iX+6vSwLdqxNytvAfWe+1M8vaWG3jHPIHguj05hd7NdT+wl3L1fBfygBfYR5cLrJLM54iwbz1JGODU3QrSJOdM5iO7qHNUg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199021)(1800799003)(186006)(90021799007)(90011799007)(31686004)(316002)(83380400001)(66574015)(2616005)(2906002)(122000001)(921005)(36756003)(8936002)(8676002)(26005)(38100700002)(6486002)(5660300002)(7416002)(66946007)(41300700001)(66556008)(76116006)(66476007)(44832011)(66446008)(4326008)(6506007)(7406005)(64756008)(478600001)(91956017)(54906003)(110136005)(31696002)(86362001)(71200400001)(6512007)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SUtTcjhnQ3RyT0tUR0ZvMUtvOWxBWi9FU0p0bkxON05RdmN5Q2tOMTIzcllJ?=
 =?utf-8?B?U2VzYnMyTWs2RmFJNDBWcU8vME40UCszY0U2N2ZzRzhZM0tpdnVpUCt0b0lH?=
 =?utf-8?B?VkVkZW1ScnNvRnBaaFdiVjdFVzNJOFc4OHZtMTBrazNibnVHOUtJek1ZeXBY?=
 =?utf-8?B?NVhLSFNjT1BEc2gzSGNMbzkyTXRMZitENHMyMHJDMVN2VUM2Nk8veE5lRDlR?=
 =?utf-8?B?UjVBU0Nrekg0QW9YMmZpVGFJWEpEaThQeFIwVE5JQndVY09Fd2ovc1o2MkIz?=
 =?utf-8?B?Vzg1U05kZU1vUm5zSmZyZGhHREhhU0FuZUl2L1BLdmpJNzQxNWc2WWhZeVBO?=
 =?utf-8?B?SkROc1ovWW5CMGl6SDJ3ZjBMVHhWQ1BtYWVyMnRnQUpabEhGZjFEM09uUlNO?=
 =?utf-8?B?dmhUYlZNbmNwYlZMUmFDd0ZGQzFZTEkzd1lxOUJtQW5vRGt0SG1ONDFyL3Rs?=
 =?utf-8?B?bHFLVzhRN0NTZ0NEQm1NUzRTWk1aSkVkVGl0N3ZadTl5elc0OXR1MjlxcHIr?=
 =?utf-8?B?VTFPRE5LcHAvTmJPNWc3THB5cUJ4Ymw0dERWMDUwSGp6MWt2clk0ODl3TlJq?=
 =?utf-8?B?Um56WnpnbXZZVENvcTd3WE9OVjJxTk9lRG1XWTgyK2dQRVdmbkE1ZDMxZDZN?=
 =?utf-8?B?SHZGaU5aZVFzOWpMcE8vc3haeUwyUXdYbm9GajY0L25ndE45Y1VIc1B2UUFW?=
 =?utf-8?B?b1pmSjRuSmlhWXZQbHErbTFWMUlTa2V2M2tXZjMwUXIwSCtjekpoZzArQ2NE?=
 =?utf-8?B?VnZzUzZjSjlSa3VlTWswNUNoczJ6clIya1phUnJWdkhMcmVEWFBNY0F2cmpy?=
 =?utf-8?B?bU1veGs2M3ZidW9WMjcxVHRTUCs4WHZoOXhkaGpaS2E4UlRtcmhvWWtTMnQ1?=
 =?utf-8?B?OWZLZll0czIwM29jL1ZoSDlEaU9QSFhWSHhkek5KamYzWkEwZTJIVExEbVVB?=
 =?utf-8?B?YzN0TUNCMUpibFRvVG9EdFIvdGpOc2NiNmJjejB3dkxLOGVwcGRDZjE0ZGpr?=
 =?utf-8?B?dTM5VkcxRkZja0p0MVZ5Y0FsT1ZibElhVGNZbk5qV3dYV0dKQVhVU2k5U0h3?=
 =?utf-8?B?QW9kdmlGN3BNQlp5WU9EUHFpVmdtMWFnR1B5dFZUU2NWWGtYWjJHcEdrK0l3?=
 =?utf-8?B?VCtzcDF4Q1h0LzF3VXVhZHoyVUU2OHNESk5vMWlkUnFwTGRJa3JhTnF2V2tm?=
 =?utf-8?B?NHVGTmRkd0Y2TkJqcjVManRZeDFBUGVJMnZXN2dxY3o1ZHo4d3Q4WjF1RFVI?=
 =?utf-8?B?VjZ5NVpYMzdsczdXZjdpZGgzcUdTZVNrS2c1N1kzVHBrVGJldnQvTFZMKzZo?=
 =?utf-8?B?SGdkcHV1ZXJUWTgrdEg2QmpqeUkwZGVvTS9Fd200bUVkMTJlbEZWN1QrUHdm?=
 =?utf-8?B?OWZjVGdNYVI2Q2RkMm5yNUQrN25xY2FwWVhzc2NKWSsyNHA0MmtvWXQxSjJi?=
 =?utf-8?B?WC9Fa0Uwd293TFREZTl2WnBwU2ZuVXIyU3dGdXdjczN2WXBRMVpYWHU5T2FR?=
 =?utf-8?B?SCtmSjl1STF3THJQSWpTMmxsUlUzSllKRzlBZitPcUxPdmgzd09mR0ZlQU15?=
 =?utf-8?B?aGo3cWZRWk5IRmRrS2tRNmQzdWJWSkltWi94ZHpQY1B1cGVPZnlWN1lsYUZk?=
 =?utf-8?B?aG40ekNSeGkzb2hQblNWZjZJZmR2eEszb2twU09CdUNWU1RNMGNJR3YxMkFv?=
 =?utf-8?B?dXZ6Q3F0VitxclYvTGJMT2ttdmIxVlpHNnQ1KzZRTGFjM3VXdzVWd2tuandU?=
 =?utf-8?B?VE1DQWxmaitoSnJZbkhXakZ1MlRVbDBtTHh6Wk41K0JNN0lZR1hubGViNHVI?=
 =?utf-8?B?NUJHaW4zR203RE84ZkFNaUpmTklJRFpRTk5XZ0JOdDViR0NpYjRsNXJzOUZZ?=
 =?utf-8?B?NlpTbCs1MzFSSW1CZlVQanhPb1o1RTgrSGxnVng2YzRtRzZvUE5WUXNoQUVU?=
 =?utf-8?B?SFdSWHJhdUxZdjZSRmNObFBkd0wvQklZVFMxeHpkaVdCcmlKR0xXd0tuSThT?=
 =?utf-8?B?TURwOFBZdTVuRjNBMGtQS2UzL3U3d1NoR0VFWklKRXZrN0JFMWt1TjhmdWUr?=
 =?utf-8?B?RElxRG5hZ3lnSzc4UXRKVzVXb2hzN1JRVW84Nmd2QW9JOXd3cFl1U1VHQjEw?=
 =?utf-8?Q?WXg0R/THCH+b8MvE6m39N37fn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <639F9716C008BF4B900BB0B85EF2C7BA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17d53286-17f3-42fd-d955-08db97e6d6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:09:50.4918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 OOVkQCd/HiwWbr2UV6BNjgCeRXucUxssU/nYwSI6niJKkargp0RE1ehb3Uh0w4CnQgxbdmqXqR/C9VCJ6mtpY0i/IfBgf/H3m8Rn1eb0BxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2014
Message-ID-Hash: CLQ2MJCOVM5GSFQS7Z6NA7RPUPWCN2DJ
X-Message-ID-Hash: CLQ2MJCOVM5GSFQS7Z6NA7RPUPWCN2DJ
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBJ
biBvcmRlciB0byBzdXBwb3J0IHJ1bnRpbWUgdGltZXNsb3Qgcm91dGUgY2hhbmdlcywgZW5hYmxl
IHRoZQ0KPiBjaGFubmVsIHRpbWVzbG90IGVudHJpZXMgYXQgY2hhbm5lbCBzdGFydCgpIGFuZCBk
aXNhYmxlIHRoZW0gYXQNCj4gY2hhbm5lbCBzdG9wKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBI
ZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgfCAxNzUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1j
LmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gaW5kZXggZGMxMTM0NjNmYmM3Li4yNThh
MzQ2NDE1NTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysg
Yi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBzdHJ1Y3Qg
cW1jX2NoYW4gew0KPiAgIAlzdHJ1Y3QgcW1jICpxbWM7DQo+ICAgCXZvaWQgX19pb21lbSAqc19w
YXJhbTsNCj4gICAJZW51bSBxbWNfbW9kZSBtb2RlOw0KPiArCXNwaW5sb2NrX3QJdHNfbG9jazsg
LyogUHJvdGVjdCB0aW1lc2xvdHMgKi8NCj4gICAJdTY0CXR4X3RzX21hc2tfYXZhaWw7DQo+ICAg
CXU2NAl0eF90c19tYXNrOw0KPiAgIAl1NjQJcnhfdHNfbWFza19hdmFpbDsNCj4gQEAgLTI2NSw2
ICsyNjYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcW1jX3NldGJpdHMzMih2b2lkIF9faW9tZW0g
KmFkZHIsIHUzMiBzZXQpDQo+ICAgaW50IHFtY19jaGFuX2dldF9pbmZvKHN0cnVjdCBxbWNfY2hh
biAqY2hhbiwgc3RydWN0IHFtY19jaGFuX2luZm8gKmluZm8pDQo+ICAgew0KPiAgIAlzdHJ1Y3Qg
dHNhX3NlcmlhbF9pbmZvIHRzYV9pbmZvOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAg
CWludCByZXQ7DQo+ICAgDQo+ICAgCS8qIFJldHJpZXZlIGluZm8gZnJvbSB0aGUgVFNBIHJlbGF0
ZWQgc2VyaWFsICovDQo+IEBAIC0yNzIsNiArMjc0LDggQEAgaW50IHFtY19jaGFuX2dldF9pbmZv
KHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgc3RydWN0IHFtY19jaGFuX2luZm8gKmluZm8pDQo+ICAg
CWlmIChyZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KPiArCXNwaW5fbG9ja19pcnFzYXZl
KCZjaGFuLT50c19sb2NrLCBmbGFncyk7DQo+ICsNCj4gICAJaW5mby0+bW9kZSA9IGNoYW4tPm1v
ZGU7DQo+ICAgCWluZm8tPnJ4X2ZzX3JhdGUgPSB0c2FfaW5mby5yeF9mc19yYXRlOw0KPiAgIAlp
bmZvLT5yeF9iaXRfcmF0ZSA9IHRzYV9pbmZvLnJ4X2JpdF9yYXRlOw0KPiBAQCAtMjgwLDYgKzI4
NCw4IEBAIGludCBxbWNfY2hhbl9nZXRfaW5mbyhzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIHN0cnVj
dCBxbWNfY2hhbl9pbmZvICppbmZvKQ0KPiAgIAlpbmZvLT50eF9iaXRfcmF0ZSA9IHRzYV9pbmZv
LnR4X2JpdF9yYXRlOw0KPiAgIAlpbmZvLT5uYl9yeF90cyA9IGh3ZWlnaHQ2NChjaGFuLT5yeF90
c19tYXNrKTsNCj4gICANCj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGFuLT50c19sb2Nr
LCBmbGFncyk7DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0wo
cW1jX2NoYW5fZ2V0X2luZm8pOw0KPiBAQCAtNjgzLDYgKzY4OSw0MCBAQCBzdGF0aWMgaW50IHFt
Y19jaGFuX3NldHVwX3RzYV8zMnR4KHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgY29uc3Qgc3RydWN0
IHRzYV9zZXJpYQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW50IHFt
Y19jaGFuX3NldHVwX3RzYV90eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGJvb2wgZW5hYmxlKQ0K
PiArew0KPiArCXN0cnVjdCB0c2Ffc2VyaWFsX2luZm8gaW5mbzsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJLyogUmV0cmlldmUgaW5mbyBmcm9tIHRoZSBUU0EgcmVsYXRlZCBzZXJpYWwgKi8NCj4g
KwlyZXQgPSB0c2Ffc2VyaWFsX2dldF9pbmZvKGNoYW4tPnFtYy0+dHNhX3NlcmlhbCwgJmluZm8p
Ow0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkvKiBTZXR1cCBlbnRy
aWVzICovDQo+ICsJaWYgKGNoYW4tPnFtYy0+aXNfdHNhXzY0cnh0eCkNCj4gKwkJcmV0dXJuIHFt
Y19jaGFuX3NldHVwX3RzYV82NHJ4dHgoY2hhbiwgJmluZm8sIGVuYWJsZSk7DQo+ICsNCj4gKwly
ZXR1cm4gcW1jX2NoYW5fc2V0dXBfdHNhXzMydHgoY2hhbiwgJmluZm8sIGVuYWJsZSk7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBfdHNhX3J4KHN0cnVjdCBxbWNfY2hh
biAqY2hhbiwgYm9vbCBlbmFibGUpDQo+ICt7DQo+ICsJc3RydWN0IHRzYV9zZXJpYWxfaW5mbyBp
bmZvOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwkvKiBSZXRyaWV2ZSBpbmZvIGZyb20gdGhlIFRT
QSByZWxhdGVkIHNlcmlhbCAqLw0KPiArCXJldCA9IHRzYV9zZXJpYWxfZ2V0X2luZm8oY2hhbi0+
cW1jLT50c2Ffc2VyaWFsLCAmaW5mbyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsN
Cj4gKw0KPiArCS8qIFNldHVwIGVudHJpZXMgKi8NCj4gKwlpZiAoY2hhbi0+cW1jLT5pc190c2Ff
NjRyeHR4KQ0KPiArCQlyZXR1cm4gcW1jX2NoYW5fc2V0dXBfdHNhXzY0cnh0eChjaGFuLCAmaW5m
bywgZW5hYmxlKTsNCj4gKw0KPiArCXJldHVybiBxbWNfY2hhbl9zZXR1cF90c2FfMzJyeChjaGFu
LCAmaW5mbywgZW5hYmxlKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgcW1jX2NoYW5fc2V0
dXBfdHNhKHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgYm9vbCBlbmFibGUpDQo+ICAgew0KPiAgIAlz
dHJ1Y3QgdHNhX3NlcmlhbF9pbmZvIGluZm87DQo+IEBAIC03MTksNiArNzU5LDEyIEBAIHN0YXRp
YyBpbnQgcW1jX2NoYW5fc3RvcF9yeChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgDQo+ICAg
CXNwaW5fbG9ja19pcnFzYXZlKCZjaGFuLT5yeF9sb2NrLCBmbGFncyk7DQo+ICAgDQo+ICsJaWYg
KGNoYW4tPmlzX3J4X3N0b3BwZWQpIHsNCj4gKwkJLyogVGhlIGNoYW5uZWwgaXMgYWxyZWFkeSBz
dG9wcGVkIC0+IHNpbXBseSByZXR1cm4gb2sgKi8NCj4gKwkJcmV0ID0gMDsNCj4gKwkJZ290byBl
bmQ7DQo+ICsJfQ0KPiArDQo+ICAgCS8qIFNlbmQgU1RPUCBSRUNFSVZFIGNvbW1hbmQgKi8NCj4g
ICAJcmV0ID0gcW1jX2NoYW5fY29tbWFuZChjaGFuLCAweDApOw0KPiAgIAlpZiAocmV0KSB7DQo+
IEBAIC03MjksNiArNzc1LDE1IEBAIHN0YXRpYyBpbnQgcW1jX2NoYW5fc3RvcF9yeChzdHJ1Y3Qg
cW1jX2NoYW4gKmNoYW4pDQo+ICAgDQo+ICAgCWNoYW4tPmlzX3J4X3N0b3BwZWQgPSB0cnVlOw0K
PiAgIA0KPiArCWlmICghY2hhbi0+cW1jLT5pc190c2FfNjRyeHR4IHx8IGNoYW4tPmlzX3R4X3N0
b3BwZWQpIHsNCj4gKwkJcmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNhX3J4KGNoYW4sIGZhbHNlKTsN
Cj4gKwkJaWYgKHJldCkgew0KPiArCQkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwgImNoYW4gJXU6
IERpc2FibGUgdHNhIGVudHJpZXMgZmFpbGVkICglZClcbiIsDQo+ICsJCQkJY2hhbi0+aWQsIHJl
dCk7DQo+ICsJCQlnb3RvIGVuZDsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiAgIGVuZDoNCj4gICAJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+cnhfbG9jaywgZmxhZ3MpOw0KPiAgIAlyZXR1
cm4gcmV0Ow0KPiBAQCAtNzQxLDYgKzc5NiwxMiBAQCBzdGF0aWMgaW50IHFtY19jaGFuX3N0b3Bf
dHgoc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIA0KPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgm
Y2hhbi0+dHhfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiArCWlmIChjaGFuLT5pc190eF9zdG9wcGVk
KSB7DQo+ICsJCS8qIFRoZSBjaGFubmVsIGlzIGFscmVhZHkgc3RvcHBlZCAtPiBzaW1wbHkgcmV0
dXJuIG9rICovDQo+ICsJCXJldCA9IDA7DQo+ICsJCWdvdG8gZW5kOw0KPiArCX0NCj4gKw0KPiAg
IAkvKiBTZW5kIFNUT1AgVFJBTlNNSVQgY29tbWFuZCAqLw0KPiAgIAlyZXQgPSBxbWNfY2hhbl9j
b21tYW5kKGNoYW4sIDB4MSk7DQo+ICAgCWlmIChyZXQpIHsNCj4gQEAgLTc1MSwzNyArODEyLDgy
IEBAIHN0YXRpYyBpbnQgcW1jX2NoYW5fc3RvcF90eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+
ICAgDQo+ICAgCWNoYW4tPmlzX3R4X3N0b3BwZWQgPSB0cnVlOw0KPiAgIA0KPiArCWlmICghY2hh
bi0+cW1jLT5pc190c2FfNjRyeHR4IHx8IGNoYW4tPmlzX3J4X3N0b3BwZWQpIHsNCj4gKwkJcmV0
ID0gcW1jX2NoYW5fc2V0dXBfdHNhX3R4KGNoYW4sIGZhbHNlKTsNCj4gKwkJaWYgKHJldCkgew0K
PiArCQkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwgImNoYW4gJXU6IERpc2FibGUgdHNhIGVudHJp
ZXMgZmFpbGVkICglZClcbiIsDQo+ICsJCQkJY2hhbi0+aWQsIHJldCk7DQo+ICsJCQlnb3RvIGVu
ZDsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiAgIGVuZDoNCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmY2hhbi0+dHhfbG9jaywgZmxhZ3MpOw0KPiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4g
ICANCj4gK3N0YXRpYyBpbnQgcW1jX2NoYW5fc3RhcnRfcngoc3RydWN0IHFtY19jaGFuICpjaGFu
KTsNCj4gKw0KPiAgIGludCBxbWNfY2hhbl9zdG9wKHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgaW50
IGRpcmVjdGlvbikNCj4gICB7DQo+IC0JaW50IHJldDsNCj4gKwlib29sIGlzX3J4X3JvbGxiYWNr
X25lZWRlZCA9IGZhbHNlOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsJaW50IHJldCA9
IDA7DQo+ICsNCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmY2hhbi0+dHNfbG9jaywgZmxhZ3MpOw0K
PiAgIA0KPiAgIAlpZiAoZGlyZWN0aW9uICYgUU1DX0NIQU5fUkVBRCkgew0KPiArCQlpc19yeF9y
b2xsYmFja19uZWVkZWQgPSAhY2hhbi0+aXNfcnhfc3RvcHBlZDsNCj4gICAJCXJldCA9IHFtY19j
aGFuX3N0b3BfcngoY2hhbik7DQo+ICAgCQlpZiAocmV0KQ0KPiAtCQkJcmV0dXJuIHJldDsNCj4g
KwkJCWdvdG8gZW5kOw0KPiAgIAl9DQo+ICAgDQo+ICAgCWlmIChkaXJlY3Rpb24gJiBRTUNfQ0hB
Tl9XUklURSkgew0KPiAgIAkJcmV0ID0gcW1jX2NoYW5fc3RvcF90eChjaGFuKTsNCj4gLQkJaWYg
KHJldCkNCj4gLQkJCXJldHVybiByZXQ7DQo+ICsJCWlmIChyZXQpIHsNCj4gKwkJCS8qIFJlc3Rh
cnQgcnggaWYgbmVlZGVkICovDQo+ICsJCQlpZiAoaXNfcnhfcm9sbGJhY2tfbmVlZGVkKQ0KPiAr
CQkJCXFtY19jaGFuX3N0YXJ0X3J4KGNoYW4pOw0KPiArCQkJZ290byBlbmQ7DQo+ICsJCX0NCj4g
ICAJfQ0KPiAgIA0KPiAtCXJldHVybiAwOw0KPiArZW5kOg0KPiArCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmNoYW4tPnRzX2xvY2ssIGZsYWdzKTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4g
ICBFWFBPUlRfU1lNQk9MKHFtY19jaGFuX3N0b3ApOw0KPiAgIA0KPiAtc3RhdGljIHZvaWQgcW1j
X2NoYW5fc3RhcnRfcngoc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiArc3RhdGljIGludCBxbWNf
c2V0dXBfY2hhbl90cm5zeW5jKHN0cnVjdCBxbWMgKnFtYywgc3RydWN0IHFtY19jaGFuICpjaGFu
KTsNCj4gKw0KPiArc3RhdGljIGludCBxbWNfY2hhbl9zdGFydF9yeChzdHJ1Y3QgcW1jX2NoYW4g
KmNoYW4pDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArCWludCByZXQ7DQo+
ICAgDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZjaGFuLT5yeF9sb2NrLCBmbGFncyk7DQo+ICAg
DQo+ICsJaWYgKCFjaGFuLT5pc19yeF9zdG9wcGVkKSB7DQo+ICsJCS8qIFRoZSBjaGFubmVsIGlz
IGFscmVhZHkgc3RhcnRlZCAtPiBzaW1wbHkgcmV0dXJuIG9rICovDQo+ICsJCXJldCA9IDA7DQo+
ICsJCWdvdG8gZW5kOw0KPiArCX0NCj4gKw0KPiArCXJldCA9IHFtY19jaGFuX3NldHVwX3RzYV9y
eChjaGFuLCB0cnVlKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoY2hhbi0+cW1jLT5k
ZXYsICJjaGFuICV1OiBFbmFibGUgdHNhIGVudHJpZXMgZmFpbGVkICglZClcbiIsDQo+ICsJCQlj
aGFuLT5pZCwgcmV0KTsNCj4gKwkJZ290byBlbmQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0ID0gcW1j
X3NldHVwX2NoYW5fdHJuc3luYyhjaGFuLT5xbWMsIGNoYW4pOw0KPiArCWlmIChyZXQpIHsNCj4g
KwkJZGV2X2VycihjaGFuLT5xbWMtPmRldiwgImNoYW4gJXU6IHNldHVwIFRSTlNZTkMgZmFpbGVk
ICglZClcbiIsDQo+ICsJCQljaGFuLT5pZCwgcmV0KTsNCj4gKwkJZ290byBlbmQ7DQo+ICsJfQ0K
PiArDQo+ICAgCS8qIFJlc3RhcnQgdGhlIHJlY2VpdmVyICovDQo+ICAgCWlmIChjaGFuLT5tb2Rl
ID09IFFNQ19UUkFOU1BBUkVOVCkNCj4gICAJCXFtY193cml0ZTMyKGNoYW4tPnNfcGFyYW0gKyBR
TUNfU1BFX1pEU1RBVEUsIDB4MTgwMDAwODApOw0KPiBAQCAtNzkyLDE1ICs4OTgsMzggQEAgc3Rh
dGljIHZvaWQgcW1jX2NoYW5fc3RhcnRfcngoc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIA0K
PiAgIAljaGFuLT5pc19yeF9zdG9wcGVkID0gZmFsc2U7DQo+ICAgDQo+ICtlbmQ6DQo+ICAgCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmNoYW4tPnJ4X2xvY2ssIGZsYWdzKTsNCj4gKwlyZXR1cm4g
cmV0Ow0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIHFtY19jaGFuX3N0YXJ0X3R4KHN0cnVj
dCBxbWNfY2hhbiAqY2hhbikNCj4gK3N0YXRpYyBpbnQgcW1jX2NoYW5fc3RhcnRfdHgoc3RydWN0
IHFtY19jaGFuICpjaGFuKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKwlp
bnQgcmV0Ow0KPiAgIA0KPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmY2hhbi0+dHhfbG9jaywgZmxh
Z3MpOw0KPiAgIA0KPiArCWlmICghY2hhbi0+aXNfdHhfc3RvcHBlZCkgew0KPiArCQkvKiBUaGUg
Y2hhbm5lbCBpcyBhbHJlYWR5IHN0YXJ0ZWQgLT4gc2ltcGx5IHJldHVybiBvayAqLw0KPiArCQly
ZXQgPSAwOw0KPiArCQlnb3RvIGVuZDsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSBxbWNfY2hhbl9z
ZXR1cF90c2FfdHgoY2hhbiwgdHJ1ZSk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGNo
YW4tPnFtYy0+ZGV2LCAiY2hhbiAldTogRW5hYmxlIHRzYSBlbnRyaWVzIGZhaWxlZCAoJWQpXG4i
LA0KPiArCQkJY2hhbi0+aWQsIHJldCk7DQo+ICsJCWdvdG8gZW5kOw0KPiArCX0NCj4gKw0KPiAr
CXJldCA9IHFtY19zZXR1cF9jaGFuX3RybnN5bmMoY2hhbi0+cW1jLCBjaGFuKTsNCj4gKwlpZiAo
cmV0KSB7DQo+ICsJCWRldl9lcnIoY2hhbi0+cW1jLT5kZXYsICJjaGFuICV1OiBzZXR1cCBUUk5T
WU5DIGZhaWxlZCAoJWQpXG4iLA0KPiArCQkJY2hhbi0+aWQsIHJldCk7DQo+ICsJCWdvdG8gZW5k
Ow0KPiArCX0NCj4gKw0KPiAgIAkvKg0KPiAgIAkgKiBFbmFibGUgY2hhbm5lbCB0cmFuc21pdHRl
ciBhcyBpdCBjb3VsZCBiZSBkaXNhYmxlZCBpZg0KPiAgIAkgKiBxbWNfY2hhbl9yZXNldCgpIHdh
cyBjYWxsZWQuDQo+IEBAIC04MTIsMTggKzk0MSwzOSBAQCBzdGF0aWMgdm9pZCBxbWNfY2hhbl9z
dGFydF90eChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgDQo+ICAgCWNoYW4tPmlzX3R4X3N0
b3BwZWQgPSBmYWxzZTsNCj4gICANCj4gK2VuZDoNCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmY2hhbi0+dHhfbG9jaywgZmxhZ3MpOw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0K
PiAgIGludCBxbWNfY2hhbl9zdGFydChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGludCBkaXJlY3Rp
b24pDQo+ICAgew0KPiAtCWlmIChkaXJlY3Rpb24gJiBRTUNfQ0hBTl9SRUFEKQ0KPiAtCQlxbWNf
Y2hhbl9zdGFydF9yeChjaGFuKTsNCj4gKwlib29sIGlzX3J4X3JvbGxiYWNrX25lZWRlZCA9IGZh
bHNlOw0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsJaW50IHJldCA9IDA7DQo+ICAgDQo+
IC0JaWYgKGRpcmVjdGlvbiAmIFFNQ19DSEFOX1dSSVRFKQ0KPiAtCQlxbWNfY2hhbl9zdGFydF90
eChjaGFuKTsNCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmY2hhbi0+dHNfbG9jaywgZmxhZ3MpOw0K
PiAgIA0KPiAtCXJldHVybiAwOw0KPiArCWlmIChkaXJlY3Rpb24gJiBRTUNfQ0hBTl9SRUFEKSB7
DQo+ICsJCWlzX3J4X3JvbGxiYWNrX25lZWRlZCA9IGNoYW4tPmlzX3J4X3N0b3BwZWQ7DQo+ICsJ
CXJldCA9IHFtY19jaGFuX3N0YXJ0X3J4KGNoYW4pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJZ290
byBlbmQ7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGRpcmVjdGlvbiAmIFFNQ19DSEFOX1dSSVRFKSB7
DQo+ICsJCXJldCA9IHFtY19jaGFuX3N0YXJ0X3R4KGNoYW4pOw0KPiArCQlpZiAocmV0KSB7DQo+
ICsJCQkvKiBSZXN0b3AgcnggaWYgbmVlZGVkICovDQo+ICsJCQlpZiAoaXNfcnhfcm9sbGJhY2tf
bmVlZGVkKQ0KPiArCQkJCXFtY19jaGFuX3N0b3BfcngoY2hhbik7DQo+ICsJCQlnb3RvIGVuZDsN
Cj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArZW5kOg0KPiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmNoYW4tPnRzX2xvY2ssIGZsYWdzKTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICBFWFBP
UlRfU1lNQk9MKHFtY19jaGFuX3N0YXJ0KTsNCj4gICANCj4gQEAgLTk5Miw2ICsxMTQyLDcgQEAg
c3RhdGljIGludCBxbWNfb2ZfcGFyc2VfY2hhbnMoc3RydWN0IHFtYyAqcW1jLCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wKQ0KPiAgIAkJfQ0KPiAgIA0KPiAgIAkJY2hhbi0+aWQgPSBjaGFuX2lkOw0K
PiArCQlzcGluX2xvY2tfaW5pdCgmY2hhbi0+dHNfbG9jayk7DQo+ICAgCQlzcGluX2xvY2tfaW5p
dCgmY2hhbi0+cnhfbG9jayk7DQo+ICAgCQlzcGluX2xvY2tfaW5pdCgmY2hhbi0+dHhfbG9jayk7
DQo+ICAgDQo=
