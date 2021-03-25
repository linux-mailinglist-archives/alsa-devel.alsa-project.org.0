Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640E34992A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 19:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1389015E5;
	Thu, 25 Mar 2021 19:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1389015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616695756;
	bh=Vtmng+uqy0KNYIMDqTXtlIxIXTPDAOVO5lzSP3jQFRA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txPfJEFCl6CjXuhiDvHWDnibehaSIFj30c4eleCjP9flsXLQcrq39VsuVSAyIsB0Q
	 A17QolRg72qd4NR5N+b7Mja3A5rjjeoaaVW/0m5eZ6Y6icdAk6ioBe+7uPuXRXUUYE
	 8MyoX+p7HxTgtktmXIEI9mIcxLZzYQEhbxIpO06w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17BCEF80268;
	Thu, 25 Mar 2021 19:07:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD52F8025F; Thu, 25 Mar 2021 19:07:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9743AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 19:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9743AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="jtStayud"
IronPort-SDR: 7yYZvc3riEcz9HU461G/ueqhBXEUIDfR50pqKpzGhisoYsiStEy/ubEknvpvkJXblMA7P5bSkD
 9n2MO47NApNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="170345700"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="170345700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 11:07:35 -0700
IronPort-SDR: xfNpanZMRoRt/Ctd93gnojXETpJKrpD8LhZje9ZZNgQeg3pZYEaPNTNylyRzdqx0LVG4XSaS0i
 HOdnKOsaP7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="443489376"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2021 11:07:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 11:07:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 11:07:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Mar 2021 11:07:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Mar 2021 11:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBc8IsCY9U3RNodl/1M2Xp/y13SO8duDmHRn6zEBWFB0wAQNUJRC0BIeLvxZzaaMV2LweP3C3E/loaP89ywBIMC9FjvgMaj3vCHJhhEAvRBhqrQb0UjfjL4B4+oigSb/GLOhHuGF+NdMiPbggDeOHS7MR8IDDDN88+aPIyiuq5fW6Ev5XPUHN8pNdaPO8QfZn8reLKf4v2BJbf8guZthQOs5UyX8YsHhjb+7Vu6mZgtQNzhHhWAxyk653Ri6VLzvHDuoBw161rEYyGKbR06hJVc7p2+3M9JxFPeuMQ0B+LvCC40Chr/Hw3CKq1H5neZeylyosh688kH6ULD5vrXPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtmng+uqy0KNYIMDqTXtlIxIXTPDAOVO5lzSP3jQFRA=;
 b=GMNgMv7TrFkjljcyvlLLZQxPsgPDAAIytcUA1eWdtM8TBe/SyM98rBLEZ0LN3d6KPhXcvOYZb+s0IEKQcN3OARQqdOzdsQ75EBa5qGG5BfRnjqz92rfYiOf+Aq/p0bP1Q88QunLaskIJKEc/c/8UUY0pRj99ECOBj5rGWukikEwu1jBpEp5O+bvsKCiWcqQNcY+Z/zBghZENucwu5UlKAOIdSrhWX3j28lj6ZVDzIC2M8GZ7XVLVSv9nQ7Ia6kmQJobsFJrcAqcKiU1B8lUrO1Gk0fVU7ccHGG/7lqKLmaqlplQf9p/oK3wK3GJcXUZeMSDqI6nPzMzDZ5/SAT09uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtmng+uqy0KNYIMDqTXtlIxIXTPDAOVO5lzSP3jQFRA=;
 b=jtStayudL7X8YJQ6M1PbI+Jg3WUyT/RPgsEXyMPw9elyvODa0rteCg4FWD2l3YXVhh0A5EaUqIyINbWqzx2J+uBz01JbPiwieVAh2CjAUGTIrLQavi4nmhiDo7g453kXnXYTBPKIx4w9Zc22R9ZyM47e7Cjq2qVrndOkThkU0Pk=
Received: from SN6PR11MB2877.namprd11.prod.outlook.com (2603:10b6:805:5b::32)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 18:07:30 +0000
Received: from SN6PR11MB2877.namprd11.prod.outlook.com
 ([fe80::14e7:5c3d:47a8:fa9f]) by SN6PR11MB2877.namprd11.prod.outlook.com
 ([fe80::14e7:5c3d:47a8:fa9f%5]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 18:07:30 +0000
From: "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/2] ASoC: Intel: kbl: Add MST route change to kbl machine
 drivers
Thread-Topic: [PATCH 1/2] ASoC: Intel: kbl: Add MST route change to kbl
 machine drivers
Thread-Index: AQHXINaTndZHA8KLpEqXxNBCA+3GpqqTdvcAgAEZTTA=
Date: Thu, 25 Mar 2021 18:07:29 +0000
Message-ID: <SN6PR11MB28770F2E69C6D27984F3674FD6629@SN6PR11MB2877.namprd11.prod.outlook.com>
References: <20210324175200.44922-1-vamshi.krishna.gopal@intel.com>
 <20210324175200.44922-2-vamshi.krishna.gopal@intel.com>
 <2ee1a18e-8771-b8f7-0452-f96403bd7fe4@linux.intel.com>
In-Reply-To: <2ee1a18e-8771-b8f7-0452-f96403bd7fe4@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 6df7f1c5-4c62-465f-c0f0-08d8efb8db00
x-ms-traffictypediagnostic: SA2PR11MB5019:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5019DF16C1AB924119E98579D6629@SA2PR11MB5019.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PuWzByIsMke7i+VqxGhYo+Oj8nBbq/sp6fTkhyinv2vVHk7++DHLRDK0ALL5dsk8GBy6YHMQDNxDiT7pOaZ4LcHZ11skmTuBSIL4APqX6NFHjyFn58rsCFstpigvkNfwP3VprpUYGYtvcj+fVCXxLyXtTFEk6fd6PwR8zO2HcjbmSon9Ga3EBYcBoRLmYfVtGDmoOoQwEk5zXGJo4+g6P1ccMWhvmL9gQSVCmf3v0aVGp/TNr75nOW6Ke3UH9VBxl2btzCcaIETmkwrzjbKst4Mu8bAV/xIdJE34C8f515P8L5cn9V7FdOa73MEycdudk5uhQKbm8n+yoQhdFSoijJruSSflxABDt8YrJZTRmVrFVyvVWE2f6AHs508SQvbeQ+7KPshvh+PozAsbqrd2fc6Mv2Q4KaEq3/SzwW6GinmBT7pSqfeCQL0XHcxL8/05R5MCiMs7Xe7VzvVKkq//MWkofCpRMBiiLP5uKWfwVXD7ptjpQoPILC5JxwtB+0xAomtCBrx5Jwdg13VLyTDH3lt1xjKmQ+RfrR+g5MQJeubzOkwwmnxh7iKJWLe4MXItX9BD/e4pdTnjro8ZBMdVROQttXbhqBTq7GhjaC3GBSv8EWKye5ujOAuTt3FtxI4SMTiS72W10cHIK7eRQM4QQY4BGdpx/1CmXtqFtK4phGw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2877.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(136003)(396003)(366004)(55236004)(8676002)(53546011)(4326008)(8936002)(38100700001)(6506007)(76116006)(66946007)(55016002)(86362001)(5660300002)(186003)(71200400001)(83380400001)(66476007)(7696005)(66556008)(66446008)(64756008)(478600001)(316002)(110136005)(33656002)(2906002)(26005)(9686003)(54906003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?di80ZHNTcTBIakRYWW4wcDJHejR3SjZtbm40Z2RrRndvazZZWG1VWmlkY095?=
 =?utf-8?B?MElaaXdMRnliRmtvNmMzdzIvRWE1OWJEeFNpSmxKWUNDRnFScGI1ZGZjUEhT?=
 =?utf-8?B?OHNLWmxrdWJYUW1SWXdQWmFhbWVVL0Z4ZFMrWFFnT0ZkVGtWT2NzMHhKb3ZU?=
 =?utf-8?B?NEN0R1BsWUF4LzdaWEJLSUVPdlREZFBoQjhtMXFWR1NjcXJDbjQxUStwaHZS?=
 =?utf-8?B?ZDFPOFd4aU0yeTFJQi9MTnJpS2J0VmFiUWFBVU1XeDl5U1FhbllSbkZRNm41?=
 =?utf-8?B?clZ3MTdiOW0rNWE5eHU1d3Z6Nk50UnNvV285a2F5aFJ1alNyMzdtK3JhVFFO?=
 =?utf-8?B?bzN3UnhiYmRjYXZnUWhuOXlIMkVIY3pFdExWSHhNVjY1aXgrYi9YVWYxcFZJ?=
 =?utf-8?B?ZitUQlA3QXBCczd3cXU1aUEyV0tXWm5taUN6YWFNOXc2djFodE5tQUoxVWNr?=
 =?utf-8?B?KzJHcEtZcVorQmFPeFBZWVE5SlhZVnNrTksxQTdSMm1ZbDRPY3NXbXlwSTBT?=
 =?utf-8?B?RjVyTXFQc1lvbzQvclZQblJFa1p6Wnh2WkFWeThGbmdiY3J4NUNUT0I0ejR5?=
 =?utf-8?B?ZGRHdWNJQ1RTU2JFRDFtVDQydEV4ZkgxY01YbFhUYno5T2dRVTNMNTk2b21m?=
 =?utf-8?B?dDAzNDV4bUZ3OFZYQkVxZmcwZUVFNzNZaS9zTjVSa3h2QlBLK3VIbGZCdndn?=
 =?utf-8?B?Qjcrd0dBd3FXQkc5N3lCbGZYT1B6NmxIVWdrSkRWem4yY1NlaGNxSndmZG5p?=
 =?utf-8?B?YlQ4RUorQkpOd3RwT3d4bUQ3dXpuTi93d0FzRUFBOUVIRnZZL2RMMFJRQzRx?=
 =?utf-8?B?aTZKS0tBSU5rRHc2aURvbzcrbC9nTFhrdnBtZDhLWjBmWWZ6R01ZbXozWXN2?=
 =?utf-8?B?enRtZnhaRGR6cklYcXY0RGpEWE9jbXhCMEVwVDBBeXJxU1ZSWFB3Uno4ODR6?=
 =?utf-8?B?cGJoSmZBWlhYZTArWXJZVm5ua25TWCtqZmJteHhjTXhTN2xRdEFmdVJHaFdp?=
 =?utf-8?B?MXVSaWdoQ1Z5cXhqZ3d4M2NQbFRmQUR2dSsvem5VRTN1U2VGbXB5azRFZkE4?=
 =?utf-8?B?NkpEWUNkZm12K0doWGtRUDYvMTZsc1d1RDQydE8rbHBzY1ZlRGxKTGY0K2Rh?=
 =?utf-8?B?anRnMUxub2RDTWJTQlVXNnVSVHIwcHl3ZzRHeG5maHNCTHEyRnk3dnZrMW9N?=
 =?utf-8?B?VWpWQVdBaTk2Q2IreHJCejFjNmg2YjBObjZVRjJZQmlwejQ3dU9RYVc1bVRy?=
 =?utf-8?B?VksxVllBbEQ3a3c4dHRLbGwwNFJQMG8zOXovaTA5d0k4ZnVCbjNjRjFrME9U?=
 =?utf-8?B?REs0MWdadUFibFMyZXlycWZTOTJXRjFLRHI0RkdvOFMraFB2UnBZUDJPaFJE?=
 =?utf-8?B?c3dQSUxFNWlyeDlRcUFMeStidE5sdFliWGFiZkdnU2dlS2ZzbzRTNDFkNmtE?=
 =?utf-8?B?Vkw5NXJYODJpaTlia3VlSjViNm80bHNad09WQ0N3bmtKNmVwNWFXUm9zMkJq?=
 =?utf-8?B?UGNpWGMyTUxhaXlwYWlBQnhnenlCVUlMV05HVStjcG85QjMrYjdXNUxwbkxE?=
 =?utf-8?B?RWpYOFdqMzUxWElTWmhtSXNuTXhRdkZhWGtCMlBwK3RQS0ZFRGZiNElMNkVH?=
 =?utf-8?B?ck4yMUowenpxN2VkZVJHVExNL1ErQ21JcWRNQlRxZisvaXRaekNkZWNzWVFj?=
 =?utf-8?B?d1ljNTlzak9CblJvVUhoUUdzOFNtTXVyNUFDSUduUS9qaVdYZWNYZEd6Rjg2?=
 =?utf-8?Q?4KEXRnkm/MSg/gGelt41ms2id1Jm4ssQGLsUN+n?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2877.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7f1c5-4c62-465f-c0f0-08d8efb8db00
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 18:07:29.9586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAldqrtIKihnSAfP0MYwBPJ0PKITxMjv24L1oiPp8GevaF9kp79Hrp/ibn67Zhxbg70VCukRJzIaLtL7N/5zaIAYQaydffKZoMyZ4khhiy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

ICAgIA0KT24gMy8yNS8yMDIxIDExOjMyIFBNLCBWYW1zaGkgS3Jpc2huYSB3cm90ZToNCg0KPiBG
cm9tOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjUsIDIwMjEgMTI6MDQgQU0NCj4gVG86
IEdvcGFsLCBWYW1zaGkgS3Jpc2huYSA8dmFtc2hpLmtyaXNobmEuZ29wYWxAaW50ZWwuY29tPjsg
YWxzYS0NCj4gZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KPiBDYzogTiwgSGFyc2hhcHJpeWEgPGhh
cnNoYXByaXlhLm5AaW50ZWwuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnOyBNIFIsDQo+IFNhdGh5
YSBQcmFrYXNoIDxzYXRoeWEucHJha2FzaC5tLnJAaW50ZWwuY29tPjsgYmllcm5hY2tpQGdvb2ds
ZS5jb207DQo+IEJvc3NhcnQsIFBpZXJyZS1sb3VpcyA8cGllcnJlLWxvdWlzLmJvc3NhcnRAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVNvQzogSW50ZWw6IGtibDogQWRk
IE1TVCByb3V0ZSBjaGFuZ2UgdG8ga2JsDQo+IG1hY2hpbmUgZHJpdmVycw0KPiANCj4gDQo+ID4g
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX2RhNzIxOV9tYXg5ODM1N2Eu
Yw0KPiA+IGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfZGE3MjE5X21heDk4MzU3YS5jDQo+
ID4gaW5kZXggZGMzZDg5N2FkMjgwLi4xZDZiMjg1NTg3NGQgMTAwNjQ0DQo+ID4gLS0tIGEvc291
bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfZGE3MjE5X21heDk4MzU3YS5jDQo+ID4gKysrIGIvc291
bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfZGE3MjE5X21heDk4MzU3YS5jDQo+ID4gQEAgLTkxLDcg
KzkxLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0DQo+IGthYnls
YWtlX3dpZGdldHNbXSA9IHsNCj4gPiAgIAlTTkRfU09DX0RBUE1fU1BLKCJTcGsiLCBOVUxMKSwN
Cj4gPiAgIAlTTkRfU09DX0RBUE1fTUlDKCJTb0MgRE1JQyIsIE5VTEwpLA0KPiA+ICAgCVNORF9T
T0NfREFQTV9TUEsoIkRQIiwgTlVMTCksDQo+ID4gLQlTTkRfU09DX0RBUE1fU1BLKCJIRE1JIiwg
TlVMTCksDQo+ID4gKwlTTkRfU09DX0RBUE1fU1BLKCJIRE1JMSIsIE5VTEwpLA0KPiA+ICsJU05E
X1NPQ19EQVBNX1NQSygiSERNSTIiLCBOVUxMKSwNCj4gPiArCVNORF9TT0NfREFQTV9TUEsoIkhE
TUkzIiwgTlVMTCksDQo+IA0KPiB0aGF0IHNlZW1zIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBCWFQv
S0JMIG1hY2hpbmUgZHJpdmVycywgYnV0Li4uDQo+IA0KPiA+ICAgCVNORF9TT0NfREFQTV9TVVBQ
TFkoIlBsYXRmb3JtIENsb2NrIiwgU05EX1NPQ19OT1BNLCAwLCAwLA0KPiA+ICAgCQkJcGxhdGZv
cm1fY2xvY2tfY29udHJvbCwgU05EX1NPQ19EQVBNX1BSRV9QTVUNCj4gfA0KPiA+ICAgCQkJU05E
X1NPQ19EQVBNX1BPU1RfUE1EKSwNCj4gPiBAQCAtMTA4LDkgKzExMCw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlDQo+IGthYnlsYWtlX21hcFtdID0gew0KPiA+ICAg
CXsgIk1JQyIsIE5VTEwsICJIZWFkc2V0IE1pYyIgfSwNCj4gPiAgIAl7ICJETWljIiwgTlVMTCwg
IlNvQyBETUlDIiB9LA0KPiA+DQo+ID4gLQl7ICJIRE1JIiwgTlVMTCwgImhpZjUgT3V0cHV0IiB9
LA0KPiA+IC0JeyAiRFAiLCBOVUxMLCAiaGlmNiBPdXRwdXQiIH0sDQo+ID4gLQ0KPiANCj4gLi4u
IHRoaXMgZG9lc24ndDoNCj4gDQo+IG90aGVyIG1hY2hpbmUgZHJpdmVycyB1c2UgdGhpczoNCj4g
DQo+IAl7IkhETUkxIiwgTlVMTCwgImhpZjUtMCBPdXRwdXQifSwNCj4gCXsiSERNSTIiLCBOVUxM
LCAiaGlmNi0wIE91dHB1dCJ9LA0KPiAJeyJIRE1JMiIsIE5VTEwsICJoaWY3LTAgT3V0cHV0In0s
DQo+IA0KSGVsbG8gUGllcnJlLA0KVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLg0KSSBs
b29rZWQgdGhyb3VnaCB0aGUgY2hhbmdlIHlvdSBzdWdnZXN0ZWQgaW4gYnh0X2RhNzIxOV9tYXg5
ODM1N2EuYyBtYWNoaW5lLCBidXQgSSBub3RpY2VkICBoaWY2LTAgT3V0cHV0IGFuZCBoaWY3LTAg
T3V0cHV0IGFyZSBoYXZpbmcgc2FtZSBwb3J0IEhETUkyLCBUaGlzIGxvb2tzIG5vdCBjb3JyZWN0
Lg0KPiBBbmQgaWYgeW91IHN0YXJ0IGNoYW5naW5nIEhETUkgc3VwcG9ydCwgeW91IHNob3VsZCBh
bHNvIGZpeCB0aGUgb3RoZXINCj4gbWFjaGluZSBkcml2ZXJzIHRoYXQgdXNlZCB0aGUgc2FtZSBw
YXR0ZXJuLCBlLmcuDQo+IA0KPiBrYmxfZGE3MjE5X21heDk4OTI3LmNcMDEyOToJeyAiSERNSSIs
IE5VTEwsICJoaWY1IE91dHB1dCIgfSwNCj4ga2JsX3J0NTY2M19tYXg5ODkyNy5jXDAyMTQ6CXsg
IkhETUkiLCBOVUxMLCAiaGlmNSBPdXRwdXQiIH0sDQo+IA0KU3VibWl0dGVkIGEgdjIgcGF0Y2gg
d2hpY2ggZm9sbG93cyBzYW1lIHBhdHRlcm4gYWNyb3NzIEtCTCBtYWNoaW5lIGRyaXZlcnMuDQoN
Cj4gPiAgIAkvKiBDT0RFQyBCRSBjb25uZWN0aW9ucyAqLw0KPiA+ICAgCXsgIkhpRmkgUGxheWJh
Y2siLCBOVUxMLCAic3NwMCBUeCIgfSwNCj4gPiAgIAl7ICJzc3AwIFR4IiwgTlVMTCwgImNvZGVj
MF9vdXQiIH0sDQo+ID4NCg==
