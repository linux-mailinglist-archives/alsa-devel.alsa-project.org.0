Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9A47C743
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377001833;
	Tue, 21 Dec 2021 20:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377001833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640114063;
	bh=PI9JsaIFDN7yqONnNOEbLQVi3YNrLsUoOS1QyXiQQlY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWIfEKW71nKMU8XBP+5f50WhdzoIWmPl3g3QY5AJqRp+a5rxbUzU9r62RutfiVWeK
	 P5xvlpdqIoHKSMvszKprvIii+2JLc9EttZQCp5TtbbupObkae8Ou4NrkKtOVcbYZL9
	 YcMNKY1JSGPYzruPkf13Tnh7FUDKlSRiYWMSX4/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A748F804EC;
	Tue, 21 Dec 2021 20:12:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45268F804D9; Tue, 21 Dec 2021 20:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAED5F80118
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAED5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GlXJ6WBZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B808FB81990;
 Tue, 21 Dec 2021 19:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832E6C36AEA;
 Tue, 21 Dec 2021 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640113954;
 bh=PI9JsaIFDN7yqONnNOEbLQVi3YNrLsUoOS1QyXiQQlY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GlXJ6WBZ+xlzM9rM70oU6/pG/JzGzIuUSiXpuUqZjUZgYLaOf0jNwPuZ+dgcf/NQw
 WK3SLdCLFXJkQ3umVpYzfhQxuBg7V8L8zrY5BfRKBCwtXVsW5BkHe6qb2b2ih1znPw
 M0d8FtlSdCpeYWcO13d76W+qSYX98u2FRkv6TTUbD3v+S25yJcuHGROlXN5Rfzsbdf
 vNgPzucDa1Y7B30uZ6uKMg7lPfDKbmjuIYEMYRXgadIAsWwwYFxzLfrNCFblOOtBlD
 6FUeAgAB056Qk5LWvIuI4t9oEbcv+uRGkQ2fh+aTzRIVp9ji5G30ZRaTclm/YgtoHP
 SDnXBOuo1Zq5w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211221170100.27423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211221170100.27423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] sound/soc: Use platform_get_irq() to fetch IRQ's
Message-Id: <164011395226.93163.12622480659294102609.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 19:12:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 21 Dec 2021 17:00:58 +0000, Lad Prabhakar wrote:
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: xlnx: Use platform_get_irq() to get the interrupt
      commit: c2efaf8f2d53ffa2ecc487e21c62d13bbb8d88c3
[2/2] ASoC: bcm: Use platform_get_irq() to get the interrupt
      commit: 5de035c270047e7ae754fbfb69031707aa5b54f7

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
