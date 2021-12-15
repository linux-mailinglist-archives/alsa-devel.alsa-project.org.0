Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA24766A5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 00:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091FB1A4D;
	Thu, 16 Dec 2021 00:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091FB1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639611770;
	bh=WswTDs44QBqHWgzwf6CggSl2ZuhLE9lzcs3WWNa91tA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kk4Ogee83dTK+YVL6bJYPOFSdhJU5tbjTPFTPd01nGothcqqTkggkL97SJ7A/RMQd
	 Pur+uSImf88sxeKggUp7TCJ/8F9vN8aCEdLgfIupQCYtGj874V732Q3ru9Y8iKk45h
	 7EeIettDSGvyaT8HrrZ2yCs0MFQVQHoU/I+JxuBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20813F801F5;
	Thu, 16 Dec 2021 00:41:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13CD3F8019D; Thu, 16 Dec 2021 00:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3D84F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 00:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D84F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="NN4mJsld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnIwbRuSHGTEYcDc3GZTol69gQpizehACY0CqYlrTRUEg+P/uJDi9vihYlypoRlqLj6o/zO6UD9EpjeAjUbVaWU7ET6E/2SaWx/kkB6VSpwle8xb8yb9ocZoL0sEfSBsvwnuj+53jVSTElI/6pE66DWr2MsFY+bgGq+fNgmvxg4PEZjEEhf1Ba4G0BdSmneZFH8DA7l27WOoqyzgUkkoFtk6SitYHswWOZnG2VdpMvDfsBoC82U7w4MOcJnw9ob5vqwA2AuAqzxjro3GjcoIscvfnEOBL1qGmPvuWgTvNrKQBmrDBARgjPEwlHfIrAJ9X6ofDUjznyf7fFpYbJBvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni4PTFsA/JXdyB00dbrXWD7CI/xbCrG7emYMWuAyiBE=;
 b=XlMEf1a6h93pjYyHyQm0mTZytYgR8VoE/l9nnz2cZ+MeYRBzc6mRSLrP/mRTcpTUetcSUUvXjJ2gi/+UR/3B8WRVlNQ+6EMMG+nx9o9Lo2QO3cA329RsYTarpTExYwz6iQNcQDNatePqsdrJna7fEjrPOoOBmihwLoWahuj9qljwxQS5MzMLj/4K/1GPs4M+tJ7Pfd3Y9tVKxqm60O/BgT0j1DtMLTJRFB6Ibcqk4JHugrz6LOHswKGHjbzJyLhesvB8MXaSM7Frs+SgFzLm4mvpNxmWphN+NgVoSkXQm6WEWZl2MYY4S3VRcBgtenGwhEYknesHFfqyLsmI1Zhwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni4PTFsA/JXdyB00dbrXWD7CI/xbCrG7emYMWuAyiBE=;
 b=NN4mJsldYUe9WaZgcbBmAJ5kC+ibkbmaa0CQONMgU8ThhhNySFTn3MpbTzkAyVYlg3FH+QstDQ8W7M0NuSUKcYprzM+T4Dgx+4jsTwKoNsI51I/ppCVAT66cqwThCfOFFUWdbES0GPRgjCSjOuXs97+iKeBem6pO6f5Q1tLA3jA=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TY2PR01MB3449.jpnprd01.prod.outlook.com (2603:1096:404:dc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Wed, 15 Dec
 2021 23:41:27 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82%7]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 23:41:27 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Thread-Topic: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Thread-Index: AQHX6/+3BIPM6H2ev06sQIsrctMgd6wzwVOAgACA+6A=
Date: Wed, 15 Dec 2021 23:41:27 +0000
Message-ID: <TYCPR01MB55818E96D32DD2B5A9358610D4769@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <20211208064852.507977-1-kuninori.morimoto.gx@renesas.com>
 <YboQv+lsHZBhrpfN@robh.at.kernel.org>
In-Reply-To: <YboQv+lsHZBhrpfN@robh.at.kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f7d23f-9663-43e4-bc77-08d9c02469f0
x-ms-traffictypediagnostic: TY2PR01MB3449:EE_
x-microsoft-antispam-prvs: <TY2PR01MB34498806C2008C094741531FD4769@TY2PR01MB3449.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MBa4gONTwWMQq//VYl3ArMpueBLJ10TWf3j6upeLLQIq8iFBYsz64QW6ixl40fH3tkTvIVcZxnVW2m52R9ulf8otKEXCyAkMPWBXZYtmjfgJQ3WL47GS7qg4yb9mc3ZU/fDtO1ZRZOxMlJpyHWMVcHliNSk9RUWo6JkOkcoONqB8y8g7Mh+cqUp9octUNDoIUbkdssvfcNei7fLFCgFRvVZUEtOPfATgXSM1QgWvIPas09jD+x1SxvFExlALQXMQprnz240tRZa/BRjEocgF8SdDI8utLNauLACFDhom4az1RrX4sOyi7KANK5IKg0RLa6+zFY7zcu43QoldZz6GB7TcL9PAum0msUSeL1rEcjzcd3i0jWbJjG7CRzxAqgvW5pQfvGEEzd5Cheyta6XYSlAaqEQ0IEK7g+OONFbT2RvuuviFWtLNrahCSgHg3uRme1F66RfVlybEvrP2VJ8D3GG0U9ixkggaNM7woX5u4BxGfn1qzzZ8ygHoCRcK3rsc1D3eIR0QO/OLM8FSihU2WhEIoMRNRcWqIzPctBgcU7LsuEbv+CS5PQQfoX8n7mLfI3Xv1k9FDgvla941Jsx2QBwiSdmAgXIDWTaJ2iFZ1aKX8FFntD+w89u+/HFZuKqZa7tLnl9JvAU50QfDFqsy26SJO72yY+ffceUagnaCbe8l5sPyyPzMykPy9MAM993/BzqjiuBlBBSWBXMnt+1zIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5581.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(66946007)(9686003)(186003)(4326008)(122000001)(6506007)(38070700005)(54906003)(38100700002)(86362001)(71200400001)(2906002)(7696005)(66556008)(26005)(66476007)(66446008)(8936002)(64756008)(508600001)(6916009)(52536014)(5660300002)(316002)(4744005)(8676002)(76116006)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QIzons59/dfuyauZpKweHmLkx3kDzD+mCP33ZPf/bJ29kF8Cpspo1kfEqBtf?=
 =?us-ascii?Q?nG65seckce2agMbX7SGDT3XR6cO6M8Xf8Cg9FU4Fjmxg07+azjMFCc4TNjYJ?=
 =?us-ascii?Q?tLzKWGyssmRWk58lFNEaKn6bFGcslUypCTj+eWZPv5RDGtEyVh9Gcdi2eeQ7?=
 =?us-ascii?Q?ZFm7BR0lIz/0iWRXnhXdxx+7ubT54hepHMEXwfBTRhu2Hixj2yAzKumJWa+E?=
 =?us-ascii?Q?WJUsqJoUpGcmHxrTiQhNdyp/Rt33EF37VtG0wtEefEEE7ZMMhyIGXTJqP5Dz?=
 =?us-ascii?Q?R26nvAtoxRQy+veV7nWJQDXArM5azeUjJfJ0Taw7R8qkz/xGS6Yeeh4BsSP/?=
 =?us-ascii?Q?UB3tW2z9P3vGcv4EoRbwit5UBAW98i8j56WLMABPljW2uucNTTxnnyAp5Dtt?=
 =?us-ascii?Q?TjSoHHwCfnFD8Etq6/YGM2m7J0nxyEk7MTnobIoMjrJ4TKHRhPXLHZAQwwPQ?=
 =?us-ascii?Q?RoR2JeYWY+Mrw7v16a+XwSB4iKNreoZRAZCpgwaEKwTuu+zVTnsBMhd0w+yM?=
 =?us-ascii?Q?WFnfpzINnsnGR+TJMVg2FL64n2OdlRDgDtVx8z0R3WyE5jh0ZhYgovJmb0I3?=
 =?us-ascii?Q?RMxzpFCrCVdHf2EnDqBX55aWYUtntRko+WFsyotOS3ab1ywKfHFPOnZcNLou?=
 =?us-ascii?Q?+KrQBp3S02ZBXbjVFOig0jkGeXDmD/3qWJhvyJEHzqTOaTcZ5AOkPQGpDtp5?=
 =?us-ascii?Q?7e99WKUs5S7FBA1OSDc5noK5xUjijNDJQpdUsBCjoBhZg43Ed3OswgGVeGvD?=
 =?us-ascii?Q?L1HhaUwF+CM93zvKB3DFBtS+rcUU+TEBF7ePf87Y1ah+KGDoPgceJFzypApt?=
 =?us-ascii?Q?H434mCquazvjJqDT03Y7Dk7A+Yb+dMhFThV6TKMbgBqTE+3xyqF9yQ10lBhC?=
 =?us-ascii?Q?i2e1r3I+9/fGz4jTh2b19WN3WF40xgXXHKCbMZhqtko+Lw6lg3aqsdoQy3AH?=
 =?us-ascii?Q?m0cMXv7nQMfsS0G7PY0vTrs+KmooLbC3iwplB9FYcxawQ5DuNbaFQ8CVIyMZ?=
 =?us-ascii?Q?EpWP2Nou/9oho8D8uaXTm8PBJu9hb8xl1DbTPHq64LapoIC88TkvXsMi1yHi?=
 =?us-ascii?Q?4p+TVh8f3W9MZl2qzMK425/FNTwrIRgKAX/Uidcw5lFiubxKYIO/rL3TJ1JT?=
 =?us-ascii?Q?J2Kwa43U2BVM5dijcgzECDRgx8J0YePcjVMo36uQEZUgoKHWXNg10RYizqgc?=
 =?us-ascii?Q?i8qyrwFXxwWxLGwMK3QAQX7+uQKhP1Lp3ryCKFPLxBDOwsmYJxNrYP1k9Ynj?=
 =?us-ascii?Q?qcO39mUrUdb9iFWXKPJ2M7tYAWXBnj9aIIA7q91PFPjhbeI0SNmunwQ0iJr9?=
 =?us-ascii?Q?wEsVxxQcS9SMMPoKDJ/aUJhL9ME5z4gVJee0c6rcUIbEKZlr0rWMv69X5jxs?=
 =?us-ascii?Q?wWFHgQ0X1vlvALyY+cfQJQI3zUCZQ82gUbW/Cu2OdivhY72n0s7n5+niQR3W?=
 =?us-ascii?Q?6IhAkUyaNfHdoLzbiFm1OwPLyGGwQU3F1fmdJX2/vvwHxyurXk1UeIScVw7a?=
 =?us-ascii?Q?2YtbZRFI0oMOTvYu3MmYrdUOl+PIEuuEQ5hSRzWVCCN85gUeUX/u5cjjUJYW?=
 =?us-ascii?Q?nREev8i1tJNozW4uo8AGQQmwRCcuEmIPYpvJTZR34S8NkHTBP9x7tCaXokl2?=
 =?us-ascii?Q?W4mGqf9jLCAujUWuehOxmiEUfy2vSoRysAZujNf1GrZmwAGjafhDPSg1QstX?=
 =?us-ascii?Q?SBnLxUroXjiMAhCtBKhmM4HTRRYsJ8cSrbOHyYAUbLz5mDmWoceAIi5Cmdl6?=
 =?us-ascii?Q?cALkOecCWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f7d23f-9663-43e4-bc77-08d9c02469f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 23:41:27.7907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1B/g7efm0Mghfa0rVr2z3E16qL95wr5Dc1aDtz3qBa6b++qxK5plS4EqFXWdfZBNwFdEq5pcZ7F3/1oER+Ki2N9mEEsRXfHmySzsJFL7mnIaS7NHyAs8aT1LH5qf2C5W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3449
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Rob

Thank you for your review

>>        frame-master:
>>          description: Indicates dai-link frame master.
>> -        $ref: /schemas/types.yaml#/definitions/phandle
>> +        anyOf:
>
> Does oneOf work? It can't be both at the same time, but the schemas=20
> could possibly need some further constraints.

Yes, indeed.
Will post v2 soon

Best regards
---
Kuninori Morimoto=20
