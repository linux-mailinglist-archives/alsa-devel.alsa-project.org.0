Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBE420393
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 21:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51822168B;
	Sun,  3 Oct 2021 21:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51822168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633288760;
	bh=EAvk3eMwiX22T5ip54e2sPnrdEACQ84w/++ygMIqczM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwd7NRAyhmFAPWLPDT2N6FPyrKKTC1zgTBj5mhnIAYvP3w0NfGBCvvEJ2BfdP9eyS
	 pdbXjXROtjJtu4m9WwFe/acjdP3pPpH7Qrz9JPnTzjCHILfcuMaDM0gx2E1/xKiLRS
	 kdjr8rlH7A1I1Q8J6LPkph0PUGldU8gIqT/ExPJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9B2F80259;
	Sun,  3 Oct 2021 21:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C1E5F8027D; Sun,  3 Oct 2021 21:18:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FEA8F80171
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 21:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEA8F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="XaEsVqDF"
Received: by mail-ed1-x534.google.com with SMTP id l7so32606760edq.3
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1AuAoJ09w7rZx0LoqvNgfkj4bYHfW7F7rrWOMcjHMc=;
 b=XaEsVqDFSTa6962TijyFZ2fyq5Z9ZALuDegRoy6NJaL62ZvH7MrEG97rCkN1c4rwFS
 X8Nm8/3Kwq2rsVN/lDXFgtSoSuKQVZ35Jplej1d0ZwYUe7WLVfK1Ay1dUu0pziOcv4LB
 VaCYEFjqL+J8InFuse2jRCxQHIIdqeFpz5oAUnp9K6ybngH+UpYFMdo5ZnxGugaJAFHV
 axKFlII72Vw+3bYl28bBu1u+6PRz4fipoqjhOr1cAFf5ntLSN4ynmgn7dpAZ5gkDJ6Gy
 LIh5othJHJ5PpJW63/mKqDCybEuAzkgPpta/0qfhgb8Wu/Xf515DJnPaxJa2GIdEy476
 Jukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1AuAoJ09w7rZx0LoqvNgfkj4bYHfW7F7rrWOMcjHMc=;
 b=H+RYP5OfioAqn7RyMgRM9Z27i5SW1SPOis1uxu8IyOYaGcetRl9HIbqS1aObzGRS8A
 W0N26vmCNKEjIIjTysrTGoQ2bwauo+yxvz4QQmYmFzWV6luw+CG1JjmLqaV38EyvC/91
 n8NQ/yU0O3i7kVB1novltV8H3GQ8TL2V1c6XlHDKuDUTN59lbnUHLrO2vp/t8bgMt/kn
 AXv2jLOsJ8KCdsQaFm33LqWd0WmONzyuri3fiPyctTzd5TPBEikm3c22mXDXCgJYkbze
 3Fe77bQ8LYi03nBK7OYwhpifmBLlkLCTu7N4jFWdbzjHO6GGOtklPVpECPQMx5SoEUfH
 18iQ==
X-Gm-Message-State: AOAM531oet5F5wunLd+iwpfRrPPur1abdes85RB6+Iu8mbAeLFSLZAYy
 Ih5rRPdPSZytusudn1assNXH9CxwJYQwczKWOWQ+5gpG7xw=
X-Google-Smtp-Source: ABdhPJxPn4IPMXuFMIIxl4e3Ysa4zn0K9LciYHf8mg3INPpCBfcDQdHxG1bp6bHR2mDopq2L8Cgvn2yvAsshbCzaORg=
X-Received: by 2002:a17:906:1405:: with SMTP id
 p5mr12382183ejc.197.1633288670478; 
 Sun, 03 Oct 2021 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 3 Oct 2021 21:17:39 +0200
Message-ID: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Hi Jerome,

first of all: thanks for taking the time to go through all of this!

On Sun, Oct 3, 2021 at 6:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Hello Jerome et al.,
> >
> > on Amlogic Meson SoCs which use the AIU audio controller we have the
> > so-called "machine gun noise" (MGN) issue, reproducible for example in
> > Kodi. So far nobody was able to identify the cause of this issue. My
> > idea was to at least narrow down the issue so we can categorize it. For
> > that I wanted to get the SPDIF output from AIU to the HDMI controller
> > working.
>
> Ok, I'll clarify (again) about this issue.
>
> This issue is on AIU only (not the AXG series), on the i2s encoder
> regardless of the output (HDMI, internal and external codec)
Thanks for repeating this. It was clear to me that only AIU is
affected but I didn't know that it only affects I2S

> This encoder support either 2ch or 8ch mode, nothing else.
> As long as only 2ch was supported, there was no problem.
> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
> aiu-encoder-i2c.c). Without this, the switch is not done.
>
> What these do, how and when it should be done is unclear. I tried
> several combination. At the time I found something stable-ish but it was
> not perfect.
old 32-bit u-boot sources from the Endless Mini do have some
documentation on AIU_I2S_SYNC [0]:
// 8'b0_000_1_1_10
// A write to this register will cause the interface to repeat the current
// sample. Can be used to regain synchronization.
// A read from this register indicates that the next sample to be sent
// out of the interface should go into the _left_ channel of the dac.

There's also a note about AIU_I2S_MISC stating:
// Bit 4 if true, force each audio data to left or right according to
the bit attached with the audio data
// This bit should be used with Register AIU_i2s_sync(0x511) together

To be honest: to me this is not helpful since I don't understand
how/why the left channel is of importance.

> At the time, It was completely new driver. Even if was not rock solid,
> it was still progress and I opted to upstream it with an imperfect 8ch
> support so people could help debug it. This was mentioned in the
> original submission.
>
> The other solution is to restrict to 2ch mode and remove
> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> anymore.
I think Christian (Hewitt) agrees on this point as he mentioned that
your earlier versions of the AIU code (before it got upstream) were
not affected by the "machine gun noise" issue.
Does the documentation from above give you any new ideas (assuming
that it's correct since it's the best we have)? Should I try playing
with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
difference?

[...]
> Here you describe a DAI link (think of it as wires) between the SPDIF
> encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
> it is not possible.
>
> Let's start from the HDMI controller.
> The designware (on amlogic SoC) has 2 interface for audio input.
> 1) PCM/I2S: a classic interface 2 clocks and N data line
> 2) SPDIF: The Sony Philips 1 wire interface
The Transwitch HDMI TX controller supports these two inputs so even
though the IP is different the basic functionality (which we'll
discuss below) is the same.

> Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
> won't fly there.
I agree with this

> AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
> implemented as an ASoC codec which allows to seleted one of 2 audio
> sources:
> A) the i2s output implemented as part of the AIU
> B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
> is not implemented ATM.
This is some interesting information, I thought that PCM was used
because PCM audio can be transmitted over SPDIF.

For A) my understanding is different though:
- for AIU_HDMI_CLK_DATA_CTRL[5:4] (HDMI_DATA_SEL) your description
matches my understanding. For me it makes sense that SPDIF data cannot
be selected with this register since it's a one-wire protocol (and
doesn't have separate data/clock lines). Value 0x2 selects the I2S
data interface
- for AIU_HDMI_CLK_DATA_CTRL[1:0] (HDMI_DATA_CLK_SEL) however I have a
different understanding: 0x0 disables the clock signal to the HDMI TX
controller, 0x1 selects the PCM clock (which now I have learned is
related to the AUDIN block) and 0x2 selects the "AIU clock" (see
below)
- my understanding is that "AIU clock" comes from AIU_CLK_CTRL_MORE[6]
(HDMITX_SEL_AOCLKX2) where 0x0 selects "cts_i958 as AIU clk to
hdmi_tx_audio_master_clk" (SPDIF clock) and 0x1 selects
"cts_aoclkx2_int as AIU clk to hdmi_tx_audio_master_clk" (I2S clock)

So to me this means that there's three different muxes:
- data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
- clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
(hdmi_tx_audio_master_clk)
- hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
and 0x1 (cts_aoclkx2_int)

Based on that I think that it's not possible to have AIU output the
I2S and SPDIF signals at the same time to the HDMI TX controller and
then letting the HDMI TX controller choose which one to use.
Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
need to configure AIU accordingly (data and clock).

[...]
> It is not meant to. The dai_link and the endpoint are i2s.
> Your HDMI controller should have 2 inputs and should have a way to
> select one or the other. The format at each of the (internal) input does
> not change
ah, that makes sense.
Let's say AIU has some internal muxing for the HDMI output then AIU
would have two outputs as well (let's call them HDMI_OUT_I2S and
HDMI_OUT_SPDIF).
Then I'd wire up each of these to their corresponding inputs on the
HDMI TX controller.


Best regards,
Martin
