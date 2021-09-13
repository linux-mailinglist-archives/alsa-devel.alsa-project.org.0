Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94A4089C9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC9A4169F;
	Mon, 13 Sep 2021 13:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC9A4169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530939;
	bh=B3WACOWaU5Afzv3Vm7VAdPhu0oyR6Yu45R6CaWCqSI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtyRwJnvz71n2HGwHL8nn16pX1bmNWjw3y8gIg/dll1RBBu7wZifPAr72nsArnPqy
	 cfRTCZDniYebXKuWhMXPX35oj6cocsvan0npKdarHe523cV63SfNArPTGi5q9jdXnS
	 e0WFZALJKzVBvVsYPc9JHkixMlNYpa9t533ovq/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF91FF80568;
	Mon, 13 Sep 2021 12:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF07F8053E; Mon, 13 Sep 2021 12:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B15B0F8027C
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B15B0F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aH4zYEtK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC46261029;
 Mon, 13 Sep 2021 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530527;
 bh=B3WACOWaU5Afzv3Vm7VAdPhu0oyR6Yu45R6CaWCqSI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aH4zYEtKk8ayJHkzsUGqom6WuSU00WV6ODNFUSJ6nAxlHlOAkqN+abtsoXjKH7BOj
 3HsHLkxoA/w+g7AOlHPC3KsTlBq+456/xyDBP463NeAIY1xrLlz0FPK3q/f/UWP3TM
 GFDNrZJ4Z0CQlMt6oH1aNtxaqiSVwndrOL3JHgF5fAAof51a8ehn7ZpXTAZ5y8vjSZ
 oaZlVIpMcWlj4DW1kIhzcZln4B449ONaqFIcIdMHlgwjslZ460undJtEbCVXhh9uo4
 3o6OYw3BGiCvBa0Tn4kiQOyURacorH+zIVXVrs/zHpdvKcY0QByTSArr6AOkdWCrHD
 48qAg4Z4/qAZg==
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>,
	heiko@sntech.de
Subject: Re: [PATCH v4 0/7] Patches to update for rockchip pdm
Date: Mon, 13 Sep 2021 11:53:33 +0100
Message-Id: <163152996585.45703.15904928941100821408.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630675357-3286-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1630675357-3286-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
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

On Fri, 3 Sep 2021 21:22:37 +0800, Sugar Zhang wrote:
> These patches fixup or update for rockchip pdm.
> 
> Changes in v4:
> - Acked by Rob Herring
> 
> Changes in v3:
> - Fix property 'path-map' suggested by Rob Herring.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: rockchip: Add support for rv1126 pdm
      commit: d269aa2ab975807764dc2509e4156bb9b6bd0d34
[2/7] ASoC: dt-bindings: rockchip: Add binding for rv1126 pdm
      commit: 49a7a625ad79e5b995be313472743b278c90c853
[3/7] ASoC: rockchip: pdm: Add support for rk3568 pdm
      commit: d00d1cd4ab42f92d4d871deb9cdea1d7c262a213
[4/7] ASoC: dt-bindings: rockchip: Add binding for rk3568 pdm
      commit: f80e5a14ac2730b441c71d191e6538a74706cab3
[5/7] ASoC: rockchip: pdm: Add support for path map
      commit: 13e6e042a6f9c2be676f421935e026308de3303c
[6/7] ASoC: dt-bindings: rockchip: pdm: Document property 'rockchip,path-map'
      commit: b2527dcd65b3e141e9363af5b256aa484bd4c06f
[7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings to yaml
      commit: 8ece5ef67edca06e54460b244f4043c237c90a21

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
