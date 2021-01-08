Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226622EF078
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 11:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A647416C7;
	Fri,  8 Jan 2021 11:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A647416C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610100756;
	bh=QRqNt8x1+y4xYoRzSvCVB4uP9ukwicbN1jhwOW0/XnU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADLGB8QLuTGHGFoUJpGA69v+ZZCSikCvDz1vAkVeQyVxkWxaqQ+UCce5pmQzX+dAJ
	 3dDC2E4I6OFoZIOdzJsjkd80YAUsGFgzNGEG/U231QRjwAz3+oXbd1FRFndLwCP6lv
	 418RrujFE1DPNJ65lhqGaayjDqLvooEdFAPiHtH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F06F800E9;
	Fri,  8 Jan 2021 11:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF41F80165; Fri,  8 Jan 2021 11:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D73BF800EE
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 11:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D73BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="J8B9LsKK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgNPLQ86rRtUqxsV/2K4n9WTGSkZnJd5mHfy6rWQFu6mJdaUorq/2uaUyApy+hIG7lr4UAhGRAuhJNpZ2d4t360axjUXMqKrWWRXWiHTXB0z5/KebpnT9utaCKWy0cEft0vSFmLVm5R3MwUF5QN9Br6MBVcyctPqJBNNHenbedRmY22D3eZDLM12v2GlTVMpL3PHBuNT7tH2OjFLHxL0zF1IeqHBN0HacWSxOmCyqupU8lofwq1kCRUPRJ13i57GNVgzHFumpwnDjPlFyoGzvC1uMPCu1B2jeVyoWw/NvgRdPQXTAV85om1qJ53D5hAbcDK7QqLcD0WlgIZvk7T9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljvci8konXR+vSyQ3m/zUebZmRbH+rUqp8Rlf3o7F4U=;
 b=Ol6C813IU9jXr1oFGzG5vIAvEpIEVrANRxyrv9FGS0uPSFKhlug4r2u4IRqo3tLGDDyKnW7jqCS+3ldPEpX553BinW9Cpv1WiHs3I3J7LAZaTEtg8h3PKtjSNkQqXDA+Hmi7FZV7t928VsQnIkP0Ec7d6ISPtVFAKOfzWy3kNi+zJK8fZpjotExpunG7DmUkEoGq3u/ug26yTnGvtn7zEB0KonooFlZ9gd9CLNSWjSxt3Jtu23vWiAFvWZ5BES04IgFXRgkkZPhWBOQZkd4fByso9EVzlW/cEqqvZiXuQ7AZhnPY2XFJwW5SJ+XjNEudveV35dJqYWTW2vI5g8CJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljvci8konXR+vSyQ3m/zUebZmRbH+rUqp8Rlf3o7F4U=;
 b=J8B9LsKKt/E2DabM9s9THOVeZ5BQN4viH8hhN1/yFkUp2oIBYjMkJGnvYiGRSVZFA9vskXVZZ2UuRB2A+LZ8HQDWSk1whgHRk9AtqmJ9rcb0IXc+fHQFeQwp4qKJz46mNKp4nAOzwKtrx/MlByFe8PB7S00aaIpOeQ2x/lLme5c=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PAXPR10MB4639.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 10:10:44 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d4e:b196:aa2b:8890]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d4e:b196:aa2b:8890%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 10:10:43 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Xu Wang <vulab@iscas.ac.cn>, Support Opensource
 <Support.Opensource@diasemi.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: codecs: da*: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Thread-Topic: [PATCH] ASoC: codecs: da*: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Thread-Index: AQHW5Zu7Ghmmvn75wEGVXRkKptFq8aodfyaw
Date: Fri, 8 Jan 2021 10:10:43 +0000
Message-ID: <PR3PR10MB41424697CF78E4F06FF9154480AE0@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210108085319.6912-1-vulab@iscas.ac.cn>
In-Reply-To: <20210108085319.6912-1-vulab@iscas.ac.cn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: iscas.ac.cn; dkim=none (message not signed)
 header.d=none;iscas.ac.cn; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a76525-99e7-45bc-2455-08d8b3bda913
x-ms-traffictypediagnostic: PAXPR10MB4639:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PAXPR10MB463940F67823C4FFC858C5A7A7AE0@PAXPR10MB4639.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JjIUzr54ydtLx97eCPc0jLRwu6APrihzxMpxZr68NxNFlgLc5fvYsThVn8GmKCcHhdywRQy8DqX08cK7Y+I0d1fQQWukfR9E/Fn2RMYfGM+zZY5KoarwROwJgPaY9/e2Fj+z8En/yHX6dtWllNZSKMn5+KN+DQ+SjCWD3/Zyi5NndaI+ZKDqX+OWjjPSA8wBe7hK9Z74nEvyzA+sbhGQ9eaJLSQy58bycAKL8fc+PxQtSzLZxF7458xkhR3+XMGWNR/GP41NRHcKpK56uLJb97fvW+kwcTIkzvjjln/sTpBoDQ3LUmBVBW80kYMknVJJejgiZu4zgmrQ+6VMfPE+cx7GEFaxHomxytpuzu0LEhQ69n0rhYcT2+80bADFB3PB2xYQNBNG1Sxh8/dZecG3zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(478600001)(66476007)(5660300002)(86362001)(8676002)(53546011)(83380400001)(4326008)(8936002)(66446008)(7696005)(6506007)(33656002)(66556008)(316002)(110136005)(52536014)(64756008)(9686003)(55016002)(186003)(66946007)(71200400001)(2906002)(76116006)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?akD33bSiFx+YsbGUVGsxfmf92r1k3mUrEddO4/jzYzJhujQqtp/7CBHD6m4Q?=
 =?us-ascii?Q?bHJ2EUY2q/Y9WTV3RRdhSsi6cPm3upTiRBfG/8wMjhOQWRV982T8XuQpYGWT?=
 =?us-ascii?Q?uL5MBHxRPpHr+ubTb6bCk4eWjCBtnZa42aTBPZuNZ5dd4BTBO3kAbmp6gZRd?=
 =?us-ascii?Q?F0FoVw1ioq5crnkRjxbRE/J4gYpXCMCJ4muqcPiNcZ/ljR60Fx++hvuT9som?=
 =?us-ascii?Q?a/twTTY1/wKVtSOX3p6WS806QAic6pIpSMJAUsq16eduF10xJaub7ka9uaoB?=
 =?us-ascii?Q?oCbfGNzvFH1qcteBUEMTUXuMmBNKHZwoQjEQZmxyn9HnynLxQ0mU9k1gbytv?=
 =?us-ascii?Q?PQxtzXfBAtWEuWv4k+V/wdrVU03mZ4SrafdNKPT/LEVgX6rM5E0iyZHIyZW1?=
 =?us-ascii?Q?1tCxLaKtZkI+CKpfWpFpem1nzZQDERTTWPkrpHLmB1z3ogEGX2Pt6QlGCOHN?=
 =?us-ascii?Q?cNjdmg08CEqidrfy5KJNQr7kybCsF93oN8oTg5imH0AIlRKQ9OwWpOmMkLJW?=
 =?us-ascii?Q?sUCMrX/Oo7DOjmQ+SrzScx16+SyEFO+Y5HQWQEWtELVB4UgGmvgVsT7KSQAV?=
 =?us-ascii?Q?/uwZnvMta9HGhRooV84nj2sGifKAY5oknjzqa7hMYcnpfuNGy/fZf9iq5/FR?=
 =?us-ascii?Q?dIiGjc6gqltXhY2bVsbwSQa3R1cPDfoHX1Z8CmBHbFmd8tUPSJn8u2FxWFtO?=
 =?us-ascii?Q?iS0hwQgKnM2YJ20wvTfuh616lplHDi8d97eG+BuDDZ+z4n5oK3s/Ir6+9Dzh?=
 =?us-ascii?Q?hodZ5rTWftXjbvXvV+HUaizpjbvm2sligZ+iu0vzBQjyrZYhnsXCM9J8iCft?=
 =?us-ascii?Q?yiQtUC2QuHd1ARx2h0RJhZqmLZHhr0BsomMGWg3zSjjh/ikEvknUsV88PvXi?=
 =?us-ascii?Q?pNQ2DUHFrzfORyogKv3RY/R+JXWRjeJeCVQJrnVURMiicuCFCUdGN/q/jhsK?=
 =?us-ascii?Q?yBN6KA42q8iMEsJ4Y2zjmC0CxuP0Do4kR58rOKSB6wA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a76525-99e7-45bc-2455-08d8b3bda913
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 10:10:43.8863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mxzn7lXbBF3mUic5GjCPzXsEE9x20t2qtdlWQbMxB8WW2X9mO+OGZgHWgh+A6I4BkdDMzk+UnUrFl1rrT+IGi558peLnvN0lr0/Mxf8mkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4639
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 08 January 2021 08:53, Xu Wang wrote:

> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  sound/soc/codecs/da7218.c     | 13 +++++--------
>  sound/soc/codecs/da7219-aad.c | 19 ++++++++-----------
>  sound/soc/codecs/da7219.c     |  3 +--
>  3 files changed, 14 insertions(+), 21 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
> index 2bfafbe9e3dc..324d95e3b48a 100644
> --- a/sound/soc/codecs/da7218.c
> +++ b/sound/soc/codecs/da7218.c
> @@ -2582,12 +2582,10 @@ static int da7218_set_bias_level(struct
> snd_soc_component *component,
>  	case SND_SOC_BIAS_PREPARE:
>  		/* Enable MCLK for transition to ON state */
>  		if (snd_soc_component_get_bias_level(component) =3D=3D
> SND_SOC_BIAS_STANDBY) {
> -			if (da7218->mclk) {
> -				ret =3D clk_prepare_enable(da7218->mclk);
> -				if (ret) {
> -					dev_err(component->dev, "Failed to
> enable mclk\n");
> -					return ret;
> -				}
> +			ret =3D clk_prepare_enable(da7218->mclk);
> +			if (ret) {
> +				dev_err(component->dev, "Failed to enable
> mclk\n");
> +				return ret;
>  			}
>  		}
>=20
> @@ -2605,8 +2603,7 @@ static int da7218_set_bias_level(struct
> snd_soc_component *component,
>  					    DA7218_LDO_EN_MASK);
>  		} else {
>  			/* Remove MCLK */
> -			if (da7218->mclk)
> -				clk_disable_unprepare(da7218->mclk);
> +			clk_disable_unprepare(da7218->mclk);
>  		}
>  		break;
>  	case SND_SOC_BIAS_OFF:
> diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.=
c
> index 48081d71c22c..fa61cfc8e50c 100644
> --- a/sound/soc/codecs/da7219-aad.c
> +++ b/sound/soc/codecs/da7219-aad.c
> @@ -123,15 +123,13 @@ static void da7219_aad_hptest_work(struct work_stru=
ct
> *work)
>  	mutex_lock(&da7219->pll_lock);
>=20
>  	/* Ensure MCLK is available for HP test procedure */
> -	if (da7219->mclk) {
> -		ret =3D clk_prepare_enable(da7219->mclk);
> -		if (ret) {
> -			dev_err(component->dev, "Failed to enable mclk -
> %d\n", ret);
> -			mutex_unlock(&da7219->pll_lock);
> -			mutex_unlock(&da7219->ctrl_lock);
> -			snd_soc_dapm_mutex_unlock(dapm);
> -			return;
> -		}
> +	ret =3D clk_prepare_enable(da7219->mclk);
> +	if (ret) {
> +		dev_err(component->dev, "Failed to enable mclk - %d\n", ret);
> +		mutex_unlock(&da7219->pll_lock);
> +		mutex_unlock(&da7219->ctrl_lock);
> +		snd_soc_dapm_mutex_unlock(dapm);
> +		return;
>  	}
>=20
>  	/*
> @@ -318,8 +316,7 @@ static void da7219_aad_hptest_work(struct work_struct
> *work)
>  		da7219_set_pll(component, DA7219_SYSCLK_MCLK, 0);
>=20
>  	/* Remove MCLK, if previously enabled */
> -	if (da7219->mclk)
> -		clk_disable_unprepare(da7219->mclk);
> +	clk_disable_unprepare(da7219->mclk);
>=20
>  	mutex_unlock(&da7219->pll_lock);
>  	mutex_unlock(&da7219->ctrl_lock);
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index e9b45daec0ca..50307cc9d640 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -1826,8 +1826,7 @@ static int da7219_set_bias_level(struct
> snd_soc_component *component,
>=20
>  		if (snd_soc_component_get_bias_level(component) =3D=3D
> SND_SOC_BIAS_PREPARE) {
>  			/* Remove MCLK */
> -			if (da7219->mclk)
> -				clk_disable_unprepare(da7219->mclk);
> +			clk_disable_unprepare(da7219->mclk);

You seem to have missed the change for clk_prepare_enable() usage in the
same function. Also as the above is now a single line if statement, you can
remove the brackets.

In addition, the normal approach would be to split the changes into separat=
e
patches per driver, just so it's cleaner.

>  		}
>  		break;
>  	case SND_SOC_BIAS_OFF:
> --
> 2.17.1

