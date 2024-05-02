Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A712A8B984B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 12:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630ABDFA;
	Thu,  2 May 2024 12:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630ABDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714644016;
	bh=0VwrMUO3X+y6UpEoWe11LsUQtiTXlZrdy2wyBSrCHUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DwuuO1J9bCJ/g2qdvXIksChPQ5qakj2G9wVw9O7/8BtKgPfguKnTPYEn9isl6m2cK
	 6IGqAqy3SImezl0XyOnPcD0TE9yPkKdHLWD/i7laGf5QHxNR45T6BBZMMLGc7yHTwS
	 KnwodwlnVWq1TTBlcq7EV+P/u3jvXUk7cMYVu0iI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD50CF804FB; Thu,  2 May 2024 11:59:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCBFF804F2;
	Thu,  2 May 2024 11:59:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F0E9F80266; Thu,  2 May 2024 11:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E700F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 11:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E700F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=W827yzbh
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so273938e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 02 May 2024 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714643979; x=1715248779;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAWzFtfBZwMQoHv84/W+JImIB5vAq9WxgZXxmYPg6EU=;
        b=W827yzbhHxN/KtclV8bADcBpm4Wky0ik/nlNLPekc4I3dAt+WDA8pCC9AOC+wC8859
         6i8zZEFL8s51V9iVyh0PbfSKeQBidjMBXD1Kcmn243TNWaJqMM+Me52YKNRWAQELp6aP
         s99sxJO//6r8DweSP5ESsDNTDrn1tcWnSjI0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643979; x=1715248779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAWzFtfBZwMQoHv84/W+JImIB5vAq9WxgZXxmYPg6EU=;
        b=e5+wlzBP5kEPl+Yy1/AFdc/8QDjVXmGl1qsN8kQvRITIX1dzyhcqAuWdNzNTYce9V0
         mH9XjTJOMdC0vL2hZtTReJ9FPZhiZX5Co5ch1bFWf55/W03A4DHTUDd4tL4rSXAWpdW5
         otIKSk9UqQBwBR5H3Ue37oeqdrdUpYvNJa8fFSut+SPzrLO5OdJJUQkwtM3JLr50BozT
         Y+16VKDHDaXJ/ey/+ONCHpdG/JVQBuQX3GQ3GLqBs69sj6/dfFG89qBKYlbkGLxiKOEP
         1DfbCIWA+Z14RcMOAQtHER+FZ4/ij+NaXn4tljJuuaRy+wW9hzHQb5to1TLZDSyECoTp
         RqIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURdeLWsuQrEleX2L3w1lGZwmLkwT7/lUXYWVeoo8ZfU48ACR7LU3lojxpJY1UdCdXPmhGzSLNMPGrV7oJP2falHv6FCFQyO6U9UDM=
X-Gm-Message-State: AOJu0YwsJoPiWHfvccizjm76Uotz96E7CRwlDl7u2tyUfli0+fqThG0I
	cRN/tQNGHw+ZyUVMQWtUlxyK3r5hpmD7lxXjNelxQGrnCz8KrDf3gAlSvB3lS3nbS1CMj3c4lOB
	gZKx8WYHlOw2vsUebOePth4I6C5d+qRVC6QVx
X-Google-Smtp-Source: 
 AGHT+IEGkMy9wnAsRv/sjRzs/mP6zDLzjdxZZenS550ahLeLjpaIxqNlXTywDzD62yFQysa3FGIxwKwuDOr1BNgiH+Q=
X-Received: by 2002:a05:6512:3c87:b0:51c:cd8d:2865 with SMTP id
 h7-20020a0565123c8700b0051ccd8d2865mr4075910lfv.44.1714643978564; Thu, 02 May
 2024 02:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
 <20240416071410.75620-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240416071410.75620-19-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 May 2024 17:59:27 +0800
Message-ID: 
 <CAGXv+5GddLeYr-CZBFUcpUMR_NV0=0fu6Qp71hvKO6tJdJjF6w@mail.gmail.com>
Subject: Re: [PATCH v5 18/18] arm64: dts: mediatek: mt8186-corsola: Specify
 sound DAI links and routing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org,
	shane.chien@mediatek.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5OIU7OMKC2S4EH3O6MJ447SPDNA44JZZ
X-Message-ID-Hash: 5OIU7OMKC2S4EH3O6MJ447SPDNA44JZZ
X-MailFrom: wenst@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OIU7OMKC2S4EH3O6MJ447SPDNA44JZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 16, 2024 at 3:15=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The drivers and bindings acquired support for specifying audio hardware
> and links in device tree: describe and link the sound related HW of this
> machine.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     | 42 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index 1807e9d6cb0e..afdab5724eaa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -42,7 +42,7 @@ backlight_lcd0: backlight-lcd0 {
>                 default-brightness-level =3D <576>;
>         };
>
> -       bt-sco-codec {
> +       bt-sco {

I remember changing this node from "bt-sco" to "bt-sco-codec" because
of a review comment when I submitted the Corsola dts series.

>                 compatible =3D "linux,bt-sco";
>                 #sound-dai-cells =3D <0>;
>         };
> @@ -223,12 +223,44 @@ sound: sound {
>                 mediatek,adsp =3D <&adsp>;
>                 mediatek,platform =3D <&afe>;
>
> -               playback-codecs {
> -                       sound-dai =3D <&it6505dptx>, <&rt1019p>;
> +               audio-routing =3D
> +                       "Headphone", "HPOL",
> +                       "Headphone", "HPOR",
> +                       "IN1P", "Headset Mic",
> +                       "Speakers", "Speaker",
> +                       "HDMI1", "TX";
> +
> +               hs-playback-dai-link {
> +                       link-name =3D "I2S0";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       codec {
> +                               sound-dai =3D <&rt5682s 0>;
> +                       };
> +               };
> +
> +               hs-capture-dai-link {
> +                       link-name =3D "I2S1";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       codec {
> +                               sound-dai =3D <&rt5682s 0>;
> +                       };
>                 };
>
> -               headset-codec {
> -                       sound-dai =3D <&rt5682s 0>;
> +               spk-share-dai-link {
> +                       link-name =3D "I2S2";
> +                       mediatek,clk-provider =3D "cpu";
> +               };
> +
> +               spk-hdmi-playback-dai-link {
> +                       link-name =3D "I2S3";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       /* RT1019P and IT6505 connected to the same I2S l=
ine */
> +                       codec {
> +                               sound-dai =3D <&it6505dptx>, <&rt1019p>;
> +                       };
>                 };
>         };
>
> --
> 2.44.0
>
