Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32223B86E3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 18:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57AB11607;
	Wed, 30 Jun 2021 18:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57AB11607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625069564;
	bh=s+MeAplP6DcslUqnLbEa+30xk3Anb9Ij6FUsirBGNj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQwWFv4ElhWE99fcqsubkThA0agbNFao1Qal5nCGaq9N/VqvcrJPTGn2QfcpQmrAb
	 kuo3T/8b60jLeXjaU27un5MltIuW42x2uGo9fWmTPl6U/bjQj4hmuu51oYGVhvdTVo
	 EpNwUyJVTwi9Tbxk50YVgRc46/bAufx+QuOeBp9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9C8FF80240;
	Wed, 30 Jun 2021 18:11:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34212F80240; Wed, 30 Jun 2021 18:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1306BF800BA
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 18:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1306BF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="brTAk3oJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E71E46135C;
 Wed, 30 Jun 2021 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625069467;
 bh=s+MeAplP6DcslUqnLbEa+30xk3Anb9Ij6FUsirBGNj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=brTAk3oJcViMXSPQ8uryORDhm2W8VdGzDtYhQHziQDo3RGJlnBsxriCzsOwkId9VQ
 5vK8vw/ZoOEvqPZmpov5VrockZTNc17QFBXqegXFqAYLt3ouR5kaTULPcD7fIccV29
 GLuMmq2auOk5LaPboCWXcCr1bnC23zfNH7iP4QTBitUNHaToaw5wPwYLz9dhYPFbfj
 k2dI4N/w6nZFNKosRrQik75ZjRwkHUuW/VjVN5FZEYcT+bQDGaPLF9+33dhnuiFtY3
 IVg9scXuJpBeMOoILjrUpaxK6nH8/t7O8hyXh1uTdcBQCA37GtGo7AD2wZNCLwwwuA
 M9tne8fM6DfSA==
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] ASoC: codecs: allow SSM2518 to be selected by the user
Date: Wed, 30 Jun 2021 17:10:32 +0100
Message-Id: <162506854660.43525.7433456849711238038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628210458.2508973-1-l.stach@pengutronix.de>
References: <20210628210458.2508973-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
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

On Mon, 28 Jun 2021 23:04:58 +0200, Lucas Stach wrote:
> Allow the Analog SSM2518 driver to be enabled without a large
> bunch of other drivers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: allow SSM2518 to be selected by the user
      commit: 2c70ff56e49ae219640689a0c86041c0f656046f

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
