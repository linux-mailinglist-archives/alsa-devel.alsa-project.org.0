Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846D76DF9D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 07:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0131E4;
	Thu,  3 Aug 2023 07:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0131E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691039829;
	bh=A4tqupvv/oOTGPcvvKQUU3lfZiMhT6CItBp0XIjew0E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fNkl0i88gu0fJDOx0rIU4qvaU/7g72DbtA2545ofiBgX1oUCUM83/RLySmJEU/Gf5
	 1SGhQebmIcD/zbFutRfHY3ofsfnfh3wjmqISoImQBYs7C16pMYuqmzwh58M07+Fabf
	 bUEY7ZT/F9ueLuQlfvNqLmuVwUH6s0viM/xEUbT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F70F802BE; Thu,  3 Aug 2023 07:16:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43283F8025A;
	Thu,  3 Aug 2023 07:16:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91530F8025A; Thu,  3 Aug 2023 07:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 364B3F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 07:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364B3F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=pj36PuOV;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=UKY+Eg9v
X-UUID: 8baa844e31bc11eeb20a276fd37b9834-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=A4tqupvv/oOTGPcvvKQUU3lfZiMhT6CItBp0XIjew0E=;
	b=pj36PuOVX7Qv+7dtaCe+/KSjmrWNQFpDpagTfFEkHZkCklv93n6BrVIYIwYHzIsOuh9pFxpYdA6Hq6afaFe0mAg39/wmP8hvCqviH1ibAJm5NLqSskDzapyBFYk4BiifEDVerJtJqBKJTJtHTlWBQw/8E80EjTqdrMqeSQjoSXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:465e300e-8dac-4b17-8148-203d09897ada,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:c4d518b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8baa844e31bc11eeb20a276fd37b9834-20230803
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 969255725; Thu, 03 Aug 2023 13:13:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 13:13:54 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 13:13:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MicJLe+yiyF3AeffbkgB6Sw55FMrTxYCt8ndqpRDm1+rNwO+wldWr5l57lK2J82Wb93IIvMQ4P4TMlQqs+5/WKgxd9IKePgNwOZQcI+b4AJHVSEOPIODCL5zGl79N1RjfEWztoVEOePSIlPFOQzpgeQhnt+Pe9d+qJN0UGO8SCbOawQ4lI2D+vdOhcUeOMoNach7dzHsdABWi1i5MPUUUiSNqpAYz2hJA/al5IBmFP51KMtrO/ImHS2RyrSr/5Lbs2CDvHMcSWRN+PYPlo2pVuF4Izi74ohVjBZEWZm0b7WpNt6oChmQm1FeZsobkWgXRfOlgCEsNMDzYJ4/7/DQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4tqupvv/oOTGPcvvKQUU3lfZiMhT6CItBp0XIjew0E=;
 b=FpkP1dPEOvibqawpN/rz24IW+uR2wsloLX388jAMbD9wAfIEJ8IU8tUPAUZb0aYBnP+p5Duo0pwnixiro6I3PiZBOYRkAX/tSG4wxBcDoUcvQmWfrF8GiSktZk/rEOI2epobg1xo3Dhl0/pQCTbc+XkdD8VfJ7Y9qySn6iABO1vhrrVOX9DH3gKbL9E4z0au+oUmdzfCk//2f77IkW9U6VMjcXnE6uW9vgzP3IED0BPQt2L0n17uRMyVer6YHyGSc3ddJtkztWApDp5gsq9KoLexYz0OxTm5/ped041kO60LiSUR/M3rPPRU0dyYr0G8zGv19+w5Z1eT+QuLa7BRZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4tqupvv/oOTGPcvvKQUU3lfZiMhT6CItBp0XIjew0E=;
 b=UKY+Eg9vqkMec38Tf7o9qVzlW+L+Qu845Vj9bIhsVmEQ6gVI79v0Pgfnx0ztPRSznGBEc30VrSO8oLHDdDVTlrm/SXWP2xTIU+k/l4K1BGsdjUywlmGNpW89iAmtY8xnrtSkgG+WUuHIoyklhcaggtv/8M39e2efisWipLYHXE8=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYZPR03MB5374.apcprd03.prod.outlook.com (2603:1096:400:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 05:13:52 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a%2]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 05:13:52 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>
CC: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH 27/38] ASoC: mediatek: merge DAI call back functions into
 ops
Thread-Topic: [PATCH 27/38] ASoC: mediatek: merge DAI call back functions into
 ops
Thread-Index: AQHZxNxSjHybZFgXSEy/YsDUrkadBq/YCNoA
Date: Thu, 3 Aug 2023 05:13:52 +0000
Message-ID: <6f602248495073788f407598c7bd37292932b1a7.camel@mediatek.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
	 <877cqetg6l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cqetg6l.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYZPR03MB5374:EE_
x-ms-office365-filtering-correlation-id: b6f901f1-cb86-40ac-3d62-08db93e06d94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 utH9meY2YhUKz2l14ek5dSEb5irlSKU9B8ATsdjLBP1BjCOLkK59rhvg6WyhqdCeY34V5I96iD2IDYCEkn3cBRndXM4j5eqaSGUEUEagLPlTjY9SQ8mO+NRdd/Ao9DiRNCDipbIB8GCA7j71NbOUYrWWlnysqxMfIU7ul6G3Bly3/m5mOyCpErf0b7IuBEc8Xa42CJkEnSaHx7Jn6qFM271pKnSQgxx6Bb4sYzDpqjrM6HgaiojFjlXM/v0dhosqRINlLdKBkOWPBVEwAcp/WxvsTNrE+jOvyndj5XYAA9E8Mp5wAvEhe035CS06lrn7ALkDUDGuFED+hcrb4bPAJdAdaNqI5RM/2ppfsNVOE1+rHAGUQdOeZTeJCDNx5X0ZQr2rWAvDlKJKDFE44AZse6xqfn8InXzrSd5/cIIBX1sOCTb7y8FA/kJEXVB4Mfd8SiwAA7lbl5WfjqEFRt3zsBKp7+WVdfIVzJ/4x+55pqW1E3i+sww7WxFQiMnA5d/33qLEhmrxyrfWlIUJI2O90kFJ8YpLddc8rhk/44o/iKlTcTdI2460HUO4ixIWNRrCV78yic5gofg+LbkYuN490Gt/pS6W0LpAWM8VfNN9ryzt7sSm8+BoCuZHQraYNqxBSxEf9mNvhy3ZGcf9foo2R1VFlNGVcvweThDCNjkCDhwXndgbOWrp39MU2Igd2Vsm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199021)(6506007)(122000001)(26005)(38100700002)(186003)(38070700005)(2616005)(2906002)(85182001)(36756003)(5660300002)(8676002)(8936002)(478600001)(110136005)(54906003)(86362001)(6512007)(71200400001)(6486002)(41300700001)(316002)(558084003)(91956017)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YlVjYVhlV2lHcjljYUJOcWVaSFF3YW44dGVPVjhEN2tiRTQ2Z2ltL2l1SkVw?=
 =?utf-8?B?d21JdDRSSy9Ca1Q4M2ZKanBnK3dRVVlkRlBJdGl2Um1RcVZiTHluK25JL2pU?=
 =?utf-8?B?ZkxpUDBBc2hTZWdSYStCRHRaWFVLL3Bqc002Unh6TFRnRG12VU91a2h5RU5J?=
 =?utf-8?B?cUg4VXBSYVhnenUraVVOMDloR2FyUmlyb1VGOE9SQmUra0R5Y1VOVHBxUU1X?=
 =?utf-8?B?eWJHcmlqTTdPVXJjcXJkaDhXSHB4MDlHMVNHZDg4MGp5NjVyQXpBVXE0QUxK?=
 =?utf-8?B?NUNaVUFiZVNvdFBnVWdWMHJPRzlPNGNDRjNoK0RCaGZvUTZiU1h4UFBwcTB4?=
 =?utf-8?B?d2VpT3dMV3M3Z1RsU21vbjB4bzM5aUhiWGUvaDZJcXRTQ2lkWUU3K3VUemQ1?=
 =?utf-8?B?UmxvNjVsdUExaUhBQnJ2RE5sRkJsSjVhSTF4eHJaL0pobm5tblAyeTNGd3I4?=
 =?utf-8?B?N0xZbldWMXVXd1ZXYlFkSnp0UXBDZlpLYUVWNmlWV3VWVURZOUhqOW9ER2sz?=
 =?utf-8?B?VlNGTXhMM1lEbmRHYWJHaFdaWWRLRjgwZmVZc0NudnQrYnZPd2lvcW5aTWtz?=
 =?utf-8?B?WjRTWFB5S0sxRGp3RVF6T2FxNmVPOFVtdENiekFnajJDMjVvWkViazh1VEo4?=
 =?utf-8?B?aEg2dVdyOGlXYWxicWF2eGRib2FpUVl5VGtxK25ucTRSWWFTa3pzTDhqRFZp?=
 =?utf-8?B?TUpDc3pJa0FWL3kySStxeXdMeUR6UG1xRUhXOEZuOE9IVWNRdXJzeEdYUHFX?=
 =?utf-8?B?QXBScTVKNWxMWWYxSEdZdjFuL0UxSzdHY0hwT0EvbVZZOFhWVWEvdGtYajlG?=
 =?utf-8?B?VXB0YjZPeE5zb25DbGl6TzdzcVMwdEFKL1E4bUpKZFlJWWR2R01aajh3ZUR6?=
 =?utf-8?B?UVFydGNuNUpzT0ZBRWZsRTF4V1E3TVpRNWNvWVR5UnQ4aVlhRzdUWEtJNDZw?=
 =?utf-8?B?Mi9qck4xYi9aNk5BaVRTcmluTTNCcVdyTkFCNE1iOWIvRkRlNE90dW1PQkhQ?=
 =?utf-8?B?RC9HSm1ibENsdFB0RHZSbGcxd1VjNjcyV1A3S1piTVdQb012ZG5NRGpadFJL?=
 =?utf-8?B?NzFrMkIveUVBY0ovM2FZdFAxdVhBRWNlLzFWTXNmcnlvekZwVlhZODdJN1Ro?=
 =?utf-8?B?akJtSFRjc29KQVR1NkE2STFzWU9zZjRsbkJnYkExSUtCQ0ZGTnBXM0tSWGlo?=
 =?utf-8?B?Z1BKQ1V2RElncG1EZm9SR0JqQXhCTTNoRkt3SUZieGZibm1ENzZxYkdMb1lG?=
 =?utf-8?B?Mk1pL2hiWFlyRGloQjUvZEQyTUY3Y0tpNjVDRFNLUWVGNkJtaW54MnVhMUhP?=
 =?utf-8?B?b0FWQitrQm05cXI5S2diMlZZbjRqcVJ5T3JJV0hVQVBvZWxTVlRMSy9uaTF5?=
 =?utf-8?B?YWd2dVlzR2V1YmhZMFM2RzFuZHBkWE1SVU5pWWNiV3ZBNEVmRmpCbXpERlhD?=
 =?utf-8?B?dEREU3hKYVhrdS84ZTcvK2NPZkhKU21yQ0FGZVR5cGF2MElQNjMzdVdtNm9Y?=
 =?utf-8?B?OVUxQ2JqOXF5aENIb1FXOHlpVDRTUmVvTE5iYWw3dTllTHRWVStsRVY4cnFF?=
 =?utf-8?B?QU9DTmd1K2ZNbmV6TWg5NWRzZWFFZWI3TzhQNy9Bd0RyRlFvTVViSkJDZlAw?=
 =?utf-8?B?NWJrVlhrMlpURkRxamhvYmtVWkFmeXAxbEY2RFpvNXoxTy84cUhTNXpRR1Qy?=
 =?utf-8?B?MmZoSThJMWoyQnFoU2ppM045NFRieWdjYkQ1WDZJQzZTbWlPYUtnbUViT1dY?=
 =?utf-8?B?dzB6Z1lFNnpsdGhpZzJJS2ZCejk2UU93MlZBeWxPSVFGRmIraWFVWmZwcUZC?=
 =?utf-8?B?OUFxSXdGcVJIdm9oYTBpdlRTTkVZSDI2NURpdGpBcDhjYlRTK0lTWGdtU21S?=
 =?utf-8?B?Vm9pRnFmRHRlSnFHc2hpbm13dlhpVTJrdERiN1U2TDkwaldUSU11dk5oKzJG?=
 =?utf-8?B?N29ISU1QM0daNnMvbzV3azRiOEJ6UFlDTG1ld1R3UVcrTlNSUmtHVUdFQXB2?=
 =?utf-8?B?T29hcDc0d2tYQTVKVjVvY25MVldkdE40UCsrSS9EeEZrM0JFcU1mZ1hNYkJX?=
 =?utf-8?B?cUF2NFJSMklWcnhHN1h0THdkMlpZNFl3TWxxaDdwb3hTbTgwUkRWUHBJRjJx?=
 =?utf-8?B?QXE2aVdPalJuSVByMnVwZnR5VXFxTnJqenFlenphSlJpT0dSTG9nS2dTdk81?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6ED9C11E0AC75045AB22FFB5A9E42492@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6f901f1-cb86-40ac-3d62-08db93e06d94
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 05:13:52.2944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 88t+WVCcjDQZSrv6zCsXjjSl0JM2RHgHNb+JTJkQaKeIdyYGYMpH8tzttoRN8jvZokUtWxhM81l5wOdQ8cTAiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5374
X-MTK: N
Message-ID-Hash: ZOCKULLLONBTKHPSMG5IKMGIJRKMGA4W
X-Message-ID-Hash: ZOCKULLLONBTKHPSMG5IKMGIJRKMGA4W
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOCKULLLONBTKHPSMG5IKMGIJRKMGA4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDAwOjU2ICswMDAwLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToNCj4gDQo+ICBBTFNBIFNvQyBtZXJnZXMgREFJIGNhbGwgYmFja3MgaW50byAub3BzLg0KPiBU
aGlzIHBhdGNoIG1lcmdlIHRoZXNzZSBpbnRvIG9uZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4NCj4gDQoN
CkFja2VkLWJ5OiBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+DQo=
