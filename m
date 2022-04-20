Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4250933A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 00:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024681E7E;
	Thu, 21 Apr 2022 00:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024681E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650495424;
	bh=IrDGMfnjqSQWsTuA0WmqnuXGuuh54umLIYAKrQ7VKz4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omA6BKJKnKzCzgx9Qpo3kgU+7Su/51YsWtEwRvwfQCeOKIWkgMvxHlmEwRmtVifWG
	 5gor9Aa3LYP8qbJeMGhob0LgJSLKDAGG+mIvKExWVh5T2MEIxrv/FB5IHadWDFA1mH
	 jKU3Zmjolhi+SdmBAo7pp7vbCaGe6bTRKZqWAIoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F1EF800F8;
	Thu, 21 Apr 2022 00:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B326EF80217; Thu, 21 Apr 2022 00:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B2ECF80116
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 00:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B2ECF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kjzGKgBq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46D96B821CD;
 Wed, 20 Apr 2022 22:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A732C385A9;
 Wed, 20 Apr 2022 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650495327;
 bh=IrDGMfnjqSQWsTuA0WmqnuXGuuh54umLIYAKrQ7VKz4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kjzGKgBqf62Cu378Vd9SIn5bbIpqrHAOT0BmBWrrrTxCSlEij45DAD3hFXf25cUUC
 bAyRtyplpYS1e1xFJJmyxPQbGryU1oylFnUbgyofGAXrqp8exVr/PBov2z6ZnRrCnu
 xKaAOSC8lCjAZA/ylxB0ZzzEXKlL+yrsGqmZwTnYUVxCx50azqw5jj/awFJv6UCUkg
 eFmhNvHuEFwv7fv8HvvelDvPvdH4xsx2sAqkZ2cPoDJoRLirjjOrH+NGn06t7fzubu
 HtBNECIwGVDKKOlqlidZ784aa9DnLzPCz4wrf8DRG3G+DNjSfIhLTHdxgkDWVhZMDr
 /iV1WLz71ci5g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, support.opensource@diasemi.com, broonie@kernel.org
In-Reply-To: <20220417192733.7382-1-broonie@kernel.org>
References: <20220417192733.7382-1-broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: da7219: Fix change notifications for tone
 generator frequency
Message-Id: <165049532676.1351794.3721813083034530090.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 23:55:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 17 Apr 2022 20:27:33 +0100, Mark Brown wrote:
> The tone generator frequency control just returns 0 on successful write,
> not a boolean value indicating if there was a change or not.  Compare
> what was written with the value that was there previously so that
> notifications are generated appropraitely when the value changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Fix change notifications for tone generator frequency
      commit: 08ef48404965cfef99343d6bbbcf75b88c74aa0e

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
