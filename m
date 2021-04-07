Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B39357607
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D4C1683;
	Wed,  7 Apr 2021 22:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D4C1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827321;
	bh=Ij6ZUSk87LHtlya9NtJcg/cBO4fTPWuZWYabbRGBlaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmcwzbbi7KTKEpDkEVPPc5GW8sxNkGwC4sJu95P5h/yy8MAx8EgYa/cFpzJa9Gqg6
	 svy6ORivZeHABRJ5Oq/V3WRb1NxDdXa8v1q+4bLPtJsfxnRd5dZ+wLjTkeXZ5TyU1h
	 6F9Pizuyn6Zz4m7lO2fw3w4zFCk0MhAHKkRe14sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 302E5F8032C;
	Wed,  7 Apr 2021 22:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44BBF801F5; Wed,  7 Apr 2021 22:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98024F80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98024F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WMnOe9US"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE3A6120E;
 Wed,  7 Apr 2021 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827214;
 bh=Ij6ZUSk87LHtlya9NtJcg/cBO4fTPWuZWYabbRGBlaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WMnOe9US2i44gARrRrNjw8DCv9yqyqhT8fnNzMtwTvdsS0RS7kedGfcjX8SZ5/qOF
 1ZXE2iGQ95eThSpGG0IhVVULAd7fE++OoT14R57xo9zsn4KwY1zh2RgVk17xXzQMYA
 ifUbOhHUSJfc3oQ8dtKWAR1uZYtN6IL8XROfjMTM2RjcPPOKS6yhSmI6uLvbhrE611
 3ZZANeoNKtN1HeL7VHmkhGqprI9OZFMy7MTKz3hMLE/PLzbQT0pDK0QDsvMAG1PrZG
 ILrWt9/yzUwSDBF/KxkA7qUSho+UYIkIgBq5wg+dD0GFIshrmrEsKhejsjrjeWd6yh
 ZW7ndKiU7Xu2Q==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Ye Bin <yebin10@huawei.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH -next] ASoC: codecs: lpass-va-macro: constify static
 struct snd_soc_dai_ops
Date: Wed,  7 Apr 2021 21:26:22 +0100
Message-Id: <161782703230.42756.14460019912472316913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407074218.3051979-1-yebin10@huawei.com>
References: <20210407074218.3051979-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, 7 Apr 2021 15:42:18 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: constify static struct snd_soc_dai_ops
      commit: af4b54127b2b8a69f0f50e54cf099f26b82c9244

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
