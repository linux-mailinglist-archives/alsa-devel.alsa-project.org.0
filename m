Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28937A238
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979BD179F;
	Tue, 11 May 2021 10:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979BD179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722086;
	bh=Gk+CeoyFxhnPqAe46i/l9FnGdGx8TtOSVBjRZoBk/4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UygMFyBUvGPBTaKKuTOkJXW5xheSW3hr4KqEs29lf4s34nlzmsaYblYB1nE4cS5ay
	 zypMFE28Qg1322p5/r5acGBouX2vR/7uFCivRHuXZe7LuJQq0rThzjJzukiBjfGTKy
	 m3DjASzvWAAskTSYs/Ue15qKjhPQSI0Djef6NlCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E74F80519;
	Tue, 11 May 2021 10:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F7B5F804D1; Tue, 11 May 2021 10:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EBE4F80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EBE4F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ixOvwSZ3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD34661946;
 Tue, 11 May 2021 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721691;
 bh=Gk+CeoyFxhnPqAe46i/l9FnGdGx8TtOSVBjRZoBk/4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixOvwSZ3oJ/owYJUpffCkc6eJNTdy5I9Pd+rYepv+0icFNmQjK9560v0fvwRMORKy
 PTbvixRF7boG0HmynEMhKGAYYdhoG5A9DiBVCPcH4xzus+VVcrVfh+LvOMkbDVZEPW
 QeXMnnC2a4FNmSEPuGFazxG3qgsuOeIoJiVyZ8woIto7OXxhpAOKM+aYmGpB0LVmKO
 46FeKz7PekHvZ06L8HH2jGpTpurztxLSewBPsJn+ZxiFyFg7W4dlBGsHRe2oeC2vBT
 l9pWXxon1Az7FNEPrgaLGCjN9T4HFaD+Vk3gWy3zmDx5l1fuxY7fv6nEE+2VBY1npm
 cxDY2+5yqm1Vg==
From: Mark Brown <broonie@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 alsa-devel <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/1] ASoC: mediatek: mt8192: Delete a redundant condition
 branch
Date: Tue, 11 May 2021 09:25:59 +0100
Message-Id: <162072058170.33157.6826486921095760961.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510083640.3368-1-thunder.leizhen@huawei.com>
References: <20210510083640.3368-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Mon, 10 May 2021 16:36:40 +0800, Zhen Lei wrote:
> The statement of the "if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)"
> branch is the same as the "else" branch. Delete it to simplify code.
> 
> No functional change.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Delete a redundant condition branch
      commit: 85c966dc97d1c46a3079ec4c26714c9f8ec66823

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
