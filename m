Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AC74FCE7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 04:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496D0FCF;
	Wed, 12 Jul 2023 04:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496D0FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689127269;
	bh=aq1vOA5fdRiTOiqmlcbFR06nHrFWFBo63geN3VIbgeE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DU7S/8x1b+ydC7IJ65OJoI2scUQAnXItSpS5etXkbCoHXeksvChYpuQOzlEV4BfGf
	 bzWYCiDllnaPCn2fqTUAAcxA4cjfcOCrS+pX2kd1VdOoco8A5w7QoIT7jPj5kAD4n9
	 NhMojZktHL10tNDKIV7RFUzAybGoZvS2vFdJemlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA60F80551; Wed, 12 Jul 2023 04:00:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD75CF80236;
	Wed, 12 Jul 2023 04:00:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7249BF80249; Wed, 12 Jul 2023 04:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02107F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 03:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02107F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GQsbpeej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689127196; x=1720663196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aq1vOA5fdRiTOiqmlcbFR06nHrFWFBo63geN3VIbgeE=;
  b=GQsbpeejyDi5eCTJghTBpWr+jTf6jksQKq8UzIbb9JeuKiPZ1IR1tL7l
   4XFyJPLK5TJWhjkws/RFWh7Rg9pHnpjiDD7sC48g5OUrsieydUV0D3enj
   W7VDnGmPuxlyPrOnDyTzeyFIiz3A+C6q30maPc8k/bhmOV86rvU6SbfOb
   DUcnNaLpQXBd60zN1+BFVT0fba2gXJ4xkHX+DZ8bv0VmiZ+Ffm4EmQRAD
   SdNzvS40JWDADQFx8+rTyUgrJizVXAcmgSu+2fs2OCR14E5ct97jp4emO
   nXzT2qo1lk+imrCoz0Yosbun4+uI9/JYsbLaGbShIQcmCQGIr+Sa/aSdv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344381135"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200";
   d="scan'208";a="344381135"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 18:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845476632"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200";
   d="scan'208";a="845476632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 18:59:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 18:59:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 18:59:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 18:59:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 18:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCLqpurpVkdxsAJaUaJ0yNkSkPFCkwCX+X+ZoftukqyuFF+whMwA7tOOH7nkw3IoEtN5v9kycmcK2aowKB2wkKrkcHqyilefOfJWX9M2VCPbz5H1f13G3txTrQb8UrmWcXVMe5BEp6H66kcC0MxJDXDOT6A+infFtKEMRBA/GZtANLE/YPrqSGv8BSyck64/2ICqpuqxSnQI2puuy3BG0DZPDlQhpOijJNeQwTjYOQw+dHczq7jSAgrGCS9oL3F2drHtJm1+SiK+h/MSe+rmk6P282EbsDU4LvWGamG3+9CqcIxM2A4pSZH+F1TUm95dMDQCusKW2forqs3X8L+uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq1vOA5fdRiTOiqmlcbFR06nHrFWFBo63geN3VIbgeE=;
 b=MAdHL8FZbQaqchUI+eRHwM2OrmxjyK8v6wqQlOjHGm9jqnYLjRfcNPX841TG5i273KoEfK+bwwjoaoI6g1nrqww4kcwWcKKvl42r2rsi1dy0sxO/g2e33lWtdFvShLNy3WQFggsozX6tN5kOu4Pmmth3aflt+ZLk8PIdXtieiAYhXWu2xcMF7FmQQwr9S/xW/HZSzSYBTyVjQ6DGahCyIE6NretXqF0AAFxdcB3cB4pBDKjGbKL0yq5/RqKUuyq+bXVi2VoyZJXING2ixvK++c5oOerFgc3qolP66gI9fKKZIjbwhXU5Odch0hVXUAYvBP3VZgX6hkmNHJ87GKBMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 01:59:46 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::25f1:cac6:3bbf:27ad]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::25f1:cac6:3bbf:27ad%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 01:59:45 +0000
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
	<yong.zhi@intel.com>, "Bhat, Uday M" <uday.m.bhat@intel.com>, "Song, Gongjun"
	<gongjun.song@intel.com>, Ajye Huang
	<ajye_huang@compal.corp-partner.google.com>, Arnd Bergmann <arnd@arndb.de>,
	Terry Cheong <htcheong@chromium.org>, "R, Dharageswari"
	<dharageswari.r@intel.com>, "Chiang, Mac" <mac.chiang@intel.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Thread-Topic: [PATCH v2] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Thread-Index: AQHZsvbI1KE8jWKCpkOth506Q2bRYK+ynGeAgAK5/TA=
Date: Wed, 12 Jul 2023 01:59:45 +0000
Message-ID: 
 <CY5PR11MB6257885AA340C99E1E337CEF9736A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230710141610.227988-1-brent.lu@intel.com>
 <f12360ff-cd8a-64b6-6cdd-beec2651787c@linux.intel.com>
In-Reply-To: <f12360ff-cd8a-64b6-6cdd-beec2651787c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|CO1PR11MB5010:EE_
x-ms-office365-filtering-correlation-id: 9aab9235-147a-420c-7ea4-08db827baa99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FHBSKP0RmidoT3JID/uq96Fdej9oNja5PbgrR1pgNM+i5pAHeSDzTpOkk3e4JNvqWZjf5BAF0jwfn5AG61l9jKctLHjVj0MrTozhati28M6s6LgrFRHnHg/OUV/DOVvy1h9c4eDshqgdcJYGMk0MWas5PaCIkzlU5X9wS9Z5P2SGgOLGarJ/jJVNOsyWQieoodtwnnsD7zyhdExVcyJzXpN/Fl5k+da+17SzVk72uIulSzX4aUEn5bMzfwdUj5nRj29/R80OIeoS/lcwQoPFRhKrhdWYIk6AQBYxEt8WPLoNpaF5tcUlFjZMmvLyUUp9p78hw3ATjoKzpzizDPZUT39jNDamqXCZgV0YjNxDEJAWEIHPVhyQ0khV1DitLkUuoHdWGc2+KXQgOiRtDXdxsXAnDYOP4hh/hXAlHz28BYpct3pvnpefjjPtTZ81BtnurjQEzSaafCrAoOIOjFXhwIPf+fHS7Sn2/4vh1/+os24ZPnpebE1L7YNc6Gu1xNNUUCtFoUtyxyrFsqe5SDNRojoVzKwGAnzIUh1aKrsStexG7iTnYU5XTg0Wtge6mvYEyxD1rvjP8kYtbtXQZ4c8vMR1xdsXpj1QUD9fVIguQ2JQ0v3sQU7vImxw62kD5DVL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(38070700005)(33656002)(86362001)(55016003)(38100700002)(122000001)(82960400001)(110136005)(478600001)(71200400001)(54906003)(7696005)(8676002)(5660300002)(52536014)(7416002)(2906002)(4326008)(316002)(64756008)(66556008)(66476007)(66946007)(41300700001)(76116006)(8936002)(66446008)(26005)(6506007)(9686003)(83380400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MjArOFUxdVhMMHVFWDU3TVdqSmpGRVRUeERqb0pibTR5UDRMQkdzbEFxNnUr?=
 =?utf-8?B?a0tOTUZXN1VxQjA5VExmd0NXRmpwNFBoZ3JuczU1YzA3UDI0Q09SVm9namhs?=
 =?utf-8?B?cFlFSG0rQjVRYWJNd05vOThGTkNubEoyZ2VtdFFwbE0rNFhxZ0diQVphanJo?=
 =?utf-8?B?SGkvRld2VGdteDczb1FyajhkWktRcnBWajFnOTRGWk1DMWVOUEVYcnZZOFRI?=
 =?utf-8?B?TFFhRnphQTlPdUxmUXcxZkNxNzBrN3FtSm9zY0Y1eERQY21OeHZFYUtSSTFB?=
 =?utf-8?B?cHRNS3ZPM1pmQWRQTW5QUGtKSDNmNmU4M2FKdEhXendoMENFLzJpczg0OThk?=
 =?utf-8?B?M2liNWlYWWQ5VVQ0bzVuOUpzZko4QzVZSENmZUJBTVlURkF6NURPWjNBd3l1?=
 =?utf-8?B?ZHVPQmg4bEpBcm52MWFtZTYwNUNQdmlXWWRCK0FlZ2txWHhPRCtxS0pvemFV?=
 =?utf-8?B?djQrb1B0VXViNDdLQU1OeEk3SW9taFVOYXpycEx1ZFdpWW9KaU9aeG5SMUxr?=
 =?utf-8?B?a054NmgyZUQzbktvRE1HRFZTY3lXcGxZT0U5R1NkeUdRVmt4MmsxZkEvaHJv?=
 =?utf-8?B?VTBrY0s1VFJ5UE5wTW1OQU5LU3pJKy9WamM4aERjWlFRQWNoVWRBbGpPU0RZ?=
 =?utf-8?B?YkNnUlIvSmZKVmRCWlpLaGFHZTZkcVhPSlNIZE5KTzFKRnBaMEg2ZlJuNHlj?=
 =?utf-8?B?UTFxZGt3Y3ZYdFFIa2JvZ2hsMDRHaG92cFQzTXRwSmJ3YytycWh6NjJ5c1dh?=
 =?utf-8?B?ZitWczRYMmZwWFRFTXJEaHBNTko2VFJ1WXN0dWVPZEFwdUg3V3JNcEIxK3Vl?=
 =?utf-8?B?THRwUnZkVlNCcmMvZ0lnVWVNWklHd3pKMEo1b1RSRVdwell4dGNXdit0YldS?=
 =?utf-8?B?TjdUZmFOcFBJUTQzdGlac0ZwMHp1Qkd5RW9LREtCS2Z1NzNYaUI2OGkyck1i?=
 =?utf-8?B?S0V2SU5xZHJWWElHcE5rcm50Z3NVdTRHalRKZ3dGUDNheTVNNFRjbWIxbW8x?=
 =?utf-8?B?dFhxR3B2MUY2MkxwQS9aNXJ0ZGlWT1JlTkdhTXh2M3NWaWxwUmlUWC9COTdM?=
 =?utf-8?B?R0wzdTdZUDhXeWIrYmlVNTJhRFEvSFd6TFF6Nk5DZjduOUtobzRhYmtFYVZH?=
 =?utf-8?B?Mk9ZSDJZcTJHVk1hazJpSVJjMW1FN05FT25oUzRvVHVNeGRSTjI1MDBkdkZM?=
 =?utf-8?B?MndSVkQ2a25Fd1laUjJ4MnltR2JKV2ZrbG5Wdk1OdGNHd3dlcWQ2azRZa2Rz?=
 =?utf-8?B?TUlpZTVGT2RMSWpYVXZ2eThCZFg4d1E1Rk56WHcwWEF6NHZHWW83QllLc1JJ?=
 =?utf-8?B?ckltVVh5ZHdXK0pZTlhsemZJZlRBWEVZNEVXN1V6OTY5aDc5RnUyZTVuTmVM?=
 =?utf-8?B?K1cwRGxIRFIzZXY1LzRIc1BWem8xbnhnc21HZG5ZdzRzWVVPYVNwODBSanF1?=
 =?utf-8?B?T3pyUnB2dzRYK2x4emhHanFWOExPd0NHOVY2Wm9xRmYxK2VnWTdCSENNZmpW?=
 =?utf-8?B?RmJPbUx2TG5oL0ZpTHB2Yks5VGdDMTI3Zi9oaDFFT082dFlSTGY1YXpic3lW?=
 =?utf-8?B?Sk1HTm9yVzhCd0tjTUlrZzl0T24wNm5kNEVtMjI2ejNOZDlNdmw4aUhqTG9S?=
 =?utf-8?B?cXB1YWpvMFpnMFRudG9uZnVrcUlqYVhhZFZON1lKZVRPcXhrazJ6MSsvVGpE?=
 =?utf-8?B?M1IwbEVHeWdRL1JJZUhPc0xHTUp3SzdpR2pseGxDd2hoaUFsS21wNFlBREJm?=
 =?utf-8?B?T2liZ0hGdTVrckM4ditPZlF5czhGWUpMQy9XQ0NBK0FDWVltMTNibXp4K1R0?=
 =?utf-8?B?VDRWOC9nbkdBaFBIZ1BUMXhlUU90S000b3J1UU5mS1FVNjlFcStiRFNtNUxO?=
 =?utf-8?B?aXRSSEZUTm1KWFdNd3c0NGJJZVZtc3N5Y2JhVllQMmp2N2h1Y1M3UlFsQ09s?=
 =?utf-8?B?TjVTQlg5d09DTklIRno3TEhmbHkxbkpQdGcwUDVUK1hrYzc0TEdEUnNYZHA3?=
 =?utf-8?B?Qll0WVhLVURZbEZsZlBFR0VxZ3NYcnFPdWxMTnpadHJjRllGcnV1bkpYcnA2?=
 =?utf-8?B?aGF1VTRQYmtQcFFCN2hLdVlZU1JibXF0dzBmVGsreGhwbGtUVlFMakg0bWpP?=
 =?utf-8?Q?l++I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9aab9235-147a-420c-7ea4-08db827baa99
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 01:59:45.7431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uWBNHvq6Bs3yTrq0enfdWXj6yRQK9iK84ArLgTF4kGSceqRlk7P/MgBJpTk9sFhsB5XCcnThkWnY8vumxMA25g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
X-OriginatorOrg: intel.com
Message-ID-Hash: TO6O7A7GMT4NJFZ4BS3BVMCXSE6ZSCA2
X-Message-ID-Hash: TO6O7A7GMT4NJFZ4BS3BVMCXSE6ZSCA2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO6O7A7GMT4NJFZ4BS3BVMCXSE6ZSCA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+IGludCBzb2ZfcnQ1NjgyX2NvZGVjX2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUg
KnJ0ZCkNCj4gPiAgCXN0cnVjdCBzb2ZfY2FyZF9wcml2YXRlICpjdHggPSBzbmRfc29jX2NhcmRf
Z2V0X2RydmRhdGEocnRkLT5jYXJkKTsNCj4gPiAgCXN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAq
Y29tcG9uZW50ID0gYXNvY19ydGRfdG9fY29kZWMocnRkLA0KPiAwKS0+Y29tcG9uZW50Ow0KPiA+
ICAJc3RydWN0IHNuZF9zb2NfamFjayAqamFjazsNCj4gPiAtCWludCByZXQ7DQo+ID4gKwlpbnQg
cmV0LCBleHRyYTsNCj4gDQo+IHR3byBsaW5lcywgYW5kIHJlbmFtZSB0byBlLmcuIGV4dHJhX2ph
Y2tfZGF0YQ0KPiANCj4gDQpXaWxsIGRvLg0KDQo+ID4gKwlpZiAoc29mX3J0NTY4Ml9xdWlyayAm
IFNPRl9SVDU2NTBfSEVBRFBIT05FX0NPREVDX1BSRVNFTlQpIHsNCj4gPiArCQlleHRyYSA9IFNO
RF9KQUNLX01JQ1JPUEhPTkUgfCBTTkRfSkFDS19CVE5fMDsNCj4gPiArCQlyZXQgPSBzbmRfc29j
X2NvbXBvbmVudF9zZXRfamFjayhjb21wb25lbnQsIGphY2ssDQo+ICZleHRyYSk7DQo+IA0KPiBJ
IGFtIGEgYml0IGNvbmZ1c2VkIG9uIHdoeSB0aGlzIHdhc24ndCBzZXQgZm9yIHJ0NTY4Mj8NCj4g
DQpSdDU2NTAncyBkcml2ZXIgbmVlZHMgdGhpcyBwYXJhbWV0ZXIgdG8gc3BlY2lmeSB3aGV0aGVy
IGJ1dHRvbiBkZXRlY3Rpb24gaXMNCnJlcXVpcmVkIHdoaWxlIHJ0NTY4MidzIGRyaXZlciBkb2Vz
IG5vdCBuZWVkIGl0Lg0KDQo+ID4NCj4gPiArc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5r
X2NvbXBvbmVudCBydDU2NTBfY29tcG9uZW50c1tdID0gew0KPiA+ICsJew0KPiA+ICsJCS5uYW1l
ID0gImkyYy0xMEVDNTY1MDowMCIsDQo+ID4gKwkJLmRhaV9uYW1lID0gInJ0NTY0NS1haWYxIiwN
Cj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLm5hbWUgPSAiaTJjLTEwRUM1NjUwOjAwIiwNCj4g
PiArCQkuZGFpX25hbWUgPSAicnQ1NjQ1LWFpZjIiLA0KPiA+ICsJfQ0KPiA+ICt9Ow0KPiANCj4g
Y2FuIHdlIG1vdmUgdGhlc2UgZGVmaW5pdGlvbnMgdG8gcmVhbHRla19jb21tb24uYywgY2hhbmNl
cyBhcmUgb3RoZXINCj4gYm9hcmRzIHdpbGwgYWxzbyB1c2UgdGhpcyBjb2RlYy4gVGhhbmtzIQ0K
DQpSdDU2NTAgaXMgYSBhbGwtaW4tb25lIGNvZGVjIHdoaWNoIHN1cHBvcnRzIGhlYWRwaG9uZSBh
bmQgc3BlYWtlciBvdXRwdXQuIEl0J3MNCnVubGlrZWx5IHRvIGJlIHBhaXJlZCB3aXRoIG90aGVy
IGhlYWRwaG9uZSBjb2RlYy4gU3VnZ2VzdCBrZWVwaW5nIGl0IGluIHNvZl9ydDU2ODIuYw0KDQoN
ClJlZ2FyZHMsDQpCcmVudA0KDQo=
