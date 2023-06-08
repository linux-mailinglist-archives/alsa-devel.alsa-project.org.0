Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D37275F6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 06:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35C66C1;
	Thu,  8 Jun 2023 06:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35C66C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686197016;
	bh=yC6Kz3dRax/xXlR6dKczcSVQTuZUEay65JNQl9bu3hk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KMvxrKjQ8shFKMA9O2O7FAjJzQVaYtYlWBHF9wMSFsoY/xXOIiCPxFgG4mQtq5ZcO
	 OAG5onYtf5DiyAK1DHBrG9xNLHU16LO/a7SJC+hamafqM97cT4+iiTUvya2ymn9cKb
	 PJXydHq7gSQ+J3aZ60HV/h3i8UcInE9Q+1EhUX1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AF57F80199; Thu,  8 Jun 2023 06:02:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72110F8016C;
	Thu,  8 Jun 2023 06:02:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE54BF80199; Thu,  8 Jun 2023 06:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28BA8F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 06:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28BA8F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=pM5hyf8P;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=RBVPzF3C
X-UUID: 3ee4153a05b111eeb20a276fd37b9834-20230608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yC6Kz3dRax/xXlR6dKczcSVQTuZUEay65JNQl9bu3hk=;
	b=pM5hyf8Pl9n6ZXMYvrYAxfojC+z/TYQP+DduViB1pN2QDpwBHHirEIuAAqXz53wiMor+y/SW6rVm9srcrGpyvY3WCH+OvvkufQNq8Z5BzfsZ74kFguXJjcG8ojI++78CL8DMRqoAOox+Gtm2zGerA9ZJPXTIJ16RAR+ZnVOl1Aw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:60c2d639-d0c5-4a74-bf88-fa94ac822473,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:cb9a4e1,CLOUDID:4954c03d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ee4153a05b111eeb20a276fd37b9834-20230608
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 548016004; Thu, 08 Jun 2023 12:02:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Jun 2023 12:02:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 8 Jun 2023 12:02:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6kYPL9L44bUvsxlE94yHeMbragbRG+nUEx0bmJ+O2ORM1A4nHJZH+qxCr2iPlmqrkDvuDpnriGUh6kC+IFgjHmPSAv2XHBJ8Mq28/GjjrxO3kAXXMJtK7vhLbHWMCg9zd6ceBuBJe5C9tufbfD+fI095eUXyn9+CH5usRbVwdi12mS8cJ/JNSB0+Ur26yDH/wvnyknhVpCipH58xLuJMrZ+exfnwAQfg9NiMSV3O7Z+Jj8r+K21yq2rFnFE5yeVqnyylLfRIiCjTsTxDVFc0MeFfhlZSUjxr4BxGYzWlKfyeKavqiuda3lnvNyHjYa+dZvkdhmRNhZmSMvlSg19oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC6Kz3dRax/xXlR6dKczcSVQTuZUEay65JNQl9bu3hk=;
 b=gZVw7LNAPCdXW0rqKdn14d1Z760K9VUIF5r9BlXWZnMxG/TgkQqOLnL2+IitNVQi7QCNKf/tKsBNRmr4IYgNuRyp0OuoCwYc3yNsk5OrmmpkGYPmQjMAWOZtnsLfOjOjkcC66ll/7/lHKHB2uXhj9ye1n/oaLRICuf5/MgPGgLg0P8sl0QimqvFx0hAn5aPDbqs88+6feoKqWnbJVHahQUmCytE/YkGP5aqsKob2wyCID4PUAHBbjyMtoNFM2W8uxiF3BiimVZB0wHfXGXqszb5G8CFhGPVP+FDcLLvgJPnziCRN/L82GpU8oCWrXjzgnsEahz1xGf3ZqON1tV66LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC6Kz3dRax/xXlR6dKczcSVQTuZUEay65JNQl9bu3hk=;
 b=RBVPzF3CDNhTV1T9sIs/ew6CnuVpFPxl8fJDqAOh5nAeEzCbezc7zJ7dd2SLJN0tC03W4y2t6HYx9hlBYdGHc6dmwmsWGsrm6j64rnELzY+trJNw+FObiYc93TvUS/AiFwE07oz51pDAiv3AnSgUlBkE3wuX2j0Ks3oJjVHysw4=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by SEZPR03MB6850.apcprd03.prod.outlook.com (2603:1096:101:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 04:02:07 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 04:02:07 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Thread-Topic: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Thread-Index: AQHZmVCY6n4N7oFOFkCvi6A+hdppeK+ASVkA
Date: Thu, 8 Jun 2023 04:02:07 +0000
Message-ID: <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
References: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
In-Reply-To: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|SEZPR03MB6850:EE_
x-ms-office365-filtering-correlation-id: cef2fbc4-7e9f-42f3-e1d0-08db67d5209d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 biHZRCW0iVyyp2K+egGxZBPimsTwEv0D9xJrHN07nQkc3KCHqXJTBhHpKZPISMCv/w0dF3CYolJgySzHmtTHqpaLYVXQYlBXChCWFLfZn1NxLEb6+6nH3D1YmaPUN7H6gf329Rj/dG04lnoeIw2W3e7lCf1Fci5sz59GA84FGJK49e10ShdQCz+q19R6qrT0SMPU5oOJqbr/stJ6IicGLQLxr2p1U61OL/7ajGNMPlCxlBl0QyDoss0pcpkW641a34EZgH5UCsB5KtIFBhGbFyY/b3jiZIxDcYuWqfs3kRLCoSan1U4+d4IOX/ufyuibIU++fDYwRiKeWy6Kylyw7S63Yd5CjrsGrD3m+hKFkVLIdUVNUxfkKrgVfRQsQK8x5FZ18+RVBIVdKOCsGs7hWN2YGxlKeJhwAD/0BtIGHurPbE9LfIxfVVCfjzLGZW7QK8tH/iSYIz0FmH9W4R0DHls+tKyr5tzYfY/QuY0UKVPJsTYNO0WpsdkzHcNBKFLyvSUdP0UAfCL0rrudMob3zxwxVpVR8mouSVSR4ZnSTU7Lf0t3D9Kz6ncf+Bi+pkjeFB0dQpQJMigO1SXk0dzos5luybhAbSr81xXudzyYFGYNkn/Vn0SWIKwsb4worSL20plU76JWNhv2AUtN7hOSvMZdStcKcZdPLm+fSb5dM6Py58HzIxheYooc3CN8xJoK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(5660300002)(7416002)(38100700002)(122000001)(186003)(38070700005)(6506007)(26005)(2616005)(83380400001)(6512007)(54906003)(110136005)(478600001)(71200400001)(86362001)(6486002)(85182001)(36756003)(66946007)(66556008)(91956017)(76116006)(8676002)(4326008)(66476007)(66446008)(41300700001)(64756008)(8936002)(316002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmE5OWphS2o1TXc2V3ZseW1VY0ZZanN6NGk3M2psanhEY3UzWWl5Q3oxKzRs?=
 =?utf-8?B?TmdtaUJxaTgreUdsVytlV3QrZjFzYXpFcTVabHZPQm5WV0VPbjlWYVF4N2U4?=
 =?utf-8?B?bEV2TzFVVUxQbDRNaFBlb28yTnRyckMyRWhndVA1YWRmbFAzVDMyZGVhNHZK?=
 =?utf-8?B?R3FBNTF3WThHM2RhRDRwckcxc3hOUjFYWXM4MzYrWnlkamUrNXR0Qmt4Nk1w?=
 =?utf-8?B?QURoQ1Nsa2Zmc1RhRlFBc3YrVXU0U2NRaXpyUDBhb3I4QjBUUmVwK3NBczZY?=
 =?utf-8?B?eEx0R09ERDVhS3Jjb2l0a2c4SjhYR3BOZlBSZndlNW5tc2x0amFwQ0IrK1FJ?=
 =?utf-8?B?bVpWOGVmM1ZKdlZLOGZYWS9JNXJLdFF2bmhtSTNsT2JtaC9zTGRDbElQT1Fo?=
 =?utf-8?B?V3gvL2dCUGcxR1RTd0sydzVKUk1jVEFRMy92ZTV3cE82NHh6Z1FEeWJiUGli?=
 =?utf-8?B?SlQrYndMQ3VHMGovYTdxemJqaVNhVDZGSzliQlhHWGZjNkZaK0dBZThSdHEv?=
 =?utf-8?B?Z1hOV1NUWHFGM2V5WHVYbWZNSFJtUm0wVDBXcW5DZDNiZlFmcUNHaGRIenZB?=
 =?utf-8?B?cTFGZXZ2SWFUWDIyMi9JWUR1K2QyaU1kUmdyVW9wUFdITTBLZ2Y2Y1FaMkds?=
 =?utf-8?B?VUdwZWZ4UjZ3T2ovQk0xZUQrL3NMdU5BbUtOV1E4Q2JEQXdiaEdxZEJyWG5Z?=
 =?utf-8?B?T1kvNWNCbHg2VThLMGZPNXNZc1JCTzlXejhGRjdpa3g3TnR1V0JPZkdtRmlO?=
 =?utf-8?B?aGVjaU54OG9qZXQ4N3I4SjJKN1B3OXJJMDhFeUM5dWN4ZnhmY3pFTFl3SFFl?=
 =?utf-8?B?V3ZGKzFxOUpsT2RmVmhLQ2U3bm5vUEtuQmVPU05EVjhYdGU5cnBtOUVsdGhv?=
 =?utf-8?B?SUt3cnI1Tk1yRnB1bFF6Q0NBMFNRZTdncWt6QWFGa0VTSGM3OEgxUDlYUVdR?=
 =?utf-8?B?WVRVVDNkUXhQazdQVWUzU3VKaXBVWWdWQ0pPZVdDZnY1cUtqYStvQzV0OTVm?=
 =?utf-8?B?bjdYL0hHbmpQQThlY0VFL0xhTEJ2Z1djN2ZpWVljM3liem82LzRlOCt0bVVQ?=
 =?utf-8?B?R3RoSUZPS0MvWWlWZEwzT21CSHNROFdWdU4waG5RQkFYWkJmREU0RmN1K3c0?=
 =?utf-8?B?TTNBd0U0bkdSWTliaGYrWURnajFHZUxIcmZ3UnkyY1JIdEtwcHA1WnBVWElC?=
 =?utf-8?B?dHpTRFJoN1dtdzd6N285MFhROHF5VitVanplNzIrQUVwVk5pZjlsNjBma3oy?=
 =?utf-8?B?dzRJRm1FekxKandSZnRLTHBRVjRJd1FPU3dxbkprWFNZa1dCL0dxTzdwZXBD?=
 =?utf-8?B?OS9YMzdDbDZIQWVzc3VnakQzWDNBL2IwUlE5ZCtCN3haNEwxZCtmZGthYVVT?=
 =?utf-8?B?L3BjRnFHdnlPY0h6ekhZeXU0ZjFrWkdDelBRYXhVR1ZCL08zbUtHU1VVVXc1?=
 =?utf-8?B?QzBWeWtGVlkweWc1WGJRc1NVVjlTWTdrQXBXTkh3TjdPMFhZdWVmVkcvSlp5?=
 =?utf-8?B?MUZiaHc4VnprN3dyT3hDK1dCRVFsQ1JLQU5KbUVTdXdSazc1NlgybHBDeUJ1?=
 =?utf-8?B?RWxyNUxlWU85SnFRdEJpNUJ2aVVBUXhDdHRWQ21DTG9pTStPeHgxODlkZXR4?=
 =?utf-8?B?V2tnRUd4UE1GTG5WZFRnMVUrMWZsdlRpK0VzRllkM0MzTkJSaXE2cTZOWTlZ?=
 =?utf-8?B?ditybkJMcWdCNHB0aFZvVTl2bTAvRlZDbUNiN3c4TlU0a2xjUzVESHpZaWtX?=
 =?utf-8?B?cGFic1I2MDFhVXVaaUpyQUtLVEVBNy9nVDc5c1ZVd08zVSs2bHZQcU9xUVJ6?=
 =?utf-8?B?WTVDZndiVCt3c2VtNUdGTmNyRTQrSkllS0x5NG0yVTRRSWhkZS9GYzkxK0Nx?=
 =?utf-8?B?S0NEMWErKzZQeWRLWUJGa0k4N2xHWXloMlVDdmVtV1JBOVpKR2ZEUnAwTU9h?=
 =?utf-8?B?OU5aQnhVRXUwcXdOYTJvREtQaU1JY2FldVM0RlpXUk9NSDdTcmhQdnJCODVD?=
 =?utf-8?B?SEZ1YnRLRFNOejhNUmp3T2hseWdDOXptQ2kyKzZZMFhIa0MrTWZkdTdTbHpS?=
 =?utf-8?B?OVNNdjVtSENObkM0NXZ6aVdSdHh3c1NKa3AwQU9OZzJWMjdTNWkrMXNYMzNt?=
 =?utf-8?B?LytxaUVuQlBKQjl1RE5sdVhZdk9UQnV0OWcwU1JkWk1TVXJ1Zi9kb3hwTGc2?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <497CFB3B1918DC4B959282E9CFC5EFD1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cef2fbc4-7e9f-42f3-e1d0-08db67d5209d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 04:02:07.5947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 sm+6LDMzAfKrYj+q3BSSo88dJ98nbWKhRNxf5TB58N4kIw9NLLkqJwU8ak8sTxslzgklgyftrA/j6EGYKWcKjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6850
X-MTK: N
Message-ID-Hash: QFWA6I3XDRAKKWKPTA6EVBT7LF34OFEC
X-Message-ID-Hash: QFWA6I3XDRAKKWKPTA6EVBT7LF34OFEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFWA6I3XDRAKKWKPTA6EVBT7LF34OFEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDE3OjU3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiAgVGhpcyBjb2RlIHRyaWdnZXJzIGEgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmcgYW5k
IGRvZXMgc29ydCBvZg0KPiBsb29rIGxpa2UgYW4gZXJyb3IgcGF0aC4NCj4gDQo+IHNvdW5kL3Nv
Yy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jOjU5Nw0KPiBtdDgxODhfbWF4OTgzOTBf
Y29kZWNfaW5pdCgpIHdhcm46IG1pc3NpbmcgZXJyb3IgY29kZT8gJ3JldCcNCj4gDQo+IEhvd2V2
ZXIsIHJldHVybmluZyAwIGlzIGludGVudGlvbmFsLiAgTWFrZSB0aGF0IGV4cGxpY2l0Lg0KDQpI
aSBEYW4sDQoNClRoZXJlIGFyZSBzZXZlcmFsIHNpbWlsYXIgaW5zdGFuY2VzIGluIHRoaXMgZmls
ZS4gSWYgdXNpbmcgJ3JldHVybg0KcmV0OycgaXMgbm90IHJlY29tbWVuZGVkLCBzaG91bGQgd2Ug
dXBkYXRlIGFsbCBvZiB0aGVtIHNpbXVsdGFuZW91c2x5Pw0KDQpGb3IgaW5zdGFuY2UsIHRoZSB2
YWx1ZSBvZiAncmV0JyBhdCB0aGUgZW5kIG9mIHRoaXMgZnVuY3Rpb24gc2hvdWxkDQphbHNvIGJl
IHplcm8uDQoNClRoYW5rcywNClRyZXZvcg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiB2MjogQXQgZmlyc3Qg
SSB0aG91Z2h0IHRoaXMgd2FzIGFuIGVycm9yIHBhdGggYnV0IGl0IGlzIGEgbm90Lg0KPiANCj4g
IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgtbXQ2MzU5LmMNCj4gYi9zb3Vu
ZC9zb2MvbWVkaWF0ZWsvbXQ4MTg4L210ODE4OC1tdDYzNTkuYw0KPiBpbmRleCBiYzRiNzQ5NzBh
NDYuLjVhZDhkMmE1YmJjNCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL21lZGlhdGVrL210ODE4
OC9tdDgxODgtbXQ2MzU5LmMNCj4gKysrIGIvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgx
ODgtbXQ2MzU5LmMNCj4gQEAgLTU5NCw3ICs1OTQsNyBAQCBzdGF0aWMgaW50IG10ODE4OF9tYXg5
ODM5MF9jb2RlY19pbml0KHN0cnVjdA0KPiBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpDQo+ICB9
DQo+ICANCj4gIGlmIChydGQtPmRhaV9saW5rLT5udW1fY29kZWNzIDw9IDIpDQo+IC1yZXR1cm4g
cmV0Ow0KPiArcmV0dXJuIDA7DQo+ICANCj4gIC8qIGFkZCB3aWRnZXRzL2NvbnRyb2xzL2RhcG0g
Zm9yIHJlYXIgc3BlYWtlcnMgKi8NCj4gIHJldCA9IHNuZF9zb2NfZGFwbV9uZXdfY29udHJvbHMo
JmNhcmQtPmRhcG0sDQo+IG10ODE4OF9yZWFyX3Nwa193aWRnZXRzLA0KPiAtLSANCj4gMi4zOS4y
DQo+IA0K
