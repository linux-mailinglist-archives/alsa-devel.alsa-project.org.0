Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3D7043C6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 05:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F74A74C;
	Tue, 16 May 2023 04:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F74A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684206049;
	bh=uM5IojA9yI4x7MyUKJz/mLWOy6LfRwWLJW7hVzF+nTI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c2YscXEI07vRFvZwUjBxxjEzNGWJxepX02teL92Yixk2n4uSlUABYNAaUqJHRNApp
	 yhsjPP8p/Pu/3NtDLbR6qdVOCrcYncDlGeeyyrDUguvc+szTS4fzAIJXcW8PTYDeKR
	 Nk8kiG+dK/2NrzQ+9UdYcBxqP8+Hs3f4fh2zgKT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C6FF802E8; Tue, 16 May 2023 04:59:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D79C8F8025A;
	Tue, 16 May 2023 04:59:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB7EF80272; Tue, 16 May 2023 04:59:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6092F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 04:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6092F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=gG4FGZsC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYIaytARSho20VHoKq6DNiSK+IJujMW0DFfC022PRMhwVIvlLhXSsGI33lbcYHe9WfuL/cZ96uNDGar+GgyLjSeuo4CNAtpMc8jnjPW32HDGFUUiJOmBeTV0xI0POPViKIKMdP3d0xEpk/9RYIEJlkRo1ukCbYz8+oqci320Uoiq7N51qM2RHf8nvxWBvdZvs3lIlfRFbGUq3MrqxvrMXdzeKmOsL5fn51N/xT1OewOwY9dXpupiLk0EHgSRQyZtNvCDvKpUt7kyKMqVpOHXSuR/WNQpKfwxP/lQRi8aO1P7B7Bgo5PkHGLt2eGSogfWeBusW/b6f0GMyHgB3Htx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM5IojA9yI4x7MyUKJz/mLWOy6LfRwWLJW7hVzF+nTI=;
 b=SFJMpbbNENAoFfbEJGxY90bQkCPRjW//WJLjN6Mw5PEqvXNj62rSBG3UdFEgbLLkWChnZGttzb/6dmyu/EPamqhqup8sAjoork+Xiqc6tUdk3R60ohKfPICb/iNZSQaWztDFiFJql3Z9UfWVOxL3kNxPLHXvUtL9Oznq11BcIXLA6fTXU1NoVgTerFq3KyZ9k3tMOBzv2KwJ05oKWMvNVsXelAD5lnt7G6EFiTJG3VvoWIi0VjoNNcosnPmovNNfgftkhsJr3b2rNCrbL59ccQa6cxa/FfbruDogwLTR55p2X8WfD2SeKnt3hQvscVhFdILQ5AyvMqCC2JNq/ahHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM5IojA9yI4x7MyUKJz/mLWOy6LfRwWLJW7hVzF+nTI=;
 b=gG4FGZsCEayqIJFZKeDQq0r9/V9b3BCVtPYbCWC8qK7GXhdUunVh8hVobGnoBAxAmh49hHJU9WVdYpxttxpkSfmL90JLAt3lsLv02bcIbF1kZStTxo2uNtxeakfCSavDPLH6RFQyR7kVPOPqNb8bTnhd8NXcr0QBmXsSWi9agUo=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYWPR01MB10160.jpnprd01.prod.outlook.com (2603:1096:400:1e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 02:59:30 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 02:59:29 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, David.Rau.opensource
	<David.Rau.opensource@dm.renesas.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Thread-Topic: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Thread-Index: AQHZhKlETeg4Sy7VAUOH+1Z90Xb7jq9W0WyAgAVoF3A=
Date: Tue, 16 May 2023 02:59:29 +0000
Message-ID: 
 <OS3PR01MB664115D824576467117DCE3ECD799@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230512081030.5138-1-David.Rau.opensource@dm.renesas.com>
 <3b382277-e992-39a0-a4ba-c3fd88bfc41e@linaro.org>
In-Reply-To: <3b382277-e992-39a0-a4ba-c3fd88bfc41e@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TYWPR01MB10160:EE_
x-ms-office365-filtering-correlation-id: d6e680e7-29ad-4166-9845-08db55b99102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 frdkO22ICk8ovK/uwmAxIxpt5iVK0ZE/78bh7mhuGs9USjVf1S7GLDy/XEW3YoY8t8dd+fnSBz0ZiD3P6CyDIbT/+zVgLrgrsQXBT0U5nJk5ynGO7Mb8ipyL9XzMgRpbdieiQ8gQnguK07lvmbAyADQAB57sFaYhvnq2xE/aoPrX33BCWhfgAhfPkq4DwL05h3PT3kDoKUs5EMNssLAF9OtoX94ET4vX5Uk6Rw5hpMXT79XTICd6MCM0OE5at4caL9QIcFTnWRM2gdTtSfs5ZJxkLynkTJFw/0kmcKM7z/QYsKAEANQ//LCvtR1zgzooznK0AoxJS/h2O3UzZB/8gdADwd7L5ddG1Qd59Ipo890M9F3Qc6Tr7NDGQc/yW4D9dmR+8xxdkgkAd6h670xaTpeqsqMJbd9Wt/cD6jopyvACUajqPro7Ejl3diUNNF+rczDsHjTXfer+Q8utelFbO/iXDu/LGNyVuju2j5O2pE8ddSYxSfsH3YF+kIrHOqFIFHK38vP6Jqs4b5fPlz5BOnv9FXwjGN9pWd82/HvjUKme3wXlqyFsXh4oNSEZea6ru5+obpygqWGXrlsv4NMUKn2PlOjT73BYS71Ui9gU2NlRa5vmm1bLYBmJAlVFDIf2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(6506007)(53546011)(26005)(9686003)(55236004)(83380400001)(55016003)(86362001)(122000001)(38100700002)(33656002)(38070700005)(186003)(7696005)(54906003)(110136005)(7416002)(2906002)(316002)(41300700001)(478600001)(5660300002)(52536014)(64756008)(4326008)(8676002)(66476007)(8936002)(66446008)(66556008)(76116006)(66946007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RzhhdVd4SFByL2NENXZHWkQ2ODViVVp2VXhFRmtjVFBHaXBMd1AyWXpQak1h?=
 =?utf-8?B?VTJVK0sza0g4V3RUUEJSMElWZzIxZTlqbHB6MkdyNHhRUkI4T0tWS1d2OU40?=
 =?utf-8?B?T0F1MEV3dC9RZlVKMXhCc0pVYUpwUGhrMW00QlhkcHlJVmZOdWh1T2xuaGJa?=
 =?utf-8?B?R0t2WGVrbXh4czFGMENyVFNhS1V6U2ZBMTY1QUNzUSsvamg2T09pdS9xUjNE?=
 =?utf-8?B?aER4bGpqaVBYOHp0b0d2QkwrbHdsdjBTZ1p6dCtuUE54TTNya1ZBQ0owWXJR?=
 =?utf-8?B?ODhxTHdjNU42MERjMC9Cck0xRWNRRWZGU2YwTWlSQ0dBZHB6ZWphQXlVM3gr?=
 =?utf-8?B?eGdIWmtYR1FyMXZhb3hDSldSNTYxOEc5aE9OWEhaMXZSWXVpRVVuWk5lMW83?=
 =?utf-8?B?dlZKbnNxZjc2dzhMb1d6bFZxS1crMGFLVlJoT0dnMEVxTHdiTkxySGlpbVVr?=
 =?utf-8?B?WXBJTXdCMHNFcjA5czczSThma2hGSk5aV3B1ZmNoMFZFR3RiS1BqNENNczdM?=
 =?utf-8?B?bkFsMDhSQUdnczc3WkNYUDJMM1g3VEVsMnBxbGhaeGZZNjVQeDROUGQ2eDZv?=
 =?utf-8?B?aG1mSHd3bm52YWJhR1U2Wlg4T3VZRklvU3kwbGlYYXN0ekd3cUZXV0VPR3ZB?=
 =?utf-8?B?MDBCSytQbEhVVmF6WnV5SDJmREt5Q3gzM2xXMUptTmpjdXFEeVFIbFRuQXlj?=
 =?utf-8?B?Zm5zaDVaQS9yc0VkT1NEdlJ6WTQwdHpiR1ZMWm43bFJJMW9GTTBTaTdsWmZB?=
 =?utf-8?B?NGdJdlRHN1lJaWdkRlB3cHhhK1ZNZll5aTZXYkNGVDRFS0dNOFVnQVd5ZVBZ?=
 =?utf-8?B?RjdLUzJ5WjVGdXNWVis0VHdRT2hLOHpaN2JUeDhOVTZtQ2ZEY04zZ21vME5Z?=
 =?utf-8?B?a2JIejFxU3Zsa2hRWnhhSnJqWnltUnZwZjl3dlozUjg4aG5OelZTcjVXSTdm?=
 =?utf-8?B?Rll5WENkODVqNFp1WUluTk8yUUxRdlFlbHZ1RTJCdzBSNVdTS1JwZlFQbXBy?=
 =?utf-8?B?Sk1ndFNSeGVwbElGdFp4SHJ0aVJqbXZSY3VpckdudVRCTENHT0VFNHZRT0Ez?=
 =?utf-8?B?WlZRTzhVU0FtSGxkZHRIRmtETklwbi9UVjNpaWUycnpzNi9hY1NiNjhCQTF6?=
 =?utf-8?B?L3ZxRkZJZC95YnU2OWpWelppZ2c2VjFCa3QvRXd0MmY4TFc3cWdoRTNGVFJl?=
 =?utf-8?B?SHJvM2pSdEdESnhBNkw1RDJzZ3BWc2kvNnd2aWpzOGp2c0JLT1QrWGFsTGpF?=
 =?utf-8?B?NWFYdW9xVk5EYzFsanpWR0dpTGF3czFGNkFIWjRyTDJ0dHFSMnNVaXRqNlBn?=
 =?utf-8?B?VVd6OEd6YzdVSkdYSFdUdzZTUE43RGZNWElCSDBZYVRtT21jT0tSNWpMbk1Q?=
 =?utf-8?B?clVNNFQ4Um5FMTQ4M3dzd0JhQUxjM1ZqdXpMemxKU2xsaDNRcEdWSVZmOTRS?=
 =?utf-8?B?VXhaUGFOR2NxcW5Ra0t1QkNOcUZ1eGpyRlNrNGdxVmhSWGZqNkZtR2cvYnM0?=
 =?utf-8?B?MFp0RDRndWRLdUdlZzlXWWgwM2hSbU1DYUJlWS9SMWJKU2ViMU1qQlhiVmo1?=
 =?utf-8?B?UDVUT3B2Z2RBaExIR2ZPaENUb0FUZWVUdEpka2QxZWJQUzhYUUI0VE5seHdQ?=
 =?utf-8?B?OUZDTndzcHNPSW4yYWFmS2F4UWpEcFRaYzlMZG15b2IweXl2eHVRemF4bldQ?=
 =?utf-8?B?Smd0cEdLb2dnczN5cGFNVHcxSWdwZFZ4RFc2VkdVVFdJTnZqMTVScFNFZVFu?=
 =?utf-8?B?ZUVuVThNOW41UmxaT2hQSHZtWkZkV1hFNGZMUlI1T1I0enVPQVJaSkhMVUVW?=
 =?utf-8?B?U05OYllXMTZYQStZWUZXTDRyL0ZteTZXOHBOM1VXL0ZiSHhNdTVCWi9KL1Ur?=
 =?utf-8?B?UXdramVaVDBzbkd0YktWc0EreTRBSmRGMTRGUXVWYVM0UWV1c08zTFRGUjh0?=
 =?utf-8?B?UUdKYWw1UEtwSThXRjhpbitYcFp0ZElRUi9lYUVKR3pXcE12TDFnL09CNS9w?=
 =?utf-8?B?YkozaCs5Skl5V3hWZkVMM2VXa3llNXJJcWR0cXdCTEt5M2Fla3RGcGdSaVha?=
 =?utf-8?B?ZFNwMkR5bmlyM3JjbkQrdGVyNGFOVkVEb3dzcmV1Z1l6Z0hWbmx3a3EwVzdE?=
 =?utf-8?B?RWdZdWd1WmhkamFuMDQwOG9hb3dIdXlpSWJSbWc2OFZIUm5hSTZxWVJkV2Jm?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6e680e7-29ad-4166-9845-08db55b99102
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 02:59:29.2700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2hiPAd7fDS0OsRK0mkvhr5KPF8m5kazcOw6p8B8G4kVJ1v+xImUbe1i9kx7aHS8JSHenGqdEMMYIUv3MXNQcPagYsVzvqMKcdGzKaqBV+LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10160
Message-ID-Hash: QG4CCUKZOMSPB7FCDIPR5NE7NOU3TEXY
X-Message-ID-Hash: QG4CCUKZOMSPB7FCDIPR5NE7NOU3TEXY
X-MailFrom: David.Rau.opensource@dm.renesas.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SOGHL4DFQQCOCP7VCUOMICQKJ36E4FF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gDQpTZW50OiBTYXR1cmRheSwgTWF5IDEzLCAy
MDIzIDAwOjE4DQpUbzogRGF2aWQuUmF1Lm9wZW5zb3VyY2UgPERhdmlkLlJhdS5vcGVuc291cmNl
QGRtLnJlbmVzYXMuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnDQpDYzogc3VwcG9ydC5vcGVuc291
cmNlQGRpYXNlbWkuY29tOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBwZXJleC5jejsgdGl3
YWlAc3VzZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBkYTcyMTk6IEFkZCBKYWNrIGluc2VydGlv
biBkZXRlY3Rpb24gcG9sYXJpdHkgc2VsZWN0aW9uDQoNCk9uIDEyLzA1LzIwMjMgMTA6MTAsIERh
dmlkIFJhdSB3cm90ZToNCj4gREE3MjE5IGNhbiBzdXBwb3J0IDIga2luZHMgb2YgaW5zZXJ0aW9u
IGRldGVjdGlvbiBwb2xhcml0eQ0KPiAtIERlZmF1bHQgcG9sYXJpdHkgKExvdykNCj4gLSBJbnZl
cnRlZCBwb2xhcml0eSAoSGlnaCkNCj4gDQo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBz
ZWxlY3RpbmcgaW5zZXJ0aW9uIGRldGVjdGlvbiBwb2xhcml0eSB0byANCj4gdGhlIERUIGJpbmRp
bmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSYXUgPERhdmlkLlJhdS5vcGVuc291cmNl
QGRtLnJlbmVzYXMuY29tPg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L2RhNzIxOS50eHQgICAgICB8ICAzICsrDQoNCj4gQmluZGluZ3MgYXJlIGFsd2F5cyBzZXBhcmF0
ZSBwYXRjaGVzLg0KPiBDb25zaWRlciBhbHNvIGNvbnZlcnRpbmcgdGhlbSB0byBEVCBzY2hlbWEg
Zmlyc3QuDQpXZWxsIG5vdGVkIGFuZCB0aGFua3MgZm9yIHRoZSBraW5kIHN1Z2dlc3Rpb25zLg0K
SSB3aWxsIHN1Ym1pdCB0aGUgYmluZGluZyBjaGFuZ2UgYW5kIGRyaXZlciBjb2RlIGluIGRpZmZl
cmVudCBwYXRjaC4NCj4gIGluY2x1ZGUvc291bmQvZGE3MjE5LWFhZC5oICAgICAgICAgICAgICAg
ICAgICB8ICA2ICsrKysNCj4gIHNvdW5kL3NvYy9jb2RlY3MvZGE3MjE5LWFhZC5jICAgICAgICAg
ICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDMg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9kYTcyMTkudHh0IA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9kYTcyMTkudHh0DQo+IGluZGV4IGFkZDFjYWYyNmFjMi4uMzU3ZDFm
NjFkZTFkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvZGE3MjE5LnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvZGE3MjE5LnR4dA0KDQoNCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCg==
