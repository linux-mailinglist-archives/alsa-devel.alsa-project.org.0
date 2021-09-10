Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21697406F3C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 18:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF4F168B;
	Fri, 10 Sep 2021 18:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF4F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631290292;
	bh=6iwvSZ8jp5kA04e1JPK/6mq3OGC3NvF1BQ05VjMVO44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBw5XgH5/KLrS3ku7P1PwcUGnkNYzpuDy/8am09Vi6VH3qKU/MZ1SNfxlFX8LB5Hd
	 suAX2Tiob27mfaOdFkE5V71FbgIZgtBqBaHS5XnpDrTCpWQlMCdCYI5WbOSvCk0TSw
	 QzPjqEbwFMYJcB4rNjfmIHZx5QOgLrWBR2dyKHTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0178F804EC;
	Fri, 10 Sep 2021 18:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A1AF804C1; Fri, 10 Sep 2021 18:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87E20F800FC
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 18:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E20F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pcC5QJb8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A12E6120E;
 Fri, 10 Sep 2021 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631290168;
 bh=6iwvSZ8jp5kA04e1JPK/6mq3OGC3NvF1BQ05VjMVO44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pcC5QJb8RtxJmQaU4B5d5Mdkn6sEJg/KPx0G91ox3184J8N9EzSFWxk1eXPcICBee
 5lf5KiqJ4ZGpyLfB9y4kmS1RDe1WrgMXHcvTgNxxhK/efnCZlLHkJ3hIKBmQWcJEIq
 rhW/CKt+6BNFS5Ag+AT3v2njZlt8s2Qq+w8uswkVawHiDsBYHyR7KI9yVvbR+HYWn0
 36TfFaWGnw9VSy83g2InmoTMWH+YX6o0/Y224ROLV844IKkTqdGfXcygRq7SrJQp+4
 9mTUQwhdbb/hUZkwEXUyiBcH6+eB+64m72ZG2vma4t0LBvc+/vTohNZPz+hMQ5f/Hu
 x8AqofQYhapoA==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Date: Fri, 10 Sep 2021 17:08:45 +0100
Message-Id: <163128974014.2897.15699318985041527361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910092613.30188-1-trevor.wu@mediatek.com>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dan.carpenter@oracle.com
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

On Fri, 10 Sep 2021 17:26:13 +0800, Trevor Wu wrote:
> When memory allocation for afe->reg_back_up fails, reg_back_up can't
> be used.
> Keep the suspend/resume flow but skip register backup when
> afe->reg_back_up is NULL, in case illegal memory access happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: handle NULL case in suspend/resume function
      commit: 1dd038522615b70f5f8945c5631e9e2fa5bd58b1

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
