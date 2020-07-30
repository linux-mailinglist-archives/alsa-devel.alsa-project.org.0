Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CA233889
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 20:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56931694;
	Thu, 30 Jul 2020 20:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56931694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596134542;
	bh=6TzrDxy9CibKO+M6wnnGwMUAyRteEHcYRvw0/GD3Sso=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zcfs+9wa3ee+M/PLkp9mS9JkOIKHk+O/9hyXFO3HtD2ULZ4VFnjRPgBksxLqKVsQT
	 bXUfcP9fD7dKwofW1yuSnw5MA2H86eaP/UfasaLrQmDu2o/2+OPChZkSy3AlWmdKXl
	 nYegG9aF+Tb2rAcDN3Q7B2b59CIK+Oyr/7Ee3eyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C57F800C9;
	Thu, 30 Jul 2020 20:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EAF4F8021E; Thu, 30 Jul 2020 20:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A609F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 20:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A609F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="pt4Lo3KH"
IronPort-SDR: wENiZMmVEMzjF1OEsLhx4ay/Q0pbYnFtJaBetmPgMZxkykQc2pLK6qBDqgqOuGCTMaSLK4T6Pd
 Yvdvc+qvWVhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152889607"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="152889607"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 11:40:27 -0700
IronPort-SDR: Von5tuJeibjEGQYSvTgpjiNfRuDSKQIP38/DxK5n/UeHmfSGPkZnVJRX2xTi/0fxMB/3jujgbi
 NRuaZCFO0THQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="435145097"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 30 Jul 2020 11:40:27 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 11:40:26 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 11:40:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 11:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiAgmf5lweU11Je9qb3FbFzyt5v8sA82Q8lavSxVeZxt1b+UkOKDiGlMfvO9c+WSCrnW3J5svmT0zenJYWybmFC4Gb+stxbuih1DJXOOKLP8LiicS0c7oR/k6G9547pZ7Wj8edO2+/u/g6J2s0nloGYOPQtQKS/esOD+T6AxZiFPP0aLy+3w8Ukx0f0b4wVgMsDeBx1sL/2jOgW9/pWX+dGpgPrBbLGe90crTJCabjN15H8LZeihtoXk7gpd9/xlZjAAmRjL2qkSx8kEcjGF2BOWgXyBPRV850lKpU8qxYSCmHA/G0wQn1s+SK52Mrh8CUj2549F2EE2yxRwEhx8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxNmEL78DcJXVGOzbrQqab3llK/vMTDv9uVpDXMDlqM=;
 b=iLeDkv9aDbxbn7YNgGYIDpr8OHgcMfzX4ZFi9KlISMOF/RlG0721W4jcVSgXKgQC+jWLWrI5c63c0FndQ3JHrLulKcJlKR656nt2mA3HlZ1ub2+PLjwknQbHb+ciMeXxd4QOFOutF9eKObp+Z5Bb6PgtQSsElgorVFReXEZb4IX31MFaYBMGmh2GRde6h2v2mqBffXNfvXVWwzx7fGPx1yd27NNGk8urvWowFu8MFAcjaHVChKgEQvVWF83fNGBwgvxVurap+LmFKYttOeVRs/18PEgI1dt9/b3lFgGAOGPnThwdGke+R9DY1SFlDjnbZPf2KX9AYpc1x1wKPrKWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxNmEL78DcJXVGOzbrQqab3llK/vMTDv9uVpDXMDlqM=;
 b=pt4Lo3KH39ciSs5ZJrfG8bY2ALklM6FrWv1ov6p6SA+SetFhKuRPKdun+geeiwmac3qCo6D162VhRiqB19a+gh069GWA3u+g31ErKaM0LSrkvZBqla8yhyvNgE3YNvcq9v5oe1xeP86NTOATGHTzIVOwcNZ2dsP5f3es3Xjs84U=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3738.namprd11.prod.outlook.com (2603:10b6:5:139::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 30 Jul
 2020 18:40:25 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 18:40:25 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "N, Harshapriya" <harshapriya.n@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>, 
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Topic: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
Thread-Index: AQHWZpabo/M4MGHBUkaTFT8kyZjqIqkgcygA
Date: Thu, 30 Jul 2020 18:40:25 +0000
Message-ID: <DM6PR11MB364221D6C03B4565C75346AB97710@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
In-Reply-To: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.81.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e4c931b-bf5a-4259-4567-08d834b80612
x-ms-traffictypediagnostic: DM6PR11MB3738:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3738E40C0C4917E79D9F430097710@DM6PR11MB3738.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:47;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yexn6EC2srApHRaQZKUrg2mDVbfuCvBqXkrkYmUGp4AZVkoU8n/OrJCK77IWq8eYrluOUpEPQ+eeYODHMxryJSvhe9mK5CT/BraEADREW4nVUQe5iEbiSHHBYRvTWRpX8M669Qa1IoiN2pzfQ8KWh/AKSUtKj8Y7IdgTsefTG3tlWXSOlaOJLbO3TL4GaML9eO5FnNQ5ztiIALh5rj79Vf+kKwz/4LyiXE9jDPnBwXHeND1OR8hajYR3oUNnFr6mZ3DTBCASf56jbMqrQaOFw2qbaDlqAAUK0oDw804cu94MfMPDwIGK/BnSGB91BqDOoOkSe1x77q06xXhhl8GSfihUhEfQ0QaJNXYCCi2wSE/Px8AlN+BHOeIwbx2aefS6wouKMfTxNGXju47UuNl5nQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(316002)(8676002)(71200400001)(5660300002)(86362001)(4326008)(26005)(2906002)(6506007)(8936002)(110136005)(186003)(83380400001)(9686003)(55016002)(64756008)(66446008)(76116006)(66556008)(66946007)(66476007)(33656002)(478600001)(966005)(52536014)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZvtlEqiUtYpkAZVo8uFuZ0MUL64c2XeUtARjCVIrJ8oS0dz+FXTHdMdXuwSWluvNLJTcwojdbSp3I9UzfjflxyMPSHv/v313uoMbszU8CK7MqU8csHmOVTAWcuU3Qym1GpFQOvNNTQBJiEPNqw4lMPhwQ672v7M5HvbRJonwx5spk+t171MrxmivoM4QX+eJPSz8AADYl849Grw2RaMnkK6mHRs99QFd5VFH6Qfa7rAe9OiSMNGJL/n6GAVKYNWbruUUG6kc2GxI7Ncy4cnFUN0cfsv0FzQ6uDPpayon62s5TjVfFlt3ZR1w3zgQSuD2gxSAoJAsNk0JgL7dBBsqYu9S0EBJMDcZQ02Tfbv4NSj9AFQG7bYFWfBHa/9xfGTJqc9xKxlH1iAWnY9hu+176sYPYVBdSh9oZd91kqKVIGWBH/lBuOaT5fQ1wKHEFz2puOH39sod7Dw2Ou4iYMc5Jz25XzKHQzmO3cir/D5QRC0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4c931b-bf5a-4259-4567-08d834b80612
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 18:40:25.1823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCAEOUEaCI+qIDEYG7ZvSOhDtRbYIxe/R4KPmMUW6Y4h/b1Dm8UY2W8CWDDKeaGMUR93+5+wxddg+GorHvPmyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3738
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
> This patch adds a dapm route to provide early mclk/sclk for for DMIC on
> SSP0(rt5514) and Headset on SSP1(rt5663).
>=20
> The sclk rate for both codecs is different which is taken care of in the
> platform_clock_control().The platform has one mclk and one sclk. Two
> variables sclk0 and sclk1 are used for the two codecs on differnet ssp th=
at use
> different clock rate.
>=20
> This change ensures the DMIC PCM port will return valid data
>=20
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Hi Harsha,

Isn't it working? I tested it on a eve before upstreaming. Thanks.

commit 15747a80207585fe942416025540c0ff34e2aef8
Author: Brent Lu <brent.lu@intel.com>
Date:   Fri Oct 25 17:11:31 2019 +0800

    ASoC: eve: implement set_bias_level function for rt5514

    The first DMIC capture always fail (zero sequence data from PCM port)
    after using DSP hotwording function (i.e. Google assistant).

    This rt5514 codec requires to control mclk directly in the set_bias_lev=
el
    function. Implement this function in machine driver to control the
    ssp1_mclk clock explicitly could fix this issue.

    Signed-off-by: Brent Lu <brent.lu@intel.com>
    Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
    Link: https://lore.kernel.org/r/1571994691-20199-1-git-send-email-brent=
.lu@intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

Regards,
Brent

> ---
> v1 -> v2:
> - Only one mclk with same rate is used, so changed to using one variable
> - dropping ssp_ prefix from sclk variable names to make them sound right.
> - removing a return statment that was not required
> - fixed commit message accordingly
>=20
>  .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 146
> ++++++++++++++-------
>  1 file changed, 97 insertions(+), 49 deletions(-)
>=20
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index b34cf6c..155f2b4 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -54,7 +54,8 @@ struct kbl_codec_private {
>  	struct list_head hdmi_pcm_list;
>  	struct snd_soc_jack kabylake_hdmi[2];
>  	struct clk *mclk;
> -	struct clk *sclk;
> +	struct clk *sclk0;
> +	struct clk *sclk1;
>  };
>=20
>  enum {
> @@ -77,13 +78,29 @@ static const struct snd_kcontrol_new
> kabylake_controls[] =3D {  };
>=20
>  static int platform_clock_control(struct snd_soc_dapm_widget *w,
> -			struct snd_kcontrol *k, int  event)
> +			struct snd_kcontrol *k, int event, int ssp_num)
>  {
>  	struct snd_soc_dapm_context *dapm =3D w->dapm;
>  	struct snd_soc_card *card =3D dapm->card;
>  	struct kbl_codec_private *priv =3D snd_soc_card_get_drvdata(card);
> +	struct clk *sclk;
> +	unsigned long sclk_rate;
>  	int ret =3D 0;
>=20
> +	switch (ssp_num) {
> +	case 0:
> +		sclk =3D priv->sclk0;
> +		sclk_rate =3D 6144000;
> +		break;
> +	case 1:
> +		sclk =3D priv->sclk1;
> +		sclk_rate =3D 3072000;
> +		break;
> +	default:
> +		dev_err(card->dev, "Invalid ssp_num %d\n", ssp_num);
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * MCLK/SCLK need to be ON early for a successful synchronization of
>  	 * codec internal clock. And the clocks are turned off during @@ -
> 91,38 +108,48 @@ static int platform_clock_control(struct
> snd_soc_dapm_widget *w,
>  	 */
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> -		/* Enable MCLK */
>  		ret =3D clk_set_rate(priv->mclk, 24000000);
>  		if (ret < 0) {
> -			dev_err(card->dev, "Can't set rate for mclk, err:
> %d\n",
> -				ret);
> -			return ret;
> +			dev_err(card->dev, "Can't set rate for mclk for ssp%d,
> err: %d\n",
> +				ssp_num, ret);
> +				return ret;
>  		}
>=20
> -		ret =3D clk_prepare_enable(priv->mclk);
> -		if (ret < 0) {
> -			dev_err(card->dev, "Can't enable mclk, err: %d\n",
> ret);
> -			return ret;
> +		if (!__clk_is_enabled(priv->mclk)) {
> +			/* Enable MCLK */
> +			ret =3D clk_prepare_enable(priv->mclk);
> +			if (ret < 0) {
> +				dev_err(card->dev, "Can't enable mclk for
> ssp%d, err: %d\n",
> +					ssp_num, ret);
> +				return ret;
> +			}
>  		}
>=20
> -		/* Enable SCLK */
> -		ret =3D clk_set_rate(priv->sclk, 3072000);
> +		ret =3D clk_set_rate(sclk, sclk_rate);
>  		if (ret < 0) {
> -			dev_err(card->dev, "Can't set rate for sclk, err:
> %d\n",
> -				ret);
> +			dev_err(card->dev, "Can't set rate for sclk for ssp%d,
> err: %d\n",
> +				ssp_num, ret);
>  			clk_disable_unprepare(priv->mclk);
>  			return ret;
>  		}
>=20
> -		ret =3D clk_prepare_enable(priv->sclk);
> -		if (ret < 0) {
> -			dev_err(card->dev, "Can't enable sclk, err: %d\n",
> ret);
> -			clk_disable_unprepare(priv->mclk);
> +		if (!__clk_is_enabled(sclk)) {
> +			/* Enable SCLK */
> +			ret =3D clk_prepare_enable(sclk);
> +			if (ret < 0) {
> +				dev_err(card->dev, "Can't enable sclk for
> ssp%d, err: %d\n",
> +					ssp_num, ret);
> +				clk_disable_unprepare(priv->mclk);
> +				return ret;
> +			}
>  		}
>  		break;
>  	case SND_SOC_DAPM_POST_PMD:
> -		clk_disable_unprepare(priv->mclk);
> -		clk_disable_unprepare(priv->sclk);
> +		if (__clk_is_enabled(priv->mclk))
> +			clk_disable_unprepare(priv->mclk);
> +
> +		if (__clk_is_enabled(sclk))
> +			clk_disable_unprepare(sclk);
>  		break;
>  	default:
>  		return 0;
> @@ -131,6 +158,18 @@ static int platform_clock_control(struct
> snd_soc_dapm_widget *w,
>  	return 0;
>  }
>=20
> +static int platform_clock_control_ssp0(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int event)
> +{
> +	return platform_clock_control(w, k, event, 0); }
> +
> +static int platform_clock_control_ssp1(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int event)
> +{
> +	return platform_clock_control(w, k, event, 1); }
> +
>  static const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
>  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>  	SND_SOC_DAPM_MIC("Headset Mic", NULL), @@ -139,15 +178,17
> @@ static const struct snd_soc_dapm_widget kabylake_widgets[] =3D {
>  	SND_SOC_DAPM_MIC("DMIC", NULL),
>  	SND_SOC_DAPM_SPK("HDMI1", NULL),
>  	SND_SOC_DAPM_SPK("HDMI2", NULL),
> -	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
> -			platform_clock_control, SND_SOC_DAPM_PRE_PMU
> |
> +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP0", SND_SOC_NOPM,
> 0, 0,
> +			platform_clock_control_ssp0,
> SND_SOC_DAPM_PRE_PMU |
> +			SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("Platform Clock SSP1", SND_SOC_NOPM,
> 0, 0,
> +			platform_clock_control_ssp1,
> SND_SOC_DAPM_PRE_PMU |
>  			SND_SOC_DAPM_POST_PMD),
> -
>  };
>=20
>  static const struct snd_soc_dapm_route kabylake_map[] =3D {
>  	/* Headphones */
> -	{ "Headphone Jack", NULL, "Platform Clock" },
> +	{ "Headphone Jack", NULL, "Platform Clock SSP1" },
>  	{ "Headphone Jack", NULL, "HPOL" },
>  	{ "Headphone Jack", NULL, "HPOR" },
>=20
> @@ -156,7 +197,7 @@ static const struct snd_soc_dapm_route
> kabylake_map[] =3D {
>  	{ "Right Spk", NULL, "Right BE_OUT" },
>=20
>  	/* other jacks */
> -	{ "Headset Mic", NULL, "Platform Clock" },
> +	{ "Headset Mic", NULL, "Platform Clock SSP1" },
>  	{ "IN1P", NULL, "Headset Mic" },
>  	{ "IN1N", NULL, "Headset Mic" },
>=20
> @@ -180,6 +221,7 @@ static const struct snd_soc_dapm_route
> kabylake_map[] =3D {
>  	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
>=20
>  	/* DMIC */
> +	{ "DMIC", NULL, "Platform Clock SSP0" },
>  	{ "DMIC1L", NULL, "DMIC" },
>  	{ "DMIC1R", NULL, "DMIC" },
>  	{ "DMIC2L", NULL, "DMIC" },
> @@ -666,7 +708,7 @@ static int kabylake_set_bias_level(struct
> snd_soc_card *card,
>  	if (!component || strcmp(component->name, RT5514_DEV_NAME))
>  		return 0;
>=20
> -	if (IS_ERR(priv->mclk))
> +	if (IS_ERR(priv->mclk0))
>  		return 0;
>=20
>  	/*
> @@ -757,6 +799,28 @@ static struct snd_soc_card kabylake_audio_card =3D {
>  	.late_probe =3D kabylake_card_late_probe,  };
>=20
> +static int kabylake_audio_clk_get(struct device *dev, const char *id,
> +	struct clk **clk)
> +{
> +	int ret =3D 0;
> +
> +	if (!clk)
> +		return -EINVAL;
> +
> +	*clk =3D devm_clk_get(dev, id);
> +	if (IS_ERR(*clk)) {
> +		ret =3D PTR_ERR(*clk);
> +		if (ret =3D=3D -ENOENT) {
> +			dev_info(dev, "Failed to get %s, defer probe\n", id);
> +			return -EPROBE_DEFER;
> +		}
> +
> +		dev_err(dev, "Failed to get %s with err:%d\n", id, ret);
> +	}
> +
> +	return ret;
> +}
> +
>  static int kabylake_audio_probe(struct platform_device *pdev)  {
>  	struct kbl_codec_private *ctx;
> @@ -777,33 +841,17 @@ static int kabylake_audio_probe(struct
> platform_device *pdev)
>  		dmic_constraints =3D mach->mach_params.dmic_num =3D=3D 2 ?
>  			&constraints_dmic_2ch :
> &constraints_dmic_channels;
>=20
> -	ctx->mclk =3D devm_clk_get(&pdev->dev, "ssp1_mclk");
> -	if (IS_ERR(ctx->mclk)) {
> -		ret =3D PTR_ERR(ctx->mclk);
> -		if (ret =3D=3D -ENOENT) {
> -			dev_info(&pdev->dev,
> -				"Failed to get ssp1_mclk, defer probe\n");
> -			return -EPROBE_DEFER;
> -		}
> -
> -		dev_err(&pdev->dev, "Failed to get ssp1_mclk with
> err:%d\n",
> -								ret);
> +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp0_sclk", &ctx->sclk0);
> +	if (ret !=3D 0)
>  		return ret;
> -	}
>=20
> -	ctx->sclk =3D devm_clk_get(&pdev->dev, "ssp1_sclk");
> -	if (IS_ERR(ctx->sclk)) {
> -		ret =3D PTR_ERR(ctx->sclk);
> -		if (ret =3D=3D -ENOENT) {
> -			dev_info(&pdev->dev,
> -				"Failed to get ssp1_sclk, defer probe\n");
> -			return -EPROBE_DEFER;
> -		}
> +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_mclk", &ctx-
> >mclk);
> +	if (ret !=3D 0)
> +		return ret;
>=20
> -		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
> -								ret);
> +	ret =3D kabylake_audio_clk_get(&pdev->dev, "ssp1_sclk", &ctx->sclk1);
> +	if (ret !=3D 0)
>  		return ret;
> -	}
>=20
>  	return devm_snd_soc_register_card(&pdev->dev,
> &kabylake_audio_card);  }
> --
> 2.7.4

