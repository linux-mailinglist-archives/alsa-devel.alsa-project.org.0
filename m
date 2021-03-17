Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524B33F405
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 16:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F37916CA;
	Wed, 17 Mar 2021 16:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F37916CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615995598;
	bh=pCRFn2Zczmf6O7xKrgPY/x5lw00Ck9Wwldod4JcbpBE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6Cs2sVRWkCt6kz0v32zjV0nbAPq4v7cGlYsn1340R9Qw0ClEBA2IV4TeA6gUcYft
	 WUiaHVOS/UELL7GIl8KyIqfAhQhVeXB3uAn9ASECq0KDJVUrO+n7HtsuX6TUaw/BzZ
	 raT0Xb/k5JP65ybzzgHgWtlR2atv+RxUK7oJiFAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D166F8023C;
	Wed, 17 Mar 2021 16:38:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB5C5F8021C; Wed, 17 Mar 2021 16:38:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A6BF80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 16:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A6BF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="q7r+e5ur"
IronPort-SDR: ugfBvYOVaJV1a6KNzmKgKYTM+u4MLSLH/zuww5r2z9JH+WhxkSs+vXcbwByZlcniCeAFxMMLJn
 utGh/6i3JtTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="168763092"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="168763092"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 08:38:13 -0700
IronPort-SDR: tQEo8cPeQ6zcTxK/3Cdtfjiqb6KcD0z/vxb51l+kNYh6IcOdHiV/1PPfRhiOLy6V6E+5aBFmGK
 +LncFeoW1IJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="511765010"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2021 08:38:13 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 08:38:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Mar 2021 08:38:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 08:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS9xKKFF8VNbO6Ysy4i92SziQbrKK6+dOkeC/kZzFHYwgziPdpY4S4pHLriJl+zHD4kyjuTVDYrN8W7HsYiWI4Sb1v3tscPXKrntSqRlTvMhnJISVhXJpozMOUmDQ9bqnpo7WDQUjPUSbGuTVuQ/5T93iVrzxtRDAQGfd7zf1n32g2vKHqLqCDyz0OxFCIfVWn2M1HBlwYoktfaaYBaCpzNwAu5NYHN6ut7mRd+sx6ED0Xh5F6ujbgjJqkbnF3sAQKiEOWQYb3QaJMCAHC0BIOBFTghleZAkf8KFFxt9Z2Cu1trVzZWMq4O+rUdUVTLznX6bifOqtKl48g2C/ZtqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCRFn2Zczmf6O7xKrgPY/x5lw00Ck9Wwldod4JcbpBE=;
 b=G0a8ty87plxsubegtxh78LCY5kWN3vqZQ0rxrCTGxns3tx7E9D8iMKjalKdM+w+uv3Sv2Q5w2CmIGJZU7CstVznjqK0dOhwurMmtyLYDJFCu2IKh5a13FotrcunB99B5ab2nJ2ECGkNgQF+OEm0+KBpknFs4ibYjoPW10m/uqP7H2oTpJrdBOubZ5w843DBLqIMKVs4nC7Xpox++77QmctAGN2zDn1gegRt2rH+JLs0PMOS0oLAuHSHQ9WXgaL0y/LwyO+5V1Uk2KfwIn48C+jvub6Vdsu6FPA8XOpNH0eL3xgA2S4n+3CdNA7+VYIOd4706NDxlZptuydE7soyI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCRFn2Zczmf6O7xKrgPY/x5lw00Ck9Wwldod4JcbpBE=;
 b=q7r+e5urE22dVUMOR0sDt+45Zxdlc6lNsBkPSip9b2TM2Dem+UvW6AVKDJwv+Ai3lvQuumdgcSoI49y/7U8pv7fEiGzKYG0GRujsPiZ4uaZS3uCD6FXAc1OH7pbSwhCxW4VTv4+TAZuFGetq+/82un44/+pYmAidnkD45dD77Wk=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM4PR11MB5501.namprd11.prod.outlook.com (2603:10b6:5:39d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 15:37:55 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22%2]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:37:55 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Jack Yu
 <jack.yu@realtek.com>
Subject: RE: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Topic: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Index: AQHXGyBUo3rV20sE6EuAEjA6SQ2kC6qINiQAgAADSwA=
Date: Wed, 17 Mar 2021 15:37:55 +0000
Message-ID: <DM6PR11MB364290806B23636B6D0618DF976A9@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20210317110824.20814-1-brent.lu@intel.com>
 <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
In-Reply-To: <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [111.248.46.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4d6cf00-64f9-4694-7af4-08d8e95aa2ac
x-ms-traffictypediagnostic: DM4PR11MB5501:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB550177D33677C3CF0086CF20976A9@DM4PR11MB5501.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IwVyZI6laT4JsTVZMI/9+Ci6vi8vIeoyVDjbhP7FEe9fdfwHTGIbn48CFQ2cpXMbNAOdGPhYHnhpgyZGfpFpqHCRVFxl3mJTDqcfyB66JK8gd/bZW8B7mFgLl14kj1ZEtpxZzXSe3JY6Q1LYviuX68XabUhVH2roSzfGI/auTGR+aLZ9n/0DVqICt4UDJFALqPC+aQtXBlI+k+szuPmak5yzuzRRkkMCo3pTgcyPynDOvm2eE2vGSep1Mf1GH42nR6I7BXmOXGJp9hKw9p2j5bnw78AR0q0bNZIVTad7jY1AcjCWz/kIlZ70+OacCNzYKIbNUyhayZvZvwXcZhh8BDfyqmxnZ3LF04Vdhdz7EyBiRnJkWevDPr/qoS7qWdgY4HCdON1BYrjPss484ZlFINrwkSZqjJj2+VuHy9t+ppcKaaj5XhLyfoGELSzBWcQirTvOyrQQ5c6HuQD9Et0E9GF8JBkMsoKVNhzSCfWkAEkoh5DWVPx3urimN6AtZwQpeGdIFpLUE0scq3ml+Y9bIwH/okrWMfmd/YcCDglkpbWyS3oeFmhDZ1ONZF8Q/wHJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(366004)(136003)(316002)(478600001)(110136005)(54906003)(6506007)(9686003)(55016002)(33656002)(2906002)(4744005)(86362001)(71200400001)(26005)(66476007)(8676002)(7696005)(52536014)(66946007)(66446008)(8936002)(64756008)(5660300002)(186003)(66556008)(7416002)(4326008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y0V4WG9GT3NLOFA1alZvQUhLcVlSakxXamFRTjFFa0lURUtZVmxDdUI2MGJn?=
 =?utf-8?B?RTlkaHd0ZjR3OVk0QjFBQ0pCRjhHWUFBMTNBeXR5MnRQNHNUQkhIU2VEbVZa?=
 =?utf-8?B?R2ZNZHhIUktFYXVCQTdKY3dmbE5nUFRTVlpEbkhpU1QraXdib2pFaDdMSEZX?=
 =?utf-8?B?SGR2ck5LR2ZqMjdTWkJJRkhkZ0VRSXdHWG5JbkNwZFE4Y1NGRVNBdUtmMWJi?=
 =?utf-8?B?dEJSQjArUlMrVXNra1dqMDg5Uy9zbzhxQjlkVTJwNlFtQkw1STR4bDFQaTZq?=
 =?utf-8?B?QkV5Vjg4cG9sa3YzZFBld1VnRWdGTnQxeHJUNENtUTE2bUt3V1pmYmJHUVVT?=
 =?utf-8?B?STJmR2hITlhKWXNVdkhsSHMvOUpLQmZnWWVuaGgwRFMyRTFvRlczdmw5eWxH?=
 =?utf-8?B?MXl6bytRUUhJZVl5U09pRU9hRm9yT2JtcDhXcW1oNTVkM0hkd0l0TTFDTGZB?=
 =?utf-8?B?RFRqNlcwUU8xdEU2b1BEZjk3UjJJZ21vTjFHV0VKcWdyWDRDaWlRUEJ5bXhP?=
 =?utf-8?B?ZE5GMjdOWlAwUVBJeXdZUktmbitkTkJpbnF3d2J1dWRRd0FlYlZuVVVjUUFl?=
 =?utf-8?B?am5xMFh0TXpKZ0lBc21zZm5kUWJZV2JoQU9ncGloQ1pLYUVCejZMdENFQWk5?=
 =?utf-8?B?c3pLOGNmTUtaSnJONUhnSXdEQ2JOaTlKSzlja2NJbHlCeUJEbGk4ZXJtcXlU?=
 =?utf-8?B?aDd1TUNqZXlYODM4UnRjeXBKbWVoZCs5N2QvVFB4TkxsWG1NS2RiYlZWL0Vt?=
 =?utf-8?B?YlNsM1NlUDRadHRHWm1lbHJEQ0cyYjZjdFA3TlZ2ZVZYV3JTM2pVK2dEOExL?=
 =?utf-8?B?U09IN3JLMklnMEJ3S1VvM3h2d2RKUUFKblRxdy9FUHZ6STBJSDB3R1Jnc0Ix?=
 =?utf-8?B?T0xHR1o2WnF4Ry9vUFV6Vzkva2M0TnFwWVp1WEhTejBVVDBpTFRid3ZBcUFh?=
 =?utf-8?B?SHVxektwUUlMM2phOWw5dXB1cWhnQWM3dEFXRHFKcm5FaG9udzZqRFVCcVJJ?=
 =?utf-8?B?QXJneVU4WHhIRFI4dVMzSkMrclU1VzY2Y2JxdmE1TTJubTVSRGVVSVhKNEtq?=
 =?utf-8?B?NEJUdnRpT3VjT3dXbUd2RjBUZUVkQ2hPUHhDR1FQalkxM0pFMzhneng3VXhl?=
 =?utf-8?B?YmZLaGRWTktvL3VOSHBSMWRiaFo3NHZ1QzFlRVdESVI1TzU2TGpKeFNPTllE?=
 =?utf-8?B?djR6SGxDK0hWS1RhQmM3TGVGSHlDTkdvTzBvVVVSVGJJdFY3VmdNOWVmaXFs?=
 =?utf-8?B?MGplczkwQTRLSWNVR0NwSVZOZ3JXbjZRMENjTHptL3FuSi9IVkcrbExTSWQ3?=
 =?utf-8?B?akxubmt6V25OYmhSUER0UWZLSUpJZjZxSTBJcWdMRFhQSnhjRWVEZzZma2lk?=
 =?utf-8?B?WHJMTEp2elZFSU0waDRPVXBnNGRhcm9BcVZ4K3BIRG5VLzBtY1VQUE9OK1JD?=
 =?utf-8?B?cXduKzZwRC80QWFuU3ZVeTlPOEVobWpDbllsaTlqcWcyNG5xZjlSSDBnRE9N?=
 =?utf-8?B?MnRnTi9Jd3hnMzRyZFZTWlpTcEpKb1Y4RTBEMzR0eDZ0VDVLSWg0MW5zK3pB?=
 =?utf-8?B?QktGVVE2dk9YdUVZY0thdWRRbVBhTHBsYkpWTHNiYnpPTUgyckFBQk1PQlVM?=
 =?utf-8?B?YzFxYkp3ZG14RFV0SWUxRmxVZ1dKSFNoMlJwQThXajNhakNlOFl4SjZocEdS?=
 =?utf-8?B?aGRyZjN1LzJtb1kzM1l3TTZoUVd2RXhGdFlWOTgxWEU4YTZtTUZPcWtIMFMx?=
 =?utf-8?Q?lTldnL0Oz3bLQ7WPXKAO8mgiXni+SOwaOAgL7aq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d6cf00-64f9-4694-7af4-08d8e95aa2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 15:37:55.7516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZ3Aw7b3nlJMYIBzM7e199Rr5WK/q5vrIvepTdbspoNHyZUabCs/U/TaKeukfTlAMwliuDloGybRBzMQ5/OSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5501
X-OriginatorOrg: intel.com
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jie
 Yang <yang.jie@linux.intel.com>, Takashi
 Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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

PiANCj4gVGhlIGNvZGUgaXMgbG9va3MgZmluZSwgYnV0IEphY2sgWXUgYWRkZWQgYSBzZXBhcmF0
ZSBwYXRjaCB0aGF0IG1ha2VzDQo+IFJUTDEwMTkgZXF1aXZhbGVudCB0byBSVEwxMDE1LCBzbyBz
aG91bGQgdGhpcyBwYXRjaCBhbHNvIGhhbmRsZSB0aGUNCj4gUlRMMTAxOSBjYXNlPw0KDQpUaGUg
dG9wb2xvZ3kgdXNlZCBieSB0aGlzIG1hY2hpbmUgZHJpdmVyIGlzIHVzaW5nIDQ4aywgNjRmcyBJ
MlMgZm9ybWF0Lg0KUlQxMDE5IG5lZWRzIHRvIHN1cHBvcnQgdGhpcyBjb25maWd1cmF0aW9uLiBO
b3Qgc3VyZSBpZiBSVDEwMTkgY291bGQNCnN1cHBvcnQgdGhhdC4NCg0KDQpSZWdhcmRzLA0KQnJl
bnQNCg0K
