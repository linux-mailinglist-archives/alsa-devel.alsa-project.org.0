Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF37AD4BC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 11:43:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4317BBC0;
	Mon, 25 Sep 2023 11:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4317BBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695634996;
	bh=zIyzUWOK+cYnWMQLEYetkZyJXupnc++j7PuWWIzdiik=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n6e+TbvOvYXRQja5GHhd/rn9e17tJtIh9OLM1A/GXuHAOIVrqrH6Z9WdHBGhIQA6d
	 cDUm0WvV2D7HZ2/d/0XAnM51sefjElC1OeODgTDwNqqM8n5BF4hlS7CfEs5vC4s6+0
	 Egxsw8KkdK2tHsbGLKJisKKxmGkYFX+zKXXxfb6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 963FEF80166; Mon, 25 Sep 2023 11:42:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC264F80166;
	Mon, 25 Sep 2023 11:42:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B0E3F8016A; Mon, 25 Sep 2023 11:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94B0AF800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 11:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B0AF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=BygnEHqy;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=GP3AQcwj
X-UUID: caf39d765b8711eea33bb35ae8d461a2-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=zIyzUWOK+cYnWMQLEYetkZyJXupnc++j7PuWWIzdiik=;
	b=BygnEHqyBrCDXQOZe5PrQQNqRCLqPJJBQpOByMGLNt0zfhD3/HZg1RmGNHbRrRkahLaUl6HaZ0Q4JL/Gmfn3ezY45YIdKHEodr5L4269+SKCNtZpGwxHhqCF606dg3YfayECi92NXqUFOTP4oWTVbApGUI6LRw24CsA3m1gJEeQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:878db68d-fe27-4470-b83b-0160524923a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:78126fc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: caf39d765b8711eea33bb35ae8d461a2-20230925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1986032530; Mon, 25 Sep 2023 17:42:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 17:42:06 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 17:42:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO0W94r6h9fI5G4mkDrRowifLM3VO2ZdhZc6/H4dEfzPMazoV9qRvJYf/YUox4Bke4d9K3lUbNWV0eJ/r3sFSq4MgehQDQNYOveIP/u66QCbkAB5YrfB1bve5siXdV3u0mCmeo9EGc6aK5uTxhBXrfgElt6g395oYTDtV0mMZ1Gto2tzex8VmQtAP+yPERB7jfsW2OwTQILt1ON2+oB2fogcKAoE3Wmq6e02+4axGJFmFcrjA9JHet/jQ/qEbRCghZhu4BACAZEKXOikYFKf1GhQdT5beR74fEuleOil9zm0IoerWlmfYR8+RMz80b+TyGOGXHPCyyOiWEaGJ2L7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIyzUWOK+cYnWMQLEYetkZyJXupnc++j7PuWWIzdiik=;
 b=MJrjqeqnYddqLK2ET/X53UIiOlDT0HmEypy6E/oKIV3X8bBnjK/tO2zcy5MkztC/fVmvScInzZnhICkX8Lla2VIgESNCmZWlTHer0ith3siB+6DfvpGL5bg+nwGR4rAPRhMGCe7GFT9ZSvF+cOmNko7+HwNv4jQRzFaqq19l2cGrJRg1LHZrf4+F4B692kg57rk46YqQVoy9wAN0WfE+2cYuaXVEZfuHlxcXQXWaeqw610XqfttPMlN8t5gMznCn+/YTVHKNTYPhkcm+UYm0f1T3W7IiNUIGpHHZm9R1PqBgsWUux+TPnvf5jHAmYUl1rD+YMv2Ukh8lQIjxiXlLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIyzUWOK+cYnWMQLEYetkZyJXupnc++j7PuWWIzdiik=;
 b=GP3AQcwjjQrapPRz/azUcCbDU4LzxKQSGgwUnnyW2usPgzGXbfpnfYyxZ10EPHvBavH+93emFRKSF8pFd1ZUzkq2mhkCsgClM3OJT0Uh42rtTjFwNMqWQ/sbBEGR4cTsw53wh5Y3o8/Q2ErUSqCMschxyRCrBEGFPsaSvtLeoFQ=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by KL1PR03MB5975.apcprd03.prod.outlook.com (2603:1096:820:87::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 09:42:03 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::96c:e99d:e17d:7188]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::96c:e99d:e17d:7188%5]) with mapi id 15.20.6813.024; Mon, 25 Sep 2023
 09:42:03 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "xiazhengqiao@huaqin.corp-partner.google.com"
	<xiazhengqiao@huaqin.corp-partner.google.com>, "perex@perex.cz"
	<perex@perex.cz>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v1 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Thread-Topic: [v1 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Thread-Index: AQHZ74vO3x1DAEYIzUq7YGmhC1AcSrArSfoA
Date: Mon, 25 Sep 2023 09:42:03 +0000
Message-ID: <e0cf4d2a6ccb0661e48a9fa744fb8d22559251b2.camel@mediatek.com>
References: 
 <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
	 <20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: 
 <20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|KL1PR03MB5975:EE_
x-ms-office365-filtering-correlation-id: 071ff883-d6ea-4b53-802b-08dbbdabac62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SWlNH1AbYJ5TeHSq68jMMx6jjVRiN/2X4hzwGnrqLwDku+TbSew5FaFibU+RSpfxMuDtvcEgrnIT89TAzhV3cYl0Pd2mudf4i9PT7a/CtROxmYIXX8ebm7kW3LH8O8lMie95Spo1b3Kne/MBMasy6w7MbkgStGyvJUhYNmyh2jo5/KfUElLkQRaLtCgkAPiX0o3N/zqg0ZsGYqoDNlrqFPMUr42oc4QDT7CoCvIhgIKpTV0TXuz1RGbgshqLb0wZTNLiAa8uIRhG+Cw0j9RQX6Jgn+HuO+f+6axsVvInKPnrfqNWSk4odqFqQKLPCKpmVlChlAi3LqsJtBWfRQWQ1Bm63JUiVc8a6cjyINX4JOidCmwdQYMlDtz8oLuT1AwCkI+oqQkVPoQ0PuRf85VifhFVCkRP1Ejd+ZXWY56STEdFvDlfU0v+EORrMQOvFmGC8vdrpGep1+UDLmE3Mlr3Oh4I4VaFmDN5WPnSsvjbJT04aKRMA6A6ePPvSKS+739tP/SwGCYPhz2Xi7SQtFkfZE5ADTembdawoWmncwZ90Ls5EflR0pm0kEqGXQdP2HzK9WGLuwz5QUHmHI/BTzcHXFtN89EIreWCB27s5czLUx+pavdJs/73cYbv+T5YUZc/J/8gSJWq7FWhSLLfMD+zuOGKTIPkX5AOiw1CLk769m13lmjQFygCTW+rReiOgzNg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(26005)(71200400001)(6486002)(66446008)(2616005)(66476007)(86362001)(76116006)(66946007)(66556008)(91956017)(110136005)(478600001)(38070700005)(38100700002)(122000001)(64756008)(83380400001)(54906003)(2906002)(8936002)(8676002)(4326008)(85182001)(36756003)(316002)(5660300002)(41300700001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2c2azduRitGUmZ2MEU3c01zNFVqM0l5OGNGQzBzY2RPYVQ5SnJuVmJreDBH?=
 =?utf-8?B?TjhscXU3M0hiSmdreWs4bmRyVWJMUUtMQTNrNGhHNHdlSHV1bUovcE5oUjBa?=
 =?utf-8?B?aWVHTU5IUVBtL0gvMytmVTQwQitCWlJ6R2tMbE1EWlhpTG9aTDhRZDM3T24x?=
 =?utf-8?B?OWVuNHpaQ0cxQU9NV0dEVGgrR1dVWTQ2ZWlIRm4zL0JVLzZZOXJScE1XRk9M?=
 =?utf-8?B?LzJwejlob2FhelhuSVdneXQ2RUl2TEk3eFMrd2MrdzlTUW1tcldTSkx5d1J4?=
 =?utf-8?B?MzFITS8xNDJTZ1dPdjBpMDNLZjVGTlBoMkNYRnlweE9kV1hHY1FNRFJQM1Np?=
 =?utf-8?B?eWIvL1JKOXFCRUJtZ2FMN3pFVUFDV1kyb200azJXa2pNRWxhTUZlTUs4enA4?=
 =?utf-8?B?dkFaaUtjZ1Zrb3cyMXZYaXB5RU9RV3RqeldDWHpBd1pyNTBFUXVCV1BYS2lH?=
 =?utf-8?B?alZVQ2c1MjBiVDJha1MrQU9PQXdYWXpMajRjUTU4MUVqMWp3L2hYMFRjdDNp?=
 =?utf-8?B?ZEFYbUwzQU5jeFdITlVpM2dCV09OU2N3aXVPMk8vOGZYT25IUXh2cnpIZ1Fr?=
 =?utf-8?B?RXY0L1E0a29Rckw2OW45Uys3OThCcFBXNTRQMFlrWHlRMjJPOHRtTFYxMnI0?=
 =?utf-8?B?a09hdWp1aUxGL29LSmk5T0hBTk8rUzhQaEQxdXl6dWtSQzRKVFlWcjVlWXpv?=
 =?utf-8?B?cVFSSUFwcUdaV08wQWpBMGFUWEtsTGJxeHhCRjFJK2RaSTZmZEFGUlBzeDFI?=
 =?utf-8?B?UythQThrd04zSkZoUXA4R2hwK2NsRmFvL282bnoveGw4a2t6WGRCTy9JakM4?=
 =?utf-8?B?VEVGclE2R0NRUmlZVEIrOXp4Tlk4LzdONU45QTNSQ3pZbS9mbWxrbjN2akRJ?=
 =?utf-8?B?VUtOUXFmT2c1Nngra1BtWEJMNlhJY0hjQ3pkODNqZm9oTTExMUpXVkZoTkMr?=
 =?utf-8?B?OHp0dk5GU21NbzZIWE0wSHVpaEhiTEc5K2UwRVEvcUxXUjBqVlZlRVEyazda?=
 =?utf-8?B?VkhHZnZuUUMwS1BONkQyMDYyODdwclJaY0hSK1RvU0JiYitFTnVESkdtZGRz?=
 =?utf-8?B?TWhtZG5qbEc4ZFhFS1pSWEYwYjArOHE2dGdLSEdITis3aExUL2wxV1VpNCtF?=
 =?utf-8?B?L3BWNDhvei9NTGM1ZUxqMzVYdisrYVNZcUxrNzhsNEp1ZGZXVGRDaUNaMU05?=
 =?utf-8?B?ODZzK00xZGtQTWdFTENQR21mNlkvTWhZa3Q4TkxXSkhoQ1BTU0FEa2d1QUFO?=
 =?utf-8?B?c1JoZE5hZTFnbTMzVGxLTUpUdFo1K0pDbFVDMjJKeERaWGtIR0FHY2xiUDlJ?=
 =?utf-8?B?Rzl5Yzkwb1ZhKzZQcE41WHVremxMblZTTnVzN0IxbUVublFzQUhrQXZaSzdJ?=
 =?utf-8?B?STRLazl4QXVJdTJWa2dBUlFnOThQK2VzR1ZpQk90Um1jUDh0R2crdVhoT0or?=
 =?utf-8?B?UWpMWGQyR211MHlOVi9WZ1RmQVVXclBKbkRjMndiSG45V3pyNWZLTmJoR3NN?=
 =?utf-8?B?SllkaGpFT0tYTWRub1NEWDVxdFBXLzE3QjNITGtiSmphWVN0M3N1QjJwNjNl?=
 =?utf-8?B?bENEZ2k2a2dva3VSNzhDY1BzS3hYUGFwMVlzR2VqaDMyb0hkWFB2ajdkVzh6?=
 =?utf-8?B?ajRPUUl3MjZoR21iRklXdkNPMTgyQlA0VkpldDZOcnNlV3RMeEZaU1B0V2ZT?=
 =?utf-8?B?ZEZWSHhlSHdvK0Fzb1ExSCtiVGhtaXdiYlRwS2NvQzVRWndocEVYUTU4bStt?=
 =?utf-8?B?L1BNdkQxampFd1paRmE4a0VsVnJhcTJReVNacDJmREMvdzBXQ1ZhbzNFczdr?=
 =?utf-8?B?bVVydDhncEtsNUt0c3Y3eW42UDI3ZnFndXhIVk9SZzRJeFpVeU84dCtDREFR?=
 =?utf-8?B?ZEdaNmxsWjFmaXJnbXkvb1AxQmJsZkJaY1U5M0NxSC9YYVB3RktMdk5LZWdT?=
 =?utf-8?B?dTQwZnMwMjNncVFLMjNreXpNV3ZyUC9ONlQzeG93TXJhZG5PRVo3NnhBUHNy?=
 =?utf-8?B?VEd3N1pqSTRRS3VFSDR1VXpiMCtiOFNJNzBWL1hqWHpXNkhMQ1kvL1c0VTZI?=
 =?utf-8?B?SUJqWW54c29CYjUyQ3RxM2RPd1AzQW9sRXI4a3JEU1QrbGpSNzFLMFZsc0tZ?=
 =?utf-8?B?em5NdmxJVXBBdWlxVkkyQ1lvWTlWRXB1V1dCTkJFMjh2aEZId3NSazRlaUVH?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13907006F14A2541A771A8F3E5281999@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 071ff883-d6ea-4b53-802b-08dbbdabac62
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:42:03.1863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 FrT+AzfR8TKAHEpjsn49N2CuL0EFWHArikaP2BUzezaU5DHv9CRHajB0YqZ8SC5Kk+4kyk+l/FtEuN+CDjpLbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5975
X-MTK: N
Message-ID-Hash: 2CE2LJ56B6CUWYB4OZWZBK7EJMWLJ3JA
X-Message-ID-Hash: 2CE2LJ56B6CUWYB4OZWZBK7EJMWLJ3JA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CE2LJ56B6CUWYB4OZWZBK7EJMWLJ3JA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDE2OjM4ICswODAwLCB4aWF6aGVuZ3FpYW8gd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgVG8gdXNlIFJUNTY4MlMgYXMgdGhlIGNvZGVjIGFuZCBNQVg5ODM5MCBh
cyB0aGUgYW1wLCBhZGQgYSBuZXcNCj4gc291bmQgY2FyZCBuYW1lZCBtdDgxODhfcnQ1NjgyLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogeGlhemhlbmdxaWFvIDwNCj4geGlhemhlbmdxaWFvQGh1YXFp
bi5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBzb3VuZC9zb2MvbWVkaWF0ZWsv
S2NvbmZpZyAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTg4L210ODE4OC1tdDYzNTkuYyB8IDE1NA0KPiArKysrKysrKysrKysrKysrKysrKystDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiAN
Cg0KLi5zbmlwLi4NCg0KPiAgDQo+ICtzdGF0aWMgaW50IG10ODE4Nl9ydDU2ODJzX2kyc19od19w
YXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtIA0KDQoNCllvdSBhcmUgdXNpbmcgJ3J0NTY4
MnMnIGhlcmUsIGJ1dCBpbiBvdGhlciBmdW5jdGlvbnMgeW91IGFyZSB1c2luZw0KJ3J0NTY4Micu
IFBsZWFzZSBlbnN1cmUgY29uc2lzdGVudCBuYW1pbmcgdG8gYXZvaWQgY29uZnVzaW9uLg0KDQo+
ICpzdWJzdHJlYW0sDQo+ICsJCQkJCXN0cnVjdCBzbmRfcGNtX2h3X3BhcmFtcw0KPiAqcGFyYW1z
KQ0KPiArew0KPiArCXN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQgPSBzdWJzdHJlYW0t
PnByaXZhdGVfZGF0YTsNCj4gKwlzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkID0gcnRkLT5jYXJk
Ow0KPiArCXN0cnVjdCBzbmRfc29jX2RhaSAqY3B1X2RhaSA9IGFzb2NfcnRkX3RvX2NwdShydGQs
IDApOw0KPiArCXN0cnVjdCBzbmRfc29jX2RhaSAqY29kZWNfZGFpID0gYXNvY19ydGRfdG9fY29k
ZWMocnRkLCAwKTsNCj4gKwl1bnNpZ25lZCBpbnQgcmF0ZSA9IHBhcmFtc19yYXRlKHBhcmFtcyk7
DQo+ICsJaW50IGJpdHdpZHRoOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwliaXR3aWR0aCA9IHNu
ZF9wY21fZm9ybWF0X3dpZHRoKHBhcmFtc19mb3JtYXQocGFyYW1zKSk7DQo+ICsJaWYgKGJpdHdp
ZHRoIDwgMCkgew0KPiArCQlkZXZfZXJyKGNhcmQtPmRldiwgImludmFsaWQgYml0IHdpZHRoOiAl
ZFxuIiwNCj4gYml0d2lkdGgpOw0KPiArCQlyZXR1cm4gYml0d2lkdGg7DQo+ICsJfQ0KPiArDQo+
ICsJcmV0ID0gc25kX3NvY19kYWlfc2V0X3RkbV9zbG90KGNvZGVjX2RhaSwgMHgwMCwgMHgwLCAw
eDIsDQo+IGJpdHdpZHRoKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoY2FyZC0+ZGV2
LCAiZmFpbGVkIHRvIHNldCB0ZG0gc2xvdFxuIik7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0ID0gc25kX3NvY19kYWlfc2V0X3BsbChjb2RlY19kYWksIFJUNTY4Ml9QTEwx
LA0KPiBSVDU2ODJfUExMMV9TX0JDTEsxLA0KPiArCQkJCSAgcmF0ZSAqIDMyLCByYXRlICogNTEy
KTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoY2FyZC0+ZGV2LCAiZmFpbGVkIHRvIHNl
dCBwbGxcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IHNuZF9z
b2NfZGFpX3NldF9zeXNjbGsoY29kZWNfZGFpLCBSVDU2ODJfU0NMS19TX1BMTDEsDQo+ICsJCQkJ
ICAgICByYXRlICogNTEyLCBTTkRfU09DX0NMT0NLX0lOKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJ
CWRldl9lcnIoY2FyZC0+ZGV2LCAiZmFpbGVkIHRvIHNldCBzeXNjbGtcbiIpOw0KPiArCQlyZXR1
cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiBzbmRfc29jX2RhaV9zZXRfc3lzY2xrKGNw
dV9kYWksIDAsIHJhdGUgKiAxMjgsDQo+ICsJCQkJICAgICAgU05EX1NPQ19DTE9DS19PVVQpOw0K
PiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2Nfb3BzIG10ODE4OF9ydDU2
ODJzX2kyc19vcHMgPSB7DQo+ICsJLmh3X3BhcmFtcyA9IG10ODE4Nl9ydDU2ODJzX2kyc19od19w
YXJhbXMsDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW50IG10ODE4OF9zb2ZfYmVfaHdfcGFyYW1z
KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQ0KPiAqc3Vic3RyZWFtLA0KPiAgCQkJCSAgIHN0cnVj
dCBzbmRfcGNtX2h3X3BhcmFtcyAqcGFyYW1zKQ0KPiAgew0KPiBAQCAtMTE2Myw2ICsxMjg2LDIx
IEBAIHN0YXRpYyB2b2lkIG10ODE4OF9maXh1cF9jb250cm9scyhzdHJ1Y3QNCj4gc25kX3NvY19j
YXJkICpjYXJkKQ0KPiAgCQkJc25kX2N0bF9yZW1vdmUoY2FyZC0+c25kX2NhcmQsIGtjdGwpOw0K
PiAgCQllbHNlDQo+ICAJCQlkZXZfd2FybihjYXJkLT5kZXYsICJDYW5ub3QgZmluZCBjdGwgOg0K
PiBIZWFkcGhvbmUgU3dpdGNoXG4iKTsNCj4gKwl9IGVsc2UgaWYgKGNhcmRfZGF0YS0+cXVpcmsg
JiBSVDU2ODJfSFNfUFJFU0VOVCkgew0KPiArCQlzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAq
dywgKm5leHRfdzsNCj4gKw0KPiArCQlmb3JfZWFjaF9jYXJkX3dpZGdldHNfc2FmZShjYXJkLCB3
LCBuZXh0X3cpIHsNCj4gKwkJCWlmIChzdHJjbXAody0+bmFtZSwgIkhlYWRwaG9uZSIpKQ0KPiAr
CQkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCQlzbmRfc29jX2RhcG1fZnJlZV93aWRnZXQodyk7DQo+
ICsJCX0NCj4gKw0KPiArCQlrY3RsID0gY3RsX2ZpbmQoY2FyZC0+c25kX2NhcmQsICJIZWFkcGhv
bmUgU3dpdGNoIik7DQo+ICsJCWlmIChrY3RsKQ0KPiArCQkJc25kX2N0bF9yZW1vdmUoY2FyZC0+
c25kX2NhcmQsIGtjdGwpOw0KPiArCQllbHNlDQo+ICsJCQlkZXZfd2FybihjYXJkLT5kZXYsICJD
YW5ub3QgZmluZCBjdGwgOg0KPiBIZWFkcGhvbmUgU3dpdGNoXG4iKTsNCg0KSXQgc2VlbXMgdGhh
dCB0aGUgaW1wbGVtZW50YXRpb24gaXMgdGhlIHNhbWUgYXMgTkFVODgyNV9IU19QUkVTRU5ULg0K
TWF5YmUgeW91IGNhbiBtZXJnZSB0aGVtIGFzIHNob3duIGJlbG93Lg0KDQppZihxdWlyayAmIFJU
NTY4MnMgfHwgcXVpcmsgJiBOQVU4ODI1KSB7DQoNCgkvLyBhY3Rpb24gaGVyZQ0KfQ0KDQpUaGFu
a3MsDQpUcmV2b3INCg0KPiAgCX0NCj4gIH0NCj4gIA0KPiBAQCAtMTE5MCw2ICsxMzI4LDcgQEAg
c3RhdGljIGludCBtdDgxODhfbXQ2MzU5X2Rldl9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBzbmRfc29jX2RhaV9saW5rICpkYWlfbGluazsNCj4gIAli
b29sIGluaXRfbXQ2MzU5ID0gZmFsc2U7DQo+ICAJYm9vbCBpbml0X25hdTg4MjUgPSBmYWxzZTsN
Cj4gKwlib29sIGluaXRfcnQ1NjgyID0gZmFsc2U7DQo+ICAJYm9vbCBpbml0X21heDk4MzkwID0g
ZmFsc2U7DQo+ICAJYm9vbCBpbml0X2R1bWIgPSBmYWxzZTsNCj4gIAlpbnQgcmV0LCBpOw0KPiBA
QCAtMTMwNiw2ICsxNDQ1LDEzIEBAIHN0YXRpYyBpbnQgbXQ4MTg4X210NjM1OV9kZXZfcHJvYmUo
c3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCQkJZGFpX2xpbmstPmV4aXQg
PQ0KPiBtdDgxODhfbmF1ODgyNV9jb2RlY19leGl0Ow0KPiAgCQkJCQlpbml0X25hdTg4MjUgPSB0
cnVlOw0KPiAgCQkJCX0NCj4gKwkJCX0gZWxzZSBpZiAoIXN0cmNtcChkYWlfbGluay0+Y29kZWNz
LT5kYWlfbmFtZSwNCj4gUlQ1NjgyX0NPREVDX0RBSSkpIHsNCj4gKwkJCQlkYWlfbGluay0+b3Bz
ID0NCj4gJm10ODE4OF9ydDU2ODJzX2kyc19vcHM7DQo+ICsJCQkJaWYgKCFpbml0X3J0NTY4Mikg
ew0KPiArCQkJCQlkYWlfbGluay0+aW5pdCA9DQo+IG10ODE4OF9ydDU2ODJfY29kZWNfaW5pdDsN
Cj4gKwkJCQkJZGFpX2xpbmstPmV4aXQgPQ0KPiBtdDgxODhfcnQ1NjgyX2NvZGVjX2V4aXQ7DQo+
ICsJCQkJCWluaXRfcnQ1NjgyID0gdHJ1ZTsNCj4gKwkJCQl9DQo+ICAJCQl9IGVsc2Ugew0KPiAg
CQkJCWlmIChzdHJjbXAoZGFpX2xpbmstPmNvZGVjcy0+ZGFpX25hbWUsDQo+ICJzbmQtc29jLWR1
bW15LWRhaSIpKSB7DQo+ICAJCQkJCWlmICghaW5pdF9kdW1iKSB7DQo+IEBAIC0xMzQzLDkgKzE0
ODksMTUgQEAgc3RhdGljIHN0cnVjdCBtdDgxODhfY2FyZF9kYXRhDQo+IG10ODE4OF9uYXU4ODI1
X2NhcmQgPSB7DQo+ICAJLnF1aXJrID0gTkFVODgyNV9IU19QUkVTRU5ULA0KPiAgfTsNCj4gIA0K
PiArc3RhdGljIHN0cnVjdCBtdDgxODhfY2FyZF9kYXRhIG10ODE4OF9ydDU2ODJfY2FyZCA9IHsN
Cj4gKwkubmFtZSA9ICJtdDgxODhfcnQ1NjgyIiwNCj4gKwkucXVpcmsgPSBSVDU2ODJfSFNfUFJF
U0VOVCwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10
ODE4OF9tdDYzNTlfZHRfbWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE4OC1tdDYzNTktZXZiIiwgLmRhdGEgPQ0KPiAmbXQ4MTg4X2V2Yl9jYXJkLCB9LA0KPiAg
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4LW5hdTg4MjUiLCAuZGF0YSA9DQo+ICZt
dDgxODhfbmF1ODgyNV9jYXJkLCB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTg4LXJ0NTY4MiIsIC5kYXRhID0NCj4gJm10ODE4OF9ydDU2ODJfY2FyZCwgfSwNCj4gIAl7IC8q
IHNlbnRpbmVsICovIH0sDQo+ICB9Ow0KPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXQ4MTg4
X210NjM1OV9kdF9tYXRjaCk7DQo+IC0tIA0KPiAyLjE3LjENCg==
