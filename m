Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42142489A8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 17:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88AD11757;
	Tue, 18 Aug 2020 17:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88AD11757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597764240;
	bh=ZFoqHK3bSdmMmtUJTRyEJUiZsaYOMfkV2qOfAtvxBnI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9CUus5umo4oOXciiHO/m0KM1XnBrZXObrus+tNRqhd+r585IIX4KdXRdml1B2BsU
	 cLZno40Tx0JxNYMajms7Gnx7Gzak5R5yLizhcVYKiALG0zUpsszJODH7vaADr+xrI2
	 XexF/jPzR7UhKwfvCjJiCcqQ1YBZsFUUKYlKBpCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA402F80114;
	Tue, 18 Aug 2020 17:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C503DF80228; Tue, 18 Aug 2020 17:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72A98F80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 17:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A98F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="RxWVAYZl"
IronPort-SDR: fpphf1QiSQc6Ss4nPiACsH+QwZ5Um/Iq7etXaLpwDzQm5vKZrJyPESGSOaCVN2u9AL8luZQsgX
 GgPIPN1G0Uvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152556653"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="152556653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 08:22:05 -0700
IronPort-SDR: zyfI/9Opn8PvzFCN/QekRL93Ue4l0fD1DdOQztZ2DYEigADmZOY4SS/uMYAL2xtZSCJiYRuS6N
 CDNGCguSI9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="400523726"
Received: from unknown (HELO fmsmsx606.amr.corp.intel.com) ([10.18.84.216])
 by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2020 08:22:05 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Aug 2020 08:22:05 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Aug 2020 08:22:05 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Aug 2020 08:22:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 18 Aug 2020 08:22:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy6QSo5BDcY0LX1Cibpd1+v5KNmUFrC+s6vWkoxkBmg8zSw1f2KuVlstYoT/47S/6FNCX2CFJNQQzUE26jlsB471PezVRMfQ7PqN9ocfX4cowrtjZl1vXCjLi9rLZp+dPRB8GfP2dK+LgcpkMT+AFSpSkAtvRR2me37JVoNPOY8WnP28WxukLDPXwivh/Nu2UHwIF4CRfBccSUyGQRy15GdEAiKiTrYNcXicqWg3RJC1A9KDtxmPq6wggseMP8eV416NPe+ZzaxokxiZkPkv1G4be+xsfEz7M/n/O20DNj7DSmgdSnuP5QJWCeNKaVBicwL/yN/O8iedvnHdJommWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFoqHK3bSdmMmtUJTRyEJUiZsaYOMfkV2qOfAtvxBnI=;
 b=FLl7lHxNudo2P4iJNkLZpewXi7hD0tAOLSqU4Rcw5e/P3kMiImc/G8vMTevAHssJVkiQdu6Rnstu3G9iZaandcHwzz0Nd8Tod2K5NNMQBQqKBFwsBmNANGeUa30CeGsSRG5t43IL+lqKSSMtAARwYICzpvRc7VAUlGWdOyQ5Ta/HKsTs28uH32qfXqmEKu8v8sHF9EHU4LbhkJx4i6OAROgJmvTdQYn01kOgm4Jh4eOrRwbnZq4zTXyQch1lf7wiSnVpikjEG4Mn5lg4NI9mvRFMfhXbptsHdyW27SBJKCMEULlYNYZCRVYnTWuaWx9YMKp/FPeXYvpV3VCDAD6hZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFoqHK3bSdmMmtUJTRyEJUiZsaYOMfkV2qOfAtvxBnI=;
 b=RxWVAYZlPCC3DvEkGmb7TXa9VPORTVpEdNd91U3qWAb6udSTGKIwkr/CBGAyQQceTvih3Gnn+hfq2zGjw0b2jw08GYpwBmNusdGmSXFSXtXBRTl8BE2UFQHRTohYXQLDAUW3nEOovknObdCXheEulywzBULlnFs/OAO7pAKiIU0=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB1643.namprd11.prod.outlook.com (2603:10b6:4:b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Tue, 18 Aug 2020 15:22:04 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::70a3:595c:6217:49c9]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::70a3:595c:6217:49c9%7]) with mapi id 15.20.3305.024; Tue, 18 Aug 2020
 15:22:04 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3] ASoC: hdac_hdmi: support 'ELD' mixer
Thread-Topic: [PATCH v3] ASoC: hdac_hdmi: support 'ELD' mixer
Thread-Index: AQHWdW62iieFuR7I7U6dWD1jz848Vak99kyAgAAFG2A=
Date: Tue, 18 Aug 2020 15:22:03 +0000
Message-ID: <DM6PR11MB36421674C19320503D26DABC975C0@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20200818004413.12852-1-brent.lu@intel.com>
 <20200818143632.16539-1-brent.lu@intel.com>
 <20200818150225.GC5337@sirena.org.uk>
In-Reply-To: <20200818150225.GC5337@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [1.164.110.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d19cdacf-cf2f-47b1-4f2a-08d8438a7630
x-ms-traffictypediagnostic: DM5PR11MB1643:
x-microsoft-antispam-prvs: <DM5PR11MB1643C906598A1931ADF74C0D975C0@DM5PR11MB1643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gx68KaPa27xaXkoxN5EIT8OvJDFxr6tJ/7uKGkVvxTnEEEsOk04z9jUeMg+tPwoO1pvWAZzqyGlB0t4uKPTY2m9MAOgcWFpuCBr+zfmIOJ9H4JhNj91win4rOvYohedE0wPLlzlKved2sswseDmEt62/2idg8LXnZ6L1FGrjdfS8TCXZIjFdf+HHrq7LPHcfoNjzglakihCWRJ+pev6mxqkeSMhqu+0AdrmqAGh6aRxrEnFOy/pKTc0A/QQBdngcFOpK89rY7P0J28aWUoS9wHGatrwbGQVaA+yU7zTaQ7zHyX8pyEWYySC3fB3t3i+2PSJSd34JOq00DY6RdC6tmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(4326008)(478600001)(76116006)(186003)(8676002)(558084003)(8936002)(9686003)(316002)(55016002)(7696005)(54906003)(71200400001)(66946007)(26005)(86362001)(2906002)(6506007)(64756008)(33656002)(6916009)(52536014)(66556008)(66446008)(66476007)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jDbY7EFreWRz/2YpX+L0O7c+LLTFiNw9/Bw8Jk8Wfyjw56fBoqZdHOAuBVhdX39nViJZ93mxI0FXM/MhWEVl8ra36yJb26e5QZjvl/GsvfgVY4ZT2zXy+rNN6DvNZf1EuziNEhgT+Yry8+QI+Q5aOwznxdZ7aVxgz0PWQdUdmOgynaZ5JL5rC7ChF+iw9gKSV0vv7VZQGRLuzj9Fonl17FSLa5AnpKu3c8ff4GtqE4yvprkLP+rWodXFCNwJKAA4x0dCwEwRJJG5uSgVWPKAxES6S7hkFOP7wbMW1JiicBdUA8NOR6rvlro7BucCUR3I4DzOHafQ8Oi0JfXQxP0iFnGjS4T1XV2lGXhDAP52MMaOPae+GB1mSk41i0BaGw7syVSiOtI+j4VOWt53sipeUoxV8um2njZQ5SSb1JPUykv6VlMEGwWb2jKJ5RgmW/YJJ5HpkJgoLhammaioeFnlM4cpZlGfOPpNkNuftlmc9e7sRoCtcQdOGRxBa/3Mjb/afh9ewJKKQswxD9uE/qQS+KPpCdgTXTlpruNZCqEzzAmeAtm3p6lpjZTiHlalB5D6BfNtozKgoOihl7QiWD4VG6mhLNzDQEpqweNK7nH1ZiaUHVQerwSNVYs/5hRziOIB0knnJ7g/1twLf5l7XrKwHQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19cdacf-cf2f-47b1-4f2a-08d8438a7630
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 15:22:03.8741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUuoId8mHgliiJMsIGP3dewUB2HjPTvNVgul5cnfVQgBO+3bgDsl/EIrpWeMe8Bu7cPSNxjxzhdQqkbsEJ8IeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1643
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
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

>=20
> Please don't send new patches in the middle of existing threads, it makes=
 it
> hard to keep track fo what is going on.

Sorry for the problem. Does it mean I should avoid using " --in-reply-to=3D=
" when
sending new patch set?


Regards,
Brent
