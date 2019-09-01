Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A45A48AC
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Sep 2019 12:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1041679;
	Sun,  1 Sep 2019 12:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1041679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567332350;
	bh=+zieHsKFbqogoMV3Egv8lS93ntWnIebubbO3CRNdWcY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwHsZ6eT6ozmXbid+0OJAXVJ0jWTWG6ifvEfEIy2fFXGnqhCB7vH4aJSJ5plkNHiS
	 vQfVqtcG0LtPsaXcW03hkqORz2ndZWkqsueun3C0Dsim1f4V9I8sCBBMuPPvqDNfYB
	 C1beOlsPwtwARnp9G26Hs/9z8wbWsrnRBSIOSFEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3C8F8045F;
	Sun,  1 Sep 2019 12:04:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33A4DF803D7; Sun,  1 Sep 2019 12:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092066023.outbound.protection.outlook.com [40.92.66.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3343EF800D1
 for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2019 12:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3343EF800D1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkbehVc7oP/dh9Cps3Ox79sWtE5xjnwgI7pxhpTOZ1YV0wNviIt0HQotyDMf1UvOxivJSIKaLQAQKb+Y8U4uluXZ7v9CudLEQ+dHTH0znJdDS6q6sms0qvti+ZAoGtmQswwv4aMLo34t6Q6gtantJ8jDeLR47lch6cckTXa8u6xfJT49nOZFPL9XLCDYFHSkyKSTa9iBP9Y/lf+T0hCtexE8QHZ9rIyeZ2O8y5B+sCUaxAhoKovNeuFU+yCuvMWNmsJDQEQPNkR7JH/yWc0IMjcjOnhrIQvKYH1tnWo8Ndu5vwmvbRxy2ggazTm+FRoxWggQmWZAD9n6R4R61jY6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaavbiEG3ZX9MFpUhrwDr9aaAj5KgWam58l2xiiE6eQ=;
 b=l6sIMC+Bb89eVWvxW1RB5egb4YTTxLdfcWVoaLo9fCA+zKXwvk17cgChbUGzKKqOacaKoMgDKgWjOWOpc9X2pcDHYV4qYUsM4QE1maIqeGyjMy3qxnepQMhi/j5ceuzJXRNLQrkSdrdrm098VgllknEPf6NZD7RlWxce0PfhXhRbiJOXm+NVfbbkyffvfZ7iOIVtr3r6xbXrxSHlez5bq8WC9wc3Q46h4pm1gaX1HmWZi7MsUvNLa2rYdN3LDrZwFfMb5Rdr1zMYgZDuF+lIR3fFFf9C19Gj3PFGFVlBKGptGsVskZI6ow66yUBcTLSrX/Y2Og0/E4vo3PnIeD3DEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT185.eop-EUR01.prod.protection.outlook.com
 (10.152.1.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 10:03:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.57) by
 HE1EUR01FT007.mail.protection.outlook.com (10.152.1.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 10:03:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 10:03:53 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Cheng-Yi Chiang <cychiang@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Index: AQHVXiJ4olMh5nfx9ESKyNNc1nttD6cWnNeA
Date: Sun, 1 Sep 2019 10:03:53 +0000
Message-ID: <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190829042957.150929-1-cychiang@chromium.org>
In-Reply-To: <20190829042957.150929-1-cychiang@chromium.org>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::12)
 To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:16C72D0C8AB52BEE626484D0B0E852CFFB509B27838AC274E6A26036719DAA6B;
 UpperCasedChecksum:118D8592DF4188344C2A8E08D26BEBCC14626A9511864823E42993A4B8E11281;
 SizeAsReceived:8542; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [+npBKufwFZGj9FtjgXjbVb5NfZd1lCOJ]
x-microsoft-original-message-id: <4c191c41-1e7a-0fd5-e4c8-f5df55a92fc4@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:HE1EUR01HT185; 
x-ms-traffictypediagnostic: HE1EUR01HT185:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: qId+/Ijj75PN1F7VHwgSPyHM6ytGrwqcE0kM9ZL5GN8eIY6LX1+kkIR0e+NM1JiunrCQDeVb7SFyzTa+RWRxARj/pD6QUH0dzyd3QsN5jiDmSt4uDgLLOuIRlZQrkcuJwZBNfYfbzgoKIjqzvmmkecbCX0YzGKnjEGWiHIufvHMeNxLmyb2OAnEnpQUOmrYz
x-ms-exchange-transport-forked: True
Content-ID: <0218E2ADABBE9D4DBD0D6B875F7CFEE1@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8ec63f-234b-4be1-5cad-08d72ec3b1b5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 10:03:53.5265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT185
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] drm: dw-hdmi-i2s: enable audio clock in
	audio_startup
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

On 2019-08-29 06:29, Cheng-Yi Chiang wrote:
> In the designware databook, the sequence of enabling audio clock and
> setting format is not clearly specified.
> Currently, audio clock is enabled in the end of hw_param ops after
> setting format.
>
> On some monitors, there is a possibility that audio does not come out.
> Fix this by enabling audio clock in audio_startup ops
> before hw_param ops setting format.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index 5cbb71a866d5..08b4adbb1ddc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -69,6 +69,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>  	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
>  
> +	return 0;
> +}
> +
> +static int dw_hdmi_i2s_audio_startup(struct device *dev, void *data)
> +{
> +	struct dw_hdmi_i2s_audio_data *audio = data;
> +	struct dw_hdmi *hdmi = audio->hdmi;
> +
>  	dw_hdmi_audio_enable(hdmi);
>  
>  	return 0;
> @@ -105,6 +113,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>  }
>  
>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> +	.audio_startup = dw_hdmi_i2s_audio_startup,

A small white space nit, there should be a tab and not space to align the equal sign above.
Also this patch do not cleanly apply to drm-misc-next or linux-next after
fc1ca6e01d0a "drm/bridge: dw-hdmi-i2s: add .get_eld support" was merged.

This patch does fix an issue I have observed on my Rockchip devices where audio would not always
came out after switching between audio streams having different rate and channels parameters.
I used to carry [1] to fix that issue, but this seems like a more sane fix.

[1] https://github.com/Kwiboo/linux-rockchip/commit/4862e4044532b8b480fa3a0faddc197586623808

With above fixed,

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

>  	.hw_params	= dw_hdmi_i2s_hw_params,
>  	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
>  	.get_dai_id	= dw_hdmi_i2s_get_dai_id,

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
