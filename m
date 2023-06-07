Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6930725BA8
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 12:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CDD822;
	Wed,  7 Jun 2023 12:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CDD822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686133911;
	bh=Tr6qwmNsXCjFvIDRDV6bDAtRaMqMNcXeLwXyqgYElKk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKR3QbfHrBVJDOwR6sEeTt+EHpp+i5iLqGVNmN3McgVuSCJNNyUC/7UcghrnZcy1f
	 z3YCJE911JHF7Z1+RpneOgmcCPo9aq6qzNSA3f0psPuNGNy9HirSejZ1ckCCsJ8Vyx
	 yN09U6OTiyaHyEGO1Ih5oqkY6biyJBtA8N7d5szc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FEB0F804DA; Wed,  7 Jun 2023 12:30:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4727F8016C;
	Wed,  7 Jun 2023 12:30:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41074F80199; Wed,  7 Jun 2023 12:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34773F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 12:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34773F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=YTd9DAO5;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=BusR1Gk3
X-UUID: 48f55f54051e11ee9cb5633481061a41-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Tr6qwmNsXCjFvIDRDV6bDAtRaMqMNcXeLwXyqgYElKk=;
	b=YTd9DAO5mKQyLciRYoKc7ZZCYHxmUK3XqSgyJyLDiY5NUYwNp8VmSCYjzat0RNMlIabQ1YRBv56TLOb8Cb4BqmLn/9iUCBPZPGQNfKT0ZHREF1yCqnXXX9/v1yAy9nixbLd7r6I2RRheKcKxEvlUpqdf6wf0pb9IakZb1yg8KRE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:0d3353b0-ea05-4be7-95b5-8de55a19b00c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:cb9a4e1,CLOUDID:1441ac3d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 48f55f54051e11ee9cb5633481061a41-20230607
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 962392892; Wed, 07 Jun 2023 18:30:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 18:30:08 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 18:30:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BweMhPRJXPpllD0TdLGSJITUuPFH7s5hq0iXPU/3pEu9tecqz0OHMGTiIajzreFmVbgooLj2ZjXRSorRfc8Af0F0+pKcF1mIDS8IxJtVsklYHnuwfavlLDbaeeuiJUZsUgm94he+L8kfHx3inFob5rTC7RLVR7pslHaVQqN5wiHyYepdkWQsM1TSs5eQ858Axd78AQB97vhm6T5VkEMKZABEalhYYitxGyOEBIpJt0g7Hr33T/rILXfUqcrLe8dNTeefmnUOhybZ8pE35PGpj3rPSXrEpqv08ZGI0OUKY9Y0KlXZoJca+DJAcTAbvSS2nOLvaVj0ZHq7RUqTXmMRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr6qwmNsXCjFvIDRDV6bDAtRaMqMNcXeLwXyqgYElKk=;
 b=RPFe+5qEVqyrkunpNdu9hysAhcP6mA1k9sgeXOk4IHy+jIwO3zr7KfYXKqc5S0y5EgQ/Ci6twRjd0+fG8tr/NJGdvoxD008dWnTD2189YIAeXwziaglS4Wi3qXIeAQAQ1fZ2wG1i01i2psibmzmSJpTUAjMTFyA0kyE0nZ2jbeU2FgBem2iJQfYPTFVKId+/Hs7PyKuTOUvLRdJw2B3Xg+HDhEBqTOEl2Q7CY7N1qoKMagyfOxNTvKPD0ruys8KndqxCgsb03u3C1LdYIaJ9ojNQ2o2F4cgkhOFXSnU8njiOdEXOi+oa/IqD7AbtyFA5bXHCAjlSfjrvsYIVHJQj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr6qwmNsXCjFvIDRDV6bDAtRaMqMNcXeLwXyqgYElKk=;
 b=BusR1Gk3qgYZYJkIa3Kn9SHX0VSWEmfdf69VMkUlfR4kBWild1S2DmaWdj0L1vc3L5jqRj6mdZGriYODImYw3F7G4DJUNbg7+878mM6rk/KSYRBU+ovOXXR/ckrcjK4T5ym098DyyPtibepFFaOtN706IaSlceVmy6MSvQgQZp8=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by JH0PR03MB7545.apcprd03.prod.outlook.com (2603:1096:990:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Wed, 7 Jun
 2023 10:30:06 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:30:05 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in
 codec_init
Thread-Topic: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in
 codec_init
Thread-Index: AQHZmSRYs9Isa+CGnk6XN3mVcICvMK9/I8GA
Date: Wed, 7 Jun 2023 10:30:05 +0000
Message-ID: <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
References: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
In-Reply-To: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|JH0PR03MB7545:EE_
x-ms-office365-filtering-correlation-id: 6af8ce7b-a257-43c6-0e98-08db67422916
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 V80sqJx8w/h1ReotNQ0Ws1BdYeZN2PyCKxOS7/NAGR83j1+JNWL66NvLtwTGHJemEHtVBRMwm5YNXfoUlTpzQij0ZDHHqbNLfVanW+76ubgD6P8SBHPKvPDNT3JqFE6tGf+OIfWfg2dxOZY56PNMtQcBMELXouq0oAEWOZLeBi9AH9+gcox6Jd4U3APQYx21tBy9e2Y5SQhIjkBraoVvLY35Y3kbGT26GwUYfFl967y6ceSSL7DHDZCgN+6SgRu98YhXPVe01wG2OWVjzPfONZNTeh59Z0TH/Os3ZP0orf7B3LpDvx4l2H2HFfg6TyDZHc0pgcTnDQUNr2LD4NJgSlxvhhxfxw8VxuMSXavnfniUtxCw+xKwVYTP2Km1mHO1QwP7lmMglhu2oBpG20Zqthb/0F50RFGFlzY1QMJPddQd7+sKlVYzmFFLPQ2G6+qzcgmOD9DYLlZxIAUP7sxbthj9nXgaDe30x0Y3j/IdAeWS0JHwxMMTMmrq/It++bRCZrZEsynaQibyonhDN0Q5woadSxMgfnFdZd5tEUd5ulcvkfuNHgeuftibOAFXlG9NoWaPL3qmV3urZ1faH9UTv7Pxeo3vU3XaQHhdhjyBlLc/mn8emD5OkRgLEL0NYvQsvp4ZwowWJqye/dg/fGXzPA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(26005)(6512007)(186003)(41300700001)(5660300002)(6506007)(85182001)(36756003)(7416002)(4326008)(316002)(76116006)(91956017)(66946007)(66556008)(66476007)(66446008)(64756008)(71200400001)(8676002)(8936002)(83380400001)(2616005)(478600001)(54906003)(86362001)(2906002)(38070700005)(6916009)(122000001)(6486002)(38100700002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlQwK3J5YUw0WlpRTlgvRG5SMCtzOGpQK1ZHWXdIcXYyeFM0NkJ6QWxsOURw?=
 =?utf-8?B?Y0VlbU5HMjRCL1hLL1YraVRRc3lPMnNUYnd4UXlTY083WWp4RmRSM2xPS0VU?=
 =?utf-8?B?bG1ZSkNuSjlQeXRjZno1ekNIVVc0YU9Vb1doa2Riek1OMG9EYXNzUEZNRUkx?=
 =?utf-8?B?R2lLcWNGQytBbHBzTHhSaloxdi95WTY5UGFNZm9NNy9wclV6OWFCL0lzMld5?=
 =?utf-8?B?MkhKSEhnM0hWZDBmcCtZMnEwQlhYQ25rZzJaZ2hoeVlkaEJLV2dOcllobjZD?=
 =?utf-8?B?NDJHbFh2SFhaQUlVdVpMY3F5RDVHVUpObWJ6NTNsOGxkV2VPWEJHQnBNRlpF?=
 =?utf-8?B?UjVLaFJkS1JCYUZkaTFOdk1RSG5acHBHaFBlT05IL2QxSzJFckdnbDhaVU9X?=
 =?utf-8?B?VWJVcDZzM2swY0xMajRTNGJ0ditPT1lYVzZ4OS9FM3k1cWRic2MwcktFbVFF?=
 =?utf-8?B?S1N3ZWpBWklKZkVqN2xMWWM4cG1xa2xXaytKMHlrN0w0MHhjdjdweDcxUC9s?=
 =?utf-8?B?WTBTQitWM0ovS3JQYUtwVmZSWkI2bXhzZlV3QWcrL2xQT2lJN1JMOEtMRHdh?=
 =?utf-8?B?UFQ3THh6MVYvYjNBQTVPcnFHa2o4c0ZtdDVhR0c5cFg4K0JaeHQ2U3R6WWNH?=
 =?utf-8?B?V0pjem4vQlJrbTZHYjBXWGZmTnE5Vmg5K0NuSU9tRTRCKzJvN01EbEVpK2Fz?=
 =?utf-8?B?NWJEdWFxalhHSkIxWEFKVXBuN0N3V0h1UFovVHZYVTd2dkEyQU1Bdm43Y2hJ?=
 =?utf-8?B?NUNZZVZncDEvTmc3R09iSmtWbmlDaG1yWGdyYWxHV0VrWFlDS1pJYi9DR2hW?=
 =?utf-8?B?c1ZvUitVVE9UT0lXYi9ONERFTFkrVW9jbGw2TG5kZTAxYUNxeFUzdUxFbGJO?=
 =?utf-8?B?K1gxL3BCWFlwWWNMT2hJQU9Xd1h6VTdmRjRmajB2L1Vac2F4N05wSTFqOGUx?=
 =?utf-8?B?b3ZDeWRzMm9Sb2RBcklDekVCRDZpRFZ0VHBpNDFlRjYwSGVLVGV0VXRoc0Jz?=
 =?utf-8?B?NmtXZkdqSytxNXV4Z3VhOHJUamZhWmFBVG5jOEI5RWpPR1hPQXdRQVN3QlNj?=
 =?utf-8?B?K1NQcUlyMWJuT1JJMy8rSUp3T3FiL1VUNzAvVExoWmJFcDVuQ2crQzMyS3VP?=
 =?utf-8?B?cTRrUjNGbkdTNmNjak8rRVZsZFRaNUNpaXNPL2JwN3F1bHN6RlJVNURUeG01?=
 =?utf-8?B?MnpIUDJoZDhYOTkyZGQyWkttOHJKUDhIbkJSVTVsMUs3S0FmOHpQOW45YUts?=
 =?utf-8?B?bUF5QmoxWERxN0VDdHBtKzV5VVI2ZEdkditnQ3BqMlVzMkFabVhiQ21MVjBa?=
 =?utf-8?B?Uk05SVBpN2w5K3V0UkU2NFVSV3hzR3Y3a25DaDZJc2w1clJtTXZKZXRqSTlH?=
 =?utf-8?B?MjhZUnZhOXhRaExkT0hoRHlPYnA3a2gvY1ZDdkxBRWFUc0JnTGRGS29tMmNj?=
 =?utf-8?B?aWJzSFJQLzdFZGM4ZjJPdVA3UDhVVmZrWDdybzNwdlgrcU1adzl1SXpIdHpy?=
 =?utf-8?B?TWNGZCtlekQ2WjE2OUs1c3k1VVhtZXo1SVduWWRUSjJxeFM0cmxWakt5WnJY?=
 =?utf-8?B?bGFGMFpMWEU1dklnZ0w2aUVKcitTZ1UvbkZSdkhtLzN6bDYrbGZQYUw2RmVX?=
 =?utf-8?B?OGtJcDJvTGdvNmd4SE8wV0w4NXpxZXc2ZzVCOHo5dDJPdXA4cTZqOTh5RHIv?=
 =?utf-8?B?YVB2WmlYVFoxL0Y0UFVPOXRFK2FpMnFaalIrUkk0djVLaG5EZmQwOEVjR0w0?=
 =?utf-8?B?VkRmZWNHQ1orSDdZbFQ5RERIVjZYMnJ5Q3lmbERjcHIyZ2tvbjkzVEdWenZm?=
 =?utf-8?B?MFhqRkZraURlTVhPeEJOYU91WVpFS3BtLzVNeVh6bG0zbkV3NDNaVm9PN0cy?=
 =?utf-8?B?RGg5MkZ0VjVpOE9VZjNGVDlyeUFSSjRCZ3ppMmZMVG9GWnBCTCtjZ3hJNnU0?=
 =?utf-8?B?dUhPcXVKajZkNnA4d1FBQytSYTFNM2I1aDVaa2F6ZHJFNkZLZWM0K3VCSzZ2?=
 =?utf-8?B?V0UwS3BrS1lnNGJSMDRHWXJubEk4eENVNXFOMnJyZXlxUW1TVWRWWk9MM3Yr?=
 =?utf-8?B?ZXV6K2ZTcWJCR0ZyWHFmMkdlSEp5bERwWUozQlAzeDFmSnRUaG9iL2xwNEsr?=
 =?utf-8?B?eVgxYkZEYjZSSjJsSlJLQ0JkOU1rQ25HWVFGaVliL1pEUGhNMjQvcXVuL29h?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <469A036CDE768348AFF0C264CB9F3B95@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6af8ce7b-a257-43c6-0e98-08db67422916
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 10:30:05.7368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 dTE122qv5HdIx4d1G9N4eFO+2uNM+gzqegYvxRQWX6SXY0Tz34Fs9h4tH4pz/x1f6BcJFy8vI4C4UZ/sIcavJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7545
X-MTK: N
Message-ID-Hash: 6U6YMCL4SUF73VDJL43S4UOOWLVULVCM
X-Message-ID-Hash: 6U6YMCL4SUF73VDJL43S4UOOWLVULVCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6U6YMCL4SUF73VDJL43S4UOOWLVULVCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDEyOjQxICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiAgUmV0dXJuIC1FSU5WQUwgb24gdGhpcyBlcnJvciBwYXRoIGluc3RlYWQgb2YgcmV0dXJuaW5n
IHN1Y2Nlc3MuDQoNCkhpIERhbiwNCg0KSSBpbnRlbmRlZCBmb3IgdGhlIGZ1bmN0aW9uIHRvIGJl
IHJldXNhYmxlIGJ5IGJvdGggMiBhbmQgNCBhbXBzLCB3aGljaA0KaXMgd2h5IEkgYWRkZWQgYSBj
b25kaXRpb24gaW4gdGhlIG1pZGRsZS4NClRoaXMgc2hvdWxkbid0IGJlIGNvbnNpZGVyZWQgYW4g
ZXJyb3IgY2FzZSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0bw0KcmV0dXJuIC1FSU5WQUwgaGVyZS4N
ClBsZWFzZSBraW5kbHkgaW5mb3JtIG1lIGlmIHRoZXJlIGFyZSBhbnkgZXJyb3JzIGluIG15IHVu
ZGVyc3RhbmRpbmcuDQoNClRoYW5rcywNClRyZXZvcg0KDQo+IA0KPiBGaXhlczogOWYwOGRjYmRk
ZWIzICgiQVNvQzogbWVkaWF0ZWs6IG10ODE4OC1tdDYzNTk6IHN1cHBvcnQgbmV3DQo+IGJvYXJk
IHdpdGggbmF1ODgyNTUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiBUaGlzIGlzIGJhc2VkIG9uIHN0YXRpYyBhbmFs
eXNpcyBhbmQgbm90IHRlc3RlZC4NCj4gDQo+ICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg4L210
ODE4OC1tdDYzNTkuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgx
ODgvbXQ4MTg4LW10NjM1OS5jDQo+IGIvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgt
bXQ2MzU5LmMNCj4gaW5kZXggYmM0Yjc0OTcwYTQ2Li5hZTAyYmJjZDVkNGUgMTAwNjQ0DQo+IC0t
LSBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jDQo+ICsrKyBiL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jDQo+IEBAIC01OTQsNyArNTk0
LDcgQEAgc3RhdGljIGludCBtdDgxODhfbWF4OTgzOTBfY29kZWNfaW5pdChzdHJ1Y3QNCj4gc25k
X3NvY19wY21fcnVudGltZSAqcnRkKQ0KPiAgfQ0KPiAgDQo+ICBpZiAocnRkLT5kYWlfbGluay0+
bnVtX2NvZGVjcyA8PSAyKQ0KPiAtcmV0dXJuIHJldDsNCj4gK3JldHVybiAtRUlOVkFMOw0KPiAg
DQo+ICAvKiBhZGQgd2lkZ2V0cy9jb250cm9scy9kYXBtIGZvciByZWFyIHNwZWFrZXJzICovDQo+
ICByZXQgPSBzbmRfc29jX2RhcG1fbmV3X2NvbnRyb2xzKCZjYXJkLT5kYXBtLA0KPiBtdDgxODhf
cmVhcl9zcGtfd2lkZ2V0cywNCj4gLS0gDQo+IDIuMzkuMg0KPiANCg==
