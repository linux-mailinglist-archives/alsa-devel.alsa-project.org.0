Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55E5451BE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 18:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8201ACE;
	Thu,  9 Jun 2022 18:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8201ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654791648;
	bh=Sw9swtcCuFzGTOEPhnQSoBscJC7KnU093sQPpzBUduw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbOTvaH5lMNb5Wd+ADY+BM/U9NdNvRW+vbRS2Q8A9DXuaWUu6RudcaCHnRdfedEup
	 32fYwSduXIa5uWaUuA+h7upfHF2fldEReN51qY/C+mKRiIRd15YcJbNiav3OmiIVw4
	 XQY8OM/0/deaCYGfyidRgQJDrGsq1QHp6+il/wOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0CBF80240;
	Thu,  9 Jun 2022 18:19:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB84DF801F5; Thu,  9 Jun 2022 18:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_10,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8743DF80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 18:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8743DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="kd2Riq/F"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654791578; bh=4oG/+gfqOkTh35XvvWAtX5REN3FZwalZARzou9YHdB4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=kd2Riq/FkSbvoJq2jjAf5MBgfp6q/RYP7eGUCErvWm+Pc0yqe6Br5pbsGU0kyhXou
 WDPbyTDjTow1Pf4Hs2LDNl7nBheIGLZdcovSs/jTdg8aYrDrO4ZaXPckBS7BU/FGVE
 A83JrJ3SU+rSCE3/BmHsI4XgoBLjxwceApHMXgZ0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YqIWtzphzVGmbIOe@sirena.org.uk>
Date: Thu, 9 Jun 2022 18:19:37 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DA6EE04-D23B-437B-8FBA-9223EAA71219@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqHylN3xba9XFrF8@sirena.org.uk>
 <0E611F13-96E3-41FD-9550-F900B2EFB00A@cutebit.org>
 <YqILv21K+tZ00Qhx@sirena.org.uk>
 <2A0422B8-8367-457E-A146-730F7C3DE66B@cutebit.org>
 <YqIWtzphzVGmbIOe@sirena.org.uk>
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


> On 9. 6. 2022, at 17:50, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Thu, Jun 09, 2022 at 05:24:49PM +0200, Martin Povi=C5=A1er wrote:
>>> On 9. 6. 2022, at 17:03, Mark Brown <broonie@kernel.org> wrote:
>=20
> Why is this off list?

By accident, added the CC list back with this reply (hopefully it
still attaches to the thread when people receive it).

>>> That's basically no userspaces at this point TBH.  I'm not convinced
>>> it's a good idea to be adding custom code for that use case.
>>=20
>> FWIW I know of at least one user of the WIP audio support on Macs who
>> would welcome this feature. My preference is to keep it in, but in
>> the end I guess it=E2=80=99s your call.
>=20
> I'd rather not have this open coded in individual drivers, we already
> have an unfortunate abundance of jack detection interfaces.  If we're
> going to add anything I'd rather it were in core code and TBH I'm
> struggling to be enthusiastic.

Noted.

> Can you say anything more about the use case?

I can restate: The alleged use case is running userspace without sound
server, but having playback switch transparently between speakers and
headphones even mid-stream based on jack detection.

>>>> I looked at the existing DAPM integration but I couldn=E2=80=99t =
figure out
>>>> how to switch the demux with it.
>=20
>>> Yes, it won't do that.  If you can't stream the same audio to both =
then
>>> you'd need something else.
>=20
>> I don=E2=80=99t understand what=E2=80=99s meant by streaming the same =
audio here.
>=20
> Playing one audio stream from the host which appears on both speakers
> and headphones - I don't know what the mixing and muxing capabilities =
of
> the hardware are.
>=20
>> Taking a guess: The existing DAPM integration can enable the =
headphones
>> path based on jack being plugged in, but it can=E2=80=99t disable the =
speakers
>> path like the demux does?
>=20
> No, that works perfectly fine - you can enable or disable pins =
depending
> on the jack state.

Ah, I peeked into soc-jack.c. What about this then: If I understand what
pins represent, they would be at the remote end of the DAPM paths. So if
for the speakers I add something like

   Headphones Codec Out =E2=80=94> Jack pin

                       +--> Always-on pin
                       |
   Speaker Amp Out -> Mux
                       |
                       +--> Jack inverted pin

and let userspace control the mux, it would in effect support the same
use cases as what I attempted in the code so far. Sounds somewhat right?

