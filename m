Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0D35A346
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA941698;
	Fri,  9 Apr 2021 18:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA941698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985645;
	bh=w+nXh2oIb5hqSWOu4tiw3dzfprfvGxaBt69rGr9Q1nY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1iYhUggkhp4pQccWUNyOghiruKmakmoKPGCMXvD+Dq2PXPguOx/+sSjMVIX0pvLp
	 6DwPNpRMbuWqYRRNm182WV/c2U5/6xc7aaj/zvJ5+9RjtuAj8ffFpz1lIQubvv9G+B
	 YM3mc0GRp7xiEP+L4DLiJo5psdqiUWUmmXKnPYBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A5DF804D8;
	Fri,  9 Apr 2021 18:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4F3BF80482; Fri,  9 Apr 2021 18:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 989A0F80423
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 989A0F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RR3U+UZj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8690961105;
 Fri,  9 Apr 2021 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985440;
 bh=w+nXh2oIb5hqSWOu4tiw3dzfprfvGxaBt69rGr9Q1nY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RR3U+UZjV5gSNpDog2Gi8Z0yHSEqRLYlja1j410PVpsAiWXU4xlMATHJn+o1s0BZ+
 wbblBgZYLWzTwHMIWrLzHFlmbIHH6UNLfYvO1pbopPOKNN94NnaJa+YUnJta0m4DUq
 zaHb6T3deeXoZsuXv/CeauII8jX+Kmq/dATfMJx6spN3GyiM5wfO2zJN11DHQFY6lc
 XAlvW+jv4XcUNGN1GU2dq3P64BQRyml7mwMiPHfJ1qbsnKLelntih+7pGJm+G2nSHr
 5ARrR+86GMO5ja7WlEA6reT96G00P+N2rGdvOx/5FuMwOyIRkb9+cUNGPhY7dhNSDD
 on/SPGtJIz7Mg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Colin Ian King <colin.king@canonical.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ye Bin <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: codecs: lpass-rx-macro: constify static
 struct snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:54 +0100
Message-Id: <161798344183.47643.18319707456149836234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062650.803309-1-yebin10@huawei.com>
References: <20210408062650.803309-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:26:50 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: constify static struct snd_soc_dai_ops
      commit: 857b602a3424a7d9ef875f8f137ddcb68de41c6f

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
