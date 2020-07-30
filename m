Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC123393C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 21:47:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658631677;
	Thu, 30 Jul 2020 21:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658631677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596138427;
	bh=HkE81HzGw5WSPffLnuz3f3PmNtmqspbGUhkp5fo+6SY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKlPXjeTtu184QpBPZKVrSIYO43iqWSJB2tQghxCU8aJO4DE6MuSFxafFkDcRM9lF
	 Anm52tz8ySaZEgPlmuyydED0bWn2E3OIL/Yc5FcGit4ot9kVTKHW0hwpMNDxHxbDnw
	 E/AO377P3kLcXv9fDCLhFyCW/brPN4163F5/FW8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A00F80111;
	Thu, 30 Jul 2020 21:45:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51301F80227; Thu, 30 Jul 2020 21:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19731F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 21:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19731F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="COLZXMmW"
IronPort-SDR: AJEaswtOCAlJLNNwhLplygwXIVZW2NMEjw4Gf+Tkgmes8NN7CdXotoYT2a5mALTljCiR4u5wga
 eHaLDhmTLSTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="213215747"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="213215747"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 12:45:13 -0700
IronPort-SDR: kisMpsGqv9R6QZeQgpdbj08pYM4sUzd0nMNHDbiMX3XoTAwLKkBxvKm1+TPhbUaRm4fpYEu+A9
 kKcY9Rk5ITGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="290992571"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 30 Jul 2020 12:45:13 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 12:45:13 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 12:45:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Jul 2020 12:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYwBmBjSRLffAfHEEm+mQRBoM4uK5BesCu+lfdGvQ2GfUZHSr/hVQY0/dck8J5mxVUHaCSmQQNGFmyVZ/liSOLMEbGxo3ZH8w9A40/oKzrC7y1S19XjcYsAp6NiK4tCy2NY8RkisIrulFxKcmmvlvRHasmPYWRASavYAUsxY8OY8Lr9FRp9jcUn4kHOBnZS6Nj4lFKcH0HRQo3Z/O09k0xQBJz9UAOaNFizxt3yJpq1WRApJLr6pobXFntmZfYvEG6TWUBS9dH5o9Lw0G5B9ypQhq4VZk/AoVMSW1w1XgEx6GBGzfFGoEiDchnNuR7sxx3iyZJozbV/ju1z9gPkgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me7sUlFS0kEdJRC05D5U5u+3Iw5Qf08BZKu8V9elssM=;
 b=fc+1ZUDeMvn+31roozaVE43h14spqmi2PNSSqs5Siwwp++XGyQ1uMKz6z+FdydJCHMLypw/H4hEe9smq1X+8w3gnes0n6pEh3frJojvc9Ha+ekDHxy9Y8kowiv7rxhVegLLkPqxnNg3Nw23YR6CvG6DNZgJhLXH2LHNBTwFejQdz3X+obfFgyvu4hGe+ZahBHHIBs9v9YWBcWvHe7MtckDJLlhBfGaeYb1n9eNqdd9nAEGuKRc++lp0GUsZ9Hn6IOJ+UqYDbE43gVy2aj6OMt/1lrK7m9if8A4JUzBmV0HHxQsmb9QJAV+j3aoR/92fLjBxqlEeAhjKON6iwMynkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me7sUlFS0kEdJRC05D5U5u+3Iw5Qf08BZKu8V9elssM=;
 b=COLZXMmW6q/QEiQqoENjNS3rC67qnqHdLL1TG74A30QzZn00gtG2vrwdHa8UldZzKLJj5XzpHrUAX4bSJ7nOAUsaLT/QIbxeA50BRMd6KwvhAPQQXpAOxXNPQ26i1xg8ATT/2g9TQDl8Hd8goi72BFEI4PJFNCH82HGAWxJUAgI=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 19:45:10 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 19:45:10 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: "Lu, Brent" <brent.lu@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Topic: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Index: AQHWZpabwQv8AEaOYUq8HJOMkq6/wqkgdJmAgAARpZA=
Date: Thu, 30 Jul 2020 19:45:10 +0000
Message-ID: <BY5PR11MB43073C41A8A66BF96FC38F0EFD710@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
 <DM6PR11MB364221D6C03B4565C75346AB97710@DM6PR11MB3642.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB364221D6C03B4565C75346AB97710@DM6PR11MB3642.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: bb54e5a3-e629-44b1-17c0-08d834c111b3
x-ms-traffictypediagnostic: BYAPR11MB2903:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2903A2C4A5651DB12D2C133BFD710@BYAPR11MB2903.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:44;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwTf7Xfj36GHDUW8jIOqgm73ONJuBlDR8NywWbjvaBp2GoX9LYhgkRUIzdLCtHmytOB+6PwkqsB5GQr97jrMSxgCknHcZPJD9IC5Qva00M3VoajeCUKvXDeYF51AcW6PQvufK0w/ERhZWO6rrkLWGofOjzTZ8pXyP4yGXzfHcuNOY1gc+Y8ScjvwQdZzrvHJgStZfmAYzwz02AFJJ8i+2tQJgl+K6dbKBUUWrIQwhJ0IlUcEF62N0q+PP43WUbdIx4iWa1b7HNCaUISvIb+Y+KrFy9RBkP4oRBOqf8AtFcgSDlefF5l1YBY5yg7rLBo4M702WCrIJ0hdZJYQr0iuxxswyR859SWJqe5b/JLjugnUw3exaW2Na5y83dw3M1YqbqpOAFEyH5pRi5oYjEJFag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(478600001)(316002)(52536014)(9686003)(2906002)(8936002)(71200400001)(86362001)(110136005)(26005)(83380400001)(55016002)(186003)(4326008)(8676002)(66946007)(7696005)(5660300002)(6506007)(33656002)(64756008)(66446008)(66476007)(66556008)(966005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SDrLZL8IaGcGiormaDUyijHOputjL44p0ydyzZtqkt454dTK8pLFwPgKcMk3rYSg/15Ugh96uboMLG5HBrKW85SVMjOo5VDuZ8p0yAtfDpCmimhkx/vR8Q4Zpg+ksPr4l/yOYMGD6v+pNNhDpCNP8Z/sLV50jNHTVK/SM/A7XRhJ+/+LKhu/jkDMKK/UtzRGjR8oSl/DF4b0tDZcX0839iuJ7s2Qe9SWSEl71hx0+X8/DScZsEM3YzGkDx8ss+CGZLjJssFyQMAl0AFBxwv7bB2R+eodGnaONEsbYYPPqBAphWBj28HDEaZih+QLYDkFizEp+wkVa7g/irtI1z6pufFrLROYXutKdx+FhRKNhaBc9Tr2LQJE6DEaGrjkamWbA+kUm1u3IbAPHtGLz0x0+jndpq+0yiADBmkdn/1az1LmKD3/xie424sVx68LIzq5ZGUKuE8xFwh912AviNrQWSdEDRfPVrh9tTbo2OmtI6mqh86BIn0fGchXrAcDYTV608lk8mVUtfgxKwfEA4ksUXo6tC59wNlQqG2ugxDUnN0jNx2lEyJa+DB6YU61EirBD8YZA6KyY+jayBmKphFFG7rEMR+KPfgHLlnOP8cm6j1Lqp3Kibb66YNWAkrbAhMixA+V4pmpGUxZ9NBm3Q33Hg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb54e5a3-e629-44b1-17c0-08d834c111b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 19:45:10.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQsZD7tg6wyooB1tBpbOUOtXy1g42R60CJ6J9V1yglpcuGl0h2dsLQ4Y0ie0RLN/6DaSsUpV/ogFr/yRUgYy3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
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

>=20
> >
> > This patch adds a dapm route to provide early mclk/sclk for for DMIC
> > on
> > SSP0(rt5514) and Headset on SSP1(rt5663).
> >
> > The sclk rate for both codecs is different which is taken care of in
> > the platform_clock_control().The platform has one mclk and one sclk.
> > Two variables sclk0 and sclk1 are used for the two codecs on differnet
> > ssp that use different clock rate.
> >
> > This change ensures the DMIC PCM port will return valid data
> >
> > Signed-off-by: Brent Lu <brent.lu@intel.com>
> > Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> > Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> Hi Harsha,
>=20
> Isn't it working? I tested it on a eve before upstreaming. Thanks.
>=20
> commit 15747a80207585fe942416025540c0ff34e2aef8
> Author: Brent Lu <brent.lu@intel.com>
> Date:   Fri Oct 25 17:11:31 2019 +0800
>=20
>     ASoC: eve: implement set_bias_level function for rt5514
>=20
>     The first DMIC capture always fail (zero sequence data from PCM port)
>     after using DSP hotwording function (i.e. Google assistant).
>=20
>     This rt5514 codec requires to control mclk directly in the set_bias_l=
evel
>     function. Implement this function in machine driver to control the
>     ssp1_mclk clock explicitly could fix this issue.
>=20
>     Signed-off-by: Brent Lu <brent.lu@intel.com>
>     Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
>     Link: https://lore.kernel.org/r/1571994691-20199-1-git-send-email-
> brent.lu@intel.com
>     Signed-off-by: Mark Brown <broonie@kernel.org>
Your patch is necessary and is being used.
But we found few issues during kernel uprev where we need this current patc=
h=20
also to get it working
>=20
> Regards,
> Brent
>=20
> > ---
> > v1 -> v2:
> > - Only one mclk with same rate is used, so changed to using one
> > variable
> > - dropping ssp_ prefix from sclk variable names to make them sound righ=
t.
> > - removing a return statment that was not required
> > - fixed commit message accordingly
> >
> >  .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 146
> > ++++++++++++++-------
> >  1 file changed, 97 insertions(+), 49 deletions(-)
> >
> > diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > index b34cf6c..155f2b4 100644
> > --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > @@ -54,7 +54,8 @@ struct kbl_codec_private {
> >  	struct list_head hdmi_pcm_list;
> >  	struct snd_soc_jack kabylake_hdmi[2];
> >  	struct clk *mclk;
> > -	struct clk *sclk;
> > +	struct clk *sclk0;
> > +	struct clk *sclk1;
> >  };
> >
> >  enum {
> > @@ -77,13 +78,29 @@ static const struct snd_kcontrol_new
> > kabylake_controls[] =3D {  };
> >
> >  static int platform_clock_control(struct snd_soc_dapm_widget *w,
> > -			struct snd_kcontrol *k, int  event)
> > +			struct snd_kcontrol *k, int event, int ssp_num)
> >  {
> >  	struct snd_soc_dapm_context *dapm =3D w->dapm;
> >  	struct snd_soc_card *card =3D dapm->card;
> >  	struct kbl_codec_private *priv =3D snd_soc_card_get_drvdata(card);
> > +	struct clk *sclk;
> > +	unsigned long sclk_rate;
> >  	int ret =3D 0;
> >
> > +	switch (ssp_num) {
> > +	case 0:
> > +		sclk =3D priv->sclk0;
> > +		sclk_rate =3D 6144000;
> > +		break;
> > +	case 1:
> > +		sclk =3D priv->sclk1;
> > +		sclk_rate =3D 3072000;
> > +		break;
> > +	default:
> > +		dev_err(card->dev, "Invalid ssp_num %d\n", ssp_num);
> > +		return -EINVAL;
> > +	}
> > +
> >  	/*
> >  	 * MCLK/SCLK need to be ON early for a successful synchronization of
> >  	 * codec internal clock. And the clocks are turned off during @@ -
> > 91,38 +108,48 @@ static int platform_clock_control(struct
> > snd_soc_dapm_widget *w,
> >  	 */
> >  	switch (event) {
> >  	case SND_SOC_DAPM_PRE_PMU:
> > -		/* Enable MCLK */
> >  		ret =3D clk_set_rate(priv->mclk, 24000000);
> >  		if (ret < 0) {
> > -			dev_err(card->dev, "Can't set rate for mclk, err:
> > %d\n",
> > -				ret);
> > -			return ret;
> > +			dev_err(card->dev, "Can't set rate for mclk for ssp%d,
> > err: %d\n",
> > +				ssp_num, ret);
> > +				return ret;
> >  		}
> >
> > -		ret =3D clk_prepare_enable(priv->mclk);
> > -		if (ret < 0) {
> > -			dev_err(card->dev, "Can't enable mclk, err: %d\n",
> > ret);
> > -			return ret;
> > +		if (!__clk_is_enabled(priv->mclk)) {
> > +			/* Enable MCLK */
> > +			ret =3D clk_prepare_enable(priv->mclk);
> > +			if (ret < 0) {
> > +				dev_err(card->dev, "Can't enable mclk for
> > ssp%d, err: %d\n",
> > +					ssp_num, ret);
> > +				return ret;
> > +			}
> >  		}
> >
> > -		/* Enable SCLK */
> > -		ret =3D clk_set_rate(priv->sclk, 3072000);
> > +		ret =3D clk_set_rate(sclk, sclk_rate);
> >  		if (ret < 0) {
> > -			dev_err(card->dev, "Can't set rate for sclk, err:
> > %d\n",
> > -				ret);
> > +			dev_err(card->dev, "Can't set rate for sclk for ssp%d,
> > err: %d\n",
> > +				ssp_num, ret);
> >  			clk_disable_unprepare(priv->mclk);
> >  			return ret;
> >  		}
> >
> > -		ret =3D clk_prepare_enable(priv->sclk);
> > -		if (ret < 0) {
> > -			dev_err(card->dev, "Can't enable sclk, err: %d\n",
> > ret);
> > -			clk_disable_unprepare(priv->mclk);
> > +		if (!__clk_is_enabled(sclk)) {
> > +			/* Enable SCLK */
> > +			ret =3D clk_prepare_enable(sclk);
> > +			if (ret < 0) {
> > +				dev_err(card->dev, "Can't enable sclk for
> > ssp%d, err: %d\n",
> > +					ssp_num, ret);
> > +				clk_disable_unprepare(priv->mclk);
> > +				return ret;
> > +			}
> >  		}
> >  		break;
> >  	case SND_SOC_DAPM_POST_PMD:
> > -		clk_disable_unprepare(priv->mclk);
> > -		clk_disable_unprepare(priv->sclk);
> > +		if (__clk_is_enabled(priv->mclk))
> > +			clk_disable_unprepare(priv->mclk);
> > +
> > +		if (__clk_is_enabled(sclk))
> > +			clk_disable_unprepare(sclk);
> >  		break;
> >  	default:
> >  		return 0;
> > @@ -131,6 +158,18 @@ static int platform_clock_control(struct
> > snd_soc_dapm_widget *w,
> >  	return 0;
> >  }
> >
> > +static int platform_clock_control_ssp0(struct snd_soc_dapm_widget *w,
> > +			struct snd_kcontrol *k, int event) {
> > +	return platform_clock_control(w, k, event, 0); }
> > +
> > +static int platform_clock_control_ssp1(struct snd_soc_dapm_widget *w,
> > +			struct snd_kcontrol *k, int event) {
> > +	return platform_clock_control(w, k, event, 1); }
> > +
> >  static const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
> >  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> >  	SND_SOC_DAPM_MIC("Headset Mic", NULL), @@ -139,15 +178,17
> @@ static
> > const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
> >  	SND_SOC_DAPM_MIC("DMIC", NULL),
> >  	SND_SOC_DAPM_SPK("HDMI1", NULL),
> >  	SND_SOC_DAPM_SPK("HDMI2", NULL),
> > -	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
> > -			platform_clock_control, SND_SOC_DAPM_PRE_PMU
> > |
> > +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP0", SND_SOC_NOPM,
> > 0, 0,
> > +			platform_clock_control_ssp0,
> > SND_SOC_DAPM_PRE_PMU |
> > +			SND_SOC_DAPM_POST_PMD),
> > +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP1", SND_SOC_NOPM,
> > 0, 0,
> > +			platform_clock_control_ssp1,
> > SND_SOC_DAPM_PRE_PMU |
> >  			SND_SOC_DAPM_POST_PMD),
> > -
> >  };
> >
> >  static const struct snd_soc_dapm_route kabylake_map[] =3D {
> >  	/* Headphones */
> > -	{ "Headphone Jack", NULL, "Platform Clock" },
> > +	{ "Headphone Jack", NULL, "Platform Clock SSP1" },
> >  	{ "Headphone Jack", NULL, "HPOL" },
> >  	{ "Headphone Jack", NULL, "HPOR" },
> >
> > @@ -156,7 +197,7 @@ static const struct snd_soc_dapm_route
> > kabylake_map[] =3D {
> >  	{ "Right Spk", NULL, "Right BE_OUT" },
> >
> >  	/* other jacks */
> > -	{ "Headset Mic", NULL, "Platform Clock" },
> > +	{ "Headset Mic", NULL, "Platform Clock SSP1" },
> >  	{ "IN1P", NULL, "Headset Mic" },
> >  	{ "IN1N", NULL, "Headset Mic" },
> >
> > @@ -180,6 +221,7 @@ static const struct snd_soc_dapm_route
> > kabylake_map[] =3D {
> >  	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
> >
> >  	/* DMIC */
> > +	{ "DMIC", NULL, "Platform Clock SSP0" },
> >  	{ "DMIC1L", NULL, "DMIC" },
> >  	{ "DMIC1R", NULL, "DMIC" },
> >  	{ "DMIC2L", NULL, "DMIC" },
> > @@ -666,7 +708,7 @@ static int kabylake_set_bias_level(struct
> > snd_soc_card *card,
> >  	if (!component || strcmp(component->name, RT5514_DEV_NAME))
> >  		return 0;
> >
> > -	if (IS_ERR(priv->mclk))
> > +	if (IS_ERR(priv->mclk0))
> >  		return 0;
> >
> >  	/*
> > @@ -757,6 +799,28 @@ static struct snd_soc_card kabylake_audio_card =3D=
 {
> >  	.late_probe =3D kabylake_card_late_probe,  };
> >
> > +static int kabylake_audio_clk_get(struct device *dev, const char *id,
> > +	struct clk **clk)
> > +{
> > +	int ret =3D 0;
> > +
> > +	if (!clk)
> > +		return -EINVAL;
> > +
> > +	*clk =3D devm_clk_get(dev, id);
> > +	if (IS_ERR(*clk)) {
> > +		ret =3D PTR_ERR(*clk);
> > +		if (ret =3D=3D -ENOENT) {
> > +			dev_info(dev, "Failed to get %s, defer probe\n", id);
> > +			return -EPROBE_DEFER;
> > +		}
> > +
> > +		dev_err(dev, "Failed to get %s with err:%d\n", id, ret);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  static int kabylake_audio_probe(struct platform_device *pdev)  {
> >  	struct kbl_codec_private *ctx;
> > @@ -777,33 +841,17 @@ static int kabylake_audio_probe(struct
> > platform_device *pdev)
> >  		dmic_constraints =3D mach->mach_params.dmic_num =3D=3D 2 ?
> >  			&constraints_dmic_2ch :
> > &constraints_dmic_channels;
> >
> > -	ctx->mclk =3D devm_clk_get(&pdev->dev, "ssp1_mclk");
> > -	if (IS_ERR(ctx->mclk)) {
> > -		ret =3D PTR_ERR(ctx->mclk);
> > -		if (ret =3D=3D -ENOENT) {
> > -			dev_info(&pdev->dev,
> > -				"Failed to get ssp1_mclk, defer probe\n");
> > -			return -EPROBE_DEFER;
> > -		}
> > -
> > -		dev_err(&pdev->dev, "Failed to get ssp1_mclk with
> > err:%d\n",
> > -								ret);
> > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp0_sclk", &ctx->sclk0);
> > +	if (ret !=3D 0)
> >  		return ret;
> > -	}
> >
> > -	ctx->sclk =3D devm_clk_get(&pdev->dev, "ssp1_sclk");
> > -	if (IS_ERR(ctx->sclk)) {
> > -		ret =3D PTR_ERR(ctx->sclk);
> > -		if (ret =3D=3D -ENOENT) {
> > -			dev_info(&pdev->dev,
> > -				"Failed to get ssp1_sclk, defer probe\n");
> > -			return -EPROBE_DEFER;
> > -		}
> > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_mclk", &ctx-
> > >mclk);
> > +	if (ret !=3D 0)
> > +		return ret;
> >
> > -		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
> > -								ret);
> > +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_sclk", &ctx->sclk1);
> > +	if (ret !=3D 0)
> >  		return ret;
> > -	}
> >
> >  	return devm_snd_soc_register_card(&pdev->dev,
> > &kabylake_audio_card);  }
> > --
> > 2.7.4

