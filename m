Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CC3C53DF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A86016A9;
	Mon, 12 Jul 2021 12:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A86016A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087160;
	bh=NhDjwnBtFvIVOLKp7dYyMFmoiczDz2FmGO2+lgpU39w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0lw9d5DIO2PDx9Y2AeTLZRGqzOdBQQ1skmnq9y6A3BYFhQCGB3/5yQXgdw3XdoPj
	 GHWeH4Pxybn2eEj4vNc4mXqVvlVIsi81MktlQkoFj/kUzBceFyyDw9WzafFMQ8ADY2
	 xDBoLbeuq6jfBuQLSyyn04BGZeUWo5bbLXTRfu0s=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 496DAF8051A;
	Mon, 12 Jul 2021 12:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5940F8051B; Mon, 12 Jul 2021 12:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFE7CF80516
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE7CF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AjnngLOk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A503F61156;
 Mon, 12 Jul 2021 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086883;
 bh=NhDjwnBtFvIVOLKp7dYyMFmoiczDz2FmGO2+lgpU39w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AjnngLOkFsoBp/qQ856a0aDC1UCoUQUX9RBq27LnmLJtJDnUUN5yVtc6wp7Puseli
 L7uEFUu6VsxPxkky7fQP1968jRXTDAvLtGF+QhovcDLfs3+66o62/heyRYWbNdYVSZ
 x7MbaxBSYHLqJCgnzwRVa4PF9x/PsxEEO1A4WBjAhZMossY6N5h/rPcgN81sb1zly7
 KOaLZUM5zR+Y9D+hOXVYlcGIOpocSfZ4bjQOkazgFCTCp9cFtJKRIlvg94VPxwxjKx
 rvx0G2g8/s/9vZrwiXO59sUIA9uVfV19kmnnGBqmQrAgsP+EZSBtUHz4JLoZoqEum5
 +PVruWaAwEX0w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] ASoC: tlv320aic32x4: Fix TAS2505 volume controls
Date: Mon, 12 Jul 2021 11:46:06 +0100
Message-Id: <162608623152.3192.16164490887444781260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708091255.56502-1-marex@denx.de>
References: <20210708091255.56502-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, ch@denx.de
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

On Thu, 8 Jul 2021 11:12:55 +0200, Marek Vasut wrote:
> None of the TAS2505 outputs are stereo, do not pretend they are by
> implementing them using SOC*DOUBLE* macros referencing the same
> register twice, use SOC*SINGLE* instead. Fix volume ranges and mute
> control for the codec according to datasheet.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic32x4: Fix TAS2505 volume controls
      commit: 2169d6a0f0721935410533281fc7e87e4e2322d1

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
