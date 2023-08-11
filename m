Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D473077852D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 03:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D5D3E7;
	Fri, 11 Aug 2023 03:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D5D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691719147;
	bh=2bYWP/byTCOIc3wyMNBTu20fkl5HHkKWlmcBmiqDu1Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r8LSyJ1WFvvd2/v/I7s6tidrWpfhBRbwwBSk4Uv9l7do0LEtsyFvVPpkrBNoCw0di
	 JDJ4TnFBhRzZ0J897ugphVjJwmomHT1nJvkD8s9n/8h2HOq/UpFX7neJ3fu18weBbq
	 fyDWMwuLnx/TJT2hD7fiDibsKnbOvHhaH5rop9ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E622F80166; Fri, 11 Aug 2023 03:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 780E8F80166;
	Fri, 11 Aug 2023 03:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 639BCF8016E; Fri, 11 Aug 2023 03:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0178FF800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 03:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0178FF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=een9lL1R;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=BFC1ZY+o
X-UUID: 7cd9cd9237ea11eeb20a276fd37b9834-20230811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=t6oopOaA4ek/yTqea2TI8htTpABEu/sAfUvSfaKClVQ=;
	b=een9lL1RxD5lvd1dukH8OAozH5aNJPe/Y45VsSBJzte1DdqbBHGwXXGCwv2FXAANude3ZgEChvi9SPayvmDnsGKqvcpPawl4fsXRuITyo71tsJVdtCJQ8pPiTRP8uLBBfTP4NKt6NtUrvzrnbpdquNJM5hJu3aHFDxEL/4VlIQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:90843a9b-24f5-4d98-b224-0104a3025da5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:78bc331f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:0,Content:0,EDM:-3,IP:nil,URL
	:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7cd9cd9237ea11eeb20a276fd37b9834-20230811
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2146732445; Fri, 11 Aug 2023 09:57:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Aug 2023 09:57:54 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Aug 2023 09:57:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIVBa4ekgRbEdjpDXBaoRCfE6qSiO2d9CWvEv4yDMYr27KkRGXUOkhH+6azy3ooDA31tUXXDDMubSREcz4DQE/av1LsLJrkwMtSfp2SfmUA+wcbLVnnNMtBmioyy0/g2c9Pq9h5Edc5obLDXbq+oWXx+Wl6jNp6Y1uz9h13x9p6S08gFdHzt/9nRS6sQ/IwtRbES/m9pv/isOtyd+4v4xYYtyKwoPnBnkL76bK6v6jhykdmJgisXpVOgfySXRIG3dC6HU9xlG0B1/QJdm8HJBaR9VTsrCO8mqFTRwqgS0yU5Jb7h3XmJEeltjP230hpNZNr/ZXqPja1IOFlOfByjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6oopOaA4ek/yTqea2TI8htTpABEu/sAfUvSfaKClVQ=;
 b=EtqArzNaJx0J/kTBakPTuOKhH1V66kJn+jMWp4QeMkWJBINpO4nXx9m025GWx5byxS/ioPuGEzfWSfl3z3YwKbvIXMAZYkmfpYxyaqOWzsD/BMZ8xlyAwVu7JOZgGVaQ+xpYJCzQg85Sa3hByF84HxIkoRy7fOXY/DrhuJWVu+e4QGsbld7jzR1zwgP3lG17elf93lAfiFG/YIxXW5DHDKpO9d6rwUWa/WLR0eOmzUkRVhn1Mctpmj0X9Is9FW8I7aUxv6PZqfbE3PcmFFIF64khkqNnYCej/R+Tj3gPQs8LmoYgM3xrkdf6Sy0NgEz+ii161KIMmd+RDAurY6Durg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6oopOaA4ek/yTqea2TI8htTpABEu/sAfUvSfaKClVQ=;
 b=BFC1ZY+o3pfmi8jx9DQWOiYCbXXm96QkWdKYruu0sKn/WOndmBSG2KKUXDiotbyKcW3O5vV+tOXEfkiZWwxo7DFQvojuBsTHdONG0OoT4anABv5NKQcxeqpAwfAbSt2N93l2k4aHxfFer7z2Wk+nBmZtSdEZFEwmKmH7dYnS2dE=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by KL1PR03MB7080.apcprd03.prod.outlook.com (2603:1096:820:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Fri, 11 Aug
 2023 01:57:52 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a%2]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 01:57:52 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "linux-imx@nxp.com" <linux-imx@nxp.com>, "s.nawrocki@samsung.com"
	<s.nawrocki@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"xc-racer2@live.ca" <xc-racer2@live.ca>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "cychiang@chromium.org"
	<cychiang@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "judyhsiao@chromium.org"
	<judyhsiao@chromium.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "srivasam@codeaurora.org"
	<srivasam@codeaurora.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"perex@perex.cz" <perex@perex.cz>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "quic_rohkumar@quicinc.com"
	<quic_rohkumar@quicinc.com>
CC: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Thread-Topic: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Thread-Index: AQHZy1ScnpPFgWRFhkKrlrL16jIhya/kV80A
Date: Fri, 11 Aug 2023 01:57:51 +0000
Message-ID: <234edb7c2002106dee41d558481b4baf904208ab.camel@mediatek.com>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
	 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|KL1PR03MB7080:EE_
x-ms-office365-filtering-correlation-id: bb50fd1a-fe86-4b8e-af02-08db9a0e5f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K86IUlQtpneKxaN7jjItpbq18OGj/HjpFZXsPIkJhi4LwQLbBkOpEMkUSZQul8xSPaMqbpBvAocC7eUgqMcsX7BxK3QwOTsY3/rL3AuLT9Nrxo51bJynEk/k9L+f/A9ZzHOw61OyZndw7NefCPRJFmTarDSFjKMJ9baSfwQGjsPrLsg5XN5Swo3QqGyV+DfuYVEJ7+9SFERXHiqFy6oIjcjyC9WuTI6RuqWoztf7DdzjCbYjaQ84MXYWyHPI0mJa7+tWibtH9oy00qsaobUPsGC8rNNPAMjhwFo0bZlzfciBaRKcc5+SQCJ1xRv5EIGL0nJrkbA4DoUbca8OVp77Cd6Wyo4TxkqdNdNp/RSYGNqnprmsASyYFCkNuSqCCsP6T+nOsvLqtcue9S/eysyd2/tX0yvcNVTdIkYIdMpXSoeVDf+8Oe1JWlnL6pY09lIeTO9jBHY4gm5uVtXfZZVOY/Ob5AV+txTqH6FiNyuO1RL+yIcAo9FJDtRMAH9jo9upAUpDNb7nJuLVDc9tNifLKBxDigQu3AfMlz/loGkHBA4ZprhN6clGP/RANG+KGu6NqymfX6K1VTkJYNAyPkKWHQd2IRKEsl6Q/aVPMbUAeeIq/zdnIsQU4oqYpldvss8HyrOY+HI+CGgrhpNDBEwB0eLeG/WC85sBw79cs6liT1smPorOjGAfVe/aMmK1IjtQZVGOLzVp8XZGd3QjM03yWWBvx2jUziUIlXAetu29928=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39860400002)(186006)(451199021)(1800799006)(86362001)(38100700002)(122000001)(921005)(85182001)(36756003)(38070700005)(12101799016)(7416002)(110136005)(6512007)(478600001)(2906002)(4326008)(41300700001)(316002)(71200400001)(8936002)(8676002)(6486002)(4744005)(6506007)(2616005)(26005)(5660300002)(91956017)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(83380400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bFRZNGxET3NUbTExTzZBcnY5QkZDVzdPMjNwUUkwSWVOQXpCUjhiYWxSQzBN?=
 =?utf-8?B?MFU0eGRjN0k1UzVEUEIzSkY0TFhiRjFRSk5UUHhaZ0J4bVBNVlMvaXcxcVNp?=
 =?utf-8?B?V1VGQjY3QUdKbFpsSFgxK2JGZDk2cFRRblhta0RVemtMaUNCK1dKZzRzdHds?=
 =?utf-8?B?dGVFbnlBWmtxbFVyV24rbW1hc0FyVDdhbEdwbnVXNkx3RG54L09rVzYwVlBu?=
 =?utf-8?B?ZHhTWm5ra2RCY2hkWlphdXljNEt5VTVqMWk0a01lZ0VVY2FIUDRvNGNrUmpO?=
 =?utf-8?B?R01ReURhWU11aU5DNy9ELzdQYXRGcVpIWklHeC9nNW5VeHRJZXo3eXpLWmNS?=
 =?utf-8?B?YTFGbTl6RlowckJDSmhYWWdFZjV2N2lPWG8wemRtbUpHaWFrRTJNTFpBc3A5?=
 =?utf-8?B?WW1wS0lvaktqU0FoSXhHV1JqcEQ0V25JaTBkT2FnaXh4RDJGcksrQUsreVVh?=
 =?utf-8?B?dFJyRFN1aVBpblFReHprMlYxTVBRWEp3TkZTZ2NqUmxRdmFNd1M4eklwVGRn?=
 =?utf-8?B?RGZxdnlsSFE4NkVzSzJsOFM0ejVxYUNlT1pXT0dNOTR5azNGbUpsSW9WUkg1?=
 =?utf-8?B?Q2FlNjZsUS9vQ2UzSWo4WjdNcVFFbE1lcHdmY1pzck9PeXRIajNtZGMwOGlP?=
 =?utf-8?B?d2c3SXpObTFiZlkvMDY1bnRKeitlNC9GeURLQ281SXhiOTlWN2tTcTRKTnFy?=
 =?utf-8?B?dXBiczlyQjRFcFFWUXkrYVZSaWZ5RGQvRVR1am83UDdNUHBsRjhIYzEwNkJ1?=
 =?utf-8?B?N3dYejFFUklTeU1oR2tFdFkrUmJXTHR2aEp0a2xEWDdGcHFtcyswUTZxSnRa?=
 =?utf-8?B?RmE1U3pzMlFEVk5WSjZQekxGRGZLY3NlTjVKTkc4THJxVFdTNTZ4Ukc3VWUw?=
 =?utf-8?B?OHB6WndrOENucm5ybFRiK0hyeUptMDVzZTgxUVVRQnZuUWR6dHhpc2U2WHFy?=
 =?utf-8?B?Nzl5VHNGeHpZZmt6Y05NUTg0N2J6OThPZUg1bkNIVmkvTkJPam9jYXYraHdP?=
 =?utf-8?B?WTcyM2hKcTYvWS81dVRRL0I5dWpFcU90RDdHYkpRZUtSd1VQeVFZNEhndFVQ?=
 =?utf-8?B?ZG82dnhQMVdMREpWRE1RQ24zRGp1TFZVYmxJcEh0Z0F4cTV0TzFxb3dpTTNv?=
 =?utf-8?B?MWJUblArODVMZ1dvY2pOK3laazlIUnB6Tk9UMGp4Smo5OHN2Q0MyNFc4aDhq?=
 =?utf-8?B?eHVtZ1BQRVQrWGR4L3hLSE96Y0h5V2pPT2UzVlA5dEdDNmVIS242dzh6d2pW?=
 =?utf-8?B?OFNGTnRROUpxQnJDTWZKc25JOGdRZUhxWXhWNEgvS1VrSUpscFVSUXRFS0th?=
 =?utf-8?B?c0RaalpFN0k3eFNnczZmUjBWOS9sbE9PL1RpeVY2RnBUanQycVNDREd3eTI4?=
 =?utf-8?B?SzZaMmV0V0ZyWHY0UTRIQ0h2Yi9nRW54Nnp4Z21pS0o0RDdpSjc2VCtsL3pW?=
 =?utf-8?B?dnZmMUxENi9qVFR3bzhEb3VoUHUzUWhreUlqNERwNDdxRGRyakpXa3hROEov?=
 =?utf-8?B?amFkdTc2d1lnTSt2aWs0MFhlWmEraW43K3kyNzJJMHkwVTFkR2t6ZXhtZ1BH?=
 =?utf-8?B?Q2VRZ0RsSkF4MDNzK3pmVDhHWGtSYnRIZzk1ZU81d2FmZG44eGlhSTNpZmc2?=
 =?utf-8?B?M1JrQXNCL0N4ZWZrcU4zSUJjMEdUVnVHM0J1WWxlZC9LeVdPNGhwT0V1K3hJ?=
 =?utf-8?B?THBVTHQzR2UyR09veXFrb2pCMjRBQ29ITlpJK0JCQzE1ek5aVmo5MVRYUy8x?=
 =?utf-8?B?L0FOOFhIZ0FydUxyamJ0a3lVeXpKeDFlM1UwNjRhWTQvcFg5L3BiakNUY0hC?=
 =?utf-8?B?N1A5T1c3ZVRmeHJkVG5mQVM3eHlhRDhpeWg5U09vLzNLaVE4SEs5WW11MHhY?=
 =?utf-8?B?MExUdWt0aElTZnZiOE4rb1o4WGNHcHFPYVZQb2xWbmd0WjdHSVUwbzI0a3kv?=
 =?utf-8?B?OHRlUncySEZWR1kzRnVRaW1xVTZ6RGtyRWFDOEg5VVAyMFEvNG1FVXplSFdN?=
 =?utf-8?B?cDJnRm92OVkxR1dmeldIT2J6SklGbGI0WjZOdU1ldzV1SXJUc1MydjlBakNU?=
 =?utf-8?B?ZnYzK0JPMi9qdXowRDZXL21PVmtnRzRZeSt5VXZjbmU0MHFNOURVZTlLazRU?=
 =?utf-8?B?aTZWOURRVkN1WDNSSzAzaC9oTEZzOTgwcjhhUC9KWUxjQ2U3ZDBFY1VPUlJM?=
 =?utf-8?B?dlE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb50fd1a-fe86-4b8e-af02-08db9a0e5f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 01:57:51.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CUrX7L7VdUIS8bFCgbQgVgMULCH18Mjeq51vxxZpqXNywfioBoA7iG+FItbY7mcLMsCX9B6hwF4Mh/48/a/ghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7080
X-MTK: N
Message-ID-Hash: DFTL53GV2GGCJAZ5U3JZHJZALAAMRYVJ
X-Message-ID-Hash: DFTL53GV2GGCJAZ5U3JZHJZALAAMRYVJ
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFTL53GV2GGCJAZ5U3JZHJZALAAMRYVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCAyMDIzLTA4LTEwIGF0IDA4OjMyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KDQpUaGUgbWVkaWF0ZWssbXQ4MTg4LW10NjM1OSBMaW51eCBzb3VuZCBtYWNoaW5lIGRy
aXZlciByZXF1aXJlcyB0aGUNCg0KIm1vZGVsIiBwcm9wZXJ0eSwgc28gYmluZGluZyB3YXMgaW5j
b21wbGV0ZS4gIFJlZmVyZW5jZSB0aGUgY29tbW9uIHNvdW5kDQoNCmNhcmQgcHJvcGVydGllcyB0
byBmaXggdGhhdCB3aGljaCBhbHNvIGFsbG93cyB0byByZW1vdmUgZHVwbGljYXRlZA0KDQpwcm9w
ZXJ0eSBkZWZpbml0aW9ucy4gIExlYXZlIHRoZSByZWxldmFudCBwYXJ0cyBvZiAiYXVkaW8tcm91
dGluZyINCg0KZGVzY3JpcHRpb24uDQoNCg0KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc8bWFpbHRvOnJvYmhAa2VybmVsLm9yZz4+DQoNClJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPG1haWx0bzphbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Pg0K
DQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc8bWFpbHRvOmtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4+DQoNCi0t
LQ0KDQogLi4uL2JpbmRpbmdzL3NvdW5kL21lZGlhdGVrLG10ODE4OC1tdDYzNTkueWFtbCAgfCAx
NyArKysrKysrLS0tLS0tLS0tLQ0KDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQoNCg0KQWNrZWQtYnk6IFRyZXZvciBXdSA8dHJldm9yLnd1QG1lZGlh
dGVrLmNvbTxtYWlsdG86dHJldm9yLnd1QG1lZGlhdGVrLmNvbT4+DQo=
