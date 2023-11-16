Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF717EE7A9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 20:44:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F9E828;
	Thu, 16 Nov 2023 20:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F9E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700163871;
	bh=6kzqwHiHjDEyg2MSjh+9nkGZ6n9rJOsZW8Zj/w2X0ls=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3uvCWnH+PERdBEY0XhnjqXz1dtYQSBIGQowxxYbtA9cHwvUjhdEw5yvxu0q6iBmA
	 gEjTOsRQ+bWgRaNflE9qsoRGc+BunK86E1C7u5jQp5zmumP14eqoiaKQdHWlsBvCqU
	 Ib/1ek7zKDINPw2TnPcpcFkC+ukQvTvYLPiLbFa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94B85F8016E; Thu, 16 Nov 2023 20:43:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F24EEF8016E;
	Thu, 16 Nov 2023 20:43:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13B77F801D5; Thu, 16 Nov 2023 19:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13496F80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 19:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13496F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a0r+hd2G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700161063; x=1731697063;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6kzqwHiHjDEyg2MSjh+9nkGZ6n9rJOsZW8Zj/w2X0ls=;
  b=a0r+hd2GtsJ0+Un6ALrrT1s4AZSjsx7qFCIDhP5LrknjegUFDkfJ00Zp
   QTQkV0IvJ2Yxbgf/qImdDOtMPPbGRyVpUkazuEg/tWEUaKF/A/fr/Ue9R
   NKQYjMDG6bwxjVV9nzGRLFMCo4KVTSnffJ1FswF/Etyx4AcOU34qEHBCs
   w4oVtO8bwXZnTxa/0vuGstrY8sNem4GI6mA5YVx9Ql1dr0PkOAKroyC5z
   944wy+t3NTP9uIXuXid7o7zhMjj7T6zXZZK45+LYCXWM1iYwuzbBpOjIT
   HZjHmjP/jM7ibs9cu0ybaPwtS3dQpyHwQt+y00BR0rWWEj8wMFhZy5eeB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390940317"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600";
   d="scan'208";a="390940317"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758925723"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600";
   d="scan'208";a="758925723"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:57:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:57:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:57:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:57:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1x5e+3nzXtn+aHW7e0bN7I6/BTGGN4haM43pE0tiztkj8selk0cJlHfejCwvk99S6ZR3sWZle6iK06cUtayiiIHjXrwAi289GIZLQ5bw7HflLih5bn3uAyj5LTQgCaWHSxTxIqEmGjO/4tia5UhDbVuuFAGzN+ZAsxAiwxQosOrkhOzT5RFbUhNQaPoI7VWvc/VNtmFt1HzeVe1wAUze3jL7mi4FarAFojD/O0L+97MP2+KxUmVKrsWvTOiWwi8hxpRCIBnxqDYwhmcFpl9zYLucat1mKMNgtFV6fekVV93gGqKKOgLk4A0yr7gtrqWvWVK/lpNzKEyI/XjeGzV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kzqwHiHjDEyg2MSjh+9nkGZ6n9rJOsZW8Zj/w2X0ls=;
 b=Q14OPjbevvs+RhGh+J0iI/WWg/h+kiyfEysmstZarzoWEqRjO/3G7JH6H1XQx5M0N/AbMJIK3I4t7oU3tWSiEQ96E2HH7Y1PLcF6gNvQhemQnYuvU/NS7dWQiLznXhNDrSOIDS8QQYgbV21986Fkex36FWOLCwBGxIoc+NBE3MmwKRhqf8i9THim8ZuFNShPAcKXc59mCM+cCtnlFHP+1N8RaXzrpXWHpDyFF6Do5D4gdi+pjn3hjpwwxvPTykI13iieVI9xvnJdylr3MOGXRdY04SJsYyNWxo/J3ezhacVZHzjI+ST8l8v+HvxQYk890nFXjUOZTuzhpyNKtVfn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.26; Thu, 16 Nov 2023 18:57:28 +0000
Received: from MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::12c2:139f:753d:9484]) by MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::12c2:139f:753d:9484%7]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 18:57:27 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "kamil.duljas@gmail.com"
	<kamil.duljas@gmail.com>
CC: "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>, "perex@perex.cz" <perex@perex.cz>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Thread-Topic: [PATCH] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Thread-Index: AQHaGK6Ni9ol7E7wME+EO36Dr3gk/7B9TB0A
Date: Thu, 16 Nov 2023 18:57:27 +0000
Message-ID: <8881b6059da59bc86c0a77cf424bd24ba61b8fad.camel@intel.com>
References: <20231116132849.1534-1-kamil.duljas@gmail.com>
In-Reply-To: <20231116132849.1534-1-kamil.duljas@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5910:EE_|DS0PR11MB6374:EE_
x-ms-office365-filtering-correlation-id: 0f49984b-8736-4428-07d4-08dbe6d5e0f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hUTcu9ry/oxaSiq41Bhy/zEMTMveGRQRyPGSbGo3QY1yUSsOe9HWOShqc2fJeHWfwfBpf0qsq13xmxMPOYtyEQ86x/1GQHPHG95vXshnDze957S+dawrdz2IeQ3yKCmGvMZr8fGo3qLrKwUnr6JuyseHq3DDGYOwqyQyC3AQzH0DmAq8dUL52EEo3idvKHIyGNE1YgFDqrvDzeAfFvGki4byaF4nV85WhQIMJIPOx39yicHmmy4sYc2yRVXq3VCc6SS774jFD6FrrSmxBmur4HkweAaT3l5qAsZZQJyNh9+44VMwT72N50UBEKbyUKOln1tjeUgFsNsI81dU14Oe3We8KqXyX07bvcUmwJYbNF8GB/HfiAoC7PIlMCo0fYVd23D5Aw2mC7cgjKwRzk+a5W54Y+oHU3cHrvAtolMHDffqXeK3tg8eYW9TnS7R67oYEABGV3UeT8VLrwkrcB1lWRX22Ajgnp+Br+zlzmIe40+RoaQm9T4GktRZkONN5NpVKKArI4nnsnTzhFlTphATZSiXuygqei0YpwjD0qdWEBrQYyMwMQOuxzwYKgUsIngyzOqUwxmm7hqJ+aegS7yFLyET6OVMHCJikgN4k60k9y4Gl9xOkeMccbHDK6U9T0/H
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82960400001)(76116006)(64756008)(110136005)(66556008)(54906003)(66446008)(38070700009)(86362001)(38100700002)(36756003)(66946007)(66476007)(6512007)(122000001)(83380400001)(2616005)(8676002)(6486002)(26005)(478600001)(6506007)(71200400001)(41300700001)(2906002)(4001150100001)(316002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TzR0dmZScUNjc2R5Yi9KSGVYYkVmMmhraXZBak5oTkM0Z3BtdW5aUmJTOU1o?=
 =?utf-8?B?L1JnclJNNE44Q0Fva1dVaEhuTm5OenJUNWs2T1FwakxxQTc1a1duSXZsajha?=
 =?utf-8?B?cjFuVWtvTlJwQnVQQVBFRyt2MTRHd1RQZytDRUhiQTl2SGJKWnY5cUpRRU13?=
 =?utf-8?B?MGZTckRpb2wwZk1iSXIxd2w5TkJzYkx4Mzd1TWlhYkhhOGorYzE2VmdmVFlQ?=
 =?utf-8?B?VFhCUHAvR2JBYllRZllOSlMyQXljbUh6UUE3UnFGbFZBdmdWUStZRnJjN0pz?=
 =?utf-8?B?Unc2blZRNkw4VWNkMWlUWHBSekJXOXNVV25vdWpxQnR3aGFZUmRtNnpjWUdj?=
 =?utf-8?B?V2RPZnRsNmNlWEFqNW5rR01VRTZNNjBNRWFjOVFjMkJ4RytNdGlhVDdDR2ty?=
 =?utf-8?B?SXJIcC9TVmUwS0dSbGF3NEQwc2ZsWjhLUDBaYko2WmxjcHFjenJsZGhPOTNz?=
 =?utf-8?B?T0NHalFxamJMZWpZT2ZoWGNwem9yQThsbWIwc0lsZ2k0Z0NtYkFmQWVqdnhO?=
 =?utf-8?B?NWk0QWh3YjZROGVKYUlKVTRWNEsrYXNoWFVicWc1dmdvcVNwamdLNWRKR0Fp?=
 =?utf-8?B?NHRhbkdEZVVMdnltcVRBandEbFFmbi9YNFhGZ0l4Y1ZkQmc0TDN0UHJ2MlRr?=
 =?utf-8?B?d3JzeEVMTTdRdmh3MTFjQ21GellRTkZ3LzhEbVRyRjgwbjNvOTduMm9jeVNG?=
 =?utf-8?B?ODRQOWxRcjQvL0FjbVc2VU9wOTV6Y2FuOU5qQjhadzdJWGdxeGZYbDhtM0lm?=
 =?utf-8?B?UUVLQm4vKzJ6R2hOTDZzZ2dCRUVJL1c1TGlxbVdtdzBvTk1RWFhZa1pEcGRp?=
 =?utf-8?B?azB6UmVRajQ5ZnhBajVXTEwvaG9RcHRNZjVteXRZUEZIMThWNHJIeHd6eGtL?=
 =?utf-8?B?Vnc3a2t5c2kxZjVqMTVKUUVPV25aOW00M0J2Q0ZKRjdZSk5XUTg5MmlUcGRN?=
 =?utf-8?B?TkEzN3hYR1hzR1BKalJFYXRQMnN2YnhlUnBHUzUwU2xQWjVuWHVDOEZ3dnM1?=
 =?utf-8?B?OTRSeG5SeFhQN1VJNEhpNitYcGJrM2dKV0lJR3JDekw4NTF4NTFTSnE3bkpS?=
 =?utf-8?B?ckFhSU9jb092a09ZMTlVQlVZS252UVYrTjEyTzQ5bTFUQlB0dnRKY0hSQ3RM?=
 =?utf-8?B?MU8xWXordVVBcTNCQkw5NXQxQVh3TDE2OHFPdC94VTAxcjZtUDR2cVF1M3Fh?=
 =?utf-8?B?VDdKdkJIU2pXZnhmSEt6TkdKT1lJUERmK2hlUGViUkRMd3V6MFNQMW93Z1l1?=
 =?utf-8?B?ZXNlR05TTHNMTDM0cmZxZk9ZVHBXeXZsbGZBNG1FcVNxZ3dBUk9BRitYK2k2?=
 =?utf-8?B?WGR1bFNZa2g0ZEM1YkozelFRc3YwTmFnZGlVNWtnMVZkQmpMVktURDJVQUZr?=
 =?utf-8?B?aGluUmg0RWo2ME5RV3ZMYUh0SHNlNG5Kck5ILzdEaS9VR2xXdktaczN6ZDNi?=
 =?utf-8?B?aUZHNS9pN2owSzVoejhmeldBNWhhMGdYcDhRNFdIMzRpaW5pa054ekRJNWZl?=
 =?utf-8?B?TERpMkd2MEpweEc2TVE1RXFsck9zOU13anl6L0lnMG1xR0E4WEJrNXVVY3FY?=
 =?utf-8?B?VGtKa29kbEZPdzhBVHZrQnh0QThiamJXQXFsUVZpZ2RUNHdxbSsra2UxUFR1?=
 =?utf-8?B?d0pZT1VpZnVZYThRVGJ4bWU0eHBTODdZbnZwbWxPamh2VDYzRnpNRXdYTTlV?=
 =?utf-8?B?Y3RwejNRZm9aYU1QQnlNOUJjTXV5VWpyZUF0Z0dlZFlnMjJzRUM2ZURZZmhh?=
 =?utf-8?B?bW5ZbFB0bE9UU094aFNVWDRudkJLa080UDlndGZGMU00L2pYbmxFSzNyN0Jr?=
 =?utf-8?B?OXVadEdmTURjeE44RjhUZ05PZDh6YjA0RTJLY3RhMWZEc3hkYnI1ZEx4YWxN?=
 =?utf-8?B?WE9SNW16M0JOc1NyakFQdjNoM3pMb0phV2N3d1VMd01sd3NwUS9URDRTK1dp?=
 =?utf-8?B?bGdkTytRSGRUSFMxY1dpSmJtYW04OTJtbkJlOExxc1RDT0N0UkthL29pOGVv?=
 =?utf-8?B?STJXMFdYUXFDTlVXdnV6WSt6anU2cDNwSzE1VTNyazJtMGsxa20wd2g5Smo2?=
 =?utf-8?B?K1RGSHFtUzZXREloRHlxcnRCU3lmZXhNdTliTkUzeEx0V3JBUDNxK1Qwc25D?=
 =?utf-8?B?NHFsKzJpTUoyNmh1ekFqUEIyM0QwY3ZNWWltMnJ1NUpwMkp4UzFWeFJWR3dj?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A05823384C29AF448404EE8BA5FAF90D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f49984b-8736-4428-07d4-08dbe6d5e0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 18:57:27.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 yrs10J9Bmv1KxwwWlHL2HbPHRKIHMY3OzStJbFsHHmrSGasx5uMEHp3RgurpVtLwclysj8dTfdAX+G+X35vEy1JAjfy4i3HIQxxMa2dp1sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
X-OriginatorOrg: intel.com
Message-ID-Hash: RGJ3GX3F3UT3LIXZPCRFWF4NSYWJSDK6
X-Message-ID-Hash: RGJ3GX3F3UT3LIXZPCRFWF4NSYWJSDK6
X-MailFrom: ranjani.sridharan@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGJ3GX3F3UT3LIXZPCRFWF4NSYWJSDK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE0OjI4ICswMTAwLCBLYW1pbCBEdWxqYXMgd3JvdGU6DQo+
IFRoZSBmdW5jdGlvbiBoYXMgbXVsdGlwbGUgcmV0dXJuIHBvaW50cyBhdCB3aGljaCBpdCBpcyBu
b3QgcmVsZWFzZWQNCj4gcHJldmlvdXNseSBhbGxvY2F0ZWQgbWVtb3J5Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogS2FtaWwgRHVsamFzIDxrYW1pbC5kdWxqYXNAZ21haWwuY29tPg0KPiAtLS0NCj4g
IHNvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYyB8IDE0ICsrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYyBiL3NvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYw0K
PiBpbmRleCBhM2EzYWYyNTIyNTkuLmVmOGY4OTkxZjAyNSAxMDA2NDQNCj4gLS0tIGEvc291bmQv
c29jL3NvZi90b3BvbG9neS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYw0KPiBA
QCAtMTczNiw4ICsxNzM2LDEwIEBAIHN0YXRpYyBpbnQgc29mX2RhaV9sb2FkKHN0cnVjdA0KPiBz
bmRfc29jX2NvbXBvbmVudCAqc2NvbXAsIGludCBpbmRleCwNCj4gIAkvKiBwZXJmb3JtIHBjbSBz
ZXQgb3AgKi8NCj4gIAlpZiAoaXBjX3BjbV9vcHMgJiYgaXBjX3BjbV9vcHMtPnBjbV9zZXR1cCkg
ew0KPiAgCQlyZXQgPSBpcGNfcGNtX29wcy0+cGNtX3NldHVwKHNkZXYsIHNwY20pOw0KPiAtCQlp
ZiAocmV0IDwgMCkNCj4gKwkJaWYgKHJldCA8IDApIHsNCj4gKwkJCWtmcmVlKHNwY20pOw0KPiAg
CQkJcmV0dXJuIHJldDsNCj4gKwkJfQ0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaCwgS2FtaWwuIEkg
dGhpbmsganVzdCB0aGUgY2hhbmdlIGFib3ZlIHNob3VsZA0Kc3VmZmljZSB0byBmaXggdGhlIG1l
bW9yeSBsZWFrIGluIGNhc2Ugb2YgZXJyb3IuIEZvciBhbGwgdGhlIG90aGVyDQplcnJvciBwYXRo
cyBiZWxvdywgc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1vdmUoKSBzaG91bGQgYmUgYWJsZSB0
bw0KaGFuZGxlIGZyZWVpbmcgdGhlIHNwY20gYW5kIHRoZSBwYWdlIHRhYmxlcy4NCg0KVGhhbmtz
LA0KUmFuamFuaQkNCg==
