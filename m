Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288A57E978
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 00:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9369018C5;
	Sat, 23 Jul 2022 00:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9369018C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658527614;
	bh=rtUUWzqigEAhevG/HmR8d2v0CTiqo8Ua1liTqMPr4QA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUgp8ahMXpX1ZwJjplESFgfK1gjkOK+ZoVHDYGod5ZyMgcIC1z5uRSLDIdMZQ7CHn
	 CHXfAa76P2RwaOSUdQ7NL257kPztaqsFlsULWGzqe4kkiF0J8RF09VXUCnIheyq8y6
	 koB5LiLNgnMuxg/7PY3aI7Aq3l1+q8VjyNyc5By8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 067C1F802DB;
	Sat, 23 Jul 2022 00:05:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D4EAF80279; Sat, 23 Jul 2022 00:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E4FAF8016D
 for <alsa-devel@alsa-project.org>; Sat, 23 Jul 2022 00:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E4FAF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KgcjxdT4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B8AD8CE2BC1;
 Fri, 22 Jul 2022 22:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0327C341C6;
 Fri, 22 Jul 2022 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658527543;
 bh=rtUUWzqigEAhevG/HmR8d2v0CTiqo8Ua1liTqMPr4QA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=KgcjxdT4cmxGUcvtTEkjQ+8NEp1Wq+CK03O1U6eivdOpTocH85GIsxkWv5XynCZjR
 tqjdzNhEqopQMCP5XmAOxrezTSK1A0suoyfsccfAyup6C/ouNmEh7TPSG55/RAD6UX
 jW6FLq3i/61i81XQ+iXHSFyuteVwscpqVdsSjvpqs9FQX6oC1zn8wDzNhbhoUO9Blf
 Qg1IuXVE77hHFimNSCgKgNF7fIXB8Fkn0PscfW7rPgk1DQnXAC1eNvWxglRN0FWin5
 GtWCcjfTFwAzQWb4Xy1EyQ5NwPahNaKZzUmx/Xi/Ur98XRF3o/Brt+WWjuePcUrScW
 zx8KagOBFbbHw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, ckeepax@opensource.cirrus.com,
 Liang He <windhl@126.com>, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20220722141801.1304854-1-windhl@126.com>
References: <20220722141801.1304854-1-windhl@126.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2: Add of_node_put() in fail path
Message-Id: <165852754151.1234289.3968759856616544921.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 23:05:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Fri, 22 Jul 2022 22:18:01 +0800, Liang He wrote:
> In asoc_simple_parse_dai(), we should call of_node_put() for the
> reference returned by of_graph_get_port_parent() in fail path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2: Add of_node_put() in fail path
      commit: 8ebc4dd8250fd1cb5da2869c0fe6ae3686fe41e9

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
