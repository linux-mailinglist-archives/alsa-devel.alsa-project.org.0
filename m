Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B115A3FD0
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Aug 2022 23:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420391F1;
	Sun, 28 Aug 2022 23:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420391F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661720697;
	bh=4gkTUeiRK5zM3wWcBtMtiz5SQ2W33WXk8U26hETwVcg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G67Kxlm12fDPtt0DL/Vu67A1DdH4H3uMXExYDON/6yv7U/CxnktZyXSmDI05Z3mGg
	 OmIKzVL6Pib0hdY411SZHtNIguHlz0we9LmC2psW3RCYA+qdswEqRAXmEKOAwlgotJ
	 gwhTPMUjslhQeCALKwN/2J0lTr5LLJ0O1jOT5hDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B1A3F80423;
	Sun, 28 Aug 2022 23:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B4E8F8028D; Sun, 28 Aug 2022 23:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01865F800AA
 for <alsa-devel@alsa-project.org>; Sun, 28 Aug 2022 23:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01865F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AIKlJPHR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D8C260E0A;
 Sun, 28 Aug 2022 21:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16342C433C1;
 Sun, 28 Aug 2022 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661720630;
 bh=4gkTUeiRK5zM3wWcBtMtiz5SQ2W33WXk8U26hETwVcg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AIKlJPHRaIIuzzbtvkLLZ3Qdethc2MA27673g5Fzk4h9dDy295WrHOQu2PElKXGS3
 QrUmjhlyCm/xbK3HBgJihDN1cq/guR30jSo5dWRS6QhGqndPRSzCovH18RiAtAcgQA
 Uxsspo8dJHJPqz0vxGtfJVZU68AUM1qLDto7XVQXQPC4rd8fx9GMGoearL52Z1cQBS
 dO7yPiAhE+Pf/1W1d2P0BGLBFPGVYyetm7jiOxKuYxoYSNCT/Oh1l9Aww//Wi7mua5
 L+NOsf0NF8i+uV5nvS3EMPxjohJEcpiFNnJnMa56q2tBWWqgq7sYKMa29ll1E0XxOt
 9gL02Ii349f8Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87czctgg3w.wl-kuninori.morimoto.gx@renesas.com>
References: <87czctgg3w.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
Message-Id: <166172062971.600125.5471609144931735249.b4-ty@kernel.org>
Date: Sun, 28 Aug 2022 22:03:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Mon, 22 Aug 2022 02:35:32 +0000, Kuninori Morimoto wrote:
> commit b7898396f4bbe16 ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
> added __soc_pcm_close() for non-lock version of soc_pcm_close().
> But soc_pcm_close() is not using it. It is no problem, but confusable.
> 
> 	static int __soc_pcm_close(...)
> 	{
> =>		return soc_pcm_clean(rtd, substream, 0);
> 	}
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
      commit: 6bbabd28805f36baf6d0f3eb082db032a638f612

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
