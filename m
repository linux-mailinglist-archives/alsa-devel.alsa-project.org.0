Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2B420ADC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 14:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C8C168D;
	Mon,  4 Oct 2021 14:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C8C168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633350302;
	bh=ej7aJ0FW65oKsNtQjiH6FThlyKBsKax9Z2ffsEWdqTo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb+olz8wlma/IyOtjVZDkQW6I0Ru4CaBq9qviAh3SVst0TLf5nyeUmkGIJ332zYIg
	 wcZmrawxAcOY+81wXwuN5ygd206coy4VM+ZtJ8sZ1jwwaKKwiI6ZVkzatK0UHZOrpu
	 wDuOVzGRC8Qcz3kcCvoCDaUInCSu0QfWTnTXKyYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B3DF80249;
	Mon,  4 Oct 2021 14:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA157F80240; Mon,  4 Oct 2021 14:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C1BDF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1BDF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z8To3342"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89A736124C;
 Mon,  4 Oct 2021 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633350211;
 bh=ej7aJ0FW65oKsNtQjiH6FThlyKBsKax9Z2ffsEWdqTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8To3342g6UJ4vhD+OEmlMItibW536UAqAdbB+SVo6NVWWujgoLiFCBu3+FhKRHrq
 E2vD0eLdJXx+jZgCn9e+gmN+3aTBM7jUb8N/iUZH52RqRZfCFPp6r+uSOKC5+VTbVO
 h26tTuiC6+iTaaAfa0LyDzG90xPS/Ic88ckVvr4uxZz+sV06mwDvW5bb8MRfw1pTIH
 1kxRoZluNAVqZ5XIi2Bp4LGXjNgavrWtuvv6IigN6UgKStxSoqy6ifWvGNkyIGA+El
 7GDGK6r3NyAq5yX8EjpqzPAp8CkFEM0hercTJK15B81dfXmr6dzgVTcMCmB0jyn6oM
 Yrdceo7T4tL6g==
Date: Mon, 4 Oct 2021 13:23:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVryQb3myHBVcIAx@sirena.org.uk>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/+Vq12Du1ArhJUSc"
Content-Disposition: inline
In-Reply-To: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
X-Cookie: If it heals good, say it.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
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


--/+Vq12Du1ArhJUSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 09:17:39PM +0200, Martin Blumenstingl wrote:

> old 32-bit u-boot sources from the Endless Mini do have some
> documentation on AIU_I2S_SYNC [0]:
> // 8'b0_000_1_1_10
> // A write to this register will cause the interface to repeat the current
> // sample. Can be used to regain synchronization.
> // A read from this register indicates that the next sample to be sent
> // out of the interface should go into the _left_ channel of the dac.

> There's also a note about AIU_I2S_MISC stating:
> // Bit 4 if true, force each audio data to left or right according to
> the bit attached with the audio data
> // This bit should be used with Register AIU_i2s_sync(0x511) together

> To be honest: to me this is not helpful since I don't understand
> how/why the left channel is of importance.

The left channel is important because for most (I think all?) audio
formats the first channel sent after each frame sync is the left
channel, if you're trying to resync it's useful to know when a left
frame is going to be sent.

>=20
> > At the time, It was completely new driver. Even if was not rock solid,
> > it was still progress and I opted to upstream it with an imperfect 8ch
> > support so people could help debug it. This was mentioned in the
> > original submission.
> >
> > The other solution is to restrict to 2ch mode and remove
> > AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> > anymore.
> I think Christian (Hewitt) agrees on this point as he mentioned that
> your earlier versions of the AIU code (before it got upstream) were
> not affected by the "machine gun noise" issue.
> Does the documentation from above give you any new ideas (assuming
> that it's correct since it's the best we have)? Should I try playing
> with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
> difference?
>=20
> [...]
> > Here you describe a DAI link (think of it as wires) between the SPDIF
> > encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
> > it is not possible.
> >
> > Let's start from the HDMI controller.
> > The designware (on amlogic SoC) has 2 interface for audio input.
> > 1) PCM/I2S: a classic interface 2 clocks and N data line
> > 2) SPDIF: The Sony Philips 1 wire interface
> The Transwitch HDMI TX controller supports these two inputs so even
> though the IP is different the basic functionality (which we'll
> discuss below) is the same.
>=20
> > Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
> > won't fly there.
> I agree with this
>=20
> > AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
> > implemented as an ASoC codec which allows to seleted one of 2 audio
> > sources:
> > A) the i2s output implemented as part of the AIU
> > B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
> > is not implemented ATM.
> This is some interesting information, I thought that PCM was used
> because PCM audio can be transmitted over SPDIF.
>=20
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
>=20
> So to me this means that there's three different muxes:
> - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> (hdmi_tx_audio_master_clk)
> - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> and 0x1 (cts_aoclkx2_int)
>=20
> Based on that I think that it's not possible to have AIU output the
> I2S and SPDIF signals at the same time to the HDMI TX controller and
> then letting the HDMI TX controller choose which one to use.
> Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> need to configure AIU accordingly (data and clock).
>=20
> [...]
> > It is not meant to. The dai_link and the endpoint are i2s.
> > Your HDMI controller should have 2 inputs and should have a way to
> > select one or the other. The format at each of the (internal) input does
> > not change
> ah, that makes sense.
> Let's say AIU has some internal muxing for the HDMI output then AIU
> would have two outputs as well (let's call them HDMI_OUT_I2S and
> HDMI_OUT_SPDIF).
> Then I'd wire up each of these to their corresponding inputs on the
> HDMI TX controller.
>=20
>=20
> Best regards,
> Martin

--/+Vq12Du1ArhJUSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa8kAACgkQJNaLcl1U
h9BMJwf/d07nv9RvNZHG5kWNU/JXFm14eDZ04SF4RdZ8I320a4C5dlJmNPw/jxwL
XXW9FK3/+o/D7tqAdZhXu+Jo1gng9/SzqhyEntA4mXZSit/QhFkbAtAFCHZe0fPa
X3/0ed3NpFqQ/kxXXrOKqT58xgd9YmzayJsOmphoqyg5CuwfjXQscOXEDpmmIqAV
Sa2lMR72R8hQM6LawLuRCctfrGzz27DHwmQU+y0le8rTzwtVY8irYYVRkK+w8R2a
grsSNGqLupzt5trqsX2vnfD4zaPkAiLlTVFrItxUSVKd/bGu4ibJDUb4l0Qlmwnu
uAkefotjbjTiYRhE46CruMibys76yQ==
=X6z2
-----END PGP SIGNATURE-----

--/+Vq12Du1ArhJUSc--
