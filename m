Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB12137F7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D571916D2;
	Fri,  3 Jul 2020 11:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D571916D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593769569;
	bh=H7YT9B/7VwlQuN7F2GLTctohoWcjqx+VLNi1YeMI7/g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxCoimhbxRvmbhaKZPvHl42QTE9W/SbBP8GnV7P6Rg8H8v13DISmlNkl8rhmmIH4+
	 Mp2kXqVD0fguQw0uJzBmeil3CpoJ5FFDMv0E80N1/ak6ICDMqfg13Wq8bJNkY8TSUL
	 C55G0zmPVvc/pqHox1ScCCTYtDOEA2jYPR/GcS0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C53F8020C;
	Fri,  3 Jul 2020 11:44:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63D98F80217; Fri,  3 Jul 2020 11:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50040.outbound.protection.outlook.com [40.107.5.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A13CF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A13CF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="vVtAxyry"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y04DX7nbx3eXiTCgUJgB0K3+exVdmGeXMI+AOK3HEAMORCKkCrU35l1FbYvCyocKsPMhKjo0XvdQGZo9p10lTsjlICy0+QEhLuW4VEmqdCXViAsEPgvxe27KytKjAQVojC2MnZNT+Z2vw49qKuWzNRfC6VhwbAY8V0s4A2lKPGa5BVPVt+a06Pap28bniOksfqCm3x25kHcZ2EopASxVb5HkGxwzuwzoSekh6M0e1w0gmMQSVy6zwuV2/v4ap/4e5lxZ2/A1h37RQxTPYh40ZGVVUrxoK+9fBa1/tU+pm/NxPPiswqKZAsCK47nnWuX21A1EjQnDDNSgR86zCBU03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTzVqH9zBEZ7uWr1xQjfIJ4eeKbVgfRQNN+g+nal6e4=;
 b=O1ByNDyhQakMfbXiKa37ZlER9LeoH8hlfWUloomCmzDBBIK6UsG9YRwBfBqMXailtnhrAP83Zki9J108bMJHk5nUb96SzwIw+zSxW03germKKiTo5T0kCisrx/WqAk2HaEh91cE2b0oizvCWUkPT81kDSF5DEdQ8yysTmcC6ipPswUQ73q8e6KpJZvuuW0X7KdKYCE8m+LNNQ2bRVoWShEd9xr+iqYjkAAQ1SbAdWiZ3j+X5bBu8C+6d9MNYZxardBuuYtyRMo9MKJTF/x7R1AQJH+aG/UajxBnCDPQmyQfyv58geiraASfTrSGCrhYWwuJHdPzmyh6CzThr+EB8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTzVqH9zBEZ7uWr1xQjfIJ4eeKbVgfRQNN+g+nal6e4=;
 b=vVtAxyryRaPb3DsnES02pb7MLzscr/MpmvVSxhSj0OQxudZawSPlgJQaOZEvhhKKXEWk+AYQNPMPqaiCUo0OVN0bmvJiURxqRRQ4YaV4h6mRkIzP3MxcrSbjyBF88jFlh3MofGc/ZEB618hE0FVTuR5KRExYXXRwRlsVhIBEhl0=
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:65::9)
 by DB6PR1001MB1350.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 09:44:17 +0000
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5]) by DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5%10]) with mapi id 15.20.3131.029; Fri, 3 Jul 2020
 09:44:17 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Subject: RE: [PATCHv4] ASoC: da7213: add default clock handling
Thread-Topic: [PATCHv4] ASoC: da7213: add default clock handling
Thread-Index: AQHWUR6FyRPb3HyZQUmB0DL/ZWyqfg==
Date: Fri, 3 Jul 2020 09:44:17 +0000
Message-ID: <DB6PR1001MB10965E5BDA9B3EF570B607A4806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
References: <AM6PR10MB2263094DD176499308EC8B2A80B80@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <20200626164623.87894-1-sebastian.reichel@collabora.com>
In-Reply-To: <20200626164623.87894-1-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 927623c9-0123-46c9-3be7-08d81f35a7a4
x-ms-traffictypediagnostic: DB6PR1001MB1350:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR1001MB135038B59B41BB7360AEA047A76A0@DB6PR1001MB1350.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X6N4bS+oX0pTx/F3LskPGgzAbdcMmoukeyNdOveUtjXjRp9IoY0y7qhczsSN4vKfssflaQrlddUlFexr7stn5VY9mXO6l/As9jHRDIiUfjensKauHMBeH9M/pEwjF+u55sIWu1A+AZCc74PMxBTAkEq4FQl1v7NBUJjNfEjYf6JQoE1/nPROBywnz3ogHmeLIxLHMwS+hXUN3duYX9n1Gua+0pTePaBQyY2T85hTioNhMpYLVhcYqZXDoTaYERdo3xdU5aDi9FciEhs8iqHcujj54LKaw+mcFg/BNWbNEG3TkwgrKFZSDk8yT2Bn3ill
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(186003)(6506007)(83380400001)(86362001)(55016002)(8936002)(8676002)(478600001)(54906003)(316002)(33656002)(110136005)(9686003)(2906002)(7696005)(55236004)(53546011)(4326008)(26005)(66476007)(66556008)(66446008)(64756008)(52536014)(76116006)(71200400001)(5660300002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PCvHg78PKtxSv65yGroM77GWyJmwaNUQ78+gZNCx4uYft/fiK+/1od48UBP5r03K5UiAzRRYERnw6tHWQjUSMItyxy34ci6wBmad1l2bVyRlNvJM1JiVBE+kYpsj5cvuZ+Tcih6D8BTT2m/sfnrSZ7YVP7hfdzQmnQxC2riyOZcMvM2n2LYrxa+fqyNeXFGNpfzKPVULPnp1MoJIniG6kH9yqz9fFGu6ORadofCIDzpmH8XXtjevvXun2ZBjuRDmrIKAxPyTE5MW/noubxA3WP8UFM9Psh83HqtokH4dv9rKH3QB6Od2DqCbRamsiBNesKZLis8RMiQ5U1K4PtelGKPR5eOtWoetCs/wTnq4wI7wKSBSPWgBq6AkT6v8H40av7ckXJDbfgv5UI2I1VM3+9/RxUqMnQWEM744Lh2vOzCsS3xf49hXt596LdUg5Cm+ETtmYLAMdx49U/XnuJsVJtjGAItFT5l3D+e3fwRUzG0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 927623c9-0123-46c9-3be7-08d81f35a7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:44:17.7701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdXb+jQESX0V15/bOUd9EpeEyk6qZmVZUCtyrBM7aKI9I1EqPfC9MuzYNga8UkTT1Ltvu9UZy99Xa4RZZLabjgBAYbgyncseiNsisCJ5R54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1350
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "kernel@collabora.com" <kernel@collabora.com>
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

On 26 June 2020 17:46, Sebastian Reichel wrote:

> This adds default clock/PLL configuration to the driver
> for usage with generic drivers like simple-card for usage
> with a fixed rate clock.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Looks good. Thanks for the work here.

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes since PATCHv3:
>  * rebase to v5.8-rc1
>  * add SRM support for usage in slave mode with simple-card.
>    I only tested with master mode, though.
> ---
>  sound/soc/codecs/da7213.c | 83
> ++++++++++++++++++++++++++++++++++++---
>  sound/soc/codecs/da7213.h |  2 +
>  2 files changed, 80 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 3e6ad996741b..1a4fece20bcd 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1156,6 +1156,7 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  			    struct snd_soc_dai *dai)
>  {
>  	struct snd_soc_component *component =3D dai->component;
> +	struct da7213_priv *da7213 =3D
> snd_soc_component_get_drvdata(component);
>  	u8 dai_ctrl =3D 0;
>  	u8 fs;
>=20
> @@ -1181,33 +1182,43 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  	switch (params_rate(params)) {
>  	case 8000:
>  		fs =3D DA7213_SR_8000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 11025:
>  		fs =3D DA7213_SR_11025;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 12000:
>  		fs =3D DA7213_SR_12000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 16000:
>  		fs =3D DA7213_SR_16000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 22050:
>  		fs =3D DA7213_SR_22050;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 32000:
>  		fs =3D DA7213_SR_32000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 44100:
>  		fs =3D DA7213_SR_44100;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 48000:
>  		fs =3D DA7213_SR_48000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 88200:
>  		fs =3D DA7213_SR_88200;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 96000:
>  		fs =3D DA7213_SR_96000;
> +		da7213->out_rate =3D DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -1392,9 +1403,9 @@ static int da7213_set_component_sysclk(struct
> snd_soc_component *component,
>  }
>=20
>  /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
> -static int da7213_set_component_pll(struct snd_soc_component *component,
> -				    int pll_id, int source,
> -				    unsigned int fref, unsigned int fout)
> +static int _da7213_set_component_pll(struct snd_soc_component
> *component,
> +				     int pll_id, int source,
> +				     unsigned int fref, unsigned int fout)
>  {
>  	struct da7213_priv *da7213 =3D
> snd_soc_component_get_drvdata(component);
>=20
> @@ -1503,6 +1514,16 @@ static int da7213_set_component_pll(struct
> snd_soc_component *component,
>  	return 0;
>  }
>=20
> +static int da7213_set_component_pll(struct snd_soc_component *component,
> +				    int pll_id, int source,
> +				    unsigned int fref, unsigned int fout)
> +{
> +	struct da7213_priv *da7213 =3D
> snd_soc_component_get_drvdata(component);
> +	da7213->fixed_clk_auto_pll =3D false;
> +
> +	return _da7213_set_component_pll(component, pll_id, source, fref,
> fout);
> +}
> +
>  /* DAI operations */
>  static const struct snd_soc_dai_ops da7213_dai_ops =3D {
>  	.hw_params	=3D da7213_hw_params,
> @@ -1532,6 +1553,50 @@ static struct snd_soc_dai_driver da7213_dai =3D {
>  	.symmetric_rates =3D 1,
>  };
>=20
> +static int da7213_set_auto_pll(struct snd_soc_component *component, bool
> enable)
> +{
> +	struct da7213_priv *da7213 =3D
> snd_soc_component_get_drvdata(component);
> +	int mode;
> +
> +	if (!da7213->fixed_clk_auto_pll)
> +		return 0;
> +
> +	da7213->mclk_rate =3D clk_get_rate(da7213->mclk);
> +
> +	if (enable) {
> +		/* Slave mode needs SRM for non-harmonic frequencies */
> +		if (da7213->master)
> +			mode =3D DA7213_SYSCLK_PLL;
> +		else
> +			mode =3D DA7213_SYSCLK_PLL_SRM;
> +
> +		/* PLL is not required for harmonic frequencies */
> +		switch (da7213->out_rate) {
> +		case DA7213_PLL_FREQ_OUT_90316800:
> +			if (da7213->mclk_rate =3D=3D 11289600 ||
> +			    da7213->mclk_rate =3D=3D 22579200 ||
> +			    da7213->mclk_rate =3D=3D 45158400)
> +				mode =3D DA7213_SYSCLK_MCLK;
> +			break;
> +		case DA7213_PLL_FREQ_OUT_98304000:
> +			if (da7213->mclk_rate =3D=3D 12288000 ||
> +			    da7213->mclk_rate =3D=3D 24576000 ||
> +			    da7213->mclk_rate =3D=3D 49152000)
> +				mode =3D DA7213_SYSCLK_MCLK;
> +
> +			break;
> +		default:
> +			return -1;
> +		}
> +	} else {
> +		/* Disable PLL in standby */
> +		mode =3D DA7213_SYSCLK_MCLK;
> +	}
> +
> +	return _da7213_set_component_pll(component, 0, mode,
> +					 da7213->mclk_rate, da7213->out_rate);
> +}
> +
>  static int da7213_set_bias_level(struct snd_soc_component *component,
>  				 enum snd_soc_bias_level level)
>  {
> @@ -1551,6 +1616,8 @@ static int da7213_set_bias_level(struct
> snd_soc_component *component,
>  						"Failed to enable mclk\n");
>  					return ret;
>  				}
> +
> +				da7213_set_auto_pll(component, true);
>  			}
>  		}
>  		break;
> @@ -1562,8 +1629,10 @@ static int da7213_set_bias_level(struct
> snd_soc_component *component,
>  					    DA7213_VMID_EN | DA7213_BIAS_EN);
>  		} else {
>  			/* Remove MCLK */
> -			if (da7213->mclk)
> +			if (da7213->mclk) {
> +				da7213_set_auto_pll(component, false);
>  				clk_disable_unprepare(da7213->mclk);
> +			}
>  		}
>  		break;
>  	case SND_SOC_BIAS_OFF:
> @@ -1693,7 +1762,6 @@ static struct da7213_platform_data
>  	return pdata;
>  }
>=20
> -
>  static int da7213_probe(struct snd_soc_component *component)
>  {
>  	struct da7213_priv *da7213 =3D
> snd_soc_component_get_drvdata(component);
> @@ -1829,6 +1897,11 @@ static int da7213_probe(struct snd_soc_component
> *component)
>  			return PTR_ERR(da7213->mclk);
>  		else
>  			da7213->mclk =3D NULL;
> +	} else {
> +		/* Do automatic PLL handling assuming fixed clock until
> +		 * set_pll() has been called. This makes the codec usable
> +		 * with the simple-audio-card driver. */
> +		da7213->fixed_clk_auto_pll =3D true;
>  	}
>=20
>  	return 0;
> diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> index 3890829dfb6e..97ccf0ddd2be 100644
> --- a/sound/soc/codecs/da7213.h
> +++ b/sound/soc/codecs/da7213.h
> @@ -535,10 +535,12 @@ struct da7213_priv {
>  	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
>  	struct clk *mclk;
>  	unsigned int mclk_rate;
> +	unsigned int out_rate;
>  	int clk_src;
>  	bool master;
>  	bool alc_calib_auto;
>  	bool alc_en;
> +	bool fixed_clk_auto_pll;
>  	struct da7213_platform_data *pdata;
>  };
>=20
> --
> 2.27.0

