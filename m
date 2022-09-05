Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805C5ADC04
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF2C9F6;
	Tue,  6 Sep 2022 01:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF2C9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662421993;
	bh=hFmXO+D2s4QLAksNbuf61Vq6qMbb+Xr30lEmcZGahpQ=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lh6SoENhdEvtyMR2aWYUZAoekJjghSSeKQvE4onoKF53IZzsvJQI2jIODtR/CyVV1
	 Z9U78EsjIR5PL7nHZf8kXPv3iVzn+yKhN9C659fFRA8crty328KGubcsBG0n3vugDA
	 49kdL2c3f5n+/Wr74vz/DzmEYqlBANLmSaks9lZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6155F8032D;
	Tue,  6 Sep 2022 01:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486B0F80238; Tue,  6 Sep 2022 01:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E7CEF800E8
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7CEF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="OJg/WetN"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662421924; bh=W3JevZj+Q9D8r4igU1ZJmgIAeBet1bJnmsd/TGyYu1A=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=OJg/WetN0MEqqqGYSigrzdn9TEaFgN9D4ozqzm+x1AYqELC93mC/O+G3wKlMjI0KR
 Yk/acY923n3/RakzT73BXiSFGEW7cbaSfbleD3qB6hSpi4sCaPD5Nd8dCpJheiRl7/
 WXdwJQDItW2qap9E4NKWkWI1T0R7IFvh+PK652Kk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/4] arm64: dts: apple: t8103: Add MCA and its support
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220905223927.GE10102@jannau.net>
Date: Tue, 6 Sep 2022 01:52:03 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <27908832-4453-4199-A899-7B93ABD1216B@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
 <20220824160715.95779-3-povik+lin@cutebit.org>
 <20220905223927.GE10102@jannau.net>
To: Janne Grunau <janne@jannau.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

Ciao Janne, thanks for the comments and fixes.

> On 6. 9. 2022, at 0:39, Janne Grunau <janne@jannau.net> wrote:
>=20
> On 2022-08-24 18:07:13 +0200, Martin Povi=C5=A1er wrote:
>> Add the MCA I2S transceiver node and its supporting NCO, ADMAC nodes.
>>=20
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>> arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 4 ++
>> arch/arm64/boot/dts/apple/t8103.dtsi | 73 +++++++++++++++++++++++
>> 2 files changed, 77 insertions(+)


>> +		/*
>> +		 * This is a fabulated representation of the input clock
>> +		 * to NCO since we don't know the true clock tree.
>> +		 */
>> +		nco_clkref: clock-ref {
>=20
> clocks are not valid inside "simple-bus", the node name "clock-ref"=20
> conflicts in "/", maybe use "clock-nco"?

I would smuggle =E2=80=98ref=E2=80=99 or something to that effect into =
the name,
otherwise sure, let=E2=80=99s do it.

Martin

