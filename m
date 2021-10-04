Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63586421922
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA84E1669;
	Mon,  4 Oct 2021 23:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA84E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633382345;
	bh=SeGuSCzZ1gSpRV4fDe/vWhR6GuzOSGjXIlDV5TI1Gag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBWQOY1Xh4G+CFrH6WRsbNjFVjCsY5TG0ftT+LJMSrPSPPZcIT9S7JFaOGAM583kT
	 rJZw5cu99APDM4uOYOdKVJ1p8FISfq3gWH+JythYkIJ1sOs69tNv6QboTfJb3zEl+/
	 RnkoAsoJiNZWdelAe7GtrxKUNTKMVzq93J2OaLAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684CEF800BA;
	Mon,  4 Oct 2021 23:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32317F80240; Mon,  4 Oct 2021 23:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A77CF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A77CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="aeY1Mie9"
Received: by mail-ed1-x52b.google.com with SMTP id f9so7613539edx.4
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 14:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfIbcNy8uRUeT/alGgQC1RAZh4dTZXYv6GLv/0r2a/Y=;
 b=aeY1Mie9I7CmWT72Q2XqRVY2H9Gs5T3E+Qdzz6OUZPf4u5gcrbmnxOe2WqoYU7XGyT
 vTUdzCwGyi1aZroFKjb9fZz4tM0DuYLHAxtv2sqiRdcQVckSsoOPLJ2QVM5Jx5XgLE1u
 lBqT+c9dPmSo58yOKKOxsqF36oDTxj9MoJXEJffUucT5ZRyHm6+Zf+tcsf93J0q1oSog
 R9RMZncqqc5vXMdC/GfVPm7JB5c1B4E1Bj2s/oUJaFzPmjkw99HHEfSKBUUZRLUIw84t
 LUcWc5CtcxQTHHO1tXA+R3aI1Vk2NJGR4PeMCigBh+sS+WNAWUmuUxOC5lIC2qxgsC1K
 LhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfIbcNy8uRUeT/alGgQC1RAZh4dTZXYv6GLv/0r2a/Y=;
 b=PUJ74O9579ysvd84ELZZNs2OZRDQzF10PFe55GQKo+UHKKeUepENfSZp8F9FtTuerI
 jCQ9Jw7AiYZDaCrvLyw2djIUyQBn0pn0v0VY3DA/sM6m2zdqmKyIzoW4IJWqteWRkZjl
 kOcRuiX3vSu8hum1SMK/R6k/GwbCY3DudDYt2ufrfazjLaSTmb2NC8HEOqGouR67tYwi
 Qb6WAoyv2UI5GC9rCt5YZ8ttQjaYFFZIiuv5JoZ6KoSR1QP8Bc0rNV7zzZnS6WuSyZFk
 OUP7HiAZGLmVvllmeNy9fmeMotrXHM09072nBGDC8HMuM506Xb2dr3lKgdz2lw7l0OPn
 cvnw==
X-Gm-Message-State: AOAM531WQVjWfmLJ5PI9qtyjhX3C5tulGe8yICqVElu2NJbOmSdJfxQh
 feRkoB2s3VK/Lju44YauJAGSR+OL+SL//13Ebf8=
X-Google-Smtp-Source: ABdhPJy4g68s5xZSNqK01V2f9gaZCfuyvWoUsyjuXX0Nfu/46CALquUFp4do1rs3uFQnOhg1MWmzAZtxT8A61rjJ9DA=
X-Received: by 2002:a05:6402:d52:: with SMTP id
 ec18mr6632042edb.67.1633382255772; 
 Mon, 04 Oct 2021 14:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
 <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Oct 2021 23:17:24 +0200
Message-ID: <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
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

On Mon, Oct 4, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > old 32-bit u-boot sources from the Endless Mini do have some
> > documentation on AIU_I2S_SYNC [0]:
> > // 8'b0_000_1_1_10
> > // A write to this register will cause the interface to repeat the current
> > // sample. Can be used to regain synchronization.
> > // A read from this register indicates that the next sample to be sent
> > // out of the interface should go into the _left_ channel of the dac.
> >
> > There's also a note about AIU_I2S_MISC stating:
> > // Bit 4 if true, force each audio data to left or right according to
> > the bit attached with the audio data
> > // This bit should be used with Register AIU_i2s_sync(0x511) together
> >
> > To be honest: to me this is not helpful since I don't understand
> > how/why the left channel is of importance.
>
> Same here, I already had this description and it is not really that helpful.
OK, so I guess this leaves experimenting (which requires luck)... :-(

[...]
> This bit could also be a remain of an older design, not really connected
> to anything meaningful. It would not be the first time.
>
> The AIU looks like an IP that has evolved a lot over the years, not always
> in a coordinated fashion. Some scenario are well supported and easy,
> others seem to require a magic spell.
>
> Last (but not least), in AML vendor kernel, the only time this bit poked
> is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.
The 32-bit SoCs use SPDIF to feed 2-channel audio to the HDMI TX
controller and I2S to feed 8-channel audio to the HDMI TX controller.
It seems that Amlogic stopped this for (at least some) 64-bit SoCs.

My testing results indicate that AIU_CLK_CTRL_MORE[6] is still relevant.
I can do another round of testing with various combinations of
AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL register values.
If you want me to test any specific combinations then please let me know.

> > So to me this means that there's three different muxes:
> > - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> > - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> > (hdmi_tx_audio_master_clk)
> > - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> > and 0x1 (cts_aoclkx2_int)
> >
> > Based on that I think that it's not possible to have AIU output the
> > I2S and SPDIF signals at the same time to the HDMI TX controller and
> > then letting the HDMI TX controller choose which one to use.
>
> i2s and spdif can be 2 independent paths (with different clock sources).
> I have already made them work concurrently. I believe (but have no
> proof) that the same should be possible with the HDMI.
>
> Until the hdmi controller has support for both inputs, we don't need to
> worry about it.
My work-in-progress HDMI TX controller driver for the 32-bit SoCs [0]
does support both (I2S and SPDIF) inputs. That's how I am able to test
all of this.
I wasn't aware of the fact that it's known that the "machine gun
noise" (MGN) issue is related to I2S only. Since I couldn't find a
workaround or fix for the MGN issue I wanted to narrow it down by
adding SPDIF support to the HDMI TX path.

> > Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> > need to configure AIU accordingly (data and clock).
>
> TBH, I'm not really sure what this bit does. From the description, it
> seems it allows to select an HDMI clock (not idea which one actually)
> for either the i2s or the spdif path.
>
> Nothing says it is related to the HDMI_CTRL (codec), maybe it is not.
> Maybe (MAYBE) it defines what will become "the AIU clk" in
> AIU_HDMI_CLK_DATA_CTRL[1:0].
This is what I am thinking

> Until we can feed the i2s encoder from the spdif FIFO, I'm not sure we
> need to play with it.
I think it's also relevant when we feed HDMI TX from the SPDIF (FIFO +
encoder) which is what I am attempting here.

[...]
> >> It is not meant to. The dai_link and the endpoint are i2s.
> >> Your HDMI controller should have 2 inputs and should have a way to
> >> select one or the other. The format at each of the (internal) input does
> >> not change
> > ah, that makes sense.
> > Let's say AIU has some internal muxing for the HDMI output then AIU
> > would have two outputs as well (let's call them HDMI_OUT_I2S and
> > HDMI_OUT_SPDIF).
>
> I don't think there is another output the HDMI_CTRL mux block. If SPDIF to
> HDMITX is supported, I suspect the output of the spdif encoder is
> hardwired to the spdif input of the HDMI controller and it is up to the
> HDMI controller to take it or not.
I think you are correct with this.
My theory is that AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL will
enable one of the outputs (I2S or SPIDF) from AIU to the HDMI TX
controller, meaning that only one signal can be active at a time. The
HDMI TX controller then needs to "select" the correct input based on
the selected output from AIU.

> That being said, I don't see any hard evidence that AML used SPDIF to
> HDMI in their tree, so maybe it does not work at all.
For the 32-bit SoCs the easiest to understand code-snippet is the HDMI
TX audio input configuration [1]
Which basically translates to:
  if (more_than_two_channel_audio) {
    enable_audio_i2s();
  } else {
    enable_audio_spdif();
  }

The code in the AIU driver just assumes that whatever it's configuring
is what the HDMI TX driver expects - without a clear link between
these two.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-mx-integration-5.15-20211003/drivers/gpu/drm/bridge/transwitch/txccq-txc-48352.c
[1] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/hdmi_tx_hw/hdmi_tx_hw.c#L3035:L3038
