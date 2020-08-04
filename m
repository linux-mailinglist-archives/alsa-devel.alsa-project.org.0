Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12A623B8CF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 12:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539191667;
	Tue,  4 Aug 2020 12:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539191667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596537223;
	bh=4jbTXvVDYCBDDwNTnlR3kas1tA8QLBYvv80WuVgBB2s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qn7ZwD4o3oMol3YiRcWwDlbjZ9mdK4wet3+tVITeHU9yHKg8dCAMib9m58toQj4KS
	 At/7YWJRV1abnmYT521qskSPt/ibyHkZX9ECeWB2gdZ6SrzxWAy6kwPUuHvXtz3H8U
	 /EmskLwmS8Gv2xynoCB75DkNbSgCA+oVek37d7vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85233F80148;
	Tue,  4 Aug 2020 12:32:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED82F80150; Tue,  4 Aug 2020 12:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3D3F80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 12:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3D3F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="sP/StImr"
IronPort-SDR: Y3n3bGKBcIuoERIiVpw+GQ/RY/Ev7RuCYQPAkm698ypHzO/0uUGeoS6ahhzarJG45fqSYLducf
 d6U/eX4rsQHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="170370965"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="170370965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 03:31:45 -0700
IronPort-SDR: tn0lMplOt1Kxb+yDUcp0oynleNE62LB3D0l89E3pcBCDK0ZAHG7JDYG9EihU2+fmbxg+v4U7oK
 d/bM2M2lddeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="275759962"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 04 Aug 2020 03:31:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Aug 2020 03:31:45 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 4 Aug 2020 03:31:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 4 Aug 2020 03:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPZ+Z7KMbmcqfbGbdBs7+6bJbEaF/brX3cCbE0rnZ89zYUTW4M0/xTqCodW1/xoj/awMYN0dGZDlk7KPwsTt1uKxWAL1mYcUoWPfb4JgYdxM1bcSUyGG7zPWT+SlAU+x2dz06BXTaFnXMFYDMqJVJxaQRQIsUS7vLtdgsvkdoU9vWW3B0sX5rNavVkq11OJ/1mjEUVCk+0kKU8BeYbYVSuPUbRARKyWgcFjUxFJGM5c0GrUvDFakTLrkHXcZywclwv5FOsyM6cLKhU/NamuxmP2seQq1XQqZvIERLC+LEMgX8TD2mniniK8YZJ8syCoD9sTf914uJPTsInk14v47Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMi6BPKnQopNR5+Z844FyEgNTNIe3LL63/EABGWaAlI=;
 b=isjtORLyF1UF15YckKtaa1sZCcAEMoCaQPf9g+f4KELy9yYivaJA5PEk7VGS1P73ZEZWq/9NrSD1Nmst+TAVAcRM0FOooiBcenAt4+6772UDebFiNOkOLTyXTSOqnww/aiz5e48x1gELdLJxjCA2zngv2B6lLlRkOxKGxT6aDKI0maWOVcOAe4c0jgls+4aITBrWuD+Ol4URUcW/jwuxxA9vBKRC/puyWIsKAOZtiAH7Jolil48aJtAeAHQrgTSozrJqVEqDZjdrLXIrCHG/O7cmuFie19qdqMSfFm8dB8MVqZc9Vd41zf5sOQCVxryxgXRGgvm7xsoq7zpmfQL4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMi6BPKnQopNR5+Z844FyEgNTNIe3LL63/EABGWaAlI=;
 b=sP/StImrWgqO3xBlEcgYzSDGGU4tiXleb5tAT7TaMW3lOAeJQoNQf8AA3R0n/W5ryI8/QX10VVcM9UHQm3iyhkim5MyNqwc8QWC91PF4fpxuZJmTSUsGqsbnAHeUurvCSWqQ2HQzIExzuiTCGQUCMx/C/tr3pFqLzXN1RgNXMnw=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 10:31:40 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 10:31:40 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Dan Murphy <dmurphy@ti.com>
Subject: RE: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Topic: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Index: AQHWZXvDcvGwDy8t9k+SLydfK9jkJakefUMAgAEgZvCAAHK9gIAFljHggAIh9HA=
Date: Tue, 4 Aug 2020 10:31:40 +0000
Message-ID: <BYAPR11MB30465175B001D5B9B6D123889D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
 <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
 <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
 <BYAPR11MB30468CC46295BBA5BEF0FB0C9D710@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200730123353.GC5055@sirena.org.uk>
 <BYAPR11MB3046A6AB5E7E1A2E2795DD329D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3046A6AB5E7E1A2E2795DD329D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9696aff8-e293-4414-b32c-08d83861933b
x-ms-traffictypediagnostic: BY5PR11MB3992:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB39921B9FB8DCF694B73AE9C39D4A0@BY5PR11MB3992.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHFHOBcfD3Cg0B5SNIli5Pgz7DUERQbTuMWu3IEzs4xQLbuPZsrLbnzmB2Ua9esKgIHGoR6YVGygL7tmZyXDviNmP+KbcUMSH2ZMF8B2xqbZmk286U2dMo+6wGiFsPnKWFq6pkJeE8cWe+J5Fpkpiz5KfKInSp5rqcbpHOliOhpEJt7RogvHkfJRd/+tVe7K+00sUuL/8LL6e6AFvo3GErsZJBD6nO4HTBsrcTy8qCl/HG0RADeDUvPY5xgAuOW3PVm8zHp0oabGqYMykSIyjtpedeW7CH1fELjMngbxQjLh2VEJWSTjbaZySNQcnafgDI+t5jDfTRdHmqWdqu85uDgAzc1eBmgqO+X70AEfv5N9C4jAnSdyGf6mmiUjh8SJ6DEzzMVF+oJ02ZgFPvwyQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(6916009)(66556008)(8676002)(64756008)(66476007)(66446008)(66946007)(54906003)(186003)(52536014)(33656002)(76116006)(83380400001)(71200400001)(6506007)(53546011)(316002)(4326008)(478600001)(7696005)(2906002)(55016002)(86362001)(5660300002)(966005)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0PbXWx8QWiX/GYhABXQGX15gt8cPSKlZabBZnVbHw1H0zag7Oa4bCPakXRdYTQuLrN347eX5cRuPjfdkc/t0U1mQAx0/2pby9CVmO+giRSahwxScm+0DVIpI7A64uvVkIQi3rc6he1ReFWrQbo7iWI92YukTrXKJf9di3B92uLDyTi6Uffy9YBcriOq3J4txcn12I/3vWHroPyETwpFLHKUZ/3XImJqB7uG9TYUo0mM9cbIzZAvj2/Np+QQsDOwjAMSX5nYtep3DhPq6ro0IEuDWJEm77NzrQ5Zt4drBQjwOV5WY6lZridQnoKntRFj/szOBK+ybvkq2XKQ0kuIwr22X4MxsoSFghGWXFLb6HtEn3mVNLrjHzXA7QjoQQgdgoJQKqnn2CpRaBcgG31uZ8JFiCmXgPblhUWh83Y4f4uoAojw7Yk0gVrZffKSZMp7O/Zlg3gMl3pqdgkWj8D+pSb1b41WG6hu1xcDgzwRJt5iquPBvrPZQn94oo5X4m5OGpmaamnwJFqkQ7H65NDccsQ9QKPuTzL+HZMljbXN3XvXtVQLy44fpvWYNwVLbLOtVKs05bZKKkQ35XNhVsRBn3JejK7bLrJQfIjwqfRhVIluy4fJEFN/VFt9K+rAeR+LUlbhns12OfG1K4y3fTWB96g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9696aff8-e293-4414-b32c-08d83861933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 10:31:40.4832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pppPiYFA9yS3e8SGhe5tG7wvJC9lr4W+ISL/98aRABZpTBefAZEvpBhYbLQupFwtzN80PUCs+g9nJHBUD4zLXEL3SsM5sbQaNAPV1DDGu08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "a-estrada@ti.com" <a-estrada@ti.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "zakkaye@ti.com" <zakkaye@ti.com>
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
> From: Sit, Michael Wei Hong
> Sent: Monday, 3 August, 2020 9:54 AM
> To: Dan Murphy <dmurphy@ti.com>
> Cc: Mark Brown <broonie@kernel.org>; alsa-devel@alsa-
> project.org; tiwai@suse.com; pierre-louis.bossart@linux.intel.com;
> Rojewski, Cezary <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>; a-estrada@ti.com;
> zakkaye@ti.com
> Subject: RE: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset
> and add ADC reset
> >
> > On 7/29/20 2:32 AM, Michael Sit Wei Hong wrote:
> > > Moving GPIO reset to a later stage and before clock registration
> to
> > > ensure that the host system and codec clocks are in sync. If the
> > > host register clock values prior to gpio reset, the last configured
> > > codec clock is registered to the host. The codec then gets gpio
> > > resetted setting the codec clocks to their default value, causing a
> mismatch.
> > > Host system will skip clock setting thinking the codec clocks are
> > > already at the requested rate.
> > >
> > > ADC reset is added to ensure the next audio capture does not
> have
> > > undesired artifacts. It is probably related to the original code
> > > where the probe function resets the ADC prior to 1st record.
> > >
> > > Signed-off-by: Michael Sit Wei Hong
> <michael.wei.hong.sit@intel.com>
> > > Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> > > Reviewed-by: Pierre-Louis Bossart
> > > <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   sound/soc/codecs/tlv320aic32x4.c | 47
> ++++++++++++++++++++++++-
> > -------
> > >   1 file changed, 35 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/sound/soc/codecs/tlv320aic32x4.c
> > > b/sound/soc/codecs/tlv320aic32x4.c
> > > index 5af438a00f95..37e14558d7c0 100644
> > > --- a/sound/soc/codecs/tlv320aic32x4.c
> > > +++ b/sound/soc/codecs/tlv320aic32x4.c
> > > @@ -50,6 +50,28 @@ struct aic32x4_priv {
> > >   	struct device *dev;
> > >   };
> > >
> > > +static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
> > > +			     struct snd_kcontrol *kcontrol, int event)
> {
> > > +	struct snd_soc_component *component =3D
> > snd_soc_dapm_to_component(w->dapm);
> > > +	u32 adc_reg;
> > > +
> > > +	/*
> > > +	 * Workaround: the datasheet does not mention a required
> > programming
> > > +	 * sequence but experiments show the ADC needs to be
> reset
> > after each
> > > +	 * capture to avoid audible artifacts.
> > > +	 */
> > > +	switch (event) {
> > > +	case SND_SOC_DAPM_POST_PMD:
> > > +		adc_reg =3D snd_soc_component_read32(component,
> > AIC32X4_ADCSETUP);
> >
> > This gives me a build error
> >
> > sound/soc/codecs/tlv320aic32x4.c: In function
> 'aic32x4_reset_adc':
> > sound/soc/codecs/tlv320aic32x4.c:66:13: error: implicit
> declaration of
> > function 'snd_soc_component_read32'; did you mean
> > 'snd_soc_component_read'? [-Werror=3Dimplicit-function-
> declaration]
> >     66 |   adc_reg =3D snd_soc_component_read32(component,
> > AIC32X4_ADCSETUP);
> >        |             ^~~~~~~~~~~~~~~~~~~~~~~~
> >        |             snd_soc_component_read
> >
> > Also you should check the return to make sure it is valid.
> >
> > Dan
> >
>=20
> Hi Dan,
>=20
> This code patch is created based on the kernel version 5.8-rc4.
> The register reading and writing are copied from the function
> aic32x4_component_probe.
> May I know the version of the kernel you are applying the patch on?
>=20
> Thanks,
> Regards,
> Michael

I have tried to build the kernel with the patches applied on
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
for-next branch and also on the linux-next branch from
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Both of them are not throwing errors when I enable the config to build
the codec driver.

Can you double confirm the branch you are building the kernel from?
