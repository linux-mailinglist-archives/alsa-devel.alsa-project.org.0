Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF52364F65
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 02:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18711683;
	Tue, 20 Apr 2021 02:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18711683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618877937;
	bh=bO5CBxgLy3mnjB1yE5n8CoyTX3l245A2uOC2HPveswI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhP/SRiRiIa2wfrX3cTTGh7/5Ghs8//3FkSxrW/S3x5xzuhD9SFUrUZv2GeUf3jtP
	 1jTFtKlE6+yvdWgQ6Htk+PnUAtaNWAFNV38k+pAuzMLVDlfs6Q3uh/rs7A4GCdZ3Z3
	 HNqpvGAf82fhk0S/2yIcMS2aXGroSrWA67Zet6Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63802F8014D;
	Tue, 20 Apr 2021 02:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEFA6F80227; Tue, 20 Apr 2021 02:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F4FF800C5
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 02:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F4FF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="QsZ1Eq9A"
IronPort-SDR: 7SxyUjRAQuM303y7d4fUAF9R/1l82yhVS7uEM6eC7itMaI8rAMQ4fLUEk4to+fDvEd2boEuDJp
 2XDwCpAdU1gA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="280745437"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="280745437"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 17:17:10 -0700
IronPort-SDR: CtMNv1Gsb4ZLL3TLU5UL5utYxIvKQfLFQGFNbSpaPPCMmzo7wTSJlNQc46p9E1j92zTVV+C4g9
 6DXvVKure5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="454528570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2021 17:17:10 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 17:17:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 19 Apr 2021 17:17:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 19 Apr 2021 17:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS2FrWD4d/hwRKsjB5qHqlmNbbF2vxxuolOGUBKo4DcZ66IrsFeXE9I/Z1+6nODEflxd7iWxuki+ejo86RBhhmkMcxQ+X11IPJ+IGTNAQ+ahiNaDuarThpuk/IolANgFAQQUebYtdSAYKwTT9JdNuANdUjVtQA8KzsXo4uayxBHlbhB0udxNkO6WcEYGSzi6KOOfqih3wv9cEXzGg1velWEL1tBJT0xdRNv9s53PrGNp1Ft5Urd9ORw+VTvjUta+ZUbbni5xSSqaBCaPCHYhRMY3CBj+zlY43Gtc6xWmz7PMffSsZxpLhPRWzZNkftg2btc1Xq2dDZYvOVZj2caTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO5CBxgLy3mnjB1yE5n8CoyTX3l245A2uOC2HPveswI=;
 b=Ez3nSZkQE5SSuqMMmFyIXdOH4BLEY8LIyndkyp+EdMCzn72scsbZDtGGyXkbKN3uUWYFuvpPgn9oHzehUvLtdGLgW7eWAp05R1dv8qOk0l4JcAGp43MlydLKbXtXpur5RMdZYSVHryy2/JknNfK8lH/o7Oa4kkTjcD+97B0TCGwTmQc4C0ulNlgPzHPgGyf816mnH7Zph/8ciDf+fsce9CotoQD+tW6dyjCizX9R1vO9e9vrOrZhVrqxMOnKqz8YutEJFjZSd4y7mC37VFWRs+M95n5+d3zdp72lRBhTCACqO1jqrKvKYKMYZsngEm4e9xApAz4RvT3+9oYDyTaXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO5CBxgLy3mnjB1yE5n8CoyTX3l245A2uOC2HPveswI=;
 b=QsZ1Eq9AnhcgLX1Pt0gGDQrVk6WHf06NHViUgwkuX110MnzPF9oF5yOUJVhYRQar2MeGapVXP+xAd7OHuETSI5qo4j2La0cKNt3Rp67cGoLgPRet1ShPN8C6NsPjrKQ98l1fsQJ0GQOeW8cajof3NSGsmC/YOYRYCB37aFebZbI=
Received: from MWHPR11MB1663.namprd11.prod.outlook.com (2603:10b6:301:d::15)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 00:17:09 +0000
Received: from MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe]) by MWHPR11MB1663.namprd11.prod.outlook.com
 ([fe80::b5c3:c9cd:ef1:e2fe%3]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 00:17:09 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "shumingf@realtek.com"
 <shumingf@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Topic: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Index: AQHXMdgjKGxZxqCQzUO3d8W4zJrgf6q1cGQAgAXfzHCAABeWgIAAAuvggAAD+wCAAAKc8IAAHc0AgAD/CdA=
Date: Tue, 20 Apr 2021 00:17:08 +0000
Message-ID: <MWHPR11MB16631ECF778944604073DD9190489@MWHPR11MB1663.namprd11.prod.outlook.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
 <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
 <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
 <MWHPR11MB1663671582DCB35BE88C5B5590499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <606f8e2d-40d5-8de0-1a06-9c8da016652d@perex.cz>
 <MWHPR11MB1663B46AB115359FDBDDB29F90499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <d3aa7b7c-4384-9fd8-d814-e2bcbf0da9d2@perex.cz>
In-Reply-To: <d3aa7b7c-4384-9fd8-d814-e2bcbf0da9d2@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [61.152.208.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e674d57f-0099-4013-4a21-08d90391a318
x-ms-traffictypediagnostic: CO1PR11MB4881:
x-microsoft-antispam-prvs: <CO1PR11MB48816CD4E0BB7046B545076690489@CO1PR11MB4881.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9AX2Cno+Qc+1Ncm+qkDfBx5JWa6s95nip4QeX55Wzs2FMfxQ11IKFin36eIPrrfKYGbCRS8vVY7F6yq97JDYwhSkqk7+McuvQXbb1diVIOMBGEGsbnLGCfUvWxHuea6UpnQJG7G5cP6r75eK3R9YV9I55X0IqbJ2nsoDFsnir+ei5bvBffqNo8dCuZtD4vHHzM8etaTneA+5OajEtLfpdfY/4WrQHzgrjVISExneYq+C99KA0ialsKs5d9SW4SDQ3e8Sk8wxHKk0ZklxA/qlaHl0H1cwf2NOq30G0SQ35fReaYOlOIr4NMYYZ2RDFgFqwg6DxxIo5ikoDUfZMZnL4ncbIn9Gb2i0xGK27MUskhoEttW17F4DGwEn6Bbv1Ngt4TOALw0X7Cywr7zenOKsdWdN27AFiBYhcWUgLs675vOUCyC1GCdxpDxYB6EUhiUM/Wk8GyWkRJqBdBCFBfrUzLW8DBV4nwD66xX7UzUIUQUOgX0thlkdb0fszIB2IMDYTsCKNpIY+KpyjW9wpdm3kYMpahhtIOOyQO/bUN8gp4Q+aO8rTcWByETF4EngsMerxC+MraTiEBgoVgcbT2uQSlKk0Mmy9GuhHNOA+LQC1gqDhnD2omcHIhRjvctQz5yUcTeTYz8bDUIXsGfJ/MGu3qvLGF53MJ/WIPi41emH9EyAu9Ct0U8YPweYLif6oG7q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39860400002)(346002)(376002)(76116006)(7696005)(53546011)(33656002)(8936002)(71200400001)(64756008)(66556008)(8676002)(9686003)(122000001)(66476007)(66946007)(66446008)(38100700002)(26005)(52536014)(6506007)(110136005)(2906002)(316002)(86362001)(966005)(5660300002)(4326008)(478600001)(54906003)(186003)(55016002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M2YwcFJ3MUNBUS8ra2NEc2dXZndPVDNncnhKMStIYzUvUWkzSmdzSmZpMWx1?=
 =?utf-8?B?V1VMNy9xK04wdytJcnNEU29yeDV3bkh5Q1dPbmdMREl0UHppd1h4VE1Xd0lP?=
 =?utf-8?B?M2dGazl1eUMwNlBTSVRjVTJyN29JRjhLUGZickwyMXBzUVozcGRCOEEyUzRX?=
 =?utf-8?B?NENVN3hIemtrUjFQcUlHUm8xakYwSTUyYWlIelk0TC9Tb0V0dENLK0N4WGtW?=
 =?utf-8?B?RS9MMFFzOUlxRm1handxL0p0SXA0ZnByaktCZkgrR05Vb0w5ZW0ydXhFUlkz?=
 =?utf-8?B?QlB6Rmd6WVVwTk1QRGhnNW1HcTc1blY1LzlwemVFNlBGOXRwbE5VUm1xcG4z?=
 =?utf-8?B?dE03K0hncGV4Y1NuMFRKZ3hubmwvQi9FNjYxaE5XRkNXUEtvRngzS1JpRXZV?=
 =?utf-8?B?NmNrQmV6elpTQytBMkV5TEdRZ2J4U2trRUgzcjJtVStScW50ZjR3VDZ2M1Nq?=
 =?utf-8?B?MHIxeTlIeGtpSDE3eE4zK0QxUGxQakpkKzJnMk95UDBTVWsvY2VOTDIvWjhx?=
 =?utf-8?B?UnhIM0xxMDZsdjUyMXpLbjBCbnhhb2crNGUvSFFpMVZWQmVvWFMvSzBsL0pG?=
 =?utf-8?B?alRHQ3BtaWI2UHdrWFJJTS9wNk1wNkNvSVZieVY3cElja0QyN0ZZRDlEQm16?=
 =?utf-8?B?aFhReWkyenpOR1FhdXIvSjAwVXE3RVhBTXJnUTZMVnpmTk5GTnN3RWxYMGgr?=
 =?utf-8?B?MmJBMGhMNVUvc1Jkbi9nRmhtQURPeitiZjhkTjlPNGJHbS9tbTk5dGJ0YUI0?=
 =?utf-8?B?WDRLY2hxeVhSR09MRXhVK25iZXUydGRiSlpyNVZxMUd0eVcvUTIwVk4wZ3Rs?=
 =?utf-8?B?TVUwUlBEK05lc3U2dUFJV3pBdXp1NTEvZVhTdWNOR3lmWWcxTGhVbnBIQjYz?=
 =?utf-8?B?L0NET2ZYUlRHUHZOODR5RGRMeU5YQ2VkcEJURWpsSGxENTArcFFvZXRpbnlB?=
 =?utf-8?B?QUhiVzFKNGNmcUxrR3prZFkyUXVsUjVDVzFpd0ZWSzNvQ1ladkkyL2c3RWdF?=
 =?utf-8?B?c0lJQk5nSk9xaGxpeU5MdC9yTjBxSFhIRDlpc1hMSXRxLytOMGYyaUE5TE1R?=
 =?utf-8?B?NjJDRDdNQlhYY055OFRNMjh2Q2pYMVB1cVp0ZElRdDU3cm1Ccy9kYXpPckhE?=
 =?utf-8?B?U1NGV1pXYW8xZ0N3QU1INjlROUZMUjlZUzFaRFdyUUxSWWdSZHRINWNqOVhI?=
 =?utf-8?B?bVZTQURTMTU3eVdsQU1MOUI1RjRXQmt3WUVUTFNjWjZEbWY0WVdGdmU2eXdF?=
 =?utf-8?B?SHZtSVUyN1Q5L2Vrc21KZEZPbTBhSHVsN2c1QnNwdDdhRnZ4a01zU1ZBenVv?=
 =?utf-8?B?WWFMbUw2MmpHaC9Ma283K0Z3ejlXNlczWTJ4dFlNemQrTUsrc2tLc1o4dStD?=
 =?utf-8?B?d0dtTlNuNCs2Mkd3RFFCdGtGWlBaUjBNeVkydzRDNXVRMysrcThHRnp3cEhP?=
 =?utf-8?B?ZXhZeUM5K3YwWXptNk5NSzlveUdHQmc1dkdta2N5NTRSckd0Z0RHVkNNSzhq?=
 =?utf-8?B?Nkk5eWFJa3ZvOHhIbFh5MlBKOE00bGtwTjc5Sk0rc053QURJMlZmZWZkUEc4?=
 =?utf-8?B?bjJqaWlwWU1Hcld6V2wzWXlRWndOU1cwZ2FBdlM0Q1BhdndGVmJ3c3pNQkY3?=
 =?utf-8?B?U1A3bDhkUXY2WEpDNDZMVlJqVXRtNjVTQkJKRjMrdGhmTGJwZU9pR2cxNURU?=
 =?utf-8?B?aUh1NUhoQjdjWTNOQUh1RXhlSlR3bkpaeTFNcmorZjFSc2NQZVdqbDRjSit4?=
 =?utf-8?Q?/8RW4C5cELjXe9eSMWoXaicwW14yMAq9r2bgkhX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e674d57f-0099-4013-4a21-08d90391a318
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 00:17:08.9675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYQ6eOxn1fLBO7DpBdOWLehm1WZ/PCV/HsWxuBLwM9KIBhjX4zxSMjMEgOV5Tva8StHiPNlsg57ow4xpzTHktA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

SGkgSmFyb3NsYXYsDQoNCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gNC8xNS8yMSA0
OjE2IEFNLCBzaHVtaW5nZkByZWFsdGVrLmNvbSB3cm90ZToNCj4gPj4+Pj4+PiBGcm9tOiBTaHVt
aW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBUaGUg
c2V0dGluZ3Mgb2YgdGhlIHN3aXRjaCBjb250cm9sIGFscmVhZHkgc2V0IGJ5IERBUE0gZXZlbnQu
DQo+ID4+Pj4+Pj4gVGhlc2Ugc3dpdGNoIGNvbnRyb2xzIG1pZ2h0IHRoZSB1c2VyIGNvbmZ1c2Vk
IHdoeSBpdCBjYW4ndA0KPiA+Pj4+Pj4+IGRpc2FibGUgdGhlDQo+ID4+Pj4+PiBjYXB0dXJlLg0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+IFNvcnJ5LCBub3QgZm9sbG93aW5nLiBUaGlzIGNvbnRyb2wgaXMg
dXNlZCBpbiB0aGUgYWxzYS11Y20tY29uZg0KPiA+Pj4+Pj4gdGhhdCB3YXMganVzdCBtZXJnZWQN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2Et
dWNtLQ0KPiA+Pj4+Pj4gY29uZi9jb21taXQvMTk3MDI1NjU2ZWM0NTYzMzFkMWEzNDM1N2IxMTM5
MTNlYzNiMTg3ZiNkaWZmLQ0KPiA+Pj4+Pj4NCj4gPj4+Pg0KPiA+Pg0KPiAwZTFjNjI3ZWE4OWVl
MTQ4ZmRiNDFhYTZiM2JhNzg1MWJhOWMyMGViNDNjMWI4N2I5ZTBjZTkyMTY0MjczZGMzUg0KPiA+
Pj4+Pj4gNw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IElzIHRoaXMgc2F5aW5nIHRoaXMgY29tbWl0IG5l
ZWRzIHRvIGJlIGZpeGVkIHdpdGggYSBmb2xsb3ctdXAgUFI/DQo+ID4+Pj4+PiBMaWJpbiwgYXJl
IHlvdSB3b3JraW5nIG9uIHRoaXM/DQo+ID4+Pj4+DQo+ID4+Pj4+IFllcywgSSB3aWxsIHN1Ym1p
dCBhIHBhdGNoIGZvciBVQ00gYWZ0ZXIgdGhpcyBwYXRjaCBpcyBtZXJnZWQuDQo+ID4+Pj4+DQo+
ID4+Pj4+IFRoZSBiYWNrZ3JvdW5kIGlzIEphcm9zbGF2IHJlcXVpcmVzIHVzaW5nIGNvZGVjIEhX
IGtjb250cm9sIGZvcg0KPiA+Pj4+PiBjYXB0dXJlIHZvbHVtZS9zd2l0Y2guIFNodW1pbmcgYW5k
IEkgd29ya2VkIG9uIGl0LiBBdCBmaXJzdCB3ZQ0KPiA+Pj4+PiB3YW50ZWQgdG8gdXNlIEZVMEYg
dG8gcmVwbGFjZSBQR0Ega2NvbnRyb2wuIEJ1dCBTaHVtaW5nIGZvdW5kIEZVMEYNCj4gPj4+Pj4g
aXMgdXNlZCBpbg0KPiA+Pj4+IERBUE0uDQo+ID4+Pj4+IFNvIGl0IGlzIG5vdCBwcm9wZXIgZm9y
IHRoZSBjYXB0dXJlIHZvbHVtZS9zd2l0Y2guIEFuZCBTaHVtaW5nDQo+ID4+Pj4+IHdpbGwgcmVt
b3ZlIHRoZSBGVTBGIGtjb250cm9sLg0KPiA+Pj4+DQo+ID4+Pj4gSXMgc3dpdGNoIGNvbnRyb2wg
bmFtZSBhbGlnbmVkIHdpdGggdGhlIHZvbHVtZSBjb250cm9sIG5hbWUgYWZ0ZXINCj4gPj4+PiB0
aGlzIGNoYW5nZT8NCj4gPj4+DQo+ID4+PiBUaGlzIHBhdGNoIGlzIHJlbW92aW5nICJGVTBGIENh
cHR1cmUgU3dpdGNoIi4gQmVmb3JlIHRoaXMgcGF0Y2gsDQo+ID4+PiB0aGVyZSBpcyAiRlUwRiBD
YXB0dXJlIFN3aXRjaCIgYW5kICJGVTBGIENhcHR1cmUgVm9sdW1lIi4gQWZ0ZXIgdGhpcw0KPiA+
Pj4gcGF0Y2ggaXMgYXBwbGllZCwgIkZVMEYgQ2FwdHVyZSBTd2l0Y2giIGlzIHJlbW92ZWQuIFNv
IHRoZSBVQ00NCj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20t
DQo+ID4+IGNvbmYvYmxvYi81N2VhZDg0Mjc4ZjY0MWQ0MTFlDQo+ID4+PiAzY2NiYjVjOGE0YjY0
MTQxOTA0YmEvdWNtMi9jb2RlY3MvcnQ3MTEtc2RjYS9pbml0LmNvbmYjTDcNCj4gPj4+IG9mICJG
VTBGIENhcHR1cmUgU3dpdGNoIiBzZXR0aW5nIG5lZWRzIHRvIGJlIHJlbW92ZWQuDQo+ID4+Pg0K
PiA+Pj4+IEkgbWVhbiAiQSBDYXB0dXJlIFN3aXRjaCIgKyAiQSBDYXB0dXJlIFZvbHVtZSIgbm90
ICJBIENhcHR1cmUNCj4gU3dpdGNoIg0KPiA+Pj4+ICsgIkIgQ2FwdHVyZSBWb2x1bWUiLg0KPiA+
Pj4NCj4gPj4+IFdlIGNvdWxkbid0IGZpbmQgYSBwcm9wZXIgY29kZWMga2NvbnRyb2wgZm9yIFJU
NzExIGNhcHR1cmUuIFNvIHdlDQo+ID4+PiBoYXZlIHRvIGNvbnRpbnVlIHVzaW5nIFBHQSBrY29u
dHJvbC4NCj4gPj4NCj4gPj4gSXQncyByZWFsbHkgY29uZnVzaW5nIHRoZW4uIFdoYXQgZG9lcyAi
RlUwRiBDYXB0dXJlIFZvbHVtZSIgPyBJdCdzDQo+ID4+IHJlYWxseSBkaWZmaWN1bHQgdG8ganVk
Z2Ugc29tZXRoaW5nIHdoZW4gSSBkb24ndCBrbm93IHRoZSBjb2RlYyBkaWFncmFtLg0KPiA+DQo+
ID4gIkZVMEYgQ2FwdHVyZSBWb2x1bWUiIHdpbGwgc3RpbGwgY29udHJvbCB0aGUgdm9sdW1lIG9m
IHJ0NzExIGNhcHR1cmUuDQo+ID4gQnV0ICJGVTBGIENhcHR1cmUgU3dpdGNoIiB3aWxsIGJlIHJl
bW92ZWQuIEJlY2F1c2UgREFQTSBpcyB1c2luZyB0aGlzDQo+ID4gdGhlIHNhbWUgbm9kZS4gVGhl
c2UgaXMgYSBjb25mbGljdCB3aGVuIHdlIGRvIGJlbG93Og0KPiA+IDEuIG11dGUgIkZVMEYgQ2Fw
dHVyZSBTd2l0Y2giLiBBbmQgdGhlIGtjb250cm9sIHdpbGwgbXV0ZSB0aGUNCj4gPiAgICAgQ29y
cmVzcG9uZGluZyBub2RlIGluIGNvZGVjLg0KPiA+IDIuIHVzZSBhcmVjb3JkIHRvIGNhcHR1cmUg
ZnJvbSB0aGUgcnQ3MTEtc2RjYSBoZWFkc2V0IDMuIERBUE0gd2lsbA0KPiA+IGF1dG8gdW5tdXRl
IHRoZSBub2RlIHdoaWNoICJGVTBGIENhcHR1cmUgU3dpdGNoIiBoYXMNCj4gPiAgICAgIG11dGVk
Lg0KPiA+IDQuIFNvIHdlIHdpbGwgY2FwdHVyZSB0aGUgc291bmQsIGV2ZW4gIkZVMEYgQ2FwdHVy
ZSBTd2l0Y2giIHNob3dzIHRoZQ0KPiA+ICAgICBzdGF0ZSBpcyAibXV0ZWQiICh0aGlzIGlzIHdy
b25nKQ0KPiA+DQo+ID4gU28gU2h1bWluZyBkZWNpZGVkIHRvIHJlbW92ZSB0aGUgIkZVMEYgQ2Fw
dHVyZSBTd2l0Y2giIGtjb250cm9sLg0KPiANCj4gSSBzZWUuIEluIHRoaXMgY2FzZSwgdGhlIGF1
dG8tcm91dGUgc2V0dGluZ3Mgc2hvdWxkIGRpZmZlciBmcm9tIHRoZSBtaXhlcg0KPiBzZXR0aW5n
cy4gU28gdGhlIG11dGUgZmxhZyBzaG91bGQgYmUgbG9naWNhbCBfT1JfIGZyb20gYm90aCBEQVBN
IGFuZCB0aGUNCj4gbWl4ZXIgc2V0dGluZ3MuIEFuZCBiZWNhdXNlIHRoZSBjb2RlYyBpcyBhYmxl
IHRvIGRvIHRoZSBodyBtdXRlLCB3aHkgdG8NCj4gcHJldmVudCB0aGUgZXhwb3J0IG9mIHRoaXMg
ZmVhdHVyZT8NCj4gDQo+IFNvIEkgcHJvcG9zZSBkbyBkbyAocHNldWRvIGNvZGUpOg0KPiANCj4g
c3RydWN0IHJ0NzExX3NkY2FfcHJpdiB7DQo+IAlib29sIGZ1MGZfZGFwbV9tdXRlOw0KPiAJYm9v
bCBmdTBmX21peGVyX211dGU7DQo+IH07DQo+IA0KPiAvKiBjYWxsZWQgZnJvbSBib3RoIGRhcG0g
ZXZlbnQgYW5kIGtvbnRyb2wgcHV0IGNhbGxiYWNrIChvbiBjaGFuZ2UpICovDQo+IC8qIHRoZSBk
YXBtIGV2ZW50IGFuZCBwdXQgY2FsbGJhY2sgd2lsbCBtb2RpZnkgb25seSBydDcxMV9zZGNhX3By
aXYgZmllbGRzICovDQo+IHN0YXRpYyB2b2lkIHNldF9mMGZfbXV0ZShydDcxMV9wcml2KSB7DQo+
IAlpbnQgbXV0ZSA9IHJ0NzExX3ByaXYtPmZ1MGZfZGFwbV9tdXRlIHx8IHJ0NzExX3ByaXYtDQo+
ID5mdTBmX21peGVyX211dGU7DQo+IAlzZXRfZnUwZl9tdXRlX3JlZ2lzdGVyKG11dGUpOw0KPiB9
DQo+IA0KPiBXaXRoIHRoaXMgaW1wbGVtZW50YXRpb24sIGFsbCBpcyBjb25zaXN0ZW50IHRvIHRo
ZSB1c2VyIHNwYWNlLg0KDQpJZiBzbzoNCldoZW4gY2FwdHVyZSwgaWYgdXNlciBzZXR0aW5nIGlz
IG11dGUsIGl0IHdpbGwgYWx3YXlzIG11dGUgYW5kIGlmDQp1c2VyIHNldHRpbmcgaXMgdW5tdXRl
LCBpdCB3aWxsIGFsd2F5cyB1bm11dGUuDQoNCldoZW4gc3RvcCBjYXB0dXJlLCBpdCB3aWxsIGFs
d2F5cyBtdXRlIHJlZ2FyZGxlc3MgdGhlIHVzZXIgc2V0dGluZy4NCg0KU2h1bWluZywgd2hhdCBk
byB5b3UgdGhpbms/DQoNCj4gDQo+ID4+IEFueXdheSwgdGhlIHN3aXRjaCBhbmQgdm9sdW1lIGZv
ciB0aGUgZ2l2ZW4gSS9PIHNob3VsZCBoYXZlIGlkZW50aWNhbA0KPiA+PiBuYW1lIGFuZCB0aGV5
IHNob3VsZCBkaWZmZXIgb25seSBpbiB0aGUgc3VmZml4IGRlc2NyaWJpbmcgdGhlIHN0cmVhbQ0K
PiA+PiBhbmQgZnVuY3Rpb25hbGl0eS4NCj4gPg0KPiA+IFdlIHdvbid0IHRvdWNoICJDYXB0dXJl
U3dpdGNoIiBhbmQgIkNhcHR1cmVWb2x1bWUiIGZvciBydDcxMS1zZGNhLg0KPiANCj4gWWVzLCBi
dXQgdGhlIGh3IGNvbnRyb2xzIHNob3VsZCBiZSB1c2VkIGluc3RlYWQgRFNQIGNvbnRyb2xzLCBp
ZiB0aGV5IGFyZQ0KPiBhdmFpbGFibGUuDQoNClllcywgd2Ugd2lsbCB0cnkgdG8gdXNlIHRoZSBj
b2RlYyBodyBjb250cm9scyBpbnN0ZWFkIG9mIHRoZSBEU1AgY29udHJvbHMuDQoNClJlZ2FyZHMs
DQpMaWJpbg0K
