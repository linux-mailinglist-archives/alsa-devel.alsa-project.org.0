Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163D89AF35
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE042C16;
	Sun,  7 Apr 2024 09:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE042C16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474796;
	bh=k97hSoLQgn8yF6KBkhhI1ljEXjYTM3LJKTpPLNY8VZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gFXobkJnjQJrf13ldTxxWs3/2HiXk28rfD5odgPXgnRErLfV4WwoMnxlylNOJHkt/
	 //HKxD6T7Zo/XRTX5SZa/AxjqYGotmNAQwvyw+Ydundxonmbrvbyzjd9u2qv21cqS5
	 kGkjKOfijBqLtUC9SQncgZOzYGh4mb+/gezH2Sqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B973F8984A; Sun,  7 Apr 2024 09:18:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5978AF89854;
	Sun,  7 Apr 2024 09:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE55F8026D; Sun,  7 Apr 2024 09:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC979F80130
	for <alsa-devel@alsa-project.org>; Sun,  7 Apr 2024 09:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC979F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HjEgfItH
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d71765d3e1so41713351fa.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Apr 2024 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712473918; x=1713078718;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wze2zDvYj+5Q17idSSBI3LjCflEuIEPWKjyY3qcROT0=;
        b=HjEgfItHw24+hvSmNLiTbNhZ8dtEIp4DKTnVui29TJHt6QGmem+x9UsJ3+p5a8piJT
         0uCwvgczz1ZMyqpEXoMrHVKw9bxGRLvjf89UTIb7aCJoPhJGUms2XGLFDmeXFkxz9koM
         +DWqogBpkqNBRw0k51+tiuIrvgFKdc4jKx3XuD0OdmPaSBa4TrXvJ9w+aLYZDwJfcR5p
         mhAa2UhcRzojujVJ9kLs+KfFGFAG3TLg7VqSRs+uLkvY0Bb/8J3p4vL7DCv0tsOIzNJd
         q+ahuPmQhX288S0LBY20S0hQ5I+x/G3kx03zGvMqYNhbQCkcPG2SdRwEjs0hjie69XDO
         re3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712473918; x=1713078718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wze2zDvYj+5Q17idSSBI3LjCflEuIEPWKjyY3qcROT0=;
        b=h6IrvNHJ2PhDctg+riDuIlCxHSTxrImd5UxlG0ImWXR8VxzsHixkreJVJm+1BCw+Lf
         jTsDit7pIgfzZ+Yd9Cs/O9HqkKTc7w8WUH7PX4kIrxFy4jgDpSWj3CpFSbwXAEahf7VM
         HiSmotBNdN3VLG+WVEme1wgPenlLAlaA1w36xR0klMOgRP7y4r+E5AwIILJzbrWWzLz3
         rOSNH+wdRrxdIrXWl11euh5PLx4drVYfUQfl5NIEz18iiorEOUyFBmc4ZlMg//pF4lvw
         m1TkUORg1bZZeNfyPlc4VEbzWHbGdpQO2HT+SDPi5zx5ssp5cMItzyBpIp2WCCxltf5I
         WdMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfBgvcfx/bD6ssIsQJGxBkUkOVZVaz0g23funoUaBLQFtAEqKSDUe3IGr1X78zCC3gI3HmN976a74Bsz7Y/NPUweQayae1SsNYBKw=
X-Gm-Message-State: AOJu0YxU4YDgf9n4M31jxFcSVMsX5C/xGsB2sXDVr1l7IiZZLcYji/0m
	/EV9MRmiMOfyWnJO1ug12+m+l2ef83Hq5kNdgdOtTLTmtc43VUuRy/ksV+p4X2eJ8tHunSA6Pr8
	BYr+rSKQjVdGwyA1vfkHuLOaoxXQ=
X-Google-Smtp-Source: 
 AGHT+IFr3DAF/ZHxqTA10E30kgXbr3ygefhEOzLY8sJnVAP+j+hZVrmoHcd8uRM24o06OHumfbTTUzUs4WSF/PxFtCE=
X-Received: by 2002:a05:651c:201c:b0:2d8:60b9:1d74 with SMTP id
 s28-20020a05651c201c00b002d860b91d74mr3638110ljo.18.1712473918256; Sun, 07
 Apr 2024 00:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
 <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
 <CAGzNGR=2-us8GRB3RNi4_24QZ9rNBC7Lx0PFsWwbvxuRKk5ngw@mail.gmail.com>
 <352672fc-b6e1-458e-b4f9-840a8ba07c7e@linaro.org>
In-Reply-To: <352672fc-b6e1-458e-b4f9-840a8ba07c7e@linaro.org>
From: Mithil <bavishimithil@gmail.com>
Date: Sun, 7 Apr 2024 12:41:46 +0530
Message-ID: 
 <CAGzNGRnjCydMMJS6Cqht7zT1GvhbVtKAe1hu8oaf8YwRfA=hZg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZDFZPFKMP7FDIZVWEOYNCRGWDVEJK4IT
X-Message-ID-Hash: ZDFZPFKMP7FDIZVWEOYNCRGWDVEJK4IT
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:16:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 5, 2024 at 11:49=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/04/2024 19:21, Mithil wrote:
> > On Fri, Apr 5, 2024 at 10:38=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 05/04/2024 18:29, Mithil wrote:
> >>> On Fri, Apr 5, 2024 at 9:27=E2=80=AFPM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 05/04/2024 16:48, Mithil wrote:
> >>>>> So sorry about the 2nd patch being sent as a new mail, here is a ne=
w
> >>>>> patch with the changes as suggested
> >>>>>
> >>>>>> Please use subject prefixes matching the subsystem
> >>>>> Changed the patch name to match the folder history.
> >>>>
> >>>> Nothing improved. What the history tells you?
> >>>>
> >>>
> >>> Referred to "ASoC: dt-bindings: rt1015: Convert to dtschema"
> >>> Not really sure what else I should change.
> >>
> >> But the subject you wrote here is "dt-bindings: omap-mcpdm: Convert to
> >> DT schema"?
> >>
> >> Where is the ASoC?
> >>
> > I did change it, will send the patch again.
> >
> >>
> >> reg is not correct. Please point me to files doing that way, so I can
> >> fix them.
> >>
> >> You need items with description.
> >>
> > Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > I referred here for the description, but will add items for the 2 regs
>
> I don't see at all the code you are using. It's entirely different!
> Where in this file is that type of "reg" property?
>

Changed it to use items and description. Was not aware about this
format apologies.

> >
> >>> Interrupts and hwmods use maxItems now.
> >>
> >> hwmods lost description, why?
> > Seems self explanatory.
>
> Really? Not to me. I have no clue what this is. Also, you need
> description for (almost) every non-standard, vendor property.
>

Re-added it as it was previously.

> >
> >>> Changed nodename to be generic in example as well.
> >>
> >> "mcpdm" does not feel generic. What is mcpdm? Google finds nothing.
> >> Maybe just "pdm"?
> >>
> > Multichannel PDM Controller. Kept it like that since the node is also
>
> You said you "changed nodename". So from what did you change to what?
>
> > called as mcpdm in the devicetree. Calling it pdm might cause
>
> Poor DTS is not the example...
>
> > confusion.
>
> So far I am confused. Often name of SoC block is specific, not generic.
> Anyway, that's not important part, so if you claim mcpdm is generic name
> of a class of devices, I am fine.
>

Changed to pdm.

Here's the patch,
>From 9fb94e551da1ff06d489f60d52335001a9de9976 Mon Sep 17 00:00:00 2001
From: Mithil Bavishi <bavishimithil@gmail.com>
Date: Mon, 1 Apr 2024 21:10:15 +0530
Subject: [PATCH] ASoC: dt-bindings: omap-mcpdm: Convert to DT schema

Convert the OMAP4+ McPDM bindings to DT schema.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
 .../bindings/sound/ti,omap4-mcpdm.yaml        | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.=
yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
b/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
deleted file mode 100644
index ff98a0cb5..000000000
--- a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Texas Instruments OMAP4+ McPDM
-
-Required properties:
-- compatible: "ti,omap4-mcpdm"
-- reg: Register location and size as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- interrupts: Interrupt number for McPDM
-- ti,hwmods: Name of the hwmod associated to the McPDM
-- clocks:  phandle for the pdmclk provider, likely <&twl6040>
-- clock-names: Must be "pdmclk"
-
-Example:
-
-mcpdm: mcpdm@40132000 {
-       compatible =3D "ti,omap4-mcpdm";
-       reg =3D <0x40132000 0x7f>, /* MPU private access */
-             <0x49032000 0x7f>; /* L3 Interconnect */
-       interrupts =3D <0 112 0x4>;
-       interrupt-parent =3D <&gic>;
-       ti,hwmods =3D "mcpdm";
-};
-
-In board DTS file the pdmclk needs to be added:
-
-&mcpdm {
-       clocks =3D <&twl6040>;
-       clock-names =3D "pdmclk";
-       status =3D "okay";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
b/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
new file mode 100644
index 000000000..73fcfaf6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap4-mcpdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP McPDM
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  OMAP ALSA SoC DAI driver using McPDM port used by TWL6040
+
+properties:
+  compatible:
+    const: ti,omap4-mcpdm
+
+  reg:
+    items:
+      - description: MPU access base address
+      - description: L3 interconnect address
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the McPDM, likely "mcpdm"
+
+  clocks:
+    description: phandle for the pdmclk provider, likely <&twl6040>
+
+  clock-names:
+    description: Must be "pdmclk"
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ti,hwmods
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pdm@0 {
+      compatible =3D "ti,omap4-mcpdm";
+      reg =3D <0x40132000 0x7f>, /* MPU private access */
+            <0x49032000 0x7f>; /* L3 Interconnect */
+      interrupts =3D <0 112 0x4>;
+      interrupt-parent =3D <&gic>;
+      ti,hwmods =3D "mcpdm";
+      clocks =3D <&twl6040>;
+      clock-names =3D "pdmclk";
+    };
--
2.34.1

Best regards,
Mithil
