Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33477750566
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3BAF6C1;
	Wed, 12 Jul 2023 13:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3BAF6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689159862;
	bh=5yQNaqWlqUnZTYBBIPi7QD/ezpbKCdsXypLSLT18kMw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kw2EYcTfRpoaMLkVhlq1IJzRQMRhsWQIrslhsL1YXCvsT29gB5VQtTmVYo73cWH80
	 IFXKoYN/8YQsZCyPDpQoN1p+osFLJWFAlKhKudBk7EcRRn05fgi/1J17/isbI/Cxon
	 EugURF+yuZ48h/PIL6c5eExXyBWVykIZVma/MV0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C348EF800D2; Wed, 12 Jul 2023 13:03:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA84F80236;
	Wed, 12 Jul 2023 13:03:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1174EF80249; Wed, 12 Jul 2023 13:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 530D0F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 530D0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CU+pgy/f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689159777; x=1720695777;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5yQNaqWlqUnZTYBBIPi7QD/ezpbKCdsXypLSLT18kMw=;
  b=CU+pgy/fxb3WqdkVvkcLUbf3d15a7QKgf3wjc3sOIqPKpjeATucU1GSC
   M//r4yDKl7kw9BxQwfypDWFatfRr9mdKsNjr8SNZmwNt5uxCTjPGAF/9O
   o+fuwPQeYbk0npQwWMeBjrglHBTN6m4/BcxD76RsN+OFb4YZaQs4bPtkN
   orx915K8Kq4QJq+DpTXW6kbXsG0MF9kVsqo5a6OD2ee2DKQUtGqCxiZsp
   FBCD4u3mhuuMirSoIwHWgYvwdyJYCwK8Gr+5wSAj3HGH2gLOBQwL33A6k
   NqZ/7y0UaXI29b0AeSw5PaTDPFJIuAT7wILUPWQfSU7SqISALL74210gZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430993267"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="430993267"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="835093003"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="835093003"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2023 04:02:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 04:02:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 04:02:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 04:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuyOuUHDM9KcWQ0U6AQWw3P28nl9Zn/RMo9I8oxeU8KyyPvifj0Xuks6tj4fBu88i9Su7I/ImLQ1NDJYBJHzsyeJg666qDMiXf3LmYw793zbvYKMvhKsAnVQNXD5glFJYyqDnCF4IKZnzH9vX6LhUmflC5HuVl/4xeLd8JXhpq00SUTG7/ihFMAHsIShx3SZ6pI0pQ7M6CaAeu04JCDiCYmvikIaFwEjkDgnBKYhLnW+FNwpgVmapvrN5HZSb28mCfGeVK3YfHwv33i3sWaGrdLgDwur26lyHowZDxxg3VtfxhZY77L+0mV7ked8E4lZDNGQXCm5bRtT8oyOQHE+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yQNaqWlqUnZTYBBIPi7QD/ezpbKCdsXypLSLT18kMw=;
 b=UpeaTpES8uHJk0T/+TYaivR5GnH4ZOsApVrflh4d5fDcOQxIcoh91U1FT1LPYWOpeh4OedANVGzGlrjta/HkaMlbrpQLHZGLuy98Vb67xHCwpgvwMcI8xfuMr0MBSIlKtHrewTH8v3QOUimsNI0M8CmZOBbk2mt49c8iGSrXL8izxwxffc8GA62Wyi87sP1UqZsiAf2JV8IPz5CDOA9Pf0o09qgnREmc4y6Ucabxdv2A1TohithSTtVG9FQVtuQx2NEjucTNURmZOQGWFLcLaCmbKyEPC2pengferWC64Cj8HDLm34ewVTPkZv56uC8GQV5aradJq9wu11sVvLlCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by BL3PR11MB6457.namprd11.prod.outlook.com (2603:10b6:208:3bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 11:02:48 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::25f1:cac6:3bbf:27ad]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::25f1:cac6:3bbf:27ad%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:02:48 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Zhi, Yong"
	<yong.zhi@intel.com>, "Bhat, Uday M" <uday.m.bhat@intel.com>, Ajye Huang
	<ajye_huang@compal.corp-partner.google.com>, Arnd Bergmann <arnd@arndb.de>,
	"Song, Gongjun" <gongjun.song@intel.com>, Terry Cheong
	<htcheong@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Thread-Topic: [PATCH v3] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Thread-Index: AQHZtGaT0T46+v+6ZEqtWjmKY5r26q+1puAAgAAAYhCAAEThAIAAC7PQ
Date: Wed, 12 Jul 2023 11:02:48 +0000
Message-ID: 
 <CY5PR11MB6257F219800BF832B34C72F99736A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230712100855.272467-1-brent.lu@intel.com>
 <2e9a5d5b-f637-1f9a-b500-03f9c151dc26@linux.intel.com>
 <CY5PR11MB6257F77DBF1D123FAD0DF4689736A@CY5PR11MB6257.namprd11.prod.outlook.com>
 <ab085fff-ade7-02b1-22e0-acba8e6c1846@linux.intel.com>
In-Reply-To: <ab085fff-ade7-02b1-22e0-acba8e6c1846@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|BL3PR11MB6457:EE_
x-ms-office365-filtering-correlation-id: b46b36c6-2878-4de3-d8de-08db82c78736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CTcJKRga+FIMM2tmMQ5V9+u2sq6YLjjRIAe3XWAwIhXNRt8rFaZS2ZzAdVaMpAMLqMPlyvjlanWY1/0rdb8qmOYkCJ4GGuIKM61uMU/QnmH63PNSFPoQfBBire4veNEZMN2DneNfk++HMCGavAeHPhhkYFnpvc94036ERPLlSSsbqumhiXhlvKzT9R9EVOGRpwoy8410JuldmswhJjd1mvJ1PvDc7g+XrWyb9i3pzqXmtdIsa+8z+TC++k5R+BMZaXBKClPkS59BHeMKHP9MX7OCf2zjccGisjPam8iQK6Yx6cMoG2+SA7NUdp0lkqBLx8hUUvu+WmyPZbwSWHPzd+pXNDJ9ep+sxpAO/kmnye3YpxnY4HSNkpXnYTXg4tAFOeUXlorh7B/tXaMhrbDbagNcJHaiQ+la8apwJL+4mJrsrb5HzOrNcWACqtv+H3t6fn8GZkWXa6hNnaAssQ1lBCbcIHz0yfKUbGIYQmwIXjNnTEv3VKUdE3g+UFaTZkzgCiPpom5bjzBXpEIR0VWbAOQLlISMgPhmJLCQ/2iEtGUvklbd1uQzYEEJQFPZbZsIuMnaCwznxDPVwnSs523cER08iyCppeUslkQ4Y+h9SlYuwNHmveIEJgBAB21HZ1DIXDhGiWZcJGE+/WRc9QqO7Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(110136005)(5660300002)(7416002)(52536014)(8676002)(64756008)(66946007)(76116006)(66476007)(66446008)(66556008)(316002)(4326008)(2906002)(71200400001)(8936002)(9686003)(7696005)(54906003)(6506007)(26005)(186003)(41300700001)(38100700002)(478600001)(122000001)(82960400001)(33656002)(558084003)(38070700005)(55016003)(86362001)(11716005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0VkL3BKZHNqT0hrZXliREtodlVJN1R5VTRQUHVEOVJZS0Y1MzRlSmlLdWFi?=
 =?utf-8?B?b3N2OTdPOFY5R2dnWFpNenRTMXFIQWdDdjBkbGNDTzRjNjBhSW1EblpXZ0tD?=
 =?utf-8?B?ODhueUd4dCtyM2YvZzRBSTUyYVBQSDJlSkVVdWV1VWxoQmFpQ0dMRnZjelk1?=
 =?utf-8?B?S3ZEK1lFN1MyQUlYOE5jamRGQ3lDWHFKNXZWK0VTNVdRZ0RSUWhwSEMyMHQx?=
 =?utf-8?B?WHRYYW9uclNnWGkrWFhncDYzRzdzN0dpQkFxMmxCVEZkT1pIT3Q5Rnh2Smt3?=
 =?utf-8?B?am1Ic3dsWU80RVhjL29mYm9EU0dLRmw4SHoreTRrdzZEdXMxaHdvMUduVUpa?=
 =?utf-8?B?WGlWYS9yWk4wQ3hCeG5wWEFOdlBTZnRBcEtSUXpTc3ZBbmxwUjhaY2MrODhv?=
 =?utf-8?B?WThyVzdTSXN2SGUyRlkxYi9vM2dlSGYrYlEyRGZFVVlGVlVYNzdZMkRaOHdF?=
 =?utf-8?B?ZHlJWFhDL0hEcnZSYU1qc09LQWRJVUsyR0dleFNmRWRjUFY5NE5nZU9mRXJt?=
 =?utf-8?B?M25DSmVOVnFGbG5adVdEdkVnNnFyOTEwTVhaSXh2R01vd0tGTHlHN3ovTkU0?=
 =?utf-8?B?dFRxZC9LaHdDZU5mMWc0aVVvTk1aclN2ZEd6QTJOdjh1NzNVRFdoUkk0bll1?=
 =?utf-8?B?WitjbnRZend5K0NyK3p3OWhWS2lKeFZWdExoRGUrWEZqSnNtNzdkUU9HdG9K?=
 =?utf-8?B?a0NuTnZrQzVyWk90ZEViSkEyN0k5UFdTeG5hMHY3czR4T25aNzVKMjkrZnBR?=
 =?utf-8?B?YkhnUzZheDM0WEM4UG10Zm1URlU0ZFVQVmVIUzNFY2FnTUY0ZzBKTGY3SVRV?=
 =?utf-8?B?Q2kzVEpYVWlheHRhWWRiaFVYUjNwaWw0VHY1VXFhaVBCVXJmb0RtRC80SnVD?=
 =?utf-8?B?alE4aFc5bDdMdENKTkxZVDVYL1dmQktPVGgyMDBlSnZKblpSTW5ROURDVW1F?=
 =?utf-8?B?MTQrSU9ORCtxL2pISVBSYzgrV0NxMVovZVZwQWM4Vm1BUENzYlYvRjY5N2NY?=
 =?utf-8?B?R3p3MFQ0UStHaU1jalhyRHJnQW9yVzczZlRXdlRheUdQNTBZMyt5emFaMnEr?=
 =?utf-8?B?bERMNjVjUXNhaVdobkdhelhpdHBKUk1KU3JjbVlQUXNYUWRTSlcvKzN3a0tG?=
 =?utf-8?B?Yll6dG5zakJDdFltVi8zU2FsdmN1bmMrK003VjI4Q1JadVQ1Tlh1c0FMT1Vl?=
 =?utf-8?B?QjNJaml3NmJnNU1JVFAvMVZ5NXN4eUZ5aEZyQU45dFpPM3MwbUpJOVJqVllN?=
 =?utf-8?B?c083bGVxRWNXb0lBcU1yeDdUOGNSQzJUQUMxbkRTa2RDMHBtZytBZWg3dFk4?=
 =?utf-8?B?NTZKL2lOVE9JOGRqblNGWmxaR01Kald0VW1FNkNPNTQvQWpDVW94RlVLWENI?=
 =?utf-8?B?Q3h0Umx3UkpXMXRWbC9BbmFUY2VkazdLSlE3bHdLQVJKU2dhZWxWM1hSQU1j?=
 =?utf-8?B?ams3YnVEOTdiRndzUzQzZWcyeXhzTVpWQ0JvQytRRUlPMXBtNUt5dEFqR1ll?=
 =?utf-8?B?eEZqMjVOY3FLYStEaGdObzBydCtzdE5RZFQxaDRoRWttSXQ0cnFWbzBnUEd5?=
 =?utf-8?B?blhsb254RGd3bXdZdldmSFFPTXJLdldwVWRnUEtPd2d1aFl5aVJOdHBEODRD?=
 =?utf-8?B?bkdHTi9YNXRRQi8wWGhpcnhrSURManR4eGRtZU40alRxL3oydUtsZlJhN2tX?=
 =?utf-8?B?dnMwVGR2R0ZxUytpR3pCUVN6V3p1REY4REZtYWlMajRBMWluVjY3TExDdERR?=
 =?utf-8?B?MytFdE1iUlZ3dEQ2ZlJRdGdqT0Q4WTB5cXMwQmFVZlZKMVNnZGFyVXFYRjlM?=
 =?utf-8?B?UWhXckxma0dra3ZkaklnWHZSVS9rM2t4eVV3MHdzVnh6d2YrVzZSTURsRWlU?=
 =?utf-8?B?MjE3cDJnOFFobjJ4aXh1OVlPTkpnZGdWQ01ETVhUUGJ6M3Z6OVJteWV6eTk3?=
 =?utf-8?B?M2pDWko0L056OTZ2OXZjR1kwZGtjSjIyU3lpTUhoRzVBeGZJNTN4azZJRy85?=
 =?utf-8?B?WkZ0bFhiZUtDd01WYW91NmZ1WjQ4d0dXdzJTakVQWHZyT2NMa2ZnbzRaQmM1?=
 =?utf-8?B?OHdEQ0JKRE1wbVM1ZU51OFd2OERsSUxKZW41a2d3ajVNR0l6ZVMyVGdWWWkr?=
 =?utf-8?Q?aEDE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b46b36c6-2878-4de3-d8de-08db82c78736
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:02:48.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 IX1lJIaXv6bYYKZYXSWHYAadO7SqWHvEHaTqAAngjbR8BwxmjBo8yFVUeaegWsVKA4+bZKIiAkV6U7sEbtDFmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6457
X-OriginatorOrg: intel.com
Message-ID-Hash: FQAB3T2QPDM4TEAQOPS7DL4AOGDSTMV3
X-Message-ID-Hash: FQAB3T2QPDM4TEAQOPS7DL4AOGDSTMV3
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQAB3T2QPDM4TEAQOPS7DL4AOGDSTMV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gdGhhdCB3b3VsZCBiZSBteSBwcmVmZXJlbmNlLCB3ZSBoYXZlIGxvdHMgb2YgY29uZmln
dXJhdGlvbnMgd2l0aCAyIEkyUyBhbmQNCj4gbmV2ZXIgbWVudGlvbiBpdCBpbiB0aGUgdG9wb2xv
Z3kgZmlsZSBuYW1lLiAnZHVhbCcgc291bmRzIG1vcmUgY29uZnVzaW5nIHRoYW4NCj4gaGVscGlu
ZyBoZXJlLg0KPiANCj4gVGhlIHJlc3Qgb2YgdGhlIHBhdGNoIGlzIGZpbmUuDQoNCldpbGwgZml4
IGl0IGluIHY0IHBhdGNoLiBUaGFua3MgZm9yIHJldmlldy4NCg0KUmVnYXJkcywNCkJyZW50DQoN
Cg==
