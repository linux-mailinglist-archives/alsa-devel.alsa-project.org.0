Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D312A0ED3
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 20:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1932165D;
	Fri, 30 Oct 2020 20:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1932165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604086991;
	bh=m45ipR/HmP1V+JqRsQpVB6hoiMdqmCrFJjUlTpQPyHE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPc9JpuumBJy8bQJ5GAqny2SGWKN+fHeOrQVSmnEnpXzMmGpMMkdHuo5S2ncfp+At
	 Ad1LwBmibuZw7yYY+kChVSTMtDl+KZ/jfdHmqJdIqg+CBj/m6WE9Bc4pYlCPvMjr16
	 wH2Wa7VI/yAONEEw240HSgIRy7ZOSHhZgFhbrBtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A4BCF8025E;
	Fri, 30 Oct 2020 20:41:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59FB0F80212; Fri, 30 Oct 2020 20:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30B77F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 20:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30B77F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hag1K9WL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59B7C206CB;
 Fri, 30 Oct 2020 19:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604086888;
 bh=m45ipR/HmP1V+JqRsQpVB6hoiMdqmCrFJjUlTpQPyHE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Hag1K9WLgmAje8K7pzvo/iqTCE3IQ7EC3cmtvsZMLGd5mGeAjnRCO76FO55iZFh+C
 gzM/bQzUBYauKL+GIkRPE4qT4HlNMTp7LWEdghfpWNCALZMFfBiZ6KRePtHMvbZz+b
 ynwPrUegOK+0Io+I/TdIxPlyOAbhuPK4QUGLiUFk=
Date: Fri, 30 Oct 2020 19:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>, Clément Péron <peron.clem@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
Subject: Re: [PATCH v10 00/15] Add Allwinner H3/H5/H6/A64 HDMI audio
Message-Id: <160408688151.11950.1284919768798155829.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 30 Oct 2020 15:46:33 +0100, Clément Péron wrote:
> This series add H6 I2S support and the I2S node missing to support
> HDMI audio in different Allwinner SoC.
> 
> As we first use some TDM property to make the I2S working with the
> simple soundcard. We have now drop this simple sound card and a
> proper dedicated soundcard will be introduce later.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mode
        commit: 93c0210671d8f3ec2262da703fab93a1497158a8
[02/11] ASoC: sun4i-i2s: Change set_chan_cfg() params
        commit: c779e2de0ac6156bea63e759481ee383587336cc
[03/11] ASoC: sun4i-i2s: Add support for H6 I2S
        commit: 73adf87b7a5882408b0a17da59e69df4be12a968
[04/11] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
        commit: 9c2d255f0e63f8e54bd8345f9c59c4060cf4bbd4
[05/11] ASoC: sun4i-i2s: Set sign extend sample
        commit: d8659dd9a13ce7a92c017c352aea1c390f300937
[06/11] ASoC: sun4i-i2s: Add 20 and 24 bit support
        commit: 6ad7ca6297f8679162ee62ed672b603e8d004146
[07/11] ASoC: sun4i-i2s: Fix sun8i volatile regs
        commit: 64359246abe4421ad409be5b0bc9a534caa18b7d
[08/11] ASoC: sun4i-i2s: Fix setting of FIFO modes
        commit: 38d7adc0a003298013786cfffe5f4cc907009d30
[09/11] ASoC: sun4i-i2s: fix coding-style for callback definition
        commit: 08c7b7d546fddce76d500e5e5767aa08836f7cae
[10/11] ASoC: sun4i-i2s: Add H6 compatible
        commit: e84f44ba4604e55a51e7caf01464f220d0eabef4
[11/11] ASoC: sun4i-i2s: Document H3 with missing RX channel possibility
        commit: 0bc1bf241de551842535c3d0b080e0f38c11aed1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
