Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90AD58D5D8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83B784D;
	Tue,  9 Aug 2022 10:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83B784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660035394;
	bh=J0ujkksF8V9T8c5REpn/PPuQ/X8jQjWz2QhdnkRAzEM=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dpVW0NpYFjmwxjdh7Dg9vg2Iha36y8wwgC/8pbJXxpHqYWRUFqKLuWfBkc0MVhDDW
	 UFGKnPrOJwQZRG9Pjgi7ZmO2s+MnXt4JXK6HoIezHhf6p5AjmEaWq/fTsapWQgNwch
	 g4c0uPwE0ZqpWmuxVWJPCJfk7HrWDaJUhYFGo1HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522A7F801F7;
	Tue,  9 Aug 2022 10:55:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B00F80132; Tue,  9 Aug 2022 10:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 557CFF80162
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 557CFF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="ZajEXVjp"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660035335; bh=gC4GNArn5L/+qSmbqUbjWxF4hXj6UbOzOdSVGC9cgDE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=ZajEXVjp7mPMMG2eOn3wmWnNtyDDnBp6T+mh3Lh7LDgJkT00oLqeXkpQkzqJk4Tdb
 Q31ajC+zOqJEr6HgWWNNIXqDtjUn5onK4CiWqrqUJ4ukSUOYk6AkOziyznRr5ywn31
 qQTwzcFLfOLG5AFWJHC4utUEbbWrT1nIUfpjjz58=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Apple MCA I2S transceiver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <cbe80ae1-3ae8-eccf-89f7-4506e3f44ca7@linaro.org>
Date: Tue, 9 Aug 2022 10:55:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C55ADB0F-0894-4A3B-BDD2-6A20BB1F4A4F@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-2-povik+lin@cutebit.org>
 <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
 <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
 <cbe80ae1-3ae8-eccf-89f7-4506e3f44ca7@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


> On 9. 8. 2022, at 10:47, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 09/08/2022 11:40, Martin Povi=C5=A1er wrote:
>>> Describe the items because otherwise you allow any order. The list =
will
>>> be unfortunately quite long, but still readable enough.
>>=20
>> Well, I would assume the =E2=80=98dmas=E2=80=99 property as described =
above has an implicit
>> natural order, and the dma-names are tied to it. You order it like =
the other
>> per-cluster properties, and then within the cluster the order is =
fixed to
>> 'TXA, RXA, TXB, RXB=E2=80=99 (maybe the word =E2=80=98respectively=E2=80=
=99 thrown into the description
>> would have made it clearer).
>>=20
>> Anyway that=E2=80=99s just discussing my assumptions. I can roll out =
the items list
>> for =E2=80=98dma-names=E2=80=99, if that=E2=80=99s what you mean. Or =
do you mean explicitly describing
>> the items in =E2=80=98dmas=E2=80=99 too?
>=20
> The text description of 'dmas' does not mean it will be followed by =
DTS
> author. In current bindings DTS author can therefore put any order of
> dmas/dma-names. Unrolling the dma-names forces this order to be fixed
> and validated by dtschema.

OK

>>=20
>>>> +    description: |
>>>> +      Names for the DMA channels: 'tx'/'rx', then cluster number, =
then 'a'/'b'
>>>> +      based on the associated SERDES unit.
>>>> +
>>=20
>> (...)
>>=20
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    mca: mca@9b600000 {
>>>=20
>>> You called it I2S transceiver but isn't it also actually I2S =
controller?
>>> If yes, then the node name should be probably "i2s".
>>=20
>> It=E2=80=99s a peripheral you use to transmit and receive samples =
over I2S, frankly
>> I don't know the nomenclature.
>=20
> Looking at other devices, it's i2s.

OK, thanks.

> Best regards,
> Krzysztof

Best,
Martin

