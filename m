Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A849B13C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23A127F4;
	Tue, 25 Jan 2022 11:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23A127F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106218;
	bh=9oanPmGbEa5RXVfsZnBLjEA4BeGdcq9Tr6zFHoUW3cI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCihOVotB12+nEpkCkKkrK8aAmF/qgr95Pk8ObQ5NBth8KXMTwAFRuKrSVM2tSqwB
	 XkA+PibKbevEzejaFePEpDrM6UzfIssWMBIrE7/q+CSGuaB6156i3C7iLs/t5lSK8Z
	 fjiLqrxO2ZI7fnu0Xt+9ncvGSp+9PSOqyIr7m6/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A82F1F80534;
	Tue, 25 Jan 2022 11:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0F61F8051C; Tue, 25 Jan 2022 11:20:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10998F8051C
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10998F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n1hLkgqO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 366A6B81757;
 Tue, 25 Jan 2022 10:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A85C340E0;
 Tue, 25 Jan 2022 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106031;
 bh=9oanPmGbEa5RXVfsZnBLjEA4BeGdcq9Tr6zFHoUW3cI=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=n1hLkgqOUOQ1uj4tQZHu6lnsHZJ1l41hlJWZGXAYw3xWCn3/fWOQ0+roowbnTmr24
 +dHu9sLzOzPVxPvHUVrZqZbPXBFlRYVt18vZy1ee2QH5zXnoqx9/fTJ1u5wy4i8Vw/
 Ml6Zf7lDmNI4loAFcsyoTy9wJk0ZqYUpyWqhpUlnT+pPpf8BMKGl4czzgp+bcPSKsP
 /m1DvZP2VaLb8rtpDWkzKA7UXSZocd8WvDh1Y74MCTD0WrSWHQtIhA5adMIkhb4El8
 eEbNOOXwWfJgITgfWh5xSC0CKaYPX3JvysTwOhiIRQhQwsD/YS6yu6VDV5Ffnt6Qfq
 Wjc6E3KtnLm2g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, lars@metafoo.de,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1642646642-15908-1-git-send-email-shengjiu.wang@nxp.com>
References: <1642646642-15908-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine-pcm: separate max_buffer_size
 assignment
Message-Id: <164310603029.74844.18163154288522285277.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 20 Jan 2022 10:44:02 +0800, Shengjiu Wang wrote:
> The config->pcm_hardware may be NULL when config->prealloc_buffer_size
> is not zero, so it is better to move max_buffer_size assignment under
> a separate condition.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-generic-dmaengine-pcm: separate max_buffer_size assignment
      commit: 88c62b16281e5fe748f22f44da3def8a91fb1c34

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
