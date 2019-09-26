Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4EBF344
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B73A71738;
	Thu, 26 Sep 2019 14:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B73A71738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569501941;
	bh=bryzQffpIrxWjn5eayWoItRURpGYsfMT15b0WFCwvVU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeKJvpRaSHaPaExvtdx4N+S5oVnvQmgvCuy1DxrFRLWZCc4AtO5tnNikRC9RTkxwb
	 DwsfgYEONajZN3liTc6yAiJspi/pVYHOETBgFOZDk0QGjh3mKWM5qYSgyelIK9p0MX
	 amcceYbSPHUnuU2wa7dP5zcSeNYTH6u5LZYAdFgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F89F80140;
	Thu, 26 Sep 2019 14:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DFFF802BD; Thu, 26 Sep 2019 14:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5EF6F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EF6F80138
Received: by mail-wr1-f67.google.com with SMTP id v8so2614033wrt.2
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 05:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hlzu40S+QsmZibZuhvWm+mQ9H7Yk8OgsXl+yxJYzbpM=;
 b=uSSvH2l3UcJhTha46GL1IxOEps3L4liW8KY8y8bt3ABI2e4TAv7ND0IlKwGxNFOGf5
 gaxndbeWTDfbgsgYJasWa/9Szi09NVLmHX8zfyX7WSd4ZivftU5ow/OagKz8oDB8Fv6y
 V6FyiR7+H5fC1Y14x/v8qK00RYK3THIsNGvketcmi0WmOx51yUrx63+BdfAlb9XHAtEK
 GotfLUXSwtpM0/5quTTiqh0kzY/Xyx3Hp3jVmyuL+ajASurBqaxfTg46QwPZLPkSxgQl
 GNZXbDrfOTKwld40QVfmd/V5RdxwJBEaXdIl5S1JeThRIdJEvGtZnlYOSjGdjxD7Srlx
 PhXw==
X-Gm-Message-State: APjAAAUtJK7CJvpFNTKm+2jj2HXR+EBF5Fs5b88WUNCjHv69oFLL9yHB
 8vuwVz96QkZ+OBSjV2gNZtk=
X-Google-Smtp-Source: APXvYqx8inhcJv/PaUWEMATgFiD1pLE0aHXDq51Vd6Cn7R4NZNObwx1ck287H2nKBnvUdj1wwqnFRQ==
X-Received: by 2002:a5d:5708:: with SMTP id a8mr2744494wrv.240.1569501829852; 
 Thu, 26 Sep 2019 05:43:49 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id w12sm4112004wrg.47.2019.09.26.05.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 05:43:49 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:43:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maciej Falkowski <m.falkowski@samsung.com>
Message-ID: <20190926124346.GA15876@pi3>
References: <CGME20190924150230eucas1p295da8f6aa018aec4acabc068f6e1afa1@eucas1p2.samsung.com>
 <20190924150146.15972-1-m.szyprowski@samsung.com>
 <20190924152028.GD9218@pi3>
 <50932d65-6d8b-aca2-2bec-d4eedaba0bdc@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50932d65-6d8b-aca2-2bec-d4eedaba0bdc@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH] dt-bindings: sound: Convert Samsung
 Exynos5433 TM2(E) audio complex with WM5110 codec to dt-schema
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

On Thu, Sep 26, 2019 at 01:49:09PM +0200, Maciej Falkowski wrote:
> 
> On 9/24/19 5:20 PM, Krzysztof Kozlowski wrote:
> > On Tue, Sep 24, 2019 at 05:01:46PM +0200, Marek Szyprowski wrote:
> >> From: Maciej Falkowski <m.falkowski@samsung.com>
> >>
> >> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to newer dt-schema format.
> >>
> >> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
> >>   .../bindings/sound/samsung,tm2-audio.yaml     | 83 +++++++++++++++++++
> >>   2 files changed, 83 insertions(+), 42 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> >> deleted file mode 100644
> >> index f5ccc12ddc00..000000000000
> >> --- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> >> +++ /dev/null
> >> @@ -1,42 +0,0 @@
> >> -Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
> >> -
> >> -Required properties:
> >> -
> >> - - compatible		 : "samsung,tm2-audio"
> >> - - model		 : the user-visible name of this sound complex
> >> - - audio-codec		 : the first entry should be phandle of the wm5110 audio
> >> -			   codec node, as described in ../mfd/arizona.txt;
> >> -			   the second entry should be phandle of the HDMI
> >> -			   transmitter node
> >> - - i2s-controller	 : the list of phandle and argument tuples pointing to
> >> -			   I2S controllers, the first entry should be I2S0 and
> >> -			   the second one I2S1
> >> - - audio-amplifier	 : the phandle of the MAX98504 amplifier
> >> - - samsung,audio-routing : a list of the connections between audio components;
> >> -			   each entry is a pair of strings, the first being the
> >> -			   connection's sink, the second being the connection's
> >> -			   source; valid names for sources and sinks are the
> >> -			   WM5110's and MAX98504's pins and the jacks on the
> >> -			   board: HP, SPK, Main Mic, Sub Mic, Third Mic,
> >> -			   Headset Mic
> >> - - mic-bias-gpios	 : GPIO pin that enables the Main Mic bias regulator
> >> -
> >> -
> >> -Example:
> >> -
> >> -sound {
> >> -	compatible = "samsung,tm2-audio";
> >> -	audio-codec = <&wm5110>, <&hdmi>;
> >> -	i2s-controller = <&i2s0 0>, <&i2s1 0>;
> >> -	audio-amplifier = <&max98504>;
> >> -	mic-bias-gpios = <&gpr3 2 0>;
> >> -	model = "wm5110";
> >> -	samsung,audio-routing =
> >> -		"HP", "HPOUT1L",
> >> -		"HP", "HPOUT1R",
> >> -		"SPK", "SPKOUT",
> >> -		"SPKOUT", "HPOUT2L",
> >> -		"SPKOUT", "HPOUT2R",
> >> -		"Main Mic", "MICBIAS2",
> >> -		"IN1R", "Main Mic";
> >> -};
> >> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> >> new file mode 100644
> >> index 000000000000..377f8cbe17b8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> >> @@ -0,0 +1,83 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: https://protect2.fireeye.com/url?k=ccb9abe11b8a2745.ccb820ae-a91cd712f01d248e&u=http://devicetree.org/schemas/sound/samsung,tm2-audio.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Samsung Exynos SoC Exynos5433 TM2(E) audio complex with WM5110 codec
> >> +
> >> +maintainers:
> >> +  - Krzysztof Kozlowski <krzk@kernel.org>
> >> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: samsung,tm2-audio
> >> +
> >> +  model:
> >> +    maxItems: 1
> > $ref to string, then maxItems are not needed.
> > Add description (copy-paste).
> 
> Hi Krzysztof,
> 
> You're right, model is not a standard property.
> 
> >> +
> >> +  audio-codec:
> >> +    allOf:
> >> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +      - items:
> >> +          - description: |
> >> +              phandle of the wm5110 audio codec node,
> >> +              as described in ../mfd/arizona.txt;
> >> +          - description: phandle of the HDMI transmitter node.
> >> +
> >> +  i2s-controller:
> >> +    allOf:
> >> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +      - items:
> >> +          - description: phandle of the I2S0.
> >> +          - description: phandle of the I2S1.
> >> +
> >> +  audio-amplifier:
> > Can you order the nodes here and in required section by name (except
> > compatible which should be first)?
> 
> Current order is already well-established across bindings (even example).
> I think that sorted properties are undesired with that.

OK, good point, so leave the standard properties in order matching
example-bindings. However order the reset because "audio-codec", then
"i2s-controler" and then again "audio-...". So bring some order here.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
