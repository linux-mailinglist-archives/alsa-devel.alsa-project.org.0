Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18817243DEB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 19:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF681669;
	Thu, 13 Aug 2020 19:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF681669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597338189;
	bh=0RF3O5swyuTYi+XFxCtz9GEkWJtFc+FDhPh47SV7Ops=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwXTqiyEJtCUd91BoPhxt9J+sVZiFyDTaK8pnhbDiEP7PhrsD1vSFHgp3okck7lZg
	 o28wDRDf6R6xa0ah9MupcEWsEsBahs2PZHiXW5SLgQgaZDRRzZczUW9C3H++Mf354N
	 vQ/hc9AczZM3qx5692bn0JKcwhX5Re+c05xoyHjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A65EEF8015B;
	Thu, 13 Aug 2020 19:01:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB0D6F8015B; Thu, 13 Aug 2020 19:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6D95F80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D95F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="IcEIiyFb"
IronPort-SDR: 624aMbYySWdgyChDWT2VfqqvCtyKvx9T5RGKxR/dfv1gCG3QfxxEdhrHn6G0KF7NXsI9Vd+6D1
 kDIsa332RO5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="133798446"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="133798446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:01:08 -0700
IronPort-SDR: wproYbRQM4JPWHwhYf54mR/XM0gK90QxO320wX8qaZZgeXEIMwOlK+jWNqzud8ihR45vvAqoa3
 8m+29asngjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495925048"
Received: from fmsmsx601-2.cps.intel.com (HELO fmsmsx601.amr.corp.intel.com)
 ([10.18.84.211])
 by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2020 10:01:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 10:01:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 10:01:07 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 10:01:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 13 Aug 2020 10:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4n49On0gtxmhcoWh3aOtDWkSxo4SLacCrUu4Q2V+JbdThTJfFnuo1NmH9gibU2lPYyyfCtUuqffpFQTLWTJ/gVVV0FinWab0xSIZAxwUoEVz/KXE6NmPEaTARvdHrEoOJX0nFRXXKcxtpyCfXgaYP9+EwR4Yak76CTVGDkIWODKAIjs9r9Z6jdGYjKQgYkeslhPbWSxE8ydLeS7/XQ3iLYmg4LqYe1VVB6kopE8ecxM5zneamKTOzsOfp6AsE/Fh+weQWosip/hrBtg/exp4bMOF1jMq8+XbwKfFpMCJzzVSy3+uu5wTKykIHbi5AKIi73BOuEUwij4cwC50/sZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj72aCWVVEWeaPGYxAv3rUfqTDIKYX6HjI0XXaIbyso=;
 b=hzezZkp/mhbHYfDPvyQx+Ef6hVRgF1m4tMU7n40Oj6TmE+AXzEQshrGjVH0ZmYXxZJxWhefsRi7s9juvtPXcozfK6WI1appiTNhfqPDZymsX5u7x+KUDMqPjczUDquWepbwefHIBiQ32ku48dxJQi97KLIUiwLY4hCp92GGSsje8QbJiY7g41ueW4O0m6ezJxI+Pz5RoRkFX3PLRH231j/+Pb0mMeH1ZnpdquPtqN+ZiI8L4+l/PKk0NLGdeptxwdVIYGgS/NLG11y//Yoo71mSbEbhAw1SiCHDS8gBLu7Zo3KKaFLL3qPcYYqjiE9vH89wlkI0U/fXQVYTS1hwgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj72aCWVVEWeaPGYxAv3rUfqTDIKYX6HjI0XXaIbyso=;
 b=IcEIiyFbqBZKwZrFdes1O9yHeebk3XLnJrIjuUh3RA3sNHCxqciv3AAEKYgtLe9/Ri35uDx5qf0JXubxM8yRCE4PZZ2CGX/cLhqLFs0cX6rk76fUV2hh5/SlVRWBQxAnrYE2MBaEAUjg2OO7VBuHbvxPgZI+BgshUxpPEGRMiqI=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BY5PR11MB4225.namprd11.prod.outlook.com (2603:10b6:a03:1ba::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 17:01:05 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::98fb:1978:c0aa:80a3]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::98fb:1978:c0aa:80a3%5]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 17:01:04 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: "Lu, Brent" <brent.lu@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Topic: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Index: AQHWZpabwQv8AEaOYUq8HJOMkq6/wqkgdJmAgAARpZCAFdJwEA==
Date: Thu, 13 Aug 2020 17:01:04 +0000
Message-ID: <BY5PR11MB430736D232537326CAD2E7BEFD430@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
 <DM6PR11MB364221D6C03B4565C75346AB97710@DM6PR11MB3642.namprd11.prod.outlook.com>
 <BY5PR11MB43073C41A8A66BF96FC38F0EFD710@BY5PR11MB4307.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB43073C41A8A66BF96FC38F0EFD710@BY5PR11MB4307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4d8cb8-4f20-40e1-5d09-08d83faa7714
x-ms-traffictypediagnostic: BY5PR11MB4225:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4225CB622F50DDE5D3255048FD430@BY5PR11MB4225.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:49;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 68nhOjHmGP3ND5MqsBd5MLbHqjkd14ZxUkLJCIMyADILCJS4bkNvNXDP2qmcit2Z+HBJGA55D+heaCQz+oLmET+ApsoV4G0nrZx99MENBku59iHgP43gmaNZ1BbOW1vIYzMOVuv5F8sSvduEfJOCKb3LqG5JwTdNFGBcvE6HI1SrU90V+KJBue5cg8LULNQPV9VLwbtP4z+CikWVNwIPLIqYJg/WNYW45YP5smunqzFAwJOkDKKYhKGJ4vvLku7tBY6y1b1bZA23uW4JO61gDS7hhnSttYvZigN5NGHanCyeclHnjh0aIWRh+b+cKVDiqp4GsGimZPZ7VajEgx/3w+ef1N01Y40g/9La3uYT3jbWsyQ/678uqf6gkmI4oXGJOiUMowcq/K/eF3c643zaQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(83380400001)(52536014)(9686003)(316002)(55016002)(33656002)(966005)(4326008)(478600001)(7696005)(30864003)(86362001)(110136005)(26005)(66446008)(64756008)(66946007)(5660300002)(76116006)(2906002)(66556008)(66476007)(8936002)(71200400001)(186003)(8676002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /Otac22F3lOXX7ySKbV0Shp2xirlYDQmPZn4FMTIOWTnxEkBwBBzNBBKWaPKdx/aPiEj0Ur0tzE3y1zCxrrW+ksd2XBciSTTl7o/+Aza1jOykA0M+lS+2HUkHWz1Y9NGPvkspnyF+oqbPIZL/51aOMgMGuQHMe6ygUJUcqVVNq1oDXJqgD3KMJAJpcdueBR+6xQY9FdSOo6nJNsgLQl04WUUhgPlzsejfnF+jSMXOapu2lsEojBoQ/4BBlT6Z8lxnObkFHC/ChqdLTm8KD7ptcxVdz2AMrDAS8+hyS5RmXcdsi1mmrWQr7HdLl7/6UPFgUlxJqh2J4KewvMSh6eugb1QnW0jno63B3jwjhMp2C3yYKJAIzzex0iCkyhRPJiC8veZzp0EJtRwyGnFCuBmVIbwGkEOhbh697qtFt8dg1tsqDZHgwz+6tvYqm1wrJqJ8Jga6iw7cOHH1ZFDHiL6R90KRJLzvDmJxq+A2V2Q0V1xT8LTJwS37AYqGcEENAasVDidYCcZQU0U6QZ8loE0wpTzjMrG9Ite4ONC9wrAqB0o5nI/ZeivGDa3cnEkwaXfvuGVup7d86zzz7QNhh5NDEjh7YHOupHMNykmxYYyrvFDe98z2nsYkL3ZdaSf+b9LR1KfAnXtt7ls8fNTh3zKzg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4d8cb8-4f20-40e1-5d09-08d83faa7714
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 17:01:04.6649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcFwZbjexNTpmN+bas2kIerSpiommM+anJ0izgd08IG8L2VRFgOgQF8AGWUiZa9LeQgv4+tiGC+jyFg4YgPZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4225
X-OriginatorOrg: intel.com
Cc: "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

Abandoning this patch as it some clock changes that is already fixed in Bre=
nt's older patch
(handled it in a different way).=20
Will make a separate patch for other fixes once the complete solution is re=
ady.

>=20
> >> > >
> > > This patch adds a dapm route to provide early mclk/sclk for for DMIC
> > > on
> > > SSP0(rt5514) and Headset on SSP1(rt5663).
> > >
> > > The sclk rate for both codecs is different which is taken care of in
> > > the platform_clock_control().The platform has one mclk and one sclk.
> > > Two variables sclk0 and sclk1 are used for the two codecs on
> > > differnet ssp that use different clock rate.
> > >
> > > This change ensures the DMIC PCM port will return valid data
> > >
> > > Signed-off-by: Brent Lu <brent.lu@intel.com>
> > > Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> > > Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> > Hi Harsha,
> >
> > Isn't it working? I tested it on a eve before upstreaming. Thanks.
> >
> > commit 15747a80207585fe942416025540c0ff34e2aef8
> > Author: Brent Lu <brent.lu@intel.com>
> > Date:   Fri Oct 25 17:11:31 2019 +0800
> >
> >     ASoC: eve: implement set_bias_level function for rt5514
> >
> >     The first DMIC capture always fail (zero sequence data from PCM por=
t)
> >     after using DSP hotwording function (i.e. Google assistant).
> >
> >     This rt5514 codec requires to control mclk directly in the set_bias=
_level
> >     function. Implement this function in machine driver to control the
> >     ssp1_mclk clock explicitly could fix this issue.
> >
> >     Signed-off-by: Brent Lu <brent.lu@intel.com>
> >     Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel=
.com>
> >     Link: https://lore.kernel.org/r/1571994691-20199-1-git-send-email-
> > brent.lu@intel.com
> >     Signed-off-by: Mark Brown <broonie@kernel.org>
> Your patch is necessary and is being used.
> But we found few issues during kernel uprev where we need this current pa=
tch
> also to get it working
> >
> > Regards,
> > Brent
> >
> > > ---
> > > v1 -> v2:
> > > - Only one mclk with same rate is used, so changed to using one
> > > variable
> > > - dropping ssp_ prefix from sclk variable names to make them sound ri=
ght.
> > > - removing a return statment that was not required
> > > - fixed commit message accordingly
> > >
> > >  .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 146
> > > ++++++++++++++-------
> > >  1 file changed, 97 insertions(+), 49 deletions(-)
> > >
> > > diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > index b34cf6c..155f2b4 100644
> > > --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > @@ -54,7 +54,8 @@ struct kbl_codec_private {
> > >  	struct list_head hdmi_pcm_list;
> > >  	struct snd_soc_jack kabylake_hdmi[2];
> > >  	struct clk *mclk;
> > > -	struct clk *sclk;
> > > +	struct clk *sclk0;
> > > +	struct clk *sclk1;
> > >  };
> > >
> > >  enum {
> > > @@ -77,13 +78,29 @@ static const struct snd_kcontrol_new
> > > kabylake_controls[] =3D {  };
> > >
> > >  static int platform_clock_control(struct snd_soc_dapm_widget *w,
> > > -			struct snd_kcontrol *k, int  event)
> > > +			struct snd_kcontrol *k, int event, int ssp_num)
> > >  {
> > >  	struct snd_soc_dapm_context *dapm =3D w->dapm;
> > >  	struct snd_soc_card *card =3D dapm->card;
> > >  	struct kbl_codec_private *priv =3D snd_soc_card_get_drvdata(card);
> > > +	struct clk *sclk;
> > > +	unsigned long sclk_rate;
> > >  	int ret =3D 0;
> > >
> > > +	switch (ssp_num) {
> > > +	case 0:
> > > +		sclk =3D priv->sclk0;
> > > +		sclk_rate =3D 6144000;
> > > +		break;
> > > +	case 1:
> > > +		sclk =3D priv->sclk1;
> > > +		sclk_rate =3D 3072000;
> > > +		break;
> > > +	default:
> > > +		dev_err(card->dev, "Invalid ssp_num %d\n", ssp_num);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	/*
> > >  	 * MCLK/SCLK need to be ON early for a successful synchronization o=
f
> > >  	 * codec internal clock. And the clocks are turned off during @@ -
> > > 91,38 +108,48 @@ static int platform_clock_control(struct
> > > snd_soc_dapm_widget *w,
> > >  	 */
> > >  	switch (event) {
> > >  	case SND_SOC_DAPM_PRE_PMU:
> > > -		/* Enable MCLK */
> > >  		ret =3D clk_set_rate(priv->mclk, 24000000);
> > >  		if (ret < 0) {
> > > -			dev_err(card->dev, "Can't set rate for mclk, err:
> > > %d\n",
> > > -				ret);
> > > -			return ret;
> > > +			dev_err(card->dev, "Can't set rate for mclk for ssp%d,
> > > err: %d\n",
> > > +				ssp_num, ret);
> > > +				return ret;
> > >  		}
> > >
> > > -		ret =3D clk_prepare_enable(priv->mclk);
> > > -		if (ret < 0) {
> > > -			dev_err(card->dev, "Can't enable mclk, err: %d\n",
> > > ret);
> > > -			return ret;
> > > +		if (!__clk_is_enabled(priv->mclk)) {
> > > +			/* Enable MCLK */
> > > +			ret =3D clk_prepare_enable(priv->mclk);
> > > +			if (ret < 0) {
> > > +				dev_err(card->dev, "Can't enable mclk for
> > > ssp%d, err: %d\n",
> > > +					ssp_num, ret);
> > > +				return ret;
> > > +			}
> > >  		}
> > >
> > > -		/* Enable SCLK */
> > > -		ret =3D clk_set_rate(priv->sclk, 3072000);
> > > +		ret =3D clk_set_rate(sclk, sclk_rate);
> > >  		if (ret < 0) {
> > > -			dev_err(card->dev, "Can't set rate for sclk, err:
> > > %d\n",
> > > -				ret);
> > > +			dev_err(card->dev, "Can't set rate for sclk for ssp%d,
> > > err: %d\n",
> > > +				ssp_num, ret);
> > >  			clk_disable_unprepare(priv->mclk);
> > >  			return ret;
> > >  		}
> > >
> > > -		ret =3D clk_prepare_enable(priv->sclk);
> > > -		if (ret < 0) {
> > > -			dev_err(card->dev, "Can't enable sclk, err: %d\n",
> > > ret);
> > > -			clk_disable_unprepare(priv->mclk);
> > > +		if (!__clk_is_enabled(sclk)) {
> > > +			/* Enable SCLK */
> > > +			ret =3D clk_prepare_enable(sclk);
> > > +			if (ret < 0) {
> > > +				dev_err(card->dev, "Can't enable sclk for
> > > ssp%d, err: %d\n",
> > > +					ssp_num, ret);
> > > +				clk_disable_unprepare(priv->mclk);
> > > +				return ret;
> > > +			}
> > >  		}
> > >  		break;
> > >  	case SND_SOC_DAPM_POST_PMD:
> > > -		clk_disable_unprepare(priv->mclk);
> > > -		clk_disable_unprepare(priv->sclk);
> > > +		if (__clk_is_enabled(priv->mclk))
> > > +			clk_disable_unprepare(priv->mclk);
> > > +
> > > +		if (__clk_is_enabled(sclk))
> > > +			clk_disable_unprepare(sclk);
> > >  		break;
> > >  	default:
> > >  		return 0;
> > > @@ -131,6 +158,18 @@ static int platform_clock_control(struct
> > > snd_soc_dapm_widget *w,
> > >  	return 0;
> > >  }
> > >
> > > +static int platform_clock_control_ssp0(struct snd_soc_dapm_widget *w=
,
> > > +			struct snd_kcontrol *k, int event) {
> > > +	return platform_clock_control(w, k, event, 0); }
> > > +
> > > +static int platform_clock_control_ssp1(struct snd_soc_dapm_widget *w=
,
> > > +			struct snd_kcontrol *k, int event) {
> > > +	return platform_clock_control(w, k, event, 1); }
> > > +
> > >  static const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
> > >  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> > >  	SND_SOC_DAPM_MIC("Headset Mic", NULL), @@ -139,15 +178,17
> > @@ static
> > > const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
> > >  	SND_SOC_DAPM_MIC("DMIC", NULL),
> > >  	SND_SOC_DAPM_SPK("HDMI1", NULL),
> > >  	SND_SOC_DAPM_SPK("HDMI2", NULL),
> > > -	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
> > > -			platform_clock_control, SND_SOC_DAPM_PRE_PMU
> > > |
> > > +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP0", SND_SOC_NOPM,
> > > 0, 0,
> > > +			platform_clock_control_ssp0,
> > > SND_SOC_DAPM_PRE_PMU |
> > > +			SND_SOC_DAPM_POST_PMD),
> > > +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP1", SND_SOC_NOPM,
> > > 0, 0,
> > > +			platform_clock_control_ssp1,
> > > SND_SOC_DAPM_PRE_PMU |
> > >  			SND_SOC_DAPM_POST_PMD),
> > > -
> > >  };
> > >
> > >  static const struct snd_soc_dapm_route kabylake_map[] =3D {
> > >  	/* Headphones */
> > > -	{ "Headphone Jack", NULL, "Platform Clock" },
> > > +	{ "Headphone Jack", NULL, "Platform Clock SSP1" },
> > >  	{ "Headphone Jack", NULL, "HPOL" },
> > >  	{ "Headphone Jack", NULL, "HPOR" },
> > >
> > > @@ -156,7 +197,7 @@ static const struct snd_soc_dapm_route
> > > kabylake_map[] =3D {
> > >  	{ "Right Spk", NULL, "Right BE_OUT" },
> > >
> > >  	/* other jacks */
> > > -	{ "Headset Mic", NULL, "Platform Clock" },
> > > +	{ "Headset Mic", NULL, "Platform Clock SSP1" },
> > >  	{ "IN1P", NULL, "Headset Mic" },
> > >  	{ "IN1N", NULL, "Headset Mic" },
> > >
> > > @@ -180,6 +221,7 @@ static const struct snd_soc_dapm_route
> > > kabylake_map[] =3D {
> > >  	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
> > >
> > >  	/* DMIC */
> > > +	{ "DMIC", NULL, "Platform Clock SSP0" },
> > >  	{ "DMIC1L", NULL, "DMIC" },
> > >  	{ "DMIC1R", NULL, "DMIC" },
> > >  	{ "DMIC2L", NULL, "DMIC" },
> > > @@ -666,7 +708,7 @@ static int kabylake_set_bias_level(struct
> > > snd_soc_card *card,
> > >  	if (!component || strcmp(component->name, RT5514_DEV_NAME))
> > >  		return 0;
> > >
> > > -	if (IS_ERR(priv->mclk))
> > > +	if (IS_ERR(priv->mclk0))
> > >  		return 0;
> > >
> > >  	/*
> > > @@ -757,6 +799,28 @@ static struct snd_soc_card kabylake_audio_card =
=3D
> {
> > >  	.late_probe =3D kabylake_card_late_probe,  };
> > >
> > > +static int kabylake_audio_clk_get(struct device *dev, const char *id=
,
> > > +	struct clk **clk)
> > > +{
> > > +	int ret =3D 0;
> > > +
> > > +	if (!clk)
> > > +		return -EINVAL;
> > > +
> > > +	*clk =3D devm_clk_get(dev, id);
> > > +	if (IS_ERR(*clk)) {
> > > +		ret =3D PTR_ERR(*clk);
> > > +		if (ret =3D=3D -ENOENT) {
> > > +			dev_info(dev, "Failed to get %s, defer probe\n", id);
> > > +			return -EPROBE_DEFER;
> > > +		}
> > > +
> > > +		dev_err(dev, "Failed to get %s with err:%d\n", id, ret);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static int kabylake_audio_probe(struct platform_device *pdev)  {
> > >  	struct kbl_codec_private *ctx;
> > > @@ -777,33 +841,17 @@ static int kabylake_audio_probe(struct
> > > platform_device *pdev)
> > >  		dmic_constraints =3D mach->mach_params.dmic_num =3D=3D 2 ?
> > >  			&constraints_dmic_2ch :
> > > &constraints_dmic_channels;
> > >
> > > -	ctx->mclk =3D devm_clk_get(&pdev->dev, "ssp1_mclk");
> > > -	if (IS_ERR(ctx->mclk)) {
> > > -		ret =3D PTR_ERR(ctx->mclk);
> > > -		if (ret =3D=3D -ENOENT) {
> > > -			dev_info(&pdev->dev,
> > > -				"Failed to get ssp1_mclk, defer probe\n");
> > > -			return -EPROBE_DEFER;
> > > -		}
> > > -
> > > -		dev_err(&pdev->dev, "Failed to get ssp1_mclk with
> > > err:%d\n",
> > > -								ret);
> > > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp0_sclk", &ctx->sclk0=
);
> > > +	if (ret !=3D 0)
> > >  		return ret;
> > > -	}
> > >
> > > -	ctx->sclk =3D devm_clk_get(&pdev->dev, "ssp1_sclk");
> > > -	if (IS_ERR(ctx->sclk)) {
> > > -		ret =3D PTR_ERR(ctx->sclk);
> > > -		if (ret =3D=3D -ENOENT) {
> > > -			dev_info(&pdev->dev,
> > > -				"Failed to get ssp1_sclk, defer probe\n");
> > > -			return -EPROBE_DEFER;
> > > -		}
> > > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_mclk", &ctx-
> > > >mclk);
> > > +	if (ret !=3D 0)
> > > +		return ret;
> > >
> > > -		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
> > > -								ret);
> > > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_sclk", &ctx->sclk1=
);
> > > +	if (ret !=3D 0)
> > >  		return ret;
> > > -	}
> > >
> > >  	return devm_snd_soc_register_card(&pdev->dev,
> > > &kabylake_audio_card);  }
> > > --
> > > 2.7.4

