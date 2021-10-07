Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20A424BE7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 04:47:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A509C15E2;
	Thu,  7 Oct 2021 04:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A509C15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633574874;
	bh=/VZX6+da2kpAfaYkXA7eiLdxLSiVmvAE6spPGH1h6f0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ikzc4vlygzQKD/4yKdSyBx1m4Et6Uc7Peen0nrkHYRl0V8vM4jSfI7UzfTTBk7huw
	 y/9w4rGBYNBHWYrYQJa4Ra1fh23j+eTD874CB2cwl5JUr2tLwslRNfoKq+Wszk7p3P
	 cCK+rcbJT96pGByFOvFfWZpzYYu59oAwMyDqiMEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33586F8028B;
	Thu,  7 Oct 2021 04:46:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86BDBF8027D; Thu,  7 Oct 2021 04:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B06F80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 04:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B06F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="UZ57rGKs"
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="226042610"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="226042610"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 19:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="484347139"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2021 19:46:24 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 19:46:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 19:46:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 19:46:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 19:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHH13OmtCh01QPkqhyOT3RdYbax2iVnM67L8ATgCmQio/pindPfCNUN78X+w+oFt+AEbvvecZ+j9qYeW1yP3pNvaE9U5l2eDp6F3rAH3GDDwC341MF2bgkmp0NOZGPJtPD42s7fBwsPBeANARZKwMQTSHUhzaQT9rp3kYbR+X0a4Aqi57AlioKvDHy1ZBnpEV32E866AcHNSawzOU/EEXIsQZX4IVb4FqYEt2FUOSWSuJyeYqjcpvgHXQFofP/5g0afUrI8gIPlU0v7zYTDyDLRqP5hczYwM0Oih7AiVosB1wEmmbPBMI32e0yk/8Y2kg+jcpE0UeEdkiPJoDFzIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VZX6+da2kpAfaYkXA7eiLdxLSiVmvAE6spPGH1h6f0=;
 b=WKQ5Ew0WU6BsOYgPdHmr+jzn0V3Jpo0+S/PSByHk7L/U1l9b0PlFzNIj0W3T7xGBXbYnTMY8cp6w7y5i0Y81pz8VRgiw8GyfdaqywkrgldBdQ8IpfzyNRglW0GJDrt+QhtRt+0hfP0EDGKWZn2Ej/+nS54wyAIEyYFpskUH0x33YNtpE3ZZsOMgFG12532za6gnBmoZeYSS9OX1ewDw1uE91Gpa97svC6kalu2D6Rd21/a+KRWJ6c3LgO097oOMU0Mm9HaOMztmv3hsb9j9zYOf4i6DqGCIR4cGEPATfN8y7LaFEB7YNzK7cS4hkUyAgJR6u/xnyH+fWD98p72saHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VZX6+da2kpAfaYkXA7eiLdxLSiVmvAE6spPGH1h6f0=;
 b=UZ57rGKsVEtOcxNkhcUdCkmRA1fWzCkNjCvCM8DcTjEM08aL9pasG7axV5/X5rU/Qio5UAJG/73SiBGTdbxqDfCaHtseP8OIqz4YnK8u/lbw58zkGNV3sVw5EEmCLVkFccX2ZulXPlzroNyv2nTpE7/9UHeoxzBb20Cz9RUfF0M=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3066.namprd11.prod.outlook.com (2603:10b6:5:64::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.22; Thu, 7 Oct 2021 02:46:16 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8146:72d7:47bd:e54e]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8146:72d7:47bd:e54e%3]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 02:46:16 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Bard liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
Thread-Topic: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
Thread-Index: AQHXus4VmJuwadVM8kG/uzoYv2HsfKvGNrGAgAABwICAAJs5YA==
Date: Thu, 7 Oct 2021 02:46:16 +0000
Message-ID: <DM6PR11MB40743B517390C8F04938CBBEFFB19@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <fdcdf447-352f-3dbc-f55d-b3bb3588dca3@redhat.com>
 <ecde4150-2782-9529-3288-b1eb9e247883@linux.intel.com>
In-Reply-To: <ecde4150-2782-9529-3288-b1eb9e247883@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39ceee87-ab26-4fe5-e20e-08d9893ca293
x-ms-traffictypediagnostic: DM6PR11MB3066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3066D08BE16056D74F16C96EFFB19@DM6PR11MB3066.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ivr2OtAudR90zKusa7v7EJ0DvO6R9TEG9bYHrwnmIJRGYTaSFa81qPdOIxrwPirxVB7sq8aAr1baIC7R//I6Xn5XSXwodShMio8Qf2IUFK0tkqAxU3Lh0V2pLPImU7QMAYu40JiBwVYtcq+YdIaTvGRh1xZbeqwrNRoGBL7LPN92q8czLQq3ZcWQH58lwa1GXIJNLO+pDXEp4SNmJOIG8D0nQyujWt1x6E8Grf30tnMJ6ZICEwBx6k73N9YazkAe9DkxtQa/EcE+JN6qRk+eOFV0x8ZJIY+RCYhQQZspYtQ3vOJUDNZDOy7bUJGRa8dmJL7EVoIDtw13aoJNHerI9DixRe0DNM1deab5du6zKfR2OXKJiOvyU4g2RPT/cOzb1r4rF02N+4DxlS0PkMxbmfMIoIgtojlD3ugrCpOo+qzDb1ikvkeqQdV6/B53fbt7m+hJIwYNsyoJwOqqoJcHahE7U/EQS+M4/XNElKUhaeHfDfOkPZ4yeIQDL1qDGoiVVh+xPHMEt7NuvyzXvz5lPMmA6GzPW1YboZ/3DVcaY7l8xKhX9njjaT1Mip610rNWQLNaXvDPTPuhLRxz6lOXT3qfP4Puu4JT8u+BnO++Fd9K/uSBnQOYllSz0ZJzx/UU+qoMrug0otKm/tp17Fs13B7RwdloPlSxVCjC7I/8NOGiJGCl2O41GqNVklUifE+m/jNnNeS1enzsapCcfwCp3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(66446008)(66946007)(66476007)(9686003)(7416002)(110136005)(38100700002)(53546011)(38070700005)(66556008)(6506007)(5660300002)(7696005)(54906003)(83380400001)(33656002)(55016002)(2906002)(71200400001)(316002)(508600001)(8936002)(8676002)(64756008)(4326008)(86362001)(52536014)(76116006)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFZSVjRFWWZlRW12ZDBBenNUcGF1Q04xMEZsZEU1cHBWZUJXSmljcU9iWW5B?=
 =?utf-8?B?Q3dkNjg2UDFaNXNteGhwV0VRbGo5RUF6c0JOWXB2ektneGphNjYwQUFDcUVm?=
 =?utf-8?B?eWFwRXhCcklXTGhLcFVUVFh6ZFY2U09lU0pkUHRBeVFmeUIvUFBDRWdyemdn?=
 =?utf-8?B?S0gwd3R2aUcxNE9ybWlPVXFveTIxNXkzTENhSnIvdmgyN1F5bWc1ZEFjM3Jw?=
 =?utf-8?B?VHprYkN5WmhLbkorcFJ2OU91cStsc3FTV0M2UkJZeE1tWFlsUWlQdEt5ZUcv?=
 =?utf-8?B?N2wrNkpwLzJuR3NVcDZrNzA3MlYxT1daUm1kZElNZENCY0g1Nnoyc3FpS2l1?=
 =?utf-8?B?eXFlWWFCM2NSOHFiYWlseU44SE1Wc1RJNy9VT0UxbXdLQklkL3hhQU1ieUg1?=
 =?utf-8?B?VmJxRVVMb3lBZ2VtREhFNXNQampCdEh0V3h6SERpUGExeE5lRVQzb1JIdi9i?=
 =?utf-8?B?MXNUOGZGTTRWNXBNeEsxNXpuV3pWSXZnUzY5VWg4eGd5bWk4UkU1bXZoVnJl?=
 =?utf-8?B?dERMRG9ZVlR4UldpcjVpQmFmOS9sUEYrMzVHVkJMR3pxYVVPNGVHY1M1VzhZ?=
 =?utf-8?B?TlArS1pTN2M2VzFWYWdHVnVwNUp6TWsyWklXWFozR1BrRGdINUpIZkdlMEto?=
 =?utf-8?B?WVZoWjVUVlRQcFlFOFI1aC9Na1RMbGlOVFBVZkhXRENMZkppYmJqTmxLTjJ0?=
 =?utf-8?B?SnRtT0lyaWt2NVFLeE80SXVDVVpBcVlLZUxHdEJUekFNTXRtdzV2RVVxaGtu?=
 =?utf-8?B?bFkrUEFKTHNWRitGK0FoSzVFK0xhK3hQNUNwRTl5SXFTdXYyV1gyVHdvYlZF?=
 =?utf-8?B?S0NLclR2bU5MVm1vdXp1aVZuSTVyMGUwT2hLZzZwbTFBNU1Ta3BiR0U2c0N6?=
 =?utf-8?B?R0lxODRtY29NNStscGpKTkttc2w4eElQOE9sZ0FJaEs1SFB4S0cySDc3QTBp?=
 =?utf-8?B?TWNhM0QxOEJrTWlhTTMzWFAzR1YzVEZGUXRQSjRFdzZrRTRsTno3ZXp4VEhk?=
 =?utf-8?B?VTV6Ukk1ckw1ZGFvckdWSkJUbXdLek41MGtWL0dGUnFzMFYyeUhYRzh6d0Nv?=
 =?utf-8?B?MHVvNkttUU55Z3dkRU1hNEJVOEgwWEJ5QXlvSkZuckJCY0VxSmVTaVBXUmE2?=
 =?utf-8?B?dG5CYjdJUzVrL0hZM0hYTFFWTWdJcGtjTUNBRUFnZCsrcFBmRE13R3ZOU2wv?=
 =?utf-8?B?SHdsQTIrd0gzWkMwcW1keTZXbnJ1VHFWaU40QVNRWWVoRjJlc3pqMVN5LzJq?=
 =?utf-8?B?TXZobjFMenl3Z0ViUmp3L3daRXZZaDFDank4eU1FUnJYWE0wTEZSL3luNWN3?=
 =?utf-8?B?NzhMT2FWSjFPajRpNnRldmFLZndpQVRqVGdyZ3M4MWFnSjQ1N0dWTjIzTUNK?=
 =?utf-8?B?QjV4ZmhjRS8xQXVCOE4xQnprR0dHckdkK0RkYlhFeWtSK2dMSis1Wm5pVFhL?=
 =?utf-8?B?NGFXUlBmMWtNWGF5MytBN0ovYXlwb2owcGhkenR3SkRYWkd5NDdvdVlRRDVV?=
 =?utf-8?B?VjBNWlBXTHFnTjhkSkhBdDVXcmkza3VXN0krVmtQVkpZV2toR2QzbDdrNTEv?=
 =?utf-8?B?MHAvbFlnbDlqcjJReVlJRjRpSWFwSEJNL2lqazBnZC8zUURHaUtnbVNSM3Mx?=
 =?utf-8?B?OUh1cFJKWlF5UlpLc2EvUXppaWIxRmFodGp4cEg0WmQxcTJFbm1OZ1dFTFJ4?=
 =?utf-8?B?aC9ydUdPa1VkaEczUERWRkpERmhkcDZKMHFkeTk0WTFEa1BxeDJSQTl4Zmto?=
 =?utf-8?Q?mKghYNAtMpoGMIhTH0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ceee87-ab26-4fe5-e20e-08d9893ca293
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 02:46:16.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEXEz8Xjbw57aRe5BR7k7R+x6lxrEY9JRn68jL/StOopuuQYNTQJf/FlbV8TYKeHz2xiAT1aq7+mlHYlGlVPsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3066
X-OriginatorOrg: intel.com
Cc: "Yang, Libin" <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, Paul
 Olaru <paul.olaru@oss.nxp.com>, Curtis Malainey <cujomalainey@chromium.org>,
 "Song, Gongjun" <gongjun.song@intel.com>, "Gopal,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgNywgMjAyMSAxOjI1IEFNDQo+IFRvOiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPjsgTHUsIEJyZW50DQo+IDxicmVudC5sdUBpbnRlbC5jb20+OyBhbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IEJhcmQgbGlhbyA8eXVuZy0NCj4gY2h1YW4ubGlhb0Bs
aW51eC5pbnRlbC5jb20+DQo+IENjOiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29t
PjsgTWFyayBCcm93bg0KPiA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFyb3NsYXYgS3lzZWxhIDxw
ZXJleEBwZXJleC5jej47IFRha2FzaGkgSXdhaQ0KPiA8dGl3YWlAc3VzZS5jb20+OyBSb2pld3Nr
aSwgQ2V6YXJ5IDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPjsgSmllIFlhbmcNCj4gPHlhbmcu
amllQGxpbnV4LmludGVsLmNvbT47IEthaSBWZWhtYW5lbg0KPiA8a2FpLnZlaG1hbmVuQGxpbnV4
LmludGVsLmNvbT47IEd1ZW5uYWRpIExpYWtob3ZldHNraQ0KPiA8Z3Vlbm5hZGkubGlha2hvdmV0
c2tpQGxpbnV4LmludGVsLmNvbT47IFpoaSwgWW9uZyA8eW9uZy56aGlAaW50ZWwuY29tPjsNCj4g
R29wYWwsIFZhbXNoaSBLcmlzaG5hIDx2YW1zaGkua3Jpc2huYS5nb3BhbEBpbnRlbC5jb20+OyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgV2FuZywgUmFuZGVyIDxyYW5kZXIud2Fu
Z0BpbnRlbC5jb20+OyBMaWFvLA0KPiBCYXJkIDxiYXJkLmxpYW9AaW50ZWwuY29tPjsgTWFsaWtf
SHN1IDxtYWxpa19oc3VAd2lzdHJvbi5jb3JwLQ0KPiBwYXJ0bmVyLmdvb2dsZS5jb20+OyBZYW5n
LCBMaWJpbiA8bGliaW4ueWFuZ0BpbnRlbC5jb20+OyBDaGFybGVzIEtlZXBheA0KPiA8Y2tlZXBh
eEBvcGVuc291cmNlLmNpcnJ1cy5jb20+OyBQYXVsIE9sYXJ1IDxwYXVsLm9sYXJ1QG9zcy5ueHAu
Y29tPjsNCj4gQ3VydGlzIE1hbGFpbmV5IDxjdWpvbWFsYWluZXlAY2hyb21pdW0ub3JnPjsgQ2hp
YW5nLCBNYWMNCj4gPG1hYy5jaGlhbmdAaW50ZWwuY29tPjsgU29uZywgR29uZ2p1biA8Z29uZ2p1
bi5zb25nQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIEFTb0M6IEludGVs
OiBzb2ZfcnQ1NjgyOiB1c2UgaWRfYWx0IHRvIGVudW1lcmF0ZQ0KPiBydDU2ODJzDQo+IA0KPiAN
Cj4gPj4gQEAgLTE5Niw2ICsyMDEsNyBAQCBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2gNCj4gc25k
X3NvY19hY3BpX2ludGVsX2JheXRyYWlsX21hY2hpbmVzW10gPSB7DQo+ID4+ICAJfSwNCj4gPj4g
IAl7DQo+ID4+ICAJCS5pZCA9ICIxMEVDNTY4MiIsDQo+ID4+ICsJCS5pZF9hbHQgPSAmcnQ1Njgy
c19ocCwNCj4gPj4gIAkJLmRydl9uYW1lID0gInNvZl9ydDU2ODIiLA0KPiA+PiAgCQkuc29mX2Z3
X2ZpbGVuYW1lID0gInNvZi1ieXQucmkiLA0KPiA+PiAgCQkuc29mX3RwbGdfZmlsZW5hbWUgPSAi
c29mLWJ5dC1ydDU2ODIudHBsZyIsDQo+ID4NCj4gPiBTbyB0aGlzIGlzIG9ubHkgdXNlZnVsIGlm
IHRoZXJlIGFjdHVhbGx5IGFyZSBhbnkgQllUIGRldmljZXMgdXNpbmcgdGhlDQo+ICJSVEw1Njgy
Ig0KPiA+IEFDUEkgSElELCB0aGUgMTAwKyBCWVQvQ0hUIERTRFRzIHdoaWNoIEkndmUgZ2F0aGVy
IG92ZXIgdGltZSBzYXkgdGhlcmUNCj4gYXJlbid0IGFueS4NCj4gPg0KPiA+IEFjdHVhbGx5IHRo
ZXJlIGFsc28gYXJlbid0IGFueSB1c2luZyB0aGUgbm9uIGFsdCAiMTBFQzU2ODIiIEFDUEkgSElE
IGVpdGhlci4uLg0KPiA+DQo+ID4gQmFyZCBMaWFvLCB5b3UgYWRkZWQgdGhpcyBpbiBjb21taXQg
ZjcwYWJkNzViN2M2ICgiQVNvQzogSW50ZWw6IGFkZA0KPiA+IHNvZi1ydDU2ODIgbWFjaGluZSBk
cml2ZXIiKSBidXQgSSB3b25kZXIgaG93IHVzZWZ1bCB0aGlzIGlzLiBJIGd1ZXNzIGl0IG1heQ0K
PiBiZSBhdmFpbGFibGUgYXMgKGFuZCB0ZXN0ZWQgb24/KSBzb21lIGRldi1raXQuDQo+ID4NCj4g
PiBCdXQgSSBkb24ndCB0aGluayB0aGVyZSB1cyBhbnkgaGFyZHdhcmUgb3V0IHRoZXJlIGluIHRo
ZSB3aWxkIHVzaW5nIHRoaXMgPw0KPiANCj4gSW4gdGhlIHBhc3Qgd2UgdXNlZCB0aGlzIGNvbmZp
Z3VyYXRpb24gZm9yIFNPRiBDSSB0ZXN0cyB3aXRoIHRoZSBNaW5ub3dCb2FyZA0KPiArIGFuIFJU
NTY4MiBldmFsIGJvYXJkLiBXZSBncmFkdWFsbHkgZnJpZWQgbW9zdCBib2FyZHMgYW5kIG5vIGxv
bmdlciBjaGVjaw0KPiB0aGlzIGNhcGFiaWxpdHkgZm9yIGVhY2ggU09GIFBSLg0KPiANCj4gU28g
SSB3b3VsZCBhZ3JlZSB3ZSBjYW4gYXZvaWQgY2hhbmdpbmcgYW55dGhpbmcgZm9yIEJZVC9DSFQg
YW5kIHBvc3NpYmx5DQo+IEFQTCwgaXQnZCBiZSBhbiB1bnRlc3RlZCBjb25maWd1cmF0aW9uLg0K
PiANCj4gaW4gb3RoZXIgd29yZHMsIGxldCdzIGFkZCB0aGlzIGNvbXBhdGlibGUvYWx0X2lkIGZv
ciBwbGF0Zm9ybXMgd2hlcmUgd2Uga25vdw0KPiBpdCdsbCBiZSB1c2VkLg0KDQpBZ3JlZSB3aXRo
IFBpZXJyZS4gIlJUTDU2ODIiIGlzIGEgbmV3IGNvZGVjIHdoaWNoIGlzIGRpZmZlcmVudCBmcm9t
DQoiMTBFQzU2ODIiIGFuZCBub3QgdGVzdGVkIG9uIG9sZCBwbGF0Zm9ybXMuDQo=
