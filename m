Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042876FD84B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A52DF21;
	Wed, 10 May 2023 09:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A52DF21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683704093;
	bh=UyDuOdVcTAb4P9HMAn0i24XskRYjQwfPmIavQ4TOW/0=;
	h=Subject:From:In-Reply-To:Date:References:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btLiGesL0r1MSHKzuZCtzeROorq5Hjnl6XnPkdn6Jn+3AQs0MSxsR5XIEkq4x3jRA
	 vkW4OYr1VV/F9XFyfYjcHM31ILtQQsb5PAoLGt27MFPPwm0BAxeNeB6R1/Fn/sRSO1
	 ujTU0rgajNY/t2QIkzHnHTg2EAwtFdQIfq7A99Ng=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B14F80310;
	Wed, 10 May 2023 09:34:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 482F6F8032D; Wed, 10 May 2023 09:33:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30965F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30965F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=iSEYaO2/
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683704028; bh=KX7K3tWMwUSNfSD7Emzei/zBhnBTyUmdhpZWoZTlsNs=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=iSEYaO2/qOoYodN2VM4otWvMXPzcr3UM/htHE9RgNKppQDz60o5VRIVkolATnAH1s
	 /Qi1j/leD7dRVRPPLQrC3rdHAG1tT38xg/DIkBoPeB0hH3NOC5xDpP5Y5jbfy3vbo8
	 9VFLOc+HJ0uuEGg/PEr8hkwnPgtQ70Dd11SItWy8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
Date: Wed, 10 May 2023 09:33:47 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
 <baf338a7-1e63-4842-32a1-8f63f850bd2d@linaro.org>
 <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID-Hash: VQHDGQ4TZHBOUNSRUSGOSLX2TFK7OEB5
X-Message-ID-Hash: VQHDGQ4TZHBOUNSRUSGOSLX2TFK7OEB5
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
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 kevin-lu@ti.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQHDGQ4TZHBOUNSRUSGOSLX2TFK7OEB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> On 10. 5. 2023, at 9:30, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
>> On 10. 5. 2023, at 9:17, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>>=20
>> On 09/05/2023 17:34, Martin Povi=C5=A1er wrote:
>>> A bunch of TI's codecs have binding schemas which force =
#sound-dai-cells
>>> to one despite those codecs only having a single DAI. Allow for =
bindings
>>> with zero DAI cells and deprecate the former non-zero value.
>>>=20
>>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>>> ---

>>>  '#sound-dai-cells':
>>> -    const: 1
>>> +    # The codec has a single DAI, the #sound-dai-cells=3D<1>; case =
is left in for backward
>>> +    # compatibility but is deprecated.
>>> +    enum: [0, 1]
>>=20
>> Does it? I see playback and capture.
>=20
> I think so. Playback and capture are not separate DAIs.
>=20
> Martin

I double checked, I am pretty sure. There=E2=80=99s a single =
snd_soc_dai_driver,
which becomes a single DAI.

Martin

>=20
>>=20
>> Best regards,
>> Krzysztof
>=20
>=20

