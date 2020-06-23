Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D82055B3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 17:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F35B1797;
	Tue, 23 Jun 2020 17:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F35B1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592925745;
	bh=E/nc66IegP7/o5a2+WMPgrc5ETVzGV4bY7cPM5dI77o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZdL7z4xyVA9umm92ak0A1VAdgb0aYCpKwuvRBP3wBugjjpiqJhGphNkCbvl1Iqr9y
	 IKqXp6mDuUMfo+pYbJF1MPhpJPPNHi/6TjqI5/3jn3P76c5jiy0WBgEw4UonRVMHP/
	 N+OPxa6XUNvopEUZLDnE41AwXLQWBpTV6fBlKeHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F6CF8010E;
	Tue, 23 Jun 2020 17:20:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E86F80234; Tue, 23 Jun 2020 17:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59004F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59004F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Qk03Aj5d"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="D16Xzzdl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NFHG35013141; Tue, 23 Jun 2020 10:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=ofxRFUfbM74nRwIU+OyKzyyEJ1ck9+rNojmU8507RT4=;
 b=Qk03Aj5diTbfLPvIP0G+4O67iSAdA0cJ2APZUot6J/HhXNzCmCgge4HObDqycOT8ua0x
 LDJTcMaMxS+YytVwtnpDQ8cqbfYWM775tqUuZvHdOnleAD1IUxiQQlpG/HSz72EL295J
 IktTCD7H4iUc4wrcn5jbnCFgqJt6HXvQuIda6aIpLsFypcT4s6NSAriMJ8052LuvPzMy
 lUGHDXbLUDHj0e9BvTezYJlIrCAVK/FlywnqTU0HYMqbXURAJotlrFXWkFll/HVLp/tu
 etKlBCiOh8eAp7Dqc7BUXHs0VlyHGWX6r3iHqfRH70JRqvYsRF/AxGSLtrej8snuvVXQ Kg== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=James.Schulman@cirrus.com
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0b-001ae601.pphosted.com with ESMTP id 31uk37g45d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 10:20:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD0cwPUbaDljAMjiP6Zh9sfIn5Sm2+2YY+972TufCGHj30qRBBnwHLwnC3+W2t32S9xl3Y6brQQwUPDHU0sLakWh8VWs/gAnG1Z0U1uZKq0JTB7XShrUru9Bx0AXwSaQrVcIQi8cf+v7Z1pHKlWWkPHkVWFNpWvqAvzVyxxQ5eXeHWm+FpqnQP+b4NH9FIfLXIR13waKDpHRSdM1NL40Q9tUCC3BV1AobYu0uCzN4cLLjTcaHAj7tVu8/PGpwxc15CSUNfGQH+pyoE5F76+cDwUk2aqNRTJgYgaGREYAPMmNl/1sPgbNg4h1yBEbqciGhuGK8armk33JdRiuFEWsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofxRFUfbM74nRwIU+OyKzyyEJ1ck9+rNojmU8507RT4=;
 b=GyBd+FiIWwmYDADmRWsIEH0g+ArX3AhweoRICDXyjplHOwiGj8cjvVTEzt4ZmqQJJZ/07bakTRHFqZFrZ2vtLA7MsWzyjI2N7ty9/a2sqHZFCf/7/ErPiPH9OxNFQGDtGK6cRmEwX1QFP33TW4e8gngVILaugQJrOMYalG1g5yAJVkCCzz6HowV4Z6rx77OrpBAWz0kqW82lUdrqzVfOsUJl3yy0GUIjVaL5fbEUFox76ujNqCF3Ge41DyleqAfmoInUpZ9jTxj7cj1hPTtjA8c8rWsqFUnFzT9XbPiP+qaJLQ2A6Wxp5dlcwTzGzJ9mOCeDBndzSJcgM5GSPa9GDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofxRFUfbM74nRwIU+OyKzyyEJ1ck9+rNojmU8507RT4=;
 b=D16XzzdloSu3FWXN4ocwpXJXreFGAYw/jW2yDfQZ2EypLxTLR10xZz5rVmHOpjzKSHK9IFPEaGj+bZ7aWpxjDt2CTT9+1rqr7rdWTzrxOXhd4F1vT5EaClJ1/pe5v+yUKhN80Pc3D4+KCUc7R9MQKbK9EmtRRDorkOcAp+/Lpfs=
Received: from SN6PR19MB2381.namprd19.prod.outlook.com (2603:10b6:805:64::29)
 by SA0PR19MB4206.namprd19.prod.outlook.com (2603:10b6:806:85::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 15:20:28 +0000
Received: from SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::85f0:2087:7a34:9aab]) by SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::85f0:2087:7a34:9aab%5]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 15:20:28 +0000
From: "Schulman, James" <James.Schulman@cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 16/19] ASoC: codecs: cs*: merge .digital_mute() into
 .mute_stream()
Thread-Topic: [PATCH 16/19] ASoC: codecs: cs*: merge .digital_mute() into
 .mute_stream()
Thread-Index: AQHWSXHTRhwiAmu9zUyf3In585+VfA==
Date: Tue, 23 Jun 2020 15:20:28 +0000
Message-ID: <alpine.DEB.2.21.2006231019470.21024@james-tower>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=cirrus.com;
x-originating-ip: [69.219.168.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea4b0de7-4af0-4d63-6951-08d81788f62d
x-ms-traffictypediagnostic: SA0PR19MB4206:
x-microsoft-antispam-prvs: <SA0PR19MB4206FC060B68BDBDA70ACB97E4940@SA0PR19MB4206.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 017I0FH+OOC4KmU+T5glsroab8OQ61xYg7DTn+8AVxK1x+HlENPDRHJjxKnUIQhC+ruqv4WDhnrlftRdYXjuhRiCFMIbexZNLv4sFdG8uV3SnpdwqNwcL5l29wpv/1q3qvcNpddzkDx0evMJnoCd7dRUXYajkhRBMJf3Ol4PbHOAPGLbgn1uiCjWnb5T42OTi4uABkDU84yZMrg01RoHRZ4p1z3ZYO3bmL4oOdwasqOzvfMlbjTUyjPyWoe0XfoIW5QYyUuEGkUEru4fZa8ZvAYisCfyNQh8jBWCWijcelZbMA5lPdVFmcM5pPcEkoMHk/NTUBkaXd0bTSOJrU2nH+lupKedmAycWgoDuRfiSib4iozb42jLPepW1DdXHNN5Z2VY49ltq/2TRESzqRu6OQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR19MB2381.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(7916004)(39850400004)(136003)(366004)(396003)(376002)(346002)(6486002)(5660300002)(8936002)(54906003)(2906002)(66946007)(64756008)(66476007)(66556008)(4326008)(30864003)(33716001)(83380400001)(9686003)(6512007)(8676002)(478600001)(186003)(7416002)(86362001)(76116006)(71200400001)(6916009)(26005)(6506007)(316002)(66446008)(142923001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bekLhjadXiAO6OgUlfIl4BOWHiBD/LQnjr2NMvnjCqzgknfrQicF0kzUc9BY05WMODn2d1C31t7bVSRoHht/i2TIdqpZB1aDvth5QeoxeF5NFYJs58ZFTjZbzTK52hk6/0Qi1uXp0Nw1LCSwwpIVcujsKs3tQr1jMfASOGhZLVH/N5hckRim55xclfxxKnaJ0ppeSm1NAzaVnbX3da/tJPtPlwAqle3whvJxudKjgVzI/nJ9qR/Xa/J80w76E/m/iZumIssx+m4hcIu9wL0JS3kFmkoxaj+9z3f+RDoL35dVuL2veA/QH3cyGAQfj5jQJEQkC8IUDXLBQTf/5N5gTmO5aiOcVSAKXqjhrcbR6wcd2I+ADXYh5mBsLOM6yqI+wZ2NNwEQiUO4E5icz2DrVmlVw115FTtx8QifFJlTII/Mp/Qw9XKUkPh8HlwR8WiBnh15MTADfmjieD9zob/IRrHSwKW13sSmdLXIDippxcw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D24AADEF762BDA41A3F24532F9A82EAE@namprd19.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4b0de7-4af0-4d63-6951-08d81788f62d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 15:20:28.4778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+kMDUrD5EyWQvJsV2zYgVabXeveA+O+vg5mttfnwGxetjFke09TNH0Z7DtaencZBvztVenQsglVPzSoHIEhyqWhThPDDdRv82tCz2mTA9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4206
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 include:_spf1.cirrus.com include:_spf2.cirrus.com include:_spf3.cirrus.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=952 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006120000 definitions=main-2006230118
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
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



On Mon, 23 Jun 2020, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> snd_soc_dai_digital_mute() is internally using both
> mute_stream() (1) or digital_mute() (2), but the difference between
> these 2 are only handling direction.
> We can merge digital_mute() into mute_stream
>
> 	int snd_soc_dai_digital_mute(xxx, int direction)
> 	{
> 		...
> 		else if (dai->driver->ops->mute_stream)
> (1)			return dai->driver->ops->mute_stream(xxx, direction);
> 		else if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK &&
> 			 dai->driver->ops->digital_mute)
> (2)			return dai->driver->ops->digital_mute(xxx);
> 		...
> 	}
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> sound/soc/codecs/cs4265.c  | 7 +++++--
> sound/soc/codecs/cs4270.c  | 7 +++++--
> sound/soc/codecs/cs42l42.c | 7 +++++--
> sound/soc/codecs/cs42l51.c | 7 +++++--
> sound/soc/codecs/cs42l52.c | 7 +++++--
> sound/soc/codecs/cs42l56.c | 7 +++++--
> sound/soc/codecs/cs42xx8.c | 7 +++++--
> sound/soc/codecs/cs4341.c  | 7 +++++--
> sound/soc/codecs/cs4349.c  | 7 +++++--
> 9 files changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
> index 2fb65f246b0c..06182df8948a 100644
> --- a/sound/soc/codecs/cs4265.c
> +++ b/sound/soc/codecs/cs4265.c
> @@ -378,10 +378,13 @@ static int cs4265_set_fmt(struct snd_soc_dai *codec=
_dai, unsigned int fmt)
> 	return 0;
> }
>
> -static int cs4265_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs4265_mute(struct snd_soc_dai *dai, int mute, int direction)
> {
> 	struct snd_soc_component *component =3D dai->component;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	if (mute) {
> 		snd_soc_component_update_bits(component, CS4265_DAC_CTL,
> 			CS4265_DAC_CTL_MUTE,
> @@ -498,7 +501,7 @@ static int cs4265_set_bias_level(struct snd_soc_compo=
nent *component,
>
> static const struct snd_soc_dai_ops cs4265_ops =3D {
> 	.hw_params	=3D cs4265_pcm_hw_params,
> -	.digital_mute	=3D cs4265_digital_mute,
> +	.mute_stream	=3D cs4265_mute,
> 	.set_fmt	=3D cs4265_set_fmt,
> 	.set_sysclk	=3D cs4265_set_sysclk,
> };
> diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
> index 3e8dabc14f05..3c45406339f4 100644
> --- a/sound/soc/codecs/cs4270.c
> +++ b/sound/soc/codecs/cs4270.c
> @@ -406,12 +406,15 @@ static int cs4270_hw_params(struct snd_pcm_substrea=
m *substream,
>  * board does not have the MUTEA or MUTEB pins connected to such circuitr=
y,
>  * then this function will do nothing.
>  */
> -static int cs4270_dai_mute(struct snd_soc_dai *dai, int mute)
> +static int cs4270_dai_mute(struct snd_soc_dai *dai, int mute, int direct=
ion)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	struct cs4270_private *cs4270 =3D snd_soc_component_get_drvdata(componen=
t);
> 	int reg6;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	reg6 =3D snd_soc_component_read(component, CS4270_MUTE);
>
> 	if (mute)
> @@ -471,7 +474,7 @@ static const struct snd_soc_dai_ops cs4270_dai_ops =
=3D {
> 	.hw_params	=3D cs4270_hw_params,
> 	.set_sysclk	=3D cs4270_set_dai_sysclk,
> 	.set_fmt	=3D cs4270_set_dai_fmt,
> -	.digital_mute	=3D cs4270_dai_mute,
> +	.mute_stream	=3D cs4270_dai_mute,
> };
>
> static struct snd_soc_dai_driver cs4270_dai =3D {
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 3bc2fa229ef3..4ef52eae1999 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -849,12 +849,15 @@ static int cs42l42_set_sysclk(struct snd_soc_dai *d=
ai,
> 	return 0;
> }
>
> -static int cs42l42_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs42l42_mute(struct snd_soc_dai *dai, int mute, int direction=
)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	unsigned int regval;
> 	u8 fullScaleVol;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	if (mute) {
> 		/* Mark SCLK as not present to turn on the internal
> 		 * oscillator.
> @@ -909,7 +912,7 @@ static const struct snd_soc_dai_ops cs42l42_ops =3D {
> 	.hw_params	=3D cs42l42_pcm_hw_params,
> 	.set_fmt	=3D cs42l42_set_dai_fmt,
> 	.set_sysclk	=3D cs42l42_set_sysclk,
> -	.digital_mute =3D cs42l42_digital_mute
> +	.mute_stream	=3D cs42l42_mute
> };
>
> static struct snd_soc_dai_driver cs42l42_dai =3D {
> diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
> index dde9812490de..b419a578968e 100644
> --- a/sound/soc/codecs/cs42l51.c
> +++ b/sound/soc/codecs/cs42l51.c
> @@ -484,12 +484,15 @@ static int cs42l51_hw_params(struct snd_pcm_substre=
am *substream,
> 	return 0;
> }
>
> -static int cs42l51_dai_mute(struct snd_soc_dai *dai, int mute)
> +static int cs42l51_dai_mute(struct snd_soc_dai *dai, int mute, int direc=
tion)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	int reg;
> 	int mask =3D CS42L51_DAC_OUT_CTL_DACA_MUTE|CS42L51_DAC_OUT_CTL_DACB_MUTE=
;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	reg =3D snd_soc_component_read(component, CS42L51_DAC_OUT_CTL);
>
> 	if (mute)
> @@ -511,7 +514,7 @@ static const struct snd_soc_dai_ops cs42l51_dai_ops =
=3D {
> 	.hw_params      =3D cs42l51_hw_params,
> 	.set_sysclk     =3D cs42l51_set_dai_sysclk,
> 	.set_fmt        =3D cs42l51_set_dai_fmt,
> -	.digital_mute   =3D cs42l51_dai_mute,
> +	.mute_stream    =3D cs42l51_dai_mute,
> };
>
> static struct snd_soc_dai_driver cs42l51_dai =3D {
> diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
> index 2ea4cba3be2a..7d2a77b3114b 100644
> --- a/sound/soc/codecs/cs42l52.c
> +++ b/sound/soc/codecs/cs42l52.c
> @@ -784,10 +784,13 @@ static int cs42l52_set_fmt(struct snd_soc_dai *code=
c_dai, unsigned int fmt)
> 	return 0;
> }
>
> -static int cs42l52_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs42l52_mute(struct snd_soc_dai *dai, int mute, int direction=
)
> {
> 	struct snd_soc_component *component =3D dai->component;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	if (mute)
> 		snd_soc_component_update_bits(component, CS42L52_PB_CTL1,
> 				    CS42L52_PB_CTL1_MUTE_MASK,
> @@ -865,7 +868,7 @@ static int cs42l52_set_bias_level(struct snd_soc_comp=
onent *component,
>
> static const struct snd_soc_dai_ops cs42l52_ops =3D {
> 	.hw_params	=3D cs42l52_pcm_hw_params,
> -	.digital_mute	=3D cs42l52_digital_mute,
> +	.mute_stream	=3D cs42l52_mute,
> 	.set_fmt	=3D cs42l52_set_fmt,
> 	.set_sysclk	=3D cs42l52_set_sysclk,
> };
> diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
> index ac569ab3d30f..77749849cf8f 100644
> --- a/sound/soc/codecs/cs42l56.c
> +++ b/sound/soc/codecs/cs42l56.c
> @@ -800,10 +800,13 @@ static int cs42l56_set_dai_fmt(struct snd_soc_dai *=
codec_dai, unsigned int fmt)
> 	return 0;
> }
>
> -static int cs42l56_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs42l56_mute(struct snd_soc_dai *dai, int mute, int direction=
)
> {
> 	struct snd_soc_component *component =3D dai->component;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	if (mute) {
> 		/* Hit the DSP Mixer first */
> 		snd_soc_component_update_bits(component, CS42L56_DSP_MUTE_CTL,
> @@ -929,7 +932,7 @@ static int cs42l56_set_bias_level(struct snd_soc_comp=
onent *component,
>
> static const struct snd_soc_dai_ops cs42l56_ops =3D {
> 	.hw_params	=3D cs42l56_pcm_hw_params,
> -	.digital_mute	=3D cs42l56_digital_mute,
> +	.mute_stream	=3D cs42l56_mute,
> 	.set_fmt	=3D cs42l56_set_dai_fmt,
> 	.set_sysclk	=3D cs42l56_set_sysclk,
> };
> diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
> index 94b1adb088fd..b08d44794cdb 100644
> --- a/sound/soc/codecs/cs42xx8.c
> +++ b/sound/soc/codecs/cs42xx8.c
> @@ -362,13 +362,16 @@ static int cs42xx8_hw_free(struct snd_pcm_substream=
 *substream,
> 	return 0;
> }
>
> -static int cs42xx8_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs42xx8_mute(struct snd_soc_dai *dai, int mute, int direction=
)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	struct cs42xx8_priv *cs42xx8 =3D snd_soc_component_get_drvdata(component=
);
> 	u8 dac_unmute =3D cs42xx8->tx_channels ?
> 		        ~((0x1 << cs42xx8->tx_channels) - 1) : 0;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	regmap_write(cs42xx8->regmap, CS42XX8_DACMUTE,
> 		     mute ? CS42XX8_DACMUTE_ALL : dac_unmute);
>
> @@ -380,7 +383,7 @@ static const struct snd_soc_dai_ops cs42xx8_dai_ops =
=3D {
> 	.set_sysclk	=3D cs42xx8_set_dai_sysclk,
> 	.hw_params	=3D cs42xx8_hw_params,
> 	.hw_free	=3D cs42xx8_hw_free,
> -	.digital_mute	=3D cs42xx8_digital_mute,
> +	.mute_stream	=3D cs42xx8_mute,
> };
>
> static struct snd_soc_dai_driver cs42xx8_dai =3D {
> diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
> index ade7477d04f1..a47ad98eafd6 100644
> --- a/sound/soc/codecs/cs4341.c
> +++ b/sound/soc/codecs/cs4341.c
> @@ -116,11 +116,14 @@ static int cs4341_hw_params(struct snd_pcm_substrea=
m *substream,
> 					     CS4341_MODE2_DIF, mode);
> }
>
> -static int cs4341_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs4341_mute(struct snd_soc_dai *dai, int mute, int direction)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	int ret;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	ret =3D snd_soc_component_update_bits(component, CS4341_REG_VOLA,
> 					    CS4341_VOLX_MUTE,
> 					    mute ? CS4341_VOLX_MUTE : 0);
> @@ -174,7 +177,7 @@ static const struct snd_kcontrol_new cs4341_controls[=
] =3D {
> static const struct snd_soc_dai_ops cs4341_dai_ops =3D {
> 	.set_fmt	=3D cs4341_set_fmt,
> 	.hw_params	=3D cs4341_hw_params,
> -	.digital_mute	=3D cs4341_digital_mute,
> +	.mute_stream	=3D cs4341_mute,
> };
>
> static struct snd_soc_dai_driver cs4341_dai =3D {
> diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
> index 3381209a882d..208a94dd4eed 100644
> --- a/sound/soc/codecs/cs4349.c
> +++ b/sound/soc/codecs/cs4349.c
> @@ -131,11 +131,14 @@ static int cs4349_pcm_hw_params(struct snd_pcm_subs=
tream *substream,
> 	return 0;
> }
>
> -static int cs4349_digital_mute(struct snd_soc_dai *dai, int mute)
> +static int cs4349_mute(struct snd_soc_dai *dai, int mute, int direction)
> {
> 	struct snd_soc_component *component =3D dai->component;
> 	int reg;
>
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> 	reg =3D 0;
> 	if (mute)
> 		reg =3D MUTE_AB_MASK;
> @@ -236,7 +239,7 @@ static const struct snd_soc_dapm_route cs4349_routes[=
] =3D {
> static const struct snd_soc_dai_ops cs4349_dai_ops =3D {
> 	.hw_params	=3D cs4349_pcm_hw_params,
> 	.set_fmt	=3D cs4349_set_dai_fmt,
> -	.digital_mute	=3D cs4349_digital_mute,
> +	.mute_stream	=3D cs4349_mute,
> };
>
> static struct snd_soc_dai_driver cs4349_dai =3D {
> --=20
> 2.25.1
>
>

Acked-by: James Schulman <james.schulman@cirrus.com>

Thanks,
James=
