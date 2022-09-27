Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7A5EC413
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 15:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E7184A;
	Tue, 27 Sep 2022 15:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E7184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664284653;
	bh=mtdFaT636hZ4taySc5g8ztmB7b6VW0VMSJyonzhAMLQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRc7I8LnJq2fBcGc6YaS+p8UU/oJTaEWLS8Cfw0ew2Ay1kLWj5jogVK6Xu+2f7Fyc
	 Bxys17hQxD1ElTgcZOG0tdmqrid2FTRf59KQh7Qht10x9Ug+itxTHeNX3oBR5moS/G
	 UHMFGr5KDDgnVwYMoL1RCJhdaJ749+6hSr+B45No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D607EF80496;
	Tue, 27 Sep 2022 15:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EDFBF8011C; Tue, 27 Sep 2022 15:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4315BF8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 15:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4315BF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e0NCN9nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664284594; x=1695820594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mtdFaT636hZ4taySc5g8ztmB7b6VW0VMSJyonzhAMLQ=;
 b=e0NCN9nZsnpDSHNjwm3we09FL8ebnWJaxBbxEdJbtfDbOU7sGpaY4MYp
 unu9Qy5K7JbIPmrL9+hlZZ7epWxyVQUC0vMZLttyAgeaJqGTSt5fXeecQ
 2/hNXf3Zu83DQJnpFqUG0v4tSjO8TTGff3D0LzmRW1UufICCMWLyHg7De
 05r26GSrPwNAO2aRqGfOmfRTbz7zfPhrIYbfzXC6rbXRy1mJo+btaolGq
 i+Cqh1OOVHx3rwxqtUvS1GyhaBjqL0hunXULeaEL3F+kd/OPQtNzpis/b
 Y7pZA+kciZXYvXFRrw55wb4sfIB2NW2OZjrYdG+hE6Aex5UMFkGhPsO3A g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="300032489"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="300032489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 06:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="652274187"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="652274187"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 27 Sep 2022 06:16:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 06:16:26 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 06:16:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 06:16:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 06:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZtNZtNmVQs+3Ja93KUZysb/HCEtzVz2xB4YqTNBMK0GgVEkjv3Q1DLVpeYWIWAOE+q/3ienmmIq1EjSz/VH6hSHYf5eA6+jpOudaSI7ZyN577M3kXRq7QcQgeIbLAmU63ViVGQsnhKzSZ4arq5fQQ7dRGv4MsLHz2WrbgnfQicZOwkU0IVtXvyiKEPyRwwHHQJNQpcaoNwjXqD1eWMKERF+EuKmUaoWHFzKtp4iwXoPaXfRB61ZgK7Mg+LTeiUNyKeTT3UIhneZsBgHY8v3yE3vnuhBEIvUPGou9RS3+Mu9pSa55zZxA6YAKH0VsA8O4U428JitNtp1tr2hmdzhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtdFaT636hZ4taySc5g8ztmB7b6VW0VMSJyonzhAMLQ=;
 b=BzlrBtBr2Kc075hYTwU5eJ+hlqZqOhaAZwsz1gSG72AS09EgWcqiknm8jQykul589/ifYTm9xYHhE6lQeYJNf6TAVyfJ2GlVlXiX7uX7bGNelXNsTiLBCCxNNKMJe/3v7YO76oyxiP1o4RppqiADIMMpbRwkAj+R8aL6/PsnJs/C4w16akdfmQVKaG7iZegbVmYJBL3Y8I0ozPTwfdmfyCMFOiiNk/8NVXHrpQ/5JhLzgt3h+S8mZ1yXrdtnVMQm5pbjAjOcY7FWP3zhPKZUd7twVznUQeFEf8vVbcs63eL/111pQAT6jRD02W0CqIxuhBNbJsRL/vOZv+/McqtcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 13:16:24 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::a351:42c7:fffd:fe88]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::a351:42c7:fffd:fe88%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 13:16:24 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Thread-Index: AQHYx0WIbAWx1DUIC0WYo1S8d0A0ka3dATiAgBZVUKA=
Date: Tue, 27 Sep 2022 13:16:24 +0000
Message-ID: <CY5PR11MB6257A5CC3976FAEA2C713A4997559@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20220913074906.926774-1-brent.lu@intel.com>
 <2577e4db-8593-cf37-135b-aa51b6268cd7@linux.intel.com>
In-Reply-To: <2577e4db-8593-cf37-135b-aa51b6268cd7@linux.intel.com>
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
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|SJ0PR11MB6694:EE_
x-ms-office365-filtering-correlation-id: d1bad105-19f0-493e-abe4-08daa08a7a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aKLj4Kk7+VCFsnul6tVIEeVuwkJ4J6Y4AoRreDwPVGkhv63ZQOXKHCstWb2jDs9ndho/La31zJCvd9z8f/o2+aWQBpVWt4dEJg3X0NrCXwM3mg0kAwOvQZsWVcoyZ/Ch8+u6h1/BxKj5OFaf06sM1KpXmVEmfNxPXCUUdEVKE1lrkEgVJC3AGiUTBEtYg6PuiKDTYOCgGb9y/7cbzrAD8TZZHuD21/cfMg01RUAEcN3Mo7ErSGFIRSmndpw2sbs9u77Gw7fnIdtIozYJ4SbVYQp2+9jaONlXBKaVYCjoV6fzodsV+1/c6KQLNcUkCtuWFXu5UweIS7qnnqvHYrKBaU1U8rd0lQedHXrmvaqewsowD1qkaoRmLN7g2eQHueMUyXKMpGWdoXYHWAMtG/DG7bJOQjwwHTqjFhdr2ev95926rvO5jcxerai5lamV8c6IzHSBLPEmwvLVUSyu0jCePQ5XaidFRqZXuzPtTGPxbcFT/8wVPEvotSZAPfgQ1ghUVutKnVpMgUWvaiN86s+0kU/1WGm6zVfaiZHMiL8W6jkIOH/A+KA5byM8WO5e63Cy/5x8Sfud9tvHFLbskipsW3UbRmtT2xufiRdUlPZ00Y469p76aMdQngS21VhnFIV+EX/pJ07YOLwN/dJKgfHfy1CVuK0PUgkDP6o8kPvdW4EWdqhQNgZdFwpuc20QgmETx6apZWcX3bQ/Gu5wDqLWxMQ1rk/5xsJC8WCE/8QfePoQIqWJuatyJE5PLItSD94lFRc8PPBcfS3/pxRabpQ9tCr03ZGNx8OZViuYOK1+jR4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(122000001)(71200400001)(38070700005)(82960400001)(38100700002)(478600001)(316002)(26005)(4744005)(8936002)(33656002)(5660300002)(7416002)(66556008)(76116006)(110136005)(66446008)(64756008)(66476007)(54906003)(66946007)(6506007)(7696005)(52536014)(8676002)(4326008)(41300700001)(55016003)(86362001)(9686003)(2906002)(186003)(83380400001)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2pwQ1FLZlp4WTJvM3lPMUozRjNIMDR2TUJ0NWFPZjFLaS9RZ3VzVHp3cUdy?=
 =?utf-8?B?U3RuRkF5N0Q2TkxQOXgza21YLzVSWHBJcWJOaDVXZnlVZEFkZE1pTytUN0w3?=
 =?utf-8?B?WmN4Y1g4MlVCZTdnTHUzNVRZOTc3V3JTZ2Vaa1hKeGtnVS9FaUJHWkJRbEZJ?=
 =?utf-8?B?bkVsalFSbFhvakJNYXRpUFBsK1FSWkQ1Vm56OWEwMS9RVmZ6MjN3cXhJUjRG?=
 =?utf-8?B?RitFNkdrQ0lsNGN0amp5RENObXRBZzBEMjNIYTBsR2FFT3UvamRxckZvMHlu?=
 =?utf-8?B?WXZ1WTBRdUIxK0hXZkdIWG9JcTFhcmVBTVM3RW5YdE81QlpCd0tWL21JbFZh?=
 =?utf-8?B?N1lnVDhHVlI3RDl5KzhrcW5CTXdHRC9uT1I1SnhCT0podERicGY0VnFKSlVS?=
 =?utf-8?B?bDVuQWU0dEV1ak9CbWZmWVFZb0sra09TVkFuQzk3bVJ3SWdmVzFTaDNkMnlw?=
 =?utf-8?B?UGRibDZub1R3eUh1Q3lQUzJUUmFtbXhTWFRVOFRHNGRtRjNTYUdGV2t6SHlp?=
 =?utf-8?B?UGNWTW14Yyttc1d1RlhEUXl4QjRUOTU3blE2ZlhSQkpyVmpFbGExQyt2Qmlj?=
 =?utf-8?B?NnNYYitIVzFjZVpjZHpZb0JrRjhGSWxFMXpBVUsyaFZnYnhqTUtrYTRDMHU2?=
 =?utf-8?B?eHFRZHBJeUZIQm5zcFdubE5NM0FzUFJlb2loR0U3ZndIb3NtS3dMcGJpQ1pj?=
 =?utf-8?B?RGswL05yYjlmVUs1UEpqa2xRRG5vUEVYcDVYLzEwaUF6cWk4K0w4RGh1eDEx?=
 =?utf-8?B?K2dNT2JNQmhaWkVkbFFJNGI3MCtlR2FXd2lhdVZNVDR2TjRxZ3ZhVU9tQXRO?=
 =?utf-8?B?SzNGZG82SHlHcVkvM2ltaFV3UUZQOWs3aE82TWRtRUh4a2d0NllXcHpDK1FI?=
 =?utf-8?B?ZUdMbjVQdXBxeW5RWjJVNG5GRzZENGV5Q0ZkM1pVczMxMHZLczljUk1ES0Nv?=
 =?utf-8?B?ZkQ1dlk4cjROQVpOT09SMjJDbnFtUStoTUV3ZlVGd2NpdVcvUTE4RmpCbTcw?=
 =?utf-8?B?ZWlHNHBmaHJiS2c5TmJzNmdKbFRpckJ5Q1NVb3lhMllwelJrYzFFVVZlMDJ3?=
 =?utf-8?B?Z0ZLaE1aS25WaGNEQjlOdW4vaEJTYm9kNTRmT0ppQllLSDRNbTU1Q0lzVU1t?=
 =?utf-8?B?MWVEZWRJeUtleG9Cd3luWkE3SUt2cDcwNWpRSGMvTEROdkh0TDR2dXF0dndV?=
 =?utf-8?B?bjNKdkF6VzJoUDFBZytYMkVRc3BBekQwVy80VVdpSStyZmJQUXJzYldvMXR0?=
 =?utf-8?B?cVVCQVRpU2VxTFR6OTd1OVhSUlpnbGltVitjc2M3Mi9xem02b2l6cTArOTVn?=
 =?utf-8?B?SUJQbHNWK2NEcE1iRlJUSW1oOFdodkxKT1lDMW1rN09JaUVOQWphUWRORWdn?=
 =?utf-8?B?bXpONElxaDQ1UXZtTHNqUVdRM2pzNjg5ZHBuODFTenlFYzhoRTdhWEhZNWEv?=
 =?utf-8?B?anlBeHRmVlhJY3JOa1laa0F1VTQvay8xdkpTTnNiUUk2NGpFcE9mQ1VEVlRH?=
 =?utf-8?B?TzVxNEpLVnNWOC9vYlBieGxKZkNLaVVLK3NaSi9ic1VFMHpua29tRzREZ2Jv?=
 =?utf-8?B?V3dvZ0FzRUpYYW1HOGhPblA5V2M2eTEwRC8vZDBpWjJJWStna1dTSTRpaExY?=
 =?utf-8?B?Ukc2ZW9LSDE4dTZQK2dTMnhzYmpvOGVQZjlSMG1UQVhqZE5yVHFxMllsMzVB?=
 =?utf-8?B?WGx1YXo0WU5pd0NGR29RYmc3NHFweXh0SEJsYVFPRDBHL0NlOFBlYWZmNmxy?=
 =?utf-8?B?R2RuMWhvTDFZLzF4YTVkcUs5ZXppMjNxUEJGeE56VnN5MUJIVENFekJVYXFP?=
 =?utf-8?B?OVFTUDBDcTRqNGs5SWdCS0J6ZDNNVDNWV2tBaDVnM3hIOHpTSXJtZUhnTEUy?=
 =?utf-8?B?U0RNeUxHTDNwbXNwOU52ZHJXTWJLQTZjUGh6YU5PczZmMHg2S1pyUnVQZHFo?=
 =?utf-8?B?Skg2SG8zWm1JQmFPdnp5VzVuV1hGcThidkRlVVhHdHhEU2kwcEtNK3NpZHhZ?=
 =?utf-8?B?RFN6Qm5IbjVIN2JnOEJ0cWpDYm9sc1F4WVRxbW9KMFkwQW5wQzJ4bzFvM2xH?=
 =?utf-8?B?L0lkcS9VczhEVSt2cDc0SnhZN0tUUEdjSC8xSFczWkYzZ3E3Wm1EU1lQZmsv?=
 =?utf-8?Q?99i95bBPD/px+8NOrwwxmTQIx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bad105-19f0-493e-abe4-08daa08a7a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 13:16:24.2318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYtrXVhmG2avX52JFoI+SLPu/4tRMd85PbGO63QyTysWcb0ZqXHceba56pVXODqINn31q9cu5FHhkZm4vxjT2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang, 
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
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

PiA+ICsJCWNhc2UgU05EX1NPQ19EQUlGTVRfRFNQX0E6DQo+ID4gKwkJY2FzZSBTTkRfU09DX0RB
SUZNVF9EU1BfQjoNCj4gPiArCQkJLyogNC1zbG90IFRETSAqLw0KPiA+ICsJCQlyZXQgPSBzbmRf
c29jX2RhaV9zZXRfdGRtX3Nsb3QoY29kZWNfZGFpLA0KPiA+ICsJCQkJCQkgICAgICAgcnQxMDE1
X3RkbV9tYXNrW2ldLnR4LA0KPiA+ICsJCQkJCQkgICAgICAgcnQxMDE1X3RkbV9tYXNrW2ldLnJ4
LA0KPiA+ICsJCQkJCQkgICAgICAgNCwNCj4gPiArCQkJCQkJICAgICAgIHBhcmFtc193aWR0aChw
YXJhbXMpKTsNCj4gDQo+IFRoZSBjaGFuZ2VzIGxvb2sgb2ssIGp1c3Qgd29uZGVyaW5nIGlmIHdl
IGNhbiBhdm9pZCBoYXJkLWNvZGluZyB0aG9zZSA0IHZhbHVlcy4NCj4gQ2FuIHdlIG5vdCBnZXQg
dGhlIG51bWJlciBvZiBURE0gc2xvdHMgZnJvbSB0b3BvbG9neSBhbmQvb3IgZGFpbGluaw0KPiBj
b25maWd1cmF0aW9uPw0KPiANCj4gDQoNCkkgdGhpbmsgVERNIHNsb3QgbnVtYmVyIGlzIHBvc3Np
YmxlIGJ1dCBub3QgVFgvUlggbWFzay4gV2hhdCB3ZSBoYXZlIGluIHRvcG9sb2d5DQppcyB1bmlv
biBvZiB0eC9yeCBtYXNrIG9mIGFsbCBjaGFubmVscy4gV2UgZG9uJ3Qga25vdyB0aGUgbWFzayBv
ZiBzcGVjaWZpYyBjaGFubmVsIGluDQpEQUlfQ09ORklHLg0KDQpEQUlfQ09ORklHKFNTUCwgMCwg
Qk9BUkRfSFBfQkVfSUQsIFNTUDAtQ29kZWMsDQogICAgICAgIFNTUF9DT05GSUcoSTJTLCBTU1Bf
Q0xPQ0sobWNsaywgMTkyMDAwMDAsIGNvZGVjX21jbGtfaW4pLA0KICAgICAgICAgICAgICAgIFNT
UF9DTE9DSyhiY2xrLCAyNDAwMDAwLCBjb2RlY19zbGF2ZSksDQogICAgICAgICAgICAgICAgU1NQ
X0NMT0NLKGZzeW5jLCA0ODAwMCwgY29kZWNfc2xhdmUpLA0KICAgICAgICAgICAgICAgIFNTUF9U
RE0oMiwgMjUsIDMsIDMpLA0KICAgICAgICAgICAgICAgIFNTUF9DT05GSUdfREFUQShTU1AsIDAs
IDI0LCAwLCAwLCAwLCBTU1BfQ0NfQkNMS19FUykpKScpDQoNClJlZ2FyZHMsDQpCcmVudA0KDQo=
