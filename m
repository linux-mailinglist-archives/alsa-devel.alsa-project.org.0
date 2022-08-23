Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF359EB28
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74894168F;
	Tue, 23 Aug 2022 20:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74894168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661279902;
	bh=8VJaDM+gCcwlXccf9auZntmnqjppj23P/NhrfUgjIcI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1VnI5kXA+989OKwa+rsQDU8Lpw57KCtF6vUtBPvrYt+uM64LcZAHitzbjg7AzQJK
	 pBSIfpFomydzVmXKYP2Ky3LPFPFtU069WvC6jjjs4ObRfBESSAu3B7ZDvEMwYK973m
	 MV7CeWR1/0FmLA+73rZ3/gJn7nGnvv68cZ3uLuFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D34F1F8030F;
	Tue, 23 Aug 2022 20:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88342F8030F; Tue, 23 Aug 2022 20:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10385F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10385F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HSoYlCUY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09710616FE;
 Tue, 23 Aug 2022 18:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27B9C433C1;
 Tue, 23 Aug 2022 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661279832;
 bh=8VJaDM+gCcwlXccf9auZntmnqjppj23P/NhrfUgjIcI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HSoYlCUYNjWakr2mnhVw3X+csasLlKBm0fnE11FZc7IvSvd0pCCWiGq4MgUEjgEKX
 a+EFwTuE6zUbdl31g+deEd2T3EBtAUExH8bJL15kRxwo4BWo0db3JWu2RM9q7iHlw6
 Wt4xqEJhITaXaTzSxMIFvJpV6dc5pbhajFe+QlOxLjrH6EH91mNQWfwxusFuRlMj21
 GUiY8CZePEH3ISNWMvAAu++pkFZHowywPZv9SzKAYZwNBrV2eotObXNJIq5r1IeGXZ
 bUrVxwihIKCtElcOI9qctT90bgb9dYTeuK2Wf25bFcQc7U3cU0blTsD+sDzrzj6l69
 YNYqU43im3Tng==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20220823081000.2965-1-tiwai@suse.de>
References: <20220823081000.2965-1-tiwai@suse.de>
Subject: Re: [PATCH 0/5] ASoC: nau8xxx: Implement hw constraint for rates
Message-Id: <166127983165.711152.16554154070241524592.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:37:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org
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

On Tue, 23 Aug 2022 10:09:55 +0200, Takashi Iwai wrote:
> this is a series of patches to address the issues on nau8xxx codecs
> I've stumbled upon while dealing with a bug report for Steam Deck.
> Most of them are to implement the missing hw constraint for rate
> restrictions while one patch is to fix the semaphore unbalance in
> nau8824 driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: nau8821: Implement hw constraint for rates
      commit: cf5071876baf995f8f98e86ef06f85a58feda63c
[2/5] ASoC: nau8824: Fix semaphore unbalance at error paths
      commit: 5628560e90395d3812800a8e44a01c32ffa429ec
[3/5] ASoC: nau8824: Implement hw constraint for rates
      commit: 92283c86260d8712b55f97eada13b3c8b2f469b2
[4/5] ASoC: nau8825: Implement hw constraint for rates
      commit: bed41de0f679c516de45cfeb2c40c412bc5e0c0b
[5/5] ASoC: nau8540: Implement hw constraint for rates
      commit: be919239fbcab19290bfd6802c7ad1dc946c515b

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
