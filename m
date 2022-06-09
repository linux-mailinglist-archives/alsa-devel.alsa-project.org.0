Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9E544DED
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB581B17;
	Thu,  9 Jun 2022 15:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB581B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654782198;
	bh=nFW2ZWwNUBv1LAW8g6pRiauMNWamOwC17MQ/HanEDlk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpIGaViPSgqeZJtK6f+ZfqdTu1sPczb/jt8rlMm6i69+QEcq7PS4+xQDfwgHLLBzq
	 o0rleEXO32piaA+2vTzDLBIk/hptQS8qqybOiRfNoQoP8UvziGTdh7I3k8nP19WhD9
	 y2+lGeKwyh2wgBGmDi/sycBeGGjV1/LggvtBa7zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08BAF804BD;
	Thu,  9 Jun 2022 15:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B473F800C7; Thu,  9 Jun 2022 15:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99B30F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B30F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="IMMgtCRp"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654782130; bh=tvrYkSFFBhOsiav8I6p+1rTRBiUVpZlVK8alorHDY7A=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=IMMgtCRpisiNaxxnvTT3evMSU1zXtF+eiWPSRNvyKpmyEasVNFhUxwP3qX6Af4JPV
 vrTi9PGPbLDxuZag7Ffa/annlnguM8rRVOJ/mpeUlwn2GhgdNx7811x0hiWGwnQE9p
 UjrD+4wbtRU9z4FP/gmW2Ws4vOQ7KieXgsSh97DE=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YqHylN3xba9XFrF8@sirena.org.uk>
Date: Thu, 9 Jun 2022 15:42:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E611F13-96E3-41FD-9550-F900B2EFB00A@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqHylN3xba9XFrF8@sirena.org.uk>
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


> On 9. 6. 2022, at 15:16, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 06, 2022 at 09:19:10PM +0200, Martin Povi=C5=A1er wrote:
>=20
>> + *  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90       =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=
=BA =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
>> + *  =E2=94=82 Primary  =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=A4                 =E2=94=82 Mux =E2=94=82 =
=E2=94=80=E2=94=80=E2=96=BA =E2=94=82 Speakers =E2=94=82
>> + *  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98       =E2=94=82    =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=96=BA =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>> + *                =E2=94=8C=E2=94=80=E2=94=80=E2=94=80 =E2=94=82 =
=E2=94=80=E2=94=80=E2=94=80=E2=94=98             =E2=96=B2
>> + *  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=82    =E2=94=82       =
           =E2=94=82
>> + *  =E2=94=82Secondary =E2=94=9C=E2=94=80=E2=94=80=E2=94=98    =E2=94=82=
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=90
>> + *  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98       =
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82Plug-in =
Demux=E2=94=82
>> + *                     =E2=94=82     =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=98
>> + *                     =E2=94=82                  =E2=94=82
>> + *                     =E2=94=82                  =E2=96=BC
>> + *                     =E2=94=82                 =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
>> + *                     =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=
=BA =E2=94=82 Mux =E2=94=82 =E2=94=80=E2=94=80=E2=96=BA =E2=94=82Headphone=
s=E2=94=82
>> + *                                       =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98     =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98
>=20
> As far as I can tell this demux is entirely software based - why not
> just expose the routing control to userspace and let it handle
> switching (which I suspect may be more featureful than what's
> implemented here)?

Well, userspace should have the other two muxes at its disposal to
implement any routing/switching it wishes -- but in addition we are
also offering letting kernel take care of the switching, by pointing
the muxes to the demux.

I assume (but I don=E2=80=99t know the extent of what=E2=80=99s possible =
with UCM files),
that this will be of some value to users running plain ALSA with no
sound server.

>> +static int macaudio_jack_event(struct notifier_block *nb, unsigned =
long event,
>> +                               void *data)
>> +{
>> +       struct snd_soc_jack *jack =3D data;
>> +       struct macaudio_snd_data *ma =3D =
snd_soc_card_get_drvdata(jack->card);
>> +
>> +       ma->jack_plugin_state =3D !!event;
>> +
>> +       if (!ma->plugin_demux_kcontrol)
>> +               return 0;
>> +
>> +       snd_soc_dapm_mux_update_power(&ma->card.dapm, =
ma->plugin_demux_kcontrol,
>> +                                     ma->jack_plugin_state,
>> +                                     (struct soc_enum *) =
&macaudio_plugin_demux_enum, NULL);
>> +
>> +       return 0;
>> +}
>=20
> This should be integrated with the core jack detection stuff in
> soc-jack.c and/or the core stuff that's wrapping - that way you'll
> ensure that events are generated and status readable via all the
> interfaces userspace might be looking for.  The ASoC stuff also has =
some
> DAPM integration for turning on/off outputs which might DTRT for you =
if
> you do need it in kernel.

Aren=E2=80=99t all the right events to userspace generated already by =
the
codec calling snd_soc_jack_report?

I looked at the existing DAPM integration but I couldn=E2=80=99t figure =
out
how to switch the demux with it.

