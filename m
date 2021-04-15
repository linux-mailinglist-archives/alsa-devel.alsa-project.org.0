Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B2360FA9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:02:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721351673;
	Thu, 15 Apr 2021 18:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721351673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618502548;
	bh=OBzLGNWIQdZFmkpV2RvqCocIUx4guTujyS4hmdJTO1o=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnhvtSbC3tOJOs5Ox1yLL16Svi/GZlzh1jS2Ik+m32u7g1Cy1VlfmpzDr2TWpjENV
	 pqFCaa5JcAhfGhTV3fDyDTQ4bVzOXzuVExGHjnxT9j8xKHp7a2lZG7qA1GOBb3wXrO
	 mmOzBTDiOa1ZWcOeIFgNuhPZJqvo9WOYic8jTaF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0114F800ED;
	Thu, 15 Apr 2021 18:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E21F8022B; Thu, 15 Apr 2021 18:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150077.outbound.protection.outlook.com [40.107.15.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 900AAF80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 900AAF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="e9GHYiBJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvqaISzqANnBmIOA/wYKKntPK8OJgg8VLxZYB5/Lv3oqAHRKOQj5TN1dTKvq6dGEYae205TraxWWiqH74pvlmBTO/PqiHD5plFj5IuN9OQfOyDZg+Q1r/bQbRAKQBU63v96wh9EpiVvdlt0LBZ998DD3ue59prN7IozMzGl5RSKSnB1c2TASZUYHH0GWFxT9LuKV2r6XnrtuUn6LEBjze+3i0cajunQmnJuFfjs8tNETGAfnQZh3xYFHIIoQPrdmvUF1yNnwFQm4snCLcVokmNajHZRWwO5sNiEEb+omW2se03oQbCHBhN4l/e0sAj8hKPVIXQDzgZdRYba4wWmxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GANCydmX55wDjt7mLBtgTSXhtDSD6lcm0RkfBpA69NE=;
 b=c8GhnyJmulRPLNdYxkAzyPmS3a+vlcGBeK5JHEhclec6S7SGNX7cF1QbbZzmIyRune8NYiO3SlHoVyLy31QjflMR52/4m2LFIrplls8PkcQz20kggJECY5IgxO/2j/CojBOWM3EgbFbZ7VQGUW5R6heLGv2jYcjTAvpDetCM1eqCRLWcStsKS/oNPmBuNsniZncVmA1vSNEiBkmGmYVAXUclotKVKmpChlbZ2dLc7A5V2p/+EJgPmNso8JQOa+2jTJVXM5ZTrhUtLOZTJOnsV/143A66VQqVNPqfPA0PE3OMIHHDpinwSJsUprBJMUXx0/Gh38+QGhyvQBC8YF0PmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GANCydmX55wDjt7mLBtgTSXhtDSD6lcm0RkfBpA69NE=;
 b=e9GHYiBJPrTndqtTRdr8BwNwbA/K6zM7lAZ6AOleBDNz5L6Z3gh+5HYPM0hiKK4QMbEjjzIWyh/D4HGWiRD7W1NpzN9WR9ughDzf7QAtKMXiyJzr9jH5AcZpCO4CwFkK/tnuKKO1NNCS2KY71Ww3LdJkdWuadMSn0f6Uhptre08=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB3755.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 16:00:48 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 16:00:48 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [RFC PATCH 2/2] ASoC: da732x: simplify code
Thread-Topic: [RFC PATCH 2/2] ASoC: da732x: simplify code
Thread-Index: AQHXIo2z1z47S5z30EGys1D2hqxR9Kq1275A
Date: Thu, 15 Apr 2021 16:00:48 +0000
Message-ID: <PR3PR10MB4142E8DBB9313E751DA52DD0804D9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
 <20210326221619.949961-3-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210326221619.949961-3-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 995abac7-2a30-4230-a461-08d90027a2bb
x-ms-traffictypediagnostic: PR3PR10MB3755:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB3755A89DBAE1E612A8399F3AA74D9@PR3PR10MB3755.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ixDbkLbd5HQBvVH+WOO4s9qigrn4Qun6KKSkFZr8GtH+KktxjZsHOXnvD9KQIaJBFrxyYqEJ80I6PPa7KNilJR0ZkFJ7jHRysIQWvaZipamRSKCUvI0vH7HjJJhSfWQWDjhYOJ+kkIpbs6mlqJprkMClR3A8D1vO5N8xi6H885gbnkdLglNmc2FH5JchcF7bdT45trzIaQmkCkLKUzgcwpPNG+imwk+ZA3iZfpaEyo5d6X8f4AI+rCezGX8aNBq9b/RK5TTJv9afNhXirVZ+dBl5j6PWtAAV/wjoPAc577Hib+oNyXrs+Rlpi4ICj7g1UfYDn8XwxeTlLTLDPhT3m4Q+OC/DvfG+KAqlyLw11ZdvO6jYRfvdGTX8sAy1x7nn8V9rOP+knAkGQZIZjfD4mn/iJsMEiBLtjafTpQ/ErnVXWwvBtErQdOYkY2Ca3AFkFPfyaNiaIvL1BNRl4ZpFFXItTUSfplQ8AODQAfSdbPEQOlE+HuXrPISzQS7i6EoTLkdbCRCHZuzamBgaBDFhY1IH0cYvneSgNSotDX7CLuCrQLvfGplG5POT4CaFpumFsb0xWgC/wA/KT1u3m8DJyuw+Ti0/NaQ+w+WCW7dAy1s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(316002)(64756008)(478600001)(66946007)(66556008)(66446008)(8936002)(55016002)(66476007)(4326008)(86362001)(52536014)(76116006)(186003)(71200400001)(9686003)(54906003)(5660300002)(8676002)(26005)(110136005)(38100700002)(6506007)(122000001)(7696005)(83380400001)(2906002)(53546011)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2HicwXJduM/TlOHNgIgs6kytx+CWNJF9fAct+qG/sAZgRvZI3XuDFs3DqM9r?=
 =?us-ascii?Q?h7fgnTQRt5RbyzDkq+jp8VK8E+fWpccuGa+Nh/iRsyb+KPDo3eEFQ8aNL9r3?=
 =?us-ascii?Q?5hlTG1O40PkhTWrcSCHMRn18UE8tJs6vmanRflhW8iVX8iySGJJcKfSL1gr0?=
 =?us-ascii?Q?TURKFpk1pTWvGSMy73Jj+G28nzqsOTwe+9iYVrJM6wGDgeHAOxqB0/ugaVns?=
 =?us-ascii?Q?gjnK4LQ9Kfs8uVwxBRm5cf1WZuq5V/Jq5ucUNjMPZAdcE/H20zSiWMzlqzHN?=
 =?us-ascii?Q?aEFl4u5FWMIQ5njNiw9yybmNn3QJZFc4C6XOgumr6iUOldpRkYbSxD0gy9sx?=
 =?us-ascii?Q?obQ1Afj+Cs71/ENPe/Fq5OlHvN3eaLIlLfsZzK3lxC8v/1dusw/Kwm866TXr?=
 =?us-ascii?Q?IFrkn2uZUSbeEs2AXl7bsBX2j7mb+uq5QJ9rJvE1YXVdEapA/5U8zpdWW7n1?=
 =?us-ascii?Q?QHQ9QOqq5k3K2gs86TzUIGN8PyDvlo09F/kKy+WR5cZ8Q7IFhBohty5D9Eb6?=
 =?us-ascii?Q?5QCOb1PllWwaTDElpxvyoi2YMPeClbzUqAeiZ7gl96eJCuR8jrSgku9mwk/v?=
 =?us-ascii?Q?t0+ZD/Q0jKZqctArXdHgsuX03exSWgSbayNdIaQpeeIL1JSPwQgV+beHtTXi?=
 =?us-ascii?Q?Ax8GH2wIGj5m3xlaxOMl7TeyZ4jXHMufoTwwffPL/KU24BnGXfIYKxRRJkcX?=
 =?us-ascii?Q?zf+GIX4RA0C2GroVxhfpL4sh9S7GaPdDhIlqutMKYO1HmhZMdcpD2ntcDo83?=
 =?us-ascii?Q?Zj6b8b8ewVvkUjzjdh54jevMcMxGYIVgYiDpn5XpWTHWA7ZJbGW3u+hm5Ay7?=
 =?us-ascii?Q?bQnTJAkPo3h/GiBYmHNfh39Xx/TpRvBAreapwwqzCukbQUdjoPzrSa4SIHrM?=
 =?us-ascii?Q?kmBp7OroMv9Lq0yHCcrL6NFKtZJCZ4K/R2mcTtcp7CIC1wRvPW3/AhKbiRo7?=
 =?us-ascii?Q?qdKhe+3wwSvfXvIoqW+KFaMHh5mw1mIunzv6Wdff2ATTqEkipVfH026azrh9?=
 =?us-ascii?Q?bwaXGd37QY5GapRWwpNmOUz03rA90jF/sgNDo7XhWTCgcf3IexcDjs8KAQHS?=
 =?us-ascii?Q?k2fn+gKeTshbLpOOGYKh6F8ZiOJqgLjYs7DZ8xl93AW9KVCVuzGHpyVl2QmG?=
 =?us-ascii?Q?AFh4P3uW1Zt7zJvMQ9olkcVQafLS4dBmI0QLUJhr4TO25L4WMD/GWzLAP7vP?=
 =?us-ascii?Q?CD3F46uecUm05ZABWSTM0OD3q9QfWtWZeNApWX0IxKukWA1TFMyYao3IarKY?=
 =?us-ascii?Q?W7VysbRJlmf+SaggcVUwBp6b2E59kztykDvdw1Ijimir1gqHb4Lt7ABzKZgt?=
 =?us-ascii?Q?IUCGEwiJCaeiorNoclDcarv7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 995abac7-2a30-4230-a461-08d90027a2bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 16:00:48.2142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d5EnvkyatrxYNVIj5uKNwTB/xeF1LNTKKHf4YGylrrMotzahZtrC3rFik/fS3FfLh8UMbpCkj480ATqiMc321lIvC9C9eJwu3POnpyKD59o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3755
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

On 26 March 2021 22:16, Pierre-Louis Bossart wrote:

> cppcheck reports a false positive:
>=20
> sound/soc/codecs/da732x.c:1161:25: warning: Either the condition
> 'indiv<0' is redundant or there is division by zero at line
> 1161. [zerodivcond]
>  fref =3D (da732x->sysclk / indiv);
>                         ^
> sound/soc/codecs/da732x.c:1158:12: note: Assuming that condition
> 'indiv<0' is not redundant
>  if (indiv < 0)
>            ^
> sound/soc/codecs/da732x.c:1161:25: note: Division by zero
>  fref =3D (da732x->sysclk / indiv);
>                         ^
>=20
> The code is awfully convoluted/confusing and can be simplified with a
> single variable and the BIT macro.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> ---

Apologies for the delay in getting to this. The change looks fine to me,
although this part was EOL some time back, and I find it hard to believe an=
yone
out there has a board with this on. Wondering if it would make sense to rem=
ove
the driver permanently?

For the change at hand though:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>  sound/soc/codecs/da732x.c | 17 ++++++-----------
>  sound/soc/codecs/da732x.h | 12 ++++--------
>  2 files changed, 10 insertions(+), 19 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
> index d43ee7159ae0..42d6a3fc3af5 100644
> --- a/sound/soc/codecs/da732x.c
> +++ b/sound/soc/codecs/da732x.c
> @@ -168,30 +168,25 @@ static const struct reg_default da732x_reg_cache[] =
=3D {
>  static inline int da732x_get_input_div(struct snd_soc_component *compone=
nt,
> int sysclk)
>  {
>  	int val;
> -	int ret;
>=20
>  	if (sysclk < DA732X_MCLK_10MHZ) {
> -		val =3D DA732X_MCLK_RET_0_10MHZ;
> -		ret =3D DA732X_MCLK_VAL_0_10MHZ;
> +		val =3D DA732X_MCLK_VAL_0_10MHZ;
>  	} else if ((sysclk >=3D DA732X_MCLK_10MHZ) &&
>  	    (sysclk < DA732X_MCLK_20MHZ)) {
> -		val =3D DA732X_MCLK_RET_10_20MHZ;
> -		ret =3D DA732X_MCLK_VAL_10_20MHZ;
> +		val =3D DA732X_MCLK_VAL_10_20MHZ;
>  	} else if ((sysclk >=3D DA732X_MCLK_20MHZ) &&
>  	    (sysclk < DA732X_MCLK_40MHZ)) {
> -		val =3D DA732X_MCLK_RET_20_40MHZ;
> -		ret =3D DA732X_MCLK_VAL_20_40MHZ;
> +		val =3D DA732X_MCLK_VAL_20_40MHZ;
>  	} else if ((sysclk >=3D DA732X_MCLK_40MHZ) &&
>  	    (sysclk <=3D DA732X_MCLK_54MHZ)) {
> -		val =3D DA732X_MCLK_RET_40_54MHZ;
> -		ret =3D DA732X_MCLK_VAL_40_54MHZ;
> +		val =3D DA732X_MCLK_VAL_40_54MHZ;
>  	} else {
>  		return -EINVAL;
>  	}
>=20
>  	snd_soc_component_write(component, DA732X_REG_PLL_CTRL, val);
>=20
> -	return ret;
> +	return val;
>  }
>=20
>  static void da732x_set_charge_pump(struct snd_soc_component *component,
> int state)
> @@ -1158,7 +1153,7 @@ static int da732x_set_dai_pll(struct
> snd_soc_component *component, int pll_id,
>  	if (indiv < 0)
>  		return indiv;
>=20
> -	fref =3D (da732x->sysclk / indiv);
> +	fref =3D da732x->sysclk / BIT(indiv);
>  	div_hi =3D freq_out / fref;
>  	frac_div =3D (u64)(freq_out % fref) * 8192ULL;
>  	do_div(frac_div, fref);
> diff --git a/sound/soc/codecs/da732x.h b/sound/soc/codecs/da732x.h
> index c5af17ee1516..c2f784c3f359 100644
> --- a/sound/soc/codecs/da732x.h
> +++ b/sound/soc/codecs/da732x.h
> @@ -48,14 +48,10 @@
>  #define	DA732X_MCLK_20MHZ		20000000
>  #define	DA732X_MCLK_40MHZ		40000000
>  #define	DA732X_MCLK_54MHZ		54000000
> -#define	DA732X_MCLK_RET_0_10MHZ		0
> -#define	DA732X_MCLK_VAL_0_10MHZ		1
> -#define	DA732X_MCLK_RET_10_20MHZ	1
> -#define	DA732X_MCLK_VAL_10_20MHZ	2
> -#define	DA732X_MCLK_RET_20_40MHZ	2
> -#define	DA732X_MCLK_VAL_20_40MHZ	4
> -#define	DA732X_MCLK_RET_40_54MHZ	3
> -#define	DA732X_MCLK_VAL_40_54MHZ	8
> +#define	DA732X_MCLK_VAL_0_10MHZ		0
> +#define	DA732X_MCLK_VAL_10_20MHZ	1
> +#define	DA732X_MCLK_VAL_20_40MHZ	2
> +#define	DA732X_MCLK_VAL_40_54MHZ	3
>  #define	DA732X_DAI_ID1			0
>  #define	DA732X_DAI_ID2			1
>  #define	DA732X_SRCCLK_PLL		0
> --
> 2.25.1

