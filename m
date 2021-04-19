Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F13363C5F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 09:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB0B16CA;
	Mon, 19 Apr 2021 09:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB0B16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618816765;
	bh=MdDvQUjBiSCVaDdn/k4YSWFlN34lfVmWejxSlUpbMHE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irX7HVDLhcDMdou2Wq6aZTGA9Y1A9VaYEyRzAxabTzJ33OoZTMChdbX7ZaVS/3Iyl
	 Y0wsO9t9ZEvUWTKcmTF+R1rrE94XK3CHDiRzX4KxP/51Lj/rCxhULiG3/FPKlu+cIs
	 5vjrYzqvuBuWiVoode0YbIMqHDE5eu4ctR559nlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 564E4F80276;
	Mon, 19 Apr 2021 09:18:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E1D2F80274; Mon, 19 Apr 2021 09:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8D4EF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 09:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D4EF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="vr2PpT5L"
IronPort-SDR: tzI5PxAmZ0zj9bU72VnasFyyhtkL7/Zif41kKMFn8qY9TYRC9oOuUfTjgW2+XijmKKRoai4aXd
 iysvAtPJOOlg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="194839172"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="194839172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 00:17:39 -0700
IronPort-SDR: dKJBzNSuOlGfTiMLldH/E+5ICLbL2+Hp/B/uQxhDXjWxKOcnyc4tVSBVVWnTdIuacUBqmkyOes
 A70KtFMorX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="422598887"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2021 00:17:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 00:17:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 19 Apr 2021 00:17:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 19 Apr 2021 00:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXo13huRJjSQa1oXZjvl6BOucbcFlYEz+zuwdrZy/v9FMqEaYRAkvqqDmvLMbtzFxzoKTJ7M4pDc36HMtNWu0Q7Bf/5EKwGIL7dIq3eYoCtSNLCWyBOIwPATaUfds4xjM/kYSw8SFy8D6hKMu2QnT3SHWrzSwtKnLgH2kW/CJC9z7k0exy2ppcqfAcD6x0WUelXJC6U1PlB3VhJY5e/Ilnz8crfS6ti3Ncs0VbjnQJrBU0CVig713EE/z1EIoFpcvPBlhRADjzwvIWyhYpzvclhnp9WXubPTRGNQnBMuIXbdsceBME/qPI76jAQaxpQWU+70OWB5oEm4nfcB5rf68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdDvQUjBiSCVaDdn/k4YSWFlN34lfVmWejxSlUpbMHE=;
 b=kWg4px3vjVYUfFqz6opaV61+TbDnEfW5/sKYx9WvVwZWhr25VqswY5VxRmhoTPo66PTcHDkTJq4hGAVvdT0+1YwKwbQYdp4FvEYYcDSrw0Z1pkR1CSu1MUlpznM9GsoqqmDuqaEw4IR/1sLaHHjLr+x5z0tg6r7eGrwHVVGkkW026ZNsvCTYEHi6Ce7v832me5LYfkao3pAHkEKUk0S8evwHxWlgOATQCIU+7glfXFz2kCOpN0jLmViw0fdvcNNDLZj8+LC8G6Dsw2VQRtXqQ/mNOLzkvLZa/WsL0ixdw0Ib7iL85JqB+g7/dzP/wShqqTJcfoH7uraRUyk9i7UzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdDvQUjBiSCVaDdn/k4YSWFlN34lfVmWejxSlUpbMHE=;
 b=vr2PpT5LAm4pTqOX2GjClByGBZpfvlmKxr6ifM9FBYOYpLk7PdkMFmAsUwzBL+WLJCqrnD2r5xNPLWb5nrrjhDV02ZiWyZD+zip+emkvN7LTm+vxhtDllhwNG8WUB65kWKUUdBxpURgtpJNUWUmud7gkSYwysTACk4SFEh9K/yg=
Received: from MWHPR11MB1663.namprd11.prod.outlook.com (2603:10b6:301:d::15)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 07:17:36 +0000
Received: from MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe]) by MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 07:17:36 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "shumingf@realtek.com"
 <shumingf@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Topic: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Index: AQHXMdgjKGxZxqCQzUO3d8W4zJrgf6q1cGQAgAXfzHCAABeWgIAAAuvggAAD+wCAAAKc8A==
Date: Mon, 19 Apr 2021 07:17:36 +0000
Message-ID: <MWHPR11MB1663B46AB115359FDBDDB29F90499@MWHPR11MB1663.namprd11.prod.outlook.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
 <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
 <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
 <MWHPR11MB1663671582DCB35BE88C5B5590499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <606f8e2d-40d5-8de0-1a06-9c8da016652d@perex.cz>
In-Reply-To: <606f8e2d-40d5-8de0-1a06-9c8da016652d@perex.cz>
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
x-ms-office365-filtering-correlation-id: d3d22430-d440-459d-2288-08d903033599
x-ms-traffictypediagnostic: CO1PR11MB4884:
x-microsoft-antispam-prvs: <CO1PR11MB4884B8729A4485639861EE3390499@CO1PR11MB4884.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tuCKUtdQS9T6YIqtVQVH9nJpq1F+1d6zC2IEqtRPWdVrNYehO/2y7M1zF+qfatuAVPgt0Cd1vEZwkQPCw6sPdxVFrTEacljnKKmroWvwsrRSf64tFMauDk88E0CL1KIIkRDX8CGLN0IadJVjMP+ZJFA5AlmokI1NjqdITYR5Kamh1xJDEYSRQLy227bjmHKFqEi+bBt1YCoFzYStZ5TDH4TgTd91csEUKgbNr9c31mYxrV1A5Lds+d6btzcRpJ5UA1rr0kdrRxFndyRHkrFujjEMSldF3DZzOIY/5DEFmCvt0vvtqQ86DeJnuM0uQyZEXBijmIPyJMRsEkLu68920n5+fQH8vHQmqDi8x0VFjcGu7ralS9D18KUEt9zTTfvyMj44wDioBB51wG8Sl5EjBshTdhcbVx5GWkndV/X1Y0iGQNQA3YCBlcAi9uMXUdSIFuf7EIsV3SrIMsNo/j759xP2U1SnZ8pvhVgBcQ/V8/Lk1OahtVGAj4J4PKAjMz9am2dxJUMEi++V4cVs5vNdnIF93p69ZzMsfCqBCUtxHphwfaRemwuRp0U2TeS2Qxeuu5ZuhW+2SEZk4aGBAEY32RVq5mJerfZsqPshEd6qi8DJ2kesbOo/hDTmEPurqWVyKuGzb8WlaI5uZLF/GwrS9HSJnB8dQG8pYfCgw6M9q2DaeU9hJIJY4FSRIgSIJCKf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(76116006)(66946007)(66476007)(83380400001)(54906003)(8936002)(66556008)(316002)(110136005)(4326008)(9686003)(55016002)(33656002)(26005)(71200400001)(5660300002)(186003)(7416002)(86362001)(8676002)(478600001)(38100700002)(64756008)(66446008)(966005)(53546011)(6506007)(52536014)(2906002)(122000001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MVpaL09VcFJnbjhYR3YyMWJrTzlKUFFhbG5XeHkxZk1Ndjh0R1hYRkZEQ0V5?=
 =?utf-8?B?d2lqd2VRZzJWL0VuZEFhMk4xWTNQL2ZUNGpWdVNUc0VUTTgwUzFKb1gyelNR?=
 =?utf-8?B?UkJtRGNUWmZwOEVQVEtnWm9lNEhtMzhzMUVqdEpodTFsd1doSldqRkNwVjli?=
 =?utf-8?B?d3pwSWJWc0xkQ0g0OFV4YzJzR1UvNys4akc0b2F1U0p3VVdZMmg0cFJHODZ4?=
 =?utf-8?B?Y1NJbnE5OHFoRGRWZEdRQWc2YXcwMngzdE9JWnpjOHlxUHc3VDhTL0Z2eHBL?=
 =?utf-8?B?R2s2cDNMbnRiRVdrWUkyamdacFpwNGJ0dnJaaGErSzhKU0ZJTUo2SUJBZVdR?=
 =?utf-8?B?K1hkcmxRR3JjK1JuV01jVmRuWXhzNXF5enkxK1pvcllMUkt1V0FzNld4TEdH?=
 =?utf-8?B?OXRxNzFzZGpCa2J3S2QwU0JLY2xPRDA4TzFlZW9YTVF5dXhtdzlwK2RGOGhz?=
 =?utf-8?B?Q2NTUEhZTTl0TVYxclZua0RZanhhRERXVm5BQUMraTZTaHBsSVp6YTJ5Yk14?=
 =?utf-8?B?bzcxNmsyQmlab21WRnFBVnlVK3FwVG1QcU9yTGp6d2R4TXhJMTFJRjFaRjkz?=
 =?utf-8?B?WjdWbHNtOHRBYThCd0NjZy9yL2o0cVRWbVYwb0RQZVpKakpQc3JFdzFyOVhv?=
 =?utf-8?B?Qmx5R2Rxd3hSV2VCVlR2a0czdDQwYmNMYm9PeTdaQjVtenNXbjBCekxnQ1pz?=
 =?utf-8?B?SlY4K0s1T01aUzNrMjExU1VmMW4xRUNINEh1aEtCMmNtdldiWnFNSWs4amZX?=
 =?utf-8?B?QmlDVFhpaUxJK28weEI2VFQxdUxrS0tiaEw4MFdCNkU0Z3hPS2ZrZFFpYUNh?=
 =?utf-8?B?bURGcTZaRFp6eGxHekllQ3E0WVhYQWhic0o1NGordFZkOWordm9vYWRMOTUz?=
 =?utf-8?B?L0RBWDFLeVdqY1hhYzVpbHhIczkwd0tWUTJGY3dwbEVrbG55djUvbDJNQ3Bt?=
 =?utf-8?B?d3YvSGhWTjYvYXF4YXhIZmFRNjZSOXhkWVZsaE10Sk9LeWlaWnlIeWoxdmZ0?=
 =?utf-8?B?TklDRFdhMXVxcGxtbDBrSzBCeFk0elE4dERpcDdSbHJtdE5ZZjFrYUhzcHQ3?=
 =?utf-8?B?RmhiUHE4US9tRnZWQS8yR0YvRmtjdXZheWtaamx6NHRDZ003ZHk2eEZSaGNT?=
 =?utf-8?B?RkRpcHJWRGVzeVNmb05hYjYyV0tNR1BhNVg2VloreXlSbmphNlVic21BSUlF?=
 =?utf-8?B?elJFazJRSWVEYjFKUG9uMUx1YXBXMElGaVZTUmZwUnc1eHJNODVLNFg0ekJB?=
 =?utf-8?B?b2dsaXpnU3owU3dPSXVTajNGL21wZ2xVRTdjMVVENGhsNEl5UC94WTBVYzN5?=
 =?utf-8?B?MUlBR3hwemJ4VmIzSWRaQ2tJbmJmQXV4c1grdzhGeUo4dWhOcEM5MndxU1VF?=
 =?utf-8?B?Mi9mbWN1cmNic3lZZmhpYnhWTVhMeURQd0JieFk3MTVSWGpPRzM3MVdJaTFs?=
 =?utf-8?B?eHQrR3BhVURmVHhyRUtKbWYvZitXQlJXYW5GN0dFYWFUUDBCUXVaL3NJS2R3?=
 =?utf-8?B?ZXdCdlNTU1RkVFRNQU1sckh4Z1J1NlRWSXJHUzRRRmxIcE9SZEdyNzZLVjE3?=
 =?utf-8?B?U0pScTFpOVNINDRPTDY5NmV0SlZGTUQwVVVNdy92bUprZjVtOXBQS3JWVFhT?=
 =?utf-8?B?N3JWTVkrellMcXUrVW00SFZYSGZ1SkkzWU5FTnVuSlZaQmlGbnljTUd0OEhr?=
 =?utf-8?B?K1pWZVNra2dPTHhLM2orVnZZaEVzVnFtWDdBUTJ3VmZFWHpBOU93TW8yQ2Mx?=
 =?utf-8?Q?8sQzmBT/kDXGqjAIf+BqI/HY2dGN1/Zu34OORGU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d22430-d440-459d-2288-08d903033599
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 07:17:36.7639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57m+GYfTxPHuNIscwkGlQMlToWi/R8NAaI83T/98Lj2sIEBGgCEaqgShXZCDRAoGwL7nAGzGpEV4x6KZ4twVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
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
NDo1Nw0KPiBUbzogWWFuZywgTGliaW4gPGxpYmluLnlhbmdAaW50ZWwuY29tPjsgUGllcnJlLUxv
dWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+OyBz
aHVtaW5nZkByZWFsdGVrLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiBsZ2lyZHdvb2RAZ21h
aWwuY29tDQo+IENjOiBvZGVyX2NoaW91QHJlYWx0ZWsuY29tOyBqYWNrLnl1QHJlYWx0ZWsuY29t
OyBhbHNhLWRldmVsQGFsc2EtDQo+IHByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7IGRlcmVr
LmZhbmdAcmVhbHRlay5jb207IGZsb3ZlQHJlYWx0ZWsuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIEFTb0M6IHJ0NzExLXNkY2E6IHJlbW92ZSBjYXB0dXJlIHN3aXRjaCBjb250cm9scw0KPiAN
Cj4gRG5lIDE5LiAwNC4gMjEgdiA4OjUwIFlhbmcsIExpYmluIG5hcHNhbChhKToNCj4gPiBIaSBK
YXJvc2xhdiwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6Pg0KPiA+PiBTZW50OiAyMDIx5bm0NOac
iDE55pelIDE0OjMyDQo+ID4+IFRvOiBZYW5nLCBMaWJpbiA8bGliaW4ueWFuZ0BpbnRlbC5jb20+
OyBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLQ0KPiA+PiBsb3Vpcy5ib3NzYXJ0QGxpbnV4
LmludGVsLmNvbT47IHNodW1pbmdmQHJlYWx0ZWsuY29tOw0KPiA+PiBicm9vbmllQGtlcm5lbC5v
cmc7IGxnaXJkd29vZEBnbWFpbC5jb20NCj4gPj4gQ2M6IG9kZXJfY2hpb3VAcmVhbHRlay5jb207
IGphY2sueXVAcmVhbHRlay5jb207IGFsc2EtZGV2ZWxAYWxzYS0NCj4gPj4gcHJvamVjdC5vcmc7
IGxhcnNAbWV0YWZvby5kZTsgZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbTsNCj4gPj4gZmxvdmVAcmVh
bHRlay5jb20NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVNvQzogcnQ3MTEtc2RjYTogcmVt
b3ZlIGNhcHR1cmUgc3dpdGNoIGNvbnRyb2xzDQo+ID4+DQo+ID4+IERuZSAxOS4gMDQuIDIxIHYg
NzoxNCBZYW5nLCBMaWJpbiBuYXBzYWwoYSk6DQo+ID4+PiBIaSBQaWVycmUsDQo+ID4+Pg0KPiA+
Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IFBpZXJy
ZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+
ID4+Pj4gU2VudDogMjAyMeW5tDTmnIgxNeaXpSAxOToyNg0KPiA+Pj4+IFRvOiBzaHVtaW5nZkBy
ZWFsdGVrLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiBsZ2lyZHdvb2RAZ21haWwuY29tDQo+
ID4+Pj4gQ2M6IG9kZXJfY2hpb3VAcmVhbHRlay5jb207IGphY2sueXVAcmVhbHRlay5jb207IGFs
c2EtZGV2ZWxAYWxzYS0NCj4gPj4+PiBwcm9qZWN0Lm9yZzsgbGFyc0BtZXRhZm9vLmRlOyBZYW5n
LCBMaWJpbiA8bGliaW4ueWFuZ0BpbnRlbC5jb20+Ow0KPiA+Pj4+IGRlcmVrLmZhbmdAcmVhbHRl
ay5jb207IGZsb3ZlQHJlYWx0ZWsuY29tDQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVNv
QzogcnQ3MTEtc2RjYTogcmVtb3ZlIGNhcHR1cmUgc3dpdGNoDQo+ID4+Pj4gY29udHJvbHMNCj4g
Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBPbiA0LzE1LzIxIDQ6MTYgQU0sIHNodW1pbmdm
QHJlYWx0ZWsuY29tIHdyb3RlOg0KPiA+Pj4+PiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZA
cmVhbHRlay5jb20+DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBzZXR0aW5ncyBvZiB0aGUgc3dpdGNo
IGNvbnRyb2wgYWxyZWFkeSBzZXQgYnkgREFQTSBldmVudC4NCj4gPj4+Pj4gVGhlc2Ugc3dpdGNo
IGNvbnRyb2xzIG1pZ2h0IHRoZSB1c2VyIGNvbmZ1c2VkIHdoeSBpdCBjYW4ndCBkaXNhYmxlDQo+
ID4+Pj4+IHRoZQ0KPiA+Pj4+IGNhcHR1cmUuDQo+ID4+Pj4NCj4gPj4+PiBTb3JyeSwgbm90IGZv
bGxvd2luZy4gVGhpcyBjb250cm9sIGlzIHVzZWQgaW4gdGhlIGFsc2EtdWNtLWNvbmYNCj4gPj4+
PiB0aGF0IHdhcyBqdXN0IG1lcmdlZA0KPiA+Pj4+DQo+ID4+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L2Fsc2EtcHJvamVjdC9hbHNhLXVjbS0NCj4gPj4+PiBjb25mL2NvbW1pdC8xOTcwMjU2NTZlYzQ1
NjMzMWQxYTM0MzU3YjExMzkxM2VjM2IxODdmI2RpZmYtDQo+ID4+Pj4NCj4gPj4NCj4gMGUxYzYy
N2VhODllZTE0OGZkYjQxYWE2YjNiYTc4NTFiYTljMjBlYjQzYzFiODdiOWUwY2U5MjE2NDI3M2Rj
M1INCj4gPj4+PiA3DQo+ID4+Pj4NCj4gPj4+PiBJcyB0aGlzIHNheWluZyB0aGlzIGNvbW1pdCBu
ZWVkcyB0byBiZSBmaXhlZCB3aXRoIGEgZm9sbG93LXVwIFBSPw0KPiA+Pj4+IExpYmluLCBhcmUg
eW91IHdvcmtpbmcgb24gdGhpcz8NCj4gPj4+DQo+ID4+PiBZZXMsIEkgd2lsbCBzdWJtaXQgYSBw
YXRjaCBmb3IgVUNNIGFmdGVyIHRoaXMgcGF0Y2ggaXMgbWVyZ2VkLg0KPiA+Pj4NCj4gPj4+IFRo
ZSBiYWNrZ3JvdW5kIGlzIEphcm9zbGF2IHJlcXVpcmVzIHVzaW5nIGNvZGVjIEhXIGtjb250cm9s
IGZvcg0KPiA+Pj4gY2FwdHVyZSB2b2x1bWUvc3dpdGNoLiBTaHVtaW5nIGFuZCBJIHdvcmtlZCBv
biBpdC4gQXQgZmlyc3Qgd2UNCj4gPj4+IHdhbnRlZCB0byB1c2UgRlUwRiB0byByZXBsYWNlIFBH
QSBrY29udHJvbC4gQnV0IFNodW1pbmcgZm91bmQgRlUwRg0KPiA+Pj4gaXMgdXNlZCBpbg0KPiA+
PiBEQVBNLg0KPiA+Pj4gU28gaXQgaXMgbm90IHByb3BlciBmb3IgdGhlIGNhcHR1cmUgdm9sdW1l
L3N3aXRjaC4gQW5kIFNodW1pbmcgd2lsbA0KPiA+Pj4gcmVtb3ZlIHRoZSBGVTBGIGtjb250cm9s
Lg0KPiA+Pg0KPiA+PiBJcyBzd2l0Y2ggY29udHJvbCBuYW1lIGFsaWduZWQgd2l0aCB0aGUgdm9s
dW1lIGNvbnRyb2wgbmFtZSBhZnRlcg0KPiA+PiB0aGlzIGNoYW5nZT8NCj4gPg0KPiA+IFRoaXMg
cGF0Y2ggaXMgcmVtb3ZpbmcgIkZVMEYgQ2FwdHVyZSBTd2l0Y2giLiBCZWZvcmUgdGhpcyBwYXRj
aCwgdGhlcmUNCj4gPiBpcyAiRlUwRiBDYXB0dXJlIFN3aXRjaCIgYW5kICJGVTBGIENhcHR1cmUg
Vm9sdW1lIi4gQWZ0ZXIgdGhpcyBwYXRjaA0KPiA+IGlzIGFwcGxpZWQsICJGVTBGIENhcHR1cmUg
U3dpdGNoIiBpcyByZW1vdmVkLiBTbyB0aGUgVUNNDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2Fs
c2EtcHJvamVjdC9hbHNhLXVjbS0NCj4gY29uZi9ibG9iLzU3ZWFkODQyNzhmNjQxZDQxMWUNCj4g
PiAzY2NiYjVjOGE0YjY0MTQxOTA0YmEvdWNtMi9jb2RlY3MvcnQ3MTEtc2RjYS9pbml0LmNvbmYj
TDcNCj4gPiBvZiAiRlUwRiBDYXB0dXJlIFN3aXRjaCIgc2V0dGluZyBuZWVkcyB0byBiZSByZW1v
dmVkLg0KPiA+DQo+ID4+IEkgbWVhbiAiQSBDYXB0dXJlIFN3aXRjaCIgKyAiQSBDYXB0dXJlIFZv
bHVtZSIgbm90ICJBIENhcHR1cmUgU3dpdGNoIg0KPiA+PiArICJCIENhcHR1cmUgVm9sdW1lIi4N
Cj4gPg0KPiA+IFdlIGNvdWxkbid0IGZpbmQgYSBwcm9wZXIgY29kZWMga2NvbnRyb2wgZm9yIFJU
NzExIGNhcHR1cmUuIFNvIHdlIGhhdmUNCj4gPiB0byBjb250aW51ZSB1c2luZyBQR0Ega2NvbnRy
b2wuDQo+IA0KPiBJdCdzIHJlYWxseSBjb25mdXNpbmcgdGhlbi4gV2hhdCBkb2VzICJGVTBGIENh
cHR1cmUgVm9sdW1lIiA/IEl0J3MgcmVhbGx5DQo+IGRpZmZpY3VsdCB0byBqdWRnZSBzb21ldGhp
bmcgd2hlbiBJIGRvbid0IGtub3cgdGhlIGNvZGVjIGRpYWdyYW0uDQoNCiJGVTBGIENhcHR1cmUg
Vm9sdW1lIiB3aWxsIHN0aWxsIGNvbnRyb2wgdGhlIHZvbHVtZSBvZiBydDcxMSBjYXB0dXJlLg0K
QnV0ICJGVTBGIENhcHR1cmUgU3dpdGNoIiB3aWxsIGJlIHJlbW92ZWQuIEJlY2F1c2UgREFQTSBp
cyB1c2luZw0KdGhpcyB0aGUgc2FtZSBub2RlLiBUaGVzZSBpcyBhIGNvbmZsaWN0IHdoZW4gd2Ug
ZG8gYmVsb3c6DQoxLiBtdXRlICJGVTBGIENhcHR1cmUgU3dpdGNoIi4gQW5kIHRoZSBrY29udHJv
bCB3aWxsIG11dGUgdGhlDQogICAgQ29ycmVzcG9uZGluZyBub2RlIGluIGNvZGVjLg0KMi4gdXNl
IGFyZWNvcmQgdG8gY2FwdHVyZSBmcm9tIHRoZSBydDcxMS1zZGNhIGhlYWRzZXQNCjMuIERBUE0g
d2lsbCBhdXRvIHVubXV0ZSB0aGUgbm9kZSB3aGljaCAiRlUwRiBDYXB0dXJlIFN3aXRjaCIgaGFz
IA0KICAgICBtdXRlZC4NCjQuIFNvIHdlIHdpbGwgY2FwdHVyZSB0aGUgc291bmQsIGV2ZW4gIkZV
MEYgQ2FwdHVyZSBTd2l0Y2giIHNob3dzIHRoZSANCiAgICBzdGF0ZSBpcyAibXV0ZWQiICh0aGlz
IGlzIHdyb25nKQ0KDQpTbyBTaHVtaW5nIGRlY2lkZWQgdG8gcmVtb3ZlIHRoZSAiRlUwRiBDYXB0
dXJlIFN3aXRjaCIga2NvbnRyb2wuDQoNCj4gDQo+IEFueXdheSwgdGhlIHN3aXRjaCBhbmQgdm9s
dW1lIGZvciB0aGUgZ2l2ZW4gSS9PIHNob3VsZCBoYXZlIGlkZW50aWNhbCBuYW1lDQo+IGFuZCB0
aGV5IHNob3VsZCBkaWZmZXIgb25seSBpbiB0aGUgc3VmZml4IGRlc2NyaWJpbmcgdGhlIHN0cmVh
bSBhbmQNCj4gZnVuY3Rpb25hbGl0eS4NCg0KV2Ugd29uJ3QgdG91Y2ggIkNhcHR1cmVTd2l0Y2gi
IGFuZCAiQ2FwdHVyZVZvbHVtZSIgZm9yIHJ0NzExLXNkY2EuDQoNClRoZSBwYXRjaCB3aWxsIGJl
IGxpa2Ugd2hhdCBJIHN1Ym1pdHRlZCBqdXN0IG5vdzoNCmh0dHBzOi8vZ2l0aHViLmNvbS9hbHNh
LXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzg5DQoNClJlZ2FyZHMsDQpMaWJpbg0KDQo+IA0K
PiAJCQkJCQlKYXJvc2xhdg0KPiANCj4gPg0KPiA+IFJlZ2FyZHMsDQo+ID4gTGliaW4NCj4gPg0K
PiA+Pg0KPiA+PiAJCQkJCQlKYXJvc2xhdg0KPiA+Pg0KPiA+Pj4NCj4gPj4+IFJlZ2FyZHMsDQo+
ID4+PiBMaWJpbg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4NCj4gPj4+Pj4gLS0t
DQo+ID4+Pj4+ICAgc291bmQvc29jL2NvZGVjcy9ydDcxMS1zZGNhLmMgfCA4IC0tLS0tLS0tDQo+
ID4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pDQo+ID4+Pj4+DQo+ID4+Pj4+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzExLXNkY2EuYw0KPiA+Pj4+PiBiL3Nv
dW5kL3NvYy9jb2RlY3MvcnQ3MTEtDQo+ID4+Pj4gc2RjYS5jDQo+ID4+Pj4+IGluZGV4IGJmYjdm
MWM4ZWM4Zi4uMmEwOWMzMDVmNGU0IDEwMDY0NA0KPiA+Pj4+PiAtLS0gYS9zb3VuZC9zb2MvY29k
ZWNzL3J0NzExLXNkY2EuYw0KPiA+Pj4+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzExLXNk
Y2EuYw0KPiA+Pj4+PiBAQCAtNjUyLDE0ICs2NTIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNu
ZF9rY29udHJvbF9uZXcNCj4gPj4+PiBydDcxMV9zZGNhX3NuZF9jb250cm9sc1tdID0gew0KPiA+
Pj4+PiAgIAkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+ID4+Pj4gUlQ3MTFf
U0RDQV9FTlRfVVNFUl9GVTA1LCBSVDcxMV9TRENBX0NUTF9GVV9WT0xVTUUsIENIX1IpLA0KPiA+
Pj4+PiAgIAkJMHg1NywgMHg1NywgMCwNCj4gPj4+Pj4gICAJCXJ0NzExX3NkY2Ffc2V0X2dhaW5f
Z2V0LCBydDcxMV9zZGNhX3NldF9nYWluX3B1dCwNCj4gPj4+PiBvdXRfdm9sX3RsdiksDQo+ID4+
Pj4+IC0JU09DX0RPVUJMRV9SKCJGVTFFIENhcHR1cmUgU3dpdGNoIiwNCj4gPj4+Pj4gLQkJU0RX
X1NEQ0FfQ1RMKEZVTkNfTlVNX01JQ19BUlJBWSwNCj4gPj4+PiBSVDcxMV9TRENBX0VOVF9VU0VS
X0ZVMUUsIFJUNzExX1NEQ0FfQ1RMX0ZVX01VVEUsIENIX0wpLA0KPiA+Pj4+PiAtCQlTRFdfU0RD
QV9DVEwoRlVOQ19OVU1fTUlDX0FSUkFZLA0KPiA+Pj4+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUx
RSwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hfUiksDQo+ID4+Pj4+IC0JCTAsIDEsIDEpLA0K
PiA+Pj4+PiAtCVNPQ19ET1VCTEVfUigiRlUwRiBDYXB0dXJlIFN3aXRjaCIsDQo+ID4+Pj4+IC0J
CVNEV19TRENBX0NUTChGVU5DX05VTV9KQUNLX0NPREVDLA0KPiA+Pj4+IFJUNzExX1NEQ0FfRU5U
X1VTRVJfRlUwRiwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hfTCksDQo+ID4+Pj4+IC0JCVNE
V19TRENBX0NUTChGVU5DX05VTV9KQUNLX0NPREVDLA0KPiA+Pj4+IFJUNzExX1NEQ0FfRU5UX1VT
RVJfRlUwRiwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hfUiksDQo+ID4+Pj4+IC0JCTAsIDEs
IDEpLA0KPiA+Pj4+PiAgIAlTT0NfRE9VQkxFX1JfRVhUX1RMVigiRlUxRSBDYXB0dXJlIFZvbHVt
ZSIsDQo+ID4+Pj4+ICAgCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fTUlDX0FSUkFZLA0KPiA+Pj4+
IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUxRSwgUlQ3MTFfU0RDQV9DVExfRlVfVk9MVU1FLCBDSF9M
KSwNCj4gPj4+Pj4gICAJCVNEV19TRENBX0NUTChGVU5DX05VTV9NSUNfQVJSQVksDQo+ID4+Pj4g
UlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLCBSVDcxMV9TRENBX0NUTF9GVV9WT0xVTUUsIENIX1Ip
LA0KPiA+Pj4+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiBKYXJvc2xhdiBLeXNlbGEgPHBl
cmV4QHBlcmV4LmN6Pg0KPiA+PiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7
IFJlZCBIYXQsIEluYy4NCj4gDQo+IA0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBl
cmV4LmN6Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQs
IEluYy4NCg==
