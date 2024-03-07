Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E55875137
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 15:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436BEAE8;
	Thu,  7 Mar 2024 15:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436BEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709820252;
	bh=BT6wZ8BkYsfqnC5k7BF68W2twgRaf3YZsPmPjxc0vlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nSkyEqXv8TqoKutIaKRw57KpEq9vlo4aOQqao6FHCRpKhJO8iCk0dZgVUTJ3M5zx4
	 sxVtkXAyM5eeRmrPQWD97/U9/l9GudehnMTC2xpox2Am9xyUlov8WrCbILH3PMq+7A
	 +/3FMZRAE9hoOIBFfycj8TTf1TE5qMZarfgQ7+GI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC93F805AB; Thu,  7 Mar 2024 15:03:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DC4F805A1;
	Thu,  7 Mar 2024 15:03:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A1EF8024E; Thu,  7 Mar 2024 15:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39679F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 15:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39679F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l4i2MgqQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9D98CE1E6C
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 14:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C1DC43601
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709820202;
	bh=BT6wZ8BkYsfqnC5k7BF68W2twgRaf3YZsPmPjxc0vlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l4i2MgqQi7dBV2AMWQqeN/x4ZI33q7IDuCEs9u29UKfVporSkihwVAklhbtxuL2Ox
	 hGOsGyVVZV9zYRY1DjacKS9iEOM/SP78MsCoHQcjcxjYYWvQ4TSzVJqvOX3ksglWyo
	 a/xTqCcvQj3v8+P9Jfnxqc+Ry6ojRQEuqzdjUExki22T00eO6YPOAC81Am82Ydk2br
	 XxYfhyUxBKTq0Df+W4R1Sk7dFwmPjjlPtgyZSV/EBp2RIj24t5U6LW/RqBDoMfEWaX
	 IVqx4BzQemssOb0TuGZT+gcVSHx9qjv9CibiaHu4VvW+WiV4R6SrWvZU4NCkYk1LtK
	 +hW4IRf1xo7Zw==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5132181d54bso1051350e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Mar 2024 06:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVoAtIY0JyxwaiLL5XSCfR3zujr49Zwam3oh54UFfkptfb/l4C3xIg5WOxLmNS4WsvRE02QAQyOYzUhtyjFd8CfmhQZyWIhW1SmCGc=
X-Gm-Message-State: AOJu0YyMLtOWMY3PS9coV8/pFwn/k0ax4TD/EwwBXHDJcu1zeh9l6/L2
	fADL6+NwupZRT7kXLS04TOSG9Jp6Bj8mPgIpVbdoWxPTwUpIrLE7qgm4bC6W0CyqgoC47DXM18Q
	1LItNTt6WLtTIOFhyb0Kaej55og==
X-Google-Smtp-Source: 
 AGHT+IF5Dc5jk0XZHS0IhbnbHN0DQ1ZhYnHDMr7Hbwtb+vashJF0QYaWL7v2IywW1l6pNzIj3tTpk4NskZfQ4ky22lQ=
X-Received: by 2002:a05:6512:1094:b0:513:30fb:d64 with SMTP id
 j20-20020a056512109400b0051330fb0d64mr1862716lfg.44.1709820199915; Thu, 07
 Mar 2024 06:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
 <20240304142341.GA156846-robh@kernel.org>
 <0aa3dc07-67c8-40a4-9e83-f702979765c5@collabora.com>
In-Reply-To: <0aa3dc07-67c8-40a4-9e83-f702979765c5@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 Mar 2024 08:03:06 -0600
X-Gmail-Original-Message-ID: 
 <CAL_JsqLNsS_Rx5z5F1vrYbr2g+5-wGYOq6mhtfUd7Db11F0W+Q@mail.gmail.com>
Message-ID: 
 <CAL_JsqLNsS_Rx5z5F1vrYbr2g+5-wGYOq6mhtfUd7Db11F0W+Q@mail.gmail.com>
Subject: Re: [PATCH 19/22] ASoC: dt-bindings: mt8192: Document audio-routing
 and dai-link subnode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
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
Message-ID-Hash: IANJ3CFS4OUM3FC5N2UHWE6GBHUTZTBU
X-Message-ID-Hash: IANJ3CFS4OUM3FC5N2UHWE6GBHUTZTBU
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IANJ3CFS4OUM3FC5N2UHWE6GBHUTZTBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 5, 2024 at 5:20=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/03/24 15:23, Rob Herring ha scritto:
> > On Tue, Feb 27, 2024 at 01:09:36PM +0100, AngeloGioacchino Del Regno wr=
ote:
> >> Document the dai-link subnodes and the audio-routing property, allowin=
g
> >> to describe machine specific audio hardware and links in device tree.
> >>
> >> While at it, also deprecate the old properties which were previously
> >> used with the driver's partially hardcoded configuration.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 129 ++++++++++++++++=
--
> >>   1 file changed, 121 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1=
015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1=
015-rt5682.yaml
> >> index 7e50f5d65c8f..78e221003750 100644
> >> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5=
682.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5=
682.yaml
> >> @@ -20,6 +20,15 @@ properties:
> >>         - mediatek,mt8192_mt6359_rt1015p_rt5682
> >>         - mediatek,mt8192_mt6359_rt1015p_rt5682s
> >>
> >> +  audio-routing:
> >> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >
> > Already defined in sound-card-common.yaml. Add a $ref.
> >
>
> Right. Done for v2.
>
> >> +    description:
> >> +      A list of the connections between audio components. Each entry =
is a
> >> +      pair of strings, the first being the connection's sink, the sec=
ond
> >> +      being the connection's source.
> >> +      Valid names could be the input or output widgets of audio compo=
nents,
> >> +      power supplies, MicBias of codec and the software switch.
> >
> > Generally the names are defined here.
> >
>
> ...but those drivers want to support multiple codecs and multiple boards,=
 so
> for each board we would maybe have to add (software defined) names in her=
e
> which don't always correspond to a HW pin name (but that's not really a p=
roblem).
>
> Sure a subset of the names can't change but, on the other hand, some othe=
rs
> can (as in, may be added).
>
> Hence the question:
>
> Is it mandatory to define the names in an enum here, or can that be avoid=
ed?
> If it is, I can add them no problem.

Does the OS depend on what the names are? As-in if a name was "bar"
and it changed to "baz" in either the DT or the kernel, would that
break things? If yes, then yes, you need them defined here.

>
> >> +
> >>     mediatek,platform:
> >>       $ref: /schemas/types.yaml#/definitions/phandle
> >>       description: The phandle of MT8192 ASoC platform.
> >> @@ -27,10 +36,12 @@ properties:
> >>     mediatek,hdmi-codec:
> >>       $ref: /schemas/types.yaml#/definitions/phandle
> >>       description: The phandle of HDMI codec.
> >> +    deprecated: true
> >>
> >>     headset-codec:
> >>       type: object
> >>       additionalProperties: false
> >> +    deprecated: true
> >>
> >>       properties:
> >>         sound-dai:
> >> @@ -41,6 +52,7 @@ properties:
> >>     speaker-codecs:
> >>       type: object
> >>       additionalProperties: false
> >> +    deprecated: true
> >>
> >>       properties:
> >>         sound-dai:
> >> @@ -51,13 +63,83 @@ properties:
> >>       required:
> >>         - sound-dai
> >>
> >> +patternProperties:
> >> +  ".*-dai-link$":
> >> +    type: object
> >> +    description:
> >> +      Container for dai-link level properties and CODEC sub-nodes.
> >> +
> >> +    properties:
> >> +      link-name:
> >> +        description: Indicates dai-link name and PCM stream name
> >> +        items:
> >> +          enum:
> >> +            - I2S0
> >> +            - I2S1
> >> +            - I2S2
> >> +            - I2S3
> >> +            - I2S4
> >> +            - I2S5
> >> +            - I2S6
> >> +            - I2S7
> >> +            - I2S8
> >> +            - I2S9
> >> +            - TDM
> >> +
> >> +      codec:
> >> +        description: Holds subnode which indicates codec dai.
> >> +        type: object
> >> +        additionalProperties: false
> >> +        properties:
> >> +          sound-dai:
> >> +            minItems: 1
> >> +            maxItems: 2
> >> +        required:
> >> +          - sound-dai
> >> +
> >> +      dai-format:
> >> +        description: audio format
> >> +        items:
> >> +          enum:
> >> +            - i2s
> >> +            - right_j
> >> +            - left_j
> >> +            - dsp_a
> >> +            - dsp_b
> >> +
> >> +      mediatek,clk-provider:
> >> +        $ref: /schemas/types.yaml#/definitions/string
> >> +        description: Indicates dai-link clock master.
> >> +        items:
> >> +          enum:
> >> +            - cpu
> >> +            - codec
> >> +
> >> +    additionalProperties: false
> >
> > Move this before properties.
> >
>
> Done for v2.
>
> >> +
> >> +    required:
> >> +      - link-name
> >> +
> >>   additionalProperties: false
> >>
> >>   required:
> >>     - compatible
> >>     - mediatek,platform
> >> -  - headset-codec
> >> -  - speaker-codecs
> >> +
> >> +allOf:
> >> +  # Disallow dai-link-xxx nodes if the legacy properties are specifie=
d
> >
> > xxx-dai-link?
> >
>
> Oh! Yes, thanks for catching this.
>
> That's what I initially wanted to do, but then I opted for xxx-dai-link a=
nd
> forgot to update this comment.
>
> Fixed for v2.
>
> >> +  - if:
> >> +      patternProperties:
> >> +        ".*-dai-link$": false
> >> +    then:
> >> +      required:
> >> +        - headset-codec
> >> +        - speaker-codecs
> >> +    else:
> >> +      properties:
> >> +        headset-codec: false
> >> +        speaker-codecs: false
> >> +        mediatek,hdmi-codec: false
> >
> > Allowing both would preserve compatibility. That's not needed? If so,
> > say why in the commit msg.
> >
>
> I'm thinking of writing:
>
> "Since describing machine specific audio hardware and links replaces the
> now deprecated old logic doing the same in a driver hardcoded fashion,
> it is not allowed to have both the old and new properties together."

What happened to that. Instead you just sent a new version with
nothing about this.

> ...but in short - both the old and the new can do exactly the same, but
> imo it doesn't make any sense to actually rely on both as:
>   1. It's redundant (and one set of them makes the other useless);
>   2. I want to avoid confusion (as the other set won't be parsed);
>   3. I'm trying to *enforce* consistency as MTK cards have different
>      bindings for .. really, no good reason;
>   4. I want to see custom stuff disappear completely (and/or as much as
>      possible anyway) and use something that is (at least somewhat) commo=
n
>      between all MTK and non-MTK or anyway as a start at least consistent
>      between MTK cards.
>
> In theory, though, speaking of the driver side, there's nothing preventin=
g
> you from specifying both audio-routing xxx-dai-link and mediatek,hdmi-cod=
ec,
> as the drivers' action will be, in short
>     if (new_bindings)
>       forget_about_old_bindings_use_the_new_ones();
>     else
>       use_old_hardcoded_stuff(); /* and be sad */

That works for newer kernels with this change, but existing kernels
will only have:

use_old_hardcoded_stuff(); /* and not know it's sad */

If you want to support a new DT and old kernel, you need to populate
both properties.

> For that, I really don't want to allow both sets of properties - please, =
please,
> tell me that I don't *have to* remove this block :-)

Ultimately it is your decision as Mediatek maintainer, not mine. My
only requirement is the commit message explain why the above
combination is not important for these platforms.

You could leave it, but keep both in the dts files for some time
period. That will cause warnings, but what's a few more. The ABI
doesn't have to be a forever thing. Things evolve and there will be
other reasons to upgrade.

Rob
