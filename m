Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8EE5450CE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:28:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 258C51A48;
	Thu,  9 Jun 2022 17:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 258C51A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654788503;
	bh=hPtJud8BiAXj6uEdDt92IpGY5Sn/zNgPovCSluT9MOU=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p3bPVsB+fTTKUvsiftPppWtqR+PWRiPbW30MNbyXzTObF9azwlFx987IJXcoT2d/5
	 1kPhW7FAv8Dhme4w3skVsmrPlYA4IS8tCbdVPYP2J1wfwxShRwLwTf23tzpA00hwEv
	 5plFukH4A/GZJaBGjovVEp72yTvRnjGHq3aMBmWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 950B0F801F5;
	Thu,  9 Jun 2022 17:27:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7185F8019D; Thu,  9 Jun 2022 17:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E78F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E78F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="N2XIV2T7"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654788433; bh=tALHUrTOMSE2jyi1V2Vz4netgKaq9LwC6aSHlEUoNCQ=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=N2XIV2T7wzMQm8Zsocz031ygN/7fCfeKvkIJIfo7sFoe5ROn34/ORCn1pzggJdOQf
 hg60OOlz9D+EuA2Knk9b1qFrtn6/zSDrXarDHfHqmwaeHdo8vfJllnnh5INpeE6SXJ
 rZzElq51cuoAyHVf/Hnkt/un+Bz+L6RhXR2imqfI=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YqIOwrRN8rPUF7Y8@sirena.org.uk>
Date: Thu, 9 Jun 2022 17:27:12 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <7F1B2324-4376-4776-BA6D-FBC8892F10C2@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqH2uCgaedf0HQPE@sirena.org.uk>
 <8961DDD2-93FF-4A18-BCA2-90FCE298F517@cutebit.org>
 <YqIOwrRN8rPUF7Y8@sirena.org.uk>
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


> On 9. 6. 2022, at 17:16, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Thu, Jun 09, 2022 at 04:09:57PM +0200, Martin Povi=C5=A1er wrote:
>>> On 9. 6. 2022, at 15:33, Mark Brown <broonie@kernel.org> wrote:
>=20
>>>> +		/*
>>>> +		 * Primary FE
>>>> +		 *
>>>> +		 * The mclk/fs ratio at 64 for the primary frontend is =
important
>>>> +		 * to ensure that the headphones codec's idea of left =
and right
>>>> +		 * in a stereo stream over I2S fits in nicely with =
everyone else's.
>>>> +		 * (This is until the headphones codec's driver supports
>>>> +		 * set_tdm_slot.)
>>>> +		 *
>>>> +		 * The low mclk/fs ratio precludes transmitting more =
than two
>>>> +		 * channels over I2S, but that's okay since there is the =
secondary
>>>> +		 * FE for speaker arrays anyway.
>>>> +		 */
>>>> +		.mclk_fs =3D 64,
>>>> +	},
>=20
>>> This seems weird - it looks like it's confusing MCLK and the bit =
clock
>>> for the audio bus.  These are two different clocks.  Note that it's =
very
>>> common for devices to require a higher MCLK/fs ratio to deliver the =
best
>>> audio performance, 256fs is standard.
>=20
>> On these machines we are not producing any other clock for the codecs
>> besides the bit clock, so I am using MCLK interchangeably for it. (It =
is
>> what the sample rate is derived from after all.)
>=20
> Please don't do this, you're just making everything needlessly hard to
> understand by using standard terminology inappropriately and there's a
> risk of breakage further down the line with drivers implementing the
> standard ops.

OK

>> One of the codec drivers this is to be used with (cs42l42) expects to =
be
>> given the I2S bit clock with
>=20
>>  snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);
>=20
> That's very, very non-standard...
>=20
>> I can rename mclk to bclk in all of the code to make it clearer =
maybe.
>> Also the platform driver can take the bit clock value from =
set_bclk_ratio,
>> instead of set_sysclk from where it takes it now. The cs42l42 driver =
I can
>> patch too to accept set_bclk_ratio.
>=20
> ...indeed, set_bclk_ratio() is a better interface for setting the bclk
> ratio - the CODEC driver should really be doing that as well.

OK, adding that to my TODOs.

>>> This shouldn't be open coded in a driver, please factor it out into =
the
>>> core so we've got an API for "set limit X on control Y" then call =
that.
>=20
>> There=E2=80=99s already snd_soc_limit_volume, but it takes a fixed =
control name.
>> Can I extend it to understand patterns beginning with a wildcard, =
like
>> '* Amp Gain Volume=E2=80=99?
>=20
> Or add a new call that does that.

OK
