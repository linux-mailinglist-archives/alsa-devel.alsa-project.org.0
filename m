Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6963912C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 22:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AD0A1720;
	Fri, 25 Nov 2022 22:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AD0A1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669412467;
	bh=60OYuwERXmeJ082oTHm4vNOnTl4qAPQKBRpMhBKDRrg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rl825r+1SMvu1jNoA67f5JFgqYL3qtsGJzOzuqasO+qObSqNeHGBWdjYu2RRkRfJg
	 o/Hj9RfxV+UXeIFoQeOA3s1DlUmzUHgZ+urxhS7mAM0ii3vVpQtZZx5qNl1RqNwAoF
	 R/GvBjATtw2lxcPUgK+IAmYYnroVrBO0LHzK7jFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA512F8047C;
	Fri, 25 Nov 2022 22:40:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A10EAF80236; Fri, 25 Nov 2022 22:40:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0D6F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 22:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0D6F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nGITamug"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3107060ECF;
 Fri, 25 Nov 2022 21:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43494C433C1;
 Fri, 25 Nov 2022 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669412404;
 bh=60OYuwERXmeJ082oTHm4vNOnTl4qAPQKBRpMhBKDRrg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nGITamugCR2YRPeV8yeGPa7FCVN/G1LQAcnkE0xX1oDb80dSSVO4nvB4RaCNHXE/V
 YTmyxm6GKwkWIX8Id7rvTSUFXJ9BsgyTZ7YZgPkB24z5m0YoW4tXACGf5StxLGE7Dy
 cF5YYi5g9SQ1uPq2PzrNSnDhosH0UxSXRKhLQ36yFHb6Sp5SUmOHHmPw9j9yGNjUW6
 V666PpdDk5lOvaAhcwSFq0i236E7+Nx375A7TimVo1GuK6dNS85OEONtV2yPyIWWJb
 B6FxMooDqFCL3s3PtlP2jsBP1SMugXeN0WKK+4wnxJEhDiSal8PyFe8zLKpa3XG8xj
 nDgWfrj8KVsxg==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
In-Reply-To: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 0/4] RK3588 Audio Support
Message-Id: <166941240197.2098666.9516708665413168178.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 21:40:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Tue, 25 Oct 2022 14:41:28 +0200, Nicolas Frattaroli wrote:
> This patchset refactors the Rockchip I2S/TDM driver in order to
> support the RK3588 SoC, and then adds the necessary compatible
> string to load the driver for it.
> 
> Patch 1 rectifies a problem with the bindings where we were too
> strict about requiring the rockchip,grf property. Most features
> of this audio device don't need access to the GRF to function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: rockchip: i2s-tdm: Make grf property optional
      commit: 1024a5b29e90a18530588b3f161e81cf3fae7dcf
[2/4] ASoC: rockchip: i2s_tdm: Make the grf property optional
      commit: d980004e349049a3fcbffc6096d14896f6a122ed
[3/4] ASoC: dt-bindings: rockchip: i2s-tdm: Add RK3588 compatible
      commit: 0643fd3669f5c33bab5b05a813459a2d00a83465
[4/4] ASoC: rockchip: i2s_tdm: Add support for RK3588
      commit: c619bd4268ff9895760dab303b4eb15ed3d0f7e9

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
