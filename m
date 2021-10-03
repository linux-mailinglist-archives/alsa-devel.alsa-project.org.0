Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08942002B
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 07:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3FE1690;
	Sun,  3 Oct 2021 07:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3FE1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633238088;
	bh=SHbDwJMlXB35yqLghBhHp94edSb7QvIkzjL4qBJOrvc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+uw1SlEe/vHNVO844IKOIk13Snl9ugNn1WStCVJFvkX2Z6eTi6sryTEBRFgAO2n1
	 1HNMu2ckBPV+m5EpEl+TzOdL6w7v3fouLPByGBjGP/iZ5ixPmuN1scctARr+Uj3WyI
	 QgYAYxPtiKt7mPBC0LiHtST7gJfO88YPhaiwdJdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A30F8028B;
	Sun,  3 Oct 2021 07:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5EAAF8027D; Sun,  3 Oct 2021 07:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B67F800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 07:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B67F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IPEybbj+"
Received: by mail-qt1-x82b.google.com with SMTP id l13so13014892qtv.3
 for <alsa-devel@alsa-project.org>; Sat, 02 Oct 2021 22:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ulbTVNSJ2iNJZxZK00NR1PC8WsHr0mc+HEMbZmRuv3I=;
 b=IPEybbj+ehfBzk/ZqtSTakokncT+6/v3I9sZ7U/Lq8nq+kmPdjczyC42Pf8HFViAv3
 a/dbCxlfCvCOXsN40cX7ptcPd8/qRfnft22roUwExNnDBs2ACE2aTuNp0fWTqrEvAChF
 5zaeCMNt1Q5WCRy+RNwUoZL7XdZPWfGD8VYvnecINloko/xgVY8WSjjuLWC8GTb/7oer
 GtyoFTT0j/WypuRNfLI8qlHpCmn5DnKPyG57VSCM/sBljNi6ZvtUCQPikyBdRvPMmbig
 V1M0ZnSwB1mH6fc7ipKg/9KS5COMOv/0JRcrDig7oBf6NawBPH8cFN6/2Vbq7qmnog4K
 6Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ulbTVNSJ2iNJZxZK00NR1PC8WsHr0mc+HEMbZmRuv3I=;
 b=45ZLMaFz9aY6BOugjxEJwueplkMiXwxu1aZc/lMF14gxPKyImMeAnlyl6F5IphNGQP
 0Zte9WIs6w6mJin94OQN5TpL8xlRohQgwDgG1QEUOTinWXV+6sPF4KzV7PChBLigErGc
 Kgj6WM+p7EpC6JvsIG7XRcOQfSwiyPmqy5is0WmCw1po5JSI4sVQJGScWGJQRmU5W/ia
 EcN8adC3YcZyiNPQaCaGYhiS3C9odqrmscpRIdFL7UsHFeyV/bEqgasszohrjdlzmCcJ
 twTRp1QdxdHAwXIMgrg6c/xfWVXAGVHTj3+ojSgg6ihC74taWuM/+x3zOuzqNQaV+jzx
 +E5Q==
X-Gm-Message-State: AOAM531iaSexnQN/r3ss55qLi124P5qMJ6aO+Yngyfe3kCt7LRiPNMky
 TsGWaM5LvD+uqNxeOMx/Nig=
X-Google-Smtp-Source: ABdhPJzioSuGzx0Q7e0kRaQ5WWNQA4BhFy7b5Z30W2SOkuqm96ro8a6xkF6I1iBN61fBfkX7h8zVOg==
X-Received: by 2002:ac8:6b43:: with SMTP id x3mr6815822qts.190.1633238000236; 
 Sat, 02 Oct 2021 22:13:20 -0700 (PDT)
Received: from geday ([2804:7f2:8280:6c81:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id p9sm5518208qkm.23.2021.10.02.22.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 22:13:19 -0700 (PDT)
Date: Sun, 3 Oct 2021 02:13:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVk77/SIxr8Vt8TQ@geday>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

On Sun, Oct 03, 2021 at 01:43:12AM +0200, Martin Blumenstingl wrote:
> Hello Jerome et al.,
> 
> on Amlogic Meson SoCs which use the AIU audio controller we have the
> so-called "machine gun noise" (MGN) issue, reproducible for example in
> Kodi. So far nobody was able to identify the cause of this issue. My
> idea was to at least narrow down the issue so we can categorize it. For
> that I wanted to get the SPDIF output from AIU to the HDMI controller
> working.
>

Hi, Martin,

The MGN issue surely must be that one when using ALSA directly
(no dmix, no JACK, no Pulseaudio, no Pipewire, no nothing) and
when the track changes or we pause it, when it resumes we get 
noise instead of sound, correct?

If so, thanks for trying to track this down!

I bring it up because Googling it seems to head straight to a
Neil Armstrong post to linux-amlogic about what works and what
doesn't on linux-meson currently, and only if you dig deeper
you find a couple of reports apparently by the same person
about the "machine gun noise" thing.

It doesn't sound like a machine gun noise to me :)

More like brown noise, but anyway what I'd like to note to
everyone involved is that this one is a major dealbreaker.
Unless using JACK, Pulseaudio, Pipewire (?) or at least dmix
audio will degrade at the second song or when the user first
pauses and then resumes a stream, completely ruining the
experience.

> On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
> used. This has an SPDIF input but there's currently not driver for it.
> On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the TransSwitch
> HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
> and I2S inputs.
> I decided to add SPDIF support to the latter since the code from the
> vendor driver is much easier.
> 
> It took me a while to figure out why I would not get any audio output
> from AIU SPDIF to the HDMI controller - or from there to the sink.
> The "fix" for this issue is the RFC patch which is part of this series.
> Any feedback would be great as I am still new to the ASoC subsystem.
> 
> Another part I am still struggling with is the audio "routing" (due to
> lack of a better term - please correct me if this is not the right word
> to use for this case). I have the following description in my .dts:
> 	sound {
> 		compatible = "amlogic,gx-sound-card";
> 		model = "M8B-ODROID-C1";
> 
> 		assigned-clocks = <&clkc CLKID_MPLL0>,
> 				  <&clkc CLKID_MPLL1>;
> 		assigned-clock-rates = <294912000>,
> 				       <270950400>;
> 		dai-link-0 {
> 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> 		};
> 
> 		dai-link-1 {
> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> 		};
> 
> 		dai-link-2 {
> 			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> 			dai-format = "i2s";
> 			mclk-fs = <256>;
> 
> 			codec-0 {
> 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> 			};
> 		};
> 
> 		dai-link-3 {
> 			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> 
> 			codec-0 {
> 				sound-dai = <&aiu AIU_HDMI CTRL_PCM>;
> 			};
> 		};
> 
> 		dai-link-4 {
> 			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> 
> 			codec-0 {
> 				sound-dai = <&hdmi_tx>;
> 			};
> 		};
> 	};
> The driver for &hdmi_tx defines:
> 	struct hdmi_codec_pdata pdata = {
> 		.ops			= &txc_48352_hdmi_codec_ops,
> 		.i2s			= 1,
> 		.spdif			= 1,
> 		.max_i2s_channels	= 8,
> 		.data			= priv,
> 	};
> In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
> remove all I2S references from the .dts snipped above (only then
> HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
> enum in aiu-codec-ctrl I was expecting the format to update as well.
> That unfortunately doesn't happen and I don't know how that can be
> achieved.
> 

Hm, that sounds weird. I hope you get the answers you are looking for.

Thanks,
Geraldo Nascimento

> 
> Best regards,
> Martin
> 
> 
> Martin Blumenstingl (1):
>   ASoC: meson: aiu: Fix HDMI codec control selection
> 
>  sound/soc/meson/aiu-codec-ctrl.c  | 108 ++++++++++++++++++++++--------
>  sound/soc/meson/aiu-encoder-i2s.c |   6 --
>  2 files changed, 80 insertions(+), 34 deletions(-)
> 
> -- 
> 2.33.0
> 
