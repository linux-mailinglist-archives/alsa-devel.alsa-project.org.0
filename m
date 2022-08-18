Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27742598ABB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 19:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8036C847;
	Thu, 18 Aug 2022 19:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8036C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660845320;
	bh=kBgNZnou7vupEvrmc/A7d4EM3Kxd9VvloRrip2tt9Oc=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P9lfjanZs1aL1l8SMJ/wBmZIkNsxQ+DlHsKFrd73NiL2DaspULqdgyalb7LHSC++/
	 Ix90MJRw4i1g2wB6SbmOy9A6SzFATGujKiNtFj9uABOrGvs0hqyydJkYOXL5Y5uqec
	 wVylzXDDsz+kbPqAaK9btnm/Wddz2ak+uKme+jDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC7C3F800B5;
	Thu, 18 Aug 2022 19:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7061F80430; Thu, 18 Aug 2022 19:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40FC4F800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 19:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40FC4F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="a/dSJC3i"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660845251; bh=bQPe7B4ZCavRnagWoIqyzCrbJt6mWXMyQjixEkuQ6Pw=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=a/dSJC3iVkkSKzJdT7hR9v/d2iSqsuWf88EYWvE13FKdozwM/bLdOa6wA/iTod2nv
 u7tjP1v3jHurbWNjso9Pz2J9HNikex5HMSruwf9aqyJr5TisMYl8mo/QBgInduRM40
 A7gIo5oxuEsgxEZ1vhUcs3RsC5e/xbqJl5TDWMqg=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <82B580B4-85BF-4ABA-B098-98E3CA9EE247@cutebit.org>
Date: Thu, 18 Aug 2022 19:54:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <414CEE0D-AED4-4900-88BE-A3BD993D79DD@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-3-povik+lin@cutebit.org>
 <53c8f062-a760-c65f-479e-53e7991b3f66@linaro.org>
 <82B580B4-85BF-4ABA-B098-98E3CA9EE247@cutebit.org>
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



> On 9. 8. 2022, at 10:54, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
>=20
>> On 9. 8. 2022, at 10:47, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>>=20
>> On 09/08/2022 01:41, Martin Povi=C5=A1er wrote:

(...)

>>> +
>>> +	mca->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
>>> +	if (IS_ERR(mca->rstc)) {
>>> +		dev_dbg(&pdev->dev, "couldn't obtain reset control: =
%pe\n", mca->rstc);
>>> +		mca->rstc =3D NULL;
>>> +	}
>>=20
>> Similar question.
>=20
> Same as above, there=E2=80=99s supposed to be
>=20
>  resets:
>    maxItems: 1
>=20
> in the schema.

Preparing an iteration of the series, I see there *was* the reset in
the schema. Let me know if there is some issue with it.

Martin

>=20
>> Best regards,
>> Krzysztof
>>=20
>=20
> Martin
>=20

