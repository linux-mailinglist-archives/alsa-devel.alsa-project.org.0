Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5F58D5CE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E71641E2;
	Tue,  9 Aug 2022 10:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E71641E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660035341;
	bh=y4RKjcbm0g/3m4VCKoJJl4ES1qJk0YXWER0dd/xTdmM=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjMxPEn45zRyD1d22QAIJeZZovq0GN2TtS6vpmGfscPaQFY52l1F9LYhHlO/GOuqD
	 Rraywkye8j3lq9c2uvCP0aohneGkcuAlWJGRUsbLVrNrKdd1onbVXuiW17fbYP8JBy
	 a1ocf3AS7VPUGAnM6UkIPF2TL0B5VovB7RUl95cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48932F801F7;
	Tue,  9 Aug 2022 10:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF4CF8016C; Tue,  9 Aug 2022 10:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D895F8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D895F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="GV5wgq6S"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660035268; bh=HTSQxyjdTff+5nKPgMwzEpelY+3eet5R/sdeOOVWrTc=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=GV5wgq6SeyFBiWZhXtg2xXQJhx94BbQOIGfNwWbOq1g9j4sHeM/lKE9/e+uWJ3clQ
 kyFU/VV8EyPOcEzGetL87wmnbeVd9fefTVslcKypKvn8kLkx8i8OhBhqeyWep+5HfN
 tGcmJXUKaS6JggqfY9Xo9ZZWoU+vbWUmSaoI8O0k=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <53c8f062-a760-c65f-479e-53e7991b3f66@linaro.org>
Date: Tue, 9 Aug 2022 10:54:27 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <82B580B4-85BF-4ABA-B098-98E3CA9EE247@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-3-povik+lin@cutebit.org>
 <53c8f062-a760-c65f-479e-53e7991b3f66@linaro.org>
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
> On 09/08/2022 01:41, Martin Povi=C5=A1er wrote:

>> +	mca->switch_base =3D
>> +		devm_platform_ioremap_resource_byname(pdev, "switch");
>> +	if (IS_ERR(mca->switch_base))
>> +		return PTR_ERR(mca->switch_base);
>=20
> How does it work exactly? There is no such property... Can you submit
> also DTS using the bindings so we can validate they are real/correct?

Ah, I thought I fixed that. There=E2=80=99s supposed to be

	mca->switch_base =3D devm_platform_ioremap_resource(pdev, 1);

of course. My bad, I guess didn=E2=80=99t reexport the patches after =
these last
minute changes.

>> +
>> +	mca->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
>> +	if (IS_ERR(mca->rstc)) {
>> +		dev_dbg(&pdev->dev, "couldn't obtain reset control: =
%pe\n", mca->rstc);
>> +		mca->rstc =3D NULL;
>> +	}
>=20
> Similar question.

Same as above, there=E2=80=99s supposed to be

  resets:
    maxItems: 1

in the schema.


> Best regards,
> Krzysztof
>=20

Martin

