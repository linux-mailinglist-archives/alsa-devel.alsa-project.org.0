Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACEF6B2EE6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 21:45:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442E718AA;
	Thu,  9 Mar 2023 21:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442E718AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678394731;
	bh=sClGgJMOqiLyR5gJzID1/eRHH03dcO6tGY9/YjY3dOE=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=bbMP058mRRgm1UEkikG8sForbjNbxehus/BAXV/ssM/oZZDSCZmDLtpRNjT3Yj/dL
	 MimIS7HhCq7klN2NHDKNbzLofLMZbaBJOVfYnEG+iQ8VB2HG3HxLnOcFGeZpYS9yuj
	 t2gp8MdkjnuwW1G4tjmVv4AtztqjuEj75zuScaPw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7EFF804B1;
	Thu,  9 Mar 2023 21:44:03 +0100 (CET)
To: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: [PATCH] ASoC: hdmi-codec: fix inverted tx in shutdown/startup
Date: Thu, 9 Mar 2023 15:21:59 +0000
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 09 Mar 2023 20:44:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKTWGVNN4BLTRJMNFR7IACDT37MFFF5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167839464271.26.16975349743399016667@mailman-core.alsa-project.org>
From: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF91F8042F; Thu,  9 Mar 2023 16:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 207BEF800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 16:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207BEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.a=rsa-sha256 header.s=selector1 header.b=QRxDn8TZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDfmUNIVoq3ScxEktXLrLHb3Km7DXmaXp899ArYfUUxGabdHTwigzYaKGuo+i+/LXw1x8YaL0CN/S5Cyg7IwYrBDk7NIaW0mq6/uOGl4K4Z259ZyWyPw94CHcQKMEBlRYUIsJLEk47Hv03q0He18xPcZkSK57ep1bpRhe6drSGJ+LOdh8z4AbFeSz0LSPJL1UNMrDKR5bEf3NUx9D+UCuV5IPysb6fkfvh5OLCZgPXSmnKLE/T1WJxGAbAMpv7cx9X1UxTMKcoGgIPXuNV7QtZqemyGfEsj4E847/3fxyNI/FNn8j9YX1USfqd2+MPKwqQ5tlnJhxDDjJ64+8xbyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwROy5qyIt5ER1gQqGGwsyMQ+fwIwdA/fG9wGeiJnDc=;
 b=IhonkbaJW5CQAWElYybMFyH2DUWjjcHoGC0OIqEHWfRS9vlq4t3hgq8higmPKBFiaYTMzOrlGZkmCXhPquGhK9ettmxAybKH/yHebl14pNixeDOjThgimAFqkE6M6CBj4pfaIGgwxdleiQcGtsQRxPq1+g/fDtEjzesPE9RdBG6IVSZ7W9EXSVMf9aE/0LbMiqxj+A56m0BuwXq1x+C1ZQ75aRxkbYRCTKs+tPgKzn/BEviQfR6qovfS4bawLypWlLijSURIh5+5SpM5f+wuVnh0cxSn67op04nQYko7KArpZ2bsQD/0KourkFj3fm2mLtA+qOr3Ev8lTp98N0thEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwROy5qyIt5ER1gQqGGwsyMQ+fwIwdA/fG9wGeiJnDc=;
 b=QRxDn8TZ0wvWZOLNh+27VEK+q7FuEC7D3vmPHN5uSIOPxzC/9OrGyqjdyvdJq03eE89S0+EgS4rcG3odgCTXro4BuFlOkjACA3g0n7OPWL/Jf5c7pnq30Gw22N9whxQh6vHN2K16MCkRqSqN5CIjSSJz57p5vAlb4+Xn+YBWDvs=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AM9PR03MB6978.eurprd03.prod.outlook.com (2603:10a6:20b:284::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 15:21:59 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:21:59 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: [PATCH] ASoC: hdmi-codec: fix inverted tx in shutdown/startup
Thread-Topic: [PATCH] ASoC: hdmi-codec: fix inverted tx in shutdown/startup
Thread-Index: AQHZUprkBFVptgPfxUK/uUb0FN0nZQ==
Date: Thu, 9 Mar 2023 15:21:59 +0000
Message-ID: <20230309152143.498933-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AM9PR03MB6978:EE_
x-ms-office365-filtering-correlation-id: ecc0ec3a-195e-47b9-7566-08db20b206db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KElxILb3VavTBJzqiEsmnimJMf2QywzIUojh/v4LnFpyDs3/spDLkIJNeTcBEqoeIg6OWWPbC4QrWNtOdjosAATGERxHpOHpe1jGoKLJFmil9b9kcW9lcbGGBOSkW7B9qj0CrDhGL0LPVcTWgduLVDFzFOLj6NzclIkgV2yuLrs6VbTSHJSxJqBaWUauRlYzcPNsAzGZFiBsqrJZ5bN7YYeMuZDpSU9nW8VFgQCGmCPk1xPJAD55lLNkKYHyJYgBblf4rPTZNXdttHz6E3G7rMFVlFoLaKhIYD2RcOm7okPrqAvjlpXtCJyLS91VfW0ilOyc5rfqgiRciV+UKcqfgdrsG3y34JNHanVHtM7SRaNE0cCNK99ukSJLagw49TsUovTVhkfJjW0fDsbp3XME1ALObn5MiUsFmHMhtuh1llqMZ3Qd7lWisoLNgK2JL2ksd0LJTUJSHiEbOvLG3ZrgZnf4W9wogHRBCQyRQCltqbFVTeSJLK8+K1kwRshua8V4/QqmM+pTkSiD1/s98SenW460sm2gi8gPrDS2hjXMAaRgFv/XzscDAl39HgqgZw2ndNnpdIFRaOLsg5VAJPAFk3mrTaXvQ9hgcpmd+Nfcalh87J/7zM8zSz5ZOuTBQHsJr8ELx1NS2tbR+F3B63N4mTZbb9Wn9hQKgXf/YA9hPrlTQF+ofKYU9fzrebCvT5Ao
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199018)(36756003)(110136005)(54906003)(6486002)(966005)(71200400001)(316002)(5660300002)(2906002)(8976002)(64756008)(8936002)(76116006)(66476007)(66946007)(66556008)(91956017)(8676002)(66446008)(41300700001)(4326008)(107886003)(122000001)(38070700005)(86362001)(1076003)(26005)(186003)(2616005)(478600001)(6512007)(6506007)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?L0/rlwlamcmJ2eg+JBXNQ3sHTIoG07sAiwcnuv2TIQYWGXQ0eEQ/gcur?=
 =?Windows-1252?Q?hCwhqr/L7G+1PB44dH7XlenOBM0MUo6A64PRfQfUm5QGDum24uJ+9WVG?=
 =?Windows-1252?Q?mHf7TTKQ9e5fO8WvNp1PBdUpifmPY0rq+MXybkCNszLbUQSW6gx2YfRY?=
 =?Windows-1252?Q?y/2Pibdfj1ujJdDgh0sqBgtIAvlxzpgeXeImP1aQpXZ0PpQec9eaJynH?=
 =?Windows-1252?Q?1aZ0R4UDIauM6CDdSGlWZo4zipUF4BPftqElTN6bBkH6yNfv+44kMS4W?=
 =?Windows-1252?Q?lxT1mYp99OoCZ4nPxI+ba6xCWuxBLqLWEiFrzk/om1LajXbNvS6obzWC?=
 =?Windows-1252?Q?u+w9fuiw8Zrr7SGcdbIil7Se1D0i64Q2aWrFGYBGylpNBrSXMiJIiXOQ?=
 =?Windows-1252?Q?gpjEHzsjH99YNrZP9e12zMWE2OH7v6l4qJoz53Nc/bTDfKY0opoptAja?=
 =?Windows-1252?Q?L36CSQ+boIntbsdknKJvYv+2RFIN/+8nJHhHwCt30k9BQT6vZi8h3Rps?=
 =?Windows-1252?Q?M1wWYQqwJw84ku4lfJsZuwjcvyGmu/ebaNikHamUCwd7cF0b+i7uEHcT?=
 =?Windows-1252?Q?a2POVFj2ZzSS+J7XxngsQ5anYwEozuuMug7FTjuuFjid7+/JgyJG9oKi?=
 =?Windows-1252?Q?sTsBZRc8vxQUiGJdf8tqg/qs9vC15q1kcd0wsfPSp+JsnRSGycm9Z/7k?=
 =?Windows-1252?Q?sXSRp3RvFF3QrBgPL8/V8oLPsKi6Q40Oi3QrjwTo8LE3/5Uowhv9OmMX?=
 =?Windows-1252?Q?oZl4Ss/CHZ6Mfkr6CBcHsThzCS7gaDgUksELgzlgmLr/84ul4F72AP1R?=
 =?Windows-1252?Q?gRlUJiLeagtbN0wixhGj5Yh8/ujVOFPPgOnl7iYQTzrTw8TKH0fzR4f9?=
 =?Windows-1252?Q?8pa+0ibzXWJ4Tl8jONtOaFhFrtdsNpjRpBAJiOHMBdG/PorLQ2DlNVtw?=
 =?Windows-1252?Q?amOMnXAq6+MJdJSLb7oErEKRP2vFvr01zeqFjWlSONFtZjBw1JW8K0Iz?=
 =?Windows-1252?Q?CDxQCK6BHI7RytYA34B7aHrjMXvfVpxL7GkHzr207vJK8n7lQJY8aVUI?=
 =?Windows-1252?Q?UIKSE8WcHJB6OieACERWdhvUqHhWU0mJ9XTBKeCl2Hwvkniw0asXIt1t?=
 =?Windows-1252?Q?4o5FYcvMllJgIAjbQ6xlIykHudfg+U+Jgk2mWjId9QEddArnou8Kuxiq?=
 =?Windows-1252?Q?l5siQvRRnwSadCedhyJKiNxHbQ8F1wXEMP3vNNV/cvp2/U8pnUEEr1N/?=
 =?Windows-1252?Q?YiqNrZKXKRDGEaE4wn9iGa4A/zUIqU0pVNGISqqnQd9/ksmIWJ9dIRx3?=
 =?Windows-1252?Q?aDCfdpJrMHHYp2AfbRKIZAcxN62hSxNmSSGmL4c3g3lQPqWEmGaSjC2j?=
 =?Windows-1252?Q?nvk7wl61h76H5Xa1Yy2S144CBtXMl+lMkhRwM9wjJM9FBqxKpHScpT8n?=
 =?Windows-1252?Q?fWoXPP8kQdfSz/As11lgp2tIai3rSWz6INhWvAaf/cwmtfNcdWph4R1N?=
 =?Windows-1252?Q?BerfG0ebcSceUqwQchHKFgcnYV5T1B8lDk0ff3hTr67A6oFW2oStd9Jk?=
 =?Windows-1252?Q?ywQDmMRQwoMTBjGFAzeUflCNta3rshkX0qgV9PQxUj2CUIpXW17BjkAi?=
 =?Windows-1252?Q?J3Z6cKRXYF0AtoEx0DzlOACCRrvlIkqo+y4wmcc90tIwA4/2bz5l+NRN?=
 =?Windows-1252?Q?NmILfMC5Zw/XMrhlagwNySetHRd3M8YYwsd9gFcHVP1YSB8SEvyidw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecc0ec3a-195e-47b9-7566-08db20b206db
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 15:21:59.4057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 L1a5z6YaiD8BaIFfnOjdOfiSMqGkPrtZpLTCGcniiN+ZtxcVF2KklI2SgWNoecCK39mMCPRNDbBMRKxhDGUukw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6978
X-MailFrom: EMAS@bang-olufsen.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JKTWGVNN4BLTRJMNFR7IACDT37MFFF5A
X-Message-ID-Hash: JKTWGVNN4BLTRJMNFR7IACDT37MFFF5A
X-Mailman-Approved-At: Thu, 09 Mar 2023 20:44:01 +0000
CC: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKTWGVNN4BLTRJMNFR7IACDT37MFFF5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix ignore logic on shutdown and startup.

It broke single cpu single hdmi-codec with a single supported stream
direction. Inverting TX fixes it.

Truth table for when to ignore.
+--------------+----+--------+-----+ +--------+-----+
| has_playback | has_capture | TX  | | Before | Now |
+--------------+-------------+-----+ +--------+-----+
|      0       |      0      |  0  | |   1    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      0      |  1  | |   1    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      1      |  0  | |   1    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      1      |  1  | |   0    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      0      |  0  | |   0    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      0      |  1  | |   1    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      1      |  0  | |   0    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      1      |  1  | |   0    |  0  |
+--------------+-------------+-----+ +--------+-----+

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
Link: https://lore.kernel.org/r/20230308125503.3917903-1-emas@bang-olufsen.=
dk
---
 sound/soc/codecs/hdmi-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index e111d9e60233..6d980fbc4207 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -432,7 +432,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream =
*substream,
 	bool has_playback =3D !hcp->hcd.no_i2s_playback;
 	int ret =3D 0;
=20
-	if (!((has_playback && !tx) || (has_capture && tx)))
+	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
=20
 	mutex_lock(&hcp->lock);
@@ -477,7 +477,7 @@ static void hdmi_codec_shutdown(struct snd_pcm_substrea=
m *substream,
 	bool has_capture =3D !hcp->hcd.no_i2s_capture;
 	bool has_playback =3D !hcp->hcd.no_i2s_playback;
=20
-	if (!((has_playback && !tx) || (has_capture && tx)))
+	if (!((has_playback && tx) || (has_capture && !tx)))
 		return;
=20
 	hcp->chmap_idx =3D HDMI_CODEC_CHMAP_IDX_UNKNOWN;
--=20
2.34.1
