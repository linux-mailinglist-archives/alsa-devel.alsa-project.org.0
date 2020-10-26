Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED5299B22
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:49:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94C116AD;
	Tue, 27 Oct 2020 00:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94C116AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756191;
	bh=dopJlML4Opefns/Oq2lcXDRniLu5gxNRGpoTUrNDn5A=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c64Mhxv3FvmLqGubIhrtaT3x9VVuE6ozrjT8/QlNkkJBqhPitVtP8HFAYqLOQqBhj
	 IUQvb2Cwm1+Sbk3KrQO1i/VKWQ4vCDo1jfJHsSqewu51Xl0uvKF1GbrJYV94+zg/V/
	 694DjAvIA+LTmaT1xKbbSZ4bGpiA/yDO8cvR9Ilc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED4EF804FA;
	Tue, 27 Oct 2020 00:46:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3D2F804F3; Tue, 27 Oct 2020 00:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E0F6F804F1
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E0F6F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AQX+2PyK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4662E20878;
 Mon, 26 Oct 2020 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755966;
 bh=dopJlML4Opefns/Oq2lcXDRniLu5gxNRGpoTUrNDn5A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AQX+2PyK2dIPN49wkNKL1bwXysqkdun6QOU05xs4v4NDH3cNnZDtrBbTwey1S1/Uk
 FzYvCaXPBIXg0TGUF1MrEzBZEDgaSVfKczx+9Jqahan0aPJqTF+r10Ah70SX4h+m+w
 DwWrpkMfnEgIR7UzFPQGnRfO0Rco2u62TCZbPD9o=
Date: Mon, 26 Oct 2020 23:46:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20201014061941.4306-1-samuel@sholland.org>
References: <20201014061941.4306-1-samuel@sholland.org>
Subject: Re: [PATCH v2 00/17] ASoC: sun8i-codec: support for AIF2 and AIF3
Message-Id: <160375592347.31132.11114945511510000375.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 14 Oct 2020 01:19:24 -0500, Samuel Holland wrote:
> This series adds support the other two AIFs present in the sun8i codec,
> which can be used for codec2codec DAI links.
> 
> This series first fills out the DAI driver, removing assumptions that
> were made for AIF1 (16 bits, 2 channels, certain clock inversions). Some
> new logic is required to handle 3 DAIs and the ADC/DAC sharing the same
> clock. Finally, it adds the new DAIs, and hooks them up with DAPM
> widgets and routes per the hardware topology.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: sun8i-codec: Prepare to extend the DAI driver
        commit: 7826b8d15ec2cea1c1b8680ada1eb965d0660aa6
[02/17] ASoC: sun8i-codec: Program DAI format before clock inversion
        commit: fd57ed2de5b1a5e153abf2f8c02fc3c1bf40de3b
[03/17] ASoC: sun8i-codec: Enable all supported clock inversions
        commit: c56f5f1c0b23ac0cdcf8c73bf6f7363ef0cdfbc0
[04/17] ASoC: sun8i-codec: Use the provided word size
        commit: 1abb43aeadfb513c0a16013cd445fb7dd3b285bb
[05/17] ASoC: sun8i-codec: Round up the LRCK divisor
        commit: e511aed79632e8a2dd03068f8bd11b64cb0d7170
[06/17] ASoC: sun8i-codec: Correct the BCLK divisor calculation
        commit: 68a4f2caaa17ce62890c51ef957dd008c2e42aae
[07/17] ASoC: sun8i-codec: Support the TDM slot binding
        commit: afb1a6006299a8b6b5ad04363fd74aa66a6ac79b
[08/17] ASoC: sun8i-codec: Enforce symmetric DAI parameters
        commit: e557148ac220b43bc6cbc06333f56b1c61e90825
[09/17] ASoC: sun8i-codec: Enable all supported sample rates
        commit: c2b751d769669467da1247c9c6c536a494c9c96e
[10/17] ASoC: sun8i-codec: Automatically set the system sample rate
        commit: 6c5326bebd4041a21c77b2b96461a97b7f4e39ee
[11/17] ASoC: sun8i-codec: Constrain to compatible sample rates
        commit: 15b45912341e884a16322792525db7a2b2b9a1f9
[12/17] ASoC: sun8i-codec: Protect the clock rate while streams are open
        commit: 3952ec2ac55a5afcda84270fa203f17a6309af6b
[13/17] ASoC: sun8i-codec: Require an exact BCLK divisor match
        commit: 2464dccab7fef040bd6e85cd78ac33e2731925da
[14/17] ASoC: sun8i-codec: Enable all supported PCM formats
        commit: 342cacb92d627a7cc8df1b5fe3e404530164ea17
[15/17] ASoC: sun8i-codec: Generalize AIF clock control
        commit: 7a6b937ec4e256b028be9b4e244d40287282c825
[16/17] ASoC: sun8i-codec: Add the AIF2 DAI, widgets, and routes
        commit: 50ec8422acd2cdadf5599cc046a5448770542aa7
[17/17] ASoC: sun8i-codec: Add the AIF3 DAI, widgets, and routes
        commit: 5a7f34ab0232bc50d39ac0627a470425227fed7d

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
