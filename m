Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CF47C577
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:52:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0792217DA;
	Tue, 21 Dec 2021 18:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0792217DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640109135;
	bh=5f+E7cJULqIn1P5GZHZpSxW+++jdp1IvvCYJFitA2bE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpqqwClSRiZTKXsK5apmkP9OT1K5oXGbcGGvGGyrWS+2alXvHSLxgq1CXBu4AXIgC
	 5z5sJAYuq0JwSEIcIh2EISVxTEeihdvgp2QMiqb6hpeHPRFwid5QaCq7uBmRji+O8i
	 TX8o69ESR12a9TieMhALYqApUU1BRKOA6W93wv14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B577F80084;
	Tue, 21 Dec 2021 18:51:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D20F5F80125; Tue, 21 Dec 2021 18:51:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E991F80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 18:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E991F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RO079kw1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA328616CB;
 Tue, 21 Dec 2021 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AD4C36AE9;
 Tue, 21 Dec 2021 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640109058;
 bh=5f+E7cJULqIn1P5GZHZpSxW+++jdp1IvvCYJFitA2bE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RO079kw1zrxfLpiu9+IoGDdHZZICfml4yYeLh2QQd3uiht3M1IrOGkMbejVV/Pjv1
 0dg1mCJtKhqLc8LFREepRu6wVHNothqXpKExMxsHc9IMZ4VBtV/hhBbQQcHO82mHVB
 5dUjJD2x/6eSjikgHURtiZBUiDLFm0qL8gs4WcPO6EiEzUN3ZTticrIDheJYbBVoNi
 At+eiHgWP1fS2mU8dqd8DFFOemqh0O5C5o6MUoT/zzdeLCQcK1+yv4GXt7VL7urdcE
 Zz6mi6Ma6UfLHcWlRsBK4UJqEj9IdtOm9sTc5dqD3kcj7fgBtaNnhmAjKlRaCQzeuC
 fxkk1JZ60L4CA==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Heidelberg <david@ixit.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211216160229.17049-1-digetx@gmail.com>
References: <20211216160229.17049-1-digetx@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: sound: tegra-audio-rt5677: Correct example
Message-Id: <164010905640.2818037.9602407885797991307.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 17:50:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 16 Dec 2021 19:02:29 +0300, Dmitry Osipenko wrote:
> Remove non-existent properties from the example of the binding. These
> properties were borrower from the old txt binding, but they were never
> used in practice and aren't documented in the new binding. They aren't
> reported by the binding checker because dtschema needs extra patch that
> hasn't been upstreamed yet to make unevaluatedProperties work properly.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: tegra-audio-rt5677: Correct example
      commit: 3bf4fb25d5c2455396a1decd43f5e6b775f0b377

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
