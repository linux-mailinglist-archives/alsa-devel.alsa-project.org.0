Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1A4203F1
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 22:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF57168A;
	Sun,  3 Oct 2021 22:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF57168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633293381;
	bh=QV7nJ1F9QwKzbOm4KwBU6o/2acQFEl4Xc3qJkVkpMVg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQXrVvulUotH/KVMK1UTUkdastbQaTQArYL475d6UJe4wcM7wCpCY1YBocIxc5FcF
	 o1xCR74OPP07WweOSrLNcXVsbHUWAOwrUNZ/eUAftDQWzu7hKPcQpiKlHs2xrBgoWg
	 NhoIsAAXjLE2yoghJ/4i8EXmsbngKA/GhG41dqyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 098A0F80171;
	Sun,  3 Oct 2021 22:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91997F8027D; Sun,  3 Oct 2021 22:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1832F800EF
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 22:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1832F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DjM57pZL"
Received: by mail-vs1-xe29.google.com with SMTP id f2so16391638vsj.4
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aMaPrsyqMzqnitLUkNbyTxFFVV299s8xfAEeCtTTK7E=;
 b=DjM57pZLudSIz14MHKRd32H1lLf61lH5fhenDp7z9fPJC0feexbXQIqSKOAByOBZ4X
 uW/RcmSRHFT4tXrNJUr7ub8rlSAXNBfBuLe7y6zbJM5iE+XQDppfRy77KJQr5/GQWq1C
 97rP68vYvC61FpF2ao30fTIpDWMC9jRekBwKi7YoAzLRnEDZiE+g84E2hz7KdiDixeGq
 Wkaz0uADARUZaSobFXhmOM8IIu8LsE0LR/IlP7K7+7eT7DOKf93+rO/S6j174kjfB3jP
 6Nbl9DMXLf73kqIgLs9ORxH0ZXJ1LeMlNJMvIFRamkpn4Xs3zZnCc8TDkwgKFWh0unS5
 ryDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aMaPrsyqMzqnitLUkNbyTxFFVV299s8xfAEeCtTTK7E=;
 b=HzeEXqtQtebA2D7hw5w6Yi7WSda2WD1g8s/CX19ZwxSMKesNA24cPbc2dBSrHt/ySu
 3lckxorkKCVyN0Lh/3pxbqLf53TiJYFK+uVHSQu5vgi+14sR01XFIPjpbt9OUsZoZMS0
 IS1c6le3scN/V+oCx/ceOk3njbp+e36XwfYi3NyTPLhHGbDvzk61ScahLbsveJxnVg+q
 zpguiAa0cwCLWnUZOJm8WtYrLfaAv2rzECcuyxCeZUEnlGFl4pH/ZpODLzSY9m5r3U0w
 9ZWJWTQTwekQawd4CLGrjSs3rIdCYfXzr/GWunDecm9mD2t2R8ZqZjJmivYJtj4ibjjH
 ef2w==
X-Gm-Message-State: AOAM533Y0uCrhlBFJGFRM49ufq3LbmkrDGk3AO4/cfO4Omosxq4EkmE3
 gNiDcUCpaJLzEKODNIz0dU0=
X-Google-Smtp-Source: ABdhPJzJzwCPKrb/1V62fA2xuDYTdXbINF9bwLk6g9KiDcMWe3gWxCC188hMG0iRt8Dpr6tGZpoyDQ==
X-Received: by 2002:a67:e416:: with SMTP id d22mr10327574vsf.41.1633293292439; 
 Sun, 03 Oct 2021 13:34:52 -0700 (PDT)
Received: from geday ([2804:7f2:8280:9a0f:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id t3sm6116644vka.35.2021.10.03.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 13:34:52 -0700 (PDT)
Date: Sun, 3 Oct 2021 17:34:48 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVoT6PELmVxDUaH5@geday>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <YVk77/SIxr8Vt8TQ@geday>
 <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
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

On Sun, Oct 03, 2021 at 11:00:15AM +0400, Christian Hewitt wrote:
> 
> > On 3 Oct 2021, at 9:13 am, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > 
> > On Sun, Oct 03, 2021 at 01:43:12AM +0200, Martin Blumenstingl wrote:
> >> Hello Jerome et al.,
> >> 
> >> on Amlogic Meson SoCs which use the AIU audio controller we have the
> >> so-called "machine gun noise" (MGN) issue, reproducible for example in
> >> Kodi. So far nobody was able to identify the cause of this issue. My
> >> idea was to at least narrow down the issue so we can categorize it. For
> >> that I wanted to get the SPDIF output from AIU to the HDMI controller
> >> working.
> >> 
> > 
> > Hi, Martin,
> > 
> > The MGN issue surely must be that one when using ALSA directly
> > (no dmix, no JACK, no Pulseaudio, no Pipewire, no nothing) and
> > when the track changes or we pause it, when it resumes we get 
> > noise instead of sound, correct?
> > 
> > If so, thanks for trying to track this down!
> > 
> > I bring it up because Googling it seems to head straight to a
> > Neil Armstrong post to linux-amlogic about what works and what
> > doesn't on linux-meson currently, and only if you dig deeper
> > you find a couple of reports apparently by the same person
> > about the "machine gun noise" thing.
> > 
> > It doesn't sound like a machine gun noise to me :)
> > 
> > More like brown noise, but anyway what I'd like to note to
> > everyone involved is that this one is a major dealbreaker.
> > Unless using JACK, Pulseaudio, Pipewire (?) or at least dmix
> > audio will degrade at the second song or when the user first
> > pauses and then resumes a stream, completely ruining the
> > experience.
> 
> 
> I’m the origin of most reports that Google will eventually
> discover. I was told elsewhere that this is known as MGN so
> I’ve described it as such, but that could be wrong. For
> clarity this is the noise (triggered, and with AVR volume
> deliberately right down) followed by some navigation in the
> Kodi GUI to change output:
> 
> https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov
> 

Hi, Christian,

Thanks for the video.

> In the LibreELEC images I work on where this occurs it’s not
> something I associate with play/pause (although I can’t
> definitively rule it out) or second or third songs
> (not something that happens that often or predictably) but
> more when there’s a hard transition like starting or
> stopping playback. I hit it most with simple scrolling around
> in the Kodi GUI, although that could be because (due to this issue)
> I limit media playback testing on AIU devices. It’s particularly
> simple to trigger from the Kodi Settings > System > Audio page,
> just scroll around it for 10-30 seconds, which is handy because
> the only way to stop the noise is switching audio source (from
> anything to anything) on the same page.
> 
> CH.
> 

I wasn't able to reproduce the bug by simply scrolling around. On
the other hand, once I flipped the Send Low Volume Noise switch
to off, all hell broke loose!

This is one show-stopper bug, and I empathize to how particularly
nasty this must be for a "Just enough Linux for Kodi" approach.

But I also see Jerome Brunet has already clarified the subject in
response to Martin Blumenstingl's original post.

Thank you,
Geraldo Nascimento


> >> On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
> >> used. This has an SPDIF input but there's currently not driver for it.
> >> On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the TransSwitch
> >> HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
> >> and I2S inputs.
> >> I decided to add SPDIF support to the latter since the code from the
> >> vendor driver is much easier.
> >> 
> >> It took me a while to figure out why I would not get any audio output
> >> from AIU SPDIF to the HDMI controller - or from there to the sink.
> >> The "fix" for this issue is the RFC patch which is part of this series.
> >> Any feedback would be great as I am still new to the ASoC subsystem.
> >> 
> >> Another part I am still struggling with is the audio "routing" (due to
> >> lack of a better term - please correct me if this is not the right word
> >> to use for this case). I have the following description in my .dts:
> >> 	sound {
> >> 		compatible = "amlogic,gx-sound-card";
> >> 		model = "M8B-ODROID-C1";
> >> 
> >> 		assigned-clocks = <&clkc CLKID_MPLL0>,
> >> 				  <&clkc CLKID_MPLL1>;
> >> 		assigned-clock-rates = <294912000>,
> >> 				       <270950400>;
> >> 		dai-link-0 {
> >> 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> >> 		};
> >> 
> >> 		dai-link-1 {
> >> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> >> 		};
> >> 
> >> 		dai-link-2 {
> >> 			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> >> 			dai-format = "i2s";
> >> 			mclk-fs = <256>;
> >> 
> >> 			codec-0 {
> >> 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> >> 			};
> >> 		};
> >> 
> >> 		dai-link-3 {
> >> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> >> 
> >> 			codec-0 {
> >> 				sound-dai = <&aiu AIU_HDMI CTRL_PCM>;
> >> 			};
> >> 		};
> >> 
> >> 		dai-link-4 {
> >> 			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> >> 
> >> 			codec-0 {
> >> 				sound-dai = <&hdmi_tx>;
> >> 			};
> >> 		};
> >> 	};
> >> The driver for &hdmi_tx defines:
> >> 	struct hdmi_codec_pdata pdata = {
> >> 		.ops			= &txc_48352_hdmi_codec_ops,
> >> 		.i2s			= 1,
> >> 		.spdif			= 1,
> >> 		.max_i2s_channels	= 8,
> >> 		.data			= priv,
> >> 	};
> >> In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
> >> remove all I2S references from the .dts snipped above (only then
> >> HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
> >> enum in aiu-codec-ctrl I was expecting the format to update as well.
> >> That unfortunately doesn't happen and I don't know how that can be
> >> achieved.
> >> 
> > 
> > Hm, that sounds weird. I hope you get the answers you are looking for.
> > 
> > Thanks,
> > Geraldo Nascimento
> > 
> >> 
> >> Best regards,
> >> Martin
> >> 
> >> 
> >> Martin Blumenstingl (1):
> >>  ASoC: meson: aiu: Fix HDMI codec control selection
> >> 
> >> sound/soc/meson/aiu-codec-ctrl.c  | 108 ++++++++++++++++++++++--------
> >> sound/soc/meson/aiu-encoder-i2s.c |   6 --
> >> 2 files changed, 80 insertions(+), 34 deletions(-)
> >> 
> >> -- 
> >> 2.33.0
> >> 
> > 
> 
