Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B29482463
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 15:41:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 742CD169A;
	Fri, 31 Dec 2021 15:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 742CD169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640961676;
	bh=lAxyCxUkQlETTh2egsQpr5ZWqt6MG6luXxuJleTC4Pk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBY0XuhOiOFyZmQoVRjhC1poxL3SPCbmMZ8bMPFVI8QfDdUHCIet3N99+E/fUhZoh
	 Ark5vyxXUNLbxJhTSMiBFc5cuAcXMVHo1vEITKv+kFa+JM1TvQZUXR/rcEg2joXCnV
	 C0RzarSLHoxlHE+jJVgy9C0GmbkoVy/EFcMhs7mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB60AF802BE;
	Fri, 31 Dec 2021 15:40:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 993E9F8012E; Fri, 31 Dec 2021 15:40:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476C9F800C1
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 15:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476C9F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r/FWhMvq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 277A0B81D85;
 Fri, 31 Dec 2021 14:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8EFC36AF0;
 Fri, 31 Dec 2021 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640961599;
 bh=lAxyCxUkQlETTh2egsQpr5ZWqt6MG6luXxuJleTC4Pk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r/FWhMvqFHATTAndSxG3zmrOdPr6YgnaMsrO/ijlgdOg6yKa/ejJvd9NU4f972sDn
 aWQleQrjD7dcnLtwnF4KQqR1zbhm4+m/rMDjfpBshkMa+wrTdHIziNj6BvkwWpOkjl
 OMs/QAkR0z+mOUsuiiLHZC1w/0lJrw2K8siV7Rdx4vek9JApq74KfVkLjR+zO7xWNQ
 LdgpuzBTqb/EcKVF+Z5zUtXxSjqV/Xbh3lO8zjVwSI8M8vHsJV/IrCISovfnuPdKhk
 89M0a2toxISI5ZH6Atb1GsKpPl+6lkQfORkyADEaF9IOdMC/TP4QBqW0aIU4zNtBWV
 GwkZp8rIlhbvw==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com, tiwai@suse.com
In-Reply-To: <20211230084731.31372-1-trevor.wu@mediatek.com>
References: <20211230084731.31372-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8195: repair pcmif BE dai
Message-Id: <164096159738.2355590.6915184863464134873.b4-ty@kernel.org>
Date: Fri, 31 Dec 2021 14:39:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 30 Dec 2021 16:47:29 +0800, Trevor Wu wrote:
> This series of patches repairs some problems for pcmif BE dai.
> The unexpected control flow is corrected, and the missing playback
> support of DPCM is added.
> 
> Patches are based on broonie tree "for-next" branch.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8195: correct pcmif BE dai control flow
>   ASoC: mediatek: mt8195: add playback support to PCM1_BE dai_link
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: correct pcmif BE dai control flow
      commit: 2355028c0c54c03afb66c589347f1dc9f6fe2e38
[2/2] ASoC: mediatek: mt8195: add playback support to PCM1_BE dai_link
      commit: db5e1c209b92a67ab7c1d7771a48294c9c093f7c

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
