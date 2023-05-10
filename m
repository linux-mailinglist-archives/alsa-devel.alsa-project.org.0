Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEF6FD6F3
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7FE104D;
	Wed, 10 May 2023 08:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7FE104D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683699900;
	bh=YvntqD+xSilwTeLzXQlILPmUDbgtgKi5o+G/7xZhBoQ=;
	h=Subject:From:In-Reply-To:Date:References:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k+baJJrARCzwkCEi35JE8ncstI5+XmUCNIpVqWWgYc9qObJzcZlVExPKlR+5qfGzG
	 RulKPGO4gflztq9ZAaZaWXODdjrbbWKqDgmgE4nvtOz3A3hHce9Uflc4z1o6eOIpOT
	 fGjRdkr5VAUMARtMoWLSXqLjQBK5Af6q2+3F6KHo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB0DF80310;
	Wed, 10 May 2023 08:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DD89F8032D; Wed, 10 May 2023 08:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_FAIL,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A778BF802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 08:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A778BF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=PmPugz2x
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683699815; bh=qTralI+BjXkUYeKdpt1EKOYLurUZJUqEWnuIzQBEp7g=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=PmPugz2x90kQffxeCbG0qp9sZuQ50W491xv2ssNip1mGx5wefSNn7yw7IpH//9OjO
	 YL6cgtQNHGKBncWB8bmKNeg+LGFJiXkZ9RgObhHFtyBEQiWdCBRggzCbS8EE1RmHkS
	 /SoJHaiCoNMrqu+0713ZUsg4pWuun9aPZEIOy/sA=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] ASoC: ssm3515: Add new amp driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
Date: Wed, 10 May 2023 08:23:34 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <EA5B2980-917F-4F82-9302-F880B1B97ECD@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509163828.86003-2-povik+lin@cutebit.org>
 <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Message-ID-Hash: UOB6QPXED3NHNRIPTX45HNAP5F5NFYKK
X-Message-ID-Hash: UOB6QPXED3NHNRIPTX45HNAP5F5NFYKK
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOB6QPXED3NHNRIPTX45HNAP5F5NFYKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> On 10. 5. 2023, at 4:16, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Tue, May 09, 2023 at 06:38:28PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> +static int ssm3515_setup(struct snd_soc_component *component)
>> +{
>> +	struct ssm3515_data *data =3D
>> +			snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	ret =3D snd_soc_component_update_bits(component, SSM3515_GEC,
>> +			SSM3515_GEC_ANA_GAIN,
>> +			FIELD_PREP(SSM3515_GEC_ANA_GAIN, =
data->ana_gain));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Start out muted */
>> +	ret =3D snd_soc_component_update_bits(component, SSM3515_DAC,
>> +			SSM3515_DAC_MUTE, SSM3515_DAC_MUTE);
>> +	if (ret < 0)
>> +		return ret;
>=20
> Why are we not using the chip defaults here?  We use those for most
> things as what's appropraite for one user might not be appropriate for
> another and it's easier to agree to follow what the chip does than to
> select things.  There's some exceptions like for zero cross options =
but
> not typically for gains and mutes.

This bit is controlled by the mute DAI op, where it is expected the
component starts out muted. The datasheet promises pop-free experience
if this bit is sequenced with the disablement of clocks, so it seems
like a good fit for said op.

>> +static int ssm3515_probe(struct snd_soc_component *component)
>> +{
>> +	struct ssm3515_data *data =3D
>> +			snd_soc_component_get_drvdata(component);
>> +	int ret;
>> +
>> +	ret =3D ssm3515_reset(component);
>> +	if (ret < 0)
>> +		return ret;
>> +	regmap_reinit_cache(data->regmap, &ssm3515_i2c_regmap);
>> +
>> +	return ssm3515_setup(component);
>> +}
>=20
> We don't normally reset things on component probe, only on bus level
> probe...

I don=E2=80=99t think I have a strong reason to do this.

