Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DC34ED2F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 18:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D3A168A;
	Tue, 30 Mar 2021 18:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D3A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617120479;
	bh=MjtFvE1Bg1vsCss/zAR9tf8Nc8HDiGrYU/j+daFbggU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEodR7b3RX4JDBUhDUP8STuYeHoB0soPhEgSdUYaaL6WNFCwHsFfOr/eBuf6XYbZD
	 aV4SJ2hAqlgkL9AuUxOyvXV+BDxhGfPb4wb4j8F0p8+WC3/ZOuE7ZpA3EowO20Q2E6
	 t6lbJptMJ0M9xuHFa61s3bm5GxPF8dvHbuNVFiNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FAFF8027D;
	Tue, 30 Mar 2021 18:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8558FF8026B; Tue, 30 Mar 2021 18:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FD5EF8023E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 18:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD5EF8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KS3gLJKa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1924619C7;
 Tue, 30 Mar 2021 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617120365;
 bh=MjtFvE1Bg1vsCss/zAR9tf8Nc8HDiGrYU/j+daFbggU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KS3gLJKah3O07Zc+vjhueWrMuXVPdxxJ+X/ahqkiQjDJnL0q7z4WISJvXLxSCJM4p
 D6/fLVOv35YnaPV0XVUtXS870pfqjQTkOQ9gtNdXDoRmC5wxyqtHZxICTNbKDn7JxB
 rlEhESGUASrye5qWH1Ay3ORLD8vFPCD7bj25Ws+KJY8IO2ZF45cz3ICImrevHUkeOt
 E+aqZy/gxNj+9hc4RWdqqsjVRbLzJKx2QRw540bnlmrz3n0oEEJRMDn15evpvYKnks
 0TyWPDi2rcUmvFL1xEw8PFxUHZERPYuSCcmFUlDH1La9xKYqxzVd4i4Pw6KhEU0poj
 B8i01vGxCAesA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia,
 tegra210-ahub: Add missing child nodes
Date: Tue, 30 Mar 2021 17:05:48 +0100
Message-Id: <161711993559.12915.14933461243345209576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org
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

On Fri, 26 Mar 2021 13:50:03 -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
      commit: 8b01a0d0b5c1327296b37a13c37ca7ab31841577

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
