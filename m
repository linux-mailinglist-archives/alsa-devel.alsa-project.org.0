Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257E54AA38
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39C81878;
	Tue, 14 Jun 2022 09:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39C81878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655190897;
	bh=WRNmI1CxcN7z8HQuIbygiHzYGfAEnTfk7dN9+2LkR5k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f943IMVxeYOY4VlgL5ge+G71OBCwLo3hhmHzXz95k0IUlk7eigNXu/irZH7X5JuLj
	 UIWqWkGb+D066CN0hniZcguxaq7VLhP748jQ6uok+aX280MJWqKEeR8OeVq7A3JeD9
	 +ymFtNBzzFN8mBoBJF7FkGKeXf1VMOFwXZeps6qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13475F800E1;
	Tue, 14 Jun 2022 09:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B121F80139; Tue, 14 Jun 2022 09:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B48F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B48F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="evBvc0Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655190831; x=1686726831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WRNmI1CxcN7z8HQuIbygiHzYGfAEnTfk7dN9+2LkR5k=;
 b=evBvc0HzBGKAkSf4NnhHOycmcoTtzc9tjt93rZDLCKE0kdJrXMWliBeg
 JgB19xgDF/ayUAkw/fCNDKrPCoIkhmGm6IhNRW7JywHVJ9c6Gd1q/gABA
 aYhWK4lBuK9tDA0vfBxVpQAkjCXuhsy5DJ+pkwTTdrSzJHLaPdRSVNe+j
 TWY7NhLMP+o6WRviiZhnMe2uHmRNsVSyd8AYrIXJLIViM3DfdqXz+oULh
 Tl7qJ5gaUyIPMaDEnOlSeAtS/Jjgm3Qsn1aG4N4x9l3JuMca5gFhoM1Wt
 rKov+yUtd7PNCWHkOUCpaQk/jxJTydXUhNYyp/Ten/sldjxOmQ53668nV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279573485"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="279573485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="673732936"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2022 00:13:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 00:13:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 00:13:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 00:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbgVI5HgBvFYHkd7j6b/7JaVdFEv4gVMloVeDw3PrSTk4CvS+hU9fGLk8d3w/ogHvSDfsm6AkP41e0uTFH1MuzsPU8mSsAEJ8vyPgW7lE5kz20fbCv2MsCRUWiWvksN0A538sdjWwRz/tAqrvzhngKF+dJUxL3J4yQED41MXwNe2Lbte/9SF/LxJpOHTRZXJRAiKraFBnhiEyz62ubsaEBVPL2vrqaAcPA5Su4UgcT4mgA+RbWvMVtn1+x2hcB6BzpnseAO4IX2uImLn/2AQfg3nwOhGPg99EOiS3yn3yZY2e8LqsWGwr17LMhunGk2qTXpPEaMjetxoWAWOCg5OUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRNmI1CxcN7z8HQuIbygiHzYGfAEnTfk7dN9+2LkR5k=;
 b=XKt+Sfdsutr2I95B6sijE9kH1BuEGbDNTlY0MvbAWW+/B5Lv1U539ewOeYEJ4m0U1lqD6HFtql8SAq/IE7OTnAbW8CRbP5MyZQdeTZKvkCYkYw1sH1xI8vczeBW9XnXA65VlJtaDN0ouHEiofcysIW/0ue3pWDdvsosPyJJDtRMQQlTh07Jn9qertC1+lgi2UesiAF47huAyC7xHUMkKk/KteBeES7qyCWLULq0h/TW7qq8Rm2hyRNwFSL1ZgT4oXwcI3hLDAnZJI3s0deLbSJbyvSSQyrc+Fn4KVFDWVNXBKcjppWnP83n3bQ3O8N0/6dr7mJuWGa3uDLdKRhbY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 SN6PR11MB3519.namprd11.prod.outlook.com (2603:10b6:805:d0::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Tue, 14 Jun 2022 07:13:42 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::9da6:c84c:3112:7c3b]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::9da6:c84c:3112:7c3b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 07:13:42 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 2/2] soundwire: Intel: add trigger callback
Thread-Topic: [PATCH 2/2] soundwire: Intel: add trigger callback
Thread-Index: AQHYfHLSKQ+GFe91u0OO8MTtkw8Vx61IHEUAgACep4CABcfRwA==
Date: Tue, 14 Jun 2022 07:13:42 +0000
Message-ID: <DM6PR11MB4074603AEBAEE96F84A75976FFAA9@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-3-yung-chuan.liao@linux.intel.com>
 <YqLV7qexsdhCI7ZZ@kroah.com>
 <0c493f72-de7f-4c57-f1d5-47f982abc3c8@linux.intel.com>
In-Reply-To: <0c493f72-de7f-4c57-f1d5-47f982abc3c8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d408c0d-b5df-4a82-1f25-08da4dd5698f
x-ms-traffictypediagnostic: SN6PR11MB3519:EE_
x-microsoft-antispam-prvs: <SN6PR11MB35193DE5D42E7E500868212BFFAA9@SN6PR11MB3519.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8fpEIiDURTWBirbALcaLl5aOGlZjFn3/B5OndBswhpIQmGgR81LCKj6HyadoZTmMNXaO4VjWHmjr71WJf89cDrABXPKVpNi+YffuKGRXu4H0TooiV9C1KNXosSktqohXaRbDwoE9IXKHww6929T2yYk7pMsMXQFkAq9I+7Qw4Ntb/BEvQA1mEfSJ1Lj/OIiAGRDkmJsjZ+5GaZXdGkssjui2WEy0oHVEdIYFS1Nk7MB0HJ7QrsXOeC9M9ITvUbLNn5qU/A6aohA3KKx/NfWlOtAbRU2cajlhO2l8/+0k7sFZ0qFzBFHjktBujA599GMU6a+Jcplhuu2Un5/4OqAqoOQjbbu4TB1d4qlF3uQ36JGl/omdM2ak2XIFcjlkT500kHzsfWBcxUCw+JU7ondY56undmptpVnV3I9d1M5pWK1I/ZJsx/wPG7NhAOejQ1LKOfIXwqyI0A3I1QE1dYupAx45nNDNTkQvnngC0P18e7ZHZZISu+BGgrja6gNVWhKVizA/aDoZzbmIsMSgIaMuK8mCmS8E+eJskHJZRTCt2Mq4l8ldWUXxC5bghuYAw0pqmu3cjmhKIW3C46iuhPFIWvcuR/vOmCykdeb2HvDtKcu1iE2cyie1yl6hEktiepR7eC8GfWuVHN5Uazenye4NVAgu5pdtyIFT8OlWdhh2hWiSRDu17rl+j01aHpxIRjtKJoNcifnziGMx3gbonzECwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(82960400001)(55016003)(110136005)(122000001)(54906003)(8936002)(33656002)(508600001)(66446008)(52536014)(4326008)(8676002)(38100700002)(64756008)(66946007)(76116006)(86362001)(66556008)(53546011)(6506007)(7696005)(4744005)(38070700005)(186003)(26005)(316002)(83380400001)(2906002)(71200400001)(9686003)(7416002)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2xFbm02dUNNR3Y0VzlxaGI1ZGFvQVNUYXZ5Mlp5QktkVDNBSTU4TndjZ3Rh?=
 =?utf-8?B?Lzk0cVZwcXU5bWNCNWxlZ2swWTNTcjQ1QzNSUDRtT3cvR21PVWg4TE5jMlFF?=
 =?utf-8?B?SVgyNEp4VDlPSEh0UUx2Qm5EbGJJUHN1c21OT2VXbVYvaEYrYnNHSVdGcnI5?=
 =?utf-8?B?LzIyOGd1M05FZGdaVkp6RGdrcnVwdXdkcnJSekY1dzdpNjdFSkZtMzU0cWVj?=
 =?utf-8?B?S0tJdmtEbjVFLzh0M3F0WDR6amxBZmJvamRUZDg3R2RNb1J1aFNkOWsrMVo2?=
 =?utf-8?B?UkZMS3JyRzJkdnFhbEJaYzkxaTRtT0lQNjRHT3lqc0pYRnZXcEw3K1RjbEhS?=
 =?utf-8?B?NlVvN1lJelZ3YWk4b204TGpSRWloTFpZQ2lWVEVFclZhUUNpaS9oSzhrUDBu?=
 =?utf-8?B?aHNpMHpnK1dwUElpWkFabVdUeHlXWnlRMUxNUVlpM3A2ZUs5My9HN2lLSEw1?=
 =?utf-8?B?VWdvSkRsN0JGTGFZMmpFT2tkajF3VTVrZ0FFWTVkeDNGWG4zTDlzbG0zT2lB?=
 =?utf-8?B?NTl1QTdvVjMyU2hlN1R0eWtWUDVSWWdjNEZ2ZWZxY2E2RzNqWnVZbFVuK3h3?=
 =?utf-8?B?bW1ONFJPWTF1UDNzNC9nbTRCNmtVQnAvR29BUmV4WGQySUtOYWFVSFBvbTZJ?=
 =?utf-8?B?UkhNcERmWnJiblFNTzVydy9QWFI3bldTbUVsbjNBbVhDVk5GdFV0TFlNSzBT?=
 =?utf-8?B?eDUrc29IL0dpN0hBNlRBd2Z3NlBmMXdnM3AraENJSjBFanpHb2N2L3pmRTlH?=
 =?utf-8?B?L2hRT0lTc1hLWVBnb1p2NFZjcHJTY3FkU2d6MlQrYzcyVmxVUnJWVWlDd1A2?=
 =?utf-8?B?R09aY0V0WE4rZytDMW1aVkRjNlR6TVl6aUN6Qmo5aFk0Ly9oK0RGUkxaMXNz?=
 =?utf-8?B?R0tyRUhlRnIwMU9saEtiaXVoVUx4a0w1OFdmYWROV2liR0RaNmlURE9pbmFR?=
 =?utf-8?B?eDY3UFp4RFJ2MWRBUjhxNVdSL1J1L1dkV0JVOGFZV2lFZnZpamZhSjh0VWtm?=
 =?utf-8?B?b2hYVHVHL2IzK1QzZVRwaXJmZk9udXcwRVZCMjk1dTNueGNLdzlWK0lpMnFM?=
 =?utf-8?B?RlZyb0xNbzdKWjEvbmE2N1p6cnJjMHV6bDFoMUQrL0JqVjc3cVQ4TWk5Vk8r?=
 =?utf-8?B?Zk5RSXl1SFUxTU4zK3N4enE5NnZtZmdWRk5ZaVpqL3R4Skt5aXJjL1QxTjFk?=
 =?utf-8?B?NTQ0NHJvY2k0QXQ2anVxV2NGWlJiRlRBWjNKSjh5aHJtVW1nWkwzZlE4aHFV?=
 =?utf-8?B?U2dBRlpPUXgySkRpeUZIY0ZuaDNiN1lyOThMTWF0UUlCeWcyQVAwa3RNc1pp?=
 =?utf-8?B?VUV4cTNjaENySkFwbWU0MTRicC9mOXBnOWlJa0JZSTkzVHgwUmhETTMrWG1m?=
 =?utf-8?B?VEh5a28wZlVZeTdDa3k0cjNTUjNBZVNXZklsMk5OM293TE1hZUpsTTdDalhu?=
 =?utf-8?B?UnBSVG9qMUthRVhOZkV5WVZkc0xZbTdERXhmVzRFZU5UbDYrQkN0d0pqZi9U?=
 =?utf-8?B?dytNSXJXZGlBVm12UFdObHBMdm1vbEQ3a2V5N1BxOEFUb3Z1WncyS0hRYWpZ?=
 =?utf-8?B?S0RVa2x6M1NvWFkrdElVZHlhbS8yVDhQbGVQZE5PaUVSdmdlYnZUd0ZhVkRv?=
 =?utf-8?B?MWF6K3NrUGwxREEyZGJTYmtvSmU5NTVzRUVQVjlZYlNIOHdTV05NTVArU01C?=
 =?utf-8?B?dVhWenFnUzRZODhrdm85elIrYVhkVkdrc0Z5UUxVV1BwQXBmY1pyVm9GUHhV?=
 =?utf-8?B?YVpqUkJMNnA0UHhRYldVWjlEOUxtSWJVdVRBTGNnMkdJWnVlVFlTbE13bzFr?=
 =?utf-8?B?dEdNeGR4em9yN2xManl2Zmt1Q3VWbi8yYnJCNFE1dzZCNXl0endYSlErU2Vi?=
 =?utf-8?B?a0NzQTFiWDJHeVVSUVQ4aWgrM3g1UC9zbHFrREJhRUNpODR1OTNML3Z5Q2Jn?=
 =?utf-8?B?cDJwL0JuN1lHSDdzeHVnSXNHcE9SOGJoQ2FPTDVzT2lOU1JZcFdZMXdXSHJE?=
 =?utf-8?B?REFSUit4bnRtZmQ4R3AybmxmbjNvTmkydGl0TGhuKy94Ymd4Sy9FZFJMcWZ0?=
 =?utf-8?B?M092QTFaSU5UZTl0Z09WZzJlV3NoRHQ3UklOWkdOcmk3VEExUitYeXpENlRU?=
 =?utf-8?B?VmsxbDRBalpBWng4eTVheUpqRTk1cWJBSkJoN2JmL0VRU3dka1FOS1UzZWJ0?=
 =?utf-8?B?dHVaU2c5S0Y1cWFjeTIycnkvU2RFTkFWVW5OUFFPeHNuNlFYQUtrZGkrWHNM?=
 =?utf-8?B?TDJPZmxUNWViMkZNODRxc3VjcU14UlMyY2x0UHdwMEZxYlJ0aEd1ZlFKUzBM?=
 =?utf-8?B?THFNdUEyWXVnaDJIaVppQ1FJNzNrSmVvZ0txTnZpVkowYjArV1dBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d408c0d-b5df-4a82-1f25-08da4dd5698f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:13:42.0550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/z1airP8rdzHRr7yJ3ZR+bF9c117LrFeVF11slkzexgVRm7YoTG8gSuUupXcXTkkOJ8HhcicCt5GMFGbdyJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3519
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXks
IEp1bmUgMTAsIDIwMjIgMTA6NTQgUE0NCj4gVG86IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPjsgQmFyZCBMaWFvIDx5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNv
bT4NCj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgdmlub2Qua291bEBsaW5hcm8u
b3JnOyB0aXdhaUBzdXNlLmRlOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB2a291
bEBrZXJuZWwub3JnOyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IHNyaW5pdmFzLmthbmRhZ2F0bGFA
bGluYXJvLm9yZzsgS2FsZSwgU2FueW9nIFIgPHNhbnlvZy5yLmthbGVAaW50ZWwuY29tPjsNCj4g
TGlhbywgQmFyZCA8YmFyZC5saWFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzJdIHNvdW5kd2lyZTogSW50ZWw6IGFkZCB0cmlnZ2VyIGNhbGxiYWNrDQo+IA0KPiANCj4gPiBX
aGVyZSBpcyB0aGUgaW4ta2VybmVsIHVzZXIgb2YgdGhpcyBuZXcgY2FsbGJhY2s/ICBXaXRob3V0
IHRoYXQsIHRoZXJlDQo+ID4gaXMgbm8gbmVlZCBmb3IgdGhpcywgTk9SIGlzIHRoZXJlIGEgd2F5
IHRvIHByb3Blcmx5IHJldmlldyB0aGlzIGNvbW1pdC4NCj4gPg0KPiA+IHNvcnJ5LA0KPiANCj4g
QVNvQy9TT0Ygd2lsbCBiZSB0aGUgdXNlciwgdGhpcyBpcyBhIGRlcGVuZGVuY3kgYmVmb3JlIE1h
cmsgQnJvd24gY2FuDQo+IHRha2UgYWRkaXRpb25hbCBjb2RlIGluIGhpcyB0cmVlLiBJdCB3YXMg
c3BlbGxlZCBvdXQgaW4gdGhlIGNvdmVyIGxldHRlci4NCj4gDQo+IFRvIGJlIGNsZWFyZXIsIHRo
ZSBPTkxZIHVzZXIgb2YgYWxsIHRoZSBzb3VuZHdpcmU6aW50ZWwgY29kZSBpcw0KPiBwcmVjaXNl
bHkgdGhlIEFTb0MvU09GIGRyaXZlci4NCg0KSSByZXNlbnQgdGhlIHBhdGNoIHdpdGggdGhlIHBh
dGNoIHRoYXQgdXNlcyB0aGUgY2FsbGJhY2suIPCfmIoNCg0K
