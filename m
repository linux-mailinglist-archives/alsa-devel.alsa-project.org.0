Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6E420A19
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 13:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C05F168D;
	Mon,  4 Oct 2021 13:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C05F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633346886;
	bh=blmNkZNc92mS2zRte5vi4wNDbF2+B7ecwV6c9Azx6gc=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Od9iJyOz2FLDaHRcGKG+xTpxtFZX7E1uWAEg/NBZunWqOMt9OCnGi2rNlBgr0v6mE
	 wfTYO3za5gbpPvamW7me3sy8wsTWaKe2kvLFOMs0kC0EbQ2EjnW4WH52YyU5QB0fFQ
	 hsCQ0FXpKAFUIewxRhIuheo1fELq7MnDSijeDCQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C05DCF80249;
	Mon,  4 Oct 2021 13:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 271A5F8027D; Sun,  3 Oct 2021 09:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 840BFF800EF
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 09:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 840BFF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MzLjF2IX"
Received: by mail-ed1-x52c.google.com with SMTP id b8so17024538edk.2
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IrffqWMw8ejrndFB+WPZ3D+EgTw2ScOMfT+zWzfsTtE=;
 b=MzLjF2IXqbcSg/4vrB3lBMxtBcIUAlyxOYg6GIZAIamXBubzxvSnz5C9XYrEDLB7zx
 NzJwm1UwOn0IBtsWe9Ue+SB2sW4mFOoKCKcAV4jfQValrd1Pnsbldkc1OzLfVEmJ+xqE
 SjLjaP5DkQFkRtZ6GW6obx+tjXTgo955RMORateiWSATE8sfkdn6M+/geTOIEJjti4/v
 nHbYlLI2neb918LtcrHGzHBqzJcG3t7hUFcqxzGXrujCyjA2vY4QYlmEldX3bzXsG05I
 JxgLweiUTXRUfKDDeqw5SYs8O1sQVMckXRgscNq67zHbVPg9tdUKmaSBRbUx6jP5qwe7
 UODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IrffqWMw8ejrndFB+WPZ3D+EgTw2ScOMfT+zWzfsTtE=;
 b=8OMFBPCaZpMJJUQvirP2Ms3foa67UcnvZaxkfvSal2XxphhcJ0HrVbsTBLFl094X8d
 62D4TzgUS+WOGxRxaWPfVa1ypZuC7+lIKpL12A7e1H07Z+J3VlNhJ2L4tWHP7pNNkPWg
 w61nF7apSHDLt5RwMT64UKxFJlqqQEVua/oRmyw91GwHaYW5tyFu13XxhmL2qtjODCzr
 Z6gSuHcNlrkGIkbbYudDr5R00ypvSe0wEm8frZsWUywz0yzvJlsLRUUdTNRzhRSppv0t
 Yiqd0rTdDv3Be2F3Uf/vq+MGFDz/FxP3dwnlEGm6lA59YFipejXw0NjkvROfxVDwFDxH
 atMw==
X-Gm-Message-State: AOAM530V5PDNuLtEEWnQ5Lxk1jRYInc0CtzFIi2WEUZklLGm9tRQFDkp
 rXPWYb9X0aChnQr0Zo1M83M=
X-Google-Smtp-Source: ABdhPJykjUlgXjYLrBmiILIn2FdAj4CY/taRo1fB8rDylARwKadrwlF92tI8q8HJT/umuGyMF3HMDw==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr9073188edk.90.1633244421487; 
 Sun, 03 Oct 2021 00:00:21 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 5sm4901865ejy.53.2021.10.03.00.00.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Oct 2021 00:00:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <YVk77/SIxr8Vt8TQ@geday>
Date: Sun, 3 Oct 2021 11:00:15 +0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <YVk77/SIxr8Vt8TQ@geday>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Mailman-Approved-At: Mon, 04 Oct 2021 13:26:48 +0200
Cc: alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, tiwai@suse.com,
 lgirdwood@gmail.com, LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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


> On 3 Oct 2021, at 9:13 am, Geraldo Nascimento =
<geraldogabriel@gmail.com> wrote:
>=20
> On Sun, Oct 03, 2021 at 01:43:12AM +0200, Martin Blumenstingl wrote:
>> Hello Jerome et al.,
>>=20
>> on Amlogic Meson SoCs which use the AIU audio controller we have the
>> so-called "machine gun noise" (MGN) issue, reproducible for example =
in
>> Kodi. So far nobody was able to identify the cause of this issue. My
>> idea was to at least narrow down the issue so we can categorize it. =
For
>> that I wanted to get the SPDIF output from AIU to the HDMI controller
>> working.
>>=20
>=20
> Hi, Martin,
>=20
> The MGN issue surely must be that one when using ALSA directly
> (no dmix, no JACK, no Pulseaudio, no Pipewire, no nothing) and
> when the track changes or we pause it, when it resumes we get=20
> noise instead of sound, correct?
>=20
> If so, thanks for trying to track this down!
>=20
> I bring it up because Googling it seems to head straight to a
> Neil Armstrong post to linux-amlogic about what works and what
> doesn't on linux-meson currently, and only if you dig deeper
> you find a couple of reports apparently by the same person
> about the "machine gun noise" thing.
>=20
> It doesn't sound like a machine gun noise to me :)
>=20
> More like brown noise, but anyway what I'd like to note to
> everyone involved is that this one is a major dealbreaker.
> Unless using JACK, Pulseaudio, Pipewire (?) or at least dmix
> audio will degrade at the second song or when the user first
> pauses and then resumes a stream, completely ruining the
> experience.


I=E2=80=99m the origin of most reports that Google will eventually =
discover. I was told elsewhere that this is known as MGN so I=E2=80=99ve =
described it as such, but that could be wrong. For clarity this is the =
noise (triggered, and with AVR volume deliberately right down) followed =
by some navigation in the Kodi GUI to change output:

https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov

In the LibreELEC images I work on where this occurs it=E2=80=99s not =
something I associate with play/pause (although I can=E2=80=99t =
definitively rule it out) or second or third songs (not something that =
happens that often or predictably) but more when there=E2=80=99s a hard =
transition like starting or stopping playback. I hit it most with simple =
scrolling around in the Kodi GUI, although that could be because (due to =
this issue) I limit media playback testing on AIU devices. It=E2=80=99s =
particularly simple to trigger from the Kodi Settings > System > Audio =
page, just scroll around it for 10-30 seconds, which is handy because =
the only way to stop the noise is switching audio source (from anything =
to anything) on the same page.

CH.

>> On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
>> used. This has an SPDIF input but there's currently not driver for =
it.
>> On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the =
TransSwitch
>> HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
>> and I2S inputs.
>> I decided to add SPDIF support to the latter since the code from the
>> vendor driver is much easier.
>>=20
>> It took me a while to figure out why I would not get any audio output
>> from AIU SPDIF to the HDMI controller - or from there to the sink.
>> The "fix" for this issue is the RFC patch which is part of this =
series.
>> Any feedback would be great as I am still new to the ASoC subsystem.
>>=20
>> Another part I am still struggling with is the audio "routing" (due =
to
>> lack of a better term - please correct me if this is not the right =
word
>> to use for this case). I have the following description in my .dts:
>> 	sound {
>> 		compatible =3D "amlogic,gx-sound-card";
>> 		model =3D "M8B-ODROID-C1";
>>=20
>> 		assigned-clocks =3D <&clkc CLKID_MPLL0>,
>> 				  <&clkc CLKID_MPLL1>;
>> 		assigned-clock-rates =3D <294912000>,
>> 				       <270950400>;
>> 		dai-link-0 {
>> 			sound-dai =3D <&aiu AIU_CPU CPU_I2S_FIFO>;
>> 		};
>>=20
>> 		dai-link-1 {
>> 			sound-dai =3D <&aiu AIU_CPU CPU_SPDIF_FIFO>;
>> 		};
>>=20
>> 		dai-link-2 {
>> 			sound-dai =3D <&aiu AIU_CPU CPU_I2S_ENCODER>;
>> 			dai-format =3D "i2s";
>> 			mclk-fs =3D <256>;
>>=20
>> 			codec-0 {
>> 				sound-dai =3D <&aiu AIU_HDMI CTRL_I2S>;
>> 			};
>> 		};
>>=20
>> 		dai-link-3 {
>> 			sound-dai =3D <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
>>=20
>> 			codec-0 {
>> 				sound-dai =3D <&aiu AIU_HDMI CTRL_PCM>;
>> 			};
>> 		};
>>=20
>> 		dai-link-4 {
>> 			sound-dai =3D <&aiu AIU_HDMI CTRL_OUT>;
>>=20
>> 			codec-0 {
>> 				sound-dai =3D <&hdmi_tx>;
>> 			};
>> 		};
>> 	};
>> The driver for &hdmi_tx defines:
>> 	struct hdmi_codec_pdata pdata =3D {
>> 		.ops			=3D &txc_48352_hdmi_codec_ops,
>> 		.i2s			=3D 1,
>> 		.spdif			=3D 1,
>> 		.max_i2s_channels	=3D 8,
>> 		.data			=3D priv,
>> 	};
>> In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
>> remove all I2S references from the .dts snipped above (only then
>> HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
>> enum in aiu-codec-ctrl I was expecting the format to update as well.
>> That unfortunately doesn't happen and I don't know how that can be
>> achieved.
>>=20
>=20
> Hm, that sounds weird. I hope you get the answers you are looking for.
>=20
> Thanks,
> Geraldo Nascimento
>=20
>>=20
>> Best regards,
>> Martin
>>=20
>>=20
>> Martin Blumenstingl (1):
>>  ASoC: meson: aiu: Fix HDMI codec control selection
>>=20
>> sound/soc/meson/aiu-codec-ctrl.c  | 108 =
++++++++++++++++++++++--------
>> sound/soc/meson/aiu-encoder-i2s.c |   6 --
>> 2 files changed, 80 insertions(+), 34 deletions(-)
>>=20
>> --=20
>> 2.33.0
>>=20
>=20

