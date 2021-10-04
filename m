Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65B4207C3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 11:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93695168F;
	Mon,  4 Oct 2021 11:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93695168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633338220;
	bh=nMZvEOl+DRXQRv9Iq74Kk4mgrw3cN9Jn7BhrYKszeUk=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwetfoHKKooKWOwOOozkA/YT1I3nGQpjFeZv6naGb1DeDZbvGYK9WbKTXpthnb0/u
	 W36CTQ2tafG7RDXr3bYIem2xeOmnpO0u0ZIXYGYB3Ez0leA7iidso6KeqtKlys9hSC
	 /FZ5ZlicjJenfG2SHHGt9r8b1vERrmjHtNR2l1pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3B6F80249;
	Mon,  4 Oct 2021 11:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56252F80240; Mon,  4 Oct 2021 11:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE93BF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 11:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE93BF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="AdHFSQBZ"
Received: by mail-wm1-x334.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3001352wme.1
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=AeVtfBx2w6aMRfHG6/qXgXtUvbfQ5tnGA7rVFbgp2pg=;
 b=AdHFSQBZy0q83Lfm963N9pUBhL3yXoUSgwGynh1/u/KIgzk9cfzsYT0Y5ERcG8H5PF
 VgU5YzWIMMcoXsMM08o9HXTr92l3+0p6+ZNH+rpYre41tJIHNqb1ERSh/loL1yC0UF5C
 Qqx/x5+bTQmT9U5gzQ4kezbRa6gR2bCymqWcgHSaXQGLN3rBy2DFpn/1V5SwNpsAaF+/
 eD/lIv12ZWYMF60s0Dul5/ZDS4cBoGRfGOHZLhPpFfA4PWa6OBc3Fgp4NxPI3ecVrfaO
 dJpM1psFRH38BFh45zSWggVhZURuMptJja+KwHoExvenNDneeZ2ZkQDE8R4XSphg4fDA
 d74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=AeVtfBx2w6aMRfHG6/qXgXtUvbfQ5tnGA7rVFbgp2pg=;
 b=geF4eoOzezg0rMCdHGY8PHdBBspAKAxNVEQnp8yk8CdxWSHIkdrL4Kpmf1WIbWn9Zc
 TnWHoJzOuNj4kIuCvN2mdiwJbYJqrqEletDEuY3HxO3MyeBBPYNBLn/VKwBllPTGCo0E
 Z5fi2HGig/nYnIzl48nuT5+05X9A2YgV0+slz0IutcrHyGwWugrUsN+lp2tQxfNZDBvQ
 OHWFFdh6ewa4T4azXJxv/lBpzbheA/Wb9o6Ps+olxlWmXcpcPFzVosHwqFAz0gBuN7us
 G+5vYK1uA8c6z/7HPawgU/uTiuq1+NdzxYvbQfA35miwVT28Jd+zNS+1g+9NByyVUd9n
 9MsQ==
X-Gm-Message-State: AOAM532JvL8PTKfR/GTQE+FBclnstqJmSb5DT0pnpZMCEzR0pL6gBZUC
 x9Fy1ougXWfqyLzR4E6MSTzwtQ==
X-Google-Smtp-Source: ABdhPJxUorTdwWsM/PU8j/kBYNCGixxqE+ZxZbtlEjlJI8+iw5IA9+4htzWYsfBsBjK+PmAP54nesw==
X-Received: by 2002:a1c:984e:: with SMTP id a75mr17281749wme.63.1633338135781; 
 Mon, 04 Oct 2021 02:02:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z17sm13641838wml.24.2021.10.04.02.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:02:15 -0700 (PDT)
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Date: Mon, 04 Oct 2021 10:13:19 +0200
In-reply-to: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
Message-ID: <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Sun 03 Oct 2021 at 21:17, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> first of all: thanks for taking the time to go through all of this!
>
> On Sun, Oct 3, 2021 at 6:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > Hello Jerome et al.,
>> >
>> > on Amlogic Meson SoCs which use the AIU audio controller we have the
>> > so-called "machine gun noise" (MGN) issue, reproducible for example in
>> > Kodi. So far nobody was able to identify the cause of this issue. My
>> > idea was to at least narrow down the issue so we can categorize it. For
>> > that I wanted to get the SPDIF output from AIU to the HDMI controller
>> > working.
>>
>> Ok, I'll clarify (again) about this issue.
>>
>> This issue is on AIU only (not the AXG series), on the i2s encoder
>> regardless of the output (HDMI, internal and external codec)
> Thanks for repeating this. It was clear to me that only AIU is
> affected but I didn't know that it only affects I2S
>
>> This encoder support either 2ch or 8ch mode, nothing else.
>> As long as only 2ch was supported, there was no problem.
>> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
>> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
>> aiu-encoder-i2c.c). Without this, the switch is not done.
>>
>> What these do, how and when it should be done is unclear. I tried
>> several combination. At the time I found something stable-ish but it was
>> not perfect.
> old 32-bit u-boot sources from the Endless Mini do have some
> documentation on AIU_I2S_SYNC [0]:
> // 8'b0_000_1_1_10
> // A write to this register will cause the interface to repeat the current
> // sample. Can be used to regain synchronization.
> // A read from this register indicates that the next sample to be sent
> // out of the interface should go into the _left_ channel of the dac.
>
> There's also a note about AIU_I2S_MISC stating:
> // Bit 4 if true, force each audio data to left or right according to
> the bit attached with the audio data
> // This bit should be used with Register AIU_i2s_sync(0x511) together
>
> To be honest: to me this is not helpful since I don't understand
> how/why the left channel is of importance.

Same here, I already had this description and it is not really that helpful.

>
>> At the time, It was completely new driver. Even if was not rock solid,
>> it was still progress and I opted to upstream it with an imperfect 8ch
>> support so people could help debug it. This was mentioned in the
>> original submission.
>>
>> The other solution is to restrict to 2ch mode and remove
>> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
>> anymore.
> I think Christian (Hewitt) agrees on this point as he mentioned that
> your earlier versions of the AIU code (before it got upstream) were
> not affected by the "machine gun noise" issue.
> Does the documentation from above give you any new ideas (assuming
> that it's correct since it's the best we have)? Should I try playing
> with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
> difference?

Nothing new here.
I suspect that the encoder restart out of sync with the FIFO, picking
mis-aligned samples but I have not confirmed that yet.

>
> [...]
>> Here you describe a DAI link (think of it as wires) between the SPDIF
>> encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
>> it is not possible.
>>
>> Let's start from the HDMI controller.
>> The designware (on amlogic SoC) has 2 interface for audio input.
>> 1) PCM/I2S: a classic interface 2 clocks and N data line
>> 2) SPDIF: The Sony Philips 1 wire interface
> The Transwitch HDMI TX controller supports these two inputs so even
> though the IP is different the basic functionality (which we'll
> discuss below) is the same.
>
>> Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
>> won't fly there.
> I agree with this
>
>> AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
>> implemented as an ASoC codec which allows to seleted one of 2 audio
>> sources:
>> A) the i2s output implemented as part of the AIU
>> B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
>> is not implemented ATM.
> This is some interesting information, I thought that PCM was used
> because PCM audio can be transmitted over SPDIF.
>
> For A) my understanding is different though:
> - for AIU_HDMI_CLK_DATA_CTRL[5:4] (HDMI_DATA_SEL) your description
> matches my understanding. For me it makes sense that SPDIF data cannot
> be selected with this register since it's a one-wire protocol (and
> doesn't have separate data/clock lines). Value 0x2 selects the I2S
> data interface
> - for AIU_HDMI_CLK_DATA_CTRL[1:0] (HDMI_DATA_CLK_SEL) however I have a
> different understanding: 0x0 disables the clock signal to the HDMI TX
> controller, 0x1 selects the PCM clock (which now I have learned is
> related to the AUDIN block) and 0x2 selects the "AIU clock" (see
> below)
> - my understanding is that "AIU clock" comes from AIU_CLK_CTRL_MORE[6]
> (HDMITX_SEL_AOCLKX2) where 0x0 selects "cts_i958 as AIU clk to
> hdmi_tx_audio_master_clk" (SPDIF clock) and 0x1 selects
> "cts_aoclkx2_int as AIU clk to hdmi_tx_audio_master_clk" (I2S clock)

Not quite sure it works that way.
Each FIFO (i2s and spdif) is mainly target at the related encoder BUT
there is way to feed to both encoder from a single FIFO. In such case,
the proper must selected for the encoder and the downstream element to
keep things in sync

This at least with i2s FIFO feeding both the i2s and spdif encoders.
I suspect the same is possible with the spdif FIFO. Maybe the bit is
needed to also switch HDMI part to the spdif clock in this case.

This bit could also be a remain of an older design, not really connected
to anything meaningful. It would not be the first time.

The AIU looks like an IP that has evolved a lot over the years, not always
in a coordinated fashion. Some scenario are well supported and easy,
others seem to require a magic spell.

Last (but not least), in AML vendor kernel, the only time this bit poked
is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.

>
> So to me this means that there's three different muxes:
> - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> (hdmi_tx_audio_master_clk)
> - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> and 0x1 (cts_aoclkx2_int)
>
> Based on that I think that it's not possible to have AIU output the
> I2S and SPDIF signals at the same time to the HDMI TX controller and
> then letting the HDMI TX controller choose which one to use.

i2s and spdif can be 2 independent paths (with different clock sources).
I have already made them work concurrently. I believe (but have no
proof) that the same should be possible with the HDMI.

Until the hdmi controller has support for both inputs, we don't need to
worry about it.

> Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> need to configure AIU accordingly (data and clock).

TBH, I'm not really sure what this bit does. From the description, it
seems it allows to select an HDMI clock (not idea which one actually)
for either the i2s or the spdif path.

Nothing says it is related to the HDMI_CTRL (codec), maybe it is not.
Maybe (MAYBE) it defines what will become "the AIU clk" in
AIU_HDMI_CLK_DATA_CTRL[1:0]. Until we can feed the i2s encoder from the
spdif FIFO, I'm not sure we need to play with it.

>
> [...]
>> It is not meant to. The dai_link and the endpoint are i2s.
>> Your HDMI controller should have 2 inputs and should have a way to
>> select one or the other. The format at each of the (internal) input does
>> not change
> ah, that makes sense.
> Let's say AIU has some internal muxing for the HDMI output then AIU
> would have two outputs as well (let's call them HDMI_OUT_I2S and
> HDMI_OUT_SPDIF).

I don't think there is another output the HDMI_CTRL mux block. If SPDIF to
HDMITX is supported, I suspect the output of the spdif encoder is
hardwired to the spdif input of the HDMI controller and it is up to the
HDMI controller to take it or not.

That being said, I don't see any hard evidence that AML used SPDIF to
HDMI in their tree, so maybe it does not work at all. 

> Then I'd wire up each of these to their corresponding inputs on the
> HDMI TX controller.
>
>
> Best regards,
> Martin

