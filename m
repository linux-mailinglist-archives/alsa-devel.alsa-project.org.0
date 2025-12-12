Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641ECB8DEA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 14:11:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C8260226;
	Fri, 12 Dec 2025 14:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C8260226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765545066;
	bh=RTBvyDMqO/HNMb4UoSCfqoegrXRB3u4EWOKcPtGlrzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NvnEFQCckkyGv57+x9TOqUJ+v/1HP3vQTn6gPlGvqLM4mtd7Gs3M/lkv66jBEcW8N
	 5PEjZHnPulFqYfdtCO/72T2KJDeN8Lti0lIVEnCDqyOmL2QiIG68i+50D4QasJalRZ
	 rP6mxSCp+C0XIqiAXhKRUq/bjTWkn5NpLUv0kXOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C99F80424; Fri, 12 Dec 2025 14:10:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F221CF805CA;
	Fri, 12 Dec 2025 14:10:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E996BF8014B; Fri, 12 Dec 2025 14:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65FE3F80093
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 14:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65FE3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SiqBzvP/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03964443DC
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 13:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88B9C2BC86
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765545007;
	bh=RTBvyDMqO/HNMb4UoSCfqoegrXRB3u4EWOKcPtGlrzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SiqBzvP/oSZNjUpQGLYhqJ81DFXk9VIyygHPIeRoHpfBI74vIV8XfZB4jzBDGW8om
	 J6lumX+FrcqN32pQOkcQ3eVzXarX0WjNlf0nHCy/jZ+w1F7gmTTjb93iC1uy/UTFwL
	 YgBmtgEWhUWoQgzX6blz8k6AnWaVMujvcgVbFrw0Ud3iaKKiBE9jOJY9JvAkm8LyCK
	 uD6TSnsgacKrAO+AhYi21QiEaXUtA7Iz8K1R1zCy51Q4k0YQEp98ZlFRgI57ZcMWmk
	 8RcMftgv2klG/tvDMd1Q7bV8CNivU9us4oKJjb6r8ldhjYHR3i7AOJsRC+SlYQOGJg
	 0uAJT2IqSPJNw==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so198386066b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Dec 2025 05:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUijcf/KUrEQujj0EKIeZ2o+PgXjtDE6VsZFcPSawNEzoeOhxFdFgtmkgo1MQNpcPComRkOZqaAWaAw@alsa-project.org
X-Gm-Message-State: AOJu0YyNT+c/gfL6rp1oRr04KkWkx0/tmK0B8jaBJvDW1ibMsHB7TevY
	650aMh4T6u64lJcjioM1baR/1J4o7CQ6F3G+gZBQ9tAkAurg0a4ZdCmD7BmfS6fLlhw7NOuhz3L
	e+hbZawSzfovSiG6BuTRyfq52xOwrow==
X-Google-Smtp-Source: 
 AGHT+IEXwQ4P6iRrP+9zQH8faTHLr4mpieDLvmrgycrBDJepl3hfaCpmbPQuRdi2FG2T1u1vK5wM5zo6eveUQJcHK1c=
X-Received: by 2002:a17:907:7b8a:b0:b73:5c12:3f8a with SMTP id
 a640c23a62f3a-b7d23698224mr197066166b.18.1765545006332; Fri, 12 Dec 2025
 05:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20251211110130.2925541-1-oder_chiou@realtek.com>
 <20251211110130.2925541-2-oder_chiou@realtek.com>
 <20251211153835.GA1251928-robh@kernel.org>
 <6c85fd92dc244789a5259ff4b11ec2e0@realtek.com>
In-Reply-To: <6c85fd92dc244789a5259ff4b11ec2e0@realtek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Dec 2025 07:09:54 -0600
X-Gmail-Original-Message-ID: 
 <CAL_JsqJYXomrgTsO-n9K2mxibDr7wF7-T45GCNTzn9HeW1QwqA@mail.gmail.com>
X-Gm-Features: AQt7F2qVvltntMQyZm-dgNcgR9alWIKwn-THUQeMaUA1xnOE5nKZmWHs918m1nU
Message-ID: 
 <CAL_JsqJYXomrgTsO-n9K2mxibDr7wF7-T45GCNTzn9HeW1QwqA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support for
 ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
Cc: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
 "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Flove(HsinFu)" <flove@realtek.com>,
	=?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LOYJG44RGNMZ5USAWP7PR5XT6WER4GA5
X-Message-ID-Hash: LOYJG44RGNMZ5USAWP7PR5XT6WER4GA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOYJG44RGNMZ5USAWP7PR5XT6WER4GA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 12, 2025 at 2:59=E2=80=AFAM Oder Chiou <oder_chiou@realtek.com>=
 wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Thursday, December 11, 2025 11:39 PM
> > To: Oder Chiou <oder_chiou@realtek.com>
> > Cc: cezary.rojewski@intel.com; broonie@kernel.org; lgirdwood@gmail.com;
> > krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> > linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> > alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming=
 [=E8=8C=83
> > =E6=9B=B8=E9=8A=98] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.co=
m>; Derek [=E6=96=B9=E5=BE=B7
> > =E7=BE=A9] <derek.fang@realtek.com>
> > Subject: Re: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add supp=
ort for
> > ALC5575
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > On Thu, Dec 11, 2025 at 07:01:29PM +0800, Oder Chiou wrote:
> > > Audio codec with I2S, I2C and SPI.
> > >
> > > Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> > > ---
> > >  .../bindings/sound/realtek,rt5575.yaml        | 44
> > +++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.y=
aml
> > b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> > > new file mode 100644
> > > index 000000000000..60f9af399dd2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> > > @@ -0,0 +1,44 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/realtek,rt5575.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ALC5575 audio CODEC
> > > +
> > > +maintainers:
> > > +  - Oder Chiou <oder_chiou@realtek.com>
> > > +
> > > +description:
> > > +  The device supports both I2C and SPI. I2C is mandatory, while SPI =
is
> > > +  optional depending on the hardware configuration.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > +  - $ref: dai-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - realtek,rt5575
> > > +      - realtek,rt5575-use-spi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        codec@57 {
> > > +            compatible =3D "realtek,rt5575";
> > > +            reg =3D <0x57>;
> > > +        };
> > > +    };
> >
> > It is completely unclear what you are doing in the SPI case. I
> > deciphered it studying the driver. I shouldn't have to do that, your
> > binding should make that clear.
> >
> > So your DT must look like this:
> >
> > i2c {
> >         codec@57 {
> >                 compatible =3D "realtek,rt5575-use-spi";
> >                 reg =3D <0x57>;
> >         };
> > };
> >
> > spi {
> >         codec@1 {
> >                 compatible =3D "realtek,rt5575";
> >                 reg =3D <0x1>;
> >         };
> > };
> >
> > First, there's no need for "-use-spi" because you can just check if
> > there is a rt5575 SPI device and use it if there is. Why would you have
> > the SPI device and not use it?
>
> The compatible realtek,rt5575-use-spi will be removed, and if there is no
> SPI device in the DTS, the warning message will be shown as "The hardware
> configuration should be with built-in flash".
>
> > But really it is not ideal having 2 device nodes for a single device. I=
t
> > would be much simpler to just have something like this in the i2c node:
> >
> > spi-parent =3D <&spi0 1>;
> >
> > Where the cell is the chip-select #.
> >
> > We have an 'i2c-parent' already for similar reasons when there are 2
> > bus connections.
>
> In the current kernel, I cannot find any function to obtain a
> struct spi_controller when no SPI device is defined in the DTS. This was
> possible in older kernels using the legacy spi_busnum_to_master(), but
> that function is no longer available in upstream.

Yeah, you may have to add something given 'spi-parent' doesn't exist
yet. I don't think spi_busnum_to_master() would be quite right either.
In any case, what the kernel supports or doesn't support doesn't
matter from a binding perspective.

Rob
