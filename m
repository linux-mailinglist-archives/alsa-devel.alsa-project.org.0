Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20559882B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 18:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D38E163F;
	Thu, 18 Aug 2022 17:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D38E163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660838445;
	bh=Yo9xNAieqb1sCe+10scuhMlBXoVocLQOVETamCwCKh0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LI6+4+j5SKugIHkuYRlrNQxs7y2aBUED/v8+s5a0dLb8KaEEyLp9JYU3paJSKnmc/
	 Su2z2BiW9+1cUazDKr4IdFD9Zui6N3H0mofhRGr3pvvZFUjLwoliXb6M20xvGQJxMx
	 f5nF+xbsapXns0UR/dk9laswWpR408eaTnQbMaXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9FBF80495;
	Thu, 18 Aug 2022 17:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21539F800E9; Thu, 18 Aug 2022 17:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B5D1F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 17:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B5D1F800E9
Received: by mail-qv1-f54.google.com with SMTP id mz1so1491432qvb.4
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 08:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CtiGR/1k1KCSuaALAAPpMTLxcT0fL4AdcjEtH/VOY9g=;
 b=tr/5txZ8oqofpCRJcQLsMOCFtWaOnkiDut85dvHbwnOyAC2r+wRk6uDtZjFIDDgfUk
 ZlF8Ohf3YNf3lhwE2raEGgPG1Tc7cH0yxW+gdxrxiI7/E1k9/01stweZ1GOvkaKSKMRn
 L5YPDxo7/zyphKteh5Tuvmw6BlrmGnMV4ScBfSgiSeQMVoibRrv1L2tzN5lFlAqe25cc
 ZFmLne4NNET7HZ9jfXZrF5eyvVEUHxJVyK4Kas99ivJqRgGlz/gsBLyuHk/X5283pNqH
 cDjZnX4xYlVNtNBGW9awzcDn0nA08InflBTBrybs0QbR9hSU/zM68rGnyec745cUHZCF
 paoA==
X-Gm-Message-State: ACgBeo0LD2TJgAHxgDw7TDEBzoog0vdygYzEfWO0ah/0dui8idFAOXqG
 LgNoX5SV4RBRfhiUghdWlQ==
X-Google-Smtp-Source: AA6agR6EpKkKczMJVaHha6M9WWZbwmhBne1QvXNmcRgFxS54CgXNEVC41MvBQGsI4/aHE5At0egt7Q==
X-Received: by 2002:a05:6214:dcc:b0:495:613d:f516 with SMTP id
 12-20020a0562140dcc00b00495613df516mr3135296qvt.75.1660838376266; 
 Thu, 18 Aug 2022 08:59:36 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:126a:8e5d:1fb3:c355:1e65:cdac])
 by smtp.gmail.com with ESMTPSA id
 s21-20020ac85295000000b00343028a9425sm1215792qtn.16.2022.08.18.08.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 08:59:35 -0700 (PDT)
Received: (nullmailer pid 1922470 invoked by uid 1000);
 Thu, 18 Aug 2022 15:43:51 -0000
Date: Thu, 18 Aug 2022 09:43:51 -0600
From: Rob Herring <robh@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Message-ID: <20220818154351.GQ1829017-robh@kernel.org>
References: <20220817032938.2659-1-kiseok.jo@irondevice.com>
 <20220817032938.2659-3-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817032938.2659-3-kiseok.jo@irondevice.com>
Cc: Suk-Min Kang <sukmin.kang@irondevice.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Gyuhwa Park <gyuhwa.park@irondevice.com>
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

On Wed, Aug 17, 2022 at 12:29:38PM +0900, Kiseok Jo wrote:
> This adds the schema binding for the Iron Device SMA1303 amplifier.
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  .../bindings/sound/irondevice,sma1303.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> new file mode 100644
> index 000000000000..e11e74d367c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/irondevice,sma1303.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Iron Device SMA1303 Audio Amplifier
> +
> +maintainers:
> +  - Kiseok Jo <kiseok.jo@irondevice.com>
> +
> +description:
> +  SMA1303 digital class-D audio amplifier with an integrated boost converter.
> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  compatible:
> +    const: irondevice,sma1303

'irondevice' needs to be added to vendor-prefixes.yaml

> +
> +  reg:
> +    description:
> +      I2C address of the amplifier. See the datasheet for possible values.
> +
> +  init-vol:

Needs a vendor prefix.

However, why does this belong in DT? I don't recall any other binding 
having something similar.

> +    description:
> +      Initial speaker volume level.
> +      If specified, the driver will assert speaker volume value at probe time.
> +      If not, default hardcoded value(0x30 / 0dB) was reflected.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    minimum: 0
> +    maximum: 255
> +    default: 49

0x30 or 49?

> +
> +  stereo-two-chip:

vendor prefix needed.

> +    description:
> +      Stereo for two chip solution
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c_bus {
> +		sma1303_amp: sma1303@1e {
> +			compatible = "irondevice,sma1303";
> +			reg = <0x1e>;
> +			init-vol = <0x31>;
> +			stereo-two-chip;
> +		};
> +	};
> \ No newline at end of file

Fix this.

> -- 
> 2.30.2
> 
