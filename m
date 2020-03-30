Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E621984BE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 21:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8794E1614;
	Mon, 30 Mar 2020 21:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8794E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585597308;
	bh=RKSM/K6qKTbNRXtkVhC4q4/tipZmWkOQEDJ0CHGO8MI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBDUbEmKyQFXX+bW9qG3FhROs30sUOhsvMPaYx6dEH3XcpsUsQVbgKMGwtNt3CoH+
	 IudLDktBgEllsHr1gEc8T4f6VhCTkngVoor63TgSHMpfQ7vaKTgcqj5xO2Qm8b/mnO
	 G4G2AXtnx6egpYHR0TgXXFO6n+t0BZqAX0XXHEGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 912D9F8014A;
	Mon, 30 Mar 2020 21:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ABDBF8014A; Mon, 30 Mar 2020 21:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA3FF800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 21:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA3FF800AA
Received: by mail-io1-f68.google.com with SMTP id x9so12687613iom.10
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 12:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=clmsQJK4BMI8m2Z/sWQrrUlWM9WX3L6ITcoHrmc1DJw=;
 b=I1blHC+m4tDztABCCqStvSQ4PrzflP/w4AVCuVoIJ2TrxUjWfsWKDAeuwH12LY0ua1
 /N98MuS+XKOwfkw6EzOtZpRLwXv5/zkvJqzg4NBb/zQwnLDyZlF//l+MIK+zjEM64XhB
 jZDM9b6YicgU1YF+8VqEc19kmE+PYsjS/90JOw2KCDs+QR3RNjkgHFzvchdddlwqTH66
 ZBEnjaVsZ+Le3HRNgdfd6N5+/iFvZs34WC8rncos4IuENh9fZfvZWTdr121flXrt8xxZ
 nxgyzl6tQhoGiFAKsJeohF1d1Xbrm2YL8kEfxSe7v4ubVbZ6tdQFYYITUuTFpamgg7Gu
 57gw==
X-Gm-Message-State: ANhLgQ33KSicL9GteupFu00TCVjbeatoYhzCCsdEPUHEncOOhJH1PiCD
 HsqPhb1hugQ1JnoO2V63lg==
X-Google-Smtp-Source: ADFU+vuJvWcNlXMQdJNMUkyw9q7uDOBjMSajkXwEQcU+iQ0lcBY6IAptPDeVBvzuz6t96cWWyprB8g==
X-Received: by 2002:a6b:d609:: with SMTP id w9mr12027791ioa.41.1585597196788; 
 Mon, 30 Mar 2020 12:39:56 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id l70sm5226774ili.81.2020.03.30.12.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 12:39:55 -0700 (PDT)
Received: (nullmailer pid 12120 invoked by uid 1000);
 Mon, 30 Mar 2020 19:39:53 -0000
Date: Mon, 30 Mar 2020 13:39:53 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: simple-card: switch to yaml base
 Documentation
Message-ID: <20200330193953.GA22908@bogus>
References: <871rpsq3bx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rpsq3bx.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Mon, Mar 16, 2020 at 02:24:50PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> This patch is assuming that "sound-dai" is already defined.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v2 -> v3
> 
> 	- uses maxItems for many place which were already defined.
> 	- assuming that "sound-dai" is already defined
> 	- (@.*) -> (@[0-9a-f]+)
> 
>  .../devicetree/bindings/sound/simple-card.txt | 351 -------------
>  .../bindings/sound/simple-card.yaml           | 487 ++++++++++++++++++
>  2 files changed, 487 insertions(+), 351 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/simple-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/simple-card.yaml

> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> new file mode 100644
> index 000000000000..cd5ea50daa22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -0,0 +1,487 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/simple-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Audio Card Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +definitions:
> +
> +  frame-master:
> +    description: Indicates dai-link frame master.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - maxItems: 1
> +
> +  bitclock-master:
> +    description: Indicates dai-link bit clock master
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - maxItems: 1
> +
> +  frame-inversion:
> +    description: dai-link uses frame clock inversion
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  bitclock-inversion:
> +    description: dai-link uses bit clock inversion
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  dai-tdm-slot-num:
> +    description: see tdm-slot.txt.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  dai-tdm-slot-width:
> +    description: see tdm-slot.txt.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  clocks:
> +    maxItems: 1

Only used in one place, just move there.

> +
> +  system-clock-frequency:
> +    description: |
> +      If a clock is specified and a multiplication factor is given with
> +      mclk-fs, the clock will be set to the calculated mclk frequency
> +      when the stream starts.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  system-clock-direction-out:
> +    description: |
> +      specifies clock direction as 'out' on initialization.
> +      It is useful for some aCPUs with fixed clocks.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  mclk-fs:
> +    description: |
> +      Multiplication factor between stream rate and codec mclk.
> +      When defined, mclk-fs property defined in dai-link sub nodes are ignored.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  aux-devs:
> +    description: |
> +      List of phandles pointing to auxiliary devices, such
> +      as amplifiers, to be added to the sound card.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  convert-rate:
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  convert-channels:
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  prefix:
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  label:
> +    maxItems: 1
> +
> +  routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +
> +  widgets:
> +    description: User specified audio sound widgets.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +
> +  pin-switches:
> +    description: the widget names for which pin switches must be created.
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  format:
> +    description: audio format.
> +    items:
> +      enum:
> +        - i2s
> +        - right_j
> +        - left_j
> +        - dsp_a
> +        - dsp_b
> +        - ac97
> +        - pdm
> +        - msb
> +        - lsb
> +
> +  dai:
> +    type: object
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +
> +      # common properties
> +      mclk-fs:
> +        $ref: "#/definitions/mclk-fs"
> +      prefix:
> +        $ref: "#/definitions/prefix"
> +      frame-inversion:
> +        $ref: "#/definitions/frame-inversion"
> +      bitclock-inversion:
> +        $ref: "#/definitions/bitclock-inversion"
> +      frame-master:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +      bitclock-master:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      dai-tdm-slot-num:
> +        $ref: "#/definitions/dai-tdm-slot-num"
> +      dai-tdm-slot-width:
> +        $ref: "#/definitions/dai-tdm-slot-width"
> +      clocks:
> +        $ref: "#/definitions/clocks"
> +      system-clock-frequency:
> +        $ref: "#/definitions/system-clock-frequency"
> +      system-clock-direction-out:
> +        $ref: "#/definitions/system-clock-direction-out"
> +    required:
> +      - sound-dai
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - simple-audio-card
> +        - simple-scu-audio-card
> +
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 0
> +
> +  label:
> +    $ref: "#/definitions/label"
> +
> +  simple-audio-card,name:
> +    description: User specified audio sound card name.
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +# use patternProperties to use "#definitions/xxx"

Huh? The meta-schema gives you an error? We should fix that, not 
work-around it.

> +patternProperties:
> +  "^simple-audio-card,widgets$":
> +    $ref: "#/definitions/widgets"
> +  "^simple-audio-card,routing$":
> +    $ref: "#/definitions/routing"
> +  "^simple-audio-card,cpu(@[0-9a-f]+)?":
> +    $ref: "#/definitions/dai"
> +  "^simple-audio-card,codec(@[0-9a-f]+)?":
> +    $ref: "#/definitions/dai"
> +
> +  # common properties
> +  "^simple-audio-card,frame-master$":
> +    $ref: "#/definitions/frame-master"
> +  "^simple-audio-card,bitclock-master$":
> +    $ref: "#/definitions/bitclock-master"
> +  "^simple-audio-card,frame-inversion$":
> +    $ref: "#/definitions/frame-inversion"
> +  "^simple-audio-card,bitclock-inversion$":
> +    $ref: "#/definitions/bitclock-inversion"
> +  "^simple-audio-card,format$":
> +    $ref: "#/definitions/format"
> +  "^simple-audio-card,mclk-fs$":
> +    $ref: "#/definitions/mclk-fs"
> +  "^simple-audio-card,aux-devs$":
> +    $ref: "#/definitions/aux-devs"
> +  "^simple-audio-card,convert-rate$":
> +    $ref: "#/definitions/convert-rate"
> +  "^simple-audio-card,convert-channels$":
> +    $ref: "#/definitions/convert-channels"
> +  "^simple-audio-card,prefix$":
> +    $ref: "#/definitions/prefix"
> +  "^simple-audio-card,pin-switches$":
> +    $ref: "#/definitions/pin-switches"
> +  "^simple-audio-card,hp-det-gpio$":
> +    maxItems: 1
> +  "^simple-audio-card,mic-det-gpio$":
> +    maxItems: 1
> +
> +  "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Container for dai-link level properties and the CPU and CODEC sub-nodes.
> +      This container may be omitted when the card has only one DAI link.
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      # common properties
> +      frame-master:
> +        $ref: "#/definitions/frame-master"
> +      bitclock-master:
> +        $ref: "#/definitions/bitclock-master"
> +      frame-inversion:
> +        $ref: "#/definitions/frame-inversion"
> +      bitclock-inversion:
> +        $ref: "#/definitions/bitclock-inversion"
> +      format:
> +        $ref: "#/definitions/format"
> +      mclk-fs:
> +        $ref: "#/definitions/mclk-fs"
> +      aux-devs:
> +        $ref: "#/definitions/aux-devs"
> +      convert-rate:
> +        $ref: "#/definitions/convert-rate"
> +      convert-channels:
> +        $ref: "#/definitions/convert-channels"
> +      prefix:
> +        $ref: "#/definitions/prefix"
> +      pin-switches:
> +        $ref: "#/definitions/pin-switches"
> +      hp-det-gpio:
> +        maxItems: 1
> +      mic-det-gpio:
> +        maxItems: 1
> +
> +    patternProperties:
> +      "^cpu(@[0-9a-f]+)?":
> +        $ref: "#/definitions/dai"
> +      "^codec(@[0-9a-f]+)?":
> +        $ref: "#/definitions/dai"
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
