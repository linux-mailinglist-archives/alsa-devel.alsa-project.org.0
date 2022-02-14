Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3B4B53D8
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 15:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B841744;
	Mon, 14 Feb 2022 15:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B841744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644850631;
	bh=ClzPXiHGSV1D78vo35GeeCpuxD0sHuhefm+2UeDa9fk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j1L5O4DtG0BAX/Msu6xdG7hd4uWUrPy3w1w4EVnP0KTq+fBLZN3Ep3jgDrvifAQHt
	 WmiA2FY+yDM70INLuP04xoU2F0llPARQ/ILsfjSudgkUk25lLCd6D4yquNaozrE0ol
	 E80SUnoXRIfqoN5TWPGPjEiXWFnGUlK1vAfRQ+RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F72BF80430;
	Mon, 14 Feb 2022 15:56:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3D18F80310; Mon, 14 Feb 2022 15:56:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87EB9F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 15:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87EB9F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="goysGbYO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67914B810D5;
 Mon, 14 Feb 2022 14:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48C8C340E9;
 Mon, 14 Feb 2022 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644850558;
 bh=ClzPXiHGSV1D78vo35GeeCpuxD0sHuhefm+2UeDa9fk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=goysGbYO/E6BNSGxe3aWMtmFrEx9FaRj053wc7JSgtgi55QmQGG6ioP4E58NK2A7V
 lZS9b/Jrjl6g+VSzzoGGAB9haXAh21AY5oEb0miEynxOwsupy5juGJbcrx3XZlp+5S
 JugTZDouzwjRs/Mv/zRAPLQ9uNV/t5ZRyZlyoU4L2sruQ74sSwQ89VlLS5CwTVXvKA
 cuoAe/fI+3DkOaC2LyWC2UxGyKrmu52ii1AXwL1xbuEjbAqZ7G9ohKS8S05kX13rWQ
 VaaGKsizr5evLX29H6X9PiA28jHP6FI2Y1gmirz2OzU/8b3LnBkIKJmioL4h5xz5Kg
 fPzYiYPyT1fjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
References: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 0/4] ASoC: pcm3168a: code cleanup
Message-Id: <164485055645.397940.4337733738992515921.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 14:55:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 8 Feb 2022 11:42:16 +0300, Nikita Yushchenko wrote:
> These patches clean up pcm3168a driver, without introducing any
> functional change.
> 
> Nikita Yushchenko (4):
>   ASoC: pcm3168a: cleanup unintuitive mask usage
>   ASoC: pcm3168a: refactor hw_params routine
>   ASoC: pcm3168a: refactor format handling
>   ASoC: pcm3168a: remove numeric PCM3168A_NUM_SUPPLIES
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: pcm3168a: cleanup unintuitive mask usage
      commit: 0c483a07e92638aca1f7d42a4986e32c58d29ad2
[2/4] ASoC: pcm3168a: refactor hw_params routine
      commit: c7270209fc6fc377ba5813e8d5b2ce2b26352ee7
[3/4] ASoC: pcm3168a: refactor format handling
      commit: 6bfc1242ee995f23f8c167bf1308a43b86560fce
[4/4] ASoC: pcm3168a: remove numeric PCM3168A_NUM_SUPPLIES
      commit: 3e63d3c1a2e52fb60d66bb23cb62c92c92ad0a3f

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
