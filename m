Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC74363BF1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 08:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5386116B5;
	Mon, 19 Apr 2021 08:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5386116B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618815108;
	bh=IiNNQK8qnJhmWo1EmeGbdU/tVVaDjeqjy5PG2mHd060=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPV6eXs8xBgzB/nQEpNn5lVZ+Qos1lJkbX/4Bu//ObXe2l/2QaTcxNDl/wHCX9js3
	 RN1sfDa7+rxsfUrVxKs2XSv/R8T8QQaUyc6TYkn/DKhhCmiSdHeug/pfOF6lo6Yzcl
	 5zRbXR2D7eUqpb+YrPJDbCwkZ0cZ7IkJnZDiKhEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F0FF8019B;
	Mon, 19 Apr 2021 08:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B575F80227; Mon, 19 Apr 2021 08:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CFEBF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 08:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFEBF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="nGyFX//n"
IronPort-SDR: UAN5Rqr2YEsigpuC7Akd4HTRq320ea6Eo5pbNDCznfJuw6m4RxCs2EQ7uB++RSpq8hWpPP2GyN
 mVYXuV5c3i7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="280601386"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="280601386"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 23:50:04 -0700
IronPort-SDR: 8CLDJjlu1klGoG7e2u/I2GuEAl5ORe+EbHt9rrv7Sp/Tf6bV2O1sSLQ7JecsDzOc3O96fPcM5A
 dCuhyj1+kZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="454178434"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2021 23:50:03 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 18 Apr 2021 23:50:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 18 Apr 2021 23:50:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 18 Apr 2021 23:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+0pXguMUJVophl8gvwDEVRKVmc/lb43JnBFwwiQI/SPfMxiB9i68XlMj/0zPABFAwoI570qAEfc3f97wP4W5mAqzUGs4tUjywRBRAe6SK14JRiJHeWm56///TilWyz/mtf5WyFP2rEhZ+byo4y0m9Yl14VClmG0frduhI4Ymh711BNl3dx0rHZ+7ugFL2QbU4sZ8RBFYIjoM/88woWhgVL0bKb8B30vDqXdqYhTrDQtq6AKfabFOCZ1vgRhgZ5d6vWUEw6PsCOOwETHcJq0vIiLma15V9ZNC+d6L/fe+xWO7iAm9AxWH3L8bAuOnBmkkc77+TprO1l72J8uboc/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiNNQK8qnJhmWo1EmeGbdU/tVVaDjeqjy5PG2mHd060=;
 b=aBZ0oFyhmXvuXt8ATe1Arerd0D5k8mmwgeBiY7XM5EbmTSYESPHsoDhtd4bgeyelsPwwVO213MCTPtn6U62thNKHtgyOlymm8DdGBQ2stVDODhR+E2ZmL5OhYyOUvLlvZl+4WIFvRrJmmwO9yF8QDv3MNBALadK9og/U37/8IYJwsy7g7TO4WCdGxSxyzRYLYJEuPiNYM1uXiKhzq8tFxc13jmIAH69A5x2YOrhKwICq5H6LB0QVXI8KDTY8qAlOymHL9cnqjcskddS0Izmtpg3rWHJq/IS4q1GhDPsL1rWu9u6JwuuDzM1reZOQbya4RmrSNCeIavCjmYILHHxwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiNNQK8qnJhmWo1EmeGbdU/tVVaDjeqjy5PG2mHd060=;
 b=nGyFX//nz0cicKsVlq1qu5t3aLgoyL9KF3zuTAE2rnz1tIApb1T2/pN5R2TmMA6Ua+wUYxsQ4744Iaq1LGrDv6TvMq6AzYmcTNAhqb2asMQ4zGyipd/EjflLY0EmrqPaF0FYHzxpZxC0ry/2gGcPLPlSEb6EICtZx9BKB9PFNYM=
Received: from MWHPR11MB1663.namprd11.prod.outlook.com (2603:10b6:301:d::15)
 by MWHPR11MB1406.namprd11.prod.outlook.com (2603:10b6:300:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 06:50:00 +0000
Received: from MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe]) by MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 06:50:00 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "shumingf@realtek.com"
 <shumingf@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Topic: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Index: AQHXMdgjKGxZxqCQzUO3d8W4zJrgf6q1cGQAgAXfzHCAABeWgIAAAuvg
Date: Mon, 19 Apr 2021 06:50:00 +0000
Message-ID: <MWHPR11MB1663671582DCB35BE88C5B5590499@MWHPR11MB1663.namprd11.prod.outlook.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
 <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
 <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
In-Reply-To: <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41325bb8-778a-478c-bc75-08d902ff5a34
x-ms-traffictypediagnostic: MWHPR11MB1406:
x-microsoft-antispam-prvs: <MWHPR11MB1406ED6A57176A48CDE202B690499@MWHPR11MB1406.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oeh7ke9iceea8CHYJ4HMVp+/qRujDXE3LqnLPBJc7GUckjB0DCuw6uq3fPRUTGtRLuF3apg+zsA7qlMZdmNUDWjGGovuFiDaSwbqlnZB6xAQMnLWAlzXWD5fkWzb0Zu9MZfgkJpYVdirPKs0/JCf5cmz6l/fZA7/mpw6lcH4Np6QS5B81TpdQFGDhoq6F8k5BmFWx2S+970q5onMmuT3oyOIgZxKit1vyngeEoN8HopzlHHz79R2V+E+pj/RxHrZrZKwgkUMzJTYLGdfhO0T/56wDemHsC7paBPO33LjJCgCUqvHJwLhzorgn5VPOyJg3oENuDWY/FBYihFe7MmF0CJNtpaEbZI0Nl7p9ay34GlIgRTS8HKLOWd32kqfAd3eBOH8zCjkGM09YnVGSdV9m+MfgEtDW7AG6W/Ly2F719OMa2CAo/Gwp+UonkodB3PPGYJf/1IH/vE4EHZIRiNTfoWjOMR68nBw8n1pt8NoaOgWiJLtrlb0ONt+BHVIkz+BlE+8UN3i/OufP2zBeGtWCTh33tak/K+pYivcS9Ve+NB875vG/3A/UUHtjXEwdLb/DUA9g9wxBXFithktfGSW1YZBlc5FkzaMzTPYtdcYe6uIwz12uxXaY5yS+ngMDDlBMaCyBWE8iqV8J5MxSuLQAPk6aVDQxbW6LAPjd1EAHTs9QhOvh6vk5WSi+wTx9VKX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(186003)(71200400001)(9686003)(478600001)(26005)(66556008)(86362001)(8936002)(110136005)(64756008)(66446008)(7416002)(76116006)(55016002)(66476007)(54906003)(83380400001)(316002)(52536014)(6506007)(4326008)(966005)(33656002)(53546011)(8676002)(2906002)(7696005)(122000001)(38100700002)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmtKMHhnWERlVFk5MlpIWXJNT1V6bGI2U2lnYjFpNlZ6L1F4THpXVm52SjF3?=
 =?utf-8?B?WmZjT2htckU5MXphaDlsMWVpZGxvcjY2UWxvNjh5MkFCUjJrWGpRcFdleGlG?=
 =?utf-8?B?L1BSTGMyYW5YRml0T2x3cmoySmwyT2tDamxpaHRLL1lDNVNVRW80bzBpeUtY?=
 =?utf-8?B?V3pGUHF2dXBwcS9wS29JYnJOL2FaODhxbTQ4L1FPdTh0Qk9HdlZJNDFPSzZq?=
 =?utf-8?B?blpYekw3U002Wk9hcU9sSEkwL0tNN0x3YStzRkJJcmlER3V3dUliMVRuRlVh?=
 =?utf-8?B?emxaQmFWYS9IbHhNMnpxMm5TVktIYWpobU1Vc1k4T21nTVdCb0VjU1g0Myth?=
 =?utf-8?B?enZ1c2JQbThET0tzYmlzaTdEcktBN3RjVzF5ZXB0b2x5TWVleWloRFIzL1hu?=
 =?utf-8?B?cjVZaEdKZHFZc0NrYnU4ZExhSWlQQXNwa29PdG90R2h3ZDcvSUhVbzY4R0l4?=
 =?utf-8?B?NDBaaFlIdmR1bVVWZm53dG5RejdFcGU2VFRjZk1tZVlrdEdBV0ZLZlBybHI2?=
 =?utf-8?B?U0tyMlJ6aEJxY3p6QUJoaWRaWEtmcmdZKzlhY0xJdEEzZlo1bkhwOFNzRkpH?=
 =?utf-8?B?Rko0MXFLaXZDQjdOM0UyOGlvano2L1Q0Ym56eUl2d1g3WHBHZXVhYlZLT1NX?=
 =?utf-8?B?YWR0U05CMTJkeWdPMTRKWUtNNnFoVm53c1kzWDJkdHRnSU01WVQzcCszZmVj?=
 =?utf-8?B?M2RabXVvcDRQeGtSdFZXcTVmNU5HZ3BFMG1qY0t5S2NrSFZsSzBHODg5U0Qw?=
 =?utf-8?B?REcySFBRWmUwSTA5VktLbENuZmdXNzVuZlhxd21TekZvN3VSWDZENmJPQUVC?=
 =?utf-8?B?WkYyREtNbnpHdlh5QUI3MGhmOEdqMHRHeWYzc0lpbUdZSWN2Z3RvQ2Faanhv?=
 =?utf-8?B?Vm1xNld1UjhLSlhOT3A2cWV2TjdudGc3K3FoK0RocFd1a3ZEUW9MSWF0SCtl?=
 =?utf-8?B?b1RTWTJWNDVUWmUyNy82RmxsalZEeE1oWklpTHNwYXY5THBKWjFmK0dVNXQ3?=
 =?utf-8?B?TXIyNlpWVDNwQVZmKzMyMjE0ZXhqQmo0OGFDajRVcnluNUhlQytQM2UreFZG?=
 =?utf-8?B?SDhKaDN5QUp5NjlWcE5SUEVnelFXMHhyMXkvSGhEbkdGNUo5S0d0MkMzMHFj?=
 =?utf-8?B?alZMalpXeVgyMms1UlZKQVlCMkdsZGt1eitoZGE1ZVR4azhjN29QbUdXeG1O?=
 =?utf-8?B?Tk9KYzBzdDAxTHFyVWFpc1RtRHBKWmJtNjEvUFF5KzhPNUZGMWxldXN1NThi?=
 =?utf-8?B?MEQwM2N3SHBocUdrQ0FUbVNCQy9NeHNEaVJFeGdmWVN3WnZHWmJCTnRwZU5s?=
 =?utf-8?B?bnRDZWRqZGwzcWlUUmNXdjVPQ29Kb3oyN3lTekw2a3ZNTDlLOW5FN3FZNmk5?=
 =?utf-8?B?VitRSFZENmR6TmFqcjVhK1JaY0JhcDA1VXh5YVh2elBJc2ZQbVk3Sk1Zclhs?=
 =?utf-8?B?NzlCamJVdlFRdlFmdllyU2tyN29rcWw1aFNXbmpxYnE0RWNwcG1zK0s3SFpr?=
 =?utf-8?B?NWowOUNtTWs3RFNScGNsckxmRkVrek5VU05SdFNwZ0tlc1pBMXV2YWgxbXBt?=
 =?utf-8?B?MWtNLzhwYU84TE5JNjJGVkwyOVJFYi9kUGFGRlQ0RnRzamtuSklJem4zOFVX?=
 =?utf-8?B?eDJHanVPdUlINlVPczFEM3FyL2h6ajdBRFVZYzlZTG0zbTloazB6SlR1cXhJ?=
 =?utf-8?B?UjdNRXoxdzdEbzVrNlQwMlV3d1IvZmdZUEhUTmdCOTRnK3RoeEp1VGYwTDVK?=
 =?utf-8?Q?M3Heuq7ufUI77gWI4iXZE5/gOuDZN73WRLFTfv4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41325bb8-778a-478c-bc75-08d902ff5a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 06:50:00.1418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0WJvjCZbhuIEHQ9vhPzLmfO9OI38x85qtSoPbHQGOpeQqUOCVZCwdu6nLssopZ8+AeuiXNte4BFU4+W3e3GOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1406
X-OriginatorOrg: intel.com
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "derek.fang@realtek.com" <derek.fang@realtek.com>,
 "flove@realtek.com" <flove@realtek.com>
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

SGkgSmFyb3NsYXYsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFy
b3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gU2VudDogMjAyMeW5tDTmnIgxOeaXpSAx
NDozMg0KPiBUbzogWWFuZywgTGliaW4gPGxpYmluLnlhbmdAaW50ZWwuY29tPjsgUGllcnJlLUxv
dWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+OyBz
aHVtaW5nZkByZWFsdGVrLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiBsZ2lyZHdvb2RAZ21h
aWwuY29tDQo+IENjOiBvZGVyX2NoaW91QHJlYWx0ZWsuY29tOyBqYWNrLnl1QHJlYWx0ZWsuY29t
OyBhbHNhLWRldmVsQGFsc2EtDQo+IHByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7IGRlcmVr
LmZhbmdAcmVhbHRlay5jb207IGZsb3ZlQHJlYWx0ZWsuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIEFTb0M6IHJ0NzExLXNkY2E6IHJlbW92ZSBjYXB0dXJlIHN3aXRjaCBjb250cm9scw0KPiAN
Cj4gRG5lIDE5LiAwNC4gMjEgdiA3OjE0IFlhbmcsIExpYmluIG5hcHNhbChhKToNCj4gPiBIaSBQ
aWVycmUsDQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tPg0KPiA+PiBTZW50OiAyMDIx5bm0NOaciDE15pelIDE5OjI2DQo+ID4+IFRvOiBzaHVt
aW5nZkByZWFsdGVrLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29t
DQo+ID4+IENjOiBvZGVyX2NoaW91QHJlYWx0ZWsuY29tOyBqYWNrLnl1QHJlYWx0ZWsuY29tOyBh
bHNhLWRldmVsQGFsc2EtDQo+ID4+IHByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7IFlhbmcs
IExpYmluIDxsaWJpbi55YW5nQGludGVsLmNvbT47DQo+ID4+IGRlcmVrLmZhbmdAcmVhbHRlay5j
b207IGZsb3ZlQHJlYWx0ZWsuY29tDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6IHJ0
NzExLXNkY2E6IHJlbW92ZSBjYXB0dXJlIHN3aXRjaCBjb250cm9scw0KPiA+Pg0KPiA+Pg0KPiA+
Pg0KPiA+PiBPbiA0LzE1LzIxIDQ6MTYgQU0sIHNodW1pbmdmQHJlYWx0ZWsuY29tIHdyb3RlOg0K
PiA+Pj4gRnJvbTogU2h1bWluZyBGYW4gPHNodW1pbmdmQHJlYWx0ZWsuY29tPg0KPiA+Pj4NCj4g
Pj4+IFRoZSBzZXR0aW5ncyBvZiB0aGUgc3dpdGNoIGNvbnRyb2wgYWxyZWFkeSBzZXQgYnkgREFQ
TSBldmVudC4NCj4gPj4+IFRoZXNlIHN3aXRjaCBjb250cm9scyBtaWdodCB0aGUgdXNlciBjb25m
dXNlZCB3aHkgaXQgY2FuJ3QgZGlzYWJsZQ0KPiA+Pj4gdGhlDQo+ID4+IGNhcHR1cmUuDQo+ID4+
DQo+ID4+IFNvcnJ5LCBub3QgZm9sbG93aW5nLiBUaGlzIGNvbnRyb2wgaXMgdXNlZCBpbiB0aGUg
YWxzYS11Y20tY29uZiB0aGF0DQo+ID4+IHdhcyBqdXN0IG1lcmdlZA0KPiA+Pg0KPiA+PiBodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLQ0KPiA+PiBjb25mL2NvbW1pdC8x
OTcwMjU2NTZlYzQ1NjMzMWQxYTM0MzU3YjExMzkxM2VjM2IxODdmI2RpZmYtDQo+ID4+DQo+IDBl
MWM2MjdlYTg5ZWUxNDhmZGI0MWFhNmIzYmE3ODUxYmE5YzIwZWI0M2MxYjg3YjllMGNlOTIxNjQy
NzNkYzNSDQo+ID4+IDcNCj4gPj4NCj4gPj4gSXMgdGhpcyBzYXlpbmcgdGhpcyBjb21taXQgbmVl
ZHMgdG8gYmUgZml4ZWQgd2l0aCBhIGZvbGxvdy11cCBQUj8NCj4gPj4gTGliaW4sIGFyZSB5b3Ug
d29ya2luZyBvbiB0aGlzPw0KPiA+DQo+ID4gWWVzLCBJIHdpbGwgc3VibWl0IGEgcGF0Y2ggZm9y
IFVDTSBhZnRlciB0aGlzIHBhdGNoIGlzIG1lcmdlZC4NCj4gPg0KPiA+IFRoZSBiYWNrZ3JvdW5k
IGlzIEphcm9zbGF2IHJlcXVpcmVzIHVzaW5nIGNvZGVjIEhXIGtjb250cm9sIGZvcg0KPiA+IGNh
cHR1cmUgdm9sdW1lL3N3aXRjaC4gU2h1bWluZyBhbmQgSSB3b3JrZWQgb24gaXQuIEF0IGZpcnN0
IHdlIHdhbnRlZA0KPiA+IHRvIHVzZSBGVTBGIHRvIHJlcGxhY2UgUEdBIGtjb250cm9sLiBCdXQg
U2h1bWluZyBmb3VuZCBGVTBGIGlzIHVzZWQgaW4NCj4gREFQTS4NCj4gPiBTbyBpdCBpcyBub3Qg
cHJvcGVyIGZvciB0aGUgY2FwdHVyZSB2b2x1bWUvc3dpdGNoLiBBbmQgU2h1bWluZyB3aWxsDQo+
ID4gcmVtb3ZlIHRoZSBGVTBGIGtjb250cm9sLg0KPiANCj4gSXMgc3dpdGNoIGNvbnRyb2wgbmFt
ZSBhbGlnbmVkIHdpdGggdGhlIHZvbHVtZSBjb250cm9sIG5hbWUgYWZ0ZXIgdGhpcw0KPiBjaGFu
Z2U/DQoNClRoaXMgcGF0Y2ggaXMgcmVtb3ZpbmcgIkZVMEYgQ2FwdHVyZSBTd2l0Y2giLiBCZWZv
cmUgdGhpcyBwYXRjaCwNCnRoZXJlIGlzICJGVTBGIENhcHR1cmUgU3dpdGNoIiBhbmQgIkZVMEYg
Q2FwdHVyZSBWb2x1bWUiLiBBZnRlciB0aGlzDQpwYXRjaCBpcyBhcHBsaWVkLCAiRlUwRiBDYXB0
dXJlIFN3aXRjaCIgaXMgcmVtb3ZlZC4gU28gdGhlIFVDTSANCmh0dHBzOi8vZ2l0aHViLmNvbS9h
bHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9ibG9iLzU3ZWFkODQyNzhmNjQxZDQxMWUzY2NiYjVj
OGE0YjY0MTQxOTA0YmEvdWNtMi9jb2RlY3MvcnQ3MTEtc2RjYS9pbml0LmNvbmYjTDcNCm9mICJG
VTBGIENhcHR1cmUgU3dpdGNoIiBzZXR0aW5nIG5lZWRzIHRvIGJlIHJlbW92ZWQuDQoNCj4gSSBt
ZWFuICJBIENhcHR1cmUgU3dpdGNoIiArICJBIENhcHR1cmUgVm9sdW1lIiBub3QgIkEgQ2FwdHVy
ZSBTd2l0Y2giICsgIkINCj4gQ2FwdHVyZSBWb2x1bWUiLg0KDQpXZSBjb3VsZG4ndCBmaW5kIGEg
cHJvcGVyIGNvZGVjIGtjb250cm9sIGZvciBSVDcxMSBjYXB0dXJlLiBTbyB3ZQ0KaGF2ZSB0byBj
b250aW51ZSB1c2luZyBQR0Ega2NvbnRyb2wuDQoNClJlZ2FyZHMsDQpMaWJpbg0KDQo+IA0KPiAJ
CQkJCQlKYXJvc2xhdg0KPiANCj4gPg0KPiA+IFJlZ2FyZHMsDQo+ID4gTGliaW4NCj4gPg0KPiA+
Pg0KPiA+Pg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFNodW1pbmcgRmFuIDxzaHVtaW5n
ZkByZWFsdGVrLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gICBzb3VuZC9zb2MvY29kZWNzL3J0NzEx
LXNkY2EuYyB8IDggLS0tLS0tLS0NCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25z
KC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTEtc2Rj
YS5jIGIvc291bmQvc29jL2NvZGVjcy9ydDcxMS0NCj4gPj4gc2RjYS5jDQo+ID4+PiBpbmRleCBi
ZmI3ZjFjOGVjOGYuLjJhMDljMzA1ZjRlNCAxMDA2NDQNCj4gPj4+IC0tLSBhL3NvdW5kL3NvYy9j
b2RlY3MvcnQ3MTEtc2RjYS5jDQo+ID4+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzExLXNk
Y2EuYw0KPiA+Pj4gQEAgLTY1MiwxNCArNjUyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRf
a2NvbnRyb2xfbmV3DQo+ID4+IHJ0NzExX3NkY2Ffc25kX2NvbnRyb2xzW10gPSB7DQo+ID4+PiAg
IAkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+ID4+IFJUNzExX1NEQ0FfRU5U
X1VTRVJfRlUwNSwgUlQ3MTFfU0RDQV9DVExfRlVfVk9MVU1FLCBDSF9SKSwNCj4gPj4+ICAgCQkw
eDU3LCAweDU3LCAwLA0KPiA+Pj4gICAJCXJ0NzExX3NkY2Ffc2V0X2dhaW5fZ2V0LCBydDcxMV9z
ZGNhX3NldF9nYWluX3B1dCwNCj4gPj4gb3V0X3ZvbF90bHYpLA0KPiA+Pj4gLQlTT0NfRE9VQkxF
X1IoIkZVMUUgQ2FwdHVyZSBTd2l0Y2giLA0KPiA+Pj4gLQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVN
X01JQ19BUlJBWSwNCj4gPj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLCBSVDcxMV9TRENBX0NU
TF9GVV9NVVRFLCBDSF9MKSwNCj4gPj4+IC0JCVNEV19TRENBX0NUTChGVU5DX05VTV9NSUNfQVJS
QVksDQo+ID4+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUxRSwgUlQ3MTFfU0RDQV9DVExfRlVfTVVU
RSwgQ0hfUiksDQo+ID4+PiAtCQkwLCAxLCAxKSwNCj4gPj4+IC0JU09DX0RPVUJMRV9SKCJGVTBG
IENhcHR1cmUgU3dpdGNoIiwNCj4gPj4+IC0JCVNEV19TRENBX0NUTChGVU5DX05VTV9KQUNLX0NP
REVDLA0KPiA+PiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMEYsIFJUNzExX1NEQ0FfQ1RMX0ZVX01V
VEUsIENIX0wpLA0KPiA+Pj4gLQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+
ID4+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUwRiwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hf
UiksDQo+ID4+PiAtCQkwLCAxLCAxKSwNCj4gPj4+ICAgCVNPQ19ET1VCTEVfUl9FWFRfVExWKCJG
VTFFIENhcHR1cmUgVm9sdW1lIiwNCj4gPj4+ICAgCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fTUlD
X0FSUkFZLA0KPiA+PiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMUUsIFJUNzExX1NEQ0FfQ1RMX0ZV
X1ZPTFVNRSwgQ0hfTCksDQo+ID4+PiAgIAkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX01JQ19BUlJB
WSwNCj4gPj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLCBSVDcxMV9TRENBX0NUTF9GVV9WT0xV
TUUsIENIX1IpLA0KPiA+Pj4NCj4gDQo+IA0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4
QHBlcmV4LmN6Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBI
YXQsIEluYy4NCg==
