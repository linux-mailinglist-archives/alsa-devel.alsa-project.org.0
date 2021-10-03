Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C94202BE
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 18:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542781689;
	Sun,  3 Oct 2021 18:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542781689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633278958;
	bh=voXsS16jv1z84EgHpN9Q1wrsz0TBKoYfb/HUAijwF5k=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OK57NIz5/rdY7AuYA/RSixaCDjJmiTav924LdBLGPk1U8kyMDBr2pxXOxrFYMigaY
	 YjZNF4wPha0K8MjBlyExeAiIkEnIFU3rmB4c90v+PIay3zXjPiILb6vHqo8SUmf+E0
	 8lnl/XD7/bGGUbl2g1Oa+j9cn3VTr7XAyAxybaXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7163F800ED;
	Sun,  3 Oct 2021 18:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D97AAF804BB; Sun,  3 Oct 2021 18:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AACBF800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 18:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AACBF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="ZquaEFNQ"
Received: by mail-wr1-x434.google.com with SMTP id d26so25782475wrb.6
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=AfcjZljpnyi3x3inUnv1hf4IgNO1UtATkc18L3EpJlA=;
 b=ZquaEFNQQG+cc6p2QntDlwSZZ2TVIFbSQfAy4SKNNPT3whjpR1sAQoSozsJT1/kpKk
 I/cIcC8trxXuEg4ZeM5AhrwIf2NLSPOGhRfTI/DJdBPL6Nchev0dGnQ9OvgqWmEjEEyT
 gteCetHJowRpJaX6Bd+xJv6c5UlC9zuljd3Hp7jBtJKovnoC5OiFdrd8DX0BpSBdOP2A
 21Ousy+rgBkf7EBKxztczs/owRHGApd2+xEIoPGN54LHA+gq4i+H6FjMfaLKIMqCK5rM
 zxjz1RH4+7GyocDb5OA388Z0T0dhnQ7s6lald6mdWOYmmS6h5N9Z+LvNRbo+GK5mxTT1
 IGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=AfcjZljpnyi3x3inUnv1hf4IgNO1UtATkc18L3EpJlA=;
 b=M915TyGTloyM1cuGh3Z8neWxujKvzl7mFYZ68TWL2XQNV9ERhhfDdQdJtZ/n2eg/Rs
 ySpE34eCOY24HuTS5MseVmbvLz3DA0qkAOUtsAOCSLXxxvAtubj0ru5v9uqh6lNE262a
 AWzffCkwTawAy27e4gQyWKnAe0Lq4sKpfOn4SsivFiXy1+a+uWzuojgvpqt5m8Ko3UyA
 28XcmTmpR04cEyXxxaKY3iZFdbmaGbQaisy73IYDFfL+7n9pYh3G7k0ou58mO2Jq1wVK
 VJ6RGHmYR5E7bl6oo79m7kh81m/53l2dsGGBuFqaM2xg6xmNO1gHe9/aYRr8U0cNPzZ1
 cEIQ==
X-Gm-Message-State: AOAM531SisjGsO9kd+6/KqSoQOSxrVdVHTR7OV+dyhC7aQhi3FQFZ/3O
 agF1DibZTuBW1bodSvb5rr2a3w==
X-Google-Smtp-Source: ABdhPJxDks6Yk+yh8WWF/R0E0aUU/uhv3pPrPdejRwi6v3WACZsH0mug7PHzZQbWOFqIdv6TAvuPYQ==
X-Received: by 2002:adf:97d4:: with SMTP id t20mr3262138wrb.174.1633278868815; 
 Sun, 03 Oct 2021 09:34:28 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o12sm12084828wms.15.2021.10.03.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 09:34:28 -0700 (PDT)
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Date: Sun, 03 Oct 2021 17:57:34 +0200
In-reply-to: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
Message-ID: <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
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


On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello Jerome et al.,
>
> on Amlogic Meson SoCs which use the AIU audio controller we have the
> so-called "machine gun noise" (MGN) issue, reproducible for example in
> Kodi. So far nobody was able to identify the cause of this issue. My
> idea was to at least narrow down the issue so we can categorize it. For
> that I wanted to get the SPDIF output from AIU to the HDMI controller
> working.

Ok, I'll clarify (again) about this issue.

This issue is on AIU only (not the AXG series), on the i2s encoder
regardless of the output (HDMI, internal and external codec)

This encoder support either 2ch or 8ch mode, nothing else.
As long as only 2ch was supported, there was no problem.
In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
aiu-encoder-i2c.c). Without this, the switch is not done.

What these do, how and when it should be done is unclear. I tried
several combination. At the time I found something stable-ish but it was
not perfect.

At the time, It was completely new driver. Even if was not rock solid,
it was still progress and I opted to upstream it with an imperfect 8ch
support so people could help debug it. This was mentioned in the
original submission.

The other solution is to restrict to 2ch mode and remove
AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
anymore.

>
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

Ok, the obove sums up the problem around this RFC.

Here you describe a DAI link (think of it as wires) between the SPDIF
encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
it is not possible.

Let's start from the HDMI controller.
The designware (on amlogic SoC) has 2 interface for audio input.
1) PCM/I2S: a classic interface 2 clocks and N data line
2) SPDIF: The Sony Philips 1 wire interface

Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
won't fly there.

AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
implemented as an ASoC codec which allows to seleted one of 2 audio
sources:
A) the i2s output implemented as part of the AIU
B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
is not implemented ATM.

So trying to handle SPDIF through AIU_HDMI is wrong.

> 			};
> 		};
>
> 		dai-link-4 {
> 			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
>
> 			codec-0 {
> 				sound-dai = <&hdmi_tx>;

your HDMI controller should have an argument to the phandle if it
supported both I2S and SPDIF inputs

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

It is not meant to. The dai_link and the endpoint are i2s.
Your HDMI controller should have 2 inputs and should have a way to
select one or the other. The format at each of the (internal) input does
not change

>
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

