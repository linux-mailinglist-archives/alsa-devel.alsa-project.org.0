Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9837A22C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE736174E;
	Tue, 11 May 2021 10:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE736174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721976;
	bh=eBWDJluRsgCeGLDxW3y4rXxNqKj35vzOmjiWuK+aSzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZzZ6hmip5Pjjw/VP3BRbJn7JS42aHvjCOiIJlubHgwkC2Oa87KOCr/acWtAEBN/7I
	 45k5yk7M5PMJR1JRSagvXMw2sJfCHThhG643lC7xtIxeLsqkOCeA9CvqxL4JHMJSqu
	 IRActg7jKOv9fpJSj9gcWc00LUBJCXU0VxsR9YAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 976CFF804ED;
	Tue, 11 May 2021 10:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8FFDF804D9; Tue, 11 May 2021 10:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C48ECF804D1
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C48ECF804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JpIaOKhC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25F4B61622;
 Tue, 11 May 2021 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721676;
 bh=eBWDJluRsgCeGLDxW3y4rXxNqKj35vzOmjiWuK+aSzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JpIaOKhCczlAl6rHb4epjZIWhn5KIZPAnA6vaFt2vznxIlKgA48nC7lQG7dqj3KHV
 AMU/bqvwla4tIXNYRMc81eCdYICHZ0pLVxRtYnHIIPuJA9O3Gwa0lWSpYFGaJWvy75
 C53CPUVnntNbEpfc6WUVBo47L3CbM1W9OlQXYlBDnS05LNQBZrRJAUvqqGg0xv6jyo
 aT21nOJUG7BUyEDzGeTGx6pQiOmyxgrvRqXUJJUAogSE69rIiQYHNmfIw05YXyazGy
 wmKt+pnmCIV1nkva3eI6YpO6ogqTQc70p0ml5PaHfrwu1Q6JC8NQpo6chRY4EqQ6Y8
 48H00vcwKOqbg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ye Bin <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bixuan Cui <cuibixuan@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH -next] ASoC: codecs: lpass-tx-macro: add missing
 MODULE_DEVICE_TABLE
Date: Tue, 11 May 2021 09:25:54 +0100
Message-Id: <162072058170.33157.14915696599003634030.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508031512.53783-1-cuibixuan@huawei.com>
References: <20210508031512.53783-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, 8 May 2021 11:15:12 +0800, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-tx-macro: add missing MODULE_DEVICE_TABLE
      commit: 14c0c423746fe7232a093a68809a4bc6233eed60

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
