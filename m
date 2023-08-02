Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AFB76CC9E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 763C33E7;
	Wed,  2 Aug 2023 14:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 763C33E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690979213;
	bh=A2O1AP7MLvSAKFmkXGdQXK4YfSiTIlyjXn5zFpvwOQM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lxFvRpdpRwpsiasZ8XeH18MDZFf9uYyhVAtGPtkYlf0Y5IW+tVtGWkfFSDllKLEvQ
	 6bKQS1fzQfn3ZSu8nObePJp79Hyl4t73lBkIHYSqyVOHKIZcFrEAdKsmyXrOhFeVFA
	 FpDRZIAcJ4dOPCYiunUdVHs/Mlwx5TuQ4b/pqL04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C2B3F80425; Wed,  2 Aug 2023 14:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3721F8025A;
	Wed,  2 Aug 2023 14:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC5AF8025A; Wed,  2 Aug 2023 14:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2452BF80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2452BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Okn0catb;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=scrbGEkQ
X-UUID: b191ced4312f11eeb20a276fd37b9834-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=A2O1AP7MLvSAKFmkXGdQXK4YfSiTIlyjXn5zFpvwOQM=;
	b=Okn0catbhf8wVjaMvtbVN/3xsVAyN9ENKGVtQpidyhttr58hwyCSO+vCPA79muNOEHzifQ3CL0HJcdhdkAVLSHZH/Alq1PvZY6Qzf9apBdypTPBwnPJpyiW0+y/e0TwFqEGwmpZRmSTFvhTves90DHDyYKzKPC5SvQgLbft3db0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:39eaeb2b-d701-489b-a390-4e7b8514ec95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.30,REQID:39eaeb2b-d701-489b-a390-4e7b8514ec95,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:1fcc6f8,CLOUDID:9ed112b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:2308022025435PDTVEJ6,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: b191ced4312f11eeb20a276fd37b9834-20230802
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1144360010; Wed, 02 Aug 2023 20:25:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 20:25:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 20:25:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ/z+NOIIQwGMmSWZInCPGbjMfBfBIch/xsPvqiAbXhYZAetFMFWNiyAYDC0nSYT7F46XL0fi9Tei16sbftIFSyZhsyWznJYjx0xZ/YsLmVWrFwPVN/Zp2o9fLG6XyY3JCLVQA7OtyiJCfMI8Xxqygomny35veyqityJ9+qGqHDj6HOYvQUknwsXNVdYCyAN4itgYhF2HHwzW9V2oksiEhjrym6v3WkbrUt9g0LvlOUESU/vK8AY4oED092Y0EbjChvwDbpk9cVC+ywwhZZC5x4yGe19OpeH9Neb5X/epIZhr2ZcC7Wc3Bga1xsb2sNE+6YXYuZ8mIOh9ikpkeyymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2O1AP7MLvSAKFmkXGdQXK4YfSiTIlyjXn5zFpvwOQM=;
 b=NG6HwIVmOCwRNH3Zy7JL46NnoofTxyqzp0AVqnkLm6c48lD+JSSekscEO4563bvlzOWJ7RMcB+u7kwg57XzEI0H+sgnFXxzhVUo86aLaN8EQUIDpjhbh4LNqQOhQkHMSRWwV+S0L6fotSe1K6/QdtFxfmaKltaWTog4KHbPSSnVxNoOvFHSk01jCVKElWL9QLndl9UuwdsOHP4holQPYO4u/WUqetYTht7sJktkQeLm0bXqq/PTBv41OXHIoDMuf/ZMq9rrp9M0h9EyK3964FXWBznmZCEUQKuWgg0oqcxNpwiBXI5dODg+hjUW7rJTCzo0TjxBPR7DzyGWKXsYb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2O1AP7MLvSAKFmkXGdQXK4YfSiTIlyjXn5zFpvwOQM=;
 b=scrbGEkQDHVbX8wDY5qQaqsHS7EPFfxGa8YkN6xoaLJzXJ3LPtconwJyr1twTlIMEzEYlIFNV8Fru1iduptNcf6odD2wIWne6RC59hw++yUy4kK0DlbIPWnkyGcsgsIqfpDcn9euogTe70sEkWyf0FZxNyvQ+Qclka9ZoS4d908=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYSPR03MB7763.apcprd03.prod.outlook.com (2603:1096:400:410::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 12:25:36 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a%2]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 12:25:35 +0000
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
Thread-Index: AQHZxNxSjHybZFgXSEy/YsDUrkadBq/W7yUA
Date: Wed, 2 Aug 2023 12:25:35 +0000
Message-ID: <5e141dfaba1bf70c51e9d49dd5e40f7d4a1ac9eb.camel@mediatek.com>
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
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYSPR03MB7763:EE_
x-ms-office365-filtering-correlation-id: 50f24707-c686-4b7e-e359-08db935392cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LSfjnYXW7DCx37Kw/Tw3UpQTLj/SWope78FLYUtYMX/q7+AvXVPr//6/qKuaXTj2qbFmTzpxSVsG4bJlElvqred5siUWD9KO+WwlkODoHA9/paQwJij+qBF3B1QnvH6dCHH6znmqxjpIbPsF9+lVJ24lH/JlSo4hcl7XKmRc92+nS/B50TnZs8R0uoa2yJ5zkIdncLLBuZ2qy/Lsn48PW6iMXGYT3vSCX+hhVLbBAZGwnn0rbsLgAcqQQ7T70fXLoeCJRi2ty/x5ljhad/LcNjhfV2Vzdm03Vs/1niP2iIL4Q4HN2SD3qTD3aij+ujy0Zoa30/dux2mp9ZQGuESKiYcASaJAV8M+HWb1ggwo9FohHDX0XX6k82PcO6VxadTyD/0ajsAtjKhicS4AR9NajVZ1ZtnCK/VlBD5UZUURP+DCVY+P/WqK4JO+QlSZGRLzXOPRm6AUDDEJ+dGKqmtHPGBKA1J6aKz33khekIvgsYBxO5jyxzJW0povcYYUV5BviqfdLSNwVfjxkhCPnws/rTZBuFuBWonsUsu1k4AAValTpKw3TkI3VQV+U+6kabRc3OqSh/3rxl3Ut67sR40sCC6XMk7m3UWUUxCOOysFhNZEI7bceIagrK/1ovBTori5k/7hzn2J2XVo9dn0/o4/+gaFB3aE0wqzcNFW/xkHZ69whkkK7rmxYXpPlYZcH+hh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(83380400001)(86362001)(85182001)(2906002)(36756003)(186003)(2616005)(26005)(6506007)(64756008)(8676002)(8936002)(6512007)(38070700005)(6486002)(5660300002)(71200400001)(122000001)(478600001)(41300700001)(110136005)(316002)(54906003)(4326008)(91956017)(38100700002)(66946007)(66476007)(66446008)(66556008)(76116006)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dlQvd3N2THVEaHlKcEdoVzkyd1BvTlpBL3lUMlpITEUyNXovZ3FkaU43YmZR?=
 =?utf-8?B?em9rbjZKY1ZYUHJ5djBkbGZtVlp4Nk84SC9PbmlZS1lJOEVrT1hMa0lzbm5h?=
 =?utf-8?B?SjJWbHpuT2s2aURqRDFTTEE1VlBLbFEwOEdkOWpYZXh3bVNhSER6NmlhQWE3?=
 =?utf-8?B?UUJ1WmR6aEtWeXA3MzRpUkRYaW5YTTEvZUc3bWdqZGhXaUdrZlY2RE04N2Fw?=
 =?utf-8?B?c3AxRW1ZbDlWNThQaG5VNFZyY3phMVZoSkZRYitjeDFSRzh6UHA1amdXYjFW?=
 =?utf-8?B?Qk1xTWN6SmZ1K1NTSFJGUU5VZmtaTXpCNzQxbmgzV1hyWXQ4Ym5tcm1BdmRR?=
 =?utf-8?B?ZHFwdWVGVzg4QjhLS05sQUJYdHlSM3V3cklkQmhLNW94OTF6YklXY0phZE1n?=
 =?utf-8?B?YjVBWUdpSTNXUklyNjJtMjM3SXRaZWRvdzA4V0Q1bG1pWGQ5c1YralVWTnJ0?=
 =?utf-8?B?cDhDYXhMdHBUeFJieC9xL0JsM0lIZzhRTGo5U0ppRzNYUjZjRU9POGlPaTlT?=
 =?utf-8?B?SmlvdTdRZ0dUaFQ5Mm5zcWRqR004NWZMNXZXa1Uyc1hlMzM3bStEZk9DUUVy?=
 =?utf-8?B?aFJtM3V6RU5kSWhKTmdnb1ZDcDlGcC91RFYxendESnFCSWtGWjFPcU1yR1Fv?=
 =?utf-8?B?SWllQ01sWkJyQlo3cGV2QU03ckNFVEtHajRXQW5uQ01uM3V1cFBNbWVKcHlI?=
 =?utf-8?B?cU5LQytuWHdsVUx0eHZjWkMvVm1LaEt5L2lybGZWSVhVWkU0cmFKZXhuaG04?=
 =?utf-8?B?OVIyTXhmTkVlcTg3YTRxNVR6eVpsYXoxYzJuQVpvYVVwMDRiWmpKQnQ0L3A2?=
 =?utf-8?B?UGFvZENOMDh3TmsvYnh3d3NGOG1MNnhYS3NUV0JIMXlYbGNVMTVYeFZ5cjNG?=
 =?utf-8?B?UmlxS0JUTE9oaVAxd0Z1clhkMk1QSFhBK1BaVXZCZ2JVdkhYWnMwT1IrQkZ0?=
 =?utf-8?B?OVdCSDQ0NDN2SG5qbkVweTAxd1JERThrczRQN1hhdmlPZ095SVM2dmZJeFpN?=
 =?utf-8?B?YUpYMm9ndDlqcGM1THpXZm9jUTBUMSs1blZoWXVka0oycWZ0eFk3cVZBRSta?=
 =?utf-8?B?N29YMWxSalVjZnlWS1hJZGNNZWRUUStIK3lkd25PaHNoY1pQaTBGVFRjbUFO?=
 =?utf-8?B?N2ZDVSsvM3FTTUQvZmQvbTg5M2kzWFc0Slp1SVBZQ3ZLa0EwcnRpN1NLLzY4?=
 =?utf-8?B?M0U1UXNqMy95WEFLQnFSb3Uvcjgrd2ZSUDQvSnBxL0JEdGRIMEcxYkN2MHEz?=
 =?utf-8?B?N0dINUlKVjBJODA5VzFzK2xTZm5COFRqL2ZNNXdsRDlSUE9KRjdFWXkxbUR4?=
 =?utf-8?B?V2plNWZtNXBLRFhpRjBMd3NlckdFUnlIVkZDZy9uUllsbEVMRC9Va05xVlgx?=
 =?utf-8?B?VXlTMkR6bHllbEc4UlU5Vnk0R0h4ZEJUL1Q3blg3ZmdUVnJlWVNnMW9yUER3?=
 =?utf-8?B?NklLSXZDRTExVzh2dlVBczJzdzVERVFKcFFKMEZtZUx0RU16RTdwQWI5YzFk?=
 =?utf-8?B?NFViZkFEVVFIYmtRazdXQXFNWHZTeE84MmcwdUxHWEFlSE9OODNsNDR3U1dt?=
 =?utf-8?B?bDlCS1pPR3A2VGFBTG9NZVNPMkNybzFmc0ZHaFhYdjlqd1lKWlQwVnFKdERr?=
 =?utf-8?B?L0lBVS9JRFdQS3JwczNYVlpzT201bkZoZi9YdFpQaDF5NmRxd2ZORXNNcUZh?=
 =?utf-8?B?dWtqdHFnaDV4cHdoM3MyY1JrZzNHNTVHTGFWRHNORmZaN2lHU2c4aHZUSFl3?=
 =?utf-8?B?a0hhSnYxMThqL3VVcFpKQ21zUWpzemExRHR2dm9PaEdodDFOd2dmSEZESVJy?=
 =?utf-8?B?N1BMQzROSXhDM21TNlF1NlEyUHo1ZTlSbGY0MXJEcVVDM2ZkMVJzK0pPSjZq?=
 =?utf-8?B?cEVqUkpleThBR0lPSFlkL1FvWDdEV3lIamtmL0tZOWVLL1ZDMzBROFV0c3pS?=
 =?utf-8?B?TWM2S1Fna2xtQTNrbzk1cFR4VDhqN0hYcnFoVkVuUHIydWpNN1JsZ0RtRms0?=
 =?utf-8?B?YTNpc2hhb1YwR1JrZ3BwSkNya0toa3luVDljMEprcnMzSndVNEFzeVY3WGRw?=
 =?utf-8?B?cVBQMXhzL3FEcUpwK2wwMjgvWE1oMlVrR0tzNnR4S3V3elZncDBSaUs4cFNZ?=
 =?utf-8?B?aDV3WlB6YUQ5UGR0ajZzckdkVnZIMlUyVE9pZjE4SCtqbzI4a0VpaFZXUlpI?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDE0EA112E4CFA4EA9B13928C6D1B106@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50f24707-c686-4b7e-e359-08db935392cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 12:25:35.7697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 cJU9LZPK2vT21GVF9CIdk2Wo48X1qQXbu5Txghiangj2ciI2b2B02GF2YxY1KBg6JoX9bXsZG+TYJex9NmFdeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7763
X-MTK: N
Message-ID-Hash: HBCSAYO7BT323NQHFTOZBXHRLCWXBEJL
X-Message-ID-Hash: HBCSAYO7BT323NQHFTOZBXHRLCWXBEJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBCSAYO7BT323NQHFTOZBXHRLCWXBEJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDAwOjU2ICswMDAwLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+ICBBTFNBIFNvQyBtZXJnZXMgREFJIGNhbGwgYmFja3MgaW50byAu
b3BzLg0KPiBUaGlzIHBhdGNoIG1lcmdlIHRoZXNzZSBpbnRvIG9uZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNv
bT4NCj4gLS0tDQo+ICBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1kYWktZXRkbS5j
IHwgNTYgKysrKysrKysrKysrLS0tLS0tLQ0KPiAtLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWRhaS1ldGRtLmMNCj4gYi9zb3VuZC9zb2MvbWVkaWF0
ZWsvbXQ4MTk1L210ODE5NS1kYWktZXRkbS5jDQo+IGluZGV4IGVlZGI5MTY1ZjkxMS4uZmQ0Zjlm
OGYwMzJkIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1k
YWktZXRkbS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWRhaS1l
dGRtLmMNCj4gQEAgLTI0NTYsMjUgKzI0NTYsNiBAQCBzdGF0aWMgaW50DQo+IG10a19kYWlfaGRt
aXR4X2RwdHhfc2V0X3N5c2NsayhzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwNCj4gIHJldHVybiBt
dGtfZGFpX2V0ZG1fY2FsX21jbGsoYWZlLCBmcmVxLCBkYWktPmlkKTsNCj4gIH0NCj4gIA0KPiAt
c3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9vcHMgbXRrX2RhaV9ldGRtX29wcyA9IHsN
Cj4gLS5zdGFydHVwID0gbXRrX2RhaV9ldGRtX3N0YXJ0dXAsDQo+IC0uc2h1dGRvd24gPSBtdGtf
ZGFpX2V0ZG1fc2h1dGRvd24sDQo+IC0uaHdfcGFyYW1zID0gbXRrX2RhaV9ldGRtX2h3X3BhcmFt
cywNCj4gLS50cmlnZ2VyID0gbXRrX2RhaV9ldGRtX3RyaWdnZXIsDQo+IC0uc2V0X3N5c2NsayA9
IG10a19kYWlfZXRkbV9zZXRfc3lzY2xrLA0KPiAtLnNldF9mbXQgPSBtdGtfZGFpX2V0ZG1fc2V0
X2ZtdCwNCj4gLS5zZXRfdGRtX3Nsb3QgPSBtdGtfZGFpX2V0ZG1fc2V0X3RkbV9zbG90LA0KPiAt
fTsNCj4gLQ0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9vcHMgbXRrX2RhaV9o
ZG1pdHhfZHB0eF9vcHMgPSB7DQo+IC0uc3RhcnR1cD0gbXRrX2RhaV9oZG1pdHhfZHB0eF9zdGFy
dHVwLA0KPiAtLnNodXRkb3duPSBtdGtfZGFpX2hkbWl0eF9kcHR4X3NodXRkb3duLA0KPiAtLmh3
X3BhcmFtcz0gbXRrX2RhaV9oZG1pdHhfZHB0eF9od19wYXJhbXMsDQo+IC0udHJpZ2dlcj0gbXRr
X2RhaV9oZG1pdHhfZHB0eF90cmlnZ2VyLA0KPiAtLnNldF9zeXNjbGs9IG10a19kYWlfaGRtaXR4
X2RwdHhfc2V0X3N5c2NsaywNCj4gLS5zZXRfZm10PSBtdGtfZGFpX2V0ZG1fc2V0X2ZtdCwNCj4g
LX07DQo+IC0NCj4gIC8qIGRhaSBkcml2ZXIgKi8NCj4gICNkZWZpbmUgTVRLX0VURE1fUkFURVMg
KFNORFJWX1BDTV9SQVRFXzgwMDBfMzg0MDAwKQ0KPiAgDQo+IEBAIC0yNTA1LDYgKzI0ODYsMzYg
QEAgc3RhdGljIGludCBtdGtfZGFpX2V0ZG1fcHJvYmUoc3RydWN0DQo+IHNuZF9zb2NfZGFpICpk
YWkpDQo+ICByZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRf
c29jX2RhaV9vcHMgbXRrX2RhaV9oZG1pdHhfZHB0eF9vcHMgPSB7DQo+ICsuc3RhcnR1cD0gbXRr
X2RhaV9oZG1pdHhfZHB0eF9zdGFydHVwLA0KPiArLnNodXRkb3duPSBtdGtfZGFpX2hkbWl0eF9k
cHR4X3NodXRkb3duLA0KPiArLmh3X3BhcmFtcz0gbXRrX2RhaV9oZG1pdHhfZHB0eF9od19wYXJh
bXMsDQo+ICsudHJpZ2dlcj0gbXRrX2RhaV9oZG1pdHhfZHB0eF90cmlnZ2VyLA0KPiArLnNldF9z
eXNjbGs9IG10a19kYWlfaGRtaXR4X2RwdHhfc2V0X3N5c2NsaywNCj4gKy5zZXRfZm10PSBtdGtf
ZGFpX2V0ZG1fc2V0X2ZtdCwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25k
X3NvY19kYWlfb3BzIG10a19kYWlfaGRtaXR4X2RwdHhfb3BzMiA9IHsNCj4gKy5wcm9iZT0gbXRr
X2RhaV9ldGRtX3Byb2JlLA0KPiArLnN0YXJ0dXA9IG10a19kYWlfaGRtaXR4X2RwdHhfc3RhcnR1
cCwNCj4gKy5zaHV0ZG93bj0gbXRrX2RhaV9oZG1pdHhfZHB0eF9zaHV0ZG93biwNCj4gKy5od19w
YXJhbXM9IG10a19kYWlfaGRtaXR4X2RwdHhfaHdfcGFyYW1zLA0KPiArLnRyaWdnZXI9IG10a19k
YWlfaGRtaXR4X2RwdHhfdHJpZ2dlciwNCj4gKy5zZXRfc3lzY2xrPSBtdGtfZGFpX2hkbWl0eF9k
cHR4X3NldF9zeXNjbGssDQo+ICsuc2V0X2ZtdD0gbXRrX2RhaV9ldGRtX3NldF9mbXQsDQo+ICt9
Ow0KPiArDQoNCldoeSBhcmUgeW91IGluY2x1ZGluZyBtdGtfZGFpX2hkbWl0eF9kcHR4X29wczIg
YW5kIGtlZXBpbmcNCm10a19kYWlfaGRtaXR4X2RwdHhfb3BzIGV2ZW4gdGhvdWdoIHlvdSBhcmUg
bm90IHVzaW5nIGl0Pw0KDQpUaGFua3MsDQpUcmV2b3INCg0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfc29jX2RhaV9vcHMgbXRrX2RhaV9ldGRtX29wcyA9IHsNCj4gKy5wcm9iZT0gbXRrX2Rh
aV9ldGRtX3Byb2JlLA0KPiArLnN0YXJ0dXA9IG10a19kYWlfZXRkbV9zdGFydHVwLA0KPiArLnNo
dXRkb3duPSBtdGtfZGFpX2V0ZG1fc2h1dGRvd24sDQo+ICsuaHdfcGFyYW1zPSBtdGtfZGFpX2V0
ZG1faHdfcGFyYW1zLA0KPiArLnRyaWdnZXI9IG10a19kYWlfZXRkbV90cmlnZ2VyLA0KPiArLnNl
dF9zeXNjbGs9IG10a19kYWlfZXRkbV9zZXRfc3lzY2xrLA0KPiArLnNldF9mbXQ9IG10a19kYWlf
ZXRkbV9zZXRfZm10LA0KPiArLnNldF90ZG1fc2xvdD0gbXRrX2RhaV9ldGRtX3NldF90ZG1fc2xv
dCwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIG10a19k
YWlfZXRkbV9kcml2ZXJbXSA9IHsNCj4gIHsNCj4gIC5uYW1lID0gIkRQVFgiLA0KPiBAQCAtMjUy
OSw3ICsyNTQwLDYgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXINCj4gbXRrX2Rh
aV9ldGRtX2RyaXZlcltdID0gew0KPiAgLmZvcm1hdHMgPSBNVEtfRVRETV9GT1JNQVRTLA0KPiAg
fSwNCj4gIC5vcHMgPSAmbXRrX2RhaV9ldGRtX29wcywNCj4gLS5wcm9iZSA9IG10a19kYWlfZXRk
bV9wcm9iZSwNCj4gIH0sDQo+ICB7DQo+ICAubmFtZSA9ICJFVERNMl9JTiIsDQo+IEBAIC0yNTQy
LDcgKzI1NTIsNiBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcg0KPiBtdGtfZGFp
X2V0ZG1fZHJpdmVyW10gPSB7DQo+ICAuZm9ybWF0cyA9IE1US19FVERNX0ZPUk1BVFMsDQo+ICB9
LA0KPiAgLm9wcyA9ICZtdGtfZGFpX2V0ZG1fb3BzLA0KPiAtLnByb2JlID0gbXRrX2RhaV9ldGRt
X3Byb2JlLA0KPiAgfSwNCj4gIHsNCj4gIC5uYW1lID0gIkVURE0xX09VVCIsDQo+IEBAIC0yNTU1
LDcgKzI1NjQsNiBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcg0KPiBtdGtfZGFp
X2V0ZG1fZHJpdmVyW10gPSB7DQo+ICAuZm9ybWF0cyA9IE1US19FVERNX0ZPUk1BVFMsDQo+ICB9
LA0KPiAgLm9wcyA9ICZtdGtfZGFpX2V0ZG1fb3BzLA0KPiAtLnByb2JlID0gbXRrX2RhaV9ldGRt
X3Byb2JlLA0KPiAgfSwNCj4gIHsNCj4gIC5uYW1lID0gIkVURE0yX09VVCIsDQo+IEBAIC0yNTY4
LDcgKzI1NzYsNiBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcg0KPiBtdGtfZGFp
X2V0ZG1fZHJpdmVyW10gPSB7DQo+ICAuZm9ybWF0cyA9IE1US19FVERNX0ZPUk1BVFMsDQo+ICB9
LA0KPiAgLm9wcyA9ICZtdGtfZGFpX2V0ZG1fb3BzLA0KPiAtLnByb2JlID0gbXRrX2RhaV9ldGRt
X3Byb2JlLA0KPiAgfSwNCj4gIHsNCj4gIC5uYW1lID0gIkVURE0zX09VVCIsDQo+IEBAIC0yNTgw
LDggKzI1ODcsNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcg0KPiBtdGtfZGFp
X2V0ZG1fZHJpdmVyW10gPSB7DQo+ICAucmF0ZXMgPSBNVEtfRVRETV9SQVRFUywNCj4gIC5mb3Jt
YXRzID0gTVRLX0VURE1fRk9STUFUUywNCj4gIH0sDQo+IC0ub3BzID0gJm10a19kYWlfaGRtaXR4
X2RwdHhfb3BzLA0KPiAtLnByb2JlID0gbXRrX2RhaV9ldGRtX3Byb2JlLA0KPiArLm9wcyA9ICZt
dGtfZGFpX2hkbWl0eF9kcHR4X29wczIsDQo+ICB9LA0KPiAgfTsNCj4gIA0KPiAtLSANCj4gMi4y
NS4xDQo+IA0K
