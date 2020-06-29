Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2220D5A6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 21:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8CC85D;
	Mon, 29 Jun 2020 21:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8CC85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593459629;
	bh=MaMLRdKGA2R2MLXvl0tCL0oYxq7/CID2IPMt3BqbmhY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NspRMlSVc2ClD0npr1oZKwWprocfDXeGcgNG5yqdbHhM0eSCc4cvosJOJFe9VGZTI
	 n3bGp5aCORj37uQXmTGAKDrRscKTgLMqpkBYWTYUD7vxfvza7HXehCTurYAjSUFn25
	 Sv06Hz6hHZxZvNjMlrC0CnFhoaKBVZcCiYzrw5NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82D0F800BA;
	Mon, 29 Jun 2020 21:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745E3F80217; Mon, 29 Jun 2020 21:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7811FF800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 21:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7811FF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oFJae37O"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B80820672;
 Mon, 29 Jun 2020 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593459520;
 bh=MaMLRdKGA2R2MLXvl0tCL0oYxq7/CID2IPMt3BqbmhY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=oFJae37Oikbrw1fa9XojJE82yyto8cL5rTai2NSwGIglgFtrvCmTPEvvQCA3WsgIL
 OjV3YO0MAYMBmM0mjbF3vKCu06Hv6SG+GVcLWFh4LiT3ys9yeGz+cEof3I2MeXHA9m
 JzhdKmqC4ATM44tVtTUKGJdxc2xry/SHE0bdwTO8=
Date: Mon, 29 Jun 2020 20:38:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Jie Yang <yang.jie@linux.intel.com>,
 Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20200628155231.71089-2-hdegoede@redhat.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <20200628155231.71089-2-hdegoede@redhat.com>
Subject: Re: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S
 2 channel
Message-Id: <159345951863.3333.2806987177417509858.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

On Sun, 28 Jun 2020 17:52:26 +0200, Hans de Goede wrote:
> The default mode for SSP configuration is TDM 4 slot and so far we were
> using this for the bus format on cht-bsw-rt56732 boards.
> 
> One board, the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2.
> The second piggy-backed, output-only codec is inside the keyboard-dock
> (which has extra speakers). Unlike the main rt5672 codec, we cannot
> configure this codec, it is hard coded to use 2 channel 24 bit I2S.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S 2 channel
      commit: 0ceb8a36d023d4bb4ffca3474a452fb1dfaa0ef2
[2/4] ASoC: rt5670: Correct RT5670_LDO_SEL_MASK
      commit: 5cacc6f5764e94fa753b2c1f5f7f1f3f74286e82
[3/4] ASoC: rt5670: Add new gpio1_is_ext_spk_en quirk and enable it on the Lenovo Miix 2 10
      commit: 85ca6b17e2bb96b19caac3b02c003d670b66de96
[4/4] ASoC: rt5670: Fix dac- and adc- vol-tlv values being off by a factor of 10
      commit: 3f31f7d9b5404a10648abe536c8b408bfb4502e1

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
