Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8311476071
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595F616FC;
	Wed, 15 Dec 2021 19:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595F616FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639592121;
	bh=5YQrU93bqSYbc6ms1kkePtc6SK3B2uJd8ggOzZ6cDDk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebTCHlCW4dIO6gVrAT44+5Z2SVu1nSRyorLTEJxuQQjprx9pZV09vpe7A7N26MpXl
	 leTBxbGkaCeaQXtpheW71Zk1sbl3SzM6cDM0iGRzV2lBLCs2UXmvYD7fMtb5rRU46E
	 uKBpARURwmpnPyN55iAZ6e9b46H08cEGOuAs2eKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F271FF801F5;
	Wed, 15 Dec 2021 19:14:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71193F8014C; Wed, 15 Dec 2021 19:14:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 104C8F8014C
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 104C8F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f9q7Z1mS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5E9361896;
 Wed, 15 Dec 2021 18:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCC2C36AE2;
 Wed, 15 Dec 2021 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639592046;
 bh=5YQrU93bqSYbc6ms1kkePtc6SK3B2uJd8ggOzZ6cDDk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f9q7Z1mSvAKMVyiDpM9Fd4XDRjxvYd9opcJ7BXM7A7ZuU+Y3IwkM93aZEZIcuBfcf
 ZK+Ir8S+s7S+oXGAjc9iCbbaHuVsR5Y7cUudmPDfAZIb7/34i9EyGDXHXTYcE3NsyV
 L0pVybgwAwDsAiWjVV7gEXXYpd4uosEG+yPza2Ge6qJh2CeZraN41AUHwhv3Tl/moP
 ZUZv4pc6KzzfaeOj0FYqvQv8EGw/eNEzqsNL+Ae7jyQDDTsz+1fsWMR7Q90x1sAJht
 i1wPdqTGSPCUa6LqtPAOpJ1i1Dc4JvlHaz7RetRi7zunCnQwW4GiED02E08Fo8lUr3
 50BSLqIoGp+CQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik@protonmail.com>, lgirdwood@gmail.com
In-Reply-To: <20211206224529.74656-1-povik@protonmail.com>
References: <20211206224529.74656-1-povik@protonmail.com>
Subject: Re: [PATCH] ASoC: tas2770: Fix setting of high sample rates
Message-Id: <163959204483.2212554.13270915403974702166.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 18:14:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, trivial@kernel.org, dmurphy@ti.com
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

On Mon, 06 Dec 2021 22:45:43 +0000, Martin Povišer wrote:
> Although the codec advertises support for 176.4 and 192 ksps, without
> this fix setting those sample rates fails with EINVAL at hw_params time.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: tas2770: Fix setting of high sample rates
      commit: 80d5be1a057e05f01d66e986cfd34d71845e5190

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
