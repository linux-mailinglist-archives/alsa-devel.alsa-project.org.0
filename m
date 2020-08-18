Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525C247EB7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2D61738;
	Tue, 18 Aug 2020 08:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2D61738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597733562;
	bh=BD2w67HWPjvvgZ2hnbx7fILeJk89lvgPQuacL+hcGow=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MC8felW6CXxd2cR1dKSDGeNzaTtgjT2b+/UW+bI+mKecS9ojzK1+0XbJSFGLYFrQB
	 jZqjJBhjCGSODDW8lAi56dqvKjRd8VA5z7+bQr5PK2C8SdW4drZJGXo+czq5HC7AgJ
	 OtAg/nuTwXkYOu/hNt5eaPQ78fAWDh3smZxAMWqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D793F80228;
	Tue, 18 Aug 2020 08:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07BBFF8023F; Tue, 18 Aug 2020 08:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BC3F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BC3F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ZZBPHGxr"
IronPort-SDR: Gx7gEQkDqlCX2QWkBVbeR7ZK0Qh3fIl3B+x26K3HEJbQi40yF+imTUlw06V3WI8XrDxA31vd16
 31i+XpKmOacw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154110574"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="154110574"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 23:50:46 -0700
IronPort-SDR: iWl7+ca/dQ2Dnv6g0H9yfdWGzEfOTeBE3sKIeKoPSVuMj7wNbDRMdy+TRZNIvaTByhWHas8oLL
 iqFVXA+HLCeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="292675902"
Received: from unknown (HELO fmsmsx605.amr.corp.intel.com) ([10.18.84.215])
 by orsmga003.jf.intel.com with ESMTP; 17 Aug 2020 23:50:46 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 23:50:45 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 17 Aug 2020 23:50:45 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Aug 2020 23:50:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 17 Aug 2020 23:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQwVijOO4dAb44yNH0+WX2UdVPxR5VDDXKhF/JNFKdEB+A98cymM7s1lY6uSSJ+a/orbRP8eX8enAtx6xwRMldWoEgxfE1kjY0o4T5deuyGUniRfSQx89BF2E76bu14nIL2SD1HeflRUaYCxrivmdIW4EbV+AdIt1l4CDMScskSElHjx5np/utJKy1r5QAznEMjrox0xuZMLNctmDhMOU48uILR2DiOy57BCMz6avRpAqGgJ9gs0BT+hH+Ub9H2CYs+/u3ASIE3INl+ycK9CAKd4MJ6gpHSG1ewsgFNTSs9E69/GiHLRhKSQetC5BWLwnngoLj1aDKdtiarbTdU8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnOyOjLTrFiGFbyUPMBewQf2qmk8WQ+317wEJNlnpT0=;
 b=diJUiexT+4YnZkafpc8kvKeMdcCaqissSu4wsut/xZL5RqM5+oh39FarGqmo2jHfZ8/OpulLkfxNJNwfzEUd8XzCtO7Hj8zjdX6MjyRCBMFiHUPhWtoWbm56hJ1aJeKoq3JZDZrmxk/A/g46RsKWirIluE9IUiKtlc/I4qIRbwHkXi/g7EgkyfWBcKzc92dJiDWTuc/viRsOlGCX+fS7XqVd56CHtcBIwYopgVkrxZBRu+4T8BwnWeacVQ3gS0bjvTPxfLa0NiRtC7YF8PYem8L2FIGmqHMuO0WWqZcpYIgKz57DIds9tz5ZixgxGVFbuYiBxh7e5o8BLw0CdpWKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnOyOjLTrFiGFbyUPMBewQf2qmk8WQ+317wEJNlnpT0=;
 b=ZZBPHGxr0hcWof9JoPHbqVoYiaf7VCDQ2fHLBru2wJqbka6zDiTGK0xsZJsNso17LEXc/ziPt8+V/0PkuK+nEwtmkIK5/72fqi0+vUW8VKV6yzTbltGRAShmgCeiL31UxR7BL0NZCEMVM81kywOgpVMos9oRVTuk6hHWPVhGJw8=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4168.namprd11.prod.outlook.com (2603:10b6:a03:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 06:50:43 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 06:50:43 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 1/2] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Topic: [PATCH v2 1/2] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Index: AQHWb5eleGU5/IsTRUaEYVjBrcT6Tak9eA4Q
Date: Tue, 18 Aug 2020 06:50:43 +0000
Message-ID: <BYAPR11MB30464FB862DCEA243ADA51499D5C0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200811041836.999-1-michael.wei.hong.sit@intel.com>
 <20200811041836.999-2-michael.wei.hong.sit@intel.com>
In-Reply-To: <20200811041836.999-2-michael.wei.hong.sit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.189.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf02090d-2909-4b35-c56c-08d843430745
x-ms-traffictypediagnostic: BY5PR11MB4168:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41683B6C04762C63799A084B9D5C0@BY5PR11MB4168.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9JM3dYsA+mhNEKhaZeRgz315PIjpREBbq6wZY0fCIHylBBzJoZl55zNawOsWAQo74XLxjyBC6DFwBUmmCvNl95ZHfbEpMv3joVJdtzh4JQNQAqjTakBeZOFdiNUIBdaPQgcnsZcbJIExSbDK/eoWiex9FBQ2rcWAAzckyU7wmNZx51zNfYHnOuFVQ3KtB+YYSPxXk5QBHnpN5oXubbNp9eNgaA+1BQZCtU+91szF9r5Kv9YBqTCvqgxiDD+m75plbkVcfZF5/2F6/4PH5xXaKr6ZX+35kcfIjPYiXu0IYHeNlUDAK3suWapdqEVULYT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(83380400001)(8936002)(86362001)(52536014)(4326008)(8676002)(66946007)(5660300002)(76116006)(6506007)(66556008)(110136005)(64756008)(53546011)(66476007)(2906002)(66446008)(55016002)(7696005)(186003)(33656002)(316002)(478600001)(54906003)(9686003)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L3ofAwUQFxZCPc+0b7kw4xSZJuDCtN/PTGDOAbA+PMBC+Uopi3r1SY+jats+PNk24KyXNsA+nS5zPsGCcKZ9ASS4/sAz5qsHgPwSgNI6ksC5iMiSmbJEy4Kqjdx0AFuw2AZOFVIbDX2u/GHqC1xvw77jj16Hh9Iv8/cZgIWGqzGZPn+OS0njVGKY7zOME6LOYlksKj14K677JWUF+qQCHVALtziqnO2s3aogpmPX6NAnN6E20O0KXkkvtG8Q6ezlxKQAKqtu2JDXFoFFJ7dV610DNEev3/05YZDxDZZJtCbLxaHho7p/OPJ/ESSPB/0F8qudNQst3l/NesCWNkWpcg1FzL8vNn2US2HoMmRDKwcreqKPM9cbeihdvgKGUFVTIjoNdjygDOirRM5pgpOtOWZU3l2nM+QwZujb0ivu/hmPTyZwWjzs+8OzeOkFK4OUag69BcmiYlQjEtq3BqDGjlaqrEh3a7fgfjtnWrSDNQacpUpsJ7vIBsroTWpiS1UgOYZrRVy6j4jioo5oF7CzEmmqkCAdI7oKaRbKxz8G5U90QTEsALwFUU81r+LiKHDtrBC6529CwWujX4vPGhFwfQxT5HzBHCRpKt6f4D8KwCIXiR68SJotJXVnfNUjpAgH7s7IAMynFMyZJga67E4a4Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf02090d-2909-4b35-c56c-08d843430745
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 06:50:43.5608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSEbS+I35xLS+3ASDRTHhCbDQiZbleOwDYxKuqY5N6Z0pNL1q7vB0NeMWe8uzTDJr9HafRGG+kQVj1i7Ztx/boIY2tTt9CQYkQmvR9+NzM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4168
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Sia, Jee
 Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf
> Of Michael Sit Wei Hong
> Sent: Tuesday, 11 August, 2020 12:19 PM
> To: alsa-devel@alsa-project.org
> Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Shevchenko,
> Andriy <andriy.shevchenko@intel.com>; tiwai@suse.com; Sia, Jee
> Heng <jee.heng.sia@intel.com>; pierre-
> louis.bossart@linux.intel.com; liam.r.girdwood@linux.intel.com;
> broonie@kernel.org
> Subject: [PATCH v2 1/2] ASoC: Intel: KMB: Enable TDM audio
> capture
>=20
> Enable I2S TDM audio capture for Intel Keem Bay platform.
> The I2S TDM will support 4 channel and 8 channel audio capture only.
> 4 channel and 8 channel audio capture operates only in slave mode.
>=20
> Signed-off-by: Michael Sit Wei Hong
> <michael.wei.hong.sit@intel.com>
> Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-
> louis.bossart@linux.intel.com>
> ---
>  sound/soc/intel/keembay/kmb_platform.c | 145
> ++++++++++++++++++-------
>  1 file changed, 108 insertions(+), 37 deletions(-)
>=20
> diff --git a/sound/soc/intel/keembay/kmb_platform.c
> b/sound/soc/intel/keembay/kmb_platform.c
> index eaa4fd391171..09f49e1cda59 100644
> --- a/sound/soc/intel/keembay/kmb_platform.c
> +++ b/sound/soc/intel/keembay/kmb_platform.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -17,7 +19,7 @@
>  #define PERIODS_MAX		48
>  #define PERIOD_BYTES_MIN	4096
>  #define BUFFER_BYTES_MAX	(PERIODS_MAX *
> PERIOD_BYTES_MIN)
> -#define TDM_OPERATION		1
> +#define TDM_OPERATION		5
>  #define I2S_OPERATION		0
>  #define DATA_WIDTH_CONFIG_BIT	6
>  #define TDM_CHANNEL_CONFIG_BIT	3
> @@ -82,19 +84,25 @@ static unsigned int kmb_pcm_rx_fn(struct
> kmb_i2s_info *kmb_i2s,  {
>  	unsigned int period_pos =3D rx_ptr % runtime->period_size;
>  	void __iomem *i2s_base =3D kmb_i2s->i2s_base;
> +	int chan =3D kmb_i2s->config.chan_nr;
>  	void *buf =3D runtime->dma_area;
> -	int i;
> +	int i, j;
>=20
>  	/* KMB i2s uses two separate L/R FIFO */
>  	for (i =3D 0; i < kmb_i2s->fifo_th; i++) {
> -		if (kmb_i2s->config.data_width =3D=3D 16) {
> -			((u16(*)[2])buf)[rx_ptr][0] =3D readl(i2s_base
> + LRBR_LTHR(0));
> -			((u16(*)[2])buf)[rx_ptr][1] =3D readl(i2s_base
> + RRBR_RTHR(0));
> -		} else {
> -			((u32(*)[2])buf)[rx_ptr][0] =3D readl(i2s_base
> + LRBR_LTHR(0));
> -			((u32(*)[2])buf)[rx_ptr][1] =3D readl(i2s_base
> + RRBR_RTHR(0));
> +		for (j =3D 0; j < chan / 2; j++) {
> +			if (kmb_i2s->config.data_width =3D=3D 16) {
> +				((u16 *)buf)[rx_ptr * chan + (j * 2)]
> =3D
> +						readl(i2s_base +
> LRBR_LTHR(j));
> +				((u16 *)buf)[rx_ptr * chan + ((j * 2)
> + 1)] =3D
> +						readl(i2s_base +
> RRBR_RTHR(j));
> +			} else {
> +				((u32 *)buf)[rx_ptr * chan + (j * 2)]
> =3D
> +						readl(i2s_base +
> LRBR_LTHR(j));
> +				((u32 *)buf)[rx_ptr * chan + ((j * 2)
> + 1)] =3D
> +						readl(i2s_base +
> RRBR_RTHR(j));
> +			}
>  		}
> -
>  		period_pos++;
>=20
>  		if (++rx_ptr >=3D runtime->buffer_size) @@ -238,6
> +246,7 @@ static irqreturn_t kmb_i2s_irq_handler(int irq, void
> *dev_id)
>  	struct kmb_i2s_info *kmb_i2s =3D dev_id;
>  	struct i2s_clk_config_data *config =3D &kmb_i2s->config;
>  	irqreturn_t ret =3D IRQ_NONE;
> +	u32 tx_enabled =3D 0;
>  	u32 isr[4];
>  	int i;
>=20
> @@ -246,22 +255,45 @@ static irqreturn_t kmb_i2s_irq_handler(int
> irq, void *dev_id)
>=20
>  	kmb_i2s_clear_irqs(kmb_i2s,
> SNDRV_PCM_STREAM_PLAYBACK);
>  	kmb_i2s_clear_irqs(kmb_i2s,
> SNDRV_PCM_STREAM_CAPTURE);
> +	/* Only check TX interrupt if TX is active */
> +	tx_enabled =3D readl(kmb_i2s->i2s_base + ITER);
> +
> +	/*
> +	 * Data available. Retrieve samples from FIFO
> +	 */
> +
> +	/*
> +	 * 8 channel audio will have isr[0..2] triggered,
> +	 * reading the specific isr based on the audio configuration,
> +	 * to avoid reading the buffers too early.
> +	 */
> +	switch (config->chan_nr) {
> +	case 2:
> +		if (isr[0] & ISR_RXDA)
> +			kmb_pcm_operation(kmb_i2s, false);
> +		ret =3D IRQ_HANDLED;
> +		break;
> +	case 4:
> +		if (isr[1] & ISR_RXDA)
> +			kmb_pcm_operation(kmb_i2s, false);
> +		ret =3D IRQ_HANDLED;
> +		break;
> +	case 8:
> +		if (isr[3] & ISR_RXDA)
> +			kmb_pcm_operation(kmb_i2s, false);
> +		ret =3D IRQ_HANDLED;
> +		break;
> +	}
>=20
>  	for (i =3D 0; i < config->chan_nr / 2; i++) {
>  		/*
>  		 * Check if TX fifo is empty. If empty fill FIFO with
> samples
>  		 */
> -		if ((isr[i] & ISR_TXFE)) {
> +		if ((isr[i] & ISR_TXFE) && tx_enabled) {
>  			kmb_pcm_operation(kmb_i2s, true);
>  			ret =3D IRQ_HANDLED;
>  		}
> -		/*
> -		 * Data available. Retrieve samples from FIFO
> -		 */
> -		if ((isr[i] & ISR_RXDA)) {
> -			kmb_pcm_operation(kmb_i2s, false);
> -			ret =3D IRQ_HANDLED;
> -		}
> +
>  		/* Error Handling: TX */
>  		if (isr[i] & ISR_TXFO) {
>  			dev_dbg(kmb_i2s->dev, "TX overrun
> (ch_id=3D%d)\n", i); @@ -445,7 +477,7 @@ static int
> kmb_dai_hw_params(struct snd_pcm_substream *substream,  {
>  	struct kmb_i2s_info *kmb_i2s =3D
> snd_soc_dai_get_drvdata(cpu_dai);
>  	struct i2s_clk_config_data *config =3D &kmb_i2s->config;
> -	u32 register_val, write_val;
> +	u32 write_val;
>  	int ret;
>=20
>  	switch (params_format(hw_params)) {
> @@ -472,16 +504,34 @@ static int kmb_dai_hw_params(struct
> snd_pcm_substream *substream,
>  	config->chan_nr =3D params_channels(hw_params);
>=20
>  	switch (config->chan_nr) {
> -	/* TODO: This switch case will handle up to TDM8 in the
> near future */
> -	case TWO_CHANNEL_SUPPORT:
> +	case 8:
> +	case 4:
> +		/*
> +		 * Platform is not capable of providing clocks for
> +		 * multi channel audio
> +		 */
> +		if (kmb_i2s->master)
> +			return -EINVAL;
> +
>  		write_val =3D ((config->chan_nr / 2) <<
> TDM_CHANNEL_CONFIG_BIT) |
>  				(config->data_width <<
> DATA_WIDTH_CONFIG_BIT) |
> -				MASTER_MODE | I2S_OPERATION;
> +				!MASTER_MODE |
> TDM_OPERATION;
>=20
>  		writel(write_val, kmb_i2s->pss_base +
> I2S_GEN_CFG_0);
> +		break;
> +	case 2:
> +		/*
> +		 * Platform is only capable of providing clocks need
> for
> +		 * 2 channel master mode
> +		 */
> +		if (!(kmb_i2s->master))
> +			return -EINVAL;
> +
> +		write_val =3D ((config->chan_nr / 2) <<
> TDM_CHANNEL_CONFIG_BIT) |
> +				(config->data_width <<
> DATA_WIDTH_CONFIG_BIT) |
> +				MASTER_MODE | I2S_OPERATION;
>=20
> -		register_val =3D readl(kmb_i2s->pss_base +
> I2S_GEN_CFG_0);
> -		dev_dbg(kmb_i2s->dev, "pss register =3D 0x%X",
> register_val);
> +		writel(write_val, kmb_i2s->pss_base +
> I2S_GEN_CFG_0);
>  		break;
>  	default:
>  		dev_dbg(kmb_i2s->dev, "channel not supported\n");
> @@ -529,9 +579,9 @@ static struct snd_soc_dai_ops kmb_dai_ops
> =3D {
>  	.set_fmt	=3D kmb_set_dai_fmt,
>  };
>=20
> -static struct snd_soc_dai_driver intel_kmb_platform_dai[] =3D {
> +static struct snd_soc_dai_driver intel_kmb_i2s_dai[] =3D {
>  	{
> -		.name =3D "kmb-plat-dai",
> +		.name =3D "intel_kmb_i2s",
>  		.playback =3D {
>  			.channels_min =3D 2,
>  			.channels_max =3D 2,
> @@ -547,10 +597,6 @@ static struct snd_soc_dai_driver
> intel_kmb_platform_dai[] =3D {
>  		.capture =3D {
>  			.channels_min =3D 2,
>  			.channels_max =3D 2,
> -			/*
> -			 * .channels_max will be overwritten
> -			 * if provided by Device Tree
> -			 */
>  			.rates =3D SNDRV_PCM_RATE_8000 |
>  				 SNDRV_PCM_RATE_16000 |
>  				 SNDRV_PCM_RATE_48000,
> @@ -564,9 +610,35 @@ static struct snd_soc_dai_driver
> intel_kmb_platform_dai[] =3D {
>  	},
>  };
>=20
> +static struct snd_soc_dai_driver intel_kmb_tdm_dai[] =3D {
> +	{
> +		.name =3D "intel_kmb_tdm",
> +		.capture =3D {
> +			.channels_min =3D 4,
> +			.channels_max =3D 8,
> +			.rates =3D SNDRV_PCM_RATE_8000 |
> +				 SNDRV_PCM_RATE_16000 |
> +				 SNDRV_PCM_RATE_48000,
> +			.rate_min =3D 8000,
> +			.rate_max =3D 48000,
> +			.formats =3D (SNDRV_PCM_FMTBIT_S32_LE |
> +				    SNDRV_PCM_FMTBIT_S24_LE |
> +				    SNDRV_PCM_FMTBIT_S16_LE),
> +		},
> +		.ops =3D &kmb_dai_ops,
> +	},
> +};
> +
> +static const struct of_device_id kmb_plat_of_match[] =3D {
> +	{ .compatible =3D "intel,keembay-i2s", .data =3D
> &intel_kmb_i2s_dai},
> +	{ .compatible =3D "intel,keembay-tdm", .data =3D
> &intel_kmb_tdm_dai},
> +	{}
> +};
> +
>  static int kmb_plat_dai_probe(struct platform_device *pdev)  {
>  	struct snd_soc_dai_driver *kmb_i2s_dai;
> +	const struct of_device_id *match;
>  	struct device *dev =3D &pdev->dev;
>  	struct kmb_i2s_info *kmb_i2s;
>  	int ret, irq;
> @@ -580,7 +652,12 @@ static int kmb_plat_dai_probe(struct
> platform_device *pdev)
>  	if (!kmb_i2s_dai)
>  		return -ENOMEM;
>=20
> -	kmb_i2s_dai->ops =3D &kmb_dai_ops;
> +	match =3D of_match_device(kmb_plat_of_match, &pdev-
> >dev);
> +	if (!match) {
> +		dev_err(&pdev->dev, "Error: No device match
> found\n");
> +		return -ENODEV;
> +	}
> +	kmb_i2s_dai =3D (struct snd_soc_dai_driver *) match->data;
>=20
>  	/* Prepare the related clocks */
>  	kmb_i2s->clk_apb =3D devm_clk_get(dev, "apb_clk"); @@ -
> 630,8 +707,7 @@ static int kmb_plat_dai_probe(struct
> platform_device *pdev)
>  	kmb_i2s->fifo_th =3D (1 << COMP1_FIFO_DEPTH(comp1_reg))
> / 2;
>=20
>  	ret =3D devm_snd_soc_register_component(dev,
> &kmb_component,
> -					      intel_kmb_platform_dai,
> -
> 	ARRAY_SIZE(intel_kmb_platform_dai));
> +					      kmb_i2s_dai, 1);
>  	if (ret) {
>  		dev_err(dev, "not able to register dai\n");
>  		return ret;
> @@ -646,11 +722,6 @@ static int kmb_plat_dai_probe(struct
> platform_device *pdev)
>  	return ret;
>  }
>=20
> -static const struct of_device_id kmb_plat_of_match[] =3D {
> -	{ .compatible =3D "intel,keembay-i2s", },
> -	{}
> -};
> -
>  static struct platform_driver kmb_plat_dai_driver =3D {
>  	.driver		=3D {
>  		.name		=3D "kmb-plat-dai",
> --
> 2.17.1

Hi everyone,

Is there anymore comments on this patch set?

Thanks,
Regards,
Michael

