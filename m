Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BF350205
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 16:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23681681;
	Wed, 31 Mar 2021 16:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23681681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617200295;
	bh=eL91uyDgEVR7LcPESV3BoTdsM+880ShbnILq99ubHig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jBRJkanJujGcIZ8kDQ8iMpOf4fHUGjFblmiljgEzzU8lly7sIt/u9UWqXnOIs9En+
	 9SLBvsZAeawDuG4KRqh/DlB0h29UWyFo5LcxTT3cvfQGdC6kiA5vXRQkINho0Lb0nT
	 JZ6STD3kAYnanI9cKmWcK6I6yu2SfidqDmNAcVZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C41F8015A;
	Wed, 31 Mar 2021 16:16:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6530F80166; Wed, 31 Mar 2021 16:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76504F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 16:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76504F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ffAuPYk7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80EEC60FDC
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617200197;
 bh=eL91uyDgEVR7LcPESV3BoTdsM+880ShbnILq99ubHig=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ffAuPYk7iWufAbgh+MbeMY9VAnT6lFxFK7C5cHXY+nXJJk59UD1vUoloU46zmcoSw
 Hy9jwaGy26ZoqFwsOMIQlf/+LISy7fN72VIx2yVp8iOXc7Iqwq1fhG3jm4P1JaCzvX
 K9ZqiS8IGGEnHAZ3ssIJ4xIPkzDFd7Rimo32pgj3POHlsqrjsRzpOXw3QKZZAKEHoZ
 Wj79pyaYaxIdVBIxmrnBMCAvDZk16NXkYnvVLK0JqkZMB+bYXbehEWHU2pwMO7kM2G
 SU1u+xeo6fsCdPjKOVGhu6xReytWfqUBb4So+I/r5ripJ/DCXHIFh5nhAos4Va4OeT
 ET6V58uSSH4dg==
Received: by mail-ej1-f53.google.com with SMTP id kt15so30280174ejb.12
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 07:16:37 -0700 (PDT)
X-Gm-Message-State: AOAM530FMo1EtpifWqA5OilKc6qXNfNUw3jE/5za8rLVKyDA+q1WT6Bp
 9U2SBZKz2VSWL1xfO376AR04LUD8mj/x9CYdFQ==
X-Google-Smtp-Source: ABdhPJzejcI3xzmZROqjlnBx1vvqU0QBzSUUdnWfIjLGXf048kmTMHFktdrHEhXvDIFX0KiSYxvRaQ/o7vvnbbw1RAY=
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr3647628ejr.525.1617200195984; 
 Wed, 31 Mar 2021 07:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
 <1615383186-18500-2-git-send-email-argus.lin@mediatek.com>
In-Reply-To: <1615383186-18500-2-git-send-email-argus.lin@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 31 Mar 2021 09:16:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-TvUZOZ8Eev5zrq2aA59SLLEMVV3Ypq-07bNccp=NRw@mail.gmail.com>
Message-ID: <CAL_JsqL-TvUZOZ8Eev5zrq2aA59SLLEMVV3Ypq-07bNccp=NRw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359
 ASoC accdet jack document
To: Argus Lin <argus.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chipeng Chang <chipeng.chang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jack Yu <jack.yu@realtek.com>, "Shane.Chien" <shane.chien@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Mar 10, 2021 at 7:33 AM Argus Lin <argus.lin@mediatek.com> wrote:
>
> This patch adds MediaTek MT6359 ASoC accdet jack document.

Seems this never made it to the DT list so no checks ran. It's got all
sorts of errors:

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
be fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
fixed:
 '$ref' is a required property
 'allOf' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
must be fixed:
 'type' is a required property
 Additional properties are not allowed ('maxItems' was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
must be fixed:
 'enum' is a required property
 'const' is a required property
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
must be fixed:
 '$ref' is a required property
 'allOf' is a required property


> Signed-off-by: Argus Lin <argus.lin@mediatek.com>
> ---
>  .../bindings/sound/mt6359-accdet.yaml         | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
> new file mode 100644
> index 000000000000..7fb3e8dfb4c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
> +
> +maintainers:
> +  - Chipeng Chang <chipeng.chang@mediatek.com>
> +
> +description: |
> +  This binding describes the Mediatek Technologies MT6359 ASoC
> +  accdet jack driver.
> +
> +properties:
> +  mediatek,accdet-name:
> +    maxItems: 1
> +    description: named as "mt6359-accdet" jack.

Sounds like a constraint. Why do you need this in DT if only 1 value?
And why expose an SoC specific name to userspace (I guess)?

> +
> +  mediatek,mic-vol:
> +    maxItems: 1

This is an array because 'maxItems' is for arrays? It needs a type
reference. Same problem throughout.

> +    description: |
> +      accdet micbias1 voltage.
> +
> +      enum:

The indentation is wrong here, so this is just part of 'description'.

> +        - 0x00 # 1.7v - micbias1 volage is 1.7v.
> +        - 0x01 # 1.8v - micbias1 volage is 1.8v.
> +        - 0x02 # 1.9v - micbias1 volage is 1.9v.
> +        - 0x03 # 2.0v - micbias1 volage is 2.0v.
> +        - 0x04 # 2.1v - micbias1 volage is 2.1v.
> +        - 0x05 # 2.5v - micbias1 volage is 2.5v.
> +        - 0x06 # 2.6v - micbias1 volage is 2.6v.
> +        - 0x07 # 2.7v - micbias1 volage is 2.7v.
> +        - 0x08 # 2.8v - micbias1 volage is 2.8v.
> +        - 0x09 # 2.85v - micbias1 volage is 2.85v.
> +
> +  mediatek,mic-mode:
> +    maxItems: 1
> +    description: |
> +      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
> +
> +      enum:
> +        - 0x01 # ACC - ACC mode.
> +        - 0x02 # DCC - low cost without in bias.
> +        - 0x06 # DCC - low cost with in bias.
> +
> +  mediatek,pwm-deb-setting:
> +    maxItems: 15
> +    description: |
> +       headset-mode-setting : Indicates customized pwm, debounce setting
> +       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
> +       debounce0, debounce1, debounce3, debounce4
> +       eint pwm_width, eint pwm_thresh
> +       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.

This is a string?

> +
> +  mediatek,eint-use-ap:
> +    maxItems: 1
> +    description: |
> +      indicates to use ap gpio.
> +
> +      enum:
> +        - 0x00 # MT6359 eint detection mode.
> +        - 0x01 # SoC GPIO detection mode.

Would boolean work here?

> +
> +  mediatek,eint-detect-mode:
> +    maxItems: 1
> +    description: |
> +      indicates to use ap gpio.
> +
> +      enum:
> +        - 0x00 # detection mode with higher detection power.
> +        - 0x01 # detection mode with lower detection power.
> +        - 0x02 # detection mode with sw moisture detection mode.
> +        - 0x03 # detection mode with hw moisture detection mode1.
> +        - 0x04 # detection mode with hw moisture detection mode2.
> +
> +  mediatek,eint-num:
> +    maxItems: 1
> +    description: |
> +      incicates pmic eint usage.
> +
> +      enum:
> +        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
> +        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
> +        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
> +
> +  mediatek,eint-trig-mode:
> +    maxItems: 1
> +    description: |
> +      incicates pmic eint trigger mode.
> +
> +      enum:
> +        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
> +        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.

Boolean instead?

> +
> +  mediatek,eint-use-ext-res:
> +    maxItems: 1
> +    description: |
> +      select HP_EINT pull up resistance, default 0 use internal resistance.
> +
> +      enum:
> +        - 0x0 # use internal resistor.
> +        - 0x1 # use external resistor.

Boolean?

> +
> +  mediatek,eint-comp-vth:
> +    maxItems: 1
> +    description: |
> +      indicates comparator detection voltage.
> +
> +      enum:
> +        - 0x00 # 2.8v.
> +        - 0x01 # 2.4v.
> +        - 0x02 # 2.0v.
> +        - 0x03 # 0.7v.
> +
> +  mediatek,key-mode:
> +    maxItems: 1
> +    description: |
> +      incicates key mode type.
> +
> +      enum:
> +        - 0x0 # THREE_KEY - support 3-key key mode.
> +        - 0x1 # FOUR_KEY - support 4-key key mode.
> +        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
> +
> +  mediatek,three-key-thr:
> +    maxItems: 4
> +    description: |
> +      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
> +
> +  mediatek,tri-key-cdd-thr:
> +    maxItems: 4
> +    description: |
> +      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
> +
> +  mediatek,four-key-thr:
> +    maxItems: 4
> +    description: |
> +      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    accdet: accdet {

Where does this node go? You've got no compatible, so it's a child of
something else?

> +        mediatek,accdet-name = "mt6359-accdet";
> +        mediatek,mic-vol = <8>;
> +        mediatek,mic-mode = <2>;
> +        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
> +                                    0x800 0x800 0x20 0x44
> +                                    0x4 0x1
> +                                    0x5 0x3 0x3 0x5 0xe>;
> +        mediatek,eint-use-ap = <0>;
> +        mediatek,eint-detect-mode = <4>;
> +        mediatek,eint-num = <0>;
> +        mediatek,eint-trig-mode = <1>;
> +        mediatek,eint-use-ext-res = <0>;
> +        mediatek,eint-comp-vth = <2>;
> +        mediatek,key-mode = <0>;
> +        mediatek,three-key-thr = <0 80 220 400>;
> +        status = "okay";

Don't show status in examples.

> +    };
> +...

> --
> 2.18.0
>
