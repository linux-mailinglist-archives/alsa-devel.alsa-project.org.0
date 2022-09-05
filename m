Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30F5AD6B5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25891681;
	Mon,  5 Sep 2022 17:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25891681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392474;
	bh=DI/JWN7filrxVXubuYQqOnCDfFoWn6A2a5o7fhUfYQ0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2vrtSbAnjTjIhRL8HAsjFtaMxfC7ZoQBa3hejMC8yTDwIPh3yuUP7iC+dVrKCC8G
	 dtcub0qDNxo2Q6s8uOW3/L6peAaxK1dYniDy7y/6prSVTW69gJFngSRWOLs6ZxPJ/H
	 kmt0/KnzZgGj+TlQ025JtQTM/rZS3EUmvIRfEjXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6FEAF80553;
	Mon,  5 Sep 2022 17:39:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF93FF80424; Mon,  5 Sep 2022 17:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA88F800E8
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA88F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XALF/Egd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2A01B811FC;
 Mon,  5 Sep 2022 15:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B75CC433D6;
 Mon,  5 Sep 2022 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662392333;
 bh=DI/JWN7filrxVXubuYQqOnCDfFoWn6A2a5o7fhUfYQ0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XALF/Egd82gPWi2ctRMtz61hOe5ALsWkA6wBZY08oSeTMr6nCXZlkO9bp0dr4vfco
 ztl1TxywHT5fWeqRZ475PjKW2HZl1zOQ9CmweAYV+oYBOMP2CA3j/kQkqD9R6nTWn9
 LFVxcYFWgsr79pjR3y9lO8efllXD3VM7q3O0IbPeZ2XlLZPv4rMFPCmw5b/Ih+KYhr
 6MBP/qLZthv+1+yV4lC2bPOtMl/lCERpO837OwkanAI42WZt7aKiZ0n+3Qs130EPVk
 pN/p30Gi5JYEGf9LLMRwhe9+n6kGXR3KWHnqnweX31oVqU3gAKJ5ULlDsj4uE/tXm8
 9supsjF/nNXKQ==
From: Mark Brown <broonie@kernel.org>
To: Vlad Karpovich <Vlad.Karpovich@cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220825220530.1205141-1-cristian.ciocaltea@collabora.com>
References: <20220825220530.1205141-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2] ASoC: wm_adsp: Handle optional legacy support
Message-Id: <166239233135.736206.3778059125368264923.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

On Fri, 26 Aug 2022 01:05:30 +0300, Cristian Ciocaltea wrote:
> The tracing capabilities for the speaker protection fw enabled via
> commit c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker
> protection FW") are not be available on all platforms, such as the
> Valve's Steam Deck which is based on the Halo Core DSP.
> 
> As a consequence, whenever the firmware is loaded, a rather misleading
> 'Failed to parse legacy: -19' error message is written to the kernel
> ring buffer:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Handle optional legacy support
      commit: 35c8ae25c4fdeabf490e005692795a3be17ca5f6

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
