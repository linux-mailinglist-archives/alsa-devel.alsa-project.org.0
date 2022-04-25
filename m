Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5650E13C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594AA1738;
	Mon, 25 Apr 2022 15:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594AA1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650892343;
	bh=CY3EpVP6sqx6E5CTHN6Hgjpu4eV1MD8tvUCPwPHHPkk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OlnI5q1xvPieg0nb5oazOPUZrsMAS/12dIqMf/6ae54oPYodGqQL4m+RAl01nSzEq
	 iT+8+OaYem6jS0UW0RSzKGhFAODKl2qg9yVdfBuQiIXa7bfUZzPSNW9AhqHvELMETw
	 r1mHUHqK3kytv2cIwbwkV7NO0gcMlnSAeGYNrbdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE216F8016B;
	Mon, 25 Apr 2022 15:11:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A892F8016A; Mon, 25 Apr 2022 15:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B91DF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B91DF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="nFr8CC12"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650892275; bh=/hL2s+lh63ESjiRaWWsxzMR/f4Yu9cM9nehZyfa7E0g=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=nFr8CC12dlvYY0ye7Cw0D5/WM1QFzo3/SRqKTUxMe0my0I7ZZ4f4xN63aMSAhhq2V
 OgPLAz4XUoeMd0sgXUnHtJxv0EqXekSKCJIIp1n11uLXZByvyi8+OxY5VoUmh4xT5z
 V4a8aqsvCFfG35Gz9e1wkkDP63AmJJdfBJEfXrw0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmaaPa8A03rWV7HE@sirena.org.uk>
Date: Mon, 25 Apr 2022 15:11:14 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CF6B0A7-F218-4798-BB21-18D563309D5C@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-4-povik+lin@cutebit.org>
 <YkrkbBNYULLgeS5w@sirena.org.uk>
 <904EB8A1-5561-4555-8030-B85703E24F2E@cutebit.org>
 <YmaTHTKWAfM7FCcY@sirena.org.uk>
 <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
 <YmaaPa8A03rWV7HE@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
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


> On 25. 4. 2022, at 14:55, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Apr 25, 2022 at 02:34:33PM +0200, Martin Povi=C5=A1er wrote:
>>> On 25. 4. 2022, at 14:25, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> If you register two separate DAIs (well, links) with the API without
>>> doing anything else the API will just expose them to userspace as =
two
>>> separate things with no indication that they're related.
>=20
>> Sure, but what I am addressing here is a single DAI link with =
multiple
>> CPU DAIs, invoked in DT like this:
>=20
>> 	dai-link@0 {
>> 		link-name =3D "Speakers";
>> 		mclk-fs =3D <256>;
>>=20
>> 		cpu {
>> 			sound-dai =3D <&mca 0>, <&mca 1>;
>> 		};
>> 		codec {
>> 			sound-dai =3D <&speaker_left_woof1>,
>> 				<&speaker_right_woof1>,
>> 				<&speaker_left_tweet>,
>> 				<&speaker_right_tweet>,
>> 				<&speaker_left_woof2>,
>> 				<&speaker_right_woof2>;
>> 		};
>> 	};
>=20
> You could parse this into two separate links for the benefit of the
> framewokr if you're using a custom machine driver (which I suspect you
> probably have to).

Yeah, this is parsed by the =E2=80=98macaudio=E2=80=99 machine driver =
from the series.

>>>> What about this interim solution: In case of N-to-M links we put in
>>>> the most restrictive condition for checking capture/playback stream
>>>> validity: we check all of the CPU DAIs. Whatever ends up being the
>>>> proper solution later can only be less restrictive than this.
>=20
>>> That's not the issue here?
>=20
>> Well to me it looks like it is. Because if I invoke the DAI link like
>> I quoted above, and the platform driver supports it, the =
playback/capture
>> stream validity check is the only place it breaks down. =
Notwithstanding
>> this may be the wrong API as you wrote.
>=20
> I am surprised that doesn't otherwise explode TBH - at the very least
> I'd expect it to show two PCMs to userspace which if I'm understanding
> your description correctly isn't really what's going on.

I fill in a single snd_soc_dai_link, it exposes a single PCM and works
like a charm. That is as long as I patch the playback/capture check in
question.

I read that to be the clear intention of ASoC code: a DAI link becomes
one snd_soc_pcm_runtime.

