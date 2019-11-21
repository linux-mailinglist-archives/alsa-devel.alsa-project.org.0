Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE3105ADB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 21:12:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DF017A3;
	Thu, 21 Nov 2019 21:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DF017A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574367145;
	bh=njrH7Ptj4kWDl6+sJY7oz+RJpRLogLNZEoyUWOdvbyY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ce/i2apjQ7UBcBUBwaOaZBlUDS1mrJKAe95seX6nsZG3ToxnEdF4PZUCOhlm32nb7
	 nY1JhvF2VOT1i1+bxhxM63AJsfRsczXVoH1TgYyhHr6RWz0+BFmx5CQdGdKQtlKdD9
	 sIsyJkaeKugCXCzzjb2sNIkG08lg2pWXJtFPPob8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC84CF8014C;
	Thu, 21 Nov 2019 21:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E81BF80146; Thu, 21 Nov 2019 21:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8ECAF800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 21:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8ECAF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="0JM/IOMH"
Received: from [46.226.52.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 17/62-20391-83FE6DD5;
 Thu, 21 Nov 2019 20:10:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0wbZRzGeXvX40BuOwqElwLLrG6yuetaWNi
 pi6Kbpss2Y4wJUSHbISetK6VpiwVlGRQqsAolUdxgMKYpdUMafvmjMDW2VAJrBsqv4RxZCywb
 IJuOBdAB2uNg6n+f5/s87/t9/vjiiMiHiXE2z8DqNIxagoWiyt0YTdF3R9NlLncsPfyzW0BX+
 6cwuqP/QyG9MFwmoIe66jC6vMsqpMdnX6ZbFx0gBVe0zpswhXPcBhSdtePBivamckzx/ZwdU7
 R8OYIq5tu3vBL8hlClycjJOyZUfm3zI9qzYXnmfmMhaAs9BUJxQDYisGTICXjRg8LO1m8wXnQ
 A+KDizzWBkr0I9I19EMwJEfmJANZ2nQqIkIDwA1jqFHOMkTT8qNe39iKSnAZwxHlGyAmE/ANA
 z/V+IZeKIJ+H8xMDGMeR5AvQ6vEBnhPhxFzRWgYlt8Hu/rJABscJkoE/rCTxywqg+VYXynEIe
 QCu3K5ZY0DGw/tFXyAcI2Q0vDbVIOAYkiS0fTuA8BwFpydXhXyehX2mMcDPd8ErV6fW+VF4rW
 1oPR8PBxss6/Mj0OT9FdvIPzBb1pmGNosZ5WpC8nG46s7nx1pomnQH87wdWi82C3mOg1f9nvW
 nPwnhhcWwKrC79j+ted4Fz1+6h/H8JLR/OotwTJDhsK9mCj0P0CawN0OnylIashmVmpLLZJRc
 nkjJn0qiEvdKmfcoRsrmUkZWb6DkUsaol+rzs99SZ0o1rKEdBI4tU+uKdQLrwpzUDWJwgSSKq
 H5sNF20KSMnM1/J6JVHdblqVu8GcTgugcTRioAXrmOz2Ly3VerAyW7YEA+TRBL7rAGb0GuZbL
 0qi7cuAwqvmq7/DBGhmhwNK44m6isDIZILKXM1D7/YOPxBEC+OIEBQUJAoTMvqslWG//szIBo
 HkgjCzTUJU2kMDzfNBEoIAiXaHINcCQPzryUuFOyw3NgRe3izF6ko+T16MbmpezhhwptxqVqm
 lUNH8ec+2/LMu9KbxiMLxeKaHvez77zKpjiOn26oE9Qnb8Yby9Xosb8nLzauWpbudwyci7dU7
 /G+dvkR11+ebTPhzZ23Q4wyZefr3bKdJ8yl6vebyZpZBzNi9CdsObFYPFI2FqW7MdcYs72wxU
 b0VvfFjIan1iV77Pech6reDF4++dJ80s3Zj7fGTZieybzTUak2XFleYH9JlK9iyU64b8/Zvqc
 LNqUveUuLDvy4ta0ihSrdv1Jrn21JK/lq9OT1Fyeeu3BwqCnXVXl8eTI17Zzd5Ti0dMcc88Tp
 Wwmew2npd0U9qQW/ib+ToHolI9+J6PTMP84lu+RzBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-16.tower-262.messagelabs.com!1574367031!65699!1
X-Originating-IP: [104.47.6.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15125 invoked from network); 21 Nov 2019 20:10:32 -0000
Received: from mail-ve1eur02lp2056.outbound.protection.outlook.com (HELO
 EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.56)
 by server-16.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Nov 2019 20:10:32 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQU75dNHIsxGolUkbbHT6bAOk0KSR9eIRo92zhVVWJ+346jW1PT6okRrsZiJeGcK7s6cH2l2PkaORVRs0W3Q/hfG0SRq0vML9Kn5Tzsdzz7BlcOvh1gbySQRmeYDjsAB95LMNyJiwGXbRC3nLBCPlYQ6akuIgC5VTbiaHRB4Xblav/GsONbs6BJ3d7G3bw8SCpdqlQPOk5Si+ROOnrTr42QTWWQeC7/jW/KcAS+Nx13f1JiNy/i98cR3smkZ0oGbqtUvO4YqFkC2zPRDY+nF2hmnuuGtNOOygzNGi7Trpe+cuwmZiNLmqD1c9NfozNauo9bjVB9i1cxok+2JNCNqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXKoHi6GxXbmFwWb+KWmyZmt2OCwyPuD4iSsaxlIb4k=;
 b=AExRZNXVP3CYaGoR5Sfb95PCDTutBAZrClsjnzfUXSy5IKkP8xruykoLSoeQjRQ8xH4cVJzdO6/MhvrRfcRZ7VzvzPS2+jtK5RL4wKVGSgcNSOCKkKRxd2uPTirwXA9bIf2HD4BA7ChIqO7gPLIdnPgmqC9+wFqjMlBIelhxlOYCgFkb209w0Fmv7HsheSqlkJ61fi8vpNFoK8SiJvDHrb9aDBM9ksPRVGr5vG+TVG0sDW8IuI77iDXqPN1iIyS+SSPJ/V8qBVnBNXMvrJ14nvzV/DJ1AShSXM5x1Xte6+KrFc6jF58V/gFaW+QeAPBLLM3RTuYLvWF9bfJcZ1xmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXKoHi6GxXbmFwWb+KWmyZmt2OCwyPuD4iSsaxlIb4k=;
 b=0JM/IOMHJOP5c8TX8sUQ3SbwWWUY1PPDKi9duA7d/fNx1lhNj10NVY94yY7GkmTg2a/qnyKeyczcVhVa3vf0dmTcXchq87FrWsg72lVzmp/w6evdOc/38MguaHsCdsp/wKityRWic2iU/tpkcO+zrHVuddngO1rUrGI6YEqOiyU=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0977.EURPRD10.PROD.OUTLOOK.COM (10.169.153.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Thu, 21 Nov 2019 20:10:30 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.021; Thu, 21 Nov 2019
 20:10:30 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 1/6] ASoC: da7213: Add da7212 DT compatible
Thread-Index: AQHVn7aVvSlpZ4UGuEGdGdiqwx7EBqeWDz7g
Date: Thu, 21 Nov 2019 20:10:30 +0000
Message-ID: <AM5PR1001MB0994D2F45FA75E8285938191804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-2-sebastian.reichel@collabora.com>
In-Reply-To: <20191120152406.2744-2-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c23ade-7af0-493d-3afb-08d76ebedbca
x-ms-traffictypediagnostic: AM5PR1001MB0977:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB0977B76538C1DDD96E7140BDA74E0@AM5PR1001MB0977.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39850400004)(366004)(189003)(199004)(33656002)(6246003)(5660300002)(2906002)(446003)(11346002)(52536014)(66556008)(64756008)(66446008)(4326008)(66476007)(76116006)(66946007)(478600001)(14454004)(55236004)(53546011)(102836004)(6506007)(7736002)(186003)(305945005)(81156014)(26005)(8676002)(81166006)(74316002)(8936002)(76176011)(7696005)(66066001)(110136005)(99286004)(256004)(55016002)(9686003)(316002)(6436002)(54906003)(229853002)(25786009)(6116002)(86362001)(3846002)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB0977;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +T3SswX1gKTSFo9PYzJjJoHfNcCpphKW0BKjthNqBm9DjyXeUiEZ/hcGKcC0kXRYxBVOem2Z+cAE80IQP8mQ4V/p5Vo1TUvllRJ2+p3GTQNT8GdOl3KpLO+zi8Jid4QvwzenIh8ggbJGQgLvVZCnWQj/BA6lqFRmnDBIBopF3Nf/xPBjH40pg9d6CI+JQDfrA0ZQ2usLjM+dYxlTUIpX8c2955bd8H67qjDr1MMZbxcmqmdQrJkQ8Y6rmRcY6UPHMz8Lh+rNxMieDhVzKfzOuz5Q/orSPbuU+S1P4bLzjPgmlGNswtd7h+Q98HFRts1s4VYTiD16e5VP3v8MhAhvwH9399T12+Oe8d/VIiBxmcp8LxdGJmDZTbi/yXcLB/nXwQvsXPOVQBMnKYjZKseN3CwCGRAG7RH2lbGEapFuVWBjLEOKYUr60BdsCEn/8t5W
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c23ade-7af0-493d-3afb-08d76ebedbca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 20:10:30.1242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 48DhIPPj+u0PBnG0b9kCrBWGT+AuNxj5JYlXR4b61NAWCgth2CHK/cbrmzYG2+GQKYP2cJhawmUWdioi/3QOS2S0jVrU5g6XBAsUy+GGotA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0977
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 1/6] ASoC: da7213: Add da7212 DT
	compatible
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

On 20 November 2019 15:24, Sebastian Reichel wrote: 

> This adds a compatible for da7212. It's handled exactly the
> same way as DA7213 and follows the ACPI bindings.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/da7213.txt | 4 ++--
>  sound/soc/codecs/da7213.c                          | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/da7213.txt
> b/Documentation/devicetree/bindings/sound/da7213.txt
> index 58902802d56c..759bb04e0283 100644
> --- a/Documentation/devicetree/bindings/sound/da7213.txt
> +++ b/Documentation/devicetree/bindings/sound/da7213.txt
> @@ -1,9 +1,9 @@
> -Dialog Semiconductor DA7213 Audio Codec bindings
> +Dialog Semiconductor DA7212/DA7213 Audio Codec bindings
> 
>  ======
> 
>  Required properties:
> -- compatible : Should be "dlg,da7213"
> +- compatible : Should be "dlg,da7212" or "dlg,7213"

Typo? "dlg,da7213"

>  - reg: Specifies the I2C slave address
> 
>  Optional properties:
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 925a03996db4..aff306bb58df 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1571,6 +1571,7 @@ static int da7213_set_bias_level(struct
> snd_soc_component *component,
>  #if defined(CONFIG_OF)
>  /* DT */
>  static const struct of_device_id da7213_of_match[] = {
> +	{ .compatible = "dlg,da7212", },
>  	{ .compatible = "dlg,da7213", },
>  	{ }
>  };
> --
> 2.24.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
