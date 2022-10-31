Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61F613562
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:09:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9521655;
	Mon, 31 Oct 2022 13:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9521655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667218144;
	bh=JZuDLl81Agad0D6GmhdJqwWuWdjqG+YP9kD4EgFKlNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fnaesRg77kgIWMgLTh0yQ3gjKyPN31T7aimltdR4Z6ZyCumLtaJ6D5q4mRF7tWGNq
	 y45p2kmAX6QFhVPRGHmWJawtDXR4sC1s9bYJ6g7Zzc1FrTikjCq5mbaLZJksYMvK8G
	 +G7fGSqBhEOJGoLpc+HcYmQqcb1Y0FKy29XuM0Gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FA07F800F3;
	Mon, 31 Oct 2022 13:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52FEAF8015B; Mon, 31 Oct 2022 13:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C349F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C349F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pBJsJOAm"
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3701a0681daso71011967b3.4
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uIgEds2lsUEazFDcLqiFcBouG6saS9AagLSYOnXJFgM=;
 b=pBJsJOAmF+05N3+3hZfjF1ZtP+2ryz6assxcuDYfI5liFd25pwJmh3ip1CYl0NQ5b7
 Q/R1ZzvhOAmZwRIKXL0/Rd3vJlSMqBQhKbXmeRKtrHVvCXgJCl68xaX2G9UwK4VfPkcr
 DbST64ziRaWJXYFPDvxm+67zOVzWRldT5mqtqIjB0pQbk0KOFdLZlVOkbQIgegc/M26f
 HCwZRlL2uhDTlN69oODCR8mTGCI+bqk6NyYip7jNywRSyby2dLOxUeqKKCeTF+bQdwb8
 uIj5xO9FWyVJFdKEt7rZYqlLXCtjHoHoxBURZ+9i2kIIC/npgwSi00nnFKPe6hjb2lW6
 BjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uIgEds2lsUEazFDcLqiFcBouG6saS9AagLSYOnXJFgM=;
 b=tPuIIEyLCX8fyZ56Vx+AU0cFfJZT6aqNRiNyyLbiAMm0x021PV8JAekP50gk/HL24t
 hlvuc9kvgDX6KXMG4bnPeuQAYGprZqcEX+PkvkJP+FxZmo7xudfoEYtxMv+glGuL+jIT
 z2WRL7HBb3JmL2AYXdfBRWvxwQTscJGSDn9+Nk5DAAOrhRTNzJGRGGMajQVNuxiI/CZl
 KvuDNMHRYfg7Dv2yvomUhMqKP4mZTatAn0ipJycpIu5jSQGnxWTgnFO23ntpIAm4RsUu
 WqUikDS6WNOfKViLs3jXpZmmOGauqISDkPivw6Jh1W/CcePo3Njq3TcyzBi38nNqXPVX
 G7iA==
X-Gm-Message-State: ACrzQf0gjKBfb5216SY2QwlbJsEWRxKuuIOtE+sttMqyYqWnlJ9/zwWq
 i9fs+ajixbd12UO3tFwJUdzc0nGFjE7wY2wWM44T+Q==
X-Google-Smtp-Source: AMsMyM6Rk+z9XSkM0gx0kUZjmUPDqfeBWgYp5+03gj8tpxxxciSK6Ab/X9mTjfczx5v4JFxVOh/jbjlcTd0zGQEaMuA=
X-Received: by 2002:a81:4f89:0:b0:36a:f09f:73fc with SMTP id
 d131-20020a814f89000000b0036af09f73fcmr12513606ywb.487.1667218078610; Mon, 31
 Oct 2022 05:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
 <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 31 Oct 2022 20:07:47 +0800
Message-ID: <CALprXBY3S5N-g6N=q4DgF3ngq-eTxc_+LjGJQp2QjVz+Fi4pRg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Hi Rob Herring,


On Mon, Oct 31, 2022 at 1:26 AM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> +
> +        dmic-gpios = <&pio 23 0>;
>
>          headset-codec {
>              sound-dai = <&rt5682s>;
> --
> 2.25.1
>

I think the modification will be better, I will send v5 again, thanks
@@ -63,14 +70,19 @@ required:

 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>

     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;

         headset-codec {
             sound-dai = <&rt5682s>;
