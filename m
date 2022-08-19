Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58A599D58
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 16:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F086169E;
	Fri, 19 Aug 2022 16:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F086169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660918521;
	bh=MYu+og4pZAH11JVOj+4kIs79jhLdtE80cLyGI4sHJpE=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ngcoo09RJRX9vFOQKp2KsbIKwmi7rHSA2nlehZLUqmC5LcmpLaH3r0hPUHjFIHS7L
	 kdocxBlPv3JyrNFwonI0lXxGD7KPt/sFviLkvOVMXBxeRBNHp+bhQy9sDLMa6doHPT
	 FJha/d/RB5XE5O2G0DYXevtQOm59OcsifbpBxWVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3FFAF80217;
	Fri, 19 Aug 2022 16:14:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D59F801F7; Fri, 19 Aug 2022 16:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4894F80128
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 16:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4894F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="aYs3E+bQ"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660918452; bh=mikOm114pTMlqwHfoxCgC3bYF4HKVthSAvijVuexpIw=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=aYs3E+bQRjogZa+jboGDQlcmn6kqUrIV/mKg5R0JX7eNcVchSgv/qfDGj8GvvDPMI
 7uU52ZKQaSyiorIR+rB02MTf1xx3nYI1YwZ8ye8V13vdZ4pT5v0zHp0Rymu2ZZBVL7
 tseeOoWVBu6kBqO6CjUOvUO51OaolN7khxRn0pog=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
Date: Fri, 19 Aug 2022 16:14:08 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <737767DD-CB70-4941-8CF5-497333D3A801@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
 <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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



> On 19. 8. 2022, at 15:08, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 19/08/2022 15:58, Martin Povi=C5=A1er wrote:
>>=20
>>> On 19. 8. 2022, at 14:54, Martin Povi=C5=A1er =
<povik+lin@cutebit.org> wrote:


>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - apple,t8103-mca
>>> +          - apple,t6000-mca
>>=20
>> Since it was brought up last time but I didn=E2=80=99t respond: the
>> nonalphabetical order is as the chips were introduced (and
>> matches other schemas).
>=20
> Sure, just keep that order for future compatibles as well - so always
> put them according to verifiable time of market introduction...
>=20
> This is very poor reason, instead of alphabetical order. Even worse
> reason is repeating wrong pattern just because someone else did it.
>=20
> Best regards,
> Krzysztof
>=20

I don=E2=80=99t see it nearly as clear-cut. Adding to the end seems =
pretty
foolproof too, but OK, next submission will have it alphabet. ordered.

Best,
Martin

