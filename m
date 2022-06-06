Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AC53EFC5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A8D1B37;
	Mon,  6 Jun 2022 22:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A8D1B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654547785;
	bh=4efd4Up19a7Kibr+d8MqIzuB4p69csi/B2CzR3+qEzM=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNHsta9GDN0j9hrQ7iFuZC8okVDuBJ412htPZ3jlA+bZvQwyp9sg1Vf5kizxFZI0Z
	 1QwmztQB43qavZ/7IPEsQmeJcTI7uV6Pahfo94CkbFad4yjZsGG0sMXt2UXmxlCrjf
	 vmaUjjV/m2VwuLh0vUlMCr5rTOPPbieLxlnUqXv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0E0F80310;
	Mon,  6 Jun 2022 22:35:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D4A5F8012A; Mon,  6 Jun 2022 22:35:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B4BF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B4BF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Zp4+x16v"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654547721; bh=vfmRHdsKy5jL3Jkg558Ih+Gkg25m+JW1BWtz6hVF+I4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Zp4+x16vSA/uhNUrENr7G3Ja9fHEb+dC8TemongFVg6cfy89mwvmpUWN+UecWyi+m
 0fOjdk0f7kDw9VOeUFI1A9djS8U2MgbR+iKH5OR/1g/BMqZ7d5h3CA1PWEH1iMw67n
 bWCoGFvgB5UrtKJwpQPs1QJPPvL568oBkOd05khg=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH v2 3/5] ASoC: apple: Add MCA platform driver for Apple
 SoCs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <Yp5g43IxFQsUoS/y@sirena.org.uk>
Date: Mon, 6 Jun 2022 22:35:20 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E0FD0022-9DA1-4907-9737-19F7460B8EFF@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-4-povik+lin@cutebit.org>
 <Yp5g43IxFQsUoS/y@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


> On 6. 6. 2022, at 22:17, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 06, 2022 at 09:19:08PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> +++ b/sound/soc/apple/mca.c
>> @@ -0,0 +1,1122 @@
>> +/*
>> + * Apple SoCs MCA driver
>=20
> Please add SPDX headers to all your files.
>=20
>> +		mca_modify(cl, serdes_conf,
>> +			SERDES_CONF_SOME_RST, SERDES_CONF_SOME_RST);
>> +		(void) readl_relaxed(cl->base + serdes_conf);
>=20
> Please drop the cast, casts to/from void are generally a warning sign =
as
> they're unneeded in C.  If you want to document the barrier use a
> comment or wrapper function.
>=20
>> +	/*
>> +	 * Codecs require clocks at time of umute with the 'mute_stream' =
op.
>> +	 * We need to enable them here at the latest (frontend prepare =
would
>> +	 * be too late).
>> +	 */
>> +	if (!mca_fe_clocks_in_use(fe_cl)) {
>> +		ret =3D mca_fe_enable_clocks(fe_cl);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>=20
> This requirement is CODEC specific.  It's fine to bodge around to
> satisfy it though, especially given the restricted set of platforms =
this
> can be used with.
>=20
>> +	fe_cl =3D &mca->clusters[cl->port_driver];
>> +	if (!mca_fe_clocks_in_use(fe_cl))
>> +		return 0; /* Nothing to do */
>> +
>> +	cl->clocks_in_use[substream->stream] =3D false;
>> +
>> +	if (!mca_fe_clocks_in_use(fe_cl))
>> +		mca_fe_disable_clocks(fe_cl);
>=20
> Are you sure this doesn't need locking?

I am not sure. I need to study what locking is already done by =
ALSA/ASoC.
I assume the two stream directions here don=E2=80=99t share a lock =
already...

