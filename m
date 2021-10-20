Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B2434A10
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFB716EB;
	Wed, 20 Oct 2021 13:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFB716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729427;
	bh=wTQloiZs/BuLYX5Yg3LlKrHdopyQzbSJH5f/Y/+nJdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhcwIm4tWEtwEUTt+PsfrJTIzcc+r+lUEUZOT8u+DXdvAGHyNQJ3OBviauNhqPNtt
	 tqiLJfVaWqx8KvP3KH3TQTV8nppht7rrC/oq9Bmc84R/VtAdxzyFgJXr6bCcoTHYmN
	 Gwh8XRkOpZoeyxWohgnLBVfoAI91QtUMI6I1YoPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A822F80082;
	Wed, 20 Oct 2021 13:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E899F802A9; Wed, 20 Oct 2021 13:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38A2F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38A2F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n3eSBerg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 753266135E;
 Wed, 20 Oct 2021 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729332;
 bh=wTQloiZs/BuLYX5Yg3LlKrHdopyQzbSJH5f/Y/+nJdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n3eSBergbHy5zgvxaAoAveP9Bi9qIaMsR9UsAb7OpUkOA5hNNoSinHCgLxT3M6j3x
 isbmgUQZ9O0VU6enRGoJxUljlqlw0SjVggMHohwmveeRlkJ4ibOHJZQqQPLa60kFCZ
 u1S+2++oPJFnW3vNsj7KjThnXZgvH4HPP2thzFxgGXzSZm9X4Z5DgMKedL2D7YE7cy
 ZlCzUgzTlExFHjswmLq1BARGvnKnb7ktgC3HXLjqqOkS8UU75rDxmPdvcqDf9V6/+5
 poapQeOXKQu8/5K5oAiVBjjqw99M7cebid3jn3Dc3IPXh3FjZnU7J3Ff0Zl/SM4k4U
 JkqiFwVKKLXaQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Fix refcount test
Date: Wed, 20 Oct 2021 12:28:37 +0100
Message-Id: <163472931363.2896549.8558505612147911310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015210730.308946-1-frattaroli.nicolas@gmail.com>
References: <20211015210730.308946-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
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

On Fri, 15 Oct 2021 23:07:29 +0200, Nicolas Frattaroli wrote:
> During development of V5 of the i2s-tdm patch series, I replaced
> the atomic refcount with a regular integer, as it was only ever
> accessed within a spinlock.
> 
> Foolishly, I got the semantics of atomic_dec_and_test wrong, which
> resulted in a test for 0 actually becoming a test for >0.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s-tdm: Fix refcount test
      commit: 0ea15e98cfbe56147e227360282ccd311e824b61

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
