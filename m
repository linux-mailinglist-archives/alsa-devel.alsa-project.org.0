Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6D559BC1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF99F1898;
	Fri, 24 Jun 2022 16:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF99F1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656081468;
	bh=fES71k0ZtQMfRPu9DCT9ZOVYdQvNBjl3fNHC6w3pSEc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBw1Qw8AiNaMOzbHC7LGC5hhm8gE3PiGNqz+La2MOn0dq4g+ZbMvz85RtIKwMjLFs
	 2BnHA0fejjKClI+OfZQFtJyt1eS6OfNIdcMafs2ec6fVRK82kxe6ZR2yEK/Udg9TPY
	 emZeXDaSAcSjznuGrYheRbID+MMsWgqm04Vdezmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF126F80537;
	Fri, 24 Jun 2022 16:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CB2FF80535; Fri, 24 Jun 2022 16:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A93F8016E
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A93F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hsmdt5LT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58A0D62078;
 Fri, 24 Jun 2022 14:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646D3C341C0;
 Fri, 24 Jun 2022 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656081347;
 bh=fES71k0ZtQMfRPu9DCT9ZOVYdQvNBjl3fNHC6w3pSEc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Hsmdt5LTyq7cqedpM7gD3mcbjTqTZVbXcWKBNDxL/nyNXh7QuMwjQ7X3ZkyQfEMS5
 Kdh+uekKRjxFdw0vb9b8c6lwbHpQqddsFR4oHiVYwa5BNCUy3eHchli72h2SDIuN41
 eWKSgqEpPHVxgOfnphX4wAtuA0nksQX4p+f8jQbXuc8w9G32PNwcLP4/fB62l3+jqw
 H0LDGLFIFqEz8Kb63K/UqL4SxCQ3FOJjUFbQiuYnFn8KnA0LwJ/rtjmUCDKd0108Hy
 cAyth5zSs6zw/PuBediVxP+YxqQUm/7CT5eQ6Td9KeKJ1juFc97abm97Yy0gvZjprA
 ZtYgphvV7oKDg==
From: Mark Brown <broonie@kernel.org>
To: jiapeng.chong@linux.alibaba.com, lgirdwood@gmail.com
In-Reply-To: <20220624082745.68367-1-jiapeng.chong@linux.alibaba.com>
References: <20220624082745.68367-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix missing error code in
 rockchip_i2s_probe()
Message-Id: <165608134513.445804.8165290048747586515.b4-ty@kernel.org>
Date: Fri, 24 Jun 2022 15:35:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
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

On Fri, 24 Jun 2022 16:27:45 +0800, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'ret'.
> 
> This was found by coccicheck:
> 
> sound/soc/rockchip/rockchip_i2s.c:810 rockchip_i2s_probe() warn: missing error code 'ret'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: Fix missing error code in rockchip_i2s_probe()
      commit: 7f6409fd9b54b6f56444edc996cd28059f215415

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
