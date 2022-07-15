Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7EC576722
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 21:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E7A193A;
	Fri, 15 Jul 2022 21:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E7A193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657912124;
	bh=LtC4p3x6swZs2KcMR/gJDT54/MAi5vQrQS1nERWxkkc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDJ/qItc4hQsdU0Mz6KxBrYESvv/B12NL6X0lQu2Ye3IQH44bA3bbaMS/axZC3sKi
	 VOBr425nNPqEDGv0iat+dta6bqTTtxe6jcpwbSZlVhIJUlVUW5WswZfhjYexEgw3RW
	 6/2hW2GPDJ0ZloGPTZ8ncy5B6Og+2OdwiwdTw/ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67CE3F8014E;
	Fri, 15 Jul 2022 21:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D0DF8015B; Fri, 15 Jul 2022 21:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36D58F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 21:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D58F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n2vf+1g9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D75162356;
 Fri, 15 Jul 2022 19:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB1CC34115;
 Fri, 15 Jul 2022 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657912055;
 bh=LtC4p3x6swZs2KcMR/gJDT54/MAi5vQrQS1nERWxkkc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n2vf+1g9AS3e033E1kjrbaymimmBJJRpNCS8LaH7Utn8n2D6rxomVdlUBray/kVBd
 X2AoWkK3msCSY5p7WV8m506D7BvTE9mNWTKpItQhr6ST1mVZqhfeXcDrOeaKl+SpFI
 xFdDDMUx0jgNBUx0Vz3RYkUaTeC6cxNk6w+orIE1rB0trUdF7XeKoUzd4OKBjSSxv2
 z6KjVFId9rS0Div9t2iT+s7h7v0f6AlfGSRwTExfuJeBO32YgQYtFAuaivBHbebams
 gXNpMOOBL/9S1oY4Idfi8ows5jWoh1hZ6J86F4okNMzVbYx/tWcq+UavDS7Q4BpNn4
 Jl0SbShre3s3w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
References: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: add support for SoundWire-based HP
 Omen16
Message-Id: <165791205442.4033737.8531342431514779689.b4-ty@kernel.org>
Date: Fri, 15 Jul 2022 20:07:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
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

On Fri, 15 Jul 2022 09:41:40 -0500, Pierre-Louis Bossart wrote:
> This device exposes a headset codec on link0 and an amplifier on
> link3. This is a very unusual pin-muxing, usually the microphones are
> pin-muxed with link2/link3. This resulted in a problematic error
> handling leading to a kernel oops, and invalidated a hard-coded
> assumption.
> 
> Full support for this device requires a DMI quirk shared separately
> ("soundwire: dmi-quirks: add remapping for HP Omen 16-k0005TX").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: avoid oops in error handling
      commit: 8116483407076b81af0efb14f6d69aefaecbf3d8
[2/4] ASoC: Intel: soc-acpi: add table for HP Omen 16-k0005TX
      commit: 8d38cc2997c55a877dac2672a92f221fe59e4c9e
[3/4] ASoC: Intel: sof_sdw: add quirk for HP Omen 16-k0005TX
      commit: f7bbdf5bcc6ec66efa010aed77eaf5a90faf6ba5
[4/4] ASoC: SOF: Intel: enable dmic handling with 2 or fewer SoundWire links
      commit: ba4c6a1a8f1b3a178a67fd3ceffa876971a5789f

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
