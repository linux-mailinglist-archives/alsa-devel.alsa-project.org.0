Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15B310E19
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 17:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5294167F;
	Fri,  5 Feb 2021 17:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5294167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612543605;
	bh=o3h3fYmeEdvgWp7HmTFWFie1v+V6mM1T5BeFAVLkmok=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkidyzWVBcKmOZC8JuwLBTejRYH6L91MYiCegxckgxHvSnTyRScMlj8DT53GH4TAt
	 jeFyR9H8Fh9PpQiHFxwAOKn2AgLT9A8ToOaNOz7qUZDwI2XW1ZzMT8w1Zh3I4Ky3Zj
	 PTLRdhb8fA94PEUqyV3SIKUSOy4rfL9rOlnpRRRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B94C3F80139;
	Fri,  5 Feb 2021 17:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF61F80139; Fri,  5 Feb 2021 17:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 447BAF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 17:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 447BAF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egd2wtrW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F98064EE4;
 Fri,  5 Feb 2021 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612543496;
 bh=o3h3fYmeEdvgWp7HmTFWFie1v+V6mM1T5BeFAVLkmok=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=egd2wtrWuGXbz4EhfdPFspKlVwK7DP3eOxmu3CYdZmZ1ZtaiHNBqi9QbOGkee+9ys
 U4NBZ1p22vxevM15NuzNIwHsdHju0eCqeq5JzCLGcyJvrbur15lgHoHFqHDM2fayJp
 cvqE3cybiM9fXkCFRs3KojclCOXUBfJ6YlI6mG/YXZkJ0Kgg/B7W0iAQOTAPfY5FVC
 hCAAkQ61SOSrM1RABOTTc3dPtFXugKs9Bi4KNBg+CsLU101ncgs3b7iNXyVnP0bMVl
 Ng451/kdG6pRWehZ3G85IN55qu6CrV1hdZL/iSsWDMPOcpI5FPhK1AED+NQwtzBnM3
 PbAI0xjITLv0Q==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183-mt6358: set playback and capture
 constraints
Message-Id: <161254344059.9495.1560731100918324010.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 16:44:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

On Fri, 5 Feb 2021 16:16:52 +0800, Jiaxin Yu wrote:
> Sets playback and capture constraints to S16_LE, stereo, 48kHz.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183-mt6358: set playback and capture constraints
      commit: 19657a609b68f37afede259a762765b77914557f

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
