Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F15318EE9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 16:41:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA9B170F;
	Thu, 11 Feb 2021 16:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA9B170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613058086;
	bh=WkhNi8ol3f1VI1S+4Gsf371AiJwJ79gqlKtzjzdXMUA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5saEya1cYT0OpmNyVb8PzuTTch+umJPD9id+PUxA9txZ7QkU7VPBb7WF2U8PGgVD
	 ZLttKm67O5IlYCpa/t3BoufsqC4Py7i5yeaEdix1N6j8yNc7JAREld7s/IGkjCxiES
	 WkOHrFKQewcr5vRrn0Z0DSUzunkaynSbhgYJuQMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1C8F8025F;
	Thu, 11 Feb 2021 16:39:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B614BF8025F; Thu, 11 Feb 2021 16:39:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B593F801EC
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 16:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B593F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JkknHSnZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D53A864E8A;
 Thu, 11 Feb 2021 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613057980;
 bh=WkhNi8ol3f1VI1S+4Gsf371AiJwJ79gqlKtzjzdXMUA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JkknHSnZybPCBxcOILruAYK5wW9P5YV3XE/aWCQ3Wtd0GrsNhk9pRgH8ZUksmoAdC
 MCV7CJtO4USAGKEqO7pfZNvjRsoh4amQYycd6fpLhsLrv84ORSbOt711/oEYtOUDv/
 P89h8UE53rLYviDDI1WxHviiQHWH8mnusX15/aIhnjd1uY7Jt7uL/lWLr1GWGla+OW
 F2s0Vw0tL9MKeFnQP6NqGs1cOhoaSf3jYcox6fxY6tscTJkyZ1szjlxNhuavfKV9MH
 DiYPqTD+q50y8xyQtvLkAnmIKNeGIFLKabwknGXHYOyc4n8zhIaTc1aiFD2jAOeJU0
 FGqHwT1DXsOnQ==
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh@kernel.org
In-Reply-To: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH 0/3] Use clocks property in a device node
Message-Id: <161305792123.12370.8611418623618908867.b4-ty@kernel.org>
Date: Thu, 11 Feb 2021 15:38:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

On Wed, 10 Feb 2021 12:13:38 +0530, Sameer Pujar wrote:
> It is recommended to not specifiy clocks property in an endpoint subnode.
> This series moves clocks to device node.
> 
> However after moving the clocks to device node, the audio playback or
> capture fails. The specified clock is not actually getting enabled and
> hence the failure is seen. There seems to be a bug in simple-card-utils.c
> where clock handle is not assigned when parsing clocks from device node.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: simple-card-utils: Fix device module clock
      commit: 1e30f642cf2939bbdac82ea0dd3071232670b5ab
[2/3] Revert "ASoC: audio-graph-card: Add clocks property to endpoint node"
      commit: 0be0f142b8323378df6358c36dd15494134f5b94
[3/3] arm64: tegra: Move clocks from RT5658 endpoint to device node
      (no commit info)

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
