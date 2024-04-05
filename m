Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57689AF28
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782752BF8;
	Sun,  7 Apr 2024 09:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782752BF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474649;
	bh=k++WYzu2SQ+WHgshDPCyrYXOmKfezdQ0guNU1hHj0QE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=skQc/zMkZN1JSzCdfKVy+70hOlzkMqd+RFCJplfUPM5gACjjb/qEqGrhxkrWwOkco
	 FJzUJimIySckmUsKtWeVEAP/mwX6nv48Rx5wU9ncrDlVCcJ25rFACPx+I2EG/t5PNV
	 XVtitij6kjL8i/lmC2FNfNHvfcVlAF/8Va8hVAUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DDEAF89724; Sun,  7 Apr 2024 09:18:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC0FF896EF;
	Sun,  7 Apr 2024 09:18:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9236BF8020D; Fri,  5 Apr 2024 16:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8117FF80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 16:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8117FF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gbfUEpue
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d48d75ab70so29244121fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328510; x=1712933310;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFpu1whkh1nSy8kvvx+5UzrJKjw0DqYLany6m12D6u0=;
        b=gbfUEpueLk36XsjMi17ZXciglesbhNy5T9wDlG7TKwv2VTxVTEAml9eHcXWs5JojCc
         BFy7mg3G1LNWJqOitB88stzKLvkjrJM3j8S2gUB4zJ+SoVZw0sphoV7lWfjU66QIf7fV
         P34ikzkWFQ/r12JvZFKNLl8NxpuvIgUqXamprkJqCZrDShb+gZgcH3lPgeT9nkd579s0
         zrGSfnZE0CAK47f7TYvmbbRZjRnobu3Amob31o078ZLFr6JBiOAZ2yIbTweiUG258f4c
         +glkTXjr2YNaKrwsx8rm60sGF53JoxA3zB8Tcz4vdSQGAIKL6iCWTAYI3no3dJqcZG6P
         Q7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328510; x=1712933310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFpu1whkh1nSy8kvvx+5UzrJKjw0DqYLany6m12D6u0=;
        b=lkBtLgHiRj3NSZP84qFkRxEKLaqcvPA8vOplipq5xwQleXkv4GS0c0v1rkOIzhLmTw
         JoRAAEUkLIZQdtk2OIqMg0QiI2Um4nuEPJg3klI9gjV6IyjzlNEiRyaYOIkgStcV8rT6
         AkfvE/tPgTOFuZc4nqwtuGvZyLSE0grLV2q/vn5GCH+1C9dFPWHR1zrCUAHBqH0d7bjv
         ghyx2zui+hmWAKjFaaqtOussxgf3fW5jWMMxmEFxwWL2UzwFfe+Cl2D7ym/uggIkR6WN
         XKUjfkpGesI483EqyTW6z4v6bsdyD5FrrhQUs0aFWvNVpVecfnmEPnqpWePBD8hOFfqJ
         4yFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhGROS5B7MM4XNH40ejv4y7oxKCGVukURQ4Y6aYmgQx9njrhgDEwI18PA+dBFeNiDyd9cwwYHN2fQKoQjFWOEzoJpO0KvfECgtP8w=
X-Gm-Message-State: AOJu0YyZ0nbQN/Tv7pcssEVDlay4qbYePY4VU33FC0Ovz4h4JSd8FKi9
	KQ3rfh6wB3xhXa7KCA0Ym+T084YJfwijGBDdCSvHd467NCBSi7LCUTwzd2VUSq0WXI+P/OyNdp/
	B8lAHDl8x9sT+qIGdgsfiuX5YWd0=
X-Google-Smtp-Source: 
 AGHT+IGrg/lFBS2AMqv3GmFvVcFL6woTGN8IKlxDkSWiTeKdq9HfiE5kNbCsRxC8SlKmB2gQiyBs2NPA5UHos4n1BAQ=
X-Received: by 2002:a2e:a3d2:0:b0:2d6:c4ec:782 with SMTP id
 w18-20020a2ea3d2000000b002d6c4ec0782mr1273383lje.49.1712328509495; Fri, 05
 Apr 2024 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
In-Reply-To: <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
From: Mithil <bavishimithil@gmail.com>
Date: Fri, 5 Apr 2024 20:18:17 +0530
Message-ID: 
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
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
Message-ID-Hash: OZTDN2GNI4BXBD4P5LALJ6MR2FGBD7P6
X-Message-ID-Hash: OZTDN2GNI4BXBD4P5LALJ6MR2FGBD7P6
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZTDN2GNI4BXBD4P5LALJ6MR2FGBD7P6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So sorry about the 2nd patch being sent as a new mail, here is a new
patch with the changes as suggested

> Please use subject prefixes matching the subsystem
Changed the patch name to match the folder history.

> Is it your full name?
Fixed it, my apologies.

> Filename like compatible.
Fixed.

> Please open existing bindings and look how it is done there.
Changed it, is it fine now?

> Same problem. Drop useless description but provide maxItems.
Removed descriptions for interrupts and hwmods.

> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check`
I did run it and it didnt produce any errors henceforth i submitted
the patch.

> Node names should be generic
Changed as said.

>From c24a42724e870822d50ac6857ba9f32d0dce02ae Mon Sep 17 00:00:00 2001
From: Mithil Bavishi <bavishimithil@gmail.com>
Date: Mon, 1 Apr 2024 21:10:15 +0530
Subject: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema

Convert the OMAP4+ McPDM bindings to DT schema.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
 .../bindings/sound/ti,omap-mcpdm.yaml         | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-mcpdm.y=
aml

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
diff --git a/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml
b/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml
new file mode 100644
index 000000000..4d5d37e98
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap-mcpdm.yaml#
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
+    description:
+      Register location and size as an array
+      <MPU access base address, size>,
+      <L3 interconnect address, size>;
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    maxItems: 1
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
+    mcpdm@0 {
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



On Fri, Apr 5, 2024 at 12:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 04/04/2024 18:06, Mighty wrote:
> > From: Mithil Bavishi <bavishimithil@gmail.com>
> >
> > Convert the OMAP4+ McPDM bindings to DT schema.
> >
> > Signed-off-by: Mighty <bavishimithil@gmail.com>
>
> This does not match SoB. Can you respond to comments you receive?
>
> Subject: nothing improved.
>
> Rest... also did not improve. so you ignored entire feedback?
>
> This is a friendly reminder during the review process.
>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
>
> Best regards,
> Krzysztof
>
