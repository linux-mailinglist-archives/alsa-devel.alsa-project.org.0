Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA266C6936
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8BAEC8;
	Thu, 23 Mar 2023 14:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8BAEC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577093;
	bh=yGINACe8zTFe1yLEHMlNNPwW1uGOZT/PYbBO9WaOri8=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X9l7ipl4pEaT+DYBKeM3bOHo1c1+hT+WxdQ0z0rrxUmHc+viHYugPpgcUZF+9Fk1P
	 XlinkXr/J0p9EntLDFTtSs4wl3Dc0BX3D0RiDb6rN5FGRD49Uuj/46UAGDqWkvKIq/
	 +9TPJRTgWWbIW/SvxruEurRVLozkUnEstEFUffs0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7DF7F80544;
	Thu, 23 Mar 2023 14:10:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E016EF8027B; Wed, 22 Mar 2023 16:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAA75F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA75F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CbNrCz39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679498147; x=1711034147;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:mime-version:
   content-transfer-encoding;
  bh=yGINACe8zTFe1yLEHMlNNPwW1uGOZT/PYbBO9WaOri8=;
  b=CbNrCz39FPTTf+cK44tKTlgIYlVOC3T3TZA6vmxQ5x2rNZaBvo8F3ZGV
   6wW0knD+k1ABB6K7ZAyB5+bBznWCtT0SQK1I+/sIQ6vB+nyHlTUpm8/TK
   0sGDfFkieWhe/YWT1lf6yqJ0hthNyaNyTfFzaeC+RLfg2ESzohVk0iSaU
   cAtPk3/MIMYEuw/9YTTEHvaLcDDTbMFvGxU89M9q9X6uemu2l5j53VmsB
   3crPAQeZdL4s/BpkFeLStkZT9cMMmY4UlFDpDFQi+ngw+/4raIccXCGTh
   fdKFojAWfqu8frs+sOkzxrlm2jKJNJRF3JypOPh2fSxvhSSpuhqeup/y1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401809410"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="401809410"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 08:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="927872545"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="927872545"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 08:15:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 08:15:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 08:15:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 08:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHV+9AardNFJWPC45yEgHfDaAMZvsCJDHp5eIj4ksgQnGgnPCweTMLzpr9Ivln4cipZpNVQkfCSEA3CKO/a7Y/mJnQv20jrY8Y4uJzaOu7fu3WtiYq0+A8IY0CavCpgqNrGzhYK6OdbkWsE3mPbwBoDV2VCUIo9ELwT0D8+emgVBhlStO05lQEu1JG47W1V9XKBJHiXJ5E+d9pc+oZmYLtwPzqeBGU/qtJS4fAe4KyLz3cJjJYkZEhYUxhPpt2Tg/qEPNjSTEOc857e9nWfDeL8NxT8CiPgvsztOsEThoYM3yd6h7Gls3fN5o4tOUtA0D/HMuhazXfonf0E88nIRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsa7u8MuJ0ahLSoUUmmJmOm/n+FQPx9RX8tB7g5Xz/E=;
 b=BYUiMNMCUPFZvMShqcGgNGIPMOPVaBO9kVE3EzCMd4MWuAUD7a48UqJAQ3K21H2b/qSWqPIaK7tY8kqaVWQOEhCBP+FGuLL28Eyd/+BWIhAgOj/auL49CulAnUtCfHgeRBOxwjOCKOd9iJZFcfmEzj0jSTd71PZTdityrg/Xs6MZfUU4UmJHMD6Mbc3TeUO2tRiM/RYOWuS9DLxgyc6B/e1GyEMU3oQxrFoLRhm1VJxN7qRxEOEwPfuKNurHbu/Wmyh9/EXuyb+jZDfqmNyvwX9K9OEVNv+VuDxxcQhmC5tZ3FNpzxXqoc7eoIbP+i5/FBAmh4WMZW8fjrAqgsvVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 by SJ1PR11MB6177.namprd11.prod.outlook.com (2603:10b6:a03:45c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:15:24 +0000
Received: from SA1PR11MB5777.namprd11.prod.outlook.com
 ([fe80::fce2:a461:67b7:da16]) by SA1PR11MB5777.namprd11.prod.outlook.com
 ([fe80::fce2:a461:67b7:da16%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:15:23 +0000
From: "Sarha, Jyri" <jyri.sarha@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Thread-Topic: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Thread-Index: AQHZXMZ6olwuty6tNUOhKaEByEpX1K8G1NoAgAATxgA=
Date: Wed, 22 Mar 2023 15:15:23 +0000
Message-ID: <578daea5b7bc0db3164c84e550b24bd724de9ebe.camel@intel.com>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
	 <ZBsK5mJUfHSyrlU5@sirena.org.uk>
In-Reply-To: <ZBsK5mJUfHSyrlU5@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB5777:EE_|SJ1PR11MB6177:EE_
x-ms-office365-filtering-correlation-id: c81c5c34-9eb4-4da0-cd8d-08db2ae8427a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v74B6829Bsdx4cX/GUhMMCQW+hvWfCZMtEcz9ZvLCdJXQbHMqvfD3d8V+Qo9TXD/T1Dy//v6fQfa9YIQ7Ks3wTU6PqN8rUXo/Woc/91VVFEL7UF+iV2wucMJLwabg/okOB+MDVsFRKcXqvuRRCAPXoK2S+f45QnAVJ1SZkLMHy5d/tVCV9Gd4TLPbIGEQWTcBq0z2Vn+a32Jd13KNC+uqrpYWy36id76pM4Nvw1ZjTnwiqJq9bN+FNaFvaJkGcX7GYYI0DNX/IVrrFptAqv2q3Pa0dsij11O0w1dim+9gAjMXkNGX/G+z9EKWJcqS6QqAVK2/2oyBC7wQjPwWopJQehkPLGS8ZHLbMKe0LVVYLJS4NzoWNGy+fJpWNy9/XdtOGxQNq5ONARX1qKlPzNCL0PBiVUElTJNdDHR0JlS6OAchIF4lazSgvXo+TjkvKQtft/cQErch8aAWBiOVw9wnayF37xQu0xdg8jSmacbySUfdNRKhpzJ8pLc+R0sCCIln9/kHyr1+QF0i4JGoEEcWr/MoBol0aODRKKP/bNDZwFHMawi1s3HXqaqB/sazUeezhhUoBYPNiqiCiBDjSEdSilaylsPM9/TMyvVdxHoViS92MNAxEi2faW+glfn/C4sVDh+y9QzOinr51Lx5/dvh0XZ3wmyfJz8/Dh4acr+QeHNcngznz7MfujU0XcrSU4O244zxDAic/idPU9aJXbILA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5777.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(41300700001)(66556008)(76116006)(66446008)(66476007)(66946007)(91956017)(38100700002)(8936002)(122000001)(86362001)(2906002)(38070700005)(82960400001)(4744005)(36756003)(8676002)(5660300002)(64756008)(6486002)(71200400001)(186003)(6512007)(4326008)(6506007)(26005)(316002)(54906003)(478600001)(2616005)(83380400001)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?andlZW1nSXgzWXhoL3YxWERlc1c5eXpnOG0zdS94ZEMvWkZlQUpkL01iMyts?=
 =?utf-8?B?UTJraFc1RklhS0FTaVkrT2FESUl6SlpWOGRRSCtBc0pTZFdJOVFGcjlmMGl5?=
 =?utf-8?B?Sk5MV3o1VXpmTHVuSFNRTVFmNFZtdjlXSkE5bktwdVZEVDFkam51MUlEeUIr?=
 =?utf-8?B?a2dTYlh0dDdZdzl0WUdrems2RHhtMjh4WEZIem9sSFVCSk13RjNmTUZ5WExz?=
 =?utf-8?B?S2Y1NFRicVFDUkpHUXlLeElEZjNwLzZSWU0vNXZpZ09EWVIxZStvNEVTLzVF?=
 =?utf-8?B?S0dqZ1RsY0p4bVAyVEY2R29JOVZZQXc0eEFmVGZSU2ZxcVBDYnRuL1U3ekFq?=
 =?utf-8?B?VldKNEl5Si9zaGRSK2dPOG80VVhkMVUvbHpDOXVZZ3Fualk2Z2M1RGpGVDRp?=
 =?utf-8?B?UFdjeGpoTXBXTWd1Z1NFeGlhRmh1TjdNRkpLZWc0UHppQ3NzVlY3cGFNS2ps?=
 =?utf-8?B?ZW5TK2lzOHAyY0V3djBkZnA4RmNnV01lUVFuUW5DS2ZaNXhJR2daeHdQYlJZ?=
 =?utf-8?B?L0ovMkVuV1VyQjFmdHRLOFVueDlORXZaZ2NTZndxaDhVZkQ4TDRpVHJlUFZN?=
 =?utf-8?B?RGRzWFNpVGlXUzU2bzlXMkFITWl6dkY5VU45bGdJRDQzdm9xa3M4cDRTZ01Z?=
 =?utf-8?B?UEhXZElwWG9JY1daOWxzeFBvT1ZpeENvV0tqeUV2cGFzYlJSNEk0MFdCbFVY?=
 =?utf-8?B?OVRTeG56cFp1SjFYWGlkUkxJYzhJYUJaaFR2L3hrYU1Oa1NVUE14VmNML0Vv?=
 =?utf-8?B?QUJoSzcrUEw1c3JNeWVHR0JEblhVTXhJMGFBRGxOVk11NDl0RitkK1Vnb2g3?=
 =?utf-8?B?NmRBelNRWnc5Z2ZNbU1STkRRekhtVlZDeWZPcDJmd052L0g3bkdyNFVZNk54?=
 =?utf-8?B?bm5ibm5qZXZTMk5ZUDJxNVRYY29NT28wdFkzNGhxTElvVDhyVGZWYTA1YnQ4?=
 =?utf-8?B?M2dlOWVVejYwaFZTYXVoajkzc3lneUQyeisrLzk5NmNpNEJwZEU2bmUzejJV?=
 =?utf-8?B?RXYyWTdlZnNzRUhFck4vc2Fmb21qTDZrWXlBa0FKQW4xVklrSDBPRnAzeUph?=
 =?utf-8?B?SjRpWkFGSUNPSmlJQ3MvaHpBSHFMQWpZRUdrZDF6MjFTKy80K05ha2UvZ3VT?=
 =?utf-8?B?anB4NGRtZzd4c25pR2YxUGtONDVWZzBLK1pDYVo2UFp2K1NiVmpGZitDZCtL?=
 =?utf-8?B?MGVaRWFOZ3A4Z3BodlBjK1JNSUY5Qm9QQk4vVTFleGx4d0Z3SGNmd2s5aFBk?=
 =?utf-8?B?cUMxYlZnTklXNXQxbmtIQkxrTTQvY215US8zTlZrVm1YU0ZGaTBiMUw0dlEv?=
 =?utf-8?B?WGV2M2xkVWJYUExNV3o3ZTN4L1NHM0lwbXlVVUEzOHI0WHpqamJrYklwMzdL?=
 =?utf-8?B?M1l5dzE3bDNORjJUeEtudG5GbUIrZVJrSmR0RFlUbWVnK2NZbk41akhaYU1N?=
 =?utf-8?B?K1hwYzFwR25RRXU2cEwrNTNGdk5palQyeVFhNmRYRWEvZGQzd3UxWjNSOVJn?=
 =?utf-8?B?S2NJZFdqVjREVUMxNFBIdmM4b0MzbCs3RlBZcWhob05XRlgzemZicktDVk4r?=
 =?utf-8?B?eXVjajdDZmU5MlMwb3ByVXRmdUpDOElyR2gzZWJWUHRhdVhDZlM5aTIxdkRw?=
 =?utf-8?B?cjdHcmJrTGVTbVhSYnduK2VaQzZCNUk5UUNxdUtqaDlCTFB0TGtQY1kzR2tW?=
 =?utf-8?B?YTQwSDJaSk00Wkl2UFdnbVZpR3FpUGJoVnBtK1RMb2V3K09mcmpudE43cWNN?=
 =?utf-8?B?ZXgzZFV3VTRTcXUwa0Q2NWluUG1hYi8xRmZIV1YzMFhHUGpYUkpybWV4ZEZP?=
 =?utf-8?B?REFlZVkxRE9WKzFaUUFlUzBnemlmbm9CUDVpbTRidFhnREJ4V1c5UEFzdTg3?=
 =?utf-8?B?anJZWEloZnhFZ0JJaWY0VjQwUnFsZEVZRnVIWFVlN3lWYnByZXgvWGwrUzQ0?=
 =?utf-8?B?ZlVpOFBwS0Y2WWNzUDVnODNJdk50a1JqdVErS25VSXp0em8vYlI3SG14K0ov?=
 =?utf-8?B?R2t2TzhvM0paTW1RUHdjdVV6ZWZNMVorclVURW5Kd1I1a25oVDcxc3BhRkdO?=
 =?utf-8?B?bkpNa2ZyU1U2eGxmWXIyN2owUDU1M0hzK240TjJFSENzYytOTG1rcll5ZnB5?=
 =?utf-8?B?RldqOGdPN3huZ1FxRkttSHhIKzl1VWpZYUF3REpjalB4eHBxN3hkZjh3YzJQ?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05AC226CA86DE444A08A6C006BF2EA14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c81c5c34-9eb4-4da0-cd8d-08db2ae8427a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 15:15:23.8712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ZIF3kQ9PckWISHSoY+lgYxoypMrPdbryXJE+7MGmXHz/lwGZdxe5Z75uTOidyANoNTk88CEOEj7XaUqOrZgmuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6177
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-MailFrom: jyri.sarha@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MYFPDDYE33MFX6D45UKBDJE27IUTHRNP
X-Message-ID-Hash: MYFPDDYE33MFX6D45UKBDJE27IUTHRNP
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:10:00 +0000
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "error27@gmail.com" <error27@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYFPDDYE33MFX6D45UKBDJE27IUTHRNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE0OjA0ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIE1hciAyMiwgMjAyMyBhdCAwMzo1OToyNFBNICswMjAwLCBQZXRlciBVamZhbHVzaSB3
cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiA+IC0gRml4IG1p
c3NlZCBtdXRleCB1bmxvY2tpbmcgaW4gc29mX2lwYzRfd2lkZ2V0X2ZyZWUoKQ0KPiA+IMKgIFJl
cG9ydGVkIGJ5IERhbiBDYXJwZW50ZXIgKHRoYW5rIHlvdSEpDQo+IA0KPiBQbGVhc2UgZG8gbm90
IHN1Ym1pdCBuZXcgdmVyc2lvbnMgb2YgYWxyZWFkeSBhcHBsaWVkIHBhdGNoZXMsIHBsZWFzZQ0K
PiBzdWJtaXQgaW5jcmVtZW50YWwgdXBkYXRlcyB0byB0aGUgZXhpc3RpbmcgY29kZS7CoCBNb2Rp
ZnlpbmcgZXhpc3RpbmcNCj4gY29tbWl0cyBjcmVhdGVzIHByb2JsZW1zIGZvciBvdGhlciB1c2Vy
cyBidWlsZGluZyBvbiB0b3Agb2YgdGhvc2UNCj4gY29tbWl0cyBzbyBpdCdzIGJlc3QgcHJhY3Rp
Y2UgdG8gb25seSBjaGFuZ2UgcHViaXNoZWQgZ2l0IGNvbW1pdHMgaWYNCj4gYWJzb2x1dGVseSBl
c3NlbnRpYWwuDQoNCkhpIE1hcmssDQpXb3VsZCBhIGdpdCBmaXh1cCBwYXRjaCBkbyBhdCB0aGlz
IHBoYXNlLCBvciBzaG91bGQgd2UgZG8ganVzdCBhDQpyZWd1bGFyIHBhdGNoIHdpdGgNCg0KRml4
ZXM6IGNhNWNlMGNhYTY3ZmE5ICgiQVNvQzogU09GOiBpcGM0L2ludGVsOiBBZGQgc3VwcG9ydCBm
b3IgY2hhaW5lZA0KRE1BIikNCg0KbGluZT8NCg0KQmVzdCByZWdhcmRzLA0KSnlyaQ0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgx
IEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVk
IGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFp
biBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwg
cGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==

