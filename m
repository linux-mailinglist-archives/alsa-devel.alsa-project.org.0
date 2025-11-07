Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40234C3E632
	for <lists+alsa-devel@lfdr.de>; Fri, 07 Nov 2025 04:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9067160201;
	Fri,  7 Nov 2025 04:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9067160201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762487042;
	bh=7vETv7MXBUwD0FpXBm0qL6vZBFDkbjRj7bQR9ntmTIY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n/hYYARlAuM50Ov1D5QFeZEZAGBd2ZkTQENGryKZdqQiRHaLch0CkfgjTPKvldiQb
	 zSvbatxZ/PKb4+H+q5cciNYRIERgV8gYYsps1C5WWzVdTGj2LVH9eAbviQCw+OnqP/
	 XIMLpVHe3pKAd1l6yBpfhIn7q3M42xSnfJRsfIcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F86DF805CB; Fri,  7 Nov 2025 04:43:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A90C3F805C8;
	Fri,  7 Nov 2025 04:43:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B23D4F8055B; Fri,  7 Nov 2025 04:42:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,KHOP_HELO_FCRDNS,
	SPOOFED_FREEMAIL,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazolkn19013078.outbound.protection.outlook.com
 [52.103.35.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0534F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Nov 2025 04:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0534F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=UJKFcHwP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Feq4HGM0qyJFJSr6/uoTMwJpSmgRKdMHNWNKIffJ3Y43xnEqcsVKYib3Qij7Zw6PiiHHWilwV+MpgIfSH/pZBP0iJsDfiriL6njcahSPPtYU5sqDnsf+lV36OGgYR4p0d0sqCZlQMfLXkY4vr3s+uoBoVxhd1cLvb3O9JrqeQAGNNRE0IE+zW8dYNm52giG22YhR+r0/5NpXTo/1zAEgTkISsHp265pao1STRhy+RJaDiZpvpKNXLyLBJCjvuUsiOx6EEx6IBXf5V5g8Di5bgYXqzwT92tNs0VD1GipHAEcl//tO3H4oESNWe3WGQ0/Z/ns1mL21HOpmxyego4rU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vETv7MXBUwD0FpXBm0qL6vZBFDkbjRj7bQR9ntmTIY=;
 b=PLARaXv/LlTadqcvauYG1vBXPq4Ql3TCYaGMsgn8l82KZWdDhiy3zex5dEbjt/zqKZv+yHOZWdqSdzy3hJ0kSgo+54XuvwiMQse7IkM/CZmxxLmqoTZZXFmz3WjUUL90eY4SkCw4M/yoz4q3MQJol/3rYvG7N53aDWzbxzZVsvVErGQtn1S8IcP/1GFqn2B8aWtiA5AGWWG2jO+c2nQGU0ALPEFqk/QhCQX3g1bf8tUCLPLq7rJQzRntCdgA9YGaS66Tfdwcy39kGS8GQDiGTfY0Vwh7pY4gJeujRTo7xfOzfjb2cyxUn4yccy/OZBwOwWCAUblMTkjYuY8e1sOL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vETv7MXBUwD0FpXBm0qL6vZBFDkbjRj7bQR9ntmTIY=;
 b=UJKFcHwPK57cBwTMBh3e69TFQHd+DVldBwt+xvcPHTvOdFI3QDhVm7u3hKstVA20r9bEPSlQneKUfRqMFxHjo8mZuS6Bf37bSzD3pPf6o0YOLNt+3s+Ovyg/mjAJ3Xxpll74HcP3CCh4P/f3zM0vi6jtm7Ub7CF+Tro8TjxPNpBSadb4ecw74LeqpUA071sTU0gbRlNBjGMzzWKNn5pz3dQdkOjDqS86J5+uogfsjQvlT8Ar+w8LaA+wTt5SNtgUPSpncaLzJbwWGYraLwVgxduRHbqx5ovm+hkMJq6c+pTrwcePt9R0H0s15d2cKLdE5TYVM1WC15/GrKCtzcwjqA==
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ab::22)
 by AS2PR10MB6542.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 03:42:46 +0000
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9172:20d1:3f36:a3d]) by AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9172:20d1:3f36:a3d%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 03:42:45 +0000
From: * Neustradamus * <neustradamus@hotmail.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"perex@perex.cz" <perex@perex.cz>, "clemens@ladisch.de" <clemens@ladisch.de>,
	"james@superbug.co.uk" <james@superbug.co.uk>, "lrg@slimlogic.co.uk"
	<lrg@slimlogic.co.uk>, "broonie@opensource.wolfsonmicro.com"
	<broonie@opensource.wolfsonmicro.com>
Subject: Received e-mails in Spams (bad e-mail server configuration / ML
 configuration)
Thread-Topic: Received e-mails in Spams (bad e-mail server configuration / ML
 configuration)
Thread-Index: AQHcT4jVqjhlesbobEKOqx2LyMXbgQ==
Date: Fri, 7 Nov 2025 03:42:45 +0000
Message-ID: 
 <AS8PR10MB7427616382C3606488AEA099CBC3A@AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB7427:EE_|AS2PR10MB6542:EE_
x-ms-office365-filtering-correlation-id: c99f03fb-eea7-4824-a591-08de1dafb6f1
x-ms-exchange-slblob-mailprops: 
 ScCmN3RHayF0bP0FcI6aESyZnZAIXMvqxfp77s/YL11csFocQy3zqeW6fE8EFTBPFNQJ1n8Ew/07aIYKGCND2EtFMMa/CF2wyxXlN5U1fOV50co1PfsENKwSV3oprjE9kl3PStahjLTzMh0NbORlPkmzgHY2weT3mtaTQdWY4zYhmZxrLrkJO3Oqjbve6m2PNKb/+UrgAnCQVZKvkpe/zS6OTR/laJaWDS1IWZDc551ciEQJ8xmEinFojIjCrnexO/f8RSgTt3qGefffAHLE6QLPgz5ScIStVgDgSXGtwbQEBOk1DV8c61H8QjO+GPhSq3l/SVc27qYFfmUkPMRxoUdWx6PIT3vMJEPixDEPTch4CDoBUrAWCcscauGi4Of5m+ptVaazkkVvKTvgIvE90+La0mZ9f7csZqOzC+WEETo08MusSQxw7OuNzrLB0WibLdMMm7jc8r2jzdcAdV32XO2rcBrvQQ1ah5snVQfrue295qwRkbfuvVsPh5ImgviBUlGJ+7RhmS31hmLWLs1FJfgNNZziGrjxO7N6pmtryxWp28bpVYwcjcdM6YFgdGcxfu9tjwIaYXxTlu0IjtucowRUgwD5kkh26bLbAH0QJ095ZWtH6VSnORwOHp0tn8cOcSZlla2psaasSMUU+dNduo8mBFcyIO0dSadpZyrupdt8oVFAdnelYICxqjqbTiAP7H0klWTi9z6zPX2tBvowQ47kTbriM7xeEoCV3aLVREU=
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15080799012|31061999003|15030799006|461199028|19110799012|8062599012|8060799015|39105399006|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?+lDVQeh2hld3Bc0mvCwsYz3vE1jo/J8+7AY3f333wbVaq6wUuxjXkmAsek?=
 =?iso-8859-1?Q?52WgmmpKitPuaR8/UZ02Q71GmVVm/xsDHZ/cNZM6ShgeTkEHZE1a2PuLoi?=
 =?iso-8859-1?Q?5UPj6gAJU4xfdfFbQF3PQS/IkLqvY2KxuICXfRl5RdPYcGwlvZGbOvrrss?=
 =?iso-8859-1?Q?mPe5hO4KvrHoi2/W6owh7g8dv7u49HkUzEXvViKPSJNC8fKPZhvqKa9ihY?=
 =?iso-8859-1?Q?4QUyqKR/hpB3xBqjPtB6qg1fi9YnT5YNGiRTiONYpzzm306aFpcsTqiOav?=
 =?iso-8859-1?Q?ltxsHGh4xEEuGXDMwWPwmhBEib97b9LqYYtMGMuZ+3HJ+X029tsx9El93R?=
 =?iso-8859-1?Q?p2WjrN9LkKn5+KgF6RTgLfSKxNkMnRm5MSvT5F6D9hhQzQnhdSdYp/sdu2?=
 =?iso-8859-1?Q?n7OxWJDr8EdMTYi83DjUMtmRAbnlZT2i/2cOIiH4g1s/fsTPfyDQAgVrjk?=
 =?iso-8859-1?Q?G6gHwXB9JI/QLXSWM91AFQlpJArzYEE2k9tx4HWVVXCkVAGFf1oKDSySr6?=
 =?iso-8859-1?Q?x1UV9sbaLo2VNpcg0Ubmmf6HeM6qYQ6FaPt06CI71atFyIzhat80U8bq0U?=
 =?iso-8859-1?Q?MDjX0jqX9l1v/Hii7OtbDYHkOmuXNPmvedfUo3bIY4oIvGi9ywaX1Ckt0M?=
 =?iso-8859-1?Q?YzPfuY9casTQDmGQUvLFYxXhObsnMRjuZhGN1mxHYWyiWvJpep2bYZMzmR?=
 =?iso-8859-1?Q?E3MxCW2TbSgPXrtiKDuWNkuqqJgB7ZWVmsc3CWiUpFppFAxP4eIeYwKLcf?=
 =?iso-8859-1?Q?w9Xt0Pxp2FYCFjJhXfz8sqa0lxuceEgBOHMnZ28bhROAKDaGJXeFwDwWvm?=
 =?iso-8859-1?Q?PZDU//Nw5iWnzFipYxQjdO6FMgzdmRGDKEX3CcnFxQTfIr7aJg4u0ONV9B?=
 =?iso-8859-1?Q?/NdfLnJw170trcDH38vBN+m1tTyKY/y1RoJ8eq0BXjU8jtCaOkvBiRQqvz?=
 =?iso-8859-1?Q?lvb0E+cHfhspD3E6sTVAZ+gF+JeTcRJ/A9ftTsxgcPL2/klIRsF1USeKhP?=
 =?iso-8859-1?Q?9l4yi6XmfFsIeUg022qtfZDhrpdaDu+UAdY0XBdVQsD9Je49cnwOlboFVk?=
 =?iso-8859-1?Q?ko2zjk2nH+stbyN9eheBV1j+VrfNeNiDGlhzekF3qKyzIZ+GV4Xvy6gKWc?=
 =?iso-8859-1?Q?uXn+dDeePFy5qonFhItHGgPFkv0fKQdoWHmj9yc22lC2QLTX37EYbw/+ch?=
 =?iso-8859-1?Q?RQWliEDYnnHqS/SHPAKs1sg94nC36bIB8ow/ddw/+hpoojzcxyrMTjLdYk?=
 =?iso-8859-1?Q?v23NeuSneI6KoDV6tcJw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?E1CHRP8lxERiVEUSN3xT1a+84ziVgKz7yzUR3D7/+QHxQMkSV9e7Pu9s0P?=
 =?iso-8859-1?Q?ksDEFI1/RPI0HezEKgppwQd/0dJm0dUfcLKqz9dSKClT8WbehA+e+d5yb5?=
 =?iso-8859-1?Q?nnNEaK+BlfPvWg87YtA5l2FdIUZMAPfc5b2K8PWnB8r3/Ss0kNo5vCnSmJ?=
 =?iso-8859-1?Q?IKYqjy4EYYAeSDJIUG5aRjHD2Y2GC9/clce72spSiO8vpClC6rotL695YI?=
 =?iso-8859-1?Q?AKZDs14KAAdSOsHgMlMaOxiiPOY4/0/fIsxDH3Fsx1UNgv+opH9HL75K2r?=
 =?iso-8859-1?Q?nqPblm8RQ3o/YdsPxrAVS4L5GtUfEfLwR5O4r84RqDjq29Y68b+Zuso0Nd?=
 =?iso-8859-1?Q?pw+4kbRlTjSpJPKNKWI1GemW5vuuEzVaZs9Hc8nnsfTKwuGqbACyBZiAG4?=
 =?iso-8859-1?Q?btSJylIx7ticdZQopRu7FnrKxmyJAIsaRSbQrLcuFIjOB8E9bcV8sMWS3B?=
 =?iso-8859-1?Q?A/H98br8/0w5Awk0CDd+YuQyvXXHq6CMIQt4ZJ07TLoebbS7LRfhjHdy2Y?=
 =?iso-8859-1?Q?+ypwll99sibFjVhFK+bzJXAcm/mvK35NGu8A3q0ldGBN329U8AaDlbnz0D?=
 =?iso-8859-1?Q?LmYSepuEB6/ODFSoqJ6nBa+L0kZA34dIqvvah0LPdnWoriYzy5I4fv9ikK?=
 =?iso-8859-1?Q?P4CHZA2/iMmyS+o7doPWNNhqWRK2HF2gVexkvO1jvCqVeoD+8AW20fgsKI?=
 =?iso-8859-1?Q?3g4eY6Mdivhk3DZC9BsiMk0/zDaNeClkbB9o0HLNL5aajbn7SGps+BHafG?=
 =?iso-8859-1?Q?FiOxcf3blStm7GU2pja3cWl5ed1KkEkdvh04UkNyTXIbk7xWb/HO40kQSt?=
 =?iso-8859-1?Q?rSV8nwVR3bVDMkV8SlzoLNS93OUzotphI4SN8aI0/8vHMS9hMXoiJDJzjP?=
 =?iso-8859-1?Q?BH+/UF7OvMRBaByi8BlK2OcIZM4CtkIwdjWVD+NF8bKuFrpNDmGSVlgIZS?=
 =?iso-8859-1?Q?tjFGMvtGfJyap+/Bvbl82bimfGthbYUJMpuFKSgXguGsWiT4JwmXm/hLXB?=
 =?iso-8859-1?Q?7yJZ/FayaXmTn+ImB3OrcnmXTkD9+0Ulm58QcEj7d/ofluDnu1t424nimR?=
 =?iso-8859-1?Q?bGXtm/Ei/GL6Lk1KqqVmCki7iyDCQoHg3jFmnEFZDl/pnTveUcsBjKqDtH?=
 =?iso-8859-1?Q?UUruf8Dwh0zhc6uDleYLE7BAg0B0I5KjCYhbJXOEphl3QfK081JMnkiKde?=
 =?iso-8859-1?Q?FEqoX0p3dWrzrDPKHhfeMgbwklNV4LXgDTbv33cD58fR7OOEGS0943bDon?=
 =?iso-8859-1?Q?+LmPu3+KMSoRTjCESv5wza0JTLLRikaKCC3zVbnuI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-18-msonline-outlook-89c8f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c99f03fb-eea7-4824-a591-08de1dafb6f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 03:42:45.8781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6542
Message-ID-Hash: WIAIFV3CXL3CDM4YPALY3GFWQUXMRZ5D
X-Message-ID-Hash: WIAIFV3CXL3CDM4YPALY3GFWQUXMRZ5D
X-MailFrom: neustradamus@hotmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPQCFGQTTVWB6JPHQKYCKAW5PWHVJJ2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear ALSA team,=0A=
=0A=
Can you solve the problem of e-mails always detected in "Junk Emails"/"Spam=
s" folder?=0A=
SPF/DKIM/DMARC=0A=
=0A=
For example, a part of several e-mail logs:=0A=
...=0A=
Authentication-Results: spf=3Dpass (sender IP is XXX.XXX.XXX.XXX)=0A=
 smtp.mailfrom=3Dalsa-project.org; dkim=3Dpass (signature was verified)=0A=
 header.d=3Dalsa-project.org;dkim=3Dtimeout (key query timeout)=0A=
 header.d=3Dleemhuis.info;dmarc=3Dtemperror action=3Dnone header.from=3Dlee=
mhuis.info;=0A=
Received-SPF: Pass (protection.outlook.com: domain of alsa-project.org=0A=
 designates XXX.XXX.XXX.XXX as permitted sender)=0A=
 receiver=3Dprotection.outlook.com; client-ip=3DXXX.XXX.XXX.XXX;=0A=
 helo=3Dalsa0.perex.cz; pr=3DC=0A=
...=0A=
X-SID-Result: FAIL=0A=
...=0A=
------------------=0A=
...=0A=
Authentication-Results: spf=3Dpass (sender IP is XXX.XXX.XXX.XXX)=0A=
 smtp.mailfrom=3Dalsa-project.org; dkim=3Dpass (signature was verified)=0A=
 header.d=3Dalsa-project.org;dmarc=3Dfail action=3Dnone=0A=
 header.from=3Dgmail.com;compauth=3Dfail reason=3D001=0A=
Received-SPF: Pass (protection.outlook.com: domain of alsa-project.org=0A=
 designates XXX.XXX.XXX.XXX as permitted sender)=0A=
 receiver=3Dprotection.outlook.com; client-ip=3DXXX.XXX.XXX.XXX;=0A=
 helo=3Dalsa0.perex.cz; pr=3DC=0A=
...=0A=
------------------=0A=
...=0A=
ARC-Seal: i=3D2; a=3Drsa-sha256; s=3Darcselector10001; d=3Dmicrosoft.com; c=
v=3Dfail;=0A=
...=0A=
ARC-Authentication-Results: i=3D2; mx.microsoft.com 1; spf=3Dpass (sender i=
p is=0A=
 XXX.XXX.XXX.XXX) smtp.rcpttodomain=3Dhotmail.com smtp.mailfrom=3Dalsa-proj=
ect.org;=0A=
 dmarc=3Dpass (p=3Dnone sp=3Dnone pct=3D100) action=3Dnone header.from=3Din=
tel.com;=0A=
 dkim=3Dpass (signature was verified) header.d=3Dalsa-project.org; dkim=3Dp=
ass=0A=
 (signature was verified) header.d=3Dintel.com; arc=3Dfail (48)=0A=
...=0A=
Authentication-Results: spf=3Dpass (sender IP is XXX.XXX.XXX.XXX)=0A=
 smtp.mailfrom=3Dalsa-project.org; dkim=3Dpass (signature was verified)=0A=
 header.d=3Dalsa-project.org;dkim=3Dpass (signature was verified)=0A=
 header.d=3Dintel.com;dmarc=3Dpass action=3Dnone header.from=3Dintel.com;co=
mpauth=3Dpass=0A=
 reason=3D100=0A=
Received-SPF: Pass (protection.outlook.com: domain of alsa-project.org=0A=
 designates XXX.XXX.XXX.XXX as permitted sender)=0A=
 receiver=3Dprotection.outlook.com; client-ip=3DXXX.XXX.XXX.XXX;=0A=
 helo=3Dalsa0.perex.cz; pr=3DC=0A=
...=0A=
----------------------=0A=
=0A=
Thanks in advance.=0A=
=0A=
Regards,=0A=
=0A=
Neustradamus=
