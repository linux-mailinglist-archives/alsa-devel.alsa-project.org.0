Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334846FCEAA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 21:39:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED462109C;
	Tue,  9 May 2023 21:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED462109C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683661192;
	bh=aVezUSpPyMPiqXeGNYa0dZQM3y1HPKosSB7OQAS6LfY=;
	h=Subject:From:In-Reply-To:Date:References:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P1qKmBSZ/5VmV02AnvFb2UXwee5PiIbinIqO9vElfKwuvkRACp/gJMHINTG5G8i2D
	 lm7v2t1kMT9gqltr+fbbQDEq28ORKYA/awcCNOOAZIVIfSx1GvWonT4g8UBnUvkyQF
	 KCK6cvvhT7MgL8ge6bMX7x71ZNa5RSWoPL3+HP9k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C68EF80087;
	Tue,  9 May 2023 21:39:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA7CEF8032D; Tue,  9 May 2023 21:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA2EEF80087
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 21:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA2EEF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=iMrlfDHQ
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683661126; bh=phU5h8y0oMRwi2ThZZnGKdLtQF3CnRbkMjIYN0/eHWI=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=iMrlfDHQSCycs969tMDE/i71ih4h1OCAaIBdjXCG+X7OlAbzEvK6YBwS3w12gdsnY
	 YG7Aux2+inDEd3XHCTKrxrFa+V9oyf8Lw/xBbA7p1mhWPKzIvUdp2n4fGrMF6gNgvB
	 JngPMVGxtpaTa5f1XA1MHrOww6w+evnSb0GzLG0U=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20230509-marxism-plug-759c99ac601c@spud>
Date: Tue, 9 May 2023 21:38:46 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
To: Conor Dooley <conor@kernel.org>
Message-ID-Hash: 4WVRBG6ET67L73L6VL6FBTS6C3ZBDZTP
X-Message-ID-Hash: 4WVRBG6ET67L73L6VL6FBTS6C3ZBDZTP
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WVRBG6ET67L73L6VL6FBTS6C3ZBDZTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Conor,

> On 9. 5. 2023, at 20:25, Conor Dooley <conor@kernel.org> wrote:
>=20
> Hey Martin,
>=20
> On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povi=C5=A1er wrote:
>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>> mono amplifier with digital input.
>>=20
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>> .../bindings/sound/adi,ssm3515.yaml           | 66 =
+++++++++++++++++++
>> 1 file changed, 66 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml =
b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> new file mode 100644
>> index 000000000000..19b7185ae8e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2019-20 Texas Instruments Incorporated
>=20
> Copyright here looks a little odd, copy & paste from the TI bindings =
you
> send patches for earlier, or intended?

Yeah, that must have been a copypaste from the other schemas. Not =
intended
in any case. Thanks for the catch.

>=20
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>=20
> Drop the quotes on these please.

OK

>> +
>> +  adi,ana-gain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2, 3]
>> +    description: |
>> +      The value to be set in the ANA_GAIN register field on the =
codec. This determines
>> +      the full voltage span of the codec's analog output.
>> +
>> +      To quote the datasheet on the available options:
>> +
>> +        00: 8.4 V Full-Scale Gain Mapping
>> +        01: 12.6 V Full-Scale Gain Mapping
>> +        10: 14 V Full-Scale Gain Mapping
>> +        11: 15 V Full-Scale Gain Mapping
>=20
> Putting register values into the DT does not seem correct, although
> I know nothing about sound and will have to defer to Krzysztof & Co. =
on
> that front.

It=E2=80=99s an analog gain selection, it just seemed most honest and =
convenient
to defer to the register field in describing of what this property does.

I thought this should be here, and not with the other gain controls to =
be
exported to userspace, since it relates to the supply voltage. You =
probably
can=E2=80=99t select a gain value close or over the amp=E2=80=99s supply =
and expect proper
functioning, so the value here should be the system=E2=80=99s integrator =
choice.

On second thought there doesn=E2=80=99t seem to be any risk of damage to =
the amp
itself, so the knowledge of what=E2=80=99s the optimal value could be =
left up to
ALSA use-case configuration, and there=E2=80=99s no real downside in =
treating it
like other gain controls.

I think I will remove it in the next iteration.

> Cheers,
> Conor.

Cheers, Martin=
