Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E163F353
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 16:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9680171C;
	Thu,  1 Dec 2022 16:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9680171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669907255;
	bh=cdcN1YJAByGiLnDjtlRuKlDWgISGqZzgFs6Uv9j0rFo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcDkwoGVLrbCiXvwdc5ioNZ7NbxqB1X/YZMv66zsWCn9qQliCS7qQ0XKXDxiPS1d9
	 RHLF6augRC1wwXpXbRPTaTOA8ZtA0hpCoeD18wwhmv/pEybTNNlgC+Yu848wP5U0hY
	 wJ9UVZeGVl7UVlzzSL3gVe09viTDuhKFXKsWB+sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE43F804B1;
	Thu,  1 Dec 2022 16:06:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E073F8028D; Thu,  1 Dec 2022 16:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF0BEF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 16:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF0BEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="UgipTsF9"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.b="Xrs3dED5"
X-UUID: 8c71f7104b174439b7ecb799bc77122c-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=H1zw+pNWsbufok/tiADq3S/tQw9nopftRRAnQ3SSGIc=; 
 b=UgipTsF9/nxJzCRUALYkILmNTSGbUbJFED/ibznP2ZDQn+dorD/Py0cIn4uPVbVPRP/E3CZdSZfzQvCyGWF8rqQYoQLjqzd+GyV9kegF4zG0MSIGhnJ0zybBqU0YrsOqBKZQTn6aBLKvLr3juvtfCF3PxcLi6tEWEDo6goKtmXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:0905283a-c126-47d0-ab85-721f9e28eb6c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.14, REQID:0905283a-c126-47d0-ab85-721f9e28eb6c, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:dcaaed0, CLOUDID:9839496c-41fe-47b6-8eb4-ec192dedaf7d,
 B
 ulkID:2212012306081BH7HKS4,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8c71f7104b174439b7ecb799bc77122c-20221201
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300069479; Thu, 01 Dec 2022 23:06:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 23:06:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 23:06:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbAue+Wyv56gau8wtLapUZ2pRN7k4qNwJqe60OhFmU+TzZ0ZemlAahWL7tWbuDZesk9pga/W6rzhLe4KVb/6PfjWSlZMuCcysWq2v7Y3gbKFBxjFLE3dAy69TKWkxqsq4Ey/6Lg4fAzFUJuMniVPbKHpb7+Ng26Qr7Kh4VsLKLHuQ/XRDTpY9XQ6xpbLdsVkOhq61/oO9fuXFBd0QVEIkmHW/N93dWTyxdniIDY5sI98WbGRvAqE4hm+FDV9kUIfsVB8JRMc12I4nvEeaoUQbvNswzj6jGoEPA09LYf87bDmLMrXadV1jZ8bODMh372SSlJmCCWSS0gTDO7WJxiL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSr8vUQt9odo2676/SKdw2IGKJMww5VWWIit8HjUads=;
 b=kd1UgrwKOYR5OMHXJG3VHeFgnjryQUwOfSMxHMjA10tdpMgX2LRgWTVR+IZK6afzkFhX8JHp6hQxGNhiTz4tyVH095/QiNhjF0zGkAkf54+5gj4JDbCY+ndUZ6lQQZj+lWKzDyICajGrU/6KCHKlrnBb1EAd6Wpc5qW3qTBIrvHwJ7KfiOz3R4QMaVQDtv4pvojZy4Im1JZfawVjDtqrQXbm/O1iFGfvNnI34y/GUd9giodxFcTURCRhtniJAyE01Z8MFwooZRGRXJyeWU43kIVKesHaOJzSBdAXtkbdD+lCo4LEa/0dXhbtPwfyT/NVqHloNjdsqDSfMnZAJWlabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSr8vUQt9odo2676/SKdw2IGKJMww5VWWIit8HjUads=;
 b=Xrs3dED5h3HxoCfY4OpnZTjQTzU5ouM6Wwui1/JLLGAXbIXRSh9ywPurlSqwjREjXRF1JmLvu5J/rfRcXOw4KDd/lKaRt1OzWGHb12haBte5Vw/gbW87eFktcuzFzu2YxpfhVMLoUJfUTmBMBOX/dwmlyXM/oWV23Ey/sDslPIA=
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com (2603:1096:803:49::13)
 by TY0PR03MB6473.apcprd03.prod.outlook.com (2603:1096:400:1bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 15:06:04 +0000
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f]) by PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f%7]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:06:04 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQCAAbf+AIAC/qmA
Date: Thu, 1 Dec 2022 15:06:04 +0000
Message-ID: <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
In-Reply-To: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB3384:EE_|TY0PR03MB6473:EE_
x-ms-office365-filtering-correlation-id: f5859384-579a-4eac-045b-08dad3ad9119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gxoGTxIKhJuSTkEUuBXlG6CFuj3s/Rsed5dI2m/RIBlmq+7COVBPJtJ8zlFVU2aVBFa0zfQqtP9xXIspPl4U2EWOVey2nOHroq1fr3XI5ZNESv6Bqsz7SjdbIzA1obRe11B0hciDWAW9aSrJBQkHQf68lHBJbT8wPvORr2iW3+6X/BSbThjjrJOj7nLFF6Zxw7g86C0cpQf9QBHrYcrxsH/F08fsnr7vwqvGPtmyAHM81MZwuk8vsjvPKqFNGpm0CvZwKdCGcykoLr8YM0jG9eAyO2nEbBzS7/mpsRkj0VgvQEawwfx4Hyu5dFjkbVC3LuJ8vehlVskzmX0Ycp4E5KMSFHIPZFZYeatkoUDUQkcKpY55mCacTL9cRzqqnq+wLVaVtC0scD9GvoqpxmLi40vonkyre0WOT/pJroD27y9D7/pz2esGQyr42Rl4Qt/1XNgEXor1i5E5oL6RiE9mCoxxVOg+fVCnTb6qml0pr5376A4a3wAQIylahEPTEZrvAngKCRRb/LLKxaUWEyd3JmaW5sY5c1uBL1Sk+HRR/UcYXIfhf+D2v4M1Ih5BWCnxJotAQffvoFRbtGYgB/yjwtEm8QlMz2GwzTnR9PqOaUlDTYI72lpzazVZXZ5XXKQc+uwRd67mu/mTNeMAyQlMAG1orCm+AVO1Yj1W0lzWA1sWl6a/om4yS6sYtQqzdvUIvvNqV1nRT3jN6fIhzuLaykPOwphaQEF6e9odtsNOihUhaCXrzupwSQtWcP/s+nFp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR03MB3384.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(316002)(66946007)(64756008)(36756003)(85182001)(186003)(6486002)(6916009)(4326008)(2616005)(66556008)(2906002)(122000001)(66446008)(8936002)(4001150100001)(86362001)(91956017)(38100700002)(41300700001)(66476007)(8676002)(54906003)(7416002)(5660300002)(6506007)(6512007)(71200400001)(76116006)(38070700005)(26005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTg2bTBxNGc1OENTN25sVkdXZEVXUFBnR3U5M0l2RktjWWhGMjl5RGlGUWRI?=
 =?utf-8?B?bWJLQWxVWkNkeUhsa0pXWVNOM1ZYUXUxNElRdjF5VFpQb2k0OWo4Y3dDRnpx?=
 =?utf-8?B?QzlPOWVYeFVhcWp6RXdWcklSbnI5TzZtZXhZVmNSWmtqeEVMd1FEeHhNamVW?=
 =?utf-8?B?WmlsWmNtTHVycjViZ2gwTThTK0F4UExsSTBIbXU0VmdIU1FFNEx2S2hSeHFQ?=
 =?utf-8?B?QXBOaS95RzVVaS9uTm55Qi9hM21pK2RpNVlRSWtheG01cFE5NHMzS0ZFNU55?=
 =?utf-8?B?clM0Y3R4THp6UlJJZnBqa0owcWt1cUUwR1RqUXkva29LbHRYcUdpbkhpSWM3?=
 =?utf-8?B?Z1pTdUdvOW9pVEhRbm5VZzFublJSc0ZuMHZEblBpL0x3MXdIQVRhT2s0RE14?=
 =?utf-8?B?Z1ZJa3F4dnZpL3piQ29OSlVsQk1pL00wMkJ5bjRDK2I3MlRFOVVHY3Rlamtm?=
 =?utf-8?B?TFRPdXBUaTBCQ2lCN2tRdWw0a2c3QkNUeTluL3RUenRxRVVSZGxDSnlIcS8v?=
 =?utf-8?B?KzdmN1FobXBoM1l4c0QrRmk4Y1J0MEVVeEhMMHpyYTdnaWVpQmlMTWRVb2Nj?=
 =?utf-8?B?ak1Walk1dzFKSThteXZOaWxJd2pScHhqQWlhREJ0NUdPL3F4Y0g2eDY4MFhn?=
 =?utf-8?B?WE82c0wwQURYelNtK2gxeW15cGR3L1N1ejlTd1pBRFUxM1lUNE1CNHFvK1Rq?=
 =?utf-8?B?ZHExQ0tTODR6TEpFWE80VUs5WVZjV0w0dUt1cmp2MDVuQmJPMVJuVDcxOWQy?=
 =?utf-8?B?RWxFZm1VRmlRY1hWYzVraWhJb2t3enlHeUx6ckxaemZpSjlxWXRFd3V4bjFO?=
 =?utf-8?B?a3BoQ1JPZG5IdXpYVithN1FTMUVnZXpocHFmcm9NZ01KSExaTzhWbURwcFg2?=
 =?utf-8?B?WmlYZUhxWllTVXZNRDZaTk4wek5TYlh3MWprSDRMZ1Vnb2VRTUNzblljK2F3?=
 =?utf-8?B?RnA5TjVTOHkvR2s4dkhPMjNyeEk2RURFcEZkdzV5RkgrKzZvVFdCWWRURnR5?=
 =?utf-8?B?YzdoRGlGR2h2ZlQ0cWFWM2dzRENVRHhtditUM0paVjNVMDhoempjdE5GaHdU?=
 =?utf-8?B?eVJOWExSSlNpb3ZSOUNEZU4yOTlxQThRR3IxeTJnS2hXNWhyd216cFFZRG94?=
 =?utf-8?B?Ui9ibW55TkFlSDhIb1hBcXFhQUlHNk5pVXhML2VHRlFJL2VkczdaSjZ3VDIr?=
 =?utf-8?B?Nk42L1pyWmdMSVJHb01QZkpVaHlxK0VhMm1DbUltRllXVWJjRWhlQ2FXNzhB?=
 =?utf-8?B?N28xL0lOaHZONCs5ci8yY1ZVdDg0RC9VWUQ3WlNJTkpwNXdZNnNWdi9kY0h4?=
 =?utf-8?B?RzNZMFdEMlFBMG1sOGxPL0U3a29wZjRkdG5UQWJ2di9tWWwxT3ltL2pLcXV0?=
 =?utf-8?B?Q0MzanJzdlpWNFlDc3NVVjZFR2UySVduTnVlVWJsRGt5OFVwSVViWWhwOWND?=
 =?utf-8?B?UGZpS1ZTZkpBRlZSZjhpTUM2WUJkV3ZPQzlDYlNQUUk3SUFNL1krR2M5aWI4?=
 =?utf-8?B?L3RSUXgwUytSZGFRazVWeS9FN0VXRE5TK2dVK3V1M3VDUThMdEk2U054WjAw?=
 =?utf-8?B?M2w1dXdwNDVWanN1UG55L2dVTDR6Kys1UElJTW1LRDMvSFhpWXQ0SUt2ZjBU?=
 =?utf-8?B?RUJXc2g1ZTZqWHlHbVh0UmpSNDlmNVdTSzZhZ0ZPS3psbXlRdFNrTDk3V2lp?=
 =?utf-8?B?S1NPU1RXL08zdm10YWdQK3FZR3ZMQUpWaWNiMGxTYytlTERRSHRlRlVrbWV2?=
 =?utf-8?B?Nnc2elF3UlV0cnVLa2xiMzhCeWVXVnZmVTBCMHdmcDlzcW9NcU14R0RKSGlX?=
 =?utf-8?B?ZTA3ZjJpRUlFU01lYys2Z09pNXMwSE9reDFSRUwwZkxYQTlZYjg1TGJiQ3Jx?=
 =?utf-8?B?WS93TmtSay9kSFgybjF5SkdxdERnOE05MzRYd3Jwb1Ixd09vaWJSUjJnWDJj?=
 =?utf-8?B?MnVoWUZma1RHdE1JSFlnbzRvR29qK2FGN2ZwUkpyMzFFUCtKTE1GN1Q1YjE0?=
 =?utf-8?B?OG1jeE81QmQ5MEFJWkVZWktIR21JU2hMMVc1ZUFLSHNhR2FNY243OTJ1MWd1?=
 =?utf-8?B?K2JxMVFGTFhYZ2laTndvbloxUXJpODAyUk9PalRyTm02MkJOeFNJVExJWUFR?=
 =?utf-8?B?dkpCbXY0MjhxS211OGRhN2RhT29xU1JRYVRUQ1JxTUQ1UFVTVVNyS2JZTVUw?=
 =?utf-8?B?cGc9PQ==?=
Content-ID: <23CBC476A39C8F4EB180859135AA44EC@apcprd03.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB3384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5859384-579a-4eac-045b-08dad3ad9119
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:06:04.3016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYv382bDx72uuFwmLTuECKB34wuqjrRjoLRhwDhDUsw1dUmRcPg7th1cFl4DBRrF7ZD4JE96StD7E3aIoQicMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6473
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
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

On Tue, 2022-11-29 at 17:22 +0000, Mark Brown wrote:
> On Mon, Nov 28, 2022 at 03:07:22PM +0000, Jiaxin Yu (俞家鑫) wrote:
> > On Fri, 2022-11-25 at 12:18 +0000, Mark Brown wrote:
> > > On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:
> > > I'm a little unclear why this is being implemented as a DAPM
> > > operation
> > > rather than having the driver forward the PCM trigger op if it's
> > > needed?
> > > Or alternatively if a DAPM callback is needed why not provide one
> > > directly rather than hooking into the trigger function - that's
> > > going
> > > to
> > > be called out of sequence with the rest of DAPM and be
> > > potentially
> > > confusing given the very different environments that trigger and
> > > DAPM
> > > operations run in.  A quick glance at the it6505 driver suggests
> > > it'd
> > > be
> > > happier with a DAPM callback.
> > Let me describe the hardware connection about mt8186 with
> > it6505(hdmi)
> > and rt1015p(speakers).
> >                        ==>it6505
> >                      =
> > DL1(FE) ==>I2S3(BE) =
> >                      =
> >                        ==>rt1015p
> > They shared the same one i2s port, but we'd like to control them
> > separately. So if hdmi-codec use the PCM trigger op, whne we turn
> > on
> > the speaker, hdmi-codec's PCM trigger op is also executed,
> > resulting in
> > sound on both devices.
> > Is there another way to control them separately? Thank you.
>
> If you just need power control for one or both devices then the
> machine
> driver can add a _PIN_SWITCH() on the output of the device, that'll
> cause DAPM to keep the device powered down when not in use.  That
> should
> work well with the suggestion to provide a DAPM callback instead of a
> a
> trigger operation.

Yes, we do use a _PIN_SWITCH() on the outout of the device:

>  static const struct snd_kcontrol_new
>  mt8186_mt6366_rt1019_rt5682s_controls[] = {
>          SOC_DAPM_PIN_SWITCH("Speakers"),
>          SOC_DAPM_PIN_SWITCH("Headphone"),
>          SOC_DAPM_PIN_SWITCH("Headset Mic"),
>          SOC_DAPM_PIN_SWITCH("HDMI1"),
>  };

Which operation should I use to inform bridge driver to control audio
on or off? I'm curious why I don't see .trigger in the structure
hdmi_codec_ops compared to the structure snd_soc_dai_ops?







************* MEDIATEK Confidentiality Notice
 ********************
The information contained in this e-mail message (including any
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be
conveyed only to the designated recipient(s). Any use, dissemination,
distribution, printing, retaining or copying of this e-mail (including its
attachments) by unintended recipient(s) is strictly prohibited and may
be unlawful. If you are not an intended recipient of this e-mail, or believe

that you have received this e-mail in error, please notify the sender
immediately (by replying to this e-mail), delete any and all copies of
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
