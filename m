Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8571C37A206
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046D71759;
	Tue, 11 May 2021 10:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046D71759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721855;
	bh=Zg/C2BzPmYubKX+vJ/fPZqWYGhekjqvsMIAJOQaFDkE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hymxNTe/mPuRDlZ9hRJI2x6Putsc1kFIBAosvn7xEMQUhAuGgT/IPg8yXWU8jT2Vi
	 HEKImAl7E56B/zwStownFDRBoaGHA+7dohd2ZimEyXHLDzKo+YP16y79nyYpp8s/BM
	 xcqmUf5k6QW8aZiRqe0aRDgBSYOiIaPnXeKh9w24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F613F804B0;
	Tue, 11 May 2021 10:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50AF5F804AF; Tue, 11 May 2021 10:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5550F80482
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5550F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S/TWD4KJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A5BD613C3;
 Tue, 11 May 2021 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721658;
 bh=Zg/C2BzPmYubKX+vJ/fPZqWYGhekjqvsMIAJOQaFDkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S/TWD4KJ3xQUwr7fKcfNY+QO+QS20RueoZQZs/jp0C1S97el0jZ8NFFgiTcy7DyT7
 nHuGwj0S5enWZmPJLvrJaI2Xavd91LgnPp+sNLBtUgjsAO9N4NGU+vd7YZBl9Wf3Sx
 ZBRAs+Sd8VL5z/H86CKvjvZAT7abqYbuLSJo3jPLTcVKid+Cfl6gKwJQrEjBCHrEqw
 WZ+kX8vO9+1Wqeh6BoxaxtvzJnDNTCqUmTZCQe7z38sGhIpiJDW9tIvHuAx3l4FbCj
 bX05L6Y7IiSVx8PlH0xthgZbve1IgE28APfJS+dT9VRR7E/p+wyVZIVNVwrD4eVLPw
 jVYZhavbOjatw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt1019: Add non_legacy_dai_naming config
Date: Tue, 11 May 2021 09:25:48 +0100
Message-Id: <162072058168.33157.5718955718774506859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503031732.22035-1-derek.fang@realtek.com>
References: <20210503031732.22035-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>, shumingf@realtek.com,
 flove@realtek.com
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

On Mon, 3 May 2021 11:17:32 +0800, derek.fang@realtek.com wrote:
> Register the codec dai name as 'rt1019-aif' by adding
> non_legacy_dai_naming configuration.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: Add non_legacy_dai_naming config
      commit: b63ecaea97aac3020be0e5736253e88cefbc950b

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
