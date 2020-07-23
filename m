Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16D22B76D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7506168A;
	Thu, 23 Jul 2020 22:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7506168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535535;
	bh=zWUk1/zlVUvl8fu39jnRu77impkE2I9T2jR3glDdels=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i1Ilk+mBoYvNLKunwcprzEm8Qzg8Kb79PV1mVfwjvqz0Dx+jiXSCIK2TafmnBZguY
	 bDVABYvp0QwqyJBxrIqBm+vz3dDdigc2mmmVI6QkmxUeETpHJW1cOQYqXHNiz/kjsX
	 4EIv64kcaoaFEFFyDKT3qgJBL1H7Wp+goFfunheU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01558F8024A;
	Thu, 23 Jul 2020 22:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F15FF80212; Thu, 23 Jul 2020 22:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A39FF8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A39FF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="meDHykji"
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D6F220792
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535422;
 bh=zWUk1/zlVUvl8fu39jnRu77impkE2I9T2jR3glDdels=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=meDHykjirVxfAF0sU290ioCGo1AYigNUjfN1FFNV+3qVerz8RRr1azA0YYHQ9n7lx
 czd+/moyiWOuAQE6wVQF4KiuRCsCBc/Syi/TyWn0oTZvinjyYRtnO/BMVV75oWthCN
 HWX7aZRWmimj+Z5TVt3vPf9R0c3r86m98JPAweYQ=
Received: by mail-ot1-f49.google.com with SMTP id h13so5367169otr.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 13:17:02 -0700 (PDT)
X-Gm-Message-State: AOAM530+NwBkbOmJxKjTiYTe+QEF2TL8b03bqGyi9K+opIZz+rhac/MQ
 AOWBWvjBNLkemVlUVFjWESER2PRSC3/1wiDbFg==
X-Google-Smtp-Source: ABdhPJz+dQoWvnZpSGk8Z+xRqOFsZTJt22dLFHUOqeZfm+322UGMmcRjb5kObCrSnQM6guOpNr5c/7wifq1ZGtWd1X0=
X-Received: by 2002:a9d:4002:: with SMTP id m2mr5792092ote.129.1595535421576; 
 Thu, 23 Jul 2020 13:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200626154143.20351-1-dmurphy@ti.com>
 <20200626154143.20351-4-dmurphy@ti.com>
 <20200715201522.GA740682@bogus> <e61b54bf-f77c-cb4d-c256-fb0c15f18993@ti.com>
In-Reply-To: <e61b54bf-f77c-cb4d-c256-fb0c15f18993@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Jul 2020 14:16:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2-oD_XGT=zDcb9wnr+U+YHM4-3WRJPNz0-uL2ZNFBew@mail.gmail.com>
Message-ID: <CAL_JsqJ2-oD_XGT=zDcb9wnr+U+YHM4-3WRJPNz0-uL2ZNFBew@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: tas2562: Convert the tas2562 binding to
 yaml
To: Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

On Mon, Jul 20, 2020 at 12:22 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> Rob
>
> On 7/15/20 3:15 PM, Rob Herring wrote:
> > On Fri, Jun 26, 2020 at 10:41:43AM -0500, Dan Murphy wrote:
> >> Convert the TAS2562 text file to yaml format.
> >>
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>   .../devicetree/bindings/sound/tas2562.txt     | 37 ---------
> >>   .../devicetree/bindings/sound/tas2562.yaml    | 77 +++++++++++++++++++
> >>   2 files changed, 77 insertions(+), 37 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
> >> deleted file mode 100644
> >> index dc6d7362ded7..000000000000
> >> --- a/Documentation/devicetree/bindings/sound/tas2562.txt
> >> +++ /dev/null
> >> @@ -1,37 +0,0 @@
> >> -Texas Instruments TAS2562 Smart PA
> >> -
> >> -The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
> >> -efficiently driving high peak power into small loudspeakers.
> >> -Integrated speaker voltage and current sense provides for
> >> -real time monitoring of loudspeaker behavior.
> >> -
> >> -Required properties:
> >> - - #address-cells  - Should be <1>.
> >> - - #size-cells     - Should be <0>.
> >> - - compatible:         - Should contain "ti,tas2562", "ti,tas2563".
> >> - - reg:                - The i2c address. Should be 0x4c, 0x4d, 0x4e or 0x4f.
> >> - - ti,imon-slot-no:- TDM TX current sense time slot.
> >> - - ti,vmon-slot-no:- TDM TX voltage sense time slot. This slot must always be
> >> -                 greater then ti,imon-slot-no.
> >> -
> >> -Optional properties:
> >> -- interrupt-parent: phandle to the interrupt controller which provides
> >> -                    the interrupt.
> >> -- interrupts: (GPIO) interrupt to which the chip is connected.
> >> -- shut-down-gpio: GPIO used to control the state of the device.
> >> -
> >> -Examples:
> >> -tas2562@4c {
> >> -        #address-cells = <1>;
> >> -        #size-cells = <0>;
> >> -        compatible = "ti,tas2562";
> >> -        reg = <0x4c>;
> >> -
> >> -        interrupt-parent = <&gpio1>;
> >> -        interrupts = <14>;
> >> -
> >> -    shut-down-gpio = <&gpio1 15 0>;
> >> -        ti,imon-slot-no = <0>;
> >> -        ti,vmon-slot-no = <1>;
> >> -};
> >> -
> >> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
> >> new file mode 100644
> >> index 000000000000..1fb467e14d4c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
> >> @@ -0,0 +1,77 @@
> >> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > Same licensing comment here as tas2770
>
> OK I will fix it like I did with the other TAS2770 patches
>
>
> >> +# Copyright (C) 2019 Texas Instruments Incorporated
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/sound/tas2562.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Texas Instruments TAS2562 Smart PA
> >> +
> >> +maintainers:
> >> +  - Dan Murphy <dmurphy@ti.com>
> >> +
> >> +description: |
> >> +  The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
> >> +  efficiently driving high peak power into small loudspeakers.
> >> +  Integrated speaker voltage and current sense provides for
> >> +  real time monitoring of loudspeaker behavior.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - ti,tas2562
> >> +      - ti,tas2563
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description: |
> >> +       I2C address of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
> >> +
> >> +  shut-down-gpio:
> >> +    description: GPIO used to control the state of the device.
> >> +    deprecated: true
> > Why do we need this as the driver never worked?
>
> Not sure what you are asking.
>
> Driver has been fixed for this specific binding in sound for-next.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/codecs/tas2562.c?h=for-next&id=bc07b54459cbb3a572a78b5c200ff79ef11b8158

Why fix the driver and then have to maintain compatibility? Just
update everything to use 'shutdown-gpios' and move on.

Rob
