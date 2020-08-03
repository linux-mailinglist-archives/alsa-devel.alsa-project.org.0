Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6296239D54
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 03:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 670FC1667;
	Mon,  3 Aug 2020 03:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 670FC1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596419767;
	bh=2v4lKNURZYmSs+7AxQF7tftGzEtFlEJsZcMLAelM1p0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/0G7+GlVdf/6JYTd9GaMkiiPApX6m0mUe1kYgzcHUctmscd/BZJQ5++dOkeuEyWW
	 pQX74dIp/2HS+f9RQU4CeqwHqWwQVx7SsMupu9Tzxcmm0QnE2f9SgnwekYQpc0iOxe
	 14+YjFW9hWetsMtRnPaGycZM34zpipJTIj+DMH94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F6AF80234;
	Mon,  3 Aug 2020 03:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B683F80218; Mon,  3 Aug 2020 03:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DEFEF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 03:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEFEF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="eylN1pYA"
IronPort-SDR: 7Lr1zpKOEqQg5HhZXCict0OeOY6DUZFQ3Dl7KMlVSZZS2btH0f2rykdd84KRDuXU0cXBB8hxhS
 8zkK1Zeus9/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="216459990"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="216459990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 18:54:12 -0700
IronPort-SDR: WY2zhEBDK9bk+BgpmxUAlI5HJNejnckjSF+dWOI8CLGTokOTJJzz4PwG9nmX2AqWsaJ/6+sMuZ
 DA2f+GS4u5rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="331735584"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 02 Aug 2020 18:54:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Aug 2020 18:54:11 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Aug 2020 18:54:10 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 2 Aug 2020 18:54:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 2 Aug 2020 18:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDMMVvTPr1S9PD+gB+M/dPrJewmZD1G79yTRdqDuCgO3Lb9Po7HcYAcMTY48Q2WgiD+IQWIY5p+Ow5DRC723Kie9A3nB3Lvumz2skpWvcsUW7P6C1UPWmXgXIIULZmPk3dyeEDnIjzMpVpa0rozTTHnd32yMWtujlQjrK2CW0ClPvbU2RHF6kfsbl+n8vfy7nV5Uz6nBxoeMby3a+LF8i8KL+mN6cNOr+KOPiLovZlC12q5CYdo7GLTu3Q3IP75o7LyW0q2YuhFAUyJ9og5aH5Z3rNBlc/GORBQm3rux0WMs0dPjqz0AZxJBmZtRe2UDSt2dIpKRlqCYe2vbgkL+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCLMm6HFa48PKYA8YfVMPTKUa/36SYA34AH27K8yQEI=;
 b=CXdXz2m39vt9iBrMHLInC7WWTIsE47M6AJ96iFWdeUTcrn0nG/j0o2vwRUqntamjwxs7ep0PkGMK864GsiLhh/IYj+ZRfulRDPX97hSwmwIHWPzdTEAXje+c5dBBSTiJG1Fbd6tQow7dFbYRU++iOdioSeJbYt3rKhue27KX5ZzvC3Dwrt0RHAXTmpbF4kYWlEyhVCn0dcuhFaGzjVbB3IejGNx5bXMwkEJrHjhFRg894hgSfi+GtK22Ilodr8zBPp/YDbgrl1gOLv8QXjJD6bazU7Epz1+IJm+MX1/ZiRAn28DRW7RHQlabyPYtgPfA6tGEU87rdpyOa2+IUC74hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCLMm6HFa48PKYA8YfVMPTKUa/36SYA34AH27K8yQEI=;
 b=eylN1pYAHo5YEopfurj6Vx5B/KryCnBlQUS3Dsqc9e7BXrIGtGMLXncPipK/Hnh3KflB916T/JBPVfy4Q97UlmTXWN8NMlOOhQxOk3hzHt5/aarKcGdyEXdLduAsTdaLWOHt7wWGkG39stdm5TvL8V+nZX53FLr7ORk8StB3qeY=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB3925.namprd11.prod.outlook.com (2603:10b6:a03:182::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Mon, 3 Aug
 2020 01:54:07 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 01:54:06 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Dan Murphy <dmurphy@ti.com>
Subject: RE: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Topic: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Index: AQHWZXvDcvGwDy8t9k+SLydfK9jkJakefUMAgAEgZvCAAHK9gIAFljHg
Date: Mon, 3 Aug 2020 01:54:06 +0000
Message-ID: <BYAPR11MB3046A6AB5E7E1A2E2795DD329D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
 <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
 <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
 <BYAPR11MB30468CC46295BBA5BEF0FB0C9D710@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200730123353.GC5055@sirena.org.uk>
In-Reply-To: <20200730123353.GC5055@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4295e5f2-d5af-433b-81cf-08d837501b63
x-ms-traffictypediagnostic: BY5PR11MB3925:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3925364C74EA6E4850285E1D9D4D0@BY5PR11MB3925.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IFW3UE7wiM47+9l15S74yruyKcnitwsSZw+9cnk/m6s2/wBxG+6pV6Tk5sX6G0nHbHG3+wtwZINbbHUJgujNBHwdRUj9hbCOq9ULRYD2ItT5ftK11BAPxAUWvFY4pejrJZx1sQBK94IVPIll4SMBnK03TyIBDh0tq+/DUFh0bYg96VBDwZwTZx0e3SgkQ8H6/5dd4nISJQbvWnRCkm/WWvanQ45FqD8ZBnCYUF7taY7r51KgtaY3u57L3GS/lQSrs8eUfJJK6o4PomM9hooY5JcVt1r5DKEc13TC+58VRRxKIElQhxCKF/eBJUekdKblr1i9w5hvc+5FI/jRzHIw6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(6916009)(71200400001)(86362001)(66446008)(66476007)(64756008)(66946007)(26005)(54906003)(53546011)(6506007)(186003)(55016002)(316002)(5660300002)(76116006)(9686003)(66556008)(7696005)(33656002)(4326008)(478600001)(8936002)(52536014)(8676002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Carji3ulCo2CyzpcVzWa/4hvb6GS6tPhJT5na/K8k8Ul9h7N62jk63jBIBrb5ko4KgB7QR5631u1P5ukP6iVvcvfBtaPW9SVeCK44BQzRvmNFvuusZxMXbGoUq310rBRYPS29/S9b5o9oXFBdy1otQohVVZfCn+ZCZpAf5mKEHPcI08JoHvTM5wa63vmE9EH5sEq4ufuiipjwiGErxSoCMNRm9aAYCa6GwJ4WpcOYiRwsjCCWxK2OnZtSm9BXR+N9eH+UF9ylC8ExJoPxK7u4T1EtqKFAa3vqBxh2u1bJpXYqq7JzaLvkEnV5tWpGoD0qT6DjaU4rwe+w4cNSqW0QLb0zOfaLs8oE5kyd4ALgh08viYo8UdHm4ENO2FUG47p55EsVuvXKg/hj7b1wI8e6ssXL6LlD0xDGpLvHJYxIRNtq/5YPa9fLXoKYpc9JR5oKGGTXBmdoE7ccs9LYLWIuZmF2nYLSMcBJuJHGjM/EvwewnxOqO8MhoVb37bOmT89+4S8IRXBI5E+7gjelesSBOxxpewUreQIJ4C45IMCXIVHqdCOMWWfpxP+pjxV1iUZTKKFTpNHitqmCVm7hQnbLuSo3cqu8bg+Ks5eb2BhR0mVSxVCRbrJVctJ0PPYpihyZIJrZl6qnXs1/CmKYRR01g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4295e5f2-d5af-433b-81cf-08d837501b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 01:54:06.7433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVKyf/353jRWQYERtXMlnq7VBQt55I2bIMY8dwmRyUhgUMasVq5Wr2NhTEiPoXhdNlD+40+ONPANsGYHCJUOPKK0bNy4d/1sMGDrpLGxyB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3925
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, 30 July, 2020 8:34 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: Dan Murphy <dmurphy@ti.com>; alsa-devel@alsa-project.org;
> tiwai@suse.com; pierre-louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com; Sia,
> Jee Heng <jee.heng.sia@intel.com>; a-estrada@ti.com; zakkaye@ti.com
> Subject: Re: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and
> add ADC reset
>=20
> On Thu, Jul 30, 2020 at 05:46:20AM +0000, Sit, Michael Wei Hong wrote:
> > Hi Dan,
> >
> > The code snippet is taken from the aic32x4_component_probe function
> of the driver in 5.8.
> >
> > Could you have a look at that portion and see if it is the same?
>=20
> You need to submit code against the current development branch unless
> it's a bug fix for the current release branch, sometimes interfaces chang=
e
> in the development version (as is the case here).
>=20
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
>=20
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.

> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of Sit,
> Michael Wei Hong
> Sent: Thursday, 30 July, 2020 1:46 PM
> To: Dan Murphy <dmurphy@ti.com>; alsa-devel@alsa-project.org
> Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; a-estrada@ti.com;
> Shevchenko, Andriy <andriy.shevchenko@intel.com>; tiwai@suse.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>; pierre-
> louis.bossart@linux.intel.com; liam.r.girdwood@linux.intel.com;
> broonie@kernel.org; zakkaye@ti.com
> Subject: RE: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and
> add ADC reset
>=20
> Hi Dan,
>=20
> The code snippet is taken from the aic32x4_component_probe function
> of the driver in 5.8.
>=20
> Could you have a look at that portion and see if it is the same?
>=20
> Thanks,
> Regards,
> Michael
>=20
> -----Original Message-----
> From: Dan Murphy <dmurphy@ti.com>
> Sent: Wednesday, 29 July, 2020 8:31 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>; alsa-
> devel@alsa-project.org
> Cc: tiwai@suse.com; broonie@kernel.org; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com; Sia,
> Jee Heng <jee.heng.sia@intel.com>; a-estrada@ti.com; zakkaye@ti.com
> Subject: Re: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and
> add ADC reset
>=20
> Hello
>=20
> On 7/29/20 2:32 AM, Michael Sit Wei Hong wrote:
> > Moving GPIO reset to a later stage and before clock registration to
> > ensure that the host system and codec clocks are in sync. If the host
> > register clock values prior to gpio reset, the last configured codec
> > clock is registered to the host. The codec then gets gpio resetted
> > setting the codec clocks to their default value, causing a mismatch.
> > Host system will skip clock setting thinking the codec clocks are
> > already at the requested rate.
> >
> > ADC reset is added to ensure the next audio capture does not have
> > undesired artifacts. It is probably related to the original code where
> > the probe function resets the ADC prior to 1st record.
> >
> > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> > Reviewed-by: Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>
> > ---
> >   sound/soc/codecs/tlv320aic32x4.c | 47 ++++++++++++++++++++++++-
> -------
> >   1 file changed, 35 insertions(+), 12 deletions(-)
> >
> > diff --git a/sound/soc/codecs/tlv320aic32x4.c
> > b/sound/soc/codecs/tlv320aic32x4.c
> > index 5af438a00f95..37e14558d7c0 100644
> > --- a/sound/soc/codecs/tlv320aic32x4.c
> > +++ b/sound/soc/codecs/tlv320aic32x4.c
> > @@ -50,6 +50,28 @@ struct aic32x4_priv {
> >   	struct device *dev;
> >   };
> >
> > +static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
> > +			     struct snd_kcontrol *kcontrol, int event) {
> > +	struct snd_soc_component *component =3D
> snd_soc_dapm_to_component(w->dapm);
> > +	u32 adc_reg;
> > +
> > +	/*
> > +	 * Workaround: the datasheet does not mention a required
> programming
> > +	 * sequence but experiments show the ADC needs to be reset
> after each
> > +	 * capture to avoid audible artifacts.
> > +	 */
> > +	switch (event) {
> > +	case SND_SOC_DAPM_POST_PMD:
> > +		adc_reg =3D snd_soc_component_read32(component,
> AIC32X4_ADCSETUP);
>=20
> This gives me a build error
>=20
> sound/soc/codecs/tlv320aic32x4.c: In function 'aic32x4_reset_adc':
> sound/soc/codecs/tlv320aic32x4.c:66:13: error: implicit declaration of
> function 'snd_soc_component_read32'; did you mean
> 'snd_soc_component_read'? [-Werror=3Dimplicit-function-declaration]
>     66 |   adc_reg =3D snd_soc_component_read32(component,
> AIC32X4_ADCSETUP);
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~
>        |             snd_soc_component_read
>=20
> Also you should check the return to make sure it is valid.
>=20
> Dan
>=20

Hi Dan,

This code patch is created based on the kernel version 5.8-rc4.
The register reading and writing are copied from the function aic32x4_compo=
nent_probe.
May I know the version of the kernel you are applying the patch on?

Thanks,
Regards,
Michael
