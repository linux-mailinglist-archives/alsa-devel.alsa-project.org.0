Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA9B7663F2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 08:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE83857;
	Fri, 28 Jul 2023 08:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE83857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690524873;
	bh=FASiIlfZ2VlBzTuqJ7+tXH/Y8FRYKJVI94fTRh8DmP0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cAsWizlPVYdL6zXck5WYRmKNErUwkR6smcWpYIjFSk7QvbgjobSw3yM7JBl/F4pHY
	 fvrthndXmatls6wCrJgGDLOIiNdZf2J2pGYBftoXhUWlD38G4Ugf9N8yFQPhxccm7D
	 hhya4pPi8o/uXdqsUKHWywOUJ3B9M7DIQtFa4PNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C7F7F80551; Fri, 28 Jul 2023 08:13:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3F2F80551;
	Fri, 28 Jul 2023 08:13:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BA58F8055C; Fri, 28 Jul 2023 08:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57D52F80548
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 08:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D52F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F2+PH7gq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690524781; x=1722060781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FASiIlfZ2VlBzTuqJ7+tXH/Y8FRYKJVI94fTRh8DmP0=;
  b=F2+PH7gqj5h4EI0RjfhOeJVpFEbevMi9zYsUsfut8lGbVF9yeeEdndQO
   yo+mTz3UkYoUWKOXDdVRQrzme6PGCLemKoF5LJIdDfCHyhKGIf1K/LENy
   rIGjCJ3DtbQP0ITSR65Z9IPS9txhPKLl334jVuK4Qjhl7IlqfJ0r+U/aq
   Lfu9MSr4n+NT15nqkcfR8ETkHCkniSXfEv4e88ISrKCivRxo7Zjd5uqNu
   aCqL4plwJ/2Z9yJvFNrqSRsKaQiJxStPNUZNz+t749SF2g+Ag2mUCxR23
   Tp28xPCshr9sBnrD9+9Nma1Q5i7CRusGoxZYPkBM+dgujhDJcQkIiiv+c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348120005"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="348120005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 23:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797317294"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="797317294"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2023 23:12:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 23:12:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 23:12:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 23:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxnDefHH+VZOgXFR4bKPXDelGPpxehWPT4cW8U6Pq9kE4tVw6hSp2RnU23ZrQEnW0kqpccUaJKGT9slUH5yDPEG/yO9yFWzxR1fO6ywSh3yyOzqDsZPZnCd0/VvuT8KHveQYo1Gez+7xV+/uPIveGqygTk7NJDwVXuBTQ+W365Q73AIGLl9ggj5QZ0+f9P+QUXWiyxz3SlFiyLZl5wcc+sKK3Hfls4sM8TonOUiMSNOiGrTm5NAWjz4EvrxXtUHrEXeY8QpP2Gpc5JmKYYPVHSUXH8XM9uQNoV2TiQvDUwOpL8WGwFNPr+TW3V5JZR2QsoPEKZltlEtY5hrd40YXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FASiIlfZ2VlBzTuqJ7+tXH/Y8FRYKJVI94fTRh8DmP0=;
 b=F0wM/bsm/KtZZw4CphYaMmh4vCayA9OaX2eVvnhgocx+fR1kf3dVTt8XRHu5QzFk8XLz1kCN4fPn5/qv4Q+4AjQZXdzs4B5Oi2/df7tEb/Uxt0BKhmB2q7Nep8aSwX+bxHZyfNNUAgGzZ/WlHdIgfBR9Zhc4yZwI8w+GrvMGMPizB2rrWGTIgABU/uKCw7ss8Ly1g1pyuxpghz5aY4GPFySXt88K5f43W3THwPxS1RGRaWtv18YH7Xa5+28IZt3Y107hDE5Mz1hc5nakR2XZr++FUdM+fFzftTNxs7Roj2whKM/ds2yk+SHP8bp3We+t3ugRRUd4NgRwkvNW12qygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:12:49 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:12:48 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi, Yong"
	<yong.zhi@intel.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"Bhat, Uday M" <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
	"Chiang, Mac" <mac.chiang@intel.com>, "R, Dharageswari"
	<dharageswari.r@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Thread-Topic: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Index: AQHZuqoaXCiyShA7oEmUALJNRLZwbK/LxlqAgAEjn+CAABOWAIABwepQ
Date: Fri, 28 Jul 2023 06:12:48 +0000
Message-ID: 
 <CY5PR11MB6257C8293A394FFBDC338F219706A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
 <CY5PR11MB6257FF6D92D524D389B734C19701A@CY5PR11MB6257.namprd11.prod.outlook.com>
 <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
In-Reply-To: <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|CH3PR11MB8705:EE_
x-ms-office365-filtering-correlation-id: fc2f7457-4b7b-41b3-8a44-08db8f31ab06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EZIgWrl2HLGGL5eg7DTTYqEyYfs2X7NWON8V1XpOE7csWkRGP5VVFj7eJrDdNcqeKmfZJ2ELhQK+ri7dz6t3HT1lJlT9YHFiRwP9v5UBXkL76nQXE2EjHXeZEjFLD+LBscCzoevrNRAMdyW8Z8bB9DObDzL1OGlABPQZPuK3LdC6wsQChSH/3lUC+d7MAZBzMI8DP0FQvM/m08nOzIMHAzWWu+GvworXagSroDzWK9LGMr4WvEiAmNAhKEycdSLCUCf935D0RBuIJAliEjY6k65Td9uakphFuVXJxyWPuHPAFLYUikRTlwpWPOJUAqds0xu3aI5Jyf6rJmNqEonZerx/ErDfaHqZWoVKtKed+7+Hasyw78673a5IJTvtoYFC7Kx79i7nOLatP7kD5uTKyW++AzPVjjvL7M0AMFcK7TU+a33C0Xq1LLw5TPmmY2sNXDzQHxaT5H2HkCuuweRUL6lRLpYBjUQHe5GZxXZRN7BGfBljbaRgHXH46Qfy0S6Bb0epS7l+eFeqLqpmYJwwb5UCeMVtXzDs2YKupYIL94vlv9YD95SIYk6Pu+NkHuIOErS3g0B97Uqiopy8NFqw9BjResdfIDaEIjm8mCRHXi7jE+baeMqJ6ktvdBkYPddmJWKCZuvTsIVw2fzIyxJ58w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(110136005)(7696005)(54906003)(9686003)(26005)(478600001)(55016003)(558084003)(38070700005)(86362001)(33656002)(2906002)(66476007)(66556008)(66446008)(186003)(6506007)(8936002)(71200400001)(64756008)(122000001)(82960400001)(38100700002)(4326008)(76116006)(8676002)(52536014)(66946007)(41300700001)(316002)(5660300002)(7416002)(11716005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K09vRE5pSm1qV3VSMmdveEpLZUJnUXJJdlBLYklhVkJnWEdEK1VpYVloZ2Vz?=
 =?utf-8?B?c1FjNXBHT2hhN1lrdHVpMWJLTE52OGtRN3p0aFJKUlJTSHZyZU9oeG1Cbnhm?=
 =?utf-8?B?OUFVSVdQdVl1Y3pLUFlTRitSQ05YZk9vc3NYZElFQlZYSjJzMS91Z3RoZklq?=
 =?utf-8?B?ZlNjeXpCWGxxWklWMG8zL1lYUVVqZElmdFlLWkxJL0sxSXo0OWw1NjcwcWNE?=
 =?utf-8?B?VEZXT1hGVEdsSEZmTzBKUlRNMWpPelJQa0k2cVZheUhIVmIrb0R1cDhrTWRk?=
 =?utf-8?B?Zzc1MS9aQVFWRTNvbi9xT0VLQU9TMUppTFJkVFQ5bDliejRqWmdWWFNJSitU?=
 =?utf-8?B?dUpDOW9sVTh1R0grY3ZDUWE2bEpSWjJiSjdlZEgxWGpqcHFQcTVrYVR3dHVB?=
 =?utf-8?B?Qnh4Z3I2Q1MybmluTlBVemxOWDlmTmZGV1p1NXQzSmJxSU41bllzZmN0UVRy?=
 =?utf-8?B?YjlXMXd4RXhuRzdKeFJTTmtBOWlVRjViNDcwT2pxWGMvUXVsOEcyOEs1SmYx?=
 =?utf-8?B?akcxYTZPbDAvZE1HWnpHcHBnbi9iV0hrNUxyR0ZGN01tQTk4R2w5djZJUlJp?=
 =?utf-8?B?aVF1TE42SG5hY0tKL0NhOXpaWWNWc0ovTzd5TjRFNDVoM0FJTDB0ajRNMlZv?=
 =?utf-8?B?WnprT2VHWVBkeVVjbFFqVHFaR3dUZDhzNmY3aXYvWDNMTnZiNUZadDZ3c21p?=
 =?utf-8?B?Z1laYjhnOXVxOUpJUGN0aVBUYlBFYlMvYjVkRzlnWGY4WnNZM3JXY1E3ZVNQ?=
 =?utf-8?B?QW5LYlhRVVE0RkJwQitKdU9CQVQ5RnkvM1IwT0tYamJIU1FneS9zOTJ2RytC?=
 =?utf-8?B?cWNJTytkbmVtOGYyK2poS1JTWC9qT0s3eEwzMnV5eGdwTURMbTI3d2ZlYTVu?=
 =?utf-8?B?bVV1SnlER09ielAyalZMY1FYTUhqY245am5MT1FRN2NGUXRSR1FQRTdxaE5F?=
 =?utf-8?B?SytFUzd2NklmQ1NTSkVzODIzSzNzazVma1RFaG84N2ZwblBVOTBrbWdPU3Jy?=
 =?utf-8?B?d2NyV2lKQUk1dEhLd1VnL2pBaGVFKzA1Sy8rOUdjMTdmRWorWU5tWXNqTGdE?=
 =?utf-8?B?TkhLZnQ4aFZQQmF2eFZ3Q2pJVHcrVk04K1c2Q0tVU09DTlJNNU03N3UvS3M5?=
 =?utf-8?B?RWpxaTFhSTU0Z2QrSVpJMXhDM1VGV3o2ZlhackoxTWVLeHpQWnV5MThwNWZM?=
 =?utf-8?B?WFkxYVRZOW92Q3VXdDZMNVF3RUtNZUVpaUJLSHJoc3VyUkVBMGdUMG96bUFZ?=
 =?utf-8?B?NFhKWkpCcGIwaXNXYkRmOXBlK3JNQ01kZjJxN25uWVE0RzFtamJZakxCblNk?=
 =?utf-8?B?RVVxM0F2ZGxIQ1VtVTN2RWErSW4zRDZqVkp3ZjBZd3QvM2Y4SmdobnhYSU9t?=
 =?utf-8?B?bTZCMUFzN0tkVitMRHRMNjFrWFdpUjhuWlFoaVhNby92WEJEaHhMRVo4NWUy?=
 =?utf-8?B?YUZnaGpmT2x3TERVbVcxdTRkNWhjeEpCTkprUWU2R0xFMGMxMnMyNXdyVjJh?=
 =?utf-8?B?QTU3TGxMZktEdys4OXVOTVRBeVJXaGFLTm5IalR1eGlQMmZWMGQ5VTdnV1VL?=
 =?utf-8?B?N002dGxyUVZNTmdKcXEzczRmdlFzV3BkcmRiak9MS1d3bTVaTW0veFBSTXUr?=
 =?utf-8?B?R0p6ODRnbGlsWUx6dlJQdHJWWHNIVHc4ZjRMR1pOdGgyb2ovYk5NMzVDbTZv?=
 =?utf-8?B?Z2NoWHB2WXlrcVV0TlNwREdIVTFoUDNLZ0FaQTdsQjFuSS9nSnQ0YThTK0lG?=
 =?utf-8?B?SzVoSW9aZ2hadFNRTEIzYW9XTXVTNTliL0lENU94eC85anpMaUVrV1kxY1U3?=
 =?utf-8?B?Yk8yejRsQzlCQlN6SHNGYnQvaVF0MFhwT2tZTjZTKzJTU0NKR2I0YnY5Q2Vk?=
 =?utf-8?B?QVF5UW9zTm9HblZZSlRvQzhKZDFHZDdQWkFDZkZFR0k5STFoeWJsSmx0NkFh?=
 =?utf-8?B?cFBtSU8zY09YeGM2Zkw1Y3BZSEJXZnNldFJjQUMwbEt4akcxWlF5NWRGNjg0?=
 =?utf-8?B?NW9hV1RORkJtRTRjamJETEJzZHJBYSs1Wlk0TWVuWXJJQ05CM2t1MjhiZUxk?=
 =?utf-8?B?dm1jMGZoQ29udXNYUGFUbFRtTWIzWURrdGdCdzJLaGJTbE1yc1JxenJWdG8r?=
 =?utf-8?Q?0o64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc2f7457-4b7b-41b3-8a44-08db8f31ab06
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 06:12:48.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 L7zJeUDYs1JbQYrDdDbKBkHvo2NSo1kwJpi6VQ8uddVEQjw3tK9Z7aeGtY7q++U/vIadqOE+QJpEwVzleKo/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
X-OriginatorOrg: intel.com
Message-ID-Hash: H23SIKU3YXGF6SXBJFOE5EMGT3WNBEHD
X-Message-ID-Hash: H23SIKU3YXGF6SXBJFOE5EMGT3WNBEHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H23SIKU3YXGF6SXBJFOE5EMGT3WNBEHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+IA0KPiBUaGUgcG9pbnQgaXMgdGhhdCBpZiB5b3UgcmVtb3ZlIHRoZW0gYW5kIHRoZXkgYXJl
IHN0aWxsIHVzZWQgc29tZXdoZXJlLA0KPiANCj4geW91IHdpbGwgYnJlYWsgdGhlIGJ1aWxkLiBp
LmUuIEtlcm5lbCB3aWxsIG5vdCBjb21waWxlIGlmIHdlIGFwcGx5IHRoZQ0KPiANCj4gZmlyc3Qg
cGF0Y2ggb25seS4NCj4gDQo+IA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIHdp
bGwgbWVyZ2UgdGhlc2UgdHdvIHBhdGNoZXMgdG8gYXZvaWQgYnVpbGQNCmJyZWFrIGluIHY0IHBh
dGNoLg0KDQoNClJlZ2FyZHMsDQpCcmVudA0KDQo=
