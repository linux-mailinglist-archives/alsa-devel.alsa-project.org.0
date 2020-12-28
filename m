Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A592E6607
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5EA1721;
	Mon, 28 Dec 2020 17:09:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5EA1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609171797;
	bh=2oLXmg6ZIwbx9eqtsFZM89qawNb6c+iz5KCVUIu01QA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIq5mL73CEM5lhc4Uoce/Tg57Kd9piOglBia8gesp9uum7BDWje3TXK5LRZlk2MS+
	 icsrxgdKjf2bVc2BOW3htl6yJt16KiQM1vtnyXRyICbWAcshrbXeeEOfDsfrLqhYDE
	 PNQNsr1akYf/pPk5+Ouaq0ADJsQrpQW+6+D2HleM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C51EF804E4;
	Mon, 28 Dec 2020 17:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF1F9F804B0; Mon, 28 Dec 2020 17:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 988BEF802A9
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988BEF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iSsbvISm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC06820719;
 Mon, 28 Dec 2020 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171603;
 bh=2oLXmg6ZIwbx9eqtsFZM89qawNb6c+iz5KCVUIu01QA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iSsbvISm7je79fraVplJB5Pf4mzovl3cO8ij4QnR6ytpLrbRY+Fo0LYniIeaOcPIp
 gQd58RQm9jMIQ84YHbq5U7FJ3SpPAuvJp8F7F4NAOy3ePGkh2jkUcV5unE+ibfKpKm
 Yb7zaqM/OYag68Bx3N8yM1LDsMUFoOy3pQe4iPJpmB/USJceDEk4Fuw0Rn7I3niXui
 XX2LXKs9Gb/tnpvahFQTrkDCk67XXHku4m4Y3Iz/AaZhHQ5XGFPKOGMfJdb3m7qyZn
 vqfGs+62ljW1AHeMugBm7BwowZOYF9+1tuZBVEDS1LcGoA/+NSQ1vGxdqJ0KW0R0xh
 iH2vlibv+1TZA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20201216112512.26503-1-rf@opensource.cirrus.com>
References: <20201216112512.26503-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Improve handling of raw byte streams
Message-Id: <160917143257.51553.714728097367902102.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:03:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, 16 Dec 2020 11:25:12 +0000, Richard Fitzgerald wrote:
> As the register map is 16-bit or 32-bit big-endian, the 24-bit
> DSP words appear padded and with the bytes swapped. When reading a
> raw stream of bytes, the pad bytes must be removed and the data bytes
> swapped back to their original order.
> 
> The previous implementation of this assumed that the be32_to_cpu() in
> wm_adsp_read_data_block() would swap back to little-endian. But this is
> obviously only true on a little-endian CPU. It also made two walks
> through the data, once to endian-swap and again to strip the pad bytes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Improve handling of raw byte streams
      commit: 7726e49837af634accaec317c8d246d1d90d8fc5

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
