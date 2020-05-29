Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899D1E7514
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 06:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C1517BD;
	Fri, 29 May 2020 06:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C1517BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590727471;
	bh=6uSzyl/FujswimzxIN3Z141btrScug0AZg8vN6s+vCU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dqpz8Ec45CXAHbJqf5dr2HD/a/PPlnpynTETEYrjhxpQmPGDJ+RMSAPCZ1f/Msvcf
	 PrtnZ2xL6orOmgPrqx85RR/xU4UvEmMMpVtSNUw8lsSxbI5Vz1HRMb0eI1F6d6jPKB
	 82bXRSvy85hJ4BvOayY5PYnG+q5I1nBJYjNE+cIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82FFF80125;
	Fri, 29 May 2020 06:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66689F8014E; Fri, 29 May 2020 06:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D69EF80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 06:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D69EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Lc5khXjb"
IronPort-SDR: Qhf8EIP5Km+lx25YKgIHyZt+TxCxFOiip/KQF4rskXcVIXd2YQMKE82ykdf+41QLYlBX6ButuF
 nOuPxAAbRgJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 21:42:33 -0700
IronPort-SDR: NN5/BGq2p7GB32YgscsDjhVoFX58aI0MphKwK3fGN2x4Z+IwfYsQq5Z2Bf1v0+jqHfT5TUGgqS
 SpNjRbwsA0SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="443239405"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2020 21:42:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 28 May 2020 21:42:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 21:42:32 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 21:42:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 28 May 2020 21:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljIeQlCeN8ZTt70uKSQj4dzjsUIQJwIol8hQmyHF+HUUC2KK9TIIgINZ/NhNTaJtG0lBAod61RQSBSVvowvRBRANylPii+89iVxCOjSjap8mkXAaNFr04J8aMZjFXChT1PYsPdbZjggXLZxX0ULhNgZNIvmLE64iix7L80p6iDqifSQ3BqoPAckxQ8acGXPG5DpA7DRpUCncbPCuEiBB+DueDGBduxQMkYH55CIZyQHmGHDRqOpTvEkwVcXzojQIMQEhGlCCVEau+Ak06583RggVJssdApslOBkicGCZF5CsYHFcC4IERYWdvgFs2BU3SZabeQMr4zEtYpxQoJGwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uSzyl/FujswimzxIN3Z141btrScug0AZg8vN6s+vCU=;
 b=Cmga4S1QwKp4i3Awu7Nyu8PCMamvPqz6Pk2u9BEJeH/SX6GF6ivYBFeheOMg3mT2XuZ3+kt/Y5FBBITPGikfODQYU++7uX5/4B3jKY9QB6c2Z/tmP7uWWNlvFugyWHUGrv3Ilr4621YJIXPFz7g0THDEKkyjd3ujrx+N4/7ux2dmvIGv91mjNgROjD/PYl38zSYz6WRI5IpVzUTzp+fZfud5qPYa0RacxOfgPhkC6t5lvAwq4qRpuo6gIK8uOoICUSA3txH2G0PDz1LzoJ/EF1YWx5H/zrCX8d91PBhu+KdapEXTUKkqtqge95/qopk36oMJeODOUoyG0+2HqNd1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uSzyl/FujswimzxIN3Z141btrScug0AZg8vN6s+vCU=;
 b=Lc5khXjb56bG9i582D78KxnuoJR5Lr6O1wf5MDGdcN5hcIquUNI16C3QVBCRm8u4H0p60nXmULYPVBFGxVwLRWcS9n33ef1BfqLmhETWH97jTf8olEvBSJwndSGMvV0++Cta8alYqA9ILqw1GWefWLUdWvE44KiXdM+71oGORt0=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB4067.namprd11.prod.outlook.com (2603:10b6:405:7e::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 04:42:31 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3021.030; Fri, 29 May
 2020 04:42:31 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Thread-Topic: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Thread-Index: AQHWLTcyFDBbEyDmPE2qYPH90n0OFqi+jDpw
Date: Fri, 29 May 2020 04:42:30 +0000
Message-ID: <BN6PR11MB1953019C643B7D77B5A0D571DA8F0@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-3-git-send-email-jee.heng.sia@intel.com>
 <20200518170933.GB28178@sirena.org.uk>
In-Reply-To: <20200518170933.GB28178@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8406706-cdbc-482a-67ba-08d8038ab2aa
x-ms-traffictypediagnostic: BN6PR11MB4067:
x-microsoft-antispam-prvs: <BN6PR11MB40674D940C8081AC425EE00FDA8F0@BN6PR11MB4067.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hah3Ko6QEoAUJcLEnIRrAFwCk8le7LDr/xpZeRYrnaD6+BYwvou6vkjHKR9aGlWXV+YUNhnoA0zxZb+Y0rjAzq42leW3F/x2k/Z1t6VGA6WAEIEwNChDT+6AqhF/V3D7mt+bV8w8MSj32uKpOssV4kz/4oMwnLk+RObr60knPc2co8JPTpUOcG6iqcs1OZ9XuetVYAW6KRR3qp8WrduBKsJ2YLwZvPyPl/wwS+KxHXo1+gBAlvNpY8kJNcRKL/TNoHjiGygi+2QZwc2/rf9dmqwOspCKjcDrNH1ZxOVxG3LAvzOTZgQ6GZsbRQVhcz6dL7kiGzxi6auGYwVXq1UWBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(8676002)(8936002)(66946007)(66556008)(478600001)(55016002)(71200400001)(9686003)(6916009)(5660300002)(83380400001)(76116006)(4744005)(52536014)(64756008)(66476007)(86362001)(66446008)(53546011)(4326008)(316002)(26005)(2906002)(6506007)(54906003)(7696005)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zkai9KMWJScH1hnS6POvXBMy+nDprfA20xEcBkVyGvN11sSij9Yb/10GKLxtFaMqMtZh0RJIUPqt+duBpWJgvfnrrTMsGlDLSIxbLkdRnYZT6rsJihe9Q9wN+K6hm3pKLCI8IfhGEqzbPKZJRwvSW9srykAgzI8N95zp40rQAqPyN6Rb4eOTDAdKpkxlPDXuMVk2VEjFdgGA0CkthAyoTq3LYIt9If3W7U2anoI05jwzOEYgfYtmF56G6si6aPIl9KhcFZ2VFi1AUCmgBFzUj1WM6LLMijnRKXyDB7ikr/JJnOjQgKxABGtG4ntpDCn3OXQVG4474eOAP78iD1AKwtSpxKVdYQHEziHuotnOFK0VvpIO7bvPS2r+vemqDYOTG+QvA7RVN5I9u7T+E0nfhbpjHFuisogKhyCs5Enn4PeFVFqDWYQA/kwi+eJYuiRQPIe6QEQZ/4xxLpci3Et+tADMRllJWIXkOr9TRw6ZjyO4FinSVtNUgCNho+DbWmEg
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8406706-cdbc-482a-67ba-08d8038ab2aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 04:42:30.9178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76IpHHjXWUs8EMDzbB7zk/1cKcRocbvPKPt1gTCS94vh4f/g2aEIzAsg6FbYC6Nm1bBZ/tTpf6xwE4zSkQkMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4067
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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

Shall move on with the graph card and shall submit the changes.

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Tuesday, May 19, 2020 1:10 AM
To: Sia, Jee Heng <jee.heng.sia@intel.com>
Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-louis.bossart@linux=
.intel.com; liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver

On Mon, May 18, 2020 at 10:17:20AM +0800, Sia Jee Heng wrote:
> Add KeemBay machine driver which glues the tlv320aic3204 codec driver=20
> and kmb_platform driver to form the asoc sound driver.

Why do you need a custom machine driver for this, as this is a DT based pla=
tform and I'm not seeing anything complex or unusual in the code you should=
 be able to use audio-graph-card (or simple-card but the former is more mod=
ern and should be preferred for new systems).

If this is required the DT binding should be documented.
