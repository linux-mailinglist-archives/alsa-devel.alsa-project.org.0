Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E13CAD56
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 21:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6499B1690;
	Thu, 15 Jul 2021 21:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6499B1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626378999;
	bh=cqaP2qSL289NbVmzp2jQGNpJC6oOR6ORaU2+jb0bmTg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBwLbMDbESMvPwD26ToILjklDudzXxs2N7MN0G0A2oeRUXqdLNCIW0FYBVuiQr9hx
	 ifavXXEYK1CRlkx9debsuu2xMERnZuSpYdOs36rIDZOzEthrxpX+gkcXCCUXsn0K2h
	 JppVb27+B3ghrhQHXlQ+J+f1QC5xojf/GFj7vY1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1366DF80431;
	Thu, 15 Jul 2021 21:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B9EF80431; Thu, 15 Jul 2021 21:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 921A5F80240
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 21:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 921A5F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mIUjIXhd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF22D613C9;
 Thu, 15 Jul 2021 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626378893;
 bh=cqaP2qSL289NbVmzp2jQGNpJC6oOR6ORaU2+jb0bmTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mIUjIXhdRDbiTxDSNrTBHTDwvicprpO59NDPscKol2GkYZ8YlmnEdD87UF4yZ6zOm
 1w/yCmrxa6JRg3eKT1nMrq+hxQRe8r4B4N/A88uFej2/OL7KhPvtqeYHv3vYaqmFZP
 zZfJHlhQMcXnaiEf+OBvQeYXD4DhmEbtN6WAUV6CNbVzjAmgWadBcSgqtgICIElhyb
 +6/ZWycEtHkBD9pDppr85uuUZiWfM7OAOynXnQxmZaBmcKlfMQvL4DCSPWfTYXFHX1
 eGhG4ciXt4oVoCW5M8QzCqRzfha4n5zPR3tm1MZzIjW4ody1FoqRYU14A4WN/quWSg
 h+UJ1wLQ9zmhQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: clean up for-loop
 indentation in switch statement
Date: Thu, 15 Jul 2021 20:54:02 +0100
Message-Id: <162637837991.27358.2893417037818285699.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709152424.460446-1-colin.king@canonical.com>
References: <20210709152424.460446-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Fri, 9 Jul 2021 16:24:24 +0100, Colin King wrote:
> The for-loop is not indented enough and needs one more level
> of indentation. Add in the indentation across the block of code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: clean up for-loop indentation in switch statement
      commit: 622d9ac3d969d0f62bbe68f4844bb5b8adea5a40

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
