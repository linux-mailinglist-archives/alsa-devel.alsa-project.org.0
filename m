Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6186FD956
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 10:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C78EE8;
	Wed, 10 May 2023 10:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C78EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683707424;
	bh=5RZw6OLzkF81T9qBCgl/kjGdza5GpI9DB8+PLpboHg8=;
	h=Subject:From:In-Reply-To:Date:References:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJ+eNa8xgB3pItlmhCygr1M3Ggt17sV1AtlMMgS6p9OuFEyMj68MEosHuR83jhi3P
	 76Kl/dGGRhBCjhPotR9FLDSdvximbeqhHJFMDHSLbYiz5SNDKq+hEA119WG5iZcWII
	 KGFWD/ZkZPM0BybefpgBcihy1cazQS4Kmze+Do9U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C969FF80087;
	Wed, 10 May 2023 10:29:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52669F8032D; Wed, 10 May 2023 10:29:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B3F73F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 10:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F73F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=rUOzP4+D
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683707358; bh=5RZw6OLzkF81T9qBCgl/kjGdza5GpI9DB8+PLpboHg8=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=rUOzP4+D/25FepXKIIga+lR4GsBEH1La1wV6TDHRT5M83z9wFU6j5d+t8JsYygVbw
	 FdAGJxdzxWb0beuPIAYW2bJGb9pb6ye6hg893N0j3iczva7DTriLXEMsQVRA1u2r5C
	 pukl8a3drROy3U7JgZwV3YBrXcZ+jKS4W5UxbUPk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
Date: Wed, 10 May 2023 10:29:17 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5FC57F67-CC16-4DA4-9A0D-9F9A0539EE67@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
 <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
 <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID-Hash: PKDOBWA25NLTZDZ3N7IUHKGHVB6YPH7B
X-Message-ID-Hash: PKDOBWA25NLTZDZ3N7IUHKGHVB6YPH7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKDOBWA25NLTZDZ3N7IUHKGHVB6YPH7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> On 10. 5. 2023, at 10:23, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 10/05/2023 10:15, Martin Povi=C5=A1er wrote:
>>=20
>>> On 10. 5. 2023, at 9:51, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>>>=20
>>> On 09/05/2023 18:38, Martin Povi=C5=A1er wrote:
>>>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a =
simple
>>>> mono amplifier with digital input.
>>>>=20
>>>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

>>>> +additionalProperties: true
>>>=20
>>> uinevaluatedProperties: false instead, so users can have =
name-prefix.
>>=20
>> I actually tweaked this to have the example passing, which has =
sound-name-prefix,
>=20
> true is not allowed anyway - it makes your schema simply not effective
> almost at all as it allows anything...

That makes sense.

>> which I guess is what you have in mind. Not that I exactly understand =
what these
>> options do (both additionalProperties and unevaluatedProperties), the =
schema docs
>> didn=E2=80=99t enlighten me right away when I looked into it.
>=20
> The way to go and to start always is to look at example-schema. It =
tells
> you explicitly to use additionalProperties:false and switch to
> unevaluated "If and only if another schema is referenced".

OK. While I have you on the line, what does unevaluated do? In what =
sense are props
unevaluated?

> Best regards,
> Krzysztof

Regards,
Martin=
