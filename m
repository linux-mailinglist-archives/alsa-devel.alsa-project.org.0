Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07376581804
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 18:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55FF315CC;
	Tue, 26 Jul 2022 18:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55FF315CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658854769;
	bh=uHIj9StlUZ8plNhtPBw+CqWk8ZFyVR9d6b5N7rpd5oY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKXn2GQnWYd4jkfb8WssulsboKBtqVhAHeu4AF++LjZtHU0B2q5ObBIYbPQCn9V29
	 kYaN8uanhms5mMHInLA4jXqS1pZwExW6lG7NC+JKTZ2Wo42H4LNrnS9eb3nZr2FL3E
	 ObDPIU3tpffGQZ2/V0uBJTLAlhDhPg76mYYwTozE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B1CF80271;
	Tue, 26 Jul 2022 18:58:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7172EF8025A; Tue, 26 Jul 2022 18:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26175F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 18:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26175F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dyUPhB9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658854704; x=1690390704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uHIj9StlUZ8plNhtPBw+CqWk8ZFyVR9d6b5N7rpd5oY=;
 b=dyUPhB9pFLJPtJlF+JaFKMGe7nFR2XbTUxisyAmMhosWDj8mMU9Cyixx
 8r6qVn77uQj2TODm8wppq5ZHh55MyQHr+tO/aRLkSgeTdeC66XEWyeqIQ
 b/1Gc8T6Obvo/mczCZy4R3d+hTvUuV8mXZAXXcUcfzNvsFWzOYq3CqsMg
 8WohyUKUiG25cxk1JR5dd1VWG1HpS3ao3K11Z6jrW8iSLLduYY7r5JP1L
 p/0D1/+sgC4Irwxt7LcHmxJKOpvNXV9YJX9RKF8agvQVf2OdQhDu2wnXg
 mYy7+J3sgjrdYGqo23Umv098wLGt2iNwECuhdxaDGGthFGYuEcoJPUpLC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="271042665"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="271042665"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 09:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="550476409"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2022 09:58:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 09:58:08 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 09:58:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 09:58:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 26 Jul 2022 09:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njcq7i0hBAK9VJf7ZYmE7rO4zu4umMfUgLsBf1+UtP4+9NIiZ86WA+Et8nbM3nhZcHFiqbPsAYvFEo5NuVDH2pxp6x039UJcL2EbYZWFM/UJRFL1avLP1+HZpARF6IWOnAkT1BcO6DFZBwvDlQiRzWae68ILaCBMLReYYVIa8gMGHGfQZMswlfufX2oqllDyn3WxFA876QmIAQIgZ/zoC5zwS7TkAriv1nUxd63dXNmMI9QrDuYbSK6orWNVDKWIXUaUvgsLn3LRXsINLAwelO22zpvOPbcY4QnqK8466bzlcJk0J58XN+eavZDyJXbDWrolImctB3P+x0Ab7Jjjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHIj9StlUZ8plNhtPBw+CqWk8ZFyVR9d6b5N7rpd5oY=;
 b=B2PoG3fO1IWtJzeLmc/j9c1CEjk8EPNOOFOcSHUbWUL/5/NoyyJ6j6JClqK/vgjajJPZtQ4Y0KhSEeCmPBevkV6+Y/J307r6EB/Ur/9qPdH0yPeANaJq9GR7qk1Icni7yIt0cmQLTjDnOzFavZLKJVa6Y9ZMF7H8lVOpjEh+D7j2pZeXzgEkgWi4F/UdSEbwA3gwofOTg8EKnwOjkLNDFQoyb4hEE8k2eV3I2cBO0+cZxeeeg0b3f3NT1QvpR3qlRxZ9rhZwd54SA40Sy9Y81jJRuqJjJppp4HRX8+o3erSGbwUkShq7Sqqjv9oVAr7jZShJgjLsJLF9lif84xaCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 16:58:04 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::cb5:9c1e:a762:adf9]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::cb5:9c1e:a762:adf9%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 16:58:04 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Stefan
 Binding" <sbinding@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, "liu, xiang" <xiang.liu@cirrus.com>
Subject: RE: [PATCH v1] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Thread-Topic: [PATCH v1] ASoC: Intel: cirrus-common: Use UID to map correct
 amp to prefix
Thread-Index: AQHYoPY2KEX0587oykaqFUn/l52GJK2Qt5eAgAAen8A=
Date: Tue, 26 Jul 2022 16:58:04 +0000
Message-ID: <CY5PR11MB6257BEB1022820E41A5EACAA97949@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20220726134634.2842185-1-sbinding@opensource.cirrus.com>
 <013c0854-5b8e-6968-1ab2-88f2d0b142a0@linux.intel.com>
In-Reply-To: <013c0854-5b8e-6968-1ab2-88f2d0b142a0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da9adfbb-8d1f-454b-423e-08da6f280197
x-ms-traffictypediagnostic: SA2PR11MB5099:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gb/f79yvLom0ZAD4JEyYTkgmAf6YuLoeaSCaiwy0cb7jSBNNo5tKfHfJUp7/EmW6Nhs2LSFUOqEyps2XPyk/pkmEcn/TNJc91aCOw4TfTeUgKFZeqpfuDRGw/eKEzZiujdUHTJv18szXykBmRz0m6EDELBDmf+kmUvshNuuJezo/pCXWG5UnMOzOKQgscHwSrzGvyXGBrDlqU39/kAMrInZU6rzKsTqw2XIU3xuM5GuVK7dV5mdmoOXdeyL9Byx5UNu0Ds0IvDRGHzUn6sbWpWt0v9wErjEqTe0Pw7JbuMvJBTi2kXB10WkHJFNe0ddLswVmF1xb50ZS6TlIWcPsowZk21Zk/Vc9+ggtWNWJujMp0utrWI+f04SbNA0dFMM5sb5zYbkMGDesXWXB2zXkhdb/elDOSRcXztyPt1RM8zdStu6+ZUm/CC8mYMSBdSzGxHxNxGxJJqyitTZyEnibpkW6b5+3NjWniTwph22SbZ4D8b49iTSAh3WFHd3N3v3eLF+mPw/HnFKo2Say09GQ0DTsSI77tsNif0MDyCEcYFHvYM2ls5GaC5TVLbl40EcBTHW5Yj43Pxyj7shVix/KHjHS+CuNO1h4WrgFKCUGxVC3UUcCd/lG9u64Cp0gY4GPfqq/fzdwlfXRdXiTNSbljtIrH0fsWvV5M6VeKVwFqvEC/wJma8Kw5DyiqzHKMjWXYmB7kt4aELetV7HzSXQATxbdGKf5jny2PHDYkhTye5R8lJdS94ucr3zI3OJUFCM91M0wGr5TkiMiRPNI81CYMcMczCIizzl+rx44jOx40vppOMW/BDzyQ4fgwNjGLpGOPvzBUI8fK/3y/XKYBoL5ww99iOIpOsIOB/hjkTdz7uQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(136003)(376002)(346002)(110136005)(2906002)(54906003)(41300700001)(316002)(33656002)(86362001)(64756008)(66446008)(71200400001)(122000001)(55016003)(4326008)(83380400001)(478600001)(38100700002)(8676002)(76116006)(66476007)(5660300002)(8936002)(66946007)(66556008)(52536014)(26005)(9686003)(186003)(6506007)(38070700005)(7696005)(82960400001)(11716005)(87944003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QU84UWdIdHY4SnUwVnlNZ2VTdmJVSmk4aEplWnhBT1BTOHRmcFROZ0lBcUk2?=
 =?utf-8?B?NEJMUERjZ3dEbW5nVmxPWXNRV1lhWmhVYjl6NHlyY05YRmFBbUpYdnAxSTZs?=
 =?utf-8?B?YVV3MFRvUVJIaTRJZHdaU29iSEoxR1RjaUh2OUlwaEszUEJoNG8vOHY0eDNu?=
 =?utf-8?B?RkRBVmRQamN6czloa283LzlwUGdSL3Y2THhrN1cwV3BFa0t4bElzSnJEQ0t1?=
 =?utf-8?B?dXpDRHU4dk0ySFMramR3WUthRjg0TGFJTTE0YS8xKzc2VW5iOFcwRWxJSFUw?=
 =?utf-8?B?ZUNpQWQ5c3czbzg2eDN6RC9vZ0NzSzd0YnFERHRWajF1S0FHNTJvZXdmNlRu?=
 =?utf-8?B?bUNRZUQ4bWlrS3o0WjNQTWJ1MXZlY29hRHJveE5rRUtHN0N3QTZPTTVUTG1p?=
 =?utf-8?B?N1g0b29NWkhGRFdScThMNXdYWFVjbnMwVGFMUWtJcGQvTEc3a3dIWk1LSnM0?=
 =?utf-8?B?V0tIbk1lOVBJK1RQUThpcnZtUlVmNnB0Skh2ZXNhNVljMVMyVlRJNmRxekJ1?=
 =?utf-8?B?VE5lSHpkZ3lGUFRSTnMxRVpaNy9vS0hubDhpNHZ1UVpMNXAzdmRTeVB3eHVv?=
 =?utf-8?B?aVVJYUNadWZ3cDdlWmdiQmNmQTE2K3Z5ZHhqZTA2cCtiRnRTQ2Vqbk1TTVN2?=
 =?utf-8?B?VVdTUHE2alkvRHVKSU9qVXlRdDVGWERqc3ZYSGxkSFFoc1JmaUlabGdhRE5k?=
 =?utf-8?B?a2NmZFZKclZUWGZndXpmVmIrRHZYZ2pXRDlRMlAxUWprclBBMWtDa2hGaWFG?=
 =?utf-8?B?a1pFclQvYXZBQ3VxV1dtNlBzQ0RMcHJFTzZWTGwyZno3Y3VwMGxWeUFyRGVh?=
 =?utf-8?B?R21LUkxUWE05cjI4OThIYnRhbldTWnRHb2hiQVFnR2M0OExoTTY1VmZONENu?=
 =?utf-8?B?RGJtWGp0bzQ5b011ak50d3hXQjNmK29vUy9DT0x5UVE2d1lsUVNZSi90WlJT?=
 =?utf-8?B?NlVwWkJ6bzR6TmdybDh6Q2NBK2Vpc1BOL0ZBVXVML1U3bWFEWlNPelZFMjZx?=
 =?utf-8?B?OXpyYmpqN1BjcjJ2RjBEaHdEVUE2L1ZLWXhMV1B0UHY1WU1NMjVhTkM0SVky?=
 =?utf-8?B?UDBwYUFGYWplSHRqUjhqaThWWlVvdHczc0lUd0FINDk1dDRIcks2Mk1FQUhi?=
 =?utf-8?B?S3NHTkl4d2YwMGxLVmdoZ1U1MUhSK21wQWR6RW1jNFJ2ckthSlNaM3NteUNz?=
 =?utf-8?B?SVEzbGUrSnRycVlSSDB1U2Q4WFN0RjNONEg2R0Nha2ZNZGo4Qm1kVVlRMHFD?=
 =?utf-8?B?YmxaMk5Rc3lwa1NiVDExMUlLZ0U3bUFhZWp2K3hUMmxNVGgwdXgweXQwY3Vh?=
 =?utf-8?B?Ry9MQmxSSWErcFE3ZTBmemxVY3NGUUZ6bGZVR0NRT05jMHlDSWY5S1IzWlRh?=
 =?utf-8?B?R0FyWGk0RWErZEpodEVsODdqN25nZWU2cytnZ3k2QzJBbjY1NndQQVBrc2hJ?=
 =?utf-8?B?N1VJa1piUktjazl6QWllQ0RyVTBFU0pQRlozcFh4UE1yYVRIUm9pTHloZmJo?=
 =?utf-8?B?aGNlT1lrRDJrcEZ4aHlaVythMkJRMDZPUHg4NzN4STJjOG9GbU94NzVqVVQw?=
 =?utf-8?B?NDRRWURhNlVzMG9Sb1lIa0Q4Sng3blVGYk5IMHNQWFl5aGxEVEVjekJ2bkJF?=
 =?utf-8?B?b09aMHlKR01YZ1RJdjVUczNzekxhMTZzT1Vnb1hDKzlFSVNYZDRucnJnWHRL?=
 =?utf-8?B?QlQ1dm5Sem90d05naWgrY1ZjTWV2YnRQV1RKVWNqZkF5WmN1T0hsWE5OSWhm?=
 =?utf-8?B?Z0hGdGVUMWs4Yi9Ua1JKOXF2TWZlcGwvTW1CVkdIU1l1VWg1VDFYM2t1K21Z?=
 =?utf-8?B?bnhTWG5CMTgwTzd4dWxSazFlM1d0UklGSUI5VHJETUsrVEFTMzIxdDBnMkJz?=
 =?utf-8?B?UEt6UmJLTllhR1I2VGZEcUtFcmtWUUpSNitCZGtRaFlkeWRsNXRObFVnZ2Y3?=
 =?utf-8?B?YkpHNFUxcXFVMzBTMEx1dWJqd3dsa1kvK1ljN0kxT3N3Wm1rWWFTcW5wVmF3?=
 =?utf-8?B?RUFBbXlSRCszbTBiY3AzREtzcElLUVRMTndZMFRodVQwR0xCZ2ZCM0FLcExh?=
 =?utf-8?B?QlJEK1RrMGxRQ1JpRUtNTkJrMFJTSWZmUTU1ODloWFluQk16UDJUTnZ4LzNS?=
 =?utf-8?Q?Y6Et0RoFR26WPFDUcH83rqEjC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9adfbb-8d1f-454b-423e-08da6f280197
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 16:58:04.1786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ+tso8Agc9fztsaDHHkMY2LRAmPF/P8kmNaX/e3bDN/dxJDAWArViqeFjl2JvMbJMbqLaMPpxVjZKr3gL7j+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
X-OriginatorOrg: intel.com
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiA+DQo+ID4gIHN0YXRpYyBpbnQgY3MzNWw0MV9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50
aW1lICpydGQpICB7IEBADQo+ID4gLTExNywxMCArODIsMTAgQEAgc3RhdGljIGludCBjczM1bDQx
X2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUNCj4gPiAqcnRkKSAgc3RhdGljIGNvbnN0
IHN0cnVjdCB7DQo+ID4gIAl1bnNpZ25lZCBpbnQgcnhbMl07DQo+ID4gIH0gY3MzNWw0MV9jaGFu
bmVsX21hcFtdID0gew0KPiA+IC0Jey5yeCA9IHswLCAxfX0sIC8qIFRMICovDQo+ID4gIAl7LnJ4
ID0gezAsIDF9fSwgLyogV0wgKi8NCj4gPiAtCXsucnggPSB7MSwgMH19LCAvKiBUUiAqLw0KPiA+
ICAJey5yeCA9IHsxLCAwfX0sIC8qIFdSICovDQo+ID4gKwl7LnJ4ID0gezAsIDF9fSwgLyogVEwg
Ki8NCj4gPiArCXsucnggPSB7MSwgMH19LCAvKiBUUiAqLw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0
YXRpYyBpbnQgY3MzNWw0MV9od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJz
dHJlYW0sDQo+IEBADQo+ID4gLTE3NSw4ICsxNDAsMzIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
bmRfc29jX29wcyBjczM1bDQxX29wcyA9IHsNCj4gPiAgCS5od19wYXJhbXMgPSBjczM1bDQxX2h3
X3BhcmFtcywNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGNz
MzVsNDFfbmFtZV9wcmVmaXhlc1tdID0geyAiV0wiLCAiV1IiLA0KPiA+ICsiVEwiLCAiVFIiIH07
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGNzMzVsNDFfdWlkX3N0cmlu
Z3NbXSA9IHsgIjAiLCAiMSIsICIyIiwNCj4gPiArIjMiIH07DQo+IA0KPiBJIG11c3QgYWRtaXQg
bm90IHVuZGVyc3RhbmRpbmcgd2h5IHlvdSBjaGFuZ2VkIHRoZSBvcmRlci4NCj4gDQo+IEkgdmFn
dWVseSByZWNhbGwgQnJlbnQgTHUgYWRkZWQgdGhpcyBvbiBUTCwgV0wsIFRSLCBXUiBvcmRlciBv
biBwdXJwb3NlIGFuZA0KPiB0aGF0IGl0IG1hdGNoZXMgdGhlIG9yZGVyIGluIHRoZSBTT0YgdG9w
b2xvZ3kuIEJyZW50LCBjYW4geW91IHBsZWFzZQ0KPiBjb21tZW50IG9uIHRoaXM/DQo+IA0KPiBJ
IGRvbid0IHJlYWxseSBjYXJlIGFib3V0IHRoZSBvcmRlciBzZWxlY3RlZCwganVzdCB3YW50IHRv
IG1ha2Ugc3VyZSB3ZSBkb24ndA0KPiBpbnRyb2R1Y2UgYSBjaGFubmVsIHN3YXAgd2l0aCB3aGF0
IHRoZSBmaXJtd2FyZSBkb2VzLg0KPiANClRoZSBvcmRlciBoZXJlIGRvZXMgbm90IHJlbGF0ZWQg
dG8gU09GIHRvcG9sb2d5IG9yIGZpcm13YXJlLiBUaGlzIGlzIHNtYXJ0IGFtcA0Kc28gdGhlIFNT
UCBwb3J0IGlzIHVzaW5nIEkyUyBmb3JtYXQgdG8gc2VuZCBkYXRhLg0KDQpUaGUgb3JkZXIgVEwv
V0wvVFIvV1IgaXMgdG8gbWF0Y2ggdGhlIGVudW1lcmF0aW9uIG9yZGVyIGluIFNTRFQgdGFibGUu
IFNpbmNlDQp0aGlzIHBhdGNoIGlzIHVzaW5nIFVJRCB0byBzcGVjaWZ5IHRoZSBhbXBsaWZpZXIs
IHRoZSBvcmRlciBjaGFuZ2Ugc2hvdWxkIGJlIGZpbmUuDQoNCg0KQnJlbnQNCg0KDQo=
