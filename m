Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4463ABF3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 16:08:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 058FF16C5;
	Mon, 28 Nov 2022 16:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 058FF16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669648138;
	bh=61j6yEbLYBEtwngaiJTNMgdJkaT9yNInGyoAIf/G7p0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGIi33AnN16zf6ZAeEf1jxZtHSlsBCsXqmyT7ZDHjAQmR/LmpXQWa2ys08+i4nUgn
	 Qjx+mq2+7rhFM0SVYa+XZNHvZUjnvUpMEp6PsFuSWO1b0EhUgoEr52jz6zFoFplxqE
	 TulKcIR+nXa9lM5BtVB995iD220Y/ZDl/cMP+1HU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D44F8024C;
	Mon, 28 Nov 2022 16:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C9BF8020D; Mon, 28 Nov 2022 16:07:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4E8CF80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 16:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E8CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="doAwbtVk"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.b="gqvWsWIn"
X-UUID: 25cb56a791d94d4b88dab09c1e8b4242-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=waSgO3QlvStq2p+Qmx9meLzAUmHQRgiQrzdPLdWUuzM=; 
 b=doAwbtVkO8yWNmfMn8/FSW9QaNAa7jl+isvUyfIoOhdvfiLjn4d8tFJyxlNalY8O3npcidPBJS0Lae586h0Tv3CPL1kn9k04vfuB/NOiR5jiG9LXlB+YK8iGRB1UTWqK1z/EQrtI3CyoolMWwnvX+95AEzzxaY/TaNeNw+aRBlw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:bc2cae9f-c53f-42bf-bb88-271096aa29c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.14, REQID:bc2cae9f-c53f-42bf-bb88-271096aa29c5, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:dcaaed0, CLOUDID:7148861e-5e1d-4ab5-ab8e-3e04efc02b30,
 B
 ulkID:221128230728FKRO8C18,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 25cb56a791d94d4b88dab09c1e8b4242-20221128
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1121477426; Mon, 28 Nov 2022 23:07:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 23:07:24 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Mon, 28 Nov 2022 23:07:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QElXkx6VmMI4+D6Xq3yqeBia9dlgiNqFD9QmWBRYB+53SYM3G2JfGD3XhNLqn2GNJ5IvCl/xsFDkH/0xaC+hl/ggmyy9RTV9MtUC3Soyvli+LhEJFcs2cvEjvCuc20FdkcGXqn1qFKVZnPBCheRl4EIHkdpAvfCH1j456CXtxxV4cy3euf0EyoSTxsYmb3jsf7ACzJSc4ee5Zm0WMxbeqix489LVunVVo0WaobXMeWNiauVWmFHr5WrsMk5kUrGhckxbQPTi9Xhxro7f6G5RHUv8CXP7EyRSFA9d70OKINpsK6v+1hWdiSqqYEhOaEUAMASpYNkqHBWGFlA+Qxlstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dINE6Xhvn7YUOai/PfP5uhy0ROfVawakvh71A0GPvZI=;
 b=hDwYGtn7UG961vw6z57tfO+WPKmKc3FZ+DihtFdHZkEwjPB2VuY7RIYAOSSAfXLRNUJMQHI0MHpJdRC4iO9Ssq1695rMzLQrSToLYTT+SYuKp4zWqcWTPWhuKNKKwWmjZrCV7QrJbBN5Nwm2oIiJHo+TszfXAyc0X3dvnPeL5C7qHO/vbCKyIBwedCGidFnj8SUMlW3hh/ffCsBGWicfkBj/v1R/amgiZzTYdxLadyy3b2+13uoJX6p5NdOZviCx6u5JR62kuVYABoLANsVhWQmfGHfFRrs9XrXDl9hYJeeZecVvZ/uQAlHJYETm03oLn89BDIjZNIwKZ8i/l0X1FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dINE6Xhvn7YUOai/PfP5uhy0ROfVawakvh71A0GPvZI=;
 b=gqvWsWInvVhBkxvVSKhBntLTxcaGpSJYW3MSpeaA33BwYBWdVBubP5p8YD5y77eBacm1h7fN0nXs8AOgcDaa06u1O+Q6wvpbnhli+AnI4HlPHeUcZEbJcj40DwTIpMJ3OtG8Cy37zxAxHQJrfRmB4Ya2VUWanol+6nwfUQ/CQko=
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com (2603:1096:803:49::13)
 by TYZPR03MB7060.apcprd03.prod.outlook.com (2603:1096:400:337::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:07:22 +0000
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f]) by PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f%7]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 15:07:22 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQA=
Date: Mon, 28 Nov 2022 15:07:22 +0000
Message-ID: <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
In-Reply-To: <Y4Cysgk5Gic5ae9B@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB3384:EE_|TYZPR03MB7060:EE_
x-ms-office365-filtering-correlation-id: 05a8c6e5-402c-4a30-5301-08dad152406b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dUCqNXMQEtJ4SD6UVqAGIE5WjXqNtQ2oc5kZdrt3FHHtXtpWCZ4t2e2SbFkxx7mwJ39D7YaoV62QW2ae0tTKJser6Z2oAz17KBTzgnAnTkLDekdQ4MCkGJF0XWbTzIn3dso1Ev2yhMK+o8CzJNwQ70I85zdfzJh10UEjQQiOwvOSW0X3hseQLPu3qu+r7qN0Kfk+allu5Db61eE0JFQKFCyQmPtWD8g8KMWvhG54V46iDPa2eloiuJXyEn2ZH2QBC7U4NsMoVH1eIoT7Qpb2Y62jsW1w/TpnkvWDsHjVTuBVNnRlcjFl4zsBuDba5URQhB7CepI17Q/5ycJCQMaqqQB8LOF5B07prd7Efg9cWmrCcmbsm4zT2I2Ka6im3l95rxoIlh0v2cS2JJdp9A3mJBwZOFjhkbidgo/v7+pIczFQ7gPSm1nJVVLZc1s+sNDPXb+IaOUZJPZzzs+HikCG9XVVCSz0A+MyF90Dc706zEyEA0YacC9IkSP/B+IGRBwt0++ALN3PhDkHBc736/MrBvny0FQSjQogbydLQZn+Wty/4mxEM63nOO9lfZSRXAA6wMg0j//r0N0YfraGggMd+rqiW51zychtxvNN4h0FY35HyLn42KPL68jvOUlI1QVx/FXhURbKhmpReinYqkW8SMVjeavppaDueBh11rwQ8HmVlclVBf4//YgWMZ/KWZgK4dnAkCKXNDZ0E6vKSGCtpqnEtTBTDL6rcu4c60ebezg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR03MB3384.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(38070700005)(85182001)(36756003)(2906002)(4001150100001)(86362001)(6486002)(7416002)(71200400001)(478600001)(76116006)(6506007)(316002)(66946007)(66446008)(91956017)(41300700001)(5660300002)(26005)(64756008)(54906003)(8676002)(66556008)(6916009)(8936002)(4326008)(66476007)(6512007)(122000001)(38100700002)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNLK0dzNFc3c1ZsTTE5b01HNVgwbWRFVDhHcmlxZEg1T3JWaXRkK1hrWkZK?=
 =?utf-8?B?R2F1RTNDWWRsVVdFVGJhcmljS2NFbmtGdUZ6OHZNSllkWEJaNlU2L3BEVXNu?=
 =?utf-8?B?MHg5NDdSWnI5S2pUS1Y0YVpZL1B6YVJmM09sR2twMUx5SGI4MWIzK1J2R0FP?=
 =?utf-8?B?QkFWanlybE0xQWJueEt5NEU3VGNXUmhLZVFvanIrL2hZazJtOXVHTy9IZnJk?=
 =?utf-8?B?NjF4Y1NOWHJuZmpVeG13L3VDSm9QdFovWE5lVzF0Y3EzUEc0SFJDR0tMVTZ1?=
 =?utf-8?B?RVBVUFJpVU1JckhiZk5rSkpva24renJyRjliVEloNGhyY1Z1ZHR2K3JFNFN0?=
 =?utf-8?B?ckxJbVJpYXpWT1U4Uy9XcE1jaHRzK1RIcDQrV05XWTMzVFQzZ3V2dEQ3NEI5?=
 =?utf-8?B?V0RsOHZzbG9mWXVkUGYxTHAvT1ljSzY3eHNCNG9JQ1I4OWhmTkJRVkYwUWta?=
 =?utf-8?B?NDViUG94WUNocTUrV241em1xZUE3WlFQSkh0MjBCbFE3ZmFselEzMURhYTht?=
 =?utf-8?B?UUszMWFHcy9ZMkp6OEg4Yysrd3BjaVZXVUtyT2w1NjFwMVdiOFZLUllGNndE?=
 =?utf-8?B?MUFtRSs0MkRDUDJlQThYWU1PVFpHMUxxVS94YW95RWNzSEUweTJQNjB4amxO?=
 =?utf-8?B?L2NPQUx4WkE1TU5MZDVlTjVSQ2haRmoyY3BGSmJidmVKTzJRVDJkT3UwbE9P?=
 =?utf-8?B?UEZ4a2ZQRlhMY3lZRHFSV0ZOUVh6MGw4MkxqNitDdmkzWlpuYlVab1VoMFVL?=
 =?utf-8?B?UFpEZzV3d1lIa21UQ3FkbU96WW1PMkN1UFBrdXBEWUhWV3g0MEQvci81OXgz?=
 =?utf-8?B?cWEweEg4cXR6R3gwemE4UXN3MUlERTJCTWdWZzMwSEtoWTErSTVQOGVUd0pa?=
 =?utf-8?B?ZS9hVGFoYkQ2a2VmYnc4Zm8wT2g4SUZoWkZ3QWtENVlYbE9ueUE0VTUva243?=
 =?utf-8?B?R09hZUZPWUhPZDZiWXpFZ29DTjVmU0dDdjljd0R3ZmRucHBWZ1FNSjhUaWhI?=
 =?utf-8?B?T0xzZytZWVl0UUkrYnNmUEEyZVFQdGhOSEw1dENiR0RHbzU3ZHI0K09RV2hz?=
 =?utf-8?B?UzdBQnFrYytxTXBMOXdDVCtRakxOMklFM3JFSTlsMFlsOFpMdHFBRWlabjc5?=
 =?utf-8?B?V29LakVhaTFQcEJTOTJ6Q1RGNWx3cUEvajk0cmRlTHFEVU9iczhub1lWdExu?=
 =?utf-8?B?Yk9OQ25ZeDNvRTdsNEhJc1V3dVI1MUtwaFRkUkg1UUs5NVgvMFcvMEFJRGsr?=
 =?utf-8?B?MThIT0ZRVE1xL2NYWkRVc1M5N0RwV1cxaHFkcS8xOTc2SFR2dEtmeUFXQnVZ?=
 =?utf-8?B?anlEOUNCUEVCWlR1V1dSNmJmbmkvWCtEWkczRmIvUXBkUlZkRHRzZFNTUGZt?=
 =?utf-8?B?OXppU0VuUmt0enhMRGxNK2t2Q0xteXpsbEl0TDFLV3U4SWNGQU56S1Z1UkRB?=
 =?utf-8?B?ellDTDFVMTFnNndCYk50VW00V2RSNjhWcVExNUtiazhBQml1MDFmVHFqcUtS?=
 =?utf-8?B?Ym5KdC9kN2twRHBMTCtGbW93WlVITTFwc2JJOGtZc2JrdUNuNEVnLzhXcWFX?=
 =?utf-8?B?cUVNT3RJTnN4UnNIT0NxV1VsTGR5Z0tNTUJLRlhaeDE0Q2pEMWFaeEowcC8w?=
 =?utf-8?B?M0l2V1VhVS8wYkZmZU5VcDd6V21RVUcyMU15dDl4aFhVSEJCWmpwK0Uycnll?=
 =?utf-8?B?bHNDUVRDd2x1bDgyNC9Yc0pFanZQOEczcFNneDh6empNdFRjUlVZWTN5QWda?=
 =?utf-8?B?UlhLMWdpaHovYVhRaTJYdzhuT294NXpCMEpaNUgrb3BtTmVzcExyMlpYaDRv?=
 =?utf-8?B?L2xnQU1HM0NQeEtyVFAxSU1QVjJEUEljTkxmTnZEY21FMUMxMkd0cTR6cWQr?=
 =?utf-8?B?aS8wVURxMXlPOE8wSnkvcHVKSHlLUE8xOWFqV0lBRStHWWd6bDBZNG4rNnZa?=
 =?utf-8?B?dnZPUXZ3cERpR1hSZ3FKMzVFZlYwZFBCeFBXYmw4WEw2SmpyQWkrZFRENHZl?=
 =?utf-8?B?WS9OSTBWdW9LQmpXeE83L3VwWnFLcGs2eHZuWXRaZDIzLzBEMVpEdmFTK2Vz?=
 =?utf-8?B?em1Xd0p4R0xVakV1RmYxOEViU0FreThmZlJ6b0pmUjg0Y0FVMWpqT0RsbW1B?=
 =?utf-8?B?WlkxemNWWkZjU1lVZDZ4MUN4ZDNYTG1GMWtPUDhiV1NlWVQyOE5OWEtOcVkx?=
 =?utf-8?B?OUE9PQ==?=
Content-ID: <F01B049A8C886944B1618C5C930AF989@apcprd03.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB3384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a8c6e5-402c-4a30-5301-08dad152406b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 15:07:22.4332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFQIqiOiXR3sau6G+UUuZ1e1N70Jb38RK/1QDqSNTs0eBAKR4Y8ZwB/Knq32LI4mSkYAU0vlUh63c4ijnf9IyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7060
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

On Fri, 2022-11-25 at 12:18 +0000, Mark Brown wrote:
> On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:
>
> > +/*
> > + * PCM trigger callback.
> > + * Mandatory
> > + */
> > +int (*trigger)(struct device *dev, int cmd);
> > +
>
> Making this mandatory would break all existing users, though...
>
Yes, it should be described as optional.

> > +switch (event) {
> > +case SND_SOC_DAPM_PRE_PMU:
> > +if (hcp->hcd.ops->trigger)
> > +hcp->hcd.ops->trigger(component->dev->parent,
> > SNDRV_PCM_TRIGGER_START);
>
> ..it's not actually mandatory so it's just the comment that's wrong.

Agreed.

> I'm a little unclear why this is being implemented as a DAPM
> operation
> rather than having the driver forward the PCM trigger op if it's
> needed?
> Or alternatively if a DAPM callback is needed why not provide one
> directly rather than hooking into the trigger function - that's going
> to
> be called out of sequence with the rest of DAPM and be potentially
> confusing given the very different environments that trigger and DAPM
> operations run in.  A quick glance at the it6505 driver suggests it'd
> be
> happier with a DAPM callback.

Let me describe the hardware connection about mt8186 with it6505(hdmi)
and rt1015p(speakers).

                       ==>it6505
                     =
DL1(FE) ==>I2S3(BE) =
                     =
                       ==>rt1015p

They shared the same one i2s port, but we'd like to control them
separately. So if hdmi-codec use the PCM trigger op, whne we turn on
the speaker, hdmi-codec's PCM trigger op is also executed, resulting in
sound on both devices.
Is there another way to control them separately? Thank you.




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
