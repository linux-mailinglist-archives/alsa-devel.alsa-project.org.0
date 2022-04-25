Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F650E070
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101F316F8;
	Mon, 25 Apr 2022 14:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101F316F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650890140;
	bh=8jlUvCY20CgI0xaxYkAzO/KkCNyumkMC4FrSmDFIx20=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWnSTqpTB7ibSLiXW3QatyRVsqd2DjCbnAsw+oXLkFb1kUkHEGoC4fzm09oZiHomI
	 1+lkzsyoBtQ36KmPMp50lfGFoPnTxzvH3C/IoNwrwLusx7Sj/w6DCv0v4w1a1F+Eih
	 1gWM4m57YHmXtl/FP4R8Ndg1uIpjjVxvZismTmYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 894C2F8016B;
	Mon, 25 Apr 2022 14:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA4A2F8016A; Mon, 25 Apr 2022 14:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B58F800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B58F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="qzxfZ3Vn"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1650890074; bh=sn38mP3GRcYFS204SS01F9po0IjaiD5EuJVQTsfix0c=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=qzxfZ3Vnf6IGzTPAEIKZUigZLKF+DgDhUpHC6GbPhg8VP+3Se4CCdtWbiDqK5s2Xm
 K29Pj7BPaWZedmssU+FSgBeA5FqUPAlItY4SuEb+MGyi4q8mz/gn0A9Uz2NKw1Q39n
 6v8X9tfBGgqVMS2EswXnoy7z992EBMZFhoG8EZB8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YmaTHTKWAfM7FCcY@sirena.org.uk>
Date: Mon, 25 Apr 2022 14:34:33 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-4-povik+lin@cutebit.org>
 <YkrkbBNYULLgeS5w@sirena.org.uk>
 <904EB8A1-5561-4555-8030-B85703E24F2E@cutebit.org>
 <YmaTHTKWAfM7FCcY@sirena.org.uk>
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


> On 25. 4. 2022, at 14:25, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Apr 22, 2022 at 04:06:06PM +0200, Martin Povi=C5=A1er wrote:
>>> On 4. 4. 2022, at 14:28, Mark Brown <broonie@kernel.org> wrote:
>=20
>>> We need to figure out an interface for describing which CODEC/CPU
>>> combinations are connected to each other.  I'm not seeing a great =
way to
>>> do that right now, probably some side data table is going to be =
needed,
>>> or perhaps the CPU DAI drivers can be persuaded to only have one DAI
>>> actually register and claim to support more channels?  I'm not sure =
how
>>> a configuraiton like this is going to work at userspace level if the
>>> multiple CPU DAIs end up being visible...
>=20
>> To understand the issue better: How could the multiple CPU DAIs be
>> visible from userspace?
>=20
> If you register two separate DAIs (well, links) with the API without
> doing anything else the API will just expose them to userspace as two
> separate things with no indication that they're related.

Sure, but what I am addressing here is a single DAI link with multiple
CPU DAIs, invoked in DT like this:

	dai-link@0 {
		link-name =3D "Speakers";
		mclk-fs =3D <256>;

		cpu {
			sound-dai =3D <&mca 0>, <&mca 1>;
		};
		codec {
			sound-dai =3D <&speaker_left_woof1>,
				<&speaker_right_woof1>,
				<&speaker_left_tweet>,
				<&speaker_right_tweet>,
				<&speaker_left_woof2>,
				<&speaker_right_woof2>;
		};
	};

>> What about this interim solution: In case of N-to-M links we put in
>> the most restrictive condition for checking capture/playback stream
>> validity: we check all of the CPU DAIs. Whatever ends up being the
>> proper solution later can only be less restrictive than this.
>=20
> That's not the issue here?

Well to me it looks like it is. Because if I invoke the DAI link like
I quoted above, and the platform driver supports it, the =
playback/capture
stream validity check is the only place it breaks down. Notwithstanding
this may be the wrong API as you wrote.

>> As a reminder what happens on the Macs: the platform driver drives
>> all the CPU-side I2S ports that belong to the link with the same =
data,
>> so the particular CPU/CODEC wiring doesn=E2=80=99t matter.
>=20
> Oh, that's not something I was aware of.  In that case this is the =
wrong
> API - you should be using DPCM to map one front end onto multiple back
> ends (Kirkwood does something similar IIRC, there will be other =
examples
> but that's probably the simplest).  The back ends probably don't =
really
> need to know that they're on the same physical bus (if indeed they =
are).

I guess I need to look into that.

