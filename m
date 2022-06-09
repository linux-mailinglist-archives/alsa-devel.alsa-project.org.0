Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9A544E71
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 16:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0A716E7;
	Thu,  9 Jun 2022 16:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0A716E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654783864;
	bh=mXQ1NcCQrAgNufXr+YJABTx6gnfTj4ymaYgUSbpqY1A=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nn1bJF9HabEldELiWxVYfiO+toTDvorlvKsaBRj7GzkLCv6gf/r//Fpw3uVtWgBaf
	 1aSpHFd9hwNSw+y0X1lhzHItI2t7xYvd+dWWvucl+vjXToP49ho7W1ubm9PPUvQhhD
	 m8M3YAd3Sm0TWORZx1oOB4nyC/dj1U5BZyCiReqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22BC5F80116;
	Thu,  9 Jun 2022 16:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CF99F8019D; Thu,  9 Jun 2022 16:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC88F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 16:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC88F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="XgcTXKYM"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654783798; bh=jHH7bIr15k6Wcan9xWpb2RIAAbwJZGEkdGwUmeH+pik=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=XgcTXKYMtUhTeQO6Ro1EGyNKeIdpm0Get6FyG9/ernuBm5uxzfpY+RZ9qbFfzUG1G
 nMiPvNPkxTi2YsD4gN8kt2FdsXeBxGW8VWayv/7YVxVlJvWox68X2g88mudvm7kW4o
 c6vIcj42mzRKd6BBqt19kf6BscBM7EdFKysHPiD8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YqH2uCgaedf0HQPE@sirena.org.uk>
Date: Thu, 9 Jun 2022 16:09:57 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <8961DDD2-93FF-4A18-BCA2-90FCE298F517@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqH2uCgaedf0HQPE@sirena.org.uk>
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


> On 9. 6. 2022, at 15:33, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 06, 2022 at 09:19:10PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> +		/*
>> +		 * Primary FE
>> +		 *
>> +		 * The mclk/fs ratio at 64 for the primary frontend is =
important
>> +		 * to ensure that the headphones codec's idea of left =
and right
>> +		 * in a stereo stream over I2S fits in nicely with =
everyone else's.
>> +		 * (This is until the headphones codec's driver supports
>> +		 * set_tdm_slot.)
>> +		 *
>> +		 * The low mclk/fs ratio precludes transmitting more =
than two
>> +		 * channels over I2S, but that's okay since there is the =
secondary
>> +		 * FE for speaker arrays anyway.
>> +		 */
>> +		.mclk_fs =3D 64,
>> +	},
>=20
> This seems weird - it looks like it's confusing MCLK and the bit clock
> for the audio bus.  These are two different clocks.  Note that it's =
very
> common for devices to require a higher MCLK/fs ratio to deliver the =
best
> audio performance, 256fs is standard.

On these machines we are not producing any other clock for the codecs
besides the bit clock, so I am using MCLK interchangeably for it. (It is
what the sample rate is derived from after all.)

One of the codec drivers this is to be used with (cs42l42) expects to be
given the I2S bit clock with

  snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);

I can rename mclk to bclk in all of the code to make it clearer maybe.
Also the platform driver can take the bit clock value from =
set_bclk_ratio,
instead of set_sysclk from where it takes it now. The cs42l42 driver I =
can
patch too to accept set_bclk_ratio.

>> +	{
>> +		/*
>> +		 * Secondary FE
>> +		 *
>> +		 * Here we want frames plenty long to be able to drive =
all
>> +		 * those fancy speaker arrays.
>> +		 */
>> +		.mclk_fs =3D 256,
>> +	}
>=20
> Same thing here - this is at least confusing MCLK and the bit clock.
>=20
>> +static bool macaudio_match_kctl_name(const char *pattern, const char =
*name)
>> +{
>> +	if (pattern[0] =3D=3D '*') {
>> +		int namelen, patternlen;
>> +
>> +		pattern++;
>> +		if (pattern[0] =3D=3D ' ')
>> +			pattern++;
>> +
>> +		namelen =3D strlen(name);
>> +		patternlen =3D strlen(pattern);
>> +
>> +		if (namelen > patternlen)
>> +			name +=3D (namelen - patternlen);
>> +	}
>> +
>> +	return !strcmp(name, pattern);
>> +}
>> +
>> +static int macaudio_limit_volume(struct snd_soc_card *card,
>> +				 const char *pattern, int max)
>> +{
>> +	struct snd_kcontrol *kctl;
>> +	struct soc_mixer_control *mc;
>> +	int found =3D 0;
>> +
>> +	list_for_each_entry(kctl, &card->snd_card->controls, list) {
>> +		if (!macaudio_match_kctl_name(pattern, kctl->id.name))
>> +			continue;
>> +
>> +		found++;
>> +		dev_dbg(card->dev, "limiting volume on '%s'\n", =
kctl->id.name);
>> +
>> +		/*
>> +		 * TODO: This doesn't decrease the volume if it's =
already
>> +		 * above the limit!
>> +		 */
>> +		mc =3D (struct soc_mixer_control *)kctl->private_value;
>> +		if (max <=3D mc->max)
>> +			mc->platform_max =3D max;
>> +
>> +	}
>> +
>> +	return found;
>> +}
>=20
> This shouldn't be open coded in a driver, please factor it out into =
the
> core so we've got an API for "set limit X on control Y" then call =
that.

There=E2=80=99s already snd_soc_limit_volume, but it takes a fixed =
control name.
Can I extend it to understand patterns beginning with a wildcard, like
'* Amp Gain Volume=E2=80=99?

