Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CCF3128BD
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 02:28:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53559886;
	Mon,  8 Feb 2021 02:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53559886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612747688;
	bh=ShDBKzWZfkDJzcyAPiliNIlugZn73uekySMHd3S0IWM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KouqFX3ITKxMfSzgpTwLTSmTxF4ZrG1z1W7ZRaoW51b0PLAFsmY6sGAMe3ONVzxB1
	 zeXkwuKWG2/TBbYLJ64+bB7njQjYuvgt1Gz/7eeLATsaUBHPO9l5kjNxERi3jj2pRN
	 2Q+8PaAM2EQA0BQ1hTfFEgx54RDJ24v2B0LTG43w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B325DF801EB;
	Mon,  8 Feb 2021 02:26:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 670AFF801D5; Mon,  8 Feb 2021 02:26:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4414CF80129
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 02:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4414CF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="M1kAL5zp"
IronPort-SDR: pru2oCXMKkxQe+9VGfvLgNtftRjZ/A9oA19mjxv9k8xj4v1Xk7ItxxOdXK4o49homKWrzIPXxd
 CKriS9wFw6Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="200697022"
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; d="scan'208";a="200697022"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 17:26:21 -0800
IronPort-SDR: 0rKamGqkmXkMrr2JO72Vb+9FbVKfhCZp4/XsHBJ2U/zKKuY/V1IdE/8Tzsv5wl2jAsIdkcuYjS
 R9Xr85tbQH5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; d="scan'208";a="487049705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2021 17:26:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 17:26:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 7 Feb 2021 17:26:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 7 Feb 2021 17:25:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ0s1XjCyeieodDvbD/HgOvtARVqHJJXOVzT/9vHCLpev8fccu1NGE8DaQjSQk7gVZUxwFGQbbe5vAPTVwpNXYvSsfGQKxz+K+wTqZXzZXZuWZI7waaQ0TnDp/FK9iY0BGS4irBj4dU8T4Po8TRAA2DwiNBPXVHELPqbc0solWhDHzp5BwWZqGIAN3hvZpt2myHLuvYWUuZo0aOl3N6IExw/mAES4rqkGQL+2tJTrTsTFjZvtIic9IQLtgxX2wrBwUtbJpfX0GqK0/+XwUk+kXb6v0EIS4aNUPpBRtzgRI70U+3YcxDRrdYO3xMxVla1QCJ5eoEo3T37/HE5l9vnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4xCvR3V4tvRclOPsC3HI/yZUIHLCxBW6KqJ8UqRAw=;
 b=hWhd30bkjBa0UKMhMhPFImPmNEKWKFIGxxJzpazI4fkXb5IPXIoZNk9pz+gZvHkiV6b5UJ8Sn3VuLAR3a5Jx9TTSh3TGK193ERfpmFhzwJURBgmv4JO0gpLgjKcjoQQIJCRfo2L/Bx1SiuQpQ3DAdNIykFILub4X03Tir60xphn6RjKqvJjrohBuA10lyii6RRB/EBrRw55nJnFYQkKPTEMyg9ZKGweAHZIzvoshc0gLa9wvueYjl3b0SuvK88gpk7Yek6jusEMQaOCMq3IBpWSPm+3lWcwtNpUd/yuIMssPMl6fQhFT24/oP1v4rTrkILaee0jEnB2Ho/xhx8ZTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4xCvR3V4tvRclOPsC3HI/yZUIHLCxBW6KqJ8UqRAw=;
 b=M1kAL5zpXvpTe3QdVEpnfFrLor3luibceny8t2XR5rFMmtx8jnzCDPcDnwC1kBqXmEe4anxmZP3rYL93ldyL70hMzsnK3p+7pRfu8mA/ogC0IDxzWJoZlIkUrEXru+EjeOhO+HaKpz9fHSZhygNCY3/jZv7pr2+qPb55ncL4T5c=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27; Mon, 8 Feb
 2021 01:25:52 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::e1da:cb9f:82bf:132c]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::e1da:cb9f:82bf:132c%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 01:25:52 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
Thread-Topic: [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
Thread-Index: AQHW+pmVuUAZfVY8W0WtEv9moVbgFapJxJuAgAO1zfA=
Date: Mon, 8 Feb 2021 01:25:52 +0000
Message-ID: <SJ0PR11MB50394537BEFC434FEA6C9AB9DA8F9@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
 <20210205163525.GH4720@sirena.org.uk>
In-Reply-To: <20210205163525.GH4720@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 845844a1-19c4-49fa-4ff0-08d8cbd07966
x-ms-traffictypediagnostic: BY5PR11MB4151:
x-microsoft-antispam-prvs: <BY5PR11MB4151BD0016547728E4ABFB87DA8F9@BY5PR11MB4151.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YSTSwo6N3jKxKQEgS7LoQvmJ6VutQjUpfb1l0rW+gDTyo58DVD3Z0C9qCe6tV6yP8HyGVB5UVXk1Jll8s4micizk2dMWm75p0czC2V0lf0Uam4O8HpcAGldXXKv/0sNx5Wmi10x2SxPFk4u2xP3bPu3o+2r8VkfTUwzB+1RkGRKGZl/PN6FokKr7+XDKKNqBk2s4B1/LDyNlIxUgxkBILT9am6ku5eFhMw2BWAUw3/UV91YEJ950LFoBqVGwlCkenSxh1WvqrklTZP/G7xgJe8Xq0P34A7N9Bs545uzGj1yGvTKv4SGboLvX8Yd7gi++yCVjJtF1jY1fLB5y4WyFwwC4PSxaMXHjv9U+SZLjG5wcRTt11VJt2TfnDR+NVyCsldss/WM4t7mpjxz33+6GSWRwmhpFPpHt3DtZcqmSc2ahCrSCLwhX1vKidEXbbLh4Uy3sdgbxtL1TG6KA9xNPKIB3FcYHJL8+yh1I12s8g2IzKQlJU/YoNXxEN8M00VMynE5CWIj55ogZ8WbCQ+nojA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(54906003)(66556008)(66476007)(316002)(66946007)(76116006)(8676002)(8936002)(52536014)(7696005)(66446008)(4326008)(64756008)(86362001)(6916009)(186003)(55016002)(83380400001)(2906002)(33656002)(478600001)(4744005)(9686003)(71200400001)(26005)(53546011)(6506007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6MUt+26pBZfG68eHkjWmRH67oeV/UocnDYwPKaksPIlrxJaMAJN0WtDOlSJo?=
 =?us-ascii?Q?TcjclfCUa9g5Be5iOaXI1MBBnJZVA5a+/iX6vcidHD/VSXT/bzu3HvRLZcKC?=
 =?us-ascii?Q?i32Lb7zF8auLgVc2gym/eDBA929yGBwsLYMIzTlpBvRmJh28oi/2EfOoWcrT?=
 =?us-ascii?Q?AUl+pctxI1ZhZ25efcf/8T/Oktv1NTIYgmlsa+BVuhlIzeKGc/wOglD/Xm8k?=
 =?us-ascii?Q?HCzyxUa+5jlluH7cZpbBrY+J9TrlQ6Qvehj4LoX2vm5lQPeKWkuMv+946XK1?=
 =?us-ascii?Q?huaw9wtlDRadxGs4SIH6S0Kec6ERwo7OWZ/7OBm6HeiVeiNnq3zyXuWPYPct?=
 =?us-ascii?Q?3QkqauXW86VFpJk8RcIjhaP8KB5x3Kko+9Rfln/G7CCvRwSH9SB+Rh38AS6n?=
 =?us-ascii?Q?m2rJadMuXUe3IR0mg176DCUnE0u2QT+G/RbM4I2zOcRXkxQxJJpIYPP6wWAL?=
 =?us-ascii?Q?jO+wV1GRf4QOyWay4w78znVfDTUgCXswa6dINB1M0WPkk3+ywPhbwAI31v/w?=
 =?us-ascii?Q?rHRoeb05rWTZRdjG+MNDa5WadBYM2hyYLs7/KCe2gMG1kQl0bJ+UHy0RQ3Xn?=
 =?us-ascii?Q?U83Tctr5p+9rEUyoWxz3z+mVM6k41MYmQPGn3hivTv/bJvCOrgxe4bL4WE64?=
 =?us-ascii?Q?UXtYgxzGy/ZFzgvxgrKsDVHly9gVMEk9+lNeD2/o0oStbtebpgwQ3ob6RRFx?=
 =?us-ascii?Q?Xvi8ednEfkNZ0f9+19eXGqiFv8D3l0J9UGkxtKZoiemDdCtT65w1B3Rtc1X6?=
 =?us-ascii?Q?2Tr9PD91W4XDd9fczUrvbDFoA4crPZXy+8QPuJha+S7eX376lwymuT7yOhEC?=
 =?us-ascii?Q?dJq7hcJKDLHvQiaByiSRzjxyRR0uUDLWkxkWi5uF5ZlhMcawzmqMbqWinIzh?=
 =?us-ascii?Q?eXjn7Uv6cdW6WaUQTbvZItnKTMOwmeZqLF7fNrvvShULlEYV9ASTMPjDcEBZ?=
 =?us-ascii?Q?3ze7A2pussM3G0z/82K4X2MCJOjK2YUo9c4GeInaGRgNpSS6aZJJ2qV29RHy?=
 =?us-ascii?Q?dmml2rLKtTQ8X7bRXAEph4R2VNTalBoRkrluvUMuWM6BHQTq43j8lAEVvHjA?=
 =?us-ascii?Q?g8Q8PIpVDxLypJdc3h0VIFWS4BUapMVb6yA96KCmIpNnlVnPftMbL9OftGvS?=
 =?us-ascii?Q?rsvcBz+ET6/tqDNDT5XWs29qnL5Z3FVZiwtJOXSizL/piaQ/46hd2oXdcujh?=
 =?us-ascii?Q?kcwq95FOp0uuoLxssd76ejEs3x0aTvS24MaTVZRTEdkTqs0O07TbFi8VUeMz?=
 =?us-ascii?Q?XFs7UmP2kej6BXP0XI82MUIEq0KU/7XhdpTVFAJKxF+AMQ97eaAO2yd5d9xr?=
 =?us-ascii?Q?oQfH3l4D4dV2UDEOsKDbcK6O?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845844a1-19c4-49fa-4ff0-08d8cbd07966
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 01:25:52.1955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlzxjJrbZkE+CTiP1PdLUjY5WhL2hRZR3s84m49N9aYSh1qsxHKwflLI5z/pIjbEU/Narba6yRyOT18iTh2zUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 06 February 2021 12:35 AM
> To: Sia, Jee Heng <jee.heng.sia@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-
> louis.bossart@linux.intel.com
> Subject: Re: [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
>=20
> On Thu, Feb 04, 2021 at 09:42:54AM +0800, Sia Jee Heng wrote:
> > The below patch series are to support Audio over HDMI.
> > The modification in this patch series shall allow I2S driver to
> > playback standard PCM format and IEC958 encoded format to the
> ADV7511
> > HDMI chip.
>=20
> This seems fine - what's the plan for getting the DRM patch merged?  I
> can apply it if that's best for people.
[>>] Hi Mark, if there is no issue to the flows and no concern from the res=
t, I think the changes to the Sound can be merged first. I shall submit the=
 DRM patch to the DRM community later.
