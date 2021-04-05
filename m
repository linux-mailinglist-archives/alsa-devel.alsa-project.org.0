Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC535422C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 14:49:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A988A169D;
	Mon,  5 Apr 2021 14:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A988A169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617626946;
	bh=d6no7K2C+Qytf3pJwvSH03/f83OK8XKHX4OZtntBH/0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5+869dYXPyQn8K1IqAD8UZszJBToKW1R32WI5M+zMRUrSlIeHs2PgD7Bhf3B8MC8
	 cLw6t61FSD9nMTggimebdVVOhAwGukVjaJKygWv5XlAoCCd+TnByzg3xjZZceL3VK8
	 FgyrjARJgur3SmJ4kptqU5exyKkSbzw0pD7AsWu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DD53F8003A;
	Mon,  5 Apr 2021 14:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9564F8016A; Mon,  5 Apr 2021 14:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B95F80164
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 14:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B95F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="rMxaGzcU"
IronPort-SDR: s3n2wcEi90y/j1l9+KrUhssGWbKln6IUHZ1dLv/fokAbPSDdqNfn/5kVTnzuOn4hqi0I+2cV8Z
 fbP+NZc2x+Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="189620188"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="189620188"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 05:47:28 -0700
IronPort-SDR: Eah0yAQu4ctmq3epNCme+w29U9jBeeKQxFfkjrOkuhg+9ZTKFSOcy8+hmVylm3QC2tHO+EyvF2
 OuwIitilvqzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="378955838"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 05 Apr 2021 05:47:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 5 Apr 2021 05:47:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 5 Apr 2021 05:47:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 5 Apr 2021 05:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyFnlF6cKnnTql2JRs2afUFwvugps8B2o0nOlwuSJIEboMcWs4nhrsrsI1kGIdDDTmneCysjyh7GUL/wFpABDfFqnTYQHTp7YU4293WW8wjnR+wMWJKXQ+B8aSz3zq+qIJDH4FKu4KU6PZTdy7x36sea9tagoZ1l2Tu5xn3WygZzNS6Dyt4DBP5j3NrzyHzTu7dSi2FOWnXXSi9BKQo4yMltNK7avlauRgwXwCvlgRyi8MGJoavlj9z9bCTvbHdAzSesE0J2WChy2wPHj63qxW5t00d4kh60JITuW/7nxwH5vp+zLGi/yOKlLXhQvajUG+8GHPlBK/zrMRywe9wxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6no7K2C+Qytf3pJwvSH03/f83OK8XKHX4OZtntBH/0=;
 b=lqQivTgIbhBZgr04d1ViQc1xbxN5uJcBIoUE9mK6mpOl7E/49xGgKAP/Ub6MBwVQ5VPZ8L6YSloXJI0rPecYQ9YgpgGSO6Ps4Dv2XlRhH+b60MNjhRhTcFtsW2OYyT6/mmJBS/1vK3jSumc0YA08/mf9vF11OKo9BtYp6Ab5EYvAAyLmD9VN8cQb6DVTGQ5GohDBZKIZojUSssp0M/PqxerobB7M7iOqbDZDkph+juy8s6iobphlZVxDDIrXQ1MXIagtUHE991s+DTMV7PLoG2RO183y4Ni2nOKR+KwZH6CTkdRYlG2cbUqqWKeWD/wBR0Z3KfNU8Fczp9ASHwLAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6no7K2C+Qytf3pJwvSH03/f83OK8XKHX4OZtntBH/0=;
 b=rMxaGzcUqUl2UZK6RwvnoPR4CyMA6bb9mGCKtaWzP7ASByzeVyrAE2b2VB1QhgCdjiPbsb0NA3zehT5WBh4yRcTC8/bcK9AJ7cs7E/vXBGUa/m6KDj782EsmePwBDleoZTf9+1Cm2G08LykRZQDeQ6sYUU/qGux1JOVeCfZ6U34=
Received: from BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12)
 by BYAPR11MB3015.namprd11.prod.outlook.com (2603:10b6:a03:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Mon, 5 Apr
 2021 12:47:25 +0000
Received: from BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::e9ed:af43:83bb:e111]) by BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::e9ed:af43:83bb:e111%5]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 12:47:25 +0000
From: "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 1/2] ASoC: Intel: kbl: Add MST route change to kbl
 machine drivers
Thread-Topic: [PATCH v2 1/2] ASoC: Intel: kbl: Add MST route change to kbl
 machine drivers
Thread-Index: AQHXIZ6QH92BrPFAIky+m7q0rhZz66qeiKyAgAdlNnA=
Date: Mon, 5 Apr 2021 12:47:25 +0000
Message-ID: <BYAPR11MB2870898E181FBC088D24645CD6779@BYAPR11MB2870.namprd11.prod.outlook.com>
References: <20210325174325.31802-1-vamshi.krishna.gopal@intel.com>
 <20210325174325.31802-2-vamshi.krishna.gopal@intel.com>
 <f1333fc3-afcc-d27b-7f37-17a37e9c5580@linux.intel.com>
In-Reply-To: <f1333fc3-afcc-d27b-7f37-17a37e9c5580@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [106.51.235.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a61b60d8-70f0-4fae-043c-08d8f830f6b1
x-ms-traffictypediagnostic: BYAPR11MB3015:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3015DC00D1275DCE64E350EFD6779@BYAPR11MB3015.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qqGlllCGhbXmWkx2n/nsCjcuM3Y+NEkCok5lAYVXTYsHkvaSMDb6rby+xA5/pwmBDkbkFQVQcAIeNxIhbdzntLBKG52TZcEFnwh+i1/DIc83K5c/Jj8pEJi7GAk/Lm2KgNn3i0weZiHxiGqd6qUqJn68sqb7kOczeeV9OSAqbZFKHetEHDwylADr3B7+xn0OFk1RgGnECoWMWLb59wKFquv4HsDC1fS7dgHRU+nWrAfwJNQoE2PXj0PstS7iTYuGxQcX/5nufBBc6EXx0m5XPMwcWjpJnURHueHQbxysKgCRkXyzCuTVQJrzbGAeZHc527lrM/mO+UcH9uwpDvpcXv0wb32q32nVCXsult1y3y4c9o51wS08GWOeU7ZxfP0vSIu6Ewb6BVuapacpyYH1Qwom/1xg4cY44BsRXlUqNo1T/bWrM10fHBEsLaYGmaIvMtbUZYmzB57w+TotjmEWcFKPA09KQNt4pI0QvsFNIErAhegloysUKLSWpmpYBEvm2OvsfyAMy/ewE0vIO5aP6robQ6S7hnF3bsMVNL8nKYeV1vv6tjG0+G0gPEQXEWVHJYy0iTa/YkvWxTczeF/+wbj3HQFAeAzHjJ2HlzkAT0satGyBdeQ8q6Qka9VKWfvah/xetZOV8T7CSp4V42qgdvm3gDrK/i31HbcH+DztvfA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2870.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(39860400002)(136003)(5660300002)(8936002)(55016002)(33656002)(54906003)(38100700001)(76116006)(66476007)(316002)(7696005)(478600001)(26005)(110136005)(55236004)(4326008)(9686003)(66946007)(83380400001)(86362001)(8676002)(64756008)(186003)(66446008)(2906002)(52536014)(71200400001)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z0U4a2tzYVNTWU44emxwY05kdis3emlrZ1p3NkM1Nk9JcHh4Ym12WmNBNHNS?=
 =?utf-8?B?TExROVU2RWlNditpZ2JVSXlhTDR5cHF0amxQa3lvV2drVEMxUUFCcU93QzlG?=
 =?utf-8?B?YktlYjZmclRkN1Z1VjAwTUJlNFdqd3F3Y0FLVEF4M1NhaFFaRGVMWFhzT1ZJ?=
 =?utf-8?B?V1gyNFg1ZEZZUXE5cWJSNk9Qc1o5ajNZd2VXV3BkeXlqQ3ZrM3RnaHJvRDNz?=
 =?utf-8?B?dUR1ZDcxa2dVSDE5MEc0cFRXcUcrL0lyd1ZRTWVyVGlyRmNKV2JPaWNMRk5F?=
 =?utf-8?B?Z2pJdE9wQ0I4aEp5VjE1NWZvd1FOa1pWeXJzUnBpdGpET3dZSlFLVS9NMzMw?=
 =?utf-8?B?TWNEcTVoVnowaTdkdnN0RUQrWS9STkFRVjVxOXMrbWNkUllUd1FRbWVZRGhR?=
 =?utf-8?B?cHNIWVFHUWtXMUpDbFBNWm1PUDFpMGhzQ1poTlJ6NDFvQnQ2dEQ4YlFmMW1P?=
 =?utf-8?B?M05qOGdBTzVsNmlNSy9lcDVQT3dHVm5OeWN0Tk5pVXNRZjlpWjZYVXRTcEtL?=
 =?utf-8?B?Sm9CZnMyRkVVcVNVNG1wLzNGamVuaXpjSnZJbXFjNUNtOWluRGVYemxidkYy?=
 =?utf-8?B?dVdvbzlSc3ZYUThlZ3BBTEdpenAvVHhHbHVQVmxxc1Q5K3VRTlVhK3psbzBa?=
 =?utf-8?B?SStHQ2Z2L3ZHTTc5UVlySWhqUmNzQ1krc3pDVXpidnhrUDhtaE1Vb29CQktT?=
 =?utf-8?B?Mm4xbVdJVnB1cUhJaThrYmlkUURQMnFJSEU3ZkNKMU1GcytxSDAzY0dPQStR?=
 =?utf-8?B?dnlXTXg1ck5sN1AyWk1adFNsTldLVlRWOXhoRWpZWVpEemo0M3g0Y2ZXcVFJ?=
 =?utf-8?B?ZFg2czNwRVZZTEtEMG02NHAwOWxOdGhGU3VyNm93UVJyK2tMb1FycFFDV2ZE?=
 =?utf-8?B?aEhXbndqajJ6WGpscTVUdFRVK2h0YjU1MFk5aDE5K0Ztdk1iUDVSdE80Znlj?=
 =?utf-8?B?QlBWMUVpT2lwWVNrZkNEWTBtbUlrMVlBMllPNjVDQXloRGxEa3hQRmpkQ1kz?=
 =?utf-8?B?d2k1SmxXdzdWREZBNlZZTDZvck9MTjg4NHlZSnVkc3NGendyb2NoVkpTQmEz?=
 =?utf-8?B?cUllOHVEZVc5RlFQYUd1dGRLNEhJSXU4YVcvTURRbElpUkVRUThKNEJPbjNJ?=
 =?utf-8?B?UFlmQ0krWFVQWHVzUDFxRGg0VVJVNUpuVUl4aVV5cmQwWEwraWM4VkdLZUEz?=
 =?utf-8?B?TU91eSs2T21MRVpJR1pmb1pEK1ViZkIwRDBsb0UxeVh4b2dOckFzZFk0T29F?=
 =?utf-8?B?UW9jeFVya0xlMHBjejlQbmVVN1d1MGk3ZkFwbEhyVnBZNVBNZEhZdVh1d2ts?=
 =?utf-8?B?eHMxQ045Y0Q5Wmd6UHVFRmxpc0VVNmlrWjVKS1lqay8vdnJLN291blFFSzlI?=
 =?utf-8?B?RUhhaElzUEZMekVRVXg4WmxzeGx6YUpsbkRMc2pjSk95elhSWFptT2JaOWdL?=
 =?utf-8?B?NnlCd3ErSCtocW9qLzYzTG03WnErNEVwMzFWaUhBeVV1dThCVmNMSHdKRU5T?=
 =?utf-8?B?ZDBjWVUybDJHeGdqWm9CS3RPMmtkd2Z6WFcyKzBRVXpsL3JpYjVzSWh2WkJJ?=
 =?utf-8?B?bFl0dzcvSHlqZTlGQ3JOU3RJMlAwVDgvbks2cmNaTjRlODRmc1N4NU93ZnM3?=
 =?utf-8?B?VU5SeS9qQWFFTStVMlRIc1A4cUF2cGJXL2JQOGRTTUJvUWd1a2JlVTZIYlFU?=
 =?utf-8?B?bThaM0dycnVTdGFBUUtYaDcxWHFUSGQwUTBCb0lRekRtMDdPTmF6aUduMElr?=
 =?utf-8?Q?JmdgJr3BJ+HdyLuCG4mUllE75CV7KBYCb87BCGh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2870.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61b60d8-70f0-4fae-043c-08d8f830f6b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 12:47:25.2570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkJfEt5rumt0ijM52JV9AOaMBkcumgf0tGoR/U7/iv4ai9y7skojr9A1dxQ365JcQ2vBmJpwrn1DtGT3UOE554fWM2mAqfc3fdZlhQ2+i/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3015
X-OriginatorOrg: intel.com
Cc: "N, Harshapriya" <harshapriya.n@intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "M R, 
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 "biernacki@google.com" <biernacki@google.com>, "Bossart,
 Pierre-louis" <pierre-louis.bossart@intel.com>
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

PiBrYWJ5bGFrZV93aWRnZXRzW10gPSB7DQo+ID4gICAJU05EX1NPQ19EQVBNX1NQSygiU3BrIiwg
TlVMTCksDQo+ID4gICAJU05EX1NPQ19EQVBNX01JQygiU29DIERNSUMiLCBOVUxMKSwNCj4gPiAg
IAlTTkRfU09DX0RBUE1fU1BLKCJEUCIsIE5VTEwpLA0KPiA+IC0JU05EX1NPQ19EQVBNX1NQSygi
SERNSSIsIE5VTEwpLA0KPiANCj4gc28gaGVyZSB5b3Uga2VlcCB0aGUgRFAgYnV0IHJlbW92ZSBI
RE1JDQo+IA0KPiA+ICsJU05EX1NPQ19EQVBNX1NQSygiSERNSTEiLCBOVUxMKSwNCj4gPiArCVNO
RF9TT0NfREFQTV9TUEsoIkhETUkyIiwgTlVMTCksDQo+ID4gKwlTTkRfU09DX0RBUE1fU1BLKCJI
RE1JMyIsIE5VTEwpLA0KPiA+ICAgCVNORF9TT0NfREFQTV9TVVBQTFkoIlBsYXRmb3JtIENsb2Nr
IiwgU05EX1NPQ19OT1BNLCAwLCAwLA0KPiA+ICAgCQkJcGxhdGZvcm1fY2xvY2tfY29udHJvbCwg
U05EX1NPQ19EQVBNX1BSRV9QTVUNCj4gfA0KPiA+ICAgCQkJU05EX1NPQ19EQVBNX1BPU1RfUE1E
KSwNCj4gPiBAQCAtMTA4LDggKzExMCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19k
YXBtX3JvdXRlDQo+IGthYnlsYWtlX21hcFtdID0gew0KPiA+ICAgCXsgIk1JQyIsIE5VTEwsICJI
ZWFkc2V0IE1pYyIgfSwNCj4gPiAgIAl7ICJETWljIiwgTlVMTCwgIlNvQyBETUlDIiB9LA0KPiA+
DQo+ID4gLQl7ICJIRE1JIiwgTlVMTCwgImhpZjUgT3V0cHV0IiB9LA0KPiA+IC0JeyAiRFAiLCBO
VUxMLCAiaGlmNiBPdXRwdXQiIH0sDQo+IA0KPiBidXQgaGVyZSB5b3UgcmVtb3ZlIGJvdGg/IEkg
Z3Vlc3MgeW91IGZvcmdvdCB0byByZW1vdmUgRFAgZWFybGllcj8NCg0KW0dvcGFsLCBWYW1zaGkg
S3Jpc2huYV0gIHllcywgSSBmb3Jnb3QgdG8gcmVtb3ZlIERQIHVwZGF0ZWQgaW4gdjMNCj4gDQo+
ID4gKwl7IkhETUkxIiwgTlVMTCwgImhpZjUtMCBPdXRwdXQifSwNCj4gPiArCXsiSERNSTIiLCBO
VUxMLCAiaGlmNi0wIE91dHB1dCJ9LA0KPiA+ICsJeyJIRE1JMyIsIE5VTEwsICJoaWY3LTAgT3V0
cHV0In0sDQo+ID4NCj4gPiAgIAkvKiBDT0RFQyBCRSBjb25uZWN0aW9ucyAqLw0KPiA+ICAgCXsg
IkhpRmkgUGxheWJhY2siLCBOVUxMLCAic3NwMCBUeCIgfSwgZGlmZiAtLWdpdA0KPiA+IGEvc291
bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfZGE3MjE5X21heDk4OTI3LmMNCj4gPiBiL3NvdW5kL3Nv
Yy9pbnRlbC9ib2FyZHMva2JsX2RhNzIxOV9tYXg5ODkyNy5jDQo+ID4gaW5kZXggY2M5YTI1MDlh
Y2UyLi5lOGRjMjkxYjE3NDkgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJk
cy9rYmxfZGE3MjE5X21heDk4OTI3LmMNCj4gPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYm9hcmRz
L2tibF9kYTcyMTlfbWF4OTg5MjcuYw0KPiA+IEBAIC0xMTIsNyArMTEyLDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0DQo+IGthYnlsYWtlX3dpZGdldHNbXSA9IHsN
Cj4gPiAgIAlTTkRfU09DX0RBUE1fU1BLKCJSaWdodCBTcGsiLCBOVUxMKSwNCj4gPiAgIAlTTkRf
U09DX0RBUE1fTUlDKCJTb0MgRE1JQyIsIE5VTEwpLA0KPiA+ICAgCVNORF9TT0NfREFQTV9TUEso
IkRQIiwgTlVMTCksDQo+ID4gLQlTTkRfU09DX0RBUE1fU1BLKCJIRE1JIiwgTlVMTCksDQo+ID4g
KwlTTkRfU09DX0RBUE1fU1BLKCJIRE1JMSIsIE5VTEwpLA0KPiA+ICsJU05EX1NPQ19EQVBNX1NQ
SygiSERNSTIiLCBOVUxMKSwNCj4gPiArCVNORF9TT0NfREFQTV9TUEsoIkhETUkzIiwgTlVMTCks
DQo+ID4gICAJU05EX1NPQ19EQVBNX1NVUFBMWSgiUGxhdGZvcm0gQ2xvY2siLCBTTkRfU09DX05P
UE0sIDAsIDAsDQo+ID4gICAJCQlwbGF0Zm9ybV9jbG9ja19jb250cm9sLCBTTkRfU09DX0RBUE1f
UFJFX1BNVQ0KPiB8DQo+ID4gICAJCQlTTkRfU09DX0RBUE1fUE9TVF9QTUQpLA0KPiA+IEBAIC0x
MjYsOCArMTI4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUNCj4g
a2FieWxha2VfbWFwW10gPSB7DQo+ID4gICAJLyogb3RoZXIgamFja3MgKi8NCj4gPiAgIAl7ICJE
TWljIiwgTlVMTCwgIlNvQyBETUlDIiB9LA0KPiA+DQo+ID4gLQl7ICJIRE1JIiwgTlVMTCwgImhp
ZjUgT3V0cHV0IiB9LA0KPiA+IC0JeyAiRFAiLCBOVUxMLCAiaGlmNiBPdXRwdXQiIH0sDQo+ID4g
Kwl7IkhETUkxIiwgTlVMTCwgImhpZjUtMCBPdXRwdXQifSwNCj4gPiArCXsiSERNSTIiLCBOVUxM
LCAiaGlmNi0wIE91dHB1dCJ9LA0KPiA+ICsJeyJIRE1JMyIsIE5VTEwsICJoaWY3LTAgT3V0cHV0
In0sDQo+ID4NCj4gPiAgIAkvKiBDT0RFQyBCRSBjb25uZWN0aW9ucyAqLw0KPiA+ICAgCXsgIkxl
ZnQgSGlGaSBQbGF5YmFjayIsIE5VTEwsICJzc3AwIFR4IiB9LCBkaWZmIC0tZ2l0DQo+ID4gYS9z
b3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2NjNfbWF4OTg5MjcuYw0KPiA+IGIvc291bmQv
c29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1NjYzX21heDk4OTI3LmMNCj4gPiBpbmRleCA5YTRiM2Qw
OTczZjYuLmNiNzk5MDgyM2QzNSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9h
cmRzL2tibF9ydDU2NjNfbWF4OTg5MjcuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9ib2Fy
ZHMva2JsX3J0NTY2M19tYXg5ODkyNy5jDQo+ID4gQEAgLTE1MSw2ICsxNTEsMTAgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUNCj4ga2FieWxha2VfbWFwW10gPSB7DQo+
ID4gICAJeyAiSU4xTiIsIE5VTEwsICJIZWFkc2V0IE1pYyIgfSwNCj4gPiAgIAl7ICJETWljIiwg
TlVMTCwgIlNvQyBETUlDIiB9LA0KPiA+DQo+ID4gKwl7IkhETUkxIiwgTlVMTCwgImhpZjUtMCBP
dXRwdXQifSwNCj4gPiArCXsiSERNSTIiLCBOVUxMLCAiaGlmNi0wIE91dHB1dCJ9LA0KPiA+ICsJ
eyJIRE1JMyIsIE5VTEwsICJoaWY3LTAgT3V0cHV0In0sDQo+ID4gKw0KPiA+ICAgCS8qIENPREVD
IEJFIGNvbm5lY3Rpb25zICovDQo+ID4gICAJeyAiTGVmdCBIaUZpIFBsYXliYWNrIiwgTlVMTCwg
InNzcDAgVHgiIH0sDQo+ID4gICAJeyAiUmlnaHQgSGlGaSBQbGF5YmFjayIsIE5VTEwsICJzc3Aw
IFR4IiB9LA0KPiANCj4gV2hhdCBhYm91dCB0aGUgb3RoZXIgcm91dGluZyB0YWJsZT8NCj4gDQo+
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBrYWJ5bGFrZV81NjYzX3dp
ZGdldHNbXSA9IHsNCj4gCVNORF9TT0NfREFQTV9IUCgiSGVhZHBob25lIEphY2siLCBOVUxMKSwN
Cj4gCVNORF9TT0NfREFQTV9NSUMoIkhlYWRzZXQgTWljIiwgTlVMTCksDQo+IAlTTkRfU09DX0RB
UE1fU1BLKCJEUCIsIE5VTEwpLA0KPiAJU05EX1NPQ19EQVBNX1NQSygiSERNSSIsIE5VTEwpLA0K
PiANCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUga2FieWxha2VfNTY2
M19tYXBbXSA9IHsNCj4gCXsgIkhlYWRwaG9uZSBKYWNrIiwgTlVMTCwgIlBsYXRmb3JtIENsb2Nr
IiB9LA0KPiAJeyAiSGVhZHBob25lIEphY2siLCBOVUxMLCAiSFBPTCIgfSwNCj4gCXsgIkhlYWRw
aG9uZSBKYWNrIiwgTlVMTCwgIkhQT1IiIH0sDQo+IA0KPiAJLyogb3RoZXIgamFja3MgKi8NCj4g
CXsgIkhlYWRzZXQgTWljIiwgTlVMTCwgIlBsYXRmb3JtIENsb2NrIiB9LA0KPiAJeyAiSU4xUCIs
IE5VTEwsICJIZWFkc2V0IE1pYyIgfSwNCj4gCXsgIklOMU4iLCBOVUxMLCAiSGVhZHNldCBNaWMi
IH0sDQo+IA0KPiAJeyAiSERNSSIsIE5VTEwsICJoaWY1IE91dHB1dCIgfSwNCj4gCXsgIkRQIiwg
TlVMTCwgImhpZjYgT3V0cHV0IiB9LA0KPiANCj4gaXQnZCBiZSBnb29kIHRvIGJlIGNvbnNpc3Rl
bnQsIHdvdWxkbid0IGl0Pw0KW0dvcGFsLCBWYW1zaGkgS3Jpc2huYV0geWVzICwgbXkgYmFkIEkg
bWlzc2VkIHRoZSBvdGhlciByb3V0ZSB0YWJsZSwgdXBkYXRlZCBpbiB2MyANCg0K
