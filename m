Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AD419D88
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1BC16D3;
	Mon, 27 Sep 2021 19:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1BC16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765130;
	bh=S9lPj7S6AtX8lgkNXK2TH/P606+dWXlaJ6v6Z9fSAFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvO00uKuAypTyd036mL4/SWGVUNg5Issu+d+FfASxqD8jvYRuExqBoGSgB+3Hhq5U
	 joo3nTBBPzvxb+Pj1nHSVhnt+9Bcl78IsFMlz4nY+WlvZ/IVM+LZzg2Q8fBDxgijq1
	 2gAZXTCgbR2+wSXgQAKbTeGl7d0M6k0rBUPE9VoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C18BF80533;
	Mon, 27 Sep 2021 19:47:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A4C0F80525; Mon, 27 Sep 2021 19:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9931DF8051B
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9931DF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kYIzxkh3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C3A260FF2;
 Mon, 27 Sep 2021 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764851;
 bh=S9lPj7S6AtX8lgkNXK2TH/P606+dWXlaJ6v6Z9fSAFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kYIzxkh3O1AON1PzqSy8BJwjZnoSXGhgyw8GrBDEmRvWBDMc8xx20gGFKic0wswfF
 K60u/4taBh4ZXRWKkUdOBWZsrDctzoXXB/ba6ra3N/NvifCxxqnGVN686hXvo1puId
 hwVMrV8vqUChDExnBkep9C8L8X0+Tqob1KDwPEZi759xHZduHQGVPBSf+EzKVhZXUv
 ACV5KUdzNfpzxZtY1NEy37N0PGQQO4SFqHhPMzNIaOHRp0f1AqIkadSsiuRs36Zrqk
 UfwQyVKDqhkjoCqQkl6AX+JWRgHYRgytWpQWUvTdoM83+aSWRD7LVcu5Q4/uCJFTqJ
 pT/kNYGhhuljg==
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>,
	heiko@sntech.de
Subject: Re: [PATCH] ASoC: dmaengine: Introduce module option
 prealloc_buffer_size_kbytes
Date: Mon, 27 Sep 2021 18:45:34 +0100
Message-Id: <163276442023.18200.4927438084255861267.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1632394246-59341-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1632394246-59341-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Jonathan Corbet <corbet@lwn.net>, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
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

On Thu, 23 Sep 2021 18:50:46 +0800, Sugar Zhang wrote:
> Currently, The fixed 512KB prealloc buffer size is too larger for
> tiny memory kernel (such as 16MB memory). This patch adds the module
> option "prealloc_buffer_size_kbytes" to specify prealloc buffer size.
> 
> It's suitable for cards which use the generic dmaengine pcm driver
> with no config.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dmaengine: Introduce module option prealloc_buffer_size_kbytes
      commit: b0e3b0a7078d71455747025e7deee766d4d43432

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
