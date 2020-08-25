Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A82812521F8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 432D316F7;
	Tue, 25 Aug 2020 22:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 432D316F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598387167;
	bh=d/9oJLOkaH9e92ieQGrOTbfeo14AurOWxCY+0FNmeE4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jv0XIdHGHYHoS50xLTm4kafCBPwT0V0zkWizmw/sLatIDtlWVve4sEUmJsBg2vahv
	 QwE+iuuwPZK+ZupXLFH9RvPcEwgeIEua/0KVt8SJRORQWBS3XeHk6pvSJdirJqGFUg
	 L2l4+vfX4m+uy6ecIn4NSoOfhVlTJ8cenvIp4HQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E98F8028A;
	Tue, 25 Aug 2020 22:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B02DDF802BC; Tue, 25 Aug 2020 22:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38468F8025A
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38468F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nJXs4uRi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2430A2075F;
 Tue, 25 Aug 2020 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386793;
 bh=d/9oJLOkaH9e92ieQGrOTbfeo14AurOWxCY+0FNmeE4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nJXs4uRil5rG5lO/EMEQQrQlxjfu8y7Tql7UycZspEJoJYVQTHaWNocajTzP8Un+m
 KTMQwANAto5gIhKbin1GkdSvOf1wEA5lGTAHazNLt7621pGQmHrFOZYKLkpPjCxYbk
 4xbxWXOaZBHkdNbTdcI8POXLbi/J17C87DHNPidY=
Date: Tue, 25 Aug 2020 21:19:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a6yjy5sy.wl-kuninori.morimoto.gx@renesas.com>
References: <87a6yjy5sy.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: pcm3168a: ignore 0 Hz settings
Message-Id: <159838674787.41542.16061255228836878344.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 25 Aug 2020 08:39:24 +0900, Kuninori Morimoto wrote:
> Some sound card try to set 0 Hz as reset, but it is impossible.
> This patch ignores it to avoid error return.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm3168a: ignore 0 Hz settings
      commit: 7ad26d6671db758c959d7e1d100b138a38483612

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
