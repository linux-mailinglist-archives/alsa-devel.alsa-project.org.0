Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A53506CA
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F6C10E;
	Wed, 31 Mar 2021 20:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F6C10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617216713;
	bh=R6wsu7hLOYrjX12jeiXGY1PSOjLc1N91vReAMSkxnCg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWr1kWrj+2lMzHXHhSzySLNHec+mkViRl6av0VyOusMJDyYg8RzS2Au87z8YeMrRG
	 pbGIYOBHBbwUK3DQZSeuwMkp8CGRgbe1fhfpuH+Sj6XE1lDacu3RTTaP9gttX85tmz
	 hYZoG3C4jGV51Qc+FzokOcMGnEAWWcBicve/x9NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B72DDF8014E;
	Wed, 31 Mar 2021 20:50:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12738F80166; Wed, 31 Mar 2021 20:50:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC041F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC041F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="W0x4mYpf"
IronPort-SDR: 7g96LA1FJwVRwfjethf4Vicb7nps1x11jRF+BTCzdAc3vEzQ5KpMskE3CgAwFuzKi80COu8XXi
 EcxaEeMCDQWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="191551567"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="191551567"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 11:50:19 -0700
IronPort-SDR: QJsetfSNFmC6+2ncqy+atD2ZlFKg5QBGKxj1vVmbSzLQGPN9oIsI5Wz4Y4cIGORl6GSrIui/qy
 +eFFwU3W3TSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="412311606"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2021 11:50:19 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 11:50:18 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 11:50:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 31 Mar 2021 11:50:18 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.58) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 31 Mar 2021 11:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mge4M8jndOGHvyySS2ACVbLW6QvmndUZzMBN78dQWbC2SAKisJz5zmAZrWIe417F6ZhqhcbX/j5xWTvsTVsreWaE/p7WgnRdTLsepneNz8ckkCGj9XC52AA2d2k7ePbaKdPaxLMWOxDJVqunJW6br0uw7hyql54n3ajLhK+3Y0kVQeebnhMBtJ9tF+DYB3AbkTtFUCSJZiuvqCT7YQ+igFESJvnQAFeQp8VfL4BkHMYcovcIYhQyM+aCrJvVCfF3Bfw0mf5CKM5pM/89pcZsgqy1Zh9KyLJQv58IBlmyKBrKnPCdPBWdx0rBOvwWNYliBb60amCjrm4fX8UC2BEtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6wsu7hLOYrjX12jeiXGY1PSOjLc1N91vReAMSkxnCg=;
 b=O17M1/aBhXC+Xzw+ChHAONKuSU1lVEgzRF0j7JjRUkSKYopYxPA8cGO9TNotgQ9yEH8XQuCbvX57AaUjwt6lh0g89pJMS0ftxkhzYW95/e7bFZQCygVEyGMkXhoOK1Asr+lq0wvAnmYwS5imh3DZKDomd/rMlbj6gKx+maIPH9LJe7Oe3V3j1IZOgzsCIJhFHRqqRXLQHFKoN72B0nPDAq5U4HSTbAmv1WD1xPtagjPL4nsntGcsN5hfjjtYKi3AKygb8a/qppGuej+s2gJAfyT+5oVEZEItMNGtxWHaQGu8lVbdtvkkj45vq4Wt1mSgLySmC8398biLupXkL+lGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6wsu7hLOYrjX12jeiXGY1PSOjLc1N91vReAMSkxnCg=;
 b=W0x4mYpfU55zbW6EirdLCN+nGSJrF97iTkiEEQDOjDeqMzJMek1ZAQaWDQ2FJTqgY+I3o05ZjV/+TdjyeMfUNr/8HUJftSzet6V/b8eD6xtUzHV488hYsT9S3LyO3+03XsLCgY+btIyWhtP8TkDxfzES4HZGDOrb+8t+Eufw7F4=
Received: from BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12)
 by BYAPR11MB2981.namprd11.prod.outlook.com (2603:10b6:a03:83::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 31 Mar
 2021 18:49:42 +0000
Received: from BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::4156:a987:2665:c608]) by BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::4156:a987:2665:c608%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 18:49:42 +0000
From: "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/2] ASoC: Intel: kbl: Add MST route change to kbl machine
 drivers
Thread-Topic: [PATCH 1/2] ASoC: Intel: kbl: Add MST route change to kbl
 machine drivers
Thread-Index: AQHXINaTndZHA8KLpEqXxNBCA+3GpqqTdvcAgAEZTTCAALPtgIAJNb5w
Date: Wed, 31 Mar 2021 18:49:42 +0000
Message-ID: <BYAPR11MB28703A7C27AC540800AC0647D67C9@BYAPR11MB2870.namprd11.prod.outlook.com>
References: <20210324175200.44922-1-vamshi.krishna.gopal@intel.com>
 <20210324175200.44922-2-vamshi.krishna.gopal@intel.com>
 <2ee1a18e-8771-b8f7-0452-f96403bd7fe4@linux.intel.com>
 <SN6PR11MB28770F2E69C6D27984F3674FD6629@SN6PR11MB2877.namprd11.prod.outlook.com>
 <a7ae7c3c-b80d-2a31-8482-b5b8d6da5dfa@linux.intel.com>
In-Reply-To: <a7ae7c3c-b80d-2a31-8482-b5b8d6da5dfa@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 6a6ca0d3-3aa1-4294-2cc9-08d8f475bf07
x-ms-traffictypediagnostic: BYAPR11MB2981:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB29817A8368D8B882FD18BED0D67C9@BYAPR11MB2981.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d4UuIkx/02mjkdNPJgR9dZy6S2sWQUhGy18pFxyEeG+4JHMsjv1AcUoU+QDkWEy00RuG6PMxA302gqHoBwmQYYtHZchCqHt+aLhrbby/z++4+yDEfmm+WRoKNJO+Eu313PZ422nWk7Ojyi7uWHfWEDviucCDyvwMOq82X5lqBFpsDUaphahD7jvYYq++H7bFrTRi1NNbM3zRGDXoH629KjE0Wm2QutGx+bMTQ8tBcNrHalAG5NMJIAKAvbafXQaEFOYzLY5+jy3OGGZYE7ydT68osimXeKMaLLrWPTyFM2Jub7wHxF/018pA8GY9o1nu/OkFienbeS6+vAtUU8TPQyho5O/MAW3AeLBOewvGCO9/nx+D322Quc4o8SznNNWOvjkmU7EISeZIxtWJOGUML+aKv+hguoXjf/zd/YtKb7mI/zYRAkzR5pS3J2RIJC8vwY1VXVHREQxaEJKq1vXXzex10nIQ8HhcszUxS4SQxIheaQ8sd7ED9LeMzRRAOwpWTV1w9A7pRHqn8fkXlFCEB7Vz8EOXEndG8dGqx6sMQR+XsQuNFhYnKf0tHWWKhs7w2Gv40+AIS2AlALzQMoyNayc3dHe310ipmuJMJ5dchlrVeMTVQmx//kanc7EXbVthLu84yTdy2fVj69YbKRY6YIFJpPAffK+7dKvVsgj5ej0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2870.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(396003)(376002)(366004)(7696005)(66476007)(38100700001)(33656002)(71200400001)(26005)(4326008)(2906002)(55236004)(66556008)(9686003)(8936002)(86362001)(55016002)(76116006)(54906003)(110136005)(6506007)(316002)(64756008)(52536014)(66446008)(478600001)(8676002)(83380400001)(66946007)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dGtOUFNUOGdEN0xndklRSm16TmpaZFNFY3FlSXU2MjFoNitOSFZJTWNqRXdq?=
 =?utf-8?B?bG1sVm1TRTh6d2grQzRaOXorTnZZY2lDN3RBSlh6Z1Z5WThYM2RabFRuRzdn?=
 =?utf-8?B?aDk0eEpJZjNLdFl5YWd4TUN2WU10SXYzWmtwSFRGbk9VQWVweTVSRGdZRTJJ?=
 =?utf-8?B?UGU0RFo4V0J0SHpBcmJGNWQrSElscHAvNDhvOGh4NzI0Nkk2Qis2K3R1WVlJ?=
 =?utf-8?B?K1Zwb3c0MFVVSXBzUWhlWFdEQS9YQVNlTnJJODZNRG9WZ08xVFB5Zk9TQlB0?=
 =?utf-8?B?R2o5S3I3RTBVZGlZR3dtMUZWRExXU0hFUm15VFAxWmVWMWpRNFdlckV6dEtk?=
 =?utf-8?B?UXNmeEFXckE4WStTekVKM3pJZng1Y3Vaa0xEaEdlTGRpbDNnUk9Ybklxck96?=
 =?utf-8?B?VFd3bGY3U1VjTUt5UG85SWxHQ1VCaUtGa091a3BzUDFhVk5JTTU2TUJHaTdi?=
 =?utf-8?B?dFN3SEdEU1pGREZYVkxPblo1by91TWhmNkJIZ2NNNjFKVk1ybTNzQ3IzYmpX?=
 =?utf-8?B?LzMzRUovWC9NZUlvZ0pxcGdOVm5LWjR3S2tiYWZzTEdCMGJGVnVlTExSY25U?=
 =?utf-8?B?eVlia1NrRUQyYk9JOXVsTjFpTEpvNkpieHJ6K25hN1RXWUI3KzJPSVdhcUZn?=
 =?utf-8?B?TGJmaTRhdEtsekZYdEh5Z3UrMG5mc2w4NUMyVHd1QTF5OStlcm9LUVB5VEk4?=
 =?utf-8?B?WC9VdXEwZnVVQ1A1NThMajZnSGxJUDRKYWNTbVhET0R3aEJhSUIzTEk2Q2NO?=
 =?utf-8?B?akg0bDMrbnBFU2ZJa3hkTTVXamExcFhTc0haNEFtRUtyTnpKcURqR0hYc3Ix?=
 =?utf-8?B?aWZ0TkR4NDA4Q0lYcXMwbDJWQWhMV3UxOFE3Q1lKSS90dXVZV1JtVkFLUnpW?=
 =?utf-8?B?KzY3cWF2R3doYnh2RW9ac2lNUVJrZ0hBS3dFUEg4aHVqY0tlNDJPanAvSHhE?=
 =?utf-8?B?Y0lhZk93UWRJTmhzSHdDZjQ2SGtJWnF6QmprQ1hTYWVYVjRieGh2M0ZEc2o2?=
 =?utf-8?B?cWlZM294a21DcVZRdWREUnpFSzhrbzNQQzNTRHhYelkxRXFvRk9CYjBmTFdi?=
 =?utf-8?B?UEwxU3FWLytWVHZQbTJNRklzWW5MMmNKcFdiYXlPZkJZWDUvOFhOMHkvYWc4?=
 =?utf-8?B?cXlZL1dXcXh4L1pESjNVR3l4VnRaRk8rU3BUVVkyQ0VvTlptN1VOc0lvWk8w?=
 =?utf-8?B?elBja2RzV3A1R1RHZjR5aktobVFiSzA5clYxNVdrTDM4MERkRGdoUENSL053?=
 =?utf-8?B?a3prcWF5TjY4OGRkcFhYRHlNNVFRWkV0VUg4MTVHVWRDeFMxZ0FKNk81Q2RV?=
 =?utf-8?B?cS9MZGVrdERIQ1VBd29RdDV1QittZncySlY3SUJqSzhZeTFaRVlHNkRwdDhB?=
 =?utf-8?B?QlRkc1c2Z2h4dHpuUVpLTDZRbWF1NVEzV3FKZ3FWSmw5ZlhXMVNqYXNTRGVa?=
 =?utf-8?B?U2ozYkwwdllueFYzWmF5MmlnV2lIYmd5ejVWVzBOM2pUaVVWS3o3OWVFZ3pk?=
 =?utf-8?B?N01JYzFLOEJ1YU5PcVFvUG84a3NGMHVOZjE0TE5Ud0I5RmR1aGp0b1JteGFn?=
 =?utf-8?B?NEhUa0N6ZWFGWDVDWUdVd0hZNkx2T2FpVzhSTi90ZE02SFFKMDRtYjJxS0da?=
 =?utf-8?B?MkNRSnVEK0VHaWJmWktzSHc0OWF2NHFKTHE5M2NPbHFBNmxpN1ZjWFIxaU9X?=
 =?utf-8?B?MVJrZU1SQURENWtQdGU2bFpxQkh3c2hzUHBOYlBFYk9aLzhFY29aditmQ1Ay?=
 =?utf-8?Q?G5YVp8Vml1XjltrsekbMUC4F4QPZ6RoEMEO0+ET?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2870.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6ca0d3-3aa1-4294-2cc9-08d8f475bf07
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 18:49:42.5205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5oS4iKabzGMIyZdyCrOoR+ljplnb9HHJPSo8DbXy52K1MC6eqH9Zio50Q6prEChdmpwHktS3mVMP3jyRxf6ovKNU3CA4sh8GPkdWLAyco8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2981
X-OriginatorOrg: intel.com
Cc: "N, Harshapriya" <harshapriya.n@intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
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

PiA+Pj4NCj4gPj4+IC0JeyAiSERNSSIsIE5VTEwsICJoaWY1IE91dHB1dCIgfSwNCj4gPj4+IC0J
eyAiRFAiLCBOVUxMLCAiaGlmNiBPdXRwdXQiIH0sDQo+ID4+PiAtDQo+ID4+DQo+ID4+IC4uLiB0
aGlzIGRvZXNuJ3Q6DQo+ID4+DQo+ID4+IG90aGVyIG1hY2hpbmUgZHJpdmVycyB1c2UgdGhpczoN
Cj4gPj4NCj4gPj4gCXsiSERNSTEiLCBOVUxMLCAiaGlmNS0wIE91dHB1dCJ9LA0KPiA+PiAJeyJI
RE1JMiIsIE5VTEwsICJoaWY2LTAgT3V0cHV0In0sDQo+ID4+IAl7IkhETUkyIiwgTlVMTCwgImhp
ZjctMCBPdXRwdXQifSwNCj4gPj4NCj4gPiBIZWxsbyBQaWVycmUsDQo+ID4gVGhhbmtzIGZvciBy
ZXZpZXdpbmcgdGhlIHBhdGNoLg0KPiA+IEkgbG9va2VkIHRocm91Z2ggdGhlIGNoYW5nZSB5b3Ug
c3VnZ2VzdGVkIGluIGJ4dF9kYTcyMTlfbWF4OTgzNTdhLmMNCj4gbWFjaGluZSwgYnV0IEkgbm90
aWNlZCAgaGlmNi0wIE91dHB1dCBhbmQgaGlmNy0wIE91dHB1dCBhcmUgaGF2aW5nIHNhbWUgcG9y
dA0KPiBIRE1JMiwgVGhpcyBsb29rcyBub3QgY29ycmVjdC4NCj4gDQo+IEQnb2ghIFlvdSdyZSBy
aWdodCwgdGhpcyBtYWtlcyBubyBzZW5zZSB0byBtZSBlaXRoZXIuIEkgc2VlIDQgb2NjdXJyZW5j
ZXMgaW4NCj4gdGhlIGNvZGUuDQo+IA0KW0dvcGFsLCBWYW1zaGkgS3Jpc2huYV0gIEhlbGxvIFBp
ZXJyZSwNCkkgd2lsbCBzZW5kIHRoZSBwYXRjaGVzIGZvciBieHQgYW5kIEdMSyBkcml2ZXJzIHNl
cGFyYXRlbHkgYWZ0ZXIgZG9pbmcgdGhlIHZhbGlkYXRpb24uDQpJIGhhdmUgc3VibWl0dGVkIHRo
ZSB2MiBwYXRjaCB3aXRoIGZpeCBmb3IgS0JMIGRyaXZlcnMsIGNhbiB3ZSBtZXJnZSB0aGUgS0JM
IHBhdGNoZXMgZmlyc3QgPw0KIA0KPiBieHRfZGE3MjE5X21heDk4MzU3YS5jOgl7IkhETUkxIiwg
TlVMTCwgImhpZjUtMCBPdXRwdXQifSwNCj4gYnh0X2RhNzIxOV9tYXg5ODM1N2EuYzoJeyJIRE1J
MiIsIE5VTEwsICJoaWY2LTAgT3V0cHV0In0sDQo+IGJ4dF9kYTcyMTlfbWF4OTgzNTdhLmM6CXsi
SERNSTIiLCBOVUxMLCAiaGlmNy0wIE91dHB1dCJ9LA0KPiANCj4gYnh0X3J0Mjk4LmM6CXsiSERN
STEiLCBOVUxMLCAiaGlmNS0wIE91dHB1dCJ9LA0KPiBieHRfcnQyOTguYzoJeyJIRE1JMiIsIE5V
TEwsICJoaWY2LTAgT3V0cHV0In0sDQo+IGJ4dF9ydDI5OC5jOgl7IkhETUkyIiwgTlVMTCwgImhp
ZjctMCBPdXRwdXQifSwNCj4gDQo+IGJ4dF9ydDI5OC5jOgl7IkhETUkxIiwgTlVMTCwgImhpZjUt
MCBPdXRwdXQifSwNCj4gYnh0X3J0Mjk4LmM6CXsiSERNSTIiLCBOVUxMLCAiaGlmNi0wIE91dHB1
dCJ9LA0KPiBieHRfcnQyOTguYzoJeyJIRE1JMiIsIE5VTEwsICJoaWY3LTAgT3V0cHV0In0sDQo+
IA0KPiBnbGtfcnQ1NjgyX21heDk4MzU3YS5jOgl7ICJIRE1JMSIsIE5VTEwsICJoaWY1LTAgT3V0
cHV0IiB9LA0KPiBnbGtfcnQ1NjgyX21heDk4MzU3YS5jOgl7ICJIRE1JMiIsIE5VTEwsICJoaWY2
LTAgT3V0cHV0IiB9LA0KPiBnbGtfcnQ1NjgyX21heDk4MzU3YS5jOgl7ICJIRE1JMiIsIE5VTEws
ICJoaWY3LTAgT3V0cHV0IiB9LA0KPiANCj4gSGFyc2hhIGFuZCB0ZWFtLCB0aGUgSERNSTIgZHVw
bGljYXRlcyBzZWVtIGxpa2UgcmVjdXJyaW5nIGNvcHkvcGFzdGUNCj4gbWlzdGFrZXMsIGNhbiB5
b3UgZG91YmxlIGNoZWNrIHdoYXQgdGhlIGludGVudCB3YXM/IElmIHRoaXMgaXMgaW5kZWVkDQo+
IHVuaW50ZW50aW9uYWwsIHdlIHByb2JhYmx5IG5lZWQgYSBwYXRjaCBwZXIgZmlsZSB3aXRoIGEg
Rml4ZXMgdGFnIHRvIGhhdmUgdGhpcw0KPiBhcHBsaWVkIHRvIHRoZSBzdGFibGUga2VybmVsLg0K
PiANCj4gVGhhbmtzIQ0K
