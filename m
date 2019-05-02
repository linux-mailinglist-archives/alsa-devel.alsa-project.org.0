Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FB116E5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 12:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE77B17A1;
	Thu,  2 May 2019 12:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE77B17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556791742;
	bh=9c3Z/QppUK2J5iWeMekdiWipugi51WXXUSvb6ynFeXE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jm4yqozDIsqgOe9kTBh7Jp7Z2h7HtP95G70jwkne6nGDZwH0WjJh2Bkgvdv5EeIJe
	 ykhb71bRvA9UO9Cd3X8hwMpkTiG+Ycq73v/mhL3paHXa2w8Jv1D4tLJaMklbhIL4+P
	 4/A22iDJVDuDW6kbT4xQ7KlU0p5uigRj20z4lF60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 469C7F896C7;
	Thu,  2 May 2019 12:07:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 205D9F896C7; Thu,  2 May 2019 12:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2B4F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 12:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2B4F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="Nqqte2+j"
Received: from [85.158.142.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-central-1.aws.symcld.net id FE/95-23082-D41CACC5;
 Thu, 02 May 2019 10:07:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRWlGSWpSXmKPExsWSoc9npet78FS
 Mwe4WZosrFw8xWUx9+ITNYv6JW2wW3650MFlc3jWHzaJzVz+rxYbvaxkt5nbmOXB4bPjcxOYx
 u+Eii8fOWXfZPTat6mTz2Pd2GZvH+i1XWTw+b5ILYI9izcxLyq9IYM14/qqNseAHb8XVk7eZG
 xiPc3cxcnGwCKxnlnh8oJUdxBESmMIksW/OVxYI5wGjxObJzUAOJwebgIXE5BMP2EBsEYF0iX
 2TJrCCFDELPGCSWLDvMStIQljAXuLtuvOsEEUOEpsm7meHsI0k9sxuYASxWQRUJD4/eQYW5xV
 IlDg99Q9QnANom5XEw+lFICangLXErkd+IBWMArISXxpXM4PYzALiEreezGcCsSUEBCSW7DnP
 DGGLSrx8/I8Voj5V4mTTDUaIuI7E2etPwKZLCChK9D5ggQjLSlya3w1V4isxd9U/sHclBO4wS
 kxYd4oVprelcy/UfAuJJd2tUM0FEo8nzYFqVpM4tLqNDcKWkeje1AQ1aCKbxMdNs8FeFBJIlv
 gw9yw7RJGcxKreh1BFF5gldl96xzKBUWsWkucgbB2JBbs/sUHY2hLLFr5mngUOLkGJkzOfsCx
 gZFnFaJFUlJmeUZKbmJmja2hgoGtoaKxromtkpJdYpZukl1qqm5yaV1KUCJTUSywv1iuuzE3O
 SdHLSy3ZxAhMbSmFLGI7GC8sTT/EKMnBpCTK+3vFqRghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
 rwv9wHlBItS01Mr0jJzgEkWJi3BwaMkwpt2ACjNW1yQmFucmQ6ROsWoy3Fg0cO5zEIsefl5qV
 LivDogRQIgRRmleXAjYAn/EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gqQKTyZeSVwm14
 BHcEEdMTzSWBHlCQipKQaGFcYLD3Odesrh9Rfp4jC6IdHso+GSgWoymzriyra9zvnEKP74//P
 Ml5LtYXIX5gf27IsfJ6p0gyumXN3r+uwXVFSNN8x2eJ2y6KVScHTA79uqd6QWmYb9NHt0rRoE
 bUL+37ueL2YeyK7xIEzv9dle9nobly3e+luDivGB6u2bY318d8vcseya5ISS3FGoqEWc1FxIg
 DhjX2D8wMAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-4.tower-246.messagelabs.com!1556791628!5475643!1
X-Originating-IP: [104.47.14.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23896 invoked from network); 2 May 2019 10:07:08 -0000
Received: from mail-vi1eur04lp2058.outbound.protection.outlook.com (HELO
 EUR04-VI1-obe.outbound.protection.outlook.com) (104.47.14.58)
 by server-4.tower-246.messagelabs.com with AES256-SHA256 encrypted SMTP;
 2 May 2019 10:07:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d79/PvtV5NHswfZyQ0SHN3QdSMQYeivxpnwzxEgzk5A=;
 b=Nqqte2+jmOBvXl2uDbClcD42/XVrRQ55nDBkdioKDNlshbGz6HjsOdRNDS83lkf2RhqVCugQzLkIN8/RhW4HjBN93QbbaYPRwlFRpPrL9FqWhhnJSqyUrprIfp6/iS6lA8rcrOXmZr+S7ClaL8+X/G1qURInm98bOBqqmmj4MTk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM (10.169.155.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Thu, 2 May 2019 10:07:06 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%5]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 10:07:06 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] ASoC: da7219: Update the support rate list
Thread-Index: AQHVAJyitg9iRjOROEK/950fcGO9eKZXm2CQ
Date: Thu, 2 May 2019 10:07:05 +0000
Message-ID: <AM5PR1001MB0994A52E77F12680F71AB08080340@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190502040743.184310-1-yuhsuan@chromium.org>
In-Reply-To: <20190502040743.184310-1-yuhsuan@chromium.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bfedf67-761e-4a3e-9db7-08d6cee5ee65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM5PR1001MB1041; 
x-ms-traffictypediagnostic: AM5PR1001MB1041:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB1041D6A66F9B524356552376A7340@AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39850400004)(366004)(346002)(199004)(189003)(54906003)(446003)(86362001)(486006)(55016002)(110136005)(6436002)(229853002)(476003)(7736002)(66556008)(186003)(76116006)(8936002)(66946007)(64756008)(66446008)(6506007)(11346002)(73956011)(9686003)(66476007)(2501003)(3846002)(256004)(53546011)(76176011)(8676002)(66066001)(6116002)(81166006)(7696005)(102836004)(14454004)(478600001)(305945005)(6246003)(99286004)(55236004)(71200400001)(71190400001)(72206003)(81156014)(5660300002)(53936002)(25786009)(316002)(52536014)(26005)(74316002)(68736007)(33656002)(4326008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1041;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4U0P0lTt6/2Z4ShRV3AfnlHjbcuyYwHIuF1ev3qLmZPJ8k1a3lozTyY+nlWKbdRVp4VnDpiDD7yxccH/ZiEn+uLKf8tTcTHHdEKtNT7csI7dymCKQmoMoC/IThNMO5JnPBN0Rp1AVEh/DVPG8OKRDSfKVDbVtyKhqlpOLerzzz6+9xL20d0TnALYPRwT/Y0suEwL+GQ9fJPCXKNsL7klGp3/LxYZWRyBS7ePuRAeyUN78lGoz6btni4NKcp1j1Eaz/KEE+oyaygpq0jTa2JVsN38xmkoy3j2nKL1vWgR1bmiDL4NastPJzSxe6qgRXHocKrVePNfTLf5dBAf1Ne7CrcxERy7RwPvKTXX0yQtkKGN56bTRpE/goZGsg5jMRvxDnM8JdMp3TCIJqigr8EhdEca6FnBFHL9P4JRZrnBgT4=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfedf67-761e-4a3e-9db7-08d6cee5ee65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 10:07:06.0231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1041
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: Update the support rate list
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02 May 2019 05:08, Yu-Hsuan Hsu wrote:

> If we want to set rate to 64000 on da7219, it fails and returns
> "snd_pcm_hw_params: Invalid argument".
> We should remove 64000 from support rate list because it is not
> available.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7219.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 5f5fa3416af3..7497457cf3d4 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -1658,20 +1658,26 @@ static const struct snd_soc_dai_ops da7219_dai_ops
> = {
>  #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S20_3LE |\
>  			SNDRV_PCM_FMTBIT_S24_LE |
> SNDRV_PCM_FMTBIT_S32_LE)
> 
> +#define DA7219_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025
> |\
> +		      SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
> +		      SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
> +		      SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
> +		      SNDRV_PCM_RATE_96000)
> +
>  static struct snd_soc_dai_driver da7219_dai = {
>  	.name = "da7219-hifi",
>  	.playback = {
>  		.stream_name = "Playback",
>  		.channels_min = 1,
>  		.channels_max = DA7219_DAI_CH_NUM_MAX,
> -		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.rates = DA7219_RATES,
>  		.formats = DA7219_FORMATS,
>  	},
>  	.capture = {
>  		.stream_name = "Capture",
>  		.channels_min = 1,
>  		.channels_max = DA7219_DAI_CH_NUM_MAX,
> -		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.rates = DA7219_RATES,
>  		.formats = DA7219_FORMATS,
>  	},
>  	.ops = &da7219_dai_ops,
> --
> 2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
