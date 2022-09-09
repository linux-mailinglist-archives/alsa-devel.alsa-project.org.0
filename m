Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020E5B3B87
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 17:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDABF168D;
	Fri,  9 Sep 2022 17:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDABF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662736315;
	bh=+pOv23kI8l1Pg89wCfd4sK4wj8cqTmX7DQqK7grqZqg=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbKOjrCP/PsPEiNdiJdRvSmK/NE8lJkVHBIcyZUimf0vHeWILs3VKL5c44kyK5TBo
	 FxNVdFH5bXAp+NKtk0gMMs1N/7w39WFcQPF3oX29YFHyEUD2IaUWSCu2+igOaBOXcw
	 I5zpJefwItdZDozLnJRQEnICwalU40hcVlkCJM5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 469A7F80105;
	Fri,  9 Sep 2022 17:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5CAF8023A; Fri,  9 Sep 2022 17:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28119F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 17:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28119F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="LJ4wFHF5"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662736247; bh=4NS9jOc+DKYjPlXdslwxuf9QrepRBJxIl1RQFwG0wLc=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=LJ4wFHF5Ch89nRfLgiUdEOVGOXI0VmjoH78a0fFKjH3755SQJKgdpZx2R9Wm+7h3g
 xzMl3lYqxW3Hplz2UlV735ZTboKP6xQiA0IQBoQMOrUmJMxaVFmlmpOI2XZ52xGDFI
 2kUJ2+JtivHhevG9Tt6VpzCZ0r3Oq2YcBy9Gfyyk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 09/10] ASoC: cs42l83: Extend CS42L42 support to new part
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
Date: Fri, 9 Sep 2022 17:10:45 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <822926B0-CF33-4FF0-B234-8EF644DCED21@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-10-povik+lin@cutebit.org>
 <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, David Rhodes <david.rhodes@cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
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



> On 9. 9. 2022, at 16:47, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 09/09/2022 15:53, Martin Povi=C5=A1er wrote:
>> The CS42L83 part is a headphone jack codec found in recent Apple
>> machines. It is a publicly undocumented part but as far as can be =
told
>> it is identical to CS42L42 except for two points:
>>=20

(...)

>> +static const struct dev_pm_ops cs42l83_i2c_pm_ops =3D {
>> +	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
>> +};
>> +
>> +static const struct of_device_id __maybe_unused cs42l83_of_match[] =3D=
 {
>> +	{ .compatible =3D "cirrus,cs42l83", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, cs42l83_of_match);
>> +
>> +static struct i2c_driver cs42l83_i2c_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "cs42l83",
>> +		.pm =3D &cs42l83_i2c_pm_ops,
>> +		.of_match_table =3D of_match_ptr(cs42l83_of_match),
>=20
> This should complain with compile testing. Usually it comes with
> __maybe_unused/

Which symbol? cs42l83_of_match has maybe_unused.

Best, Martin

>=20
>=20
> Best regards,
> Krzysztof

