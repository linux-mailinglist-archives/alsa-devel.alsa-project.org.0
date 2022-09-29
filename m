Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD15EEDE1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:26:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DCC846;
	Thu, 29 Sep 2022 08:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DCC846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664432801;
	bh=ozwMWmysBb0MLGGtD6QYQcKCsZMJ+yQu8PFq4Nc3rjc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPyqwepZ1hVf2uZ+8KR+pizE/fLBXIpAja23Fukckm+tquKxy45OBYN5/Kp8QXCUi
	 znjNMTt8Oq673oO9m2EjzreSeABUBazv5jK0m+mDhTB9J6lAy059LOdcOcSqNlEHlh
	 rJ7fFkdaXY+gUt0NK4Wx4ynowumyw8sxAr5ILvgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEFD0F803DD;
	Thu, 29 Sep 2022 08:25:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B641EF8023A; Thu, 29 Sep 2022 08:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB41F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 08:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB41F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VTgBWM4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664432740; x=1695968740;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ozwMWmysBb0MLGGtD6QYQcKCsZMJ+yQu8PFq4Nc3rjc=;
 b=VTgBWM4lSfSXnAzi9HhQhSMDAZnamoy3M97FJd59+BZ2pi32zC/2HAW0
 VjJ8caPhzJTXG3sw6ckm67aIN7CiJuBul+t+Hr3o8yBDiFSbYcZ6aU7pq
 1gPaFtW36OjXuVovdfS0ZBDYm1/4D05QE6LRid6z4gMDPU1WwdLOD/O63
 IE4Pf4C4GMsGFjMMx1/FzSp/QnXmmHZOfx6nscUPxH+8SMZxIzcnQTOI8
 v4Z1XXfyFntLuJHbeaEsrSQRKLL8Q9pv/dJAx+5ycyJ7aYJblhPq2RwYY
 T/+O9sK5EC/gBy+CA16Byk5VPFcfUA0bsSWLYnN8X2IN/07tqSkXG5gFy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281522144"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="281522144"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="950999387"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="950999387"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2022 23:25:36 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 23:25:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 23:25:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 23:25:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 23:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiZhJPLNQetXRtf4ZQqA5nWwDJ7NsGnFVuN1nYEqHVT1yYEGQD3TDPSfvTbZOL17ZUvbIXaEUNznAjAAjBFXxffZ1GTgJHc5QkteE9kHwAdnStRdL3bD4VUAgN9WQLjwo8Gw+3CVLXXffHFDWWTaMwJlAk9KMoY1tuJ4DAwaJypXGJLNQG5rjtqX3Ux3DrEvEU5NpQAMx8Prdv8rf9hyWy9YwNLct3SvmIEZJMfsOFCLkjZDzQQgOU5LzCUzy9ERh+YjX9uDzMckHZ8BaBU05IE0Qiw7tzEvdBwY8NGWFNRJSOpwwd5/Z7ZmGq7hwzwj42dIPE2m0LC7q3jLC3p+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozwMWmysBb0MLGGtD6QYQcKCsZMJ+yQu8PFq4Nc3rjc=;
 b=WNcgvN0MmzB9w3kuCQhOxsbgDhKns0Xf2Eep5MNI3Hf5seT4ijh7bDPYuMRr6gIWSLtnGGoORmIN4j8paliD3rezFnBQrfAb4dCdvxD/OewHholrYjRBCU35q7xQw5MOZ3exBGoNXo1qNi8lnSyepJwJrMPIfZea3dpZ1SDda2lKDOSe8u3xE1VqEVVc9xOtD5AthFGfv8ofN1MvY5dZfYlWHZYG5PQO5sNBugj2CXF3lBgTHuXieUHfO01c6IswPtfNlQMkd8E9t0XbCY/uO69zP/hMJ/6hQZWs2ubRzV1CM3G2GtH0i0+u9rw4jSdJe8jkFF/l6qBPh0EnDEC1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 06:25:33 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::a351:42c7:fffd:fe88]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::a351:42c7:fffd:fe88%5]) with mapi id 15.20.5654.025; Thu, 29 Sep 2022
 06:25:33 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Thread-Index: AQHYx0WIbAWx1DUIC0WYo1S8d0A0ka3dATiAgBZVUKCAAUZKgIABbDxg
Date: Thu, 29 Sep 2022 06:25:33 +0000
Message-ID: <CY5PR11MB6257AF53395DDF069A43D28E97579@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20220913074906.926774-1-brent.lu@intel.com>
 <2577e4db-8593-cf37-135b-aa51b6268cd7@linux.intel.com>
 <CY5PR11MB6257A5CC3976FAEA2C713A4997559@CY5PR11MB6257.namprd11.prod.outlook.com>
 <d94a9abd-95ca-09ba-ab24-e4c38b832678@linux.intel.com>
In-Reply-To: <d94a9abd-95ca-09ba-ab24-e4c38b832678@linux.intel.com>
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
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|SJ0PR11MB5134:EE_
x-ms-office365-filtering-correlation-id: b5a2513b-719d-449c-d7ba-08daa1e36a06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vJRVhAL/Lg02g+/4PqRkLV3u4NCoPkkwrXOtyvr6uX7qtOVrCxTSlLQ9IJX3eLz8XEJlnJz7t8lz+sKv67SPuswyYzGqBc6Y8kQd5OBOrE4Qv+0JhsOga60S1Q0uWXjFPaxPdV30MSK5eFpoHfcVVxhEYM4GkIzWXWakxkyzxStwwTZVhaxKEKz9bKegTu6lVIGpnfR3UBv6JsJzZRk5P7o9NVrfkLgoVXy3S+2NpOCciUaZqXlBw3vCzW/WDbn7hx5ZKUR1hyKvcek38kg1cQycxDAnUxuGO9vQ1A44on+WvEd5OLZE5FRjGctsZ29qDsQF5v2oP0guSbPGpK5eIyHhrAkVm3xyN3DPUclO/O+L3qMBra2tpk5xc8RypwmY48atxeVx4uMJddXIR1iDUQE+aXSVYnfbNqrfuMLF7nhDmJYkwcE/4sOiEWIWHGl2es8JMuAm3ndgcri//oWnqwEgAiD1ju+F6kmyOIfWYRZEFdsC6PHgN8Ry9YxuRIX2uf/cHZYkVy0Uieob0g65CV6RrUUBYZje/BHzA8CPYTRHXym6u4irpSCU4N2nwZwqF+W5fYBroQ2VrPf3G9M+3h3iuGYzWP4IU+FkSLU0Kt5XT38hnee8n8GCXSMde/x4rbou8JZlkOXrIETtbQzf75L/q5f4XtiS5q0UpghojNi+bAL+bS3Hxe2ANbzujccfANxYg6BIVpcN95a3AJzMNJzDdsN7h2JKFcSZQ0hXO0EXkM3VfMXsSQ8J1p8seKICux0fcT2t70eLNXHDxpP21kAndjOZ8fYKU56RMCvYesg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(83380400001)(71200400001)(4326008)(66946007)(66556008)(66476007)(66446008)(8676002)(64756008)(41300700001)(316002)(26005)(38100700002)(4744005)(82960400001)(110136005)(186003)(54906003)(86362001)(55016003)(52536014)(5660300002)(122000001)(7416002)(2906002)(8936002)(38070700005)(76116006)(9686003)(478600001)(7696005)(33656002)(6506007)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djJIaXNuUmlLN3hFalkxZVROQ3FQZGRQYWhET250b3QvckxKTXhGaFp5NEI5?=
 =?utf-8?B?YU9URk1LSVJTK1FyanVlZUZoVitraUVzbGwxMlZFT3g0V2hjcEw5Y3VrNDVw?=
 =?utf-8?B?YjdrSUlBSTRDZ0c1RC9mUzFUa3VrQTc1eDJFNTNyOGFCdWx6cDMxZUdKSkNX?=
 =?utf-8?B?UFJWVHdGKzNGYzFvZ056UzhRbkU4RHhDZGhrY2VVa3lVL21BdEJUVTVrbmQ5?=
 =?utf-8?B?NUJrdVRRazVqU2tGUjkrL3N4T1o0SEVnbnBYVThFWnZMUDFTYjVxUjdxVnZL?=
 =?utf-8?B?UHJmQ1ZscnJLbjZ0U09Kd3JDdGxnRXI4d0V2U2FCWWlHL00xZzBjSk56K2Vk?=
 =?utf-8?B?NVlDSHFJWlc1Ujc2T3NpQTdHTStyVVk4NDZXcXp5WTZXM2xlOU9NREpoVUx0?=
 =?utf-8?B?UTE2STltUnNqN1d4OExQZE5jQk9rVTdUc0tHSFRKdWpyN2xnb25oUlVBeFJw?=
 =?utf-8?B?aU9VWmduZ01DZC9TcC8wSmZIRk5kZ1FWWXYxQ0ZySVRZTGRQVkV5cUIxNXFt?=
 =?utf-8?B?cng4enQ3QWhUTTU5QUxON2V6YUJDWmFQckQvU1FJMFQ4YW9yK09HMldBdWFB?=
 =?utf-8?B?elZ4TXA3TjUyNXNrdzR0UmIyWDFYVnUzQjVGOTRGQVJZQlg3czVTTnhnUDZn?=
 =?utf-8?B?UjcrMFJMQ0w0VHErV3JiWVhsZTNmcHJQdzhLUkM2K0VKUS9BK2hJNncrS2J2?=
 =?utf-8?B?TkljdzM4KzJSQ0lqNzdLSWRRZEhaMUVUT3JIaTl1SW9OMGFoQ3puZUkvM1Fz?=
 =?utf-8?B?VHdUdVphY0FWM3JGVmZZK0h5b0xsN1dsOEtVZGZmdEk1eU1yc21hVyt1ZWhW?=
 =?utf-8?B?Z0ppcXl4YzkvVlZOYmphRmdIbWdyanV6WlVScjJDMVBLV2RxREdqMTdwYzhD?=
 =?utf-8?B?ZEVvSGo5dUpsbnZ2QnBRSlJsVThlUTFtWkdlcEgxNFlldGhITTdlSElsdmNU?=
 =?utf-8?B?RXo2OFVUQ3FJQ0daQm0rNDNHZ1JYQlNnWXBicTVsK1ZWZ0VPdzZxelAzQ3Y3?=
 =?utf-8?B?cWYyMnl4UmpveE00cGNQSG0zak5LcVBoemNVR1NWNkZsQkNFcDJPV0I5ZGZz?=
 =?utf-8?B?NklSaXJZRGhKd0NkMmNtWHFYR0Z2Q2R3YklVcW9TMFZJMWlVVzJmKzBlNnRU?=
 =?utf-8?B?RU1rZkkxajVYMmdkM3BkSE12RnEzcmVCVDZ4L1FEZmRFMjJVY3NVYzkwL0JX?=
 =?utf-8?B?MDhjOU9XckZSUUQ2S2xCeWJKckdnV0xNMFZvYmZ2WTA1MmhWbDQzRUZ5aVM2?=
 =?utf-8?B?TUtZYWYyeGFoWlJlRjh3TmgraWZETWRrZDNSQjl4dElncVJxQWh5aFcwbDNS?=
 =?utf-8?B?WTc5dDAyY3RQN3ZqVzU2S28zLzhmSGZ5OXoyYVRrU1h2ckxsWUtKZ1hJWjE2?=
 =?utf-8?B?eWptTGZrUm1Pc3JBSFQyMURpV05mYnFlT21UVytiUytYenhiRGhicUdjaUhM?=
 =?utf-8?B?Q3NWQk9xTmJIQnRxYzJjQ00yK0c5NjZMTHZHZE02b3VaU292UklXSGlHNGRG?=
 =?utf-8?B?VENYVll3d09EVTNtSDA4aStsazk5eW03djhPWGtiSGVVRndRTTlERVc2YU0r?=
 =?utf-8?B?ZFpKc3ZCUW1aMHRVOEJrZ0p3TzZQekQzUmp0TEcvZy9YS1lvd1hqS2VZR1Rz?=
 =?utf-8?B?NUlZQmsvWDR5dWJwc0xhc0xsQ0dHWG9sZi9KT1Z5UjU0TW5PeHBHR1R6MW8y?=
 =?utf-8?B?QUFyRmlBbkFEQldaZEZka3VBaFBLOVk2T3RBcDl4aGJ6dnZQVEpjTG0reHlk?=
 =?utf-8?B?WTNnZzBEVloyTzFKNXF6YkhGMW4yMjBaaGhtYXJYRFhSRFBQdXpqZXZaMW1D?=
 =?utf-8?B?Ti9ibjNQek56dmlndzRzcXpneDBnb0JFc0Z5dFE2Wk5HdEcrc1JYamc2c1Rv?=
 =?utf-8?B?ZnNVWHpoRTY4eDRlWmwwelFOMGE2d2xjd3AxUzFvdG5lbUxYSVNCWWhkaU5x?=
 =?utf-8?B?ZGNtdVV1WTdCTnpkeWxINVh3Y0lpZXFHUkV2MDhhaTNSZ3BzcU1RMXFIVTNC?=
 =?utf-8?B?ZUNicmRJVzIvak5Db2RLd1c1ZE44Y1ZKYnZHTUMrV0t2dEdRcS9rbThqNzJn?=
 =?utf-8?B?ZHJyR2FvR3loZHhZN3JTSmxxZG42NGNEQjJWSm5QRkhDdVdFbVVhYWNMTyti?=
 =?utf-8?Q?bT5+1UpBL6PTZiseH9WnitlJy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a2513b-719d-449c-d7ba-08daa1e36a06
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 06:25:33.4671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bs1ezKW+Q3EJMn7/VlUzCAdAZF7eYcs9XUSPG4u3kP2mu2auXoQuIOgXJQXkcwvzdRzHicgqsUW+vXUFXzvJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ajye Huang <ajye.huang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
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

PiA+DQo+ID4gSSB0aGluayBURE0gc2xvdCBudW1iZXIgaXMgcG9zc2libGUgYnV0IG5vdCBUWC9S
WCBtYXNrLiBXaGF0IHdlIGhhdmUNCj4gPiBpbiB0b3BvbG9neSBpcyB1bmlvbiBvZiB0eC9yeCBt
YXNrIG9mIGFsbCBjaGFubmVscy4gV2UgZG9uJ3Qga25vdyB0aGUNCj4gPiBtYXNrIG9mIHNwZWNp
ZmljIGNoYW5uZWwgaW4gREFJX0NPTkZJRy4NCj4gPg0KPiA+IERBSV9DT05GSUcoU1NQLCAwLCBC
T0FSRF9IUF9CRV9JRCwgU1NQMC1Db2RlYywNCj4gPiAgICAgICAgIFNTUF9DT05GSUcoSTJTLCBT
U1BfQ0xPQ0sobWNsaywgMTkyMDAwMDAsIGNvZGVjX21jbGtfaW4pLA0KPiA+ICAgICAgICAgICAg
ICAgICBTU1BfQ0xPQ0soYmNsaywgMjQwMDAwMCwgY29kZWNfc2xhdmUpLA0KPiA+ICAgICAgICAg
ICAgICAgICBTU1BfQ0xPQ0soZnN5bmMsIDQ4MDAwLCBjb2RlY19zbGF2ZSksDQo+ID4gICAgICAg
ICAgICAgICAgIFNTUF9URE0oMiwgMjUsIDMsIDMpLA0KPiANCj4gdGhlIDMgMyBpcyBwcmVjaXNl
bHkgdGhlIGNoYW5uZWwgbWFzayENCj4gDQoNClllcywgYnV0IHdoYXQgd2UgbmVlZCBpbiB0aGUg
aHdfcGFyYW1zKCkgaXMgdGhlIG1hc2sgZm9yIGluZGl2aWR1YWwgY2hhbm5lbCwNCmxpa2UgMHgx
IGZvciBsZWZ0IGFuZCAweDIgZm9yIHJpZ2h0Lg0KDQpSZWdhcmRzLA0KQnJlbnQNCg0K
