Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760A66AFC3
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:52:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1907EAD32;
	Sun, 15 Jan 2023 08:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1907EAD32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769068;
	bh=KR3OokBtxT9yNqkXHMXJcZvrOz6TTLD9atDHlJxbtuw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JEp6rPHnVYB3bPtzhfjsmqJZCYvmxk2csbqifxO07Z9/Brkq9v34HviaDcmODlW+T
	 9jfZG+NeWYF8ug6Oo/P3cbKUIV/F1a6LVz1bg7LunOLXRwwhrrXv18Nr10I8BgRpkp
	 +ojEV1xRqLTjog4OCZwwwgSMNZGSr/DaEeXCrqbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 178F0F80568;
	Sun, 15 Jan 2023 08:48:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A8FF8030F; Fri, 13 Jan 2023 09:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0179F80425
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0179F80425
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wC33l/oT
Received: by mail-ej1-x62e.google.com with SMTP id mp20so3985007ejc.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fq5EiwvFx5q9sBjRycwRwjCKfYTdfMVhpxypdyTT44M=;
 b=wC33l/oTMiL899EyjBVV9328MMq6JQ/3akZlghhyGgV1QWKORUyePI7y34TurfpNul
 lbXJ2/CGWYeoZoaFvTFuCDiFV77ukg5G4jkW7zxavJxR5Nu9n6YK9jge0NrQLBVZRn98
 2iKwxCa3AG3Gw/qoVYPviTdk3Pg09O2gt+Uir8MaptECLS67105WegeBS+GaY7M9pjFY
 IYDuPbTt9Giu0qwr0hmF2HCy6PWBnJwYrfJpea+WgfRdthyWDTQG53cInqQWttE0L2ZH
 R8dGHjYkG7ssu5qBwH4pkpA8QSpjjP31KkWnNZ0D9m0v8Pj5Y4VwG0HRtxW8uGRPSDhc
 FbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fq5EiwvFx5q9sBjRycwRwjCKfYTdfMVhpxypdyTT44M=;
 b=LvYrdCQb1hsXxmbJdbEHtAnj2GpU6XL8fZSU/G8Co9eG4vP2fSRlSObSTbHCSLwV6K
 MkHcllSnGNznAZd/6URcg4agWNKatkn0Z2vMVyicwBs/FaHDa8RZaSsPl3lWf0AJOarE
 2K9Bj0gejQ4ZFxi8WKnpUS6ibJkKaFdqkUD28Zk07h8eFfrmk14LDQj0ZXKk3M1j7K23
 Xv1OC5FUSBNvGIRJBu3NJZxVp4Fi0ySJKg/LKCZGTzqyQeWeq8KfAD2L5CuIRe9mm4pm
 9mifUkB4TvNU5WEzTAhLc4zPE/uvqQkjT17v1C0gQIAVVN1MVwjghgCO3vpZ26l1DPrj
 38cw==
X-Gm-Message-State: AFqh2krW0wUD3jPc617TjNpJ+QnwtGbGWGEilwXmQj3pEEY3HPb5445a
 Gakznwih8cI7RfJ9dP/DLQd3Rg==
X-Google-Smtp-Source: AMrXdXsulXgacbJYElkpfNDsVUbCzylD/dY6JtmLSKOFwq+AHZUSUS65j+5vIXesjafwGx6FV6YFPw==
X-Received: by 2002:a17:906:36ce:b0:838:1b80:9a7a with SMTP id
 b14-20020a17090636ce00b008381b809a7amr66237619ejc.12.1673598708053; 
 Fri, 13 Jan 2023 00:31:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a17090613d300b00862bfccf477sm2180179ejc.78.2023.01.13.00.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:31:47 -0800 (PST)
Message-ID: <787212be-990f-1e61-c814-17958ee0c47c@linaro.org>
Date: Fri, 13 Jan 2023 09:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
Content-Language: en-US
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
 <MA0PR01MB71451A4A70DBD85680E90AE0FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZDowp=-Cqvy=hJzQDDN_+cEUS7Pj-GJ-0oAhqq=N2STWw@mail.gmail.com>
 <MA0PR01MB7145B5094B0E3FB35764DE9FFFC29@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <MA0PR01MB7145B5094B0E3FB35764DE9FFFC29@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:18 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "Markus.Niebel@ew.tq-group.com" <Markus.Niebel@ew.tq-group.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tommaso.merciai@amarulasolutions.com" <tommaso.merciai@amarulasolutions.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "ryan.lee.analog@gmail.com" <ryan.lee.analog@gmail.com>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 06:50, Hardevsinh Palaniya wrote:
> From d2001cdbc2fda3345af307b4cf3d0f2e53d80c35 Mon Sep 17 00:00:00 2001
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Date: Fri, 13 Jan 2023 11:01:22 +0530

That's still not correct patch format.

> Subject: [PATCH] Add dts to support MAX98090/91 with i.MX8MM-evk

That's still not correct subject. You already got this comment and
ignored it.

Your recipient list is enormous. Use get_maintainers.pl. You already got
this comment and ignored it.

If you intend to ignore all the comments, then this is NAK.

This is v2? Patch subject should be marked with it. You need to add
changelog.

> 
> - Add sound-max98090 node to support external codec MAX98090/91

Why? Explain what you want to achieve and why do you do it.

> - Use i2c3 for i2c communicate with codec
> - Use sai5 for i2s communication
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts
> new file mode 100644
> index 000000000000..d053c586514a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts

That's a dead code without Makefile.

Missing bindings.

> @@ -0,0 +1,65 @@
> +#include "imx8mm-evk.dtsi"
> +
> +/ {
> +	sound-max98090 {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "max98090-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets = "Speakers", "Speakers";
> +		simple-audio-card,routing =
> +				"Speakers", "SPKR",
> +				"Speakers", "SPKL",
> +				"IN1", "MICBIAS",
> +				"MIC1","IN1",
> +				"MIC2","IN1";
> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai5>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <32>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&max98090>;
> +			clocks = <&clk IMX8MM_CLK_SAI5_ROOT>;
> +		};
> +	};
> +}
> +
> +&i2c3 {
> +	max98090: audio-codec@10 {
> +		compatible = "maxim,max98090","maxim,max98091";

You either ignored the comment or misread it. Go back to previous code.

> +		#sound-dai-ceddlls = <0>;

This is no way working... Test your code against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof

