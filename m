Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B54637200
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 06:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F01A16D3;
	Thu, 24 Nov 2022 06:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F01A16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669269230;
	bh=OTMoFxrOHLIuP2Qi92h++nwmUCW+auNwDKLjGbAd0q0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hzharUAiC1hBHJ9jDxDn43MvSd4OOEnDx3uCNlHDEn8WwN/LPffLc1o0gBkDH3phI
	 lV8zapdsWC0EwUKoZ/TkDEcUKiYgymGLywelcTnIkCZdd38F1oGKf+cwDpzUc93uDc
	 fW93gfnmJseO9555jxcOSuzjrSPgUb9xv4bUH3vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6A2F80448;
	Thu, 24 Nov 2022 06:52:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF07AF80431; Thu, 24 Nov 2022 06:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1300EF80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 06:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1300EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="OT7AnxQa"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.b="kokv7Bkl"
X-UUID: 9e22ba4d051044a7a4b2569070575e4e-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uwGmJUU2CBhfNR2BroyngGgYmGH5ZPj96xF/eGDb3io=; 
 b=OT7AnxQaD+zSVQ/A75F5F5usNO2cHQV/qOqDZk/twKg7RY+Jj+A1MxGbeeBaTFZS5wrZ2KqvaZNLuwlOpMyOq61I/QKlbjcIdNK3udFKSSK6Qw6YaNH9a5R+Lp4BOtdv2YY2aonzcrxLAXhnZ+QZQIx26KLVd8mz5sZYvRdRX/s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:ece834d9-f21d-4230-b76c-73849401c42b, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.14, REQID:ece834d9-f21d-4230-b76c-73849401c42b, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:dcaaed0, CLOUDID:035a1adc-6ad4-42ff-91f3-18e0272db660,
 B
 ulkID:2211241352386IBPLQCB,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9e22ba4d051044a7a4b2569070575e4e-20221124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 269678354; Thu, 24 Nov 2022 13:52:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 13:52:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 13:52:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlX8AVasHByPhpH5SArqWrJhvc2DUfd/4FJeI0N5pSs3mQ5lr8DiFk4jklSz5cxzoz1IS6GCUFq15lPX2fKeYCUpg+EhK0Z4YBawYRui0LD+uW8C/Xn9wsOw/pmBFD3TG1IKCAfHSycOlj8xIbuIocUp9X8d3c8CCy7TeqewEnqCLN4JIygTwWez/Segcog2QDV7Pkxf6Mzks9UKuJ6BcJg7xFsJkCXVOnb43YZjbXnLLybVZnNXyPLSB9yLv04dMKHanBypMMtPn+m8PKI8DePP7WbGQIybRc1siYjJ2cesCd6PhuqH5uVR+zlVekTznNtxiGadLixBMH3hZSZbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+Jlv7KMbT0vt9jNDXzZEsthMrNMW63jVRa0g7+cpMU=;
 b=W6I5+TKvXRfUe4fW4nPNgNzqVvb6PBwX3x718R4/nT9KUHTuIkGT9L09No75hIrggXTwBKXdUWXvJfaIVrwUbsUhNmpmcf1ZqeMTctuSHBMM4u+zLFl8VPcNJQuJVIK4/SHt7rcYlC5KsxawwVgg1vSwWzP4NKPzAXqPiL3R4L2P7a8XX0rbb12oQ6kut/RZw9X7WnL5e/qLx4qvMQlXng6bICkGn6PZmk3pMA6CWRF612zW6EtF86cuREx8bd8m2fPogvhDrPKF1jXUFdJ6zb6i634GBIvgSovRswmGfUDlb+k81nW7Wya+uaAK/En1c82RSp1uslQm2jl1RpkH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+Jlv7KMbT0vt9jNDXzZEsthMrNMW63jVRa0g7+cpMU=;
 b=kokv7BklX1PxSV8Pld4WhO7k/CLOtO1SyQyzYSSU8qY7W+K6XSYB1Xu73jG7xP9vCBx98MJ+Hb0RJNWF5WunzVJOzWclmaVg9hTj4RRa44P9eLOibPzltejFMB7gQF2zBNKrUnk47bSB+NdE3izKslGSyVzxpphADd+x7/XbwuU=
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com (2603:1096:400:28c::9)
 by TYZPR03MB5422.apcprd03.prod.outlook.com (2603:1096:400:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Thu, 24 Nov
 2022 05:52:33 +0000
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::af56:be8f:f:85b2]) by TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::af56:be8f:f:85b2%7]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 05:52:33 +0000
From: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>
To: "tzungbi@google.com" <tzungbi@google.com>
Subject: Re: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
Thread-Topic: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
Thread-Index: AQHY/8Oywl8/s31fH0iQmmHOuVawAa5NklkA
Date: Thu, 24 Nov 2022 05:52:33 +0000
Message-ID: <d051f427516fb7e5f7161e60d7e0033740a2aeb4.camel@mediatek.com>
References: <20191022114505.196852-1-tzungbi@google.com>
 <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
In-Reply-To: <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6919:EE_|TYZPR03MB5422:EE_
x-ms-office365-filtering-correlation-id: 61943c97-c5a7-4f3e-9c9d-08dacde014cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ph+Qai2LVkCPoIIJAJ8y6/nbGUMLBW9YlmnDBjvzEnRwaQvqnvyVSk42NdIyeUrjdWBaQN9aZ3Mvkc4xSbWlvmKtvskDJduf/MGX/s/G4xWFD4FokvZLz787hcph0sA6a45UOHaMImGPEIDhtvdkbGyT0wULZTm9lBGPNxZYkrPlUYmx3kwEKtfh5wsEyZ7BRZcs58lweZh04xKekyVg1ynkxGk9TNxCgMUVambLCl7k8NUxVKMYBJCaA/dQp90lENHEezeTKVMYmZDpGUet1DIS7fqL8MxTO17TfOX4hJ8ciyvbeeWg7Xq66lTVa4WOG7dxYpjoyX3q+mMh4xbUrkBaphXrEaGPYZeUWMu4f+v/2+NgBHAlWGIsQ4i5rtEChSdXCFH+1u2CMaHgCqLqK5dHZ8l2Wy/qHmlQiM1mZsb9tLr5PK7UUzOomaAW7edxBz8fiW7Diuzem4ROn7Leh2H6RONySSszMKTWHixeZIHPA+827CFOm9zcJfMswkff40Xu6rt5EfHjYGryr7wMmK8i/SUUzxtNMhsKH3v0kesIPCae4klyszGCSdWILs+cAe0Sxel7Lg2trd9IxOtwZqzpI8C9ozLsiXc80aRUpSleCESEuJq5wZt1A71cHME6d5ICaklmjpxfzIbsrpNpsuqZdIijScgaswUfO/SYVG3WeBN97rWn0z5I+P1dY0eCXgQaLs8PnsWN4vlIOX9zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6919.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199015)(38070700005)(36756003)(85182001)(86362001)(6486002)(71200400001)(6506007)(6916009)(54906003)(107886003)(478600001)(5660300002)(2906002)(26005)(8936002)(4001150100001)(7416002)(316002)(76116006)(8676002)(41300700001)(64756008)(4326008)(66946007)(66556008)(66446008)(66476007)(38100700002)(122000001)(186003)(6512007)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGlOZFgvdVV2TUtkSnM3b2tlSHRPVEdkY05GQVNoMWhVQ0dOUGtlbGtVTFN4?=
 =?utf-8?B?ZVBsd1dlZ0IzL1g0NWNnZy9rR29WdForMDJJaCtuYy9XZXdNWjNrcmpHSHBp?=
 =?utf-8?B?dHNEUEhSZ2dLdHFVWGVOMkRoT0tZM25XZjdMQnA1eFRhOWZROW82M2VXV1V1?=
 =?utf-8?B?Tzl0bVJhOFJrQ2RRS1JSdktMWWtZTFJhU2hHT2NOcmt1YSt0aU5mU3AzUHJB?=
 =?utf-8?B?ZW5LTVFsWjFrbCswK3ZyTUNNSGo2NzBFVlgybzNjQXFBNDE0MmFaYU9aR1hl?=
 =?utf-8?B?UWZXc2ZTcjQ4TExQeVBYd2UyR1VSK3lwU3l3ZVZHallKOWU3THQ3Y1ZSSlpP?=
 =?utf-8?B?RTFuWkFISjNCbTgvRXZzZWNYT3IxREFqOVZrcyt3R0xERVJIQzNNMldhcU9S?=
 =?utf-8?B?WEtFcDNlUStnV05sZTFKSnI2QjdQZTI1d3RlRlhlaFloWXZqRTBBaTR3dFhO?=
 =?utf-8?B?Qk5oWFIydHpMN1Y5Y2JsY3FNYkQ3VW5rNFRORGJuc1I4RVRldXN2c3JrQjFq?=
 =?utf-8?B?QjlFaTMrRXc0SnJHNm5UWGF5Z0tPYUcreVVMQWJKRXU2OVhHdDB0ZlRuZ0Yv?=
 =?utf-8?B?T1lScUVGckhkUnZnNkJVamNlODRqZTFhU2ZhSDJpR3N3MU13TE1mWWhJalh2?=
 =?utf-8?B?QkZtREVYWlM3R29HYlhwN0dibkFqd1JMODE2Y3h4bHFwRndkOWlzVGNRR1Bn?=
 =?utf-8?B?RkVId29nb1dmRi9oYW1vOXdrTi9nNjVnakcwTFBMUkFpeHZtK3ZGRDlneVdx?=
 =?utf-8?B?bzBKazVWUnF2Q2RGNnRmUkV6dWM3N1NCM05yNlFNb3I1ZGF6UHZhYWFtOVQw?=
 =?utf-8?B?cGZQMEVmNy9lTkU3azhQdFVNR2Iwc3BrVGZWOWZYcDJlUEp6ejUzOGtxOFBn?=
 =?utf-8?B?dURkNEhZVnR1UThzQVZKSGZxOW5hNUVJaERSYm53cTl3TWt0b3liLzdPK0dX?=
 =?utf-8?B?b21odmhwVnpoTGZ2TkZLRjhTSzQ4MStVQW1OTzNvdkFDdEJBT2JkanhJcXZs?=
 =?utf-8?B?RHBISXFLc21ZUTM0TThaZ014UXczL3U5Ykh6bDY1UUYwVlg4KzdqN3BFTzly?=
 =?utf-8?B?TEFLU1YwK1hnamRMbHZlL0lqQXNvTlpzb0kzSFhsTjdZVUhMSlEyKyswMHNr?=
 =?utf-8?B?QmJmQ2RhY0ZBZkUvSkNvR2VjdzNpUlR1bnY0Q3psK3dzclRoVlVHV2E3TE4w?=
 =?utf-8?B?WDF6Uzgrem81UTlEVlNVYWN4aVMrTTVQcGNISnpHT0tIVEJFd0NLbi94SHo3?=
 =?utf-8?B?TklnVGNqRHJWWVY0dWVncXZyWmZkbEo2Wng4Y0htK0RNOWdZQkpOczN2amdJ?=
 =?utf-8?B?WlF6aEhUdnlCa2tkekdNSmc1NzRBS2xNY1lVa3VqbW9IeE8wR1NId3ZpbEV2?=
 =?utf-8?B?bjhlWlYrbU1BdVFodzVmOGtZMlJFTUZFR21JOGRHL25VQ1VsY2VHaC91TmMr?=
 =?utf-8?B?NGk1QUx4M09iUnRKbXFNcU1OTzJKR2NOc2FWdkVaQTJWcVNmeThCSnFWdUVS?=
 =?utf-8?B?WFl4ajkyYjA0WDI5Zko5QUZXeUpLcEVQbDdXcGVidlVONVZQRnNXSHJIRDdv?=
 =?utf-8?B?dWpOdlpJQW1ncXgvMWZQdk4wTHpNN2ppbWt0ZXBuc0VFdU5VUHNnZ2pHZTc1?=
 =?utf-8?B?VURza0xWUGJrMkhFWUVnSmFCTmM0blhUd05MUFh4MzZraDJVSUhzTjROMStV?=
 =?utf-8?B?Q0NaMG5vOFJuc2hBcGhCYTJqUGdCdFRqL1FWclpveVFMQjFNbmdyYWxsVWxv?=
 =?utf-8?B?dklEdXR0aThFd3BOOHBuMkZJR2pFamVSWU1PZVhsQ0xKVWZNUjNyTHZiNmda?=
 =?utf-8?B?dENDNEt5WDhOeEozK04zQmZJZnhxZEZMVlhZWUhLbkRNcENOaGZkYXdSOGxM?=
 =?utf-8?B?RFZmK29aWW9jMldPeGMyanNIMVNJbExDdDljaUJhdTByN01EV0NlK25JbHhR?=
 =?utf-8?B?UytiQnZTcVBpcExWWVVwWFRwdXdKTkpyRnF3dXAra0phYkd6OERMU2U3d3hz?=
 =?utf-8?B?b1RzZXdHa2RGRG4yOWluUnBCMStOL3JhL1dYbExrSGRXc2s0U1hiUkl3NXFl?=
 =?utf-8?B?ZkJQeEVkVzU5S0UwTTZTd1FvbTB4ZDl1RGNxSXpRbHZoaHYrV1kwb2kxZTRT?=
 =?utf-8?B?MlF4YWJMT2p4cHNSWFkzQVBBOEV1NUtndkVib3J6dkpJUS9ET0M1bTcvZnI3?=
 =?utf-8?Q?YqGjGICSOBGwqalJk1aBwHE=3D?=
Content-ID: <5C7554BB2449AD43B1FE4E8863F2F3EA@apcprd03.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6919.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61943c97-c5a7-4f3e-9c9d-08dacde014cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 05:52:33.1265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNYDu1izSLrN7PJIPdns98dLynL33+WzZGk8iXyMlPlUG/HGFPltMrBaH8zy5EKrNf/uwk6x0dnx8LKzTBKbimMrFu5lrzEPsmJu8pvTRfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5422
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "cychiang@google.com" <cychiang@google.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>,
 "broonie@kernel.org" <broonie@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "dgreid@google.com" <dgreid@google.com>
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

Hi Tzung-Bi,

We would want to confirm with you as we work on the hdmi-codec for the
mt8186.

Do you have any plan to continue working on this series? We may take
over as well.

Thanks,
Allen

On Tue, 2019-10-22 at 19:45 +0800, Tzung-Bi Shih wrote:
> HDMI codec may be also interested in PCM triggers.  Add PCM trigger
> operator.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  include/sound/hdmi-codec.h    | 13 +++++++++++++
>  sound/soc/codecs/hdmi-codec.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 83b17682e01c..9de462ef170d 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -50,6 +50,13 @@ struct hdmi_codec_params {
>  typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
>        bool plugged);
>
> +enum {
> +HDMI_CODEC_TRIGGER_EVENT_STOP,
> +HDMI_CODEC_TRIGGER_EVENT_START,
> +HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
> +HDMI_CODEC_TRIGGER_EVENT_RESUME,
> +};
> +
>  struct hdmi_codec_pdata;
>  struct hdmi_codec_ops {
>  /*
> @@ -66,6 +73,12 @@ struct hdmi_codec_ops {
>   struct hdmi_codec_daifmt *fmt,
>   struct hdmi_codec_params *hparms);
>
> +/*
> + * PCM trigger callback.
> + * Optional
> + */
> +int (*trigger)(struct device *dev, int event);
> +
>  /*
>   * Shuts down the audio stream.
>   * Mandatory
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-
> codec.c
> index b5fd8f08726e..1ba2fa26ba03 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -565,12 +565,42 @@ static int hdmi_codec_digital_mute(struct
> snd_soc_dai *dai, int mute)
>  return 0;
>  }
>
> +static int hdmi_codec_trigger(struct snd_pcm_substream *substream,
> int cmd,
> +      struct snd_soc_dai *dai)
> +{
> +struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
> +int event;
> +
> +if (!hcp->hcd.ops->trigger)
> +return 0;
> +
> +switch (cmd) {
> +case SNDRV_PCM_TRIGGER_STOP:
> +event = HDMI_CODEC_TRIGGER_EVENT_STOP;
> +break;
> +case SNDRV_PCM_TRIGGER_START:
> +event = HDMI_CODEC_TRIGGER_EVENT_START;
> +break;
> +case SNDRV_PCM_TRIGGER_SUSPEND:
> +event = HDMI_CODEC_TRIGGER_EVENT_SUSPEND;
> +break;
> +case SNDRV_PCM_TRIGGER_RESUME:
> +event = HDMI_CODEC_TRIGGER_EVENT_RESUME;
> +break;
> +default:
> +return -EINVAL;
> +}
> +
> +return hcp->hcd.ops->trigger(dai->dev->parent, event);
> +}
> +
>  static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
>  .startup= hdmi_codec_startup,
>  .shutdown= hdmi_codec_shutdown,
>  .hw_params= hdmi_codec_hw_params,
>  .set_fmt= hdmi_codec_i2s_set_fmt,
>  .digital_mute= hdmi_codec_digital_mute,
> +.trigger= hdmi_codec_trigger,
>  };
>
>  static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
> @@ -578,6 +608,7 @@ static const struct snd_soc_dai_ops
> hdmi_codec_spdif_dai_ops = {
>  .shutdown= hdmi_codec_shutdown,
>  .hw_params= hdmi_codec_hw_params,
>  .digital_mute= hdmi_codec_digital_mute,
> +.trigger= hdmi_codec_trigger,
>  };
>
>  #define HDMI_RATES(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\


************* MEDIATEK Confidentiality Notice ********************
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
