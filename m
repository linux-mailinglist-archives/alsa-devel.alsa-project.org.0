Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86D400483
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 20:06:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299B218D9;
	Fri,  3 Sep 2021 20:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299B218D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630692377;
	bh=1hAUx3R/bUDil8aAG0+n3xAXYLVRkV49z3VRYlAubGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDhw77SKDIaLiWPIVmkMEni8EjoBHZvTKRXqpS3K/LRaNSbQgt1mivgOBr6KmWYlq
	 UDLNZ5AV/B9WhvWMU4MeuF0pGRfqoW9k/glZGXlCb2Exw+ezVGdNELUSHrHLZKCQuV
	 zrWmR1RpezX51lvImjE9mtN26s9VFUXuzbBIFq8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5963BF80256;
	Fri,  3 Sep 2021 20:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC77F80254; Fri,  3 Sep 2021 20:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0CF7F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 20:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CF7F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RnGv8n/5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B771760EBA;
 Fri,  3 Sep 2021 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630692293;
 bh=1hAUx3R/bUDil8aAG0+n3xAXYLVRkV49z3VRYlAubGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RnGv8n/5NW4KOC551he3pdvHYM9wgwABqJhAralXwejVa5BJMjEKqIp3IuEAyJBRj
 r0o7yQjcFGeEH4UJOHbmeoKZsJFuJnpivcPUA5DR0w4DjNf2oxdTcg6YU69W0Dz7no
 6oNGaZzVo64R4MVPpAMMXdErQkjVnSj0B46KyVKO9fkMFoo55rhMROJQ+rzVWFpV/Q
 Iwidt7aaqR3bdFnSRl6riALORxQn1SnC0Y44Ik6yhg2LEZ5fIcTHRfUUvqZ9GK4LGm
 uS06UzgblqY6JDjAoi1sB/udZZ/nNqNLgnDLzm2ZJRz2nBd+1ijI55gacghrlEDSN0
 2P7UeND5xu8Eg==
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>,
	heiko@sntech.de
Subject: Re: [PATCH v2] ASoC: rockchip: i2s: Fix concurrency between tx/rx
Date: Fri,  3 Sep 2021 19:04:18 +0100
Message-Id: <163069197835.35101.5282344182422395715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630305525-65759-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1630305525-65759-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
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

On Mon, 30 Aug 2021 14:38:45 +0800, Sugar Zhang wrote:
> This patch adds lock to fix comcurrency between tx/rx
> to fix 'rockchip-i2s ff070000.i2s; fail to clear'
> 
> Considering the situation;
> 
>        tx stream              rx stream
>            |                      |
>            |                   disable
>          enable                   |
>            |                    reset
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: Fix concurrency between tx/rx
      commit: fcb958ee8e832e9cdf43408535207e15f14af755

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
