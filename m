Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D526A872A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 17:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC928827;
	Thu,  2 Mar 2023 17:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC928827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677775571;
	bh=eAhBeR1+bpkc82CMFMxkFQONIz2+owQNxSl0vMDBC1A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMfIMIwayHuTvVoHx+v1/f28fwAY9u4b8XfUOyWQy5c6s9Kdlvy0n3jci5oCnmqpf
	 lzGOKa1d7Yq9+Zhy3hiF3DFB4THLWnVtgxMday8FeypcKdgfyG5tYvRHWx3Tu8Rd37
	 5EKbUmdUN9YB8JI/mA+qEz4pQQB6QIqwngGABiUo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 038D1F8025A;
	Thu,  2 Mar 2023 17:45:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0BAFF80266; Thu,  2 Mar 2023 17:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86441F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 17:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86441F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256
 header.s=rsa2 header.b=kDFUay36;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org
 header.a=ed25519-sha256 header.s=ed2 header.b=dTZtzyqF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=sAIc9DICHOwHXe3hoL0M1Cz46v91ph++acz6kjkneyk=;
	b=kDFUay36skYmps2/wdqt4fAH3ooPZbYWVp4pqBqM961wiZduj7P0xLgJw2P+NpMGf7kg1DoicLT6s
	 g6l09K8HwL4RYQ8zGGoaFGn4km6zQYbAroP+EN+9HlyJrhV1W8t5cDqTAwscYUwdLDpYbIiHboO9rZ
	 aMzoAa0S/vUdoj1kf/OGdJTZUpW+MrjaNGUTQavNWIRuYfGMKTi7Tl3hROfbZVtoTWtbKeUCJQ2L0I
	 vgAjzdLxgJIXjLXCeRFb3ZpkshGAWy49N0muwOqA6SWUqwPx0aPY3DSGC5+6RFk99RSbDSFXHj01s6
	 xLMWjzebL84uGzeen8v31LzBEjuhwEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=sAIc9DICHOwHXe3hoL0M1Cz46v91ph++acz6kjkneyk=;
	b=dTZtzyqF/jIMi0Zr3bfFJbyk3/PAmHQdX/XPn81EeMGXIgD+hYOJ9q2VlxqlJBJy6Rr6S2UsHglzv
	 pur80rgBQ==
X-HalOne-ID: 943971d9-b919-11ed-babc-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net
 [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 943971d9-b919-11ed-babc-11abd97b9443;
	Thu, 02 Mar 2023 16:45:06 +0000 (UTC)
Date: Thu, 2 Mar 2023 17:45:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <ZADSkGa6dK4H9p75@ravnborg.org>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
Message-ID-Hash: TCUZ6REXILJCCE7N4XG3EGQIIVT3TWK7
X-Message-ID-Hash: TCUZ6REXILJCCE7N4XG3EGQIIVT3TWK7
X-MailFrom: sam@ravnborg.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCUZ6REXILJCCE7N4XG3EGQIIVT3TWK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob.

>  .../bindings/display/bridge/analogix,anx7625.yaml |  2 +-
>  .../bindings/display/bridge/anx6345.yaml          |  2 +-
>  .../bindings/display/bridge/lontium,lt8912b.yaml  |  2 +-
>  .../bindings/display/bridge/nxp,ptn3460.yaml      |  2 +-
>  .../bindings/display/bridge/ps8640.yaml           |  2 +-
>  .../bindings/display/bridge/sil,sii9234.yaml      |  2 +-
>  .../bindings/display/bridge/ti,dlpc3433.yaml      |  2 +-
>  .../bindings/display/bridge/toshiba,tc358762.yaml |  2 +-
>  .../bindings/display/bridge/toshiba,tc358768.yaml |  2 +-
>  .../bindings/display/panel/nec,nl8048hl11.yaml    |  2 +-
Acked-by: Sam Ravnborg <sam@ravnborg.org>



> index 669f70b1b4c4..8bd58913804a 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -226,7 +226,7 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    i2c1 {
> +    i2c {
>              #address-cells = <1>;
>              #size-cells = <0>;
>  
> @@ -239,7 +239,7 @@ examples:
>  
>              ssd1306_i2c: oled@3d {
>                      compatible = "solomon,ssd1306";
> -                    reg = <0x3c>;
> +                    reg = <0x3d>;
>                      pwms = <&pwm 4 3000>;
>                      reset-gpios = <&gpio2 7>;
>                      solomon,com-lrremap;

I can see this align the example with i2c-mux-gpio.yaml so the change
should be fine. I am just positive surprised the tooling caught it.

The change is
Acked-by: Sam Ravnborg <sam@ravnborg.org>

the above was just me thinking loud.

	Sam
