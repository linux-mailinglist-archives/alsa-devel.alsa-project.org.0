Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E591599C92
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21CF316C5;
	Fri, 19 Aug 2022 14:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21CF316C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913949;
	bh=+PklY3EifmA+RaEENxkH9FOzi+/PUk/yRasYbzrGBBk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QtynuYEP4TtjABFiaHif6l1xc6hB32p8g5GWhmv9it3OOuqUShVnQN0IldlGR8x51
	 eCt6cAqeHeu8d4a5gCczbRk+kzgyWWXMqsaUSwmg5khuOjELAz+jEjEjYXOFJFgIRL
	 U9KUu1tU8QIGXtPig4zFw84x+boTsj8iAjfVtN/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1C3F801F7;
	Fri, 19 Aug 2022 14:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 511D5F8016C; Fri, 19 Aug 2022 14:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF68CF800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF68CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Hr+iI8YF"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660913884; bh=s5P1/ldO6meakYSsej4N49VnAyA6qiJALD2PPNXMMsQ=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Hr+iI8YFOPLdaTCZsreuXLflX6ftTmJgplJ+SzuSmXEdhkuSsx6sDp9GWrCR4Eb0X
 +Ci7PrTK0jp9F7S1QlYkdX7shv25Ze3dj2YC96kO8WKhIQh2q/0ezsu5yxzL01PRMI
 I86CcKeBHeRf08lwdBHsz65amSZ6VL31maa+i6wQ=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220819125430.4920-2-povik+lin@cutebit.org>
Date: Fri, 19 Aug 2022 14:58:03 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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


> On 19. 8. 2022, at 14:54, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.
>=20
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> ---
> .../devicetree/bindings/sound/apple,mca.yaml  | 131 ++++++++++++++++++
> 1 file changed, 131 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/sound/apple,mca.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml =
b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> new file mode 100644
> index 000000000000..7b4f348c2be3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> @@ -0,0 +1,131 @@


> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-mca
> +          - apple,t6000-mca

Since it was brought up last time but I didn=E2=80=99t respond: the
nonalphabetical order is as the chips were introduced (and
matches other schemas).

Martin

